Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18663BCE9E7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 23:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE2810E0DA;
	Fri, 10 Oct 2025 21:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D+k1bZ0n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA4B10E0DA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 21:32:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B3162453DA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 21:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922B5C4CEF1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 21:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760131956;
 bh=ArWUSUq8CsQ/P/wD4tX39L5zyuywg/oQR6eI4rbEtmI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D+k1bZ0nFqoniRZZ+cDYGVVwQJSSy2z/JrK/z6/A7hVSAsrXW0duSCsltU23Yg2ox
 6SkyJy/SU+k7H2VzNq0CmoJFIeLMTxcl0hD7nMoGrQkLRgIr7aPD5FGq16/o6Ht+2M
 7hZ5lwpJ9Bmpz4vgpnSPsEU8o0t8Wc79RUkdxL0nKj4DBi+vMe+g+nIcPBXzdc9J7k
 ciL7Y41kYOXqgP3o+Y6+zBvNaiS1cEMOBicz65koAf9KRrp/97Ey9HxQVzeZrCn8B1
 A2rmouo8i/q/7zPaIanIE6cSFiB5w48QCU00UKIU01kJ6xxZwdHd24ICxT6bFcgKss
 dLm0CZ51xQbqQ==
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b3d80891c6cso540872566b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 14:32:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV+nhpdUQqVVtXzZEaKivh9hXCoON8gdnKEvZhWX/jc5ggZFwxbels6YOufVZkzaAf2brFRoaA4M7s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBGiplaEDqnEsz6ksI6pbM4QcZzwWUwQG5R42vPJOegKucB3me
 eAW1KZYNgogJQ1Nqyri+2feTeWH39HCLfdOyCKKGQhNo1hF5QVv84K5pd0BOclOF4YQRNDNPLJ5
 wQp6+MtQJlIz2zineMKQZe15tEEHR6A==
X-Google-Smtp-Source: AGHT+IFexy1+T7e90A8g4k3s8jVRhUi34qlbue4tmM9kxCqG5lFhj6gYrjvGeC3ntN1XjkQ1Jf8fwLukEaWkt/6kFwE=
X-Received: by 2002:a17:906:6a16:b0:b23:20e7:b480 with SMTP id
 a640c23a62f3a-b50bedbf4f1mr1683334766b.18.1760131955101; Fri, 10 Oct 2025
 14:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250926-ethos-v3-0-6bd24373e4f5@kernel.org>
 <20250926-ethos-v3-2-6bd24373e4f5@kernel.org>
 <aNrce2up6ZxzMJpo@lizhi-Precision-Tower-5810>
In-Reply-To: <aNrce2up6ZxzMJpo@lizhi-Precision-Tower-5810>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Oct 2025 16:32:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLbBKyWsMgq0-rooQd5LvxMjPkNtcYvff2fDoCoDxDoOA@mail.gmail.com>
X-Gm-Features: AS18NWB70VVslCF2YO6NXRIQZkN1Oi2H4qa3p8YK7r-F05r60yMYia5RgwxjdvU
Message-ID: <CAL_JsqLbBKyWsMgq0-rooQd5LvxMjPkNtcYvff2fDoCoDxDoOA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] accel: Add Arm Ethos-U NPU driver
To: Frank Li <Frank.li@nxp.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 29, 2025 at 2:22=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Sep 26, 2025 at 03:00:49PM -0500, Rob Herring (Arm) wrote:
> > Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
> > relatively simple interface with single command stream to describe
> > buffers, operation settings, and network operations. It supports up to =
8
> > memory regions (though no h/w bounds on a region). The Ethos NPUs
> > are designed to use an SRAM for scratch memory. Region 2 is reserved
> > for SRAM (like the downstream driver stack and compiler). Userspace
> > doesn't need access to the SRAM.
> >

