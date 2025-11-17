Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA23C6301E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 09:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327E910E307;
	Mon, 17 Nov 2025 08:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b6r8ffUL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE95910E306
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 08:57:52 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-343ea89896eso3965580a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 00:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763369872; x=1763974672; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wv78zHeBNr1UA9v2/9FsEFlSLafZ0Pl5MgNra/ozcuw=;
 b=b6r8ffULTa1e02Urkz+u4oz9CuuJEW4F8UDRD+1xInWqJqhzLVSa7vUSoWZHntDCIN
 53DbX7nU29b/SnKzIDxMvT3Xvkr5wvoNzCagZeOmgUwisckexDnGfeOm3c2Gp5vFc/yW
 IP+JvFFDT/kEIG+ytYstL3iFbxrqr5FzyeZW59CUqQoLYpIcYae+YJpiNcTiSFsgB6jr
 EAICDqHHJyjmjr5y7xhjooFK5udh0zd1sT+h/K8TYyjB/ktb9mKnsgrRageAP+Oo+/aO
 6D0ZzhYF2NRxdTNPp4LaxDyPtaqMLlV3X0+WvGewD0FbAWGV59NllfywSPxiLzXbBNTm
 5uJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763369872; x=1763974672;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wv78zHeBNr1UA9v2/9FsEFlSLafZ0Pl5MgNra/ozcuw=;
 b=IyHowcwtw1CppW2IkjtQXz+wyqrgGoRZ/gZdxRubxjn2JEsXppYcpblkXC/B5GXSdz
 2QgSkaDChdkhfaWUwkOvA6MeZK98NyEF3YWMIIJmCAIztEk+KI01sB2vHkDNLRRIjxNB
 Ac+kD/cIGBf6eptLJmH34lFk12aOTPnTWbfER+UDO3a0rSkVtSTDIp1q/4WerAnX+RBt
 fhkQTlxiVdkqqD/b9Vt1kOjaYuFideAYjO6NhSHh8U1Xne7nNoZzntT63Gxu8kknakH8
 4ctVlR500LHqxCjsmDeYEqEd4EmGxVyAbiHHBIqkejCIN3LL9EmhNAcED9ueh8LpG8Bb
 skrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9cIwDZ94Fiv0dy4xRrLHKuvd2Iif7UfLDhBe0QHCPWlEqSfAlqUehCozcwADQo6O7xIQJmfRrGuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIzavjUnRHS3Uz9RZaMGU7vYC7Aoz9+2b9qd7xZ/kd96H9XK8Z
 PUZEpeNvNbzKCuAfoTyjC5mJrzczZUB0gp8P4FoNt99KOY4eGIW2YSh7KYhf8Gr8nsT/OQHTSip
 yoN07G9IN/3YrCMaA6EBXTdcf8Q8sCa8=
X-Gm-Gg: ASbGncs368M+Akdo8a7TzVC2VMZTh+v0lCKGkkceYglCSHHlnUuceIMKgJgo+efiay5
 I48fnqefzIvGLuFcjLGvn0km9WDR7TNPFRHqra81hbKBNqrxmKQQSOMVgtuQ6y5Qa+II2JGkYlL
 L+cow+TQ14DvwMnTAikfLM4BbPLP41T+KHlCuWtF6/zqDM7jOsRN0dSGaJ9un55tJGtOspQQSIR
 kkcM2X1mkLNTull6zWV4Soygbut8+5KxXLlFpOoB65yPEl1MisLqmjDHSY=
X-Google-Smtp-Source: AGHT+IFdfo50t9dB3Gj4NTWyj/ck9AzkRLi9oxNKu+pf1V3BFtb9qzQ7KE/x9iBcTBzRkg0Oxfi+b0PymTaN2bySU/Y=
X-Received: by 2002:a17:90b:3dc7:b0:32b:baaa:21b0 with SMTP id
 98e67ed59e1d1-343f9e90610mr12774302a91.6.1763369872376; Mon, 17 Nov 2025
 00:57:52 -0800 (PST)
