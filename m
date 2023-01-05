Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBBD65EFC3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 16:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7D010E749;
	Thu,  5 Jan 2023 15:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEA510E02A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 15:16:19 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id i188so38357463vsi.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 07:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JsXcbqbQCVZw0knjHmQUbVwHawGA8MYyCMlsMe6dpoA=;
 b=lw/+RUM+I9eMXfN0pVWHw67PEc563iKBf1JDdOQ2xM+l9D3YMY9i+e151cnEX0I/Z5
 /n6BVWiuLdUMCShjW5dUU8IEFS/g5JKWC4Yf+ax0RamPU7UBakvZktRam3qiIJ0GcXDF
 HosCVVEttawdc4vD7pRPw99yHlcKc8/BCkdX7ICrA4iazvREA/4s9wF21oRGqg3dkRf0
 hwQ7M3RVgR5jdU0+rDB3zG8ebyjuavKjjUV4sdRekbD/m+j6c0FOLDpkE8TGRtTRkSkL
 3WELVykgOKqPKWvbnoIiZisD0ztK5PDVcDlID7WzvUSflKF6Hm+vZ3r68fH6EK2CQYp3
 l80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JsXcbqbQCVZw0knjHmQUbVwHawGA8MYyCMlsMe6dpoA=;
 b=CvEzqAfMIRMuER07UexHG4p2IZcKotJtFXL8qDo4A8bufq95D2eCqsyGeM7C/br2S2
 fbmUBQD23ePNAi6kg1k85WiHkLpsmjPgih1cvTvCcoCDVXROY+gubbNo38wmFgl8bK0q
 kcjXWSA9o4BEUxjECmC10Y3UZE3hPBKx5mIHGeJaXh6KYh/nAzbZXuBhm8+7LLE0u0j3
 8A1piELLcASLZ1SR/HNLijSL+JPCzdtQffFdrFoz9XYYI19ElFAkNef4nzM8MqWtpH6P
 VzmHariw3LnsyJ+UpOkP8KLwHkmnI6Exoq2FVOB7NZnXjK357yVbS1FfMREOL1trjEEq
 s2AA==
X-Gm-Message-State: AFqh2kqWS0li5jB+HBRMq4OR7w88f+Q/wS7fSopQHX223q7wrB1D/orR
 sdF18oIAy8YeTLvq/lly/BS0CSlMD1fLSLyJ/3WF9UVAsj1LlD9q
X-Google-Smtp-Source: AMrXdXsITI1Lo75HlLTqPZ44jnmWOMTR2C6ngunFaTKzllV4wxMnxlK6SBZS4QZ2Xmd2IkwPJsQYIm7F4xtI8IhtMcM=
X-Received: by 2002:a05:6102:1525:b0:3ce:ac55:6ece with SMTP id
 f37-20020a056102152500b003ceac556ecemr919754vsv.60.1672931778785; Thu, 05 Jan
 2023 07:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20230105052325.514970-1-yixie@google.com>
 <Y7a2Viw/1RUNCGkD@phenom.ffwll.local>
 <CAHf1YQ4AZoOd=Q7KVqb1gQm3=TtiS_8-uxFY93syov1AgUT=CQ@mail.gmail.com>
 <Y7bVNT0sf5cwEHuj@phenom.ffwll.local>
 <CAHf1YQ55f2mN14ytCz=AB=VSvO8ByKoV59dF50gWVcjcgMkTHg@mail.gmail.com>
 <Y7bbxVzhYCGhCvVN@phenom.ffwll.local>
