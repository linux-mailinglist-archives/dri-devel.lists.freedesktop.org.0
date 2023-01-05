Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F1365EE90
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 15:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C049310E10C;
	Thu,  5 Jan 2023 14:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC0B10E10C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 14:16:41 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso1404685wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 06:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8j5hPbefgBGGJHBnsAyQdMEfir+YQPtfFz9+lMOb1kk=;
 b=MS43t7yLMaxOOYw27ltw2ihRh3bXDSKguTeROQ6X0P6vEVR8/yXWWfWAGKFcjQ9qKQ
 mXmb4ykZfWTWVe2HFDazsNgLRnlTBYqY9x49K+RanHUSTr76IvYDs4sq8lFetpVYcMuc
 mqITn65DGKtxcvU5KnrzoxQK5vPzN7hQy6kLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8j5hPbefgBGGJHBnsAyQdMEfir+YQPtfFz9+lMOb1kk=;
 b=ECeh7lFpmgXIKiWPkeUw6+wk2HeZ4+bOlqUy+sCNViSiyYcgqW0WCg4yHciRvn9Iet
 aph3ntpDxNEl/xW2j/LhTJF+E5v+QhUvy6H0/NhrCzKferj3C5P1ExQHsckloCFTZ5dg
 iYTPdp9x5AW+g4hG2Bt1d1S4BncrKwx6g7sIAgYtvoHFmxYIzcgLbL0Y0/RSQKwdKrit
 wLJsjmO0/+C0p4pxbhd03DoyY65eDp+acGMekc90XpL8/g9R5hh+bfnP6vnXhTOI/t0i
 yi8iQFpIIF0BhL2UaKShIIhLN5AiyXZICkjnS7KpUH6Ek9B8bp0ZHjGgP5BumTcxue77
 SScg==
X-Gm-Message-State: AFqh2krJpVCCXJKxNOLjEa+cEIKYSVjfTy2hf/wsBYPTBwQaTcI+8LSO
 SXZPgZJ1S+hMjZR54IAcQNxUyQ==
X-Google-Smtp-Source: AMrXdXtZluIu1+RoqDTkX5icw+tri4xuH9ZcJ9XoNEtOvhpmgaaIWHoit8ZaOqAaccmoMv/Zz22XgA==
X-Received: by 2002:a05:600c:6016:b0:3d3:3c93:af5e with SMTP id
 az22-20020a05600c601600b003d33c93af5emr36428987wmb.35.1672928199707; 
 Thu, 05 Jan 2023 06:16:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003d990372dd5sm2825335wmq.20.2023.01.05.06.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:16:39 -0800 (PST)
Date: Thu, 5 Jan 2023 15:16:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Yi Xie <yixie@google.com>
Subject: Re: [PATCH] drm/vkms: Add a DRM render node to vkms
Message-ID: <Y7bbxVzhYCGhCvVN@phenom.ffwll.local>
References: <20230105052325.514970-1-yixie@google.com>
 <Y7a2Viw/1RUNCGkD@phenom.ffwll.local>
 <CAHf1YQ4AZoOd=Q7KVqb1gQm3=TtiS_8-uxFY93syov1AgUT=CQ@mail.gmail.com>
 <Y7bVNT0sf5cwEHuj@phenom.ffwll.local>
 <CAHf1YQ55f2mN14ytCz=AB=VSvO8ByKoV59dF50gWVcjcgMkTHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHf1YQ55f2mN14ytCz=AB=VSvO8ByKoV59dF50gWVcjcgMkTHg@mail.gmail.com>
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

On Thu, Jan 05, 2023 at 11:10:23PM +0900, Yi Xie wrote:
> On Thu, Jan 5, 2023 at 10:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Jan 05, 2023 at 09:52:26PM +0900, Yi Xie wrote:
> > > > This doesn't sound like a good idea to me. Devices without render
> > > > capabilities should not fake it.
> > > >
> > > > User-space (e.g. wlroots) relies on "no render node" to enable
> > > > software rendering (Pixman instead of GL).
> > >
> > > We have virtgpu driver that exports a render node even when virgl is
> > > not supported.
> > > Mesa has special code path to enable software rendering on it:
> > > https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/egl/drivers/dri2/platform_device.c#L296
> > > We can do the same for vkms to force software rendering.
> >
> > Yeah that is the old kmsro mesa issue, for every combination of kms and
> > gem device you need one to make this work.
> >
> > > On Thu, Jan 5, 2023 at 8:36 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Thu, Jan 05, 2023 at 02:23:25PM +0900, Yi Xie wrote:
> > > > > Some libraries including Mesa and virglrenderer require a render node to
> > > > > fully function. By adding a render node to vkms those libraries will
> > > > > work properly, supporting use cases like running crosvm with virgl GPU
> > > > > support via llvmpipe on a headless virtual machine.
> > > >
> > > > This is what vgem exists for. More or less at least ... I'm honestly not
> > > > really understanding what you're trying to fix here, it sounds a bit like
> > > > userspace being stupid.
> > > > -Daniel
> > > The problem with vgem is that it crashes llvmpipe while working with vkms.
> > > Looks like it's due to the same reason as described in this thread in Mesa:
> > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830
> >
> > I'm not finding any bug description in there and how/why something
> > crashes?
> 
> The discussion is in the comment section under the first comment by
> Emil Velikov.
> It's folded by default (inside "6 replies" at the bottom).
> 
> >
> > > Importing buffers allocated by vgem to vkms seems to be unexpected and
> > > causes the crash. If we create a render node on vkms then llvmpipe will use
> > > vkms to allocate buffers and it no longer crashes.
> >
> > Uh importing vgem into virtio might not work because those sometimes need
> > special buffers iirc. But importing vgem into vkms really should work,
> > there's no technical reason it cannot. If it doesn't, then the right fix
> > would be to fix that, not paper around it.
> 
> The crash stack trace looks like this:
> https://gist.github.com/imxieyi/03053ae79cee2e614850fd41829e1da2
> 
> Even if we fix the crash issue with vgem, we still need to workaround
> quite a few
> places that has explicitly blocked vgem. A notable example is virglrenderer:
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/master/src/vrend_winsys_gbm.c#L121
> 
> Actually I have tried to force running virglrenderer on vgem and it
> didn't work. I
> didn't look into why it wasn't working but I guess that's the reason
> for blocking
> vgem in the first place. Virglrenderer works well on vkms with render node
> enabled though.

Ah ok. For next time around, copy a link to the comment you want, e.g.

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830#note_582477

The 3 dots menu on each comments has an option to copy that link tag. That
also highlights the right comment.

On this issue, I'm concurring with Emil:

"- the import is broken
"IMHO that should be fixed, regardless of the rest"

The same should be done here. Unless it's a very special device, we should
be able to import vgem buffers.
-Daniel

> 
> > -Daniel
> >
> > >
> > > > >
> > > > > Signed-off-by: Yi Xie <yixie@google.com>
> > > > > ---
> > > > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > index 293dbca50c31..8eea5d4dece8 100644
> > > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > @@ -113,7 +113,7 @@ static void vkms_config_debugfs_init(struct drm_minor *minor)
> > > > >  }
> > > > >
> > > > >  static const struct drm_driver vkms_driver = {
> > > > > -     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> > > > > +     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM | DRIVER_RENDER,
> > > > >       .release                = vkms_release,
> > > > >       .fops                   = &vkms_driver_fops,
> > > > >       DRM_GEM_SHMEM_DRIVER_OPS,
> > > > > --
> > > > > 2.39.0.314.g84b9a713c41-goog
> > > > >
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
