Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316D5BCAF43
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 23:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393EF10EB27;
	Thu,  9 Oct 2025 21:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l5e+9iO6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D2110EB23
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 21:40:25 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-33255011eafso1563606a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 14:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760046025; x=1760650825; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fsXu8E/zxrsszSMAnsLE4IzVi2sOh4hhreBruYhjhZ0=;
 b=l5e+9iO6XCmA9//pBjQBXPOjqIYPOlk87cVvGEygzmARUcAoiRUS3t3+dhzFRG00tf
 c+nEas5z6GMJGYZ9050IMCZMerL2V2UiIZUCagPOPBrOQh4eNb1vudAqWq3iU6yKngZV
 K3s7wfp2CDE3JK75me7Bbz9MjSdAuHPrC1AyYW26vtMS84dOjRwlRBM+cg76b5qEB8iU
 hNDB4gJ54c826OTAzdYewh4DC/l/nky4XXPmmn4VNUsv8aSvsKPqX8i2GAnB6PVM6P+m
 s28jMkb4lCBS9P7jYsS63AJBTswKfYbxhJw18x07lnAysLHFkM4HQSNRXU568o6mO5n5
 8EKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760046025; x=1760650825;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fsXu8E/zxrsszSMAnsLE4IzVi2sOh4hhreBruYhjhZ0=;
 b=am3t6cCosroKvoWxfHJoNlyzdLOHhnTMYi7wMk+13CFeyiR/tFnq9vOlGdwEjZT2xq
 32d9Ov06vV/6TaHSO4P02hyBKLGFGnwQNomuUBz3Hsmj5uH/M32EXxXv0dzJnlUi4bYP
 jiuRhq0L2QfjzlASVZUa7nD/N0xy4ruwE5oazsUJn4FPff+iho1DGvgNX6+PKi+iS965
 9T/6x8uFRsH1H4XJFFCExXtskxESjUvWw6VraaXcAupjpeOCoZJElylG14oguqHDgjL8
 fqvQwRCg36VMOlkXJat27rVpwIUzohMWrszOpZhn+Duz0VEeiVP7LqYDi4NSX+UB7Fxd
 QbOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+YmsEV8aXmzn4OfE6dc5wzZ9a9SkFwLrpkQXBIgaumlrfA3M5xXMpPK9M9pv8Z57DbqUleQ1Hm08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQg7/zTy9oM+bVHtzXdKmsD4xaCMPptWmVfBT6GnRJdsUJQ//c
 eyL7wCxj4EAVs9LzA6fonL77gyDaWRXaHFD2HUAMLFidIFheg0tt6Egvl8XTEpsVBWAg1Qv1Egh
 p/Cqc9HXuupo3d2cb4tIP33kISXjl4Y0=
X-Gm-Gg: ASbGnctVp6/Fg1DSFWDjz8vTvaVBz0QHWXUkvG4kZaeECNvVWNL8lOgkU5g8J/t2iqc
 A7avUTZFEb9c7e3sdmYrv0o6Lhfnyz0cI2uSQExh96bbuugzXM8+ngqN8PnUaLa+0Jx1NtG+XmS
 kaLhCkEas517AUrqXolNiuYbDGVNeAlUS7P3LRaQM5dwS6xxVhLWIyNht/WJ2CV8wDDHIibS1SU
 teOE7mjCSw7Ud7z+JRsBat9kbUZRqG/nrggJilp
X-Google-Smtp-Source: AGHT+IFuyysCgeoHc2eKdp7pwqyz/aMmKl6mTh26Ym/Ip0FadeQSceFpDgODfzO48H+nrSERpahgmUbRxjCJkCGIcOc=
X-Received: by 2002:a17:90b:4f4e:b0:338:3789:6c60 with SMTP id
 98e67ed59e1d1-33b513eb6a6mr11782833a91.36.1760046024882; Thu, 09 Oct 2025
 14:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250618204400.21808-1-gert.wollny@collabora.com>
 <20250630202703.13844-1-gert.wollny@collabora.com>
 <20250630202703.13844-5-gert.wollny@collabora.com>
