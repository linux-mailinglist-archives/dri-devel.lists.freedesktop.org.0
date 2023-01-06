Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1531365FE65
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 10:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B97010E84A;
	Fri,  6 Jan 2023 09:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA1A10E84A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 09:54:22 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so3186030wms.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 01:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aVDgQ35yOoAoNAQF1jV64stKn5wzo+nKHpxxXrw4qIY=;
 b=etQdna80/1HuqYZAb6twFZ4dotU9CBojLegW7FtYR0SuIJXLKPcqZN9dwC5Ei8Fp7d
 sQKx/sDsxuFWg5etCZp8NYnuZ03esBcEmvHtvFCggBHm5xM4x3v9uhQp0/uUBGmmtORS
 lGwuXNOPX7XFPBLQZW7xJnXdBuJgT8BcFsUiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aVDgQ35yOoAoNAQF1jV64stKn5wzo+nKHpxxXrw4qIY=;
 b=xjuA6GGubfkQU9RGL1UbmtMjk0kQs53H6PMcejQBOwrYCVxjdJvD+Q8E+bzba3hTKl
 nVzMpJiwn/7fB/iAP9zTRp2p9oB6GgVPHGIXpR6hW4SST2VvryWVFRYOYHkPPnY3Htc1
 WhejMaIlTEN0KodfOmhKIPTdkytbq+NGIssFlGzvqjXFvhtBnCtoqPTSY6MFWDyt/Wa8
 dwtkJm37gjvmCN+3XpnKL8dM6JVUc56Xt99ofry1Tbxs1qWY6+YZiMUJdCwt//GtnmXk
 oWuv6mmiuyaHi2wPhiH7HsVO/o2B+U+3gFluXf6gyz1h1FHB15n41GKKZe/sCOhR94Jl
 KSSQ==
X-Gm-Message-State: AFqh2korHyVkDAPOX3eGSjy77gwpi+Omff/le8Hnu39BQWibToqGJRfx
 XcNqGCsKDaQEbzY6r8kZ/8i4fdtgikWn3+7/
X-Google-Smtp-Source: AMrXdXuQVgsfec86ACIxU/pAkWorYUgShj+PAD39Qt1O+byHTwPxB4FSp2wlla+v8YuPTVBzfQN0iw==
X-Received: by 2002:a05:600c:3b8f:b0:3d0:480b:ac53 with SMTP id
 n15-20020a05600c3b8f00b003d0480bac53mr41664495wms.12.1672998860526; 
 Fri, 06 Jan 2023 01:54:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003d99a39b846sm1281795wmg.5.2023.01.06.01.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 01:54:19 -0800 (PST)
Date: Fri, 6 Jan 2023 10:54:17 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tao =?utf-8?B?V3Uo5ZC05rabQEVuZyk=?= <lepton@google.com>
Subject: Re: [PATCH] drm/vkms: Add a DRM render node to vkms
Message-ID: <Y7fvyQ6Ve6duSjho@phenom.ffwll.local>
References: <20230105052325.514970-1-yixie@google.com>
 <Y7a2Viw/1RUNCGkD@phenom.ffwll.local>
 <CAHf1YQ4AZoOd=Q7KVqb1gQm3=TtiS_8-uxFY93syov1AgUT=CQ@mail.gmail.com>
 <Y7bVNT0sf5cwEHuj@phenom.ffwll.local>
 <CAHf1YQ55f2mN14ytCz=AB=VSvO8ByKoV59dF50gWVcjcgMkTHg@mail.gmail.com>
 <Y7bbxVzhYCGhCvVN@phenom.ffwll.local>
 <CAHf1YQ4jHeCGqoERpYM6yX8-9pjqiemUN3fT3fpweDTZz6Mrbg@mail.gmail.com>
 <Y7buUnTE91GC+VZb@phenom.ffwll.local>
 <CAOvqHj68uPoPdBrbKaBMg4QOre-EjRJOH12XqBBR+1bAx-fQwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOvqHj68uPoPdBrbKaBMg4QOre-EjRJOH12XqBBR+1bAx-fQwA@mail.gmail.com>
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
 Yi Xie <yixie@google.com>, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 01:40:28PM -0800, Tao Wu(吴涛@Eng) wrote:
> Hi Daniel,
> 
> May I know what's the requirement for adding render node support to a
> "gpu"?  Why we just export render node for every drm devices?
> I read document here
> https://www.kernel.org/doc/html/v4.8/gpu/drm-uapi.html#render-nodes

Thus far we've only done it when there's actual rendering capability,
which generally means at least some private ioctls.

Which vkms just doens't have. And it's by far not the only such case.

Also note that display drivers side is _not_ shareable.
-Daniel

