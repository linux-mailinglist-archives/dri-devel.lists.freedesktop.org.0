Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9657C6607A5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 21:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3114B10E8DC;
	Fri,  6 Jan 2023 20:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5352B10E8DC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 20:10:53 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m7so2293372wrn.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 12:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=76pqrJjW5E64yNaO2AhDgPKkfU7mc0mBHOSQ65nBgTc=;
 b=Rr7BMwzGn0LxYizMHc0sMzkcOpZlbOOvYjKRnkuAIYiy8FLPpxw25lmNdYtDj640Yo
 OEUPnkeNO/yK977wxAs8Jeu+evbv7TkGoB9Z8vst/D3OhgHbrv5yQ6uzEYo1YuN9nJfp
 YRSIrDAm5d+BUehHlu3Hebfq1crfAiXufq6ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=76pqrJjW5E64yNaO2AhDgPKkfU7mc0mBHOSQ65nBgTc=;
 b=1pbtGsydoh2JCAEsWQ3FRx4eT/Fom6GKsiKnwexY2bczYSs3kC802xgbyqkjqsT0tu
 eaLASkHmOEy8jwPpmFrpEk2iemwTLcgUUYgqRIAHbi/NHSMqKg1WqkcBSVLtLZIFG5ML
 lHxcR19D9YL17SdCamwhkJIm8vm7MYXxPLme6lMKFy74hWcg9Ef7uB1aILU+vIkkq5Ym
 d56kXEYBy2VGlAxF0gUcKcmoZrWiNMOb5x+E62ECOFDlHxO73Ck5su2mMyM4lsMKdxTH
 nZQNFto4x3zls3eeCKnBZqDccNd/NRspeKYLCD/r0x1AwPXXNg0yg/hr+5HY7beEyxyU
 nTTQ==
X-Gm-Message-State: AFqh2ko+QPOT6rlREDHx4XSRwAPGbTM+opHV8kPrvBDvxiny/oBAvENq
 akEkK9+VTP5GzXzbH4O0m/MIcYt0nW3NHUeH
X-Google-Smtp-Source: AMrXdXvq9S0cyFI2ZzevH8mztQ+awO9FpkG7LdxeACgf3MRCFS+0MpgzI1vNWnmus42A9r1lGqEzvA==
X-Received: by 2002:a05:6000:16c3:b0:28f:9b3d:c294 with SMTP id
 h3-20020a05600016c300b0028f9b3dc294mr19876518wrf.46.1673035851749; 
 Fri, 06 Jan 2023 12:10:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056000104a00b002238ea5750csm2292226wrx.72.2023.01.06.12.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 12:10:50 -0800 (PST)
Date: Fri, 6 Jan 2023 21:10:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Yi Xie <yixie@google.com>
Subject: Re: [PATCH] drm/vkms: Add a DRM render node to vkms
Message-ID: <Y7iASAy0j9KWg/PG@phenom.ffwll.local>
References: <Y7a2Viw/1RUNCGkD@phenom.ffwll.local>
 <CAHf1YQ4AZoOd=Q7KVqb1gQm3=TtiS_8-uxFY93syov1AgUT=CQ@mail.gmail.com>
 <Y7bVNT0sf5cwEHuj@phenom.ffwll.local>
 <CAHf1YQ55f2mN14ytCz=AB=VSvO8ByKoV59dF50gWVcjcgMkTHg@mail.gmail.com>
 <Y7bbxVzhYCGhCvVN@phenom.ffwll.local>
 <CAHf1YQ4jHeCGqoERpYM6yX8-9pjqiemUN3fT3fpweDTZz6Mrbg@mail.gmail.com>
 <Y7buUnTE91GC+VZb@phenom.ffwll.local>
 <CAOvqHj68uPoPdBrbKaBMg4QOre-EjRJOH12XqBBR+1bAx-fQwA@mail.gmail.com>
 <Y7fvyQ6Ve6duSjho@phenom.ffwll.local>
 <CAHf1YQ7xnhMwVzLaqsETuDAcBH+U_m=_BA4avfKbjM0Z_KOZRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHf1YQ7xnhMwVzLaqsETuDAcBH+U_m=_BA4avfKbjM0Z_KOZRA@mail.gmail.com>
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
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 Tao =?utf-8?B?V3Uo5ZC05rabQEVuZyk=?= <lepton@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 07:02:22PM +0900, Yi Xie wrote:
> I have figured out the problem with importing buffers across vgem/vkms.
> 
> It's intentionally blocked by kernel here:
> https://github.com/torvalds/linux/blob/a140a6a2d5ec0329ad05cd3532a91ad0ce58dceb/drivers/gpu/drm/drm_gem.c#L307

Uh yes. That is not your problem, because your userspace is using the
wrong interface. For a dma-buf either use mmap on the dma-buf fd, or on
the buffer handle from the original exporters. Importers should not
forward dma-buf mmap.

