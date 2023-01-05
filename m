Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837F965F02F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 16:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A01C10E126;
	Thu,  5 Jan 2023 15:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D176C10E75A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 15:35:50 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id bk16so23293437wrb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 07:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2EqUrBsghy35r3jXLtGWJuevKwSpAg7lmk9Bsu892Vg=;
 b=irhsdHbx/2v7A2Q6/G2IfOX1XX+vBSCT0qYHuu7fSooagbETK6+BEgwQGD328DrpEE
 HwhPnrvB9ekh1jqYfVeqgTagym1rokKc0sSkUGiali70N2xCSg0f3al+VHVPulwyWTMh
 baKYUNmNmGsc75LwjEs0D1HVsneCLzp0jg4CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2EqUrBsghy35r3jXLtGWJuevKwSpAg7lmk9Bsu892Vg=;
 b=rH+OgigrUN73ANEQ5UuVH9Gx/zz/Xr4uyujUTUTWVb6//RyzM80ULFyJ+G1oAO7SyJ
 kr0/40fTosGP94tLJ+t916TPUQiEMNDxUqWImEDEUUnX/HlbSX1snloSgJVmh2+4/cmY
 ieoeWQkFj09ZdHajmV7TGdjOAe3ylSI8xwA2l0tNGIt7zDJnhjpSNrkbkmZ0nnoi3qan
 ZbRAR0XU0JoYwCwIrdJRM5kSmSZ1Cbpagmtz/0WkO+k6v4uYmc5QSsKh56GacjTuvS/I
 JctAeKxwXdNyxisKd5Rv7R537OskXbi0NjAPbtcNji1FnJt0+jY2SQaeumTS24b+166v
 Iv4g==
X-Gm-Message-State: AFqh2kpdVKr/oex57uQBt6xlmn4aiOprdIbXOUEAA6DGNbxJlBBOLOdE
 6HlVMzDxXgdu7xIWqTYIh4XQeg==
X-Google-Smtp-Source: AMrXdXtME/reEvJyn+K1pCvSshNbTRmlM8f2xQOBKbeB0yLRZUsN1ymVRNsgsu+qc0bKpkzRnaTlSQ==
X-Received: by 2002:a5d:6541:0:b0:28e:f7a:9fe9 with SMTP id
 z1-20020a5d6541000000b0028e0f7a9fe9mr14867925wrv.5.1672932949273; 
 Thu, 05 Jan 2023 07:35:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n13-20020adffe0d000000b002b74be46309sm504895wrr.114.2023.01.05.07.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 07:35:48 -0800 (PST)
Date: Thu, 5 Jan 2023 16:35:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Yi Xie <yixie@google.com>
Subject: Re: [PATCH] drm/vkms: Add a DRM render node to vkms
Message-ID: <Y7buUnTE91GC+VZb@phenom.ffwll.local>
References: <20230105052325.514970-1-yixie@google.com>
 <Y7a2Viw/1RUNCGkD@phenom.ffwll.local>
 <CAHf1YQ4AZoOd=Q7KVqb1gQm3=TtiS_8-uxFY93syov1AgUT=CQ@mail.gmail.com>
 <Y7bVNT0sf5cwEHuj@phenom.ffwll.local>
 <CAHf1YQ55f2mN14ytCz=AB=VSvO8ByKoV59dF50gWVcjcgMkTHg@mail.gmail.com>
 <Y7bbxVzhYCGhCvVN@phenom.ffwll.local>
 <CAHf1YQ4jHeCGqoERpYM6yX8-9pjqiemUN3fT3fpweDTZz6Mrbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHf1YQ4jHeCGqoERpYM6yX8-9pjqiemUN3fT3fpweDTZz6Mrbg@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, lepton@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 12:16:07AM +0900, Yi Xie wrote:
