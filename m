Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4E11BBDE9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866756E3C6;
	Tue, 28 Apr 2020 12:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1432C6E143
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 02:22:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j2so22809108wrs.9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 19:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cK42YsoCHoKXjpCmRhqXAw95n8cgsE4LeJGPKxc2b6M=;
 b=K+VHeAvkBsC/2rCL59eFVMSyX0fFHJZk4Q/ucDxhSTSYczM4xUtCRtghKPCcsLd+UN
 szR+UTeqNNkyaC+jKd/ipr5t2m/As6aVq0pNQcRm2F3dRquZUa5nez2Xp2b/63U4L9oh
 qAkWvC7qk15CHUwrZPbfXJEpN13tY1PfecFnOaK+ykivFQevR3NQ1S5t0OcNWLDKp1Pw
 zPFv8UsPT/5saCaNHgN7WrYeMx1lX7ncvzXGHDthV1J+GHuItptl5lMkWUVJShxHe7/3
 Zm2DL8ncA9gG0IuxTLuMGzOIHvt4hx15PAiyFjsAPumB4e8vdxV0Vfg+9qGZ/ODrpaBl
 XsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cK42YsoCHoKXjpCmRhqXAw95n8cgsE4LeJGPKxc2b6M=;
 b=J9ovb6bCshh4k6mN5tKI231Oa4mpXxaL95BPOJs2T0MLs2bwi/YC1qvBlZEIe825S9
 wnJ51DJb69NWxI+SlpApx9ZOtsj5lStSVHnzVHeqTTFAOdOsZC9cuaqu0sxWhmaacolY
 prOM+EoS+mxscj5BCKzEdII8les35zF9DT1tqJZXSJQSAdC3Pufp3YeB9pYekMrvXjGy
 uyoJ/Dafy32qE7jwjsNHGvNUUhp4D2Zynbv4AwVGtqGn6L0aS60rWWC7LOIKSvGIbUVc
 uMhv0kYjavzRFl2MlPVggtFJvBe2xfC7RHuLOr9Wt3TyMwFyojbHN6hdcaSJTcQyP50u
 YtFw==
X-Gm-Message-State: AGi0PuYzW1f6DvHg1FzwZAXRLL5g2yCbnk8awaJINF2n5MTMyk7Fw8To
 hJA4jhDBNMrfJTHUF6rn+3wwHdfa+hU0Ut8OLTy0kw==
X-Google-Smtp-Source: APiQypIHQ/3J7TJjBcYUWnzpuJ6FiR+nFMS7ri57Ar8Tuaz+/p1BIMgdJqzao6BPUMxmN432dSplVYvQlg1LV85FXoM=
X-Received: by 2002:adf:eec8:: with SMTP id a8mr29022945wrp.28.1588040534102; 
 Mon, 27 Apr 2020 19:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAMn1gO4NsAoBUN4VFntB+pZK=cVCmwxBGUyipLPYYWFvpH1Z+A@mail.gmail.com>
 <20200427200513.36328-1-pcc@google.com>
 <CADaigPViPMOsHA2FtjL4BJ0YdbYm0L7AKC_tgiRXVrU6Zh5YEA@mail.gmail.com>
In-Reply-To: <CADaigPViPMOsHA2FtjL4BJ0YdbYm0L7AKC_tgiRXVrU6Zh5YEA@mail.gmail.com>
From: Peter Collingbourne <pcc@google.com>
Date: Mon, 27 Apr 2020 19:22:02 -0700
Message-ID: <CAMn1gO4gmH4mAY54mkqQgz1CureRRQ1cVRZrbOx69J7zNeJj2w@mail.gmail.com>
Subject: Re: [PATCH] drm: enable render nodes wherever buffer sharing is
 supported
To: Eric Anholt <eric@anholt.net>
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: Liviu Dudau <Liviu.Dudau@arm.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 27, 2020 at 1:47 PM Eric Anholt <eric@anholt.net> wrote:
>
> On Mon, Apr 27, 2020 at 1:05 PM Peter Collingbourne <pcc@google.com> wrote:
> >
> > Render nodes are not just useful for devices supporting GPU hardware
> > acceleration. Even on devices that only support dumb frame buffers,
> > they are useful in situations where composition (using software
> > rasterization) and KMS are done in different processes with buffer
> > sharing being used to send frame buffers between them. This is the
> > situation on Android, where surfaceflinger is the compositor and the
> > composer HAL uses KMS to display the buffers. Thus it is beneficial
> > to expose render nodes on all devices that support buffer sharing.
> >
> > Because all drivers that currently support render nodes also support
> > buffer sharing, the DRIVER_RENDER flag is no longer necessary to mark
> > devices as supporting render nodes, so remove it and just rely on
> > the presence of a prime_handle_to_fd function pointer to determine
> > whether buffer sharing is supported.
>
> I'm definitely interested in seeing a patch like this land, as I think
> the current state is an ugly historical artifact.  We just have to be
> careful.
>
> Were there any instances of drivers with render engines exposing PRIME
> but not RENDER?  We should be careful to make sure that we're not
> exposing new privileges for those through adding render nodes.