In-Reply-To: <20250630202703.13844-5-gert.wollny@collabora.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 9 Oct 2025 23:40:13 +0200
X-Gm-Features: AS18NWCcLXKq5DI12bX6G3B_1m5n8NJHUooi5c2xo-HfW6-Q8wPaQrSFbb-e5Sw
Message-ID: <CAH9NwWdNabvh+FJATuD=0KxHvQv77OuYpLgd5iQAcSNNPbS4ew@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm/etnaviv: Add PPU flop reset
To: Gert Wollny <gert.wollny@collabora.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gert,

>
> The PPU flop reset is required on some hardware to clear the
> temporary registers. This code follows the implementation
> of the PPU flop reset as found in the public galcore kernel
> module. Compared to that code some superfluous parts were
> removed and only the code path for SoC chip_model = 0x8000
> and revision = 0x6205 is implemented and tested.
>
> v2: - Move flop reset data to etnaviv_drm_private and initialize it
>       from etnaviv_gpu_bind (Lucas)
>     - Prepare code for more chip IDs and other flop reset types
>     - Do some cleanups and rename some functions
>
> v3: - Move initialization of flop reset data to etnaviv_gpu_init (Lucas)
>     - Free PPU data suballocation (Lucas)
>
> Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
> ---
>  drivers/gpu/drm/etnaviv/Makefile             |   1 +
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |   6 +
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c        |   3 +
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h        |   3 +
>  drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c | 206 +++++++++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h |  25 +++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c        |   5 +
>  7 files changed, 249 insertions(+)
>  create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
>  create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
>
> diff --git a/drivers/gpu/drm/etnaviv/Makefile b/drivers/gpu/drm/etnaviv/Makefile
> index 46e5ffad69a6..903101e8751a 100644
> --- a/drivers/gpu/drm/etnaviv/Makefile
> +++ b/drivers/gpu/drm/etnaviv/Makefile
> @@ -14,6 +14,7 @@ etnaviv-y := \
>         etnaviv_iommu.o \
>         etnaviv_mmu.o \
>         etnaviv_perfmon.o \
> +       etnaviv_flop_reset.o \
>         etnaviv_sched.o
>
>  obj-$(CONFIG_DRM_ETNAVIV)      += etnaviv.o
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> index 9e007d977efe..a2da3212592f 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> @@ -18,6 +18,8 @@
>  #include "state_3d.xml.h"
>  #include "cmdstream.xml.h"
>
> +#include "etnaviv_flop_reset.h"
> +
>  static void etnaviv_cmd_select_pipe(struct etnaviv_gpu *gpu,
>         struct etnaviv_cmdbuf *buffer, u8 pipe)
>  {
> @@ -100,6 +102,10 @@ u16 etnaviv_buffer_init(struct etnaviv_gpu *gpu)
>         /* initialize buffer */
>         buffer->user_size = 0;
>
> +       /* Queue in PPU flop reset */
> +       if (etnaviv_flop_reset_ppu_require(&gpu->identity))
> +               etnaviv_flop_reset_ppu_run(gpu);
> +
>         CMD_WAIT(buffer, gpu->fe_waitcycles);
>         CMD_LINK(buffer, 2,
>                  etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 3e91747ed339..0e916e6785c8 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -600,6 +600,9 @@ static void etnaviv_unbind(struct device *dev)
>
>         component_unbind_all(dev, drm);
>
> +       etnaviv_cmdbuf_free(priv->flop_reset_data_ppu);
> +       kfree(priv->flop_reset_data_ppu);
> +
>         etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
>
>         xa_destroy(&priv->active_contexts);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> index b3eb1662e90c..20dad16fd554 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -48,6 +48,9 @@ struct etnaviv_drm_private {
>         /* list of GEM objects: */
>         struct mutex gem_lock;
>         struct list_head gem_list;
> +
> +       /* ppu flop reset data */
> +       struct etnaviv_cmdbuf *flop_reset_data_ppu;
>  };
>
>  int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
> new file mode 100644
> index 000000000000..138af3c33b5d
> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
> @@ -0,0 +1,206 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Etnaviv Project
> + */
> +
> +#include "asm-generic/int-ll64.h"

I think you want to use #include <linux/types.h>


> +#include "etnaviv_buffer.h"
> +#include "etnaviv_cmdbuf.h"
> +#include "state_3d.xml.h"
> +
> +#include "etnaviv_flop_reset.h"
> +
> +enum etnaviv_flop_reset_type {
> +       flop_reset_ppu = 1 << 0,
> +       flop_reset_nn = 1 << 1,
> +       flop_reset_tp = 1 << 2
> +};

As this patch series only adds support for flop_reset_ppu I think we should
drop this enum for now.

> +
> +#define PPU_IMAGE_STRIDE 64
> +#define PPU_IMAGE_XSIZE 64
> +#define PPU_IMAGE_YSIZE 6
> +
> +#define PPU_FLOP_RESET_INSTR_DWORD_COUNT 16
> +
> +static void
> +etnaviv_emit_flop_reset_state_ppu(struct etnaviv_cmdbuf *cmdbuf,

Return type on separate line is unusual in kernel code - found in
multiple places.


> +                                 u32 buffer_base,
> +                                 u32 input_offset,
> +                                 u32 output_offset,
> +                                 u32 shader_offset,
> +                                 u32 shader_size,
> +                                 u32 shader_register_count)
> +{
> +       CMD_LOAD_STATE(cmdbuf, VIVS_GL_API_MODE,
> +                              VIVS_GL_API_MODE_OPENCL);
> +       CMD_SEM(cmdbuf, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
> +       CMD_STALL(cmdbuf, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
> +
> +       CMD_LOAD_STATES_START(cmdbuf, VIVS_SH_HALTI5_UNIFORMS(0), 4);
> +
> +       OUT(cmdbuf, buffer_base + input_offset);
> +       OUT(cmdbuf, PPU_IMAGE_STRIDE);
> +       OUT(cmdbuf, PPU_IMAGE_XSIZE | (PPU_IMAGE_YSIZE  << 16));
> +       OUT(cmdbuf, 0x444051f0);
> +       OUT(cmdbuf, 0xffffffff);
> +
> +       CMD_LOAD_STATES_START(cmdbuf, VIVS_SH_HALTI5_UNIFORMS(4), 4);
> +       OUT(cmdbuf, buffer_base + output_offset);
> +       OUT(cmdbuf, PPU_IMAGE_STRIDE);
> +       OUT(cmdbuf, PPU_IMAGE_XSIZE | (PPU_IMAGE_YSIZE  << 16));
> +       OUT(cmdbuf, 0x444051f0);
> +       OUT(cmdbuf, 0xffffffff);
> +
> +       CMD_LOAD_STATE(cmdbuf, VIVS_CL_CONFIG,
> +                              VIVS_CL_CONFIG_DIMENSIONS(2) |
> +                              VIVS_CL_CONFIG_VALUE_ORDER(3));
> +       CMD_LOAD_STATE(cmdbuf, VIVS_VS_ICACHE_INVALIDATE, 0x1f);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_VARYING_NUM_COMPONENTS(0), 0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_TEMP_REGISTER_CONTROL,
> +                              shader_register_count);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_SAMPLER_BASE, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_UNIFORM_BASE, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_NEWRANGE_LOW, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_NEWRANGE_HIGH,
> +                              shader_size / 16);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_INST_ADDR,
> +                              buffer_base + shader_offset);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_SH_CONFIG,
> +                              VIVS_SH_CONFIG_RTNE_ROUNDING);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_VS_ICACHE_CONTROL,
> +                              VIVS_VS_ICACHE_CONTROL_ENABLE);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_ICACHE_COUNT,
> +                              shader_size / 16 - 1);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_INPUT_COUNT, 0x1f01);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_VS_HALTI5_UNK008A0, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PA_VS_OUTPUT_COUNT, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_GL_VARYING_TOTAL_COMPONENTS, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_CONTROL_EXT, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_VS_OUTPUT_COUNT, 0x1);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_GL_HALTI5_SH_SPECIALS, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_ICACHE_PREFETCH, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_CL_UNK00924, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_CL_THREAD_ALLOCATION, 0x1);
> +
> +       CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_WORK_OFFSET_X, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_WORK_OFFSET_Y, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_WORK_OFFSET_Z, 0x0);
> +
> +       CMD_LOAD_STATES_START(cmdbuf, VIVS_CL_WORKGROUP_COUNT_X, 9);
> +       OUT(cmdbuf, 0xf);
> +       OUT(cmdbuf, 0x5);
> +       OUT(cmdbuf, 0xffffffff);
> +       OUT(cmdbuf, 0x0);
> +       OUT(cmdbuf, 0x0);
> +       OUT(cmdbuf, 0x3ff);
> +       OUT(cmdbuf, 0x0);
> +       OUT(cmdbuf, 0x4);
> +       OUT(cmdbuf, 0x1);
> +       OUT(cmdbuf, 0x0);
> +
> +       CMD_LOAD_STATE(cmdbuf, VIVS_CL_KICKER, 0xbadabeeb);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_GL_FLUSH_CACHE,
> +                              VIVS_GL_FLUSH_CACHE_SHADER_L1 |
> +                              VIVS_GL_FLUSH_CACHE_UNK10 |
> +                              VIVS_GL_FLUSH_CACHE_UNK11);
> +}
> +
> +static void
> +etnaviv_flop_reset_ppu_fill_input(u32 *buffer, u32 size)
> +{
> +       for (int i = 0; i < size/4; ++i, ++buffer)
> +               *buffer = 0x01010101;

Maybe just use memset32(..)?

> +}
> +
> +static void
> +etnaviv_flop_reset_ppu_set_shader(u8 *dest)
> +{
> +       const u32 inst[PPU_FLOP_RESET_INSTR_DWORD_COUNT] = {

static const

> +               /* img_load.u8 r1, c0, r0.xy */
> +               0x78011779, 0x39000804, 0x00A90050, 0x00000000,
> +               /* img_load.u8 r2, c0, r0.xy */
> +               0x78021779, 0x39000804, 0x00A90050, 0x00000000,
> +               /* dp2x8 r1, r1, r2, c3_512 */
> +               0xB8017145, 0x390018FC, 0x01C90140, 0x40390028,
> +               /* img_store.u8 r1, c2, r0.xy, r1 */
> +               0x380007BA, 0x39001804, 0x00A90050, 0x00390018,
> +       };
> +       memcpy(dest, inst, sizeof(inst));
> +}
> +
> +static struct etnaviv_flop_reset_entry {

static const

> +       u16 chip_model;
> +       u16 revision;
> +       u32 flags;
> +} etnaviv_flop_reset_db [] = {
> +       {
> +               .chip_model = 0x8000,
> +               .revision = 0x6205,
> +               .flags = flop_reset_ppu
> +       },
> +};
> +
> +bool
> +etnaviv_flop_reset_ppu_require(const struct etnaviv_chip_identity *chip_id)
> +{
> +       const struct etnaviv_flop_reset_entry *e = etnaviv_flop_reset_db;
> +
> +       for (int i = 0; i < ARRAY_SIZE(etnaviv_flop_reset_db); ++i, ++e) {
> +               if (chip_id->model == e->chip_model &&
> +                   chip_id->revision == e->revision)
> +                       return (e->flags & flop_reset_ppu) != 0;
> +       }
> +
> +       return false;
> +}
> +
> +static const u32 image_data_size = PPU_IMAGE_STRIDE * PPU_IMAGE_YSIZE;
> +static const u32 output_offset = ALIGN(image_data_size, 64);
> +static const u32 shader_offset = ALIGN(output_offset + image_data_size, 64);
> +static const u32 shader_size = PPU_FLOP_RESET_INSTR_DWORD_COUNT * sizeof(u32);
> +static const u32 shader_register_count = 3;
> +static const u32 buffer_size = shader_offset + shader_size;
> +
> +void
I think we need to return an error here - so let's go with an int.

