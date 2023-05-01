Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E4F6F39A7
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 23:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F0D10E06E;
	Mon,  1 May 2023 21:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD2B10E06E;
 Mon,  1 May 2023 21:21:44 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-38eb2984c82so1016510b6e.0; 
 Mon, 01 May 2023 14:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682976103; x=1685568103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iYCvJyHwJ7Jrvd5HvP1eMkY5iGf+7NPyx1F37wokDL8=;
 b=K28042v0bGvgx1XMRNO4hc7JPviz6ncAnezVb1cXc9RO3acwErIMSdWwFwnS/InEp4
 swnbZ3Jhg7slwdVnSWQ/6OC4SWSH515RnIfBWl7lBhyUI7tDdopAW2nMVEqP+RJ8THdy
 EVdluqUXNJBjw1MpRsKhEoB3G1UAVfX8lDyu2cTK9RPCDUD6zCfxVM/H0RPOFJWCVkEB
 t32eBt+c7zyGcmKYt7BSnJhzPCMAEIkwVtvgfHcFYnFfZbbu3Oa33oOuSSGOXBrNpTVz
 3x37mJ7DgfxRTFbs5mM1sYtF45oBG9KrYjp3pK3gMCsKmPAQAleXVSmssVQ/1pt1q12u
 BZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682976103; x=1685568103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iYCvJyHwJ7Jrvd5HvP1eMkY5iGf+7NPyx1F37wokDL8=;
 b=CtstOT3S02H+eedKg+Zwgx4Ju+PGcnHPkSf6cenHF39+M67bYF5+auD1It6VVDtvhH
 H7gDYbuCB8yuz43ZkO3qDnbqhYDnBhJL53kRd3XY4TicPEjCpd+p2uAoRmyffFDqx8GR
 riey5hpbGZCW3rnpy4t4CkB777MwqDVVr1c56MR2yf8zus3DYmb7/+uInTm3g25Q8Hb9
 gUtLzfffAWRdyF76M+vH3VYyZvywvjDXvCgjRreyly5qWZG4D8RWH69s3lbi61ga4rIJ
 wqai57S4Dp9BLkJmG/bfFPO/8iYgPFAQ9ik48USKEhUtcl8uYWr7JKw8GbZ2KpRfWDVs
 wQIg==
X-Gm-Message-State: AC+VfDx99t3+YozF0efytoid9yt/lcHBhr53cBkHL43hSsWsdiT+iYcN
 yE0aw0ooJEQs0zQ1FLnacJmDmy2JFnDF4jTX6Uw=
X-Google-Smtp-Source: ACHHUZ4RXGpo/62/QiKBWe5vbuSoBEDQVCyJay7yq3KEWZg0v5pnDukR0Op8YtznZzwV+8vH33vYe5oN00qu43mEEBk=
X-Received: by 2002:a05:6808:4d:b0:387:1e2a:fed2 with SMTP id
 v13-20020a056808004d00b003871e2afed2mr6453049oic.49.1682976103392; Mon, 01
 May 2023 14:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230501204441.1642741-1-robdclark@gmail.com>
 <f2b7e6cf-d747-efb8-820c-41e4eef6cbb3@linaro.org>
