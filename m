Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E3B65F5F2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 22:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6924B10E29E;
	Thu,  5 Jan 2023 21:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BE710E29D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 21:40:41 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id s23so3614838uac.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 13:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fP1zjQQeX0vuvwTvbqPfwOtANw7vqBC+h3IYkJoyc7M=;
 b=p5jj42jeqsuHL8y0dflhXDSwm0UzKzk2m2xKnuh1Y1hvKDbrhvK2VHnFv7yssulAgT
 PDJnUn5DWLRYALkH95plC23RMvC789ZHmhGMx0LwpoVbEwXDCOA4agEfFs7iVvnj/k7b
 aIEomAvJKgqHueis1hw18tqsN1yRvDmMP9CeVz+zXc31RRyhHkngZO11rDkNUI6+gnIJ
 uwOdpTf1t9YHJecQ74zab3e63fUaESYlAnmWF/FuzJAyy0pijo47+ycaYDFvCkoFFegC
 pgd7JWQEVTOj98lF6J+W+z6kyvZPebS/uUo5lZX+iG4ZQiekoeSfHLrTmXTcICg93rhx
 hqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fP1zjQQeX0vuvwTvbqPfwOtANw7vqBC+h3IYkJoyc7M=;
 b=ptq6WBvH6h3Zcmas1VmrelkpaCSSQAzME7nelNpTZfMgKuQU34BQ1g47h243NN3T68
 J87hHdQj44aWFXvaf8iTCA1J1o5bsZ7RWoUWp53XnLBJd+lj544DA39Mo7+FXWfugPH/
 TkNAuz0pRuN3HM5s0t2s43caIohf09nVp+/E7+1nLYP0NT9q+6eYYM+aAYmWjbvQHhVM
 AyzQuUBmD7f0Mi8ehVilivOx9Tqnrm8KVZCOajjoEkpq5HOtFCf+9/QKh/Cop0obQFQK
 YPVcqcGVBSCyG1Nftdq+iyyOeK72G+Nlj6MP0pXD02PMlGmXmUbypgSXmVXcpcggAdEb
 bqdg==
X-Gm-Message-State: AFqh2kqTrpRpgTgL8DUTGGRMfBVRTWP+z1SLRm9c8xpvqxIPynriO8ED
 2TCQEVN5VV4S9EMGqQL64sIQHCOZ0IOwoslmRDwc4Q==
X-Google-Smtp-Source: AMrXdXsLuZrvnA7H/E8oR1oWit8wMXPsEzFs1Jz8wVF4FjH6/M+cWKonJ/Em3bNvWeuu12QUwwKtdaackxMK+x3c/9Q=
X-Received: by 2002:ab0:2253:0:b0:3ad:4f5c:66ad with SMTP id
 z19-20020ab02253000000b003ad4f5c66admr5351779uan.65.1672954840121; Thu, 05
 Jan 2023 13:40:40 -0800 (PST)
MIME-Version: 1.0
References: <20230105052325.514970-1-yixie@google.com>
 <Y7a2Viw/1RUNCGkD@phenom.ffwll.local>
 <CAHf1YQ4AZoOd=Q7KVqb1gQm3=TtiS_8-uxFY93syov1AgUT=CQ@mail.gmail.com>
 <Y7bVNT0sf5cwEHuj@phenom.ffwll.local>
 <CAHf1YQ55f2mN14ytCz=AB=VSvO8ByKoV59dF50gWVcjcgMkTHg@mail.gmail.com>
 <Y7bbxVzhYCGhCvVN@phenom.ffwll.local>
 <CAHf1YQ4jHeCGqoERpYM6yX8-9pjqiemUN3fT3fpweDTZz6Mrbg@mail.gmail.com>
 <Y7buUnTE91GC+VZb@phenom.ffwll.local>
In-Reply-To: <Y7buUnTE91GC+VZb@phenom.ffwll.local>
From: =?UTF-8?B?VGFvIFd1KOWQtOa2m0BFbmcp?= <lepton@google.com>
Date: Thu, 5 Jan 2023 13:40:28 -0800
Message-ID: <CAOvqHj68uPoPdBrbKaBMg4QOre-EjRJOH12XqBBR+1bAx-fQwA@mail.gmail.com>
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
Cc: melissa.srw@gmail.com, hamohammed.sa@gmail.com, Yi Xie <yixie@google.com>,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

May I know what's the requirement for adding render node support to a
"gpu"?  Why we just export render node for every drm devices?
I read document here
https://www.kernel.org/doc/html/v4.8/gpu/drm-uapi.html#render-nodes
and it seems render node allow multiple unprivileged clients
to work with the same gpu, I am not sure why we just enable it for all
kms-only device.
What's wrong if we enable it for all kms-only devices and also let
mesa to use llvmpipe with those devices by default.

Thanks!