> and it seems render node allow multiple unprivileged clients
> to work with the same gpu, I am not sure why we just enable it for all
> kms-only device.
> What's wrong if we enable it for all kms-only devices and also let
> mesa to use llvmpipe with those devices by default.
> 
> Thanks!
> 
> On Thu, Jan 5, 2023 at 7:35 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Jan 06, 2023 at 12:16:07AM +0900, Yi Xie wrote:
> > > On Thu, Jan 5, 2023 at 11:16 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Thu, Jan 05, 2023 at 11:10:23PM +0900, Yi Xie wrote:
> > > > > On Thu, Jan 5, 2023 at 10:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > >
> > > > > > On Thu, Jan 05, 2023 at 09:52:26PM +0900, Yi Xie wrote:
> > > > > > > > This doesn't sound like a good idea to me. Devices without render
> > > > > > > > capabilities should not fake it.
> > > > > > > >
> > > > > > > > User-space (e.g. wlroots) relies on "no render node" to enable
> > > > > > > > software rendering (Pixman instead of GL).
> > > > > > >
> > > > > > > We have virtgpu driver that exports a render node even when virgl is
> > > > > > > not supported.
> > > > > > > Mesa has special code path to enable software rendering on it:
> > > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/egl/drivers/dri2/platform_device.c#L296
> > > > > > > We can do the same for vkms to force software rendering.
> > > > > >
> > > > > > Yeah that is the old kmsro mesa issue, for every combination of kms and
> > > > > > gem device you need one to make this work.
> > > > > >
> > > > > > > On Thu, Jan 5, 2023 at 8:36 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > > >
> > > > > > > > On Thu, Jan 05, 2023 at 02:23:25PM +0900, Yi Xie wrote:
> > > > > > > > > Some libraries including Mesa and virglrenderer require a render node to
> > > > > > > > > fully function. By adding a render node to vkms those libraries will
> > > > > > > > > work properly, supporting use cases like running crosvm with virgl GPU
> > > > > > > > > support via llvmpipe on a headless virtual machine.
> > > > > > > >
> > > > > > > > This is what vgem exists for. More or less at least ... I'm honestly not
> > > > > > > > really understanding what you're trying to fix here, it sounds a bit like
> > > > > > > > userspace being stupid.
> > > > > > > > -Daniel
> > > > > > > The problem with vgem is that it crashes llvmpipe while working with vkms.
> > > > > > > Looks like it's due to the same reason as described in this thread in Mesa:
> > > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830
> > > > > >
> > > > > > I'm not finding any bug description in there and how/why something
> > > > > > crashes?
> > > > >
> > > > > The discussion is in the comment section under the first comment by
> > > > > Emil Velikov.
> > > > > It's folded by default (inside "6 replies" at the bottom).
> > > > >
> > > > > >
> > > > > > > Importing buffers allocated by vgem to vkms seems to be unexpected and
> > > > > > > causes the crash. If we create a render node on vkms then llvmpipe will use
> > > > > > > vkms to allocate buffers and it no longer crashes.
> > > > > >
> > > > > > Uh importing vgem into virtio might not work because those sometimes need
> > > > > > special buffers iirc. But importing vgem into vkms really should work,
> > > > > > there's no technical reason it cannot. If it doesn't, then the right fix
> > > > > > would be to fix that, not paper around it.
> > > > >
> > > > > The crash stack trace looks like this:
> > > > > https://gist.github.com/imxieyi/03053ae79cee2e614850fd41829e1da2
> > > > >
> > > > > Even if we fix the crash issue with vgem, we still need to workaround
> > > > > quite a few
> > > > > places that has explicitly blocked vgem. A notable example is virglrenderer:
> > > > > https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/master/src/vrend_winsys_gbm.c#L121
> > > > >
> > > > > Actually I have tried to force running virglrenderer on vgem and it
> > > > > didn't work. I
> > > > > didn't look into why it wasn't working but I guess that's the reason
> > > > > for blocking
> > > > > vgem in the first place. Virglrenderer works well on vkms with render node
> > > > > enabled though.
> > > >
> > > > Ah ok. For next time around, copy a link to the comment you want, e.g.
> > > >
> > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830#note_582477
> > > >
> > > > The 3 dots menu on each comments has an option to copy that link tag. That
> > > > also highlights the right comment.
> > >
> > > Thanks for the tips! Actually you need to sign in to reveal that 3 dots menu.
> > >
> > > >
> > > > On this issue, I'm concurring with Emil:
> > > >
> > > > "- the import is broken
> > > > "IMHO that should be fixed, regardless of the rest"
> > > >
> > > > The same should be done here. Unless it's a very special device, we should
> > > > be able to import vgem buffers.
> > >
> > > How about the fact that vgem is blocked explicitly in virglrenderer?
> > > We will have
> > > to remove it from block list and that may break something that
> > > resulted in blocking
> > > in this commit:
> > > https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/2cb686dd46df27e9600f9df734303ec57bb38772
> > > I can't find the reason why it's blocking vgem though. It shouldn't be
> > > related to
> > > incompatibility with vkms/virtgpu.
> > >
> > > Are there any concerns that enabling render node on vkms may cause problems?
> > > What if we add a driver option to add render node on demand?
> >
> > The thing is, that none of the other kms-only driver enable render nodes.
> > If we start adding them in one case just because userspace can't cope,
> > then we'll have an endless stream of these patches.
> >
> > Instead of fixing userspace.
> >
> > Note that the issue is very old for at least mesa3d, and the only fix is
> > kmsro, where you have to build a driver for each combo. Maybe this should
> > be done better, dunno. But adding render node in just vkms for this use
> > case really doesn't make much sense to me, and it smells very much like
> > opening a can of worms :-/
> > -Daniel
> >
> > > > -Daniel
> > > >
> > > > >
> > > > > > -Daniel
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > Signed-off-by: Yi Xie <yixie@google.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> > > > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > > index 293dbca50c31..8eea5d4dece8 100644
> > > > > > > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > > @@ -113,7 +113,7 @@ static void vkms_config_debugfs_init(struct drm_minor *minor)
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > >  static const struct drm_driver vkms_driver = {
> > > > > > > > > -     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> > > > > > > > > +     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM | DRIVER_RENDER,
> > > > > > > > >       .release                = vkms_release,
> > > > > > > > >       .fops                   = &vkms_driver_fops,
> > > > > > > > >       DRM_GEM_SHMEM_DRIVER_OPS,
> > > > > > > > > --
> > > > > > > > > 2.39.0.314.g84b9a713c41-goog
> > > > > > > > >
> > > > > > > >
> > > > > > > > --
> > > > > > > > Daniel Vetter
> > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > http://blog.ffwll.ch
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