In-Reply-To: <Y7bbxVzhYCGhCvVN@phenom.ffwll.local>
From: Yi Xie <yixie@google.com>
Date: Fri, 6 Jan 2023 00:16:07 +0900
Message-ID: <CAHf1YQ4jHeCGqoERpYM6yX8-9pjqiemUN3fT3fpweDTZz6Mrbg@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: Add a DRM render node to vkms
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: melissa.srw@gmail.com, hamohammed.sa@gmail.com,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 lepton@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 5, 2023 at 11:16 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jan 05, 2023 at 11:10:23PM +0900, Yi Xie wrote:
> > On Thu, Jan 5, 2023 at 10:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Thu, Jan 05, 2023 at 09:52:26PM +0900, Yi Xie wrote:
> > > > > This doesn't sound like a good idea to me. Devices without render
> > > > > capabilities should not fake it.
> > > > >
> > > > > User-space (e.g. wlroots) relies on "no render node" to enable
> > > > > software rendering (Pixman instead of GL).
> > > >
> > > > We have virtgpu driver that exports a render node even when virgl is
> > > > not supported.
> > > > Mesa has special code path to enable software rendering on it:
> > > > https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/egl/drivers/dri2/platform_device.c#L296
> > > > We can do the same for vkms to force software rendering.
> > >
> > > Yeah that is the old kmsro mesa issue, for every combination of kms and
> > > gem device you need one to make this work.
> > >
> > > > On Thu, Jan 5, 2023 at 8:36 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > On Thu, Jan 05, 2023 at 02:23:25PM +0900, Yi Xie wrote:
> > > > > > Some libraries including Mesa and virglrenderer require a render node to
> > > > > > fully function. By adding a render node to vkms those libraries will
> > > > > > work properly, supporting use cases like running crosvm with virgl GPU
> > > > > > support via llvmpipe on a headless virtual machine.
> > > > >
> > > > > This is what vgem exists for. More or less at least ... I'm honestly not
> > > > > really understanding what you're trying to fix here, it sounds a bit like
> > > > > userspace being stupid.
> > > > > -Daniel
> > > > The problem with vgem is that it crashes llvmpipe while working with vkms.
> > > > Looks like it's due to the same reason as described in this thread in Mesa:
> > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830
> > >
> > > I'm not finding any bug description in there and how/why something
> > > crashes?
> >
> > The discussion is in the comment section under the first comment by
> > Emil Velikov.
> > It's folded by default (inside "6 replies" at the bottom).
> >
> > >
> > > > Importing buffers allocated by vgem to vkms seems to be unexpected and
> > > > causes the crash. If we create a render node on vkms then llvmpipe will use
> > > > vkms to allocate buffers and it no longer crashes.
> > >
> > > Uh importing vgem into virtio might not work because those sometimes need
> > > special buffers iirc. But importing vgem into vkms really should work,
> > > there's no technical reason it cannot. If it doesn't, then the right fix
> > > would be to fix that, not paper around it.
> >
> > The crash stack trace looks like this:
> > https://gist.github.com/imxieyi/03053ae79cee2e614850fd41829e1da2
> >
> > Even if we fix the crash issue with vgem, we still need to workaround
> > quite a few
> > places that has explicitly blocked vgem. A notable example is virglrenderer:
> > https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/master/src/vrend_winsys_gbm.c#L121
> >
> > Actually I have tried to force running virglrenderer on vgem and it
> > didn't work. I
> > didn't look into why it wasn't working but I guess that's the reason
> > for blocking
> > vgem in the first place. Virglrenderer works well on vkms with render node
> > enabled though.
>
> Ah ok. For next time around, copy a link to the comment you want, e.g.
>
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830#note_582477
>
> The 3 dots menu on each comments has an option to copy that link tag. That
> also highlights the right comment.

Thanks for the tips! Actually you need to sign in to reveal that 3 dots menu.

>
> On this issue, I'm concurring with Emil:
>
> "- the import is broken
> "IMHO that should be fixed, regardless of the rest"
>
> The same should be done here. Unless it's a very special device, we should
> be able to import vgem buffers.

How about the fact that vgem is blocked explicitly in virglrenderer?
We will have
to remove it from block list and that may break something that
resulted in blocking
in this commit:
https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/2cb686dd46df27e9600f9df734303ec57bb38772
I can't find the reason why it's blocking vgem though. It shouldn't be
related to
incompatibility with vkms/virtgpu.

Are there any concerns that enabling render node on vkms may cause problems?
What if we add a driver option to add render node on demand?

> -Daniel
>
> >
> > > -Daniel
> > >
> > > >
> > > > > >
> > > > > > Signed-off-by: Yi Xie <yixie@google.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > index 293dbca50c31..8eea5d4dece8 100644
> > > > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > @@ -113,7 +113,7 @@ static void vkms_config_debugfs_init(struct drm_minor *minor)
> > > > > >  }
> > > > > >
> > > > > >  static const struct drm_driver vkms_driver = {
> > > > > > -     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> > > > > > +     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM | DRIVER_RENDER,
> > > > > >       .release                = vkms_release,
> > > > > >       .fops                   = &vkms_driver_fops,
> > > > > >       DRM_GEM_SHMEM_DRIVER_OPS,
> > > > > > --
> > > > > > 2.39.0.314.g84b9a713c41-goog
> > > > > >
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