> ...
> > +
> > +static int ethosu_init(struct ethosu_device *ethosudev)
> > +{
> > +     int ret;
> > +     u32 id, config;
> > +
> > +     ret =3D devm_pm_runtime_enable(ethosudev->base.dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D pm_runtime_resume_and_get(ethosudev->base.dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
> > +     pm_runtime_use_autosuspend(ethosudev->base.dev);
>
> pm_runtime_use_autosuspend() should be after last register read
> readl_relaxed(ethosudev->regs + NPU_REG_CONFIG);
>
> incase schedule happen between pm_runtime_use_autosuspend(ethosudev->base=
.dev);
> and readl().

All the call does is enable autosuspend. I don't think it matters
exactly when we enable it. We already did a get preventing autosuspend
until we do a put.

> > +     /* If PM is disabled, we need to call ethosu_device_resume() manu=
ally. */
> > +     if (!IS_ENABLED(CONFIG_PM)) {
> > +             ret =3D ethosu_device_resume(ethosudev->base.dev);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ethosudev->npu_info.id =3D id =3D readl_relaxed(ethosudev->regs +=
 NPU_REG_ID);
> > +     ethosudev->npu_info.config =3D config =3D readl_relaxed(ethosudev=
->regs + NPU_REG_CONFIG);


> ...
> > +
> > +/**
> > + * ethosu_gem_create_with_handle() - Create a GEM object and attach it=
 to a handle.
> > + * @file: DRM file.
> > + * @ddev: DRM device.
> > + * @size: Size of the GEM object to allocate.
> > + * @flags: Combination of drm_ethosu_bo_flags flags.
> > + * @handle: Pointer holding the handle pointing to the new GEM object.
> > + *
> > + * Return: Zero on success
> > + */
> > +int ethosu_gem_create_with_handle(struct drm_file *file,
> > +                              struct drm_device *ddev,
> > +                              u64 *size, u32 flags, u32 *handle)
> > +{
> > +     int ret;
> > +     struct drm_gem_dma_object *mem;
> > +     struct ethosu_gem_object *bo;
>
> move 'ret' here to keep reverise christmas tree order.

Is that the order DRM likes? It's got to be the dumbest coding standard we =
have.

> > +
> > +     mem =3D drm_gem_dma_create(ddev, *size);
> > +     if (IS_ERR(mem))
> > +             return PTR_ERR(mem);
> > +
> > +     bo =3D to_ethosu_bo(&mem->base);
> > +     bo->flags =3D flags;
> > +
> > +     /*
> > +      * Allocate an id of idr table where the obj is registered
> > +      * and handle has the id what user can see.
> > +      */
> > +     ret =3D drm_gem_handle_create(file, &mem->base, handle);
> > +     if (!ret)
> > +             *size =3D bo->base.base.size;
> > +
> > +     /* drop reference from allocate - handle holds it now. */
> > +     drm_gem_object_put(&mem->base);
> > +
> > +     return ret;
> > +}
> > +
> ...
> > +
> > +static void cmd_state_init(struct cmd_state *st)
> > +{
> > +     /* Initialize to all 1s to detect missing setup */
> > +     memset(st, 0xff, sizeof(*st));
> > +}
> > +
> > +static u64 cmd_to_addr(u32 *cmd)
> > +{
> > +     return ((u64)((cmd[0] & 0xff0000) << 16)) | cmd[1];
>
> will FIELD_PREP helpful?

Like this?:

return ((u64)FIELD_PREP(GENMASK(23, 16), cmd[0]) << 32) | cmd[1];

Questionable to me if that's better...

>
> > +}
> > +
> > +static u64 dma_length(struct ethosu_validated_cmdstream_info *info,
> > +                   struct dma_state *dma_st, struct dma *dma)
> > +{
> > +     s8 mode =3D dma_st->mode;
> > +     u64 len =3D dma->len;
> > +
> > +     if (mode >=3D 1) {
> > +             len +=3D dma->stride[0];
> > +             len *=3D dma_st->size0;
> > +     }
> > +     if (mode =3D=3D 2) {
> > +             len +=3D dma->stride[1];
> > +             len *=3D dma_st->size1;
> > +     }
> > +     if (dma->region >=3D 0)
> > +             info->region_size[dma->region] =3D max(info->region_size[=
dma->region],
> > +                                                  len + dma->offset);
> > +
> > +     return len;
> > +}
> > +
> ...
>
> > +
> > +static void ethosu_job_handle_irq(struct ethosu_device *dev)
> > +{
> > +     u32 status;
> > +
> > +     pm_runtime_mark_last_busy(dev->base.dev);
>
> I think don't need pm_runtime_mark_last_busy() here because
> pm_runtime_put_autosuspend() already call pm_runtime_mark_last_busy().
>
> only mark last busy without pm_runtime_put() can't affect run time pm
> state, still in active state.

Yes, agreed. Copied from rocket, so Tomeu, you may want to look at that.

>
> > +
> > +     status =3D readl_relaxed(dev->regs + NPU_REG_STATUS);
> > +
> > +     if (status & (STATUS_BUS_STATUS | STATUS_CMD_PARSE_ERR)) {
> > +             dev_err(dev->base.dev, "Error IRQ - %x\n", status);
> > +             drm_sched_fault(&dev->sched);
> > +             return;
> > +     }
> > +
> > +     scoped_guard(mutex, &dev->job_lock) {
> > +             if (dev->in_flight_job) {
> > +                     dma_fence_signal(dev->in_flight_job->done_fence);
> > +                     pm_runtime_put_autosuspend(dev->base.dev);
> > +                     dev->in_flight_job =3D NULL;
> > +             }
> > +     }
> > +}
> > +
> ...
> > +
> > +int ethosu_job_init(struct ethosu_device *dev)
> > +{
> > +     struct drm_sched_init_args args =3D {
> > +             .ops =3D &ethosu_sched_ops,
> > +             .num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> > +             .credit_limit =3D 1,
> > +             .timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS),
> > +             .name =3D dev_name(dev->base.dev),
> > +             .dev =3D dev->base.dev,
> > +     };
> > +     int ret;
> > +
> > +     spin_lock_init(&dev->fence_lock);
> > +     mutex_init(&dev->job_lock);
> > +     mutex_init(&dev->sched_lock);
>
> now perfer use dev_mutex_init().

$ git grep dev_mutex_init
(END)

Huh??
