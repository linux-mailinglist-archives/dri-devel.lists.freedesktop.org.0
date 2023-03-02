Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4566A8D13
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 00:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D5410E307;
	Thu,  2 Mar 2023 23:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11A810E307
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 23:33:18 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-172afa7bee2so1189770fac.6
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Mar 2023 15:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677799998;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oWQrOjmlTF/eT/5hix+xLxcrGdhqmVIvOhIR8FuYfOE=;
 b=lN4O5IHRLWyhbSMEcD8F0G8wFR8QiH6oGXMFIJfZTiCWkg7XROh8F8SsG/qP0wNKCe
 d4SHivhy9etlsWR1U8y5/kMeCRe8w5lHrcTALEy7lbd6LtUv2lYr32C/yjBI4Gf+xlRb
 enRjQMho94lsdGs00WCpvhX4YXlG/IKd+cnt/3dPJJzUOPV6ot6s1+Tu7m52rbzbSFOM
 IHkdVS8emNIuPxontdSocYsaudiDw1/JD6xcBFcyOir5AKQ3D0A2Hoo+ANqSynw/aWPv
 hgy4aQjOmZcJf6UXNp1wRnvRFN0iy1L1vtJ45ZNmf+AUo6Z2CGemofvuhFDkPKIHs2k+
 V6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677799998;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oWQrOjmlTF/eT/5hix+xLxcrGdhqmVIvOhIR8FuYfOE=;
 b=IbHF1u84s5oqHKBPBppexgyo/9wB/akH50S7G6j06vNKW83blDbTRHAjXxWUx9qolK
 YP5Mq8ZFX7iSpfvl8oy5NmjiDLl8uqCj2znpp1RKT1vpc0t5ve3Du7wENZUPK0Jj1LpJ
 n080F8RVnsJT7Jg0caNyqaZ6YP6SzUKFVjsqHvNjRuKatzalT2t2medf47I1OnqlF/ek
 2uxmN2LEX6bxVY8zrpJWXXQbZnqhUE8HYR5Kfd+dPgwggH59AsutcRspxtrZVIGGxBbi
 sB7LXliZ0gffSFxVN9oy8Aqn7CJw6LifUkReoTjiUK6CtMdbkqKZOq2DnDP2r+87HXxQ
 dlwg==
X-Gm-Message-State: AO0yUKWwCs+03/5zIgek80Dxo+j0gLSUFGSlK5AI9zzirslDOvQgHql9
 RxSvPsFXkBo5foJw6ik5qTFOs3DJvQva543+6BM=
X-Google-Smtp-Source: AK7set8T8UHOZvlKDyCHvWaZjZeVjVEqLrtjJRHYusFiiklAQLDMFXAgieBae3bnu4+f7KLJ3bIMqyww1KsFqKWgDSk=
X-Received: by 2002:a05:6871:6ba1:b0:176:6af1:1122 with SMTP id
 zh33-20020a0568716ba100b001766af11122mr31222oab.3.1677799998081; Thu, 02 Mar
 2023 15:33:18 -0800 (PST)
MIME-Version: 1.0
References: <20230301185432.3010939-1-robdclark@gmail.com>
 <6eb2cde8-f548-73ba-6091-131c1848690c@collabora.com>
 <20230302072531.375i6xetk72nis75@sirius.home.kraxel.org>
In-Reply-To: <20230302072531.375i6xetk72nis75@sirius.home.kraxel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 2 Mar 2023 15:33:07 -0800
Message-ID: <CAF6AEGtzdty5m9ccRZqYNN=+OCa0KogNQxR41AD-LWC5fjbujw@mail.gmail.com>
Subject: Re: [PATCH v5] drm/virtio: Add option to disable KMS support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 1, 2023 at 11:25 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, Mar 02, 2023 at 12:39:33AM +0300, Dmitry Osipenko wrote:
> > On 3/1/23 21:54, Rob Clark wrote:
> > >  /* virtgpu_display.c */
> > > +#if defined(CONFIG_DRM_VIRTIO_GPU_KMS)
> > >  int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
> > >  void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
> > > +#else
> > > +static inline int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
> > > +{
> > > +   return 0;
> > > +}
> > > +static inline void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev)
> > > +{
> > > +}
> > > +#endif
> >
> > In v4 Gerd wanted to keep building the virtgpu_display.o and instead add
> > the KSM config check to virtio_gpu_modeset_init/fini().
>
> The main point is that the code workflow should be the same in both
> cases.  The patch does that for virtio_gpu_modeset_init() but doesn't
> for virtio_gpu_modeset_fini().
>
> Return early in the functions (and drop the #ifdef here) is how I would
> implement this, but I wouldn't insist on that, there are other ways to
> solve this too ;)

Ahh, true, I guess omitting that one file doesn't save anything and
early return makes for a bit simpler/smaller patch

BR,
-R