> +etnaviv_flop_reset_ppu_init(struct etnaviv_drm_private *priv)
> +{
> +       /* Get some space from the rung buffer to put the payload
> +        * (input and output image, and shader), we keep this buffer
> +        * for the whole life time the driver is bound
> +        */
> +       priv->flop_reset_data_ppu =
> +         kzalloc(sizeof(*priv->flop_reset_data_ppu), GFP_KERNEL);
> +

Missing NULL check for priv->flop_reset_data_ppu.

> +       etnaviv_cmdbuf_init(priv->cmdbuf_suballoc,
> +                           priv->flop_reset_data_ppu, buffer_size);
> +

etnaviv_cmdbuf_init can fail too.


> +       void *buffer_base = priv->flop_reset_data_ppu->vaddr;
> +
> +       u32 *input_data = (u32 *)buffer_base;
> +       etnaviv_flop_reset_ppu_fill_input(input_data, image_data_size);
> +
> +       u8 *shader_data = (u8 *)buffer_base + shader_offset;
> +       etnaviv_flop_reset_ppu_set_shader(shader_data);
> +}
> +
> +void
> +etnaviv_flop_reset_ppu_run(struct etnaviv_gpu *gpu)
> +{
> +       struct etnaviv_drm_private *priv = gpu->drm->dev_private;
> +
> +       if (!priv->flop_reset_data_ppu) {
> +               pr_err("Flop reset data was not initialized, skipping\n");

dev_err(gpu->dev, "Flop reset data was not initialized, skipping\n");


> +               return;
> +       }

How can this happen?

> +
> +       u32 buffer_base = etnaviv_cmdbuf_get_va(priv->flop_reset_data_ppu,
> +                                               &gpu->mmu_context->cmdbuf_mapping);
> +
> +       etnaviv_emit_flop_reset_state_ppu(&gpu->buffer,
> +                                         buffer_base,
> +                                         0,
> +                                         output_offset,
> +                                         shader_offset,
> +                                         shader_size,
> +                                         shader_register_count);
> +}
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
> new file mode 100644
> index 000000000000..f51cece75507
> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Etnaviv Project
> + */
> +
> +
> +#ifndef etnaviv_flop_reset_h
> +#define etnaviv_flop_reset_h