On Thu, Jan 5, 2023 at 7:35 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Jan 06, 2023 at 12:16:07AM +0900, Yi Xie wrote:
> > On Thu, Jan 5, 2023 at 11:16 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Thu, Jan 05, 2023 at 11:10:23PM +0900, Yi Xie wrote:
> > > > On Thu, Jan 5, 2023 at 10:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > On Thu, Jan 05, 2023 at 09:52:26PM +0900, Yi Xie wrote:
> > > > > > > This doesn't sound like a good idea to me. Devices without render
> > > > > > > capabilities should not fake it.
> > > > > > >
> > > > > > > User-space (e.g. wlroots) relies on "no render node" to enable
> > > > > > > software rendering (Pixman instead of GL).
> > > > > >
> > > > > > We have virtgpu driver that exports a render node even when virgl is
> > > > > > not supported.
> > > > > > Mesa has special code path to enable software rendering on it:
> > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/egl/drivers/dri2/platform_device.c#L296
> > > > > > We can do the same for vkms to force software rendering.
> > > > >
> > > > > Yeah that is the old kmsro mesa issue, for every combination of kms and
> > > > > gem device you need one to make this work.
> > > > >
> > > > > > On Thu, Jan 5, 2023 at 8:36 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > >
> > > > > > > On Thu, Jan 05, 2023 at 02:23:25PM +0900, Yi Xie wrote:
> > > > > > > > Some libraries including Mesa and virglrenderer require a render node to
> > > > > > > > fully function. By adding a render node to vkms those libraries will
> > > > > > > > work properly, supporting use cases like running crosvm with virgl GPU
> > > > > > > > support via llvmpipe on a headless virtual machine.
> > > > > > >
> > > > > > > This is what vgem exists for. More or less at least ... I'm honestly not
> > > > > > > really understanding what you're trying to fix here, it sounds a bit like
> > > > > > > userspace being stupid.
> > > > > > > -Daniel
> > > > > > The problem with vgem is that it crashes llvmpipe while working with vkms.
> > > > > > Looks like it's due to the same reason as described in this thread in Mesa:
> > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830
> > > > >
> > > > > I'm not finding any bug description in there and how/why something
> > > > > crashes?
> > > >
> > > > The discussion is in the comment section under the first comment by
> > > > Emil Velikov.
> > > > It's folded by default (inside "6 replies" at the bottom).
> > > >
> > > > >
> > > > > > Importing buffers allocated by vgem to vkms seems to be unexpected and
> > > > > > causes the crash. If we create a render node on vkms then llvmpipe will use
> > > > > > vkms to allocate buffers and it no longer crashes.
> > > > >
> > > > > Uh importing vgem into virtio might not work because those sometimes need
> > > > > special buffers iirc. But importing vgem into vkms really should work,
> > > > > there's no technical reason it cannot. If it doesn't, then the right fix
> > > > > would be to fix that, not paper around it.
> > > >
> > > > The crash stack trace looks like this:
> > > > https://gist.github.com/imxieyi/03053ae79cee2e614850fd41829e1da2
> > > >
> > > > Even if we fix the crash issue with vgem, we still need to workaround
> > > > quite a few
> > > > places that has explicitly blocked vgem. A notable example is virglrenderer:
> > > > https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/master/src/vrend_winsys_gbm.c#L121
> > > >
> > > > Actually I have tried to force running virglrenderer on vgem and it
> > > > didn't work. I
> > > > didn't look into why it wasn't working but I guess that's the reason
> > > > for blocking
> > > > vgem in the first place. Virglrenderer works well on vkms with render node
> > > > enabled though.
> > >
> > > Ah ok. For next time around, copy a link to the comment you want, e.g.
> > >
> > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830#note_582477
> > >
> > > The 3 dots menu on each comments has an option to copy that link tag. That
> > > also highlights the right comment.
> >
> > Thanks for the tips! Actually you need to sign in to reveal that 3 dots menu.
> >
> > >
> > > On this issue, I'm concurring with Emil:
> > >
> > > "- the import is broken
> > > "IMHO that should be fixed, regardless of the rest"
> > >
> > > The same should be done here. Unless it's a very special device, we should
> > > be able to import vgem buffers.
> >
> > How about the fact that vgem is blocked explicitly in virglrenderer?
> > We will have
> > to remove it from block list and that may break something that
> > resulted in blocking
> > in this commit:
> > https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/2cb686dd46df27e9600f9df734303ec57bb38772
> > I can't find the reason why it's blocking vgem though. It shouldn't be
> > related to
> > incompatibility with vkms/virtgpu.
> >
> > Are there any concerns that enabling render node on vkms may cause problems?
> > What if we add a driver option to add render node on demand?
>
> The thing is, that none of the other kms-only driver enable render nodes.
> If we start adding them in one case just because userspace can't cope,
> then we'll have an endless stream of these patches.
>
> Instead of fixing userspace.
>
> Note that the issue is very old for at least mesa3d, and the only fix is
> kmsro, where you have to build a driver for each combo. Maybe this should
> be done better, dunno. But adding render node in just vkms for this use
> case really doesn't make much sense to me, and it smells very much like
> opening a can of worms :-/
> -Daniel
>
> > > -Daniel
> > >
> > > >
> > > > > -Daniel
> > > > >
> > > > > >
> > > > > > > >
> > > > > > > > Signed-off-by: Yi Xie <yixie@google.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> > > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > index 293dbca50c31..8eea5d4dece8 100644
> > > > > > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > @@ -113,7 +113,7 @@ static void vkms_config_debugfs_init(struct drm_minor *minor)
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static const struct drm_driver vkms_driver = {
> > > > > > > > -     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> > > > > > > > +     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM | DRIVER_RENDER,
> > > > > > > >       .release                = vkms_release,
> > > > > > > >       .fops                   = &vkms_driver_fops,
> > > > > > > >       DRM_GEM_SHMEM_DRIVER_OPS,
> > > > > > > > --
> > > > > > > > 2.39.0.314.g84b9a713c41-goog
> > > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Daniel Vetter
> > > > > > > Software Engineer, Intel Corporation
> > > > > > > http://blog.ffwll.ch
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