In-Reply-To: <f2b7e6cf-d747-efb8-820c-41e4eef6cbb3@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 1 May 2023 14:21:31 -0700
Message-ID: <CAF6AEGvXu_JHyfwmD+VL=iF5OcP=C-n0jsqd6sXM=Fa4KMQAgg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Set max segment size earlier
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 1, 2023 at 1:56=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 01/05/2023 23:44, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Fixes the following splat on a6xx gen2+ (a640, a650, a660 families),
> > a6xx gen1 has smaller GMU allocations so they fit under the default
> > 64K max segment size.
> >
> >     ------------[ cut here ]------------
> >     DMA-API: msm_dpu ae01000.display-controller: mapping sg segment lon=
ger than device claims to support [len=3D126976] [max=3D65536]
> >     WARNING: CPU: 5 PID: 9 at kernel/dma/debug.c:1160 debug_dma_map_sg+=
0x288/0x314
> >     Modules linked in:
> >     CPU: 5 PID: 9 Comm: kworker/u16:0 Not tainted 6.3.0-rc2-debug+ #629
> >     Hardware name: Google Villager (rev1+) with LTE (DT)
> >     Workqueue: events_unbound deferred_probe_work_func
> >     pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> >     pc : debug_dma_map_sg+0x288/0x314
> >     lr : debug_dma_map_sg+0x288/0x314
> >     sp : ffffffc00809b560
> >     x29: ffffffc00809b560 x28: 0000000000000060 x27: 0000000000000000
> >     x26: 0000000000010000 x25: 0000000000000004 x24: 0000000000000004
> >     x23: ffffffffffffffff x22: ffffffdb31693cc0 x21: ffffff8080935800
> >     x20: ffffff8087417400 x19: ffffff8087a45010 x18: 0000000000000000
> >     x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000010000
> >     x14: 0000000000000001 x13: ffffffffffffffff x12: ffffffffffffffff
> >     x11: 0000000000000000 x10: 000000000000000a x9 : ffffffdb2ff05e14
> >     x8 : ffffffdb31275000 x7 : ffffffdb2ff08908 x6 : 0000000000000000
> >     x5 : 0000000000000001 x4 : ffffffdb2ff08a74 x3 : ffffffdb31275008
> >     x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff80803a9a80
> >     Call trace:
> >      debug_dma_map_sg+0x288/0x314
> >      __dma_map_sg_attrs+0x80/0xe4
> >      dma_map_sgtable+0x30/0x4c
> >      get_pages+0x1d4/0x1e4
> >      msm_gem_pin_pages_locked+0xbc/0xf8
> >      msm_gem_pin_vma_locked+0x58/0xa0
> >      msm_gem_get_and_pin_iova_range+0x98/0xac
> >      a6xx_gmu_memory_alloc+0x7c/0x128
> >      a6xx_gmu_init+0x16c/0x9b0
> >      a6xx_gpu_init+0x38c/0x3e4
> >      adreno_bind+0x214/0x264
> >      component_bind_all+0x128/0x1f8
> >      msm_drm_bind+0x2b8/0x608
> >      try_to_bring_up_aggregate_device+0x88/0x1a4
> >      __component_add+0xec/0x13c
> >      component_add+0x1c/0x28
> >      dp_display_probe+0x3f8/0x43c
> >      platform_probe+0x70/0xc4
> >      really_probe+0x148/0x280
> >      __driver_probe_device+0xc8/0xe0
> >      driver_probe_device+0x44/0x100
> >      __device_attach_driver+0x64/0xdc
> >      bus_for_each_drv+0xb0/0xd8
> >      __device_attach+0xd8/0x168
> >      device_initial_probe+0x1c/0x28
> >      bus_probe_device+0x44/0xb0
> >      deferred_probe_work_func+0xc8/0xe0
> >      process_one_work+0x2e0/0x488
> >      process_scheduled_works+0x4c/0x50
> >      worker_thread+0x218/0x274
> >      kthread+0xf0/0x100
> >      ret_from_fork+0x10/0x20
> >     irq event stamp: 293712
> >     hardirqs last  enabled at (293711): [<ffffffdb2ff0893c>] vprintk_em=
it+0x160/0x25c
> >     hardirqs last disabled at (293712): [<ffffffdb30b48130>] el1_dbg+0x=
24/0x80
> >     softirqs last  enabled at (279520): [<ffffffdb2fe10420>] __do_softi=
rq+0x21c/0x4bc
> >     softirqs last disabled at (279515): [<ffffffdb2fe16708>] ____do_sof=
tirq+0x18/0x24
> >     ---[ end trace 0000000000000000 ]---
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> I think this should be:
>
> Fixes: db735fc4036b ("drm/msm: Set dma maximum segment size for mdss")

yeah, or perhaps just that commit didn't fix the issue hard enough.. I
was thinking that it was introduced by memory allocations out of
hw_init() but actually this has been here the whole time (on newer
a6xx gens).  There was an internal bug about it, but somehow it didn't
get routed to me.

BR,
-R

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> > ---
> >   drivers/gpu/drm/msm/msm_drv.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index 3a74b5653e96..6dec1a3534f2 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -440,27 +440,27 @@ static int msm_drm_init(struct device *dev, const=
 struct drm_driver *drv)
> >       fs_reclaim_acquire(GFP_KERNEL);
> >       might_lock(&priv->lru.lock);
> >       fs_reclaim_release(GFP_KERNEL);
> >
> >       drm_mode_config_init(ddev);
> >
> >       ret =3D msm_init_vram(ddev);
> >       if (ret)
> >               goto err_drm_dev_put;
> >
> > +     dma_set_max_seg_size(dev, UINT_MAX);
> > +
> >       /* Bind all our sub-components: */
> >       ret =3D component_bind_all(dev, ddev);
> >       if (ret)
> >               goto err_drm_dev_put;
> >
> > -     dma_set_max_seg_size(dev, UINT_MAX);
> > -
> >       msm_gem_shrinker_init(ddev);
> >
> >       if (priv->kms_init) {
> >               ret =3D priv->kms_init(ddev);
> >               if (ret) {
> >                       DRM_DEV_ERROR(dev, "failed to load kms\n");
> >                       priv->kms =3D NULL;
> >                       goto err_msm_uninit;
> >               }
> >               kms =3D priv->kms;
>
> --
> With best wishes
> Dmitry
>