MIME-Version: 1.0
References: <20250630202703.13844-1-gert.wollny@collabora.com>
 <20251110144625.18653-1-gert.wollny@collabora.com>
 <20251110144625.18653-5-gert.wollny@collabora.com>
In-Reply-To: <20251110144625.18653-5-gert.wollny@collabora.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 17 Nov 2025 09:57:39 +0100
X-Gm-Features: AWmQ_bknvXNjse9vyXgp3S0IV78TVBPNJzHwhon3lvHrjpSRCyz72zjZuaE5W-Q
Message-ID: <CAH9NwWerm4c4vZ8LYnwnwxMic6q-UdFxTz-rm=cYifQ1kYZEtA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm/etnaviv: Add PPU flop reset
To: gert.wollny@collabora.com
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

> From: Gert Wollny <gert.wollny@collabora.com>
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
> v4: As suggested by Christian Gmeiner:
>     - replace "asm-generic/int-ll64.h" with "linux/types.h"
>     - drop flop reset type enum since we only support one type here
>     - move function return parameters on same line with function name
>     - replace open coded for loop with memset32
>     - add cnost to local static values
>     - add a return value to etnaviv_flop_reset_ppu_init; handle and
>       pass errors on to the caller
>     - handle etnaviv_flop_reset_ppu_init return value
>     - use dev_err for flop reset error message
>     - fix include guard to be consistent with the other driver code
>     - fix license header and formatting
>
> Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
> ---
>  drivers/gpu/drm/etnaviv/Makefile             |   1 +
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |   6 +
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c        |   3 +
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h        |   3 +
>  drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c | 204 +++++++++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h |  21 ++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c        |  11 +
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
> index 5be9978e34d9..7b5f4da85a1f 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> @@ -19,6 +19,8 @@
>  #include "state_3d.xml.h"
>  #include "cmdstream.xml.h"
>
> +#include "etnaviv_flop_reset.h"
> +
>  static void etnaviv_cmd_select_pipe(struct etnaviv_gpu *gpu,
>         struct etnaviv_cmdbuf *buffer, u8 pipe)
>  {
> @@ -101,6 +103,10 @@ u16 etnaviv_buffer_init(struct etnaviv_gpu *gpu)
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
> index 54ceae87b401..bb1b84eecec8 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -601,6 +601,9 @@ static void etnaviv_unbind(struct device *dev)
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
> index 000000000000..7c0112b3b3ad
> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
> @@ -0,0 +1,204 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (C) 2025 Etnaviv Project
> + */
> +
> +#include "asm-generic/errno-base.h"

#include <linux/errno.h>


> +#include "linux/dev_printk.h"
> +#include "linux/string.h"
> +#include "linux/types.h"

#include <linux/dev_printk.h>
#include <linux/string.h>
#include <linux/types.h>


> +#include "etnaviv_buffer.h"
> +#include "etnaviv_cmdbuf.h"
> +#include "state_3d.xml.h"
> +
> +#include "etnaviv_flop_reset.h"
> +
> +#define PPU_IMAGE_STRIDE 64
> +#define PPU_IMAGE_XSIZE 64
> +#define PPU_IMAGE_YSIZE 6
> +
> +#define PPU_FLOP_RESET_INSTR_DWORD_COUNT 16
> +
> +static void etnaviv_emit_flop_reset_state_ppu(struct etnaviv_cmdbuf *cmdbuf,
> +                                             u32 buffer_base, u32 input_offset,
> +                                             u32 output_offset,
> +                                             u32 shader_offset,
> +                                             u32 shader_size,
> +                                             u32 shader_register_count)
> +{
> +       CMD_LOAD_STATE(cmdbuf, VIVS_GL_API_MODE, VIVS_GL_API_MODE_OPENCL);
> +       CMD_SEM(cmdbuf, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
> +       CMD_STALL(cmdbuf, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
> +
> +       CMD_LOAD_STATES_START(cmdbuf, VIVS_SH_HALTI5_UNIFORMS(0), 4);
> +
> +       OUT(cmdbuf, buffer_base + input_offset);
> +       OUT(cmdbuf, PPU_IMAGE_STRIDE);
> +       OUT(cmdbuf, PPU_IMAGE_XSIZE | (PPU_IMAGE_YSIZE << 16));
> +       OUT(cmdbuf, 0x444051f0);
> +       OUT(cmdbuf, 0xffffffff);
> +
> +       CMD_LOAD_STATES_START(cmdbuf, VIVS_SH_HALTI5_UNIFORMS(4), 4);
> +       OUT(cmdbuf, buffer_base + output_offset);
> +       OUT(cmdbuf, PPU_IMAGE_STRIDE);
> +       OUT(cmdbuf, PPU_IMAGE_XSIZE | (PPU_IMAGE_YSIZE << 16));
> +       OUT(cmdbuf, 0x444051f0);
> +       OUT(cmdbuf, 0xffffffff);
> +
> +       CMD_LOAD_STATE(cmdbuf, VIVS_CL_CONFIG,
> +                      VIVS_CL_CONFIG_DIMENSIONS(2) |
> +                              VIVS_CL_CONFIG_VALUE_ORDER(3));
> +       CMD_LOAD_STATE(cmdbuf, VIVS_VS_ICACHE_INVALIDATE, 0x1f);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_VARYING_NUM_COMPONENTS(0), 0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_TEMP_REGISTER_CONTROL,
> +                      shader_register_count);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_SAMPLER_BASE, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_UNIFORM_BASE, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_NEWRANGE_LOW, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_NEWRANGE_HIGH, shader_size / 16);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_INST_ADDR, buffer_base + shader_offset);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_SH_CONFIG, VIVS_SH_CONFIG_RTNE_ROUNDING);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_VS_ICACHE_CONTROL,
> +                      VIVS_VS_ICACHE_CONTROL_ENABLE);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_ICACHE_COUNT, shader_size / 16 - 1);
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
> +                      VIVS_GL_FLUSH_CACHE_SHADER_L1 |
> +                              VIVS_GL_FLUSH_CACHE_UNK10 |
> +                              VIVS_GL_FLUSH_CACHE_UNK11);
> +}
> +
> +static void etnaviv_flop_reset_ppu_fill_input(u32 *buffer, u32 size)
> +{
> +       memset32(buffer, 0x01010101, size / 4);
> +}
> +
> +static void etnaviv_flop_reset_ppu_set_shader(u8 *dest)
> +{
> +       static const u32 inst[PPU_FLOP_RESET_INSTR_DWORD_COUNT] = {
> +               /* img_load.u8 r1, c0, r0.xy */
> +               0x78011779,
> +               0x39000804,
> +               0x00A90050,
> +               0x00000000,
> +               /* img_load.u8 r2, c0, r0.xy */
> +               0x78021779,
> +               0x39000804,
> +               0x00A90050,
> +               0x00000000,
> +               /* dp2x8 r1, r1, r2, c3_512 */
> +               0xB8017145,
> +               0x390018FC,
> +               0x01C90140,
> +               0x40390028,
> +               /* img_store.u8 r1, c2, r0.xy, r1 */
> +               0x380007BA,
> +               0x39001804,
> +               0x00A90050,
> +               0x00390018,
> +       };
> +       memcpy(dest, inst, sizeof(inst));
> +}
> +
> +static const struct etnaviv_flop_reset_entry {
> +       u16 chip_model;
> +       u16 revision;
> +       u32 flags;
> +} etnaviv_flop_reset_db[] = {
> +       {
> +               .chip_model = 0x8000,
> +               .revision = 0x6205,
> +       },
> +};
> +
> +bool etnaviv_flop_reset_ppu_require(const struct etnaviv_chip_identity *chip_id)
> +{
> +       const struct etnaviv_flop_reset_entry *e = etnaviv_flop_reset_db;
> +
> +       for (int i = 0; i < ARRAY_SIZE(etnaviv_flop_reset_db); ++i, ++e) {
> +               if (chip_id->model == e->chip_model &&
> +                   chip_id->revision == e->revision)
> +                       return true;
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
> +int etnaviv_flop_reset_ppu_init(struct etnaviv_drm_private *priv)
> +{
> +       /* Get some space from the rung buffer to put the payload
> +        * (input and output image, and shader), we keep this buffer
> +        * for the whole life time the driver is bound
> +        */
> +       priv->flop_reset_data_ppu =
> +               kzalloc(sizeof(*priv->flop_reset_data_ppu), GFP_KERNEL);
> +
> +       if (!priv->flop_reset_data_ppu)
> +               return -ENOMEM;
> +
> +       int ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc,
> +                                     priv->flop_reset_data_ppu, buffer_size);
> +       if (ret)

We are leaking priv->flop_reset_data_ppu here.

> +               return ret;
> +
> +       void *buffer_base = priv->flop_reset_data_ppu->vaddr;
> +       u32 *input_data = (u32 *)buffer_base;
> +       u8 *shader_data = (u8 *)buffer_base + shader_offset;
> +
> +       etnaviv_flop_reset_ppu_fill_input(input_data, image_data_size);
> +       etnaviv_flop_reset_ppu_set_shader(shader_data);
> +
> +       return 0;
> +}
> +
> +void etnaviv_flop_reset_ppu_run(struct etnaviv_gpu *gpu)
> +{
> +       struct etnaviv_drm_private *priv = gpu->drm->dev_private;
> +
> +       if (!priv->flop_reset_data_ppu) {
> +               dev_err(gpu->dev,
> +                       "Oops: Flop reset data was not initialized, skipping\n");
> +               return;
> +       }
> +
> +       u32 buffer_base = etnaviv_cmdbuf_get_va(
> +               priv->flop_reset_data_ppu, &gpu->mmu_context->cmdbuf_mapping);
> +
> +       etnaviv_emit_flop_reset_state_ppu(&gpu->buffer, buffer_base, 0,
> +                                         output_offset, shader_offset,
> +                                         shader_size, shader_register_count);
> +}
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
> new file mode 100644
> index 000000000000..e6dee1db788f
> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (C) 2025 Etnaviv Project
> + */
> +
> +#ifndef _ETNAVIV_FLOP_RESET_H_
> +#define _ETNAVIV_FLOP_RESET_H_
> +
> +#include <linux/types.h>
> +
> +struct etnaviv_chip_identity;
> +struct etnaviv_drm_private;
> +struct etnaviv_gpu;
> +
> +bool etnaviv_flop_reset_ppu_require(const struct etnaviv_chip_identity *chip_id);
> +
> +int etnaviv_flop_reset_ppu_init(struct etnaviv_drm_private *priv);
> +
> +void etnaviv_flop_reset_ppu_run(struct etnaviv_gpu *gpu);
> +
> +#endif
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index ca0be293f5fe..839ffa445ce2 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -20,6 +20,7 @@
>
>  #include "etnaviv_cmdbuf.h"
>  #include "etnaviv_dump.h"
> +#include "etnaviv_flop_reset.h"
>  #include "etnaviv_gpu.h"
>  #include "etnaviv_gem.h"
>  #include "etnaviv_mmu.h"
> @@ -839,6 +840,16 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>                 goto fail;
>         }
>
> +       if (etnaviv_flop_reset_ppu_require(&gpu->identity) &&
> +           !priv->flop_reset_data_ppu) {
> +               ret = etnaviv_flop_reset_ppu_init(priv);
> +               if (ret) {
> +                       dev_err(gpu->dev,
> +                               "Unable to initialize PPU flop reset date\n");

typo: should be data and not date

> +                       goto fail;
> +               }
> +       }
> +
>         if (gpu->identity.nn_core_count > 0)
>                 dev_warn(gpu->dev, "etnaviv has been instantiated on a NPU, "
>                                     "for which the UAPI is still experimental\n");
> --
> 2.51.0
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