To keep the style consistent: __ETNAVIV_FLOP_RESET_H__

> +
> +#include <linux/types.h>
> +
> +struct etnaviv_chip_identity;
> +struct etnaviv_drm_private;
> +struct etnaviv_gpu;
> +
> +bool
> +etnaviv_flop_reset_ppu_require(const struct etnaviv_chip_identity *chip_id);
> +
> +void
> +etnaviv_flop_reset_ppu_init(struct etnaviv_drm_private *priv);
> +
> +void
> +etnaviv_flop_reset_ppu_run(struct etnaviv_gpu *gpu);
> +
> +#endif
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index cf0d9049bcf1..0aac01c1021c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -18,6 +18,7 @@
>
>  #include "etnaviv_cmdbuf.h"
>  #include "etnaviv_dump.h"
> +#include "etnaviv_flop_reset.h"
>  #include "etnaviv_gpu.h"
>  #include "etnaviv_gem.h"
>  #include "etnaviv_mmu.h"
> @@ -837,6 +838,10 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>                 goto fail;
>         }
>
> +       if (etnaviv_flop_reset_ppu_require(&gpu->identity) &&
> +           !priv->flop_reset_data_ppu)
> +               etnaviv_flop_reset_ppu_init(priv);
> +
>         if (gpu->identity.nn_core_count > 0)
>                 dev_warn(gpu->dev, "etnaviv has been instantiated on a NPU, "
>                                     "for which the UAPI is still experimental\n");
> --
> 2.49.0
>

I am not sure about the overall code style - you did run checkpatch.pl ?

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