These are the drivers that we'd be adding render nodes for with this change:

$ git grep -l prime_handle_to_fd (git grep -L DRIVER_RENDER (git grep
-l '\.driver_features'))
drivers/gpu/drm/arc/arcpgu_drv.c
drivers/gpu/drm/arm/display/komeda/komeda_kms.c
drivers/gpu/drm/arm/hdlcd_drv.c
drivers/gpu/drm/arm/malidp_drv.c
drivers/gpu/drm/armada/armada_drv.c
drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
drivers/gpu/drm/imx/imx-drm-core.c
drivers/gpu/drm/ingenic/ingenic-drm.c
drivers/gpu/drm/mcde/mcde_drv.c
drivers/gpu/drm/mediatek/mtk_drm_drv.c
drivers/gpu/drm/meson/meson_drv.c
drivers/gpu/drm/mxsfb/mxsfb_drv.c
drivers/gpu/drm/pl111/pl111_drv.c
drivers/gpu/drm/qxl/qxl_drv.c
drivers/gpu/drm/rcar-du/rcar_du_drv.c
drivers/gpu/drm/rockchip/rockchip_drm_drv.c
drivers/gpu/drm/shmobile/shmob_drm_drv.c
drivers/gpu/drm/sti/sti_drv.c
drivers/gpu/drm/stm/drv.c
drivers/gpu/drm/tilcdc/tilcdc_drv.c
drivers/gpu/drm/tve200/tve200_drv.c
drivers/gpu/drm/xen/xen_drm_front.c
drivers/gpu/drm/zte/zx_drm_drv.c

Some of the drivers provide custom ioctls but they are already
protected from render nodes by not setting DRM_RENDER_ALLOW. Another
thing to check for is drivers providing custom fops that might expose
something undesirable in the render node:

$ git grep -L 'DEFINE_DRM_GEM_CMA_FOPS\|DEFINE_DRM_GEM_FOPS' (git grep
-l prime_handle_to_fd (git grep -L DRIVER_RENDER (git grep -l
'\.driver_features')))
drivers/gpu/drm/mediatek/mtk_drm_drv.c
drivers/gpu/drm/rockchip/rockchip_drm_drv.c
drivers/gpu/drm/xen/xen_drm_front.c

But looking at those drivers in detail, I see that each of them is
using the standard DRM fops handlers (which presumably already handle
render nodes correctly) with the exception of mmap, which they provide
wrappers for that mostly just wrap drm_gem_mmap.

So unless I'm missing something significant (which seems likely -- I'm
not a DRM expert), I don't see a problem so far.

> There's a UAPI risk I see here.  Right now, on a system with a single
> renderer GPU, we can just open /dev/dri/renderD128 and get the GPU for
> rendering, and various things are relying on that (such as libwaffle,
> used in piglit among other things)   Adding render nodes for kms-only
> drivers could displace the actual GPU to 129, and the question is
> whether this will be disruptive.  For Mesa, I think this works out,
> because kmsro should load on the kms device's node and then share
> buffers over to the real GPU that it digs around to find at init time.
> Just saying, I'm not sure I know all of the userspace well enough to
> say "this should be safe despite that"
>
> (And, maybe, if we decide that it's not safe enough, we could punt
> kms-only drivers to a higher starting number?)

Android (minigbm) similarly tries to open /dev/dri/renderD$N in a loop
with 128 <= N < 192 and assumes that the first non-blacklisted (i.e.
not vgem) one that it can open corresponds to the real GPU [1]. I
think that the risk of breaking something on Android is low since
Android's architecture basically already depends on there being a
render node, and it seems unlikely for a device to have more than one
GPU, one of which would be non-functional.

It's also worth bearing in mind that render nodes were added to vgem
in commit 3a6eb795 from 2018. To the extent that exposing additional
render nodes would lead to widespread breakage, this would seem to me
to be a likely way in which it could have happened (since I would
expect that it could cause many machines to go from having one render
node to having more than one), so perhaps the argument can be made
that if we hadn't seen widespread breakage as a result of that change,
we'd be unlikely to see it as a result of this one.

This would be conditional on the userspace code not blacklisting the
vgem render node like minigbm does -- at a glance I couldn't find such
code in Mesa (there does appear to be some code that looks for the
vgem driver name, but it seems to only be used on primary nodes, not
render nodes) or libwaffle.

Peter

[1] https://cs.android.com/android/platform/superproject/+/master:external/minigbm/cros_gralloc/cros_gralloc_driver.cc;l=48
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
