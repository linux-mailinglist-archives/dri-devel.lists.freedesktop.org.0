Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEEE65EE6D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 15:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A7C10E739;
	Thu,  5 Jan 2023 14:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B6510E738
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 14:10:37 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id m2so38126699vsv.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 06:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OoHN6ySxYO4Kc0OH2PTTJjJsigrGnLpjiR92br9lo2Y=;
 b=i8OLaBMTetFETQyoP1x8vEAjC/+92l9lpM7E2CQimENu9e2xVd9Kq/SAG9cJ/Nz7/U
 q4kTFBGKqC5Xyv0vSXu+CVwyiFrgqn3RvbCIw4mTFQt9aSzHXZ712z6l7soeoRtjL8T0
 3+JYkelC8UlU5DKMOnCkJfiZ3DNbwiGrFR7fhhi1w070RyfxbkGr25gkkiwTq/uhmlIH
 tZuwz2s1Z3vD8p2iZHQplPLBuecktX+8chjN7AeCRruvNtTLRjR6qZc98PScvi4pP9LC
 J5iUgneayHa608n7UpoEEqUPE9Yl+dhQX2ONHP/68W6zJSEWTGvEfAuUS99Tsn/BD1ze
 5ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OoHN6ySxYO4Kc0OH2PTTJjJsigrGnLpjiR92br9lo2Y=;
 b=QiIKuowUqL1Xx734iqjb/H9ckYz2jWfAnsoTll/Vg+jT3syH9cfPPTzxvsaQTZJDXt
 BOUmfr9yvyX29hN2bTemfDD8VOcj/BHDt9xTL61ahepLqArtxMrRrD67p1Qxm6Kqsb6f
 oPLZfspsL4G7zOqjCq6PVU4JAneVdF9+s2tEMaa9xooVUcOw8N/a72XyzO/myjJd4EM8
 20W2Vz/rlAUD4U+YKanJbl39kw9AyWf5Gbst4GtqLAzN1LO03A2HWqvAVO1SVzzmUKam
 hjLKfIBpcT7wcNNkEQBM4J2ZeQJZpkEfXYBphkVhlGaJWBkb3sZ/hVh4I2L3GDeziN7v
 QVrw==
X-Gm-Message-State: AFqh2krboJfZll6I/JL5pyhttD/70bsjvPwB1Kn/nvXQsexu2QpEaaCD
 gb+BZPw9mMq07Sr2bmiVqaVhh2rscqKzBRHS8UD09A==
X-Google-Smtp-Source: AMrXdXtBWeSCBBVb4XiX1AHyeVf8aJlLE6/7zF3F5us2u3ABxMP1gkT8tPzFVkRbc/SmX9X/1pVanJrNzxKjrz3Miiw=
X-Received: by 2002:a05:6102:45b:b0:3cb:ebf:ba6e with SMTP id
 e27-20020a056102045b00b003cb0ebfba6emr3307930vsq.54.1672927836817; Thu, 05
 Jan 2023 06:10:36 -0800 (PST)
MIME-Version: 1.0
References: <20230105052325.514970-1-yixie@google.com>
 <Y7a2Viw/1RUNCGkD@phenom.ffwll.local>
 <CAHf1YQ4AZoOd=Q7KVqb1gQm3=TtiS_8-uxFY93syov1AgUT=CQ@mail.gmail.com>
 <Y7bVNT0sf5cwEHuj@phenom.ffwll.local>
In-Reply-To: <Y7bVNT0sf5cwEHuj@phenom.ffwll.local>
From: Yi Xie <yixie@google.com>
Date: Thu, 5 Jan 2023 23:10:23 +0900
Message-ID: <CAHf1YQ55f2mN14ytCz=AB=VSvO8ByKoV59dF50gWVcjcgMkTHg@mail.gmail.com>
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

On Thu, Jan 5, 2023 at 10:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jan 05, 2023 at 09:52:26PM +0900, Yi Xie wrote:
> > > This doesn't sound like a good idea to me. Devices without render
> > > capabilities should not fake it.
> > >
> > > User-space (e.g. wlroots) relies on "no render node" to enable
> > > software rendering (Pixman instead of GL).
> >
> > We have virtgpu driver that exports a render node even when virgl is
> > not supported.
> > Mesa has special code path to enable software rendering on it:
> > https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/egl/drivers/dri2/platform_device.c#L296
> > We can do the same for vkms to force software rendering.
>
> Yeah that is the old kmsro mesa issue, for every combination of kms and
> gem device you need one to make this work.
>
> > On Thu, Jan 5, 2023 at 8:36 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Thu, Jan 05, 2023 at 02:23:25PM +0900, Yi Xie wrote:
> > > > Some libraries including Mesa and virglrenderer require a render node to
> > > > fully function. By adding a render node to vkms those libraries will
> > > > work properly, supporting use cases like running crosvm with virgl GPU
> > > > support via llvmpipe on a headless virtual machine.
> > >
> > > This is what vgem exists for. More or less at least ... I'm honestly not
> > > really understanding what you're trying to fix here, it sounds a bit like
> > > userspace being stupid.
> > > -Daniel
> > The problem with vgem is that it crashes llvmpipe while working with vkms.
> > Looks like it's due to the same reason as described in this thread in Mesa:
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830
>
> I'm not finding any bug description in there and how/why something
> crashes?

The discussion is in the comment section under the first comment by
Emil Velikov.
It's folded by default (inside "6 replies" at the bottom).

>
> > Importing buffers allocated by vgem to vkms seems to be unexpected and
> > causes the crash. If we create a render node on vkms then llvmpipe will use
> > vkms to allocate buffers and it no longer crashes.
>
> Uh importing vgem into virtio might not work because those sometimes need
> special buffers iirc. But importing vgem into vkms really should work,
> there's no technical reason it cannot. If it doesn't, then the right fix
> would be to fix that, not paper around it.

The crash stack trace looks like this:
https://gist.github.com/imxieyi/03053ae79cee2e614850fd41829e1da2

Even if we fix the crash issue with vgem, we still need to workaround
quite a few
places that has explicitly blocked vgem. A notable example is virglrenderer:
https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/master/src/vrend_winsys_gbm.c#L121

Actually I have tried to force running virglrenderer on vgem and it
didn't work. I
didn't look into why it wasn't working but I guess that's the reason
for blocking
vgem in the first place. Virglrenderer works well on vkms with render node
enabled though.

> -Daniel
>
> >
> > > >
> > > > Signed-off-by: Yi Xie <yixie@google.com>
> > > > ---
> > > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > index 293dbca50c31..8eea5d4dece8 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > @@ -113,7 +113,7 @@ static void vkms_config_debugfs_init(struct drm_minor *minor)
> > > >  }
> > > >
> > > >  static const struct drm_driver vkms_driver = {
> > > > -     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> > > > +     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM | DRIVER_RENDER,
> > > >       .release                = vkms_release,
> > > >       .fops                   = &vkms_driver_fops,
> > > >       DRM_GEM_SHMEM_DRIVER_OPS,
> > > > --
> > > > 2.39.0.314.g84b9a713c41-goog
> > > >
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