> From the original patch https://patchwork.freedesktop.org/patch/172242/:
> Reject mapping an imported dma-buf since it's an invalid use-case.
> 
> Looks like importing dumb buffers across different devices is
> disallowed. Removing this check and then everything is working well on
> vkms with vgem.

No. The entire point of dma-buf sharing is sharing them across devices and
process.

> According to the patch thread we should use native map instead of dumb
> map on imported buffers.
> 
> Since there is no native map ioctl in both vgem and vkms, I'm thinking
> about adding a dumb_map_offset implementation in both of them with
> that check removed.

No please not. You might need a dumb mmap offset on vgem, so that your sw
render code can upload the buffer. But I think that already exists on
vgem.

> From my testing vkms and vgem are now working happily together without
> any (obvious) issues.
> 
> There are other drivers doing the same thing, for example virtgpu:
> https://github.com/torvalds/linux/blob/a140a6a2d5ec0329ad05cd3532a91ad0ce58dceb/drivers/gpu/drm/virtio/virtgpu_gem.c#L102

Uh why is virtio allowing this, this is bad :-(

That kinda highlights that virtgpu should probably use a lot more of the
helpers we've gained over the last 9 years since Dave merged this code.
Would be great if you or someone can look into this?

Allowing dumb mmap on imported buffers is no good at all.
-Daniel

> 
> Does this sound like a better idea than adding a render node?
> 
> On Fri, Jan 6, 2023 at 6:54 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Jan 05, 2023 at 01:40:28PM -0800, Tao Wu(吴涛@Eng) wrote:
> > > Hi Daniel,
> > >
> > > May I know what's the requirement for adding render node support to a
> > > "gpu"?  Why we just export render node for every drm devices?
> > > I read document here
> > > https://www.kernel.org/doc/html/v4.8/gpu/drm-uapi.html#render-nodes
> >
> > Thus far we've only done it when there's actual rendering capability,
> > which generally means at least some private ioctls.
> >
> > Which vkms just doens't have. And it's by far not the only such case.
> >
> > Also note that display drivers side is _not_ shareable.
> > -Daniel
> >
> > > and it seems render node allow multiple unprivileged clients
> > > to work with the same gpu, I am not sure why we just enable it for all
> > > kms-only device.
> > > What's wrong if we enable it for all kms-only devices and also let
> > > mesa to use llvmpipe with those devices by default.
> > >
> > > Thanks!
> > >
> > > On Thu, Jan 5, 2023 at 7:35 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Fri, Jan 06, 2023 at 12:16:07AM +0900, Yi Xie wrote:
> > > > > On Thu, Jan 5, 2023 at 11:16 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > >
> > > > > > On Thu, Jan 05, 2023 at 11:10:23PM +0900, Yi Xie wrote:
> > > > > > > On Thu, Jan 5, 2023 at 10:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > > >
> > > > > > > > On Thu, Jan 05, 2023 at 09:52:26PM +0900, Yi Xie wrote:
> > > > > > > > > > This doesn't sound like a good idea to me. Devices without render
> > > > > > > > > > capabilities should not fake it.
> > > > > > > > > >
> > > > > > > > > > User-space (e.g. wlroots) relies on "no render node" to enable
> > > > > > > > > > software rendering (Pixman instead of GL).
> > > > > > > > >
> > > > > > > > > We have virtgpu driver that exports a render node even when virgl is
> > > > > > > > > not supported.
> > > > > > > > > Mesa has special code path to enable software rendering on it:
> > > > > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/egl/drivers/dri2/platform_device.c#L296
> > > > > > > > > We can do the same for vkms to force software rendering.
> > > > > > > >
> > > > > > > > Yeah that is the old kmsro mesa issue, for every combination of kms and
> > > > > > > > gem device you need one to make this work.
> > > > > > > >
> > > > > > > > > On Thu, Jan 5, 2023 at 8:36 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > > > > >
> > > > > > > > > > On Thu, Jan 05, 2023 at 02:23:25PM +0900, Yi Xie wrote:
> > > > > > > > > > > Some libraries including Mesa and virglrenderer require a render node to
> > > > > > > > > > > fully function. By adding a render node to vkms those libraries will
> > > > > > > > > > > work properly, supporting use cases like running crosvm with virgl GPU
> > > > > > > > > > > support via llvmpipe on a headless virtual machine.
> > > > > > > > > >
> > > > > > > > > > This is what vgem exists for. More or less at least ... I'm honestly not
> > > > > > > > > > really understanding what you're trying to fix here, it sounds a bit like
> > > > > > > > > > userspace being stupid.
> > > > > > > > > > -Daniel
> > > > > > > > > The problem with vgem is that it crashes llvmpipe while working with vkms.
> > > > > > > > > Looks like it's due to the same reason as described in this thread in Mesa:
> > > > > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830
> > > > > > > >
> > > > > > > > I'm not finding any bug description in there and how/why something
> > > > > > > > crashes?
> > > > > > >
> > > > > > > The discussion is in the comment section under the first comment by
> > > > > > > Emil Velikov.
> > > > > > > It's folded by default (inside "6 replies" at the bottom).
> > > > > > >
> > > > > > > >
> > > > > > > > > Importing buffers allocated by vgem to vkms seems to be unexpected and
> > > > > > > > > causes the crash. If we create a render node on vkms then llvmpipe will use
> > > > > > > > > vkms to allocate buffers and it no longer crashes.
> > > > > > > >
> > > > > > > > Uh importing vgem into virtio might not work because those sometimes need
> > > > > > > > special buffers iirc. But importing vgem into vkms really should work,
> > > > > > > > there's no technical reason it cannot. If it doesn't, then the right fix
> > > > > > > > would be to fix that, not paper around it.
> > > > > > >
> > > > > > > The crash stack trace looks like this:
> > > > > > > https://gist.github.com/imxieyi/03053ae79cee2e614850fd41829e1da2
> > > > > > >
> > > > > > > Even if we fix the crash issue with vgem, we still need to workaround
> > > > > > > quite a few
> > > > > > > places that has explicitly blocked vgem. A notable example is virglrenderer:
> > > > > > > https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/master/src/vrend_winsys_gbm.c#L121
> > > > > > >
> > > > > > > Actually I have tried to force running virglrenderer on vgem and it
> > > > > > > didn't work. I
> > > > > > > didn't look into why it wasn't working but I guess that's the reason
> > > > > > > for blocking
> > > > > > > vgem in the first place. Virglrenderer works well on vkms with render node
> > > > > > > enabled though.
> > > > > >
> > > > > > Ah ok. For next time around, copy a link to the comment you want, e.g.
> > > > > >
> > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830#note_582477
> > > > > >
> > > > > > The 3 dots menu on each comments has an option to copy that link tag. That
> > > > > > also highlights the right comment.
> > > > >
> > > > > Thanks for the tips! Actually you need to sign in to reveal that 3 dots menu.
> > > > >
> > > > > >
> > > > > > On this issue, I'm concurring with Emil:
> > > > > >
> > > > > > "- the import is broken
> > > > > > "IMHO that should be fixed, regardless of the rest"
> > > > > >
> > > > > > The same should be done here. Unless it's a very special device, we should
> > > > > > be able to import vgem buffers.
> > > > >
> > > > > How about the fact that vgem is blocked explicitly in virglrenderer?
> > > > > We will have
> > > > > to remove it from block list and that may break something that
> > > > > resulted in blocking
> > > > > in this commit:
> > > > > https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/2cb686dd46df27e9600f9df734303ec57bb38772
> > > > > I can't find the reason why it's blocking vgem though. It shouldn't be
> > > > > related to
> > > > > incompatibility with vkms/virtgpu.
> > > > >
> > > > > Are there any concerns that enabling render node on vkms may cause problems?
> > > > > What if we add a driver option to add render node on demand?
> > > >
> > > > The thing is, that none of the other kms-only driver enable render nodes.
> > > > If we start adding them in one case just because userspace can't cope,
> > > > then we'll have an endless stream of these patches.
> > > >
> > > > Instead of fixing userspace.
> > > >
> > > > Note that the issue is very old for at least mesa3d, and the only fix is
> > > > kmsro, where you have to build a driver for each combo. Maybe this should
> > > > be done better, dunno. But adding render node in just vkms for this use
> > > > case really doesn't make much sense to me, and it smells very much like
> > > > opening a can of worms :-/
> > > > -Daniel
> > > >
> > > > > > -Daniel
> > > > > >
> > > > > > >
> > > > > > > > -Daniel
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Yi Xie <yixie@google.com>
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> > > > > > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > > > > index 293dbca50c31..8eea5d4dece8 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > > > > @@ -113,7 +113,7 @@ static void vkms_config_debugfs_init(struct drm_minor *minor)
> > > > > > > > > > >  }
> > > > > > > > > > >
> > > > > > > > > > >  static const struct drm_driver vkms_driver = {
> > > > > > > > > > > -     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> > > > > > > > > > > +     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM | DRIVER_RENDER,
> > > > > > > > > > >       .release                = vkms_release,
> > > > > > > > > > >       .fops                   = &vkms_driver_fops,
> > > > > > > > > > >       DRM_GEM_SHMEM_DRIVER_OPS,
> > > > > > > > > > > --
> > > > > > > > > > > 2.39.0.314.g84b9a713c41-goog
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > Daniel Vetter
> > > > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > > > http://blog.ffwll.ch
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