> On Thu, Jan 5, 2023 at 11:16 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Jan 05, 2023 at 11:10:23PM +0900, Yi Xie wrote:
> > > On Thu, Jan 5, 2023 at 10:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Thu, Jan 05, 2023 at 09:52:26PM +0900, Yi Xie wrote:
> > > > > > This doesn't sound like a good idea to me. Devices without render
> > > > > > capabilities should not fake it.
> > > > > >
> > > > > > User-space (e.g. wlroots) relies on "no render node" to enable
> > > > > > software rendering (Pixman instead of GL).
> > > > >
> > > > > We have virtgpu driver that exports a render node even when virgl is
> > > > > not supported.
> > > > > Mesa has special code path to enable software rendering on it:
> > > > > https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/egl/drivers/dri2/platform_device.c#L296
> > > > > We can do the same for vkms to force software rendering.
> > > >
> > > > Yeah that is the old kmsro mesa issue, for every combination of kms and
> > > > gem device you need one to make this work.
> > > >
> > > > > On Thu, Jan 5, 2023 at 8:36 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > >
> > > > > > On Thu, Jan 05, 2023 at 02:23:25PM +0900, Yi Xie wrote:
> > > > > > > Some libraries including Mesa and virglrenderer require a render node to
> > > > > > > fully function. By adding a render node to vkms those libraries will
> > > > > > > work properly, supporting use cases like running crosvm with virgl GPU
> > > > > > > support via llvmpipe on a headless virtual machine.
> > > > > >
> > > > > > This is what vgem exists for. More or less at least ... I'm honestly not
> > > > > > really understanding what you're trying to fix here, it sounds a bit like
> > > > > > userspace being stupid.
> > > > > > -Daniel
> > > > > The problem with vgem is that it crashes llvmpipe while working with vkms.
> > > > > Looks like it's due to the same reason as described in this thread in Mesa:
> > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830
> > > >
> > > > I'm not finding any bug description in there and how/why something
> > > > crashes?
> > >
> > > The discussion is in the comment section under the first comment by
> > > Emil Velikov.
> > > It's folded by default (inside "6 replies" at the bottom).
> > >
> > > >
> > > > > Importing buffers allocated by vgem to vkms seems to be unexpected and
> > > > > causes the crash. If we create a render node on vkms then llvmpipe will use
> > > > > vkms to allocate buffers and it no longer crashes.
> > > >
> > > > Uh importing vgem into virtio might not work because those sometimes need
> > > > special buffers iirc. But importing vgem into vkms really should work,
> > > > there's no technical reason it cannot. If it doesn't, then the right fix
> > > > would be to fix that, not paper around it.
> > >
> > > The crash stack trace looks like this:
> > > https://gist.github.com/imxieyi/03053ae79cee2e614850fd41829e1da2
> > >
> > > Even if we fix the crash issue with vgem, we still need to workaround
> > > quite a few
> > > places that has explicitly blocked vgem. A notable example is virglrenderer:
> > > https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/master/src/vrend_winsys_gbm.c#L121
> > >
> > > Actually I have tried to force running virglrenderer on vgem and it
> > > didn't work. I
> > > didn't look into why it wasn't working but I guess that's the reason
> > > for blocking
> > > vgem in the first place. Virglrenderer works well on vkms with render node
> > > enabled though.
> >
> > Ah ok. For next time around, copy a link to the comment you want, e.g.
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830#note_582477
> >
> > The 3 dots menu on each comments has an option to copy that link tag. That
> > also highlights the right comment.
> 
> Thanks for the tips! Actually you need to sign in to reveal that 3 dots menu.
> 
> >
> > On this issue, I'm concurring with Emil:
> >
> > "- the import is broken
> > "IMHO that should be fixed, regardless of the rest"
> >
> > The same should be done here. Unless it's a very special device, we should
> > be able to import vgem buffers.
> 
> How about the fact that vgem is blocked explicitly in virglrenderer?
> We will have
> to remove it from block list and that may break something that
> resulted in blocking
> in this commit:
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/2cb686dd46df27e9600f9df734303ec57bb38772
> I can't find the reason why it's blocking vgem though. It shouldn't be
> related to
> incompatibility with vkms/virtgpu.
> 
> Are there any concerns that enabling render node on vkms may cause problems?
> What if we add a driver option to add render node on demand?

The thing is, that none of the other kms-only driver enable render nodes.
If we start adding them in one case just because userspace can't cope,
then we'll have an endless stream of these patches.

Instead of fixing userspace.

Note that the issue is very old for at least mesa3d, and the only fix is
kmsro, where you have to build a driver for each combo. Maybe this should
be done better, dunno. But adding render node in just vkms for this use
case really doesn't make much sense to me, and it smells very much like
opening a can of worms :-/
-Daniel

> > -Daniel
> >
> > >
> > > > -Daniel
> > > >
> > > > >
> > > > > > >
> > > > > > > Signed-off-by: Yi Xie <yixie@google.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > index 293dbca50c31..8eea5d4dece8 100644
> > > > > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > @@ -113,7 +113,7 @@ static void vkms_config_debugfs_init(struct drm_minor *minor)
> > > > > > >  }
> > > > > > >
> > > > > > >  static const struct drm_driver vkms_driver = {
> > > > > > > -     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> > > > > > > +     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM | DRIVER_RENDER,
> > > > > > >       .release                = vkms_release,
> > > > > > >       .fops                   = &vkms_driver_fops,
> > > > > > >       DRM_GEM_SHMEM_DRIVER_OPS,
> > > > > > > --
> > > > > > > 2.39.0.314.g84b9a713c41-goog
> > > > > > >
> > > > > >
> > > > > > --
> > > > > > Daniel Vetter
> > > > > > Software Engineer, Intel Corporation
> > > > > > http://blog.ffwll.ch
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
