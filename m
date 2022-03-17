Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ACE4DCC90
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 18:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086D710E6F3;
	Thu, 17 Mar 2022 17:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B68C10E6F3;
 Thu, 17 Mar 2022 17:34:44 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id r64so3525199wmr.4;
 Thu, 17 Mar 2022 10:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IELfzsVU/wZ7ht4rR86rM2gpBonGJDThNUGcKLGVsXM=;
 b=mS/mF26z2g6jRvaXO3oivJOR6aL0QS0imKt7OV668jL7lKlXy2pyb3R3n1Yd+tpN3M
 xJt00Lsh8EKat+SNZK5Z+bn7G+NKO3oFxtTPEFf3Uw+6EfDe1X+u9ArEH/6VN6icLWY3
 7fKqbiNSDNZVPJvo41IRx33V70LSzHAhiIIChZqTseukFZb/vEu3iYb6gv9HWkr6Aa41
 UXx88aOhL8Yis1PUCDFNTONVKZFRKl8JMEmKFX9YY9Vl264JMS1C6I4zYfqX0cSBHoLg
 ogeF5zeWlzHmpPY3NmQ68t2j+S+Nqei/fPw3e1/oG6gvKbjrJlJae/It6pWYl0RKNsji
 A1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IELfzsVU/wZ7ht4rR86rM2gpBonGJDThNUGcKLGVsXM=;
 b=VCTdTARnq0ku2vi14pi9ypnQR213Id9GJ8tluCAut5eio7vEZ8Mc+r3dS8TZjXMJI8
 nPzQn/RFi7EpUh8r6Xux27DmTysvpzc7JEe2/c3EXhAfe3jxHOcNV7wS8PFNB6GnOc0s
 8o9pk+oLDJcc8WaAbN5CorC6sB2PycAOzbi7f5sN162Ej9OraAxqgt4na6bLj70/CrTY
 n2QdHGftxNvf3BMg6Rx7uYDnI0/cAE1M82kgr7KgFVILqcMyy8m4mEUEBBgNCiSKbPJa
 RPFANOz0yhWjuFCjzbbxtUcCFdzFlWITdmdiOJ7PDIRgZv5ZfaX9oBA4Fite0rz4CLS6
 VZug==
X-Gm-Message-State: AOAM532Tf8Uq992JCIDCgkITYEbvKfBb9Aij9Qb4QrNhBsLzM1GeIYEa
 SyVP/576lGh9rJwYRpk8D5ApcIDVKJIu+4DbhAHcM4cQ
X-Google-Smtp-Source: ABdhPJzTfpFd8M5Xt44uoKu43Gt3h63iam3/mvcGzOYZWKbsOVzgolMeZrOa6ovX+WlSUY5RUDd0mD691DuXN+RfuvQ=
X-Received: by 2002:a7b:cc0d:0:b0:381:220e:a3a0 with SMTP id
 f13-20020a7bcc0d000000b00381220ea3a0mr5003576wmh.59.1647538482957; Thu, 17
 Mar 2022 10:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
 <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
 <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
 <CAF6AEGuoBeYoMTR6-KM9xGZ05XSSnSJWMDciawczi7qtiLN9Vw@mail.gmail.com>
 <915537e2-ac5b-ab0e-3697-2b16a9ec8f91@amd.com>
In-Reply-To: <915537e2-ac5b-ab0e-3697-2b16a9ec8f91@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 17 Mar 2022 10:35:24 -0700
Message-ID: <CAF6AEGsyFAOPmHqT7YX1wsukP4-gYAstCukr89r9w28V0YSCUw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 9:45 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 17.03.22 um 17:18 schrieb Rob Clark:
> > On Thu, Mar 17, 2022 at 9:04 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 17.03.22 um 16:10 schrieb Rob Clark:
> >>> [SNIP]
> >>> userspace frozen !=3D kthread frozen .. that is what this patch is
> >>> trying to address, so we aren't racing between shutting down the hw
> >>> and the scheduler shoveling more jobs at us.
> >> Well exactly that's the problem. The scheduler is supposed to shovelin=
g
> >> more jobs at us until it is empty.
> >>
> >> Thinking more about it we will then keep some dma_fence instance
> >> unsignaled and that is and extremely bad idea since it can lead to
> >> deadlocks during suspend.
> > Hmm, perhaps that is true if you need to migrate things out of vram?
> > It is at least not a problem when vram is not involved.
>
> No, it's much wider than that.
>
> See what can happen is that the memory management shrinkers want to wait
> for a dma_fence during suspend.

we don't wait on fences in shrinker, only purging or evicting things
that are already ready.  Actually, waiting on fences in shrinker path
sounds like a pretty bad idea.

> And if you stop the scheduler they will just wait forever.
>
> What you need to do instead is to drain the scheduler, e.g. call
> drm_sched_entity_flush() with a proper timeout for each entity you have
> created.

yeah, it would work to drain the scheduler.. I guess that might be the
more portable approach as far as generic solution for suspend.

BR,
-R

> Regards,
> Christian.
>
> >
> >> So this patch here is an absolute clear NAK from my side. If amdgpu is
> >> doing something similar that is a severe bug and needs to be addressed
> >> somehow.
> > I think amdgpu's use of kthread_park is not related to suspend, but
> > didn't look too closely.
> >
> > And perhaps the solution for this problem is more complex in the case
> > of amdgpu, I'm not super familiar with the constraints there.  But I
> > think it is a fine solution for integrated GPUs.
> >
> > BR,
> > -R
> >
> >> Regards,
> >> Christian.
> >>
> >>> BR,
> >>> -R
> >>>
>
