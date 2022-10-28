Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8103961071E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 03:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C1710E04E;
	Fri, 28 Oct 2022 01:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9C310E04E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 01:11:46 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id n83so4648827oif.11
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 18:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5EA/rRsqesB5knK6U60b9qGTqZ/vIiOct5OFzn794j8=;
 b=qjm6RD/RmBJahmvvVeY6o5kMWk/aRac6DF01OEVkSagU9ZipwnIjs8nfU7VZkcm2VY
 8+830Hy6A+I4LhTVia6tejtfM50lm/SIRDBJBSS2d09WfaoXuQQwptw2839hi1Oj5C0Y
 wmlkeuT+o9nWmposOEhB7ronNJt0pnA3b/Qfo6WNR4xb9lqUwYGfD7TxKvWiP1QFZxSz
 W88DQ14iQwoTNwiOuaTSYE7XwQNdiogY0ySbppLTd2CNAssVlJQF7/2LXD0S69e/JHUw
 zVAVjEgPAAjiVLOOheAzz0hW4SQ+yQYAHFAfiYJ7tTh+QMLxSQ3Xf3+KfFKtpa17GxiT
 A8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5EA/rRsqesB5knK6U60b9qGTqZ/vIiOct5OFzn794j8=;
 b=W2EDuqPEMufLpevIPkzYJNYKiPOuQR1TnMTggmoKX97tiiFDeWByG6SafWnkimf9GS
 VJt94jke/QK1zMn76wQF3HdTmvaqgJi3mpUztnXCQQB1ESxr9u1LbzKK8U2in3SyPfIH
 AgJfPBMfQebjNciwgbIWSTs9FKm5C381nHMoeCEFDwROd/Mp7uQj9xPSwfV4LJ/bTNR9
 mWeHue4WeWy31Qd5a9gGl8PZQJmrQHT/qcyxLniTvDUK0QFYomdEsoBFoIQ1L3ZZTaNZ
 XmkaiLm7ybVhSmOoQznHBqQYalc8XPpsi/xIK0YMpXgsAiLce1lWVTXjbVP8TOXfzhtF
 AFfA==
X-Gm-Message-State: ACrzQf2PMriMR8pyQabQU/+2IlA1L47MT1PkvOrKnW8eiP9634r4OUPY
 lYYDiWnu2s+DQsE+IGgMRVL+RE+FBmnAobJC8DE=
X-Google-Smtp-Source: AMsMyM69+M9JkB7n7pEjm9pG4X2UrOlWxyLLPQP8olANKeo9vGbNd7nNGot4Jggqx2IeD4VJZouh8j2E5wD/aymEsNA=
X-Received: by 2002:a05:6808:8f4:b0:354:946e:8dc5 with SMTP id
 d20-20020a05680808f400b00354946e8dc5mr6340635oic.183.1666919505708; Thu, 27
 Oct 2022 18:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <20221020121316.3946-3-christian.koenig@amd.com>
 <CAF6AEGsw=J6Y5jd0A5_hVg1A5BF87hz00Ggmbi8OtTjPJKMDGA@mail.gmail.com>
 <fd168175-71ce-2a9e-f8f1-1cc66e052235@amd.com>
In-Reply-To: <fd168175-71ce-2a9e-f8f1-1cc66e052235@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 27 Oct 2022 18:11:56 -0700
Message-ID: <CAF6AEGuCZpKQMH6mra97tZNOFq8kryoCoi-8V21zmmCyGyZDZQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/prime: set the dma_coherent flag for export
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca,
 linaro-mm-sig@lists.linaro.org, ppaalanen@gmail.com,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 7:57 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 20.10.22 um 16:43 schrieb Rob Clark:
> > On Thu, Oct 20, 2022 at 5:13 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> When a device driver is snooping the CPU cache during access we assume
> >> that all importers need to be able to snoop the CPU cache as well.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> ---
> >>   drivers/gpu/drm/drm_prime.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> >> index 20e109a802ae..d5c70b6fe8a4 100644
> >> --- a/drivers/gpu/drm/drm_prime.c
> >> +++ b/drivers/gpu/drm/drm_prime.c
> >> @@ -28,6 +28,7 @@
> >>
> >>   #include <linux/export.h>
> >>   #include <linux/dma-buf.h>
> >> +#include <linux/dma-map-ops.h>
> >>   #include <linux/rbtree.h>
> >>   #include <linux/module.h>
> >>
> >> @@ -889,6 +890,7 @@ struct dma_buf *drm_gem_prime_export(struct drm_ge=
m_object *obj,
> >>                  .size =3D obj->size,
> >>                  .flags =3D flags,
> >>                  .priv =3D obj,
> >> +               .coherent =3D dev_is_dma_coherent(dev->dev),
> > To set the coherent flag correctly, I think I'd need a way to override
> > on a per buffer basis, since coherency is a property of the gpu
> > pgtables (which in the msm case is an immutable property of the gem
> > object).  We also have some awkwardness that drm->dev isn't actually
> > the GPU, thanks to the kernels device model seeing a collection of
> > other small devices shoehorned into a single drm device to fit
> > userspace's view of the world.  So relying on drm->dev isn't really
> > going to give sensible results.
>
> Yeah, I've the same problem for amdgpu where some buffers are snooped
> while others aren't.
>
> But this should be unproblematic since the flag can always be cleared by
> the driver later on (it just can't be set).
>
> Additional to that I've just noted that armada, i915, omap and tegra use
> their own DMA-buf export function. MSM could do the same as well if the
> device itself is marked as not coherent while some buffers are mapped
> cache coherent.

yeah, I guess that would work.. it would be a bit unfortunate to need
to use our own export function, but I guess it is a small price to pay
and I like the overall idea, so a-b for the series

For the VMM case, it would be nice to expose this to userspace, but
I've sent a patch to do this in an msm specific way, and I guess at
least solving that problem for one driver and better than the current
state of "iff driver =3D=3D "i915" { it's mmap'd cached } else { it's
writecombine }" in crosvm

Admittedly the VMM case is a rather special case compared to your
average userspace dealing with dmabuf's, but it would be nice to get
out of the current situation where it is having to make assumptions
which are quite possibly wrong, so giving the VMM some information
even if it is "the cachability isn't static, you should bail now if
your arch can't cope" would be an improvement.  (For background, this
case is also a bit specific for android/gralloc.. for driver allocated
buffers in a VM, with the native usermode driver (UMD) in guest, you
still have some control within the UMD)

BR,
-R


> Regards,
> Christian.
>
> > I guess msm could just bury our heads in the sand and continue to do
> > things the way we have been (buffers that are mapped cached-coherent
> > are only self-shared) but would be nice to catch if userspace tried to
> > import one into (for ex) v4l2..
> >
> > BR,
> > -R
> >
> >>                  .resv =3D obj->resv,
> >>          };
> >>
> >> --
> >> 2.25.1
> >>
>
