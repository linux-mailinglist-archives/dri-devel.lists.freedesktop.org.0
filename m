Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 954187F40E9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 10:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8565210E5E9;
	Wed, 22 Nov 2023 09:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4132010E2EF;
 Wed, 22 Nov 2023 09:01:44 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1ea82246069so3630615fac.3; 
 Wed, 22 Nov 2023 01:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700643703; x=1701248503; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B0loSkyS8Q4JF6tOXkRoeRXujNUfgvT0hvtKpAV8emU=;
 b=Tn18baOqI5tHqjzvB7pDJEJDjOX1bp2rpp6KVKWmU/DCOdTMEZMCe80TBT1dKgGUA5
 Rbs3eHLVCLvl1tT8pxq7k3RL+EE9Rym0kPjQwRtzfaSAXoZOjh70e7WfO/7oifetuMAQ
 83ag3x7/DsLvfTwC5fstz9ZSqO7JmbSC9T78Ue1LZdOas2Yhw2jNyaUGjmhFt/jGXEKr
 edod3K0GgksH4WjQBQVJzhqKNvBABXZTvJDEyu31dJqUnfH+y8bE4kalmZQWsc7XxLCn
 7gqxt5yH/Yc7L0EHo2uIdQ5m/WZvO0gpsDFKTWn6xekPPI4py7RFaiw8WmtcQEALHGdt
 Q1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700643703; x=1701248503;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B0loSkyS8Q4JF6tOXkRoeRXujNUfgvT0hvtKpAV8emU=;
 b=PKgO3Mr4lE1TAs0jZPnjtSSaI7Q3xUrvIsG95vYqMemGdsse89jI9FEc7OTYZ0jFfA
 yRF7z2z04D3z9t1KO8xyeyA6qxqreA2zEKwwwDebtjWVy9kShJtPggoFMVV9pZwRNuwa
 W0iemN7tOIm0FTvjrCKr5UahpW9tWuHbDWouETHspYLx1MqYk3sxY3VP4uYMVSn2UiFn
 y4UnkaI04QaXxUoC18aDIGsT3Of9w7gT61AxiKDtITUh+xDrnk3m/LisgqtfDs3uDt/1
 /t2je7UEcw3Byq5I7CdCD7SxS3ofdQMCZ8Q8qcm4PPSnrGTkZQZqa28VRa+Xg7t3+1Mo
 lajg==
X-Gm-Message-State: AOJu0Yx9/SEV1GhpobCdogSy8L0G8iqLpaszGI+ufChOsyiucggpUg2z
 uVKJj3xDZ1VZPGfFMv3WeUA65jQm4yA0NKCRWZA=
X-Google-Smtp-Source: AGHT+IG+AQeKCJw3Ukd8i/zIrx+/UVseMXxynPD4JgoySfRf0Ua5e6jnUPyIUhPJ9xHEAvoz76S7MQveOn6+oNImOzU=
X-Received: by 2002:a05:6870:ac0b:b0:1ea:2c8b:e18b with SMTP id
 kw11-20020a056870ac0b00b001ea2c8be18bmr2203709oab.35.1700643703182; Wed, 22
 Nov 2023 01:01:43 -0800 (PST)
MIME-Version: 1.0
References: <20231116140910.1613508-1-tomeu@tomeuvizoso.net>
 <20231121063300.2273522-1-tomeu@tomeuvizoso.net>
In-Reply-To: <20231121063300.2273522-1-tomeu@tomeuvizoso.net>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 22 Nov 2023 10:01:31 +0100
Message-ID: <CAH9NwWemgaUOByCKMC5PMN3q1f91DE0yxEE90hwjhic47fj+Lw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/etnaviv: Expose a few more chipspecs to userspace
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Di., 21. Nov. 2023 um 07:33 Uhr schrieb Tomeu Vizoso <tomeu@tomeuvizoso.net>:
>
> These ones will be needed to make use fo the NN and TP units in the NPUs
> based on Vivante IP.
>
> Also fix the number of NN cores in the VIPNano-qi.
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>

I have not checked all the new values but it looks fine to me.

Acked-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>
> v2: Update a few chipspecs that I had missed before. (Christian)
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 20 +++++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 12 +++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 34 ++++++++++++++++++++++++++
>  include/uapi/drm/etnaviv_drm.h         |  5 ++++
>  4 files changed, 71 insertions(+)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 9276756e1397..9055ed08cd7b 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -164,6 +164,26 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value)
>                 *value = gpu->identity.eco_id;
>                 break;
>
> +       case ETNAVIV_PARAM_GPU_NN_CORE_COUNT:
> +               *value = gpu->identity.nn_core_count;
> +               break;
> +
> +       case ETNAVIV_PARAM_GPU_NN_MAD_PER_CORE:
> +               *value = gpu->identity.nn_mad_per_core;
> +               break;
> +
> +       case ETNAVIV_PARAM_GPU_TP_CORE_COUNT:
> +               *value = gpu->identity.tp_core_count;
> +               break;
> +
> +       case ETNAVIV_PARAM_GPU_ON_CHIP_SRAM_SIZE:
> +               *value = gpu->identity.on_chip_sram_size;
> +               break;
> +
> +       case ETNAVIV_PARAM_GPU_AXI_SRAM_SIZE:
> +               *value = gpu->identity.axi_sram_size;
> +               break;
> +
>         default:
>                 DBG("%s: invalid param: %u", dev_name(gpu->dev), param);
>                 return -EINVAL;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> index 197e0037732e..7d5e9158e13c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -54,6 +54,18 @@ struct etnaviv_chip_identity {
>         /* Number of Neural Network cores. */
>         u32 nn_core_count;
>
> +       /* Number of MAD units per Neural Network core. */
> +       u32 nn_mad_per_core;
> +
> +       /* Number of Tensor Processing cores. */
> +       u32 tp_core_count;
> +
> +       /* Size in bytes of the SRAM inside the NPU. */
> +       u32 on_chip_sram_size;
> +
> +       /* Size in bytes of the SRAM across the AXI bus. */
> +       u32 axi_sram_size;
> +
>         /* Size of the vertex cache. */
>         u32 vertex_cache_size;
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> index 67201242438b..9eb8ca7c5034 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> @@ -17,6 +17,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>                 .thread_count = 128,
>                 .shader_core_count = 1,
>                 .nn_core_count = 0,
> +               .nn_mad_per_core = 0,
> +               .tp_core_count = 0,
> +               .on_chip_sram_size = 0,
> +               .axi_sram_size = 0,
>                 .vertex_cache_size = 8,
>                 .vertex_output_buffer_size = 1024,
>                 .pixel_pipes = 1,
> @@ -48,6 +52,11 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>                 .register_max = 64,
>                 .thread_count = 256,
>                 .shader_core_count = 1,
> +               .nn_core_count = 0,
> +               .nn_mad_per_core = 0,
> +               .tp_core_count = 0,
> +               .on_chip_sram_size = 0,
> +               .axi_sram_size = 0,
>                 .vertex_cache_size = 8,
>                 .vertex_output_buffer_size = 512,
>                 .pixel_pipes = 1,
> @@ -80,6 +89,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>                 .thread_count = 512,
>                 .shader_core_count = 2,
>                 .nn_core_count = 0,
> +               .nn_mad_per_core = 0,
> +               .tp_core_count = 0,
> +               .on_chip_sram_size = 0,
> +               .axi_sram_size = 0,
>                 .vertex_cache_size = 16,
>                 .vertex_output_buffer_size = 1024,
>                 .pixel_pipes = 1,
> @@ -112,6 +125,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>                 .thread_count = 512,
>                 .shader_core_count = 2,
>                 .nn_core_count = 0,
> +               .nn_mad_per_core = 0,
> +               .tp_core_count = 0,
> +               .on_chip_sram_size = 0,
> +               .axi_sram_size = 0,
>                 .vertex_cache_size = 16,
>                 .vertex_output_buffer_size = 1024,
>                 .pixel_pipes = 1,
> @@ -143,6 +160,11 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>                 .register_max = 64,
>                 .thread_count = 512,
>                 .shader_core_count = 2,
> +               .nn_core_count = 0,
> +               .nn_mad_per_core = 0,
> +               .tp_core_count = 0,
> +               .on_chip_sram_size = 0,
> +               .axi_sram_size = 0,
>                 .vertex_cache_size = 16,
>                 .vertex_output_buffer_size = 1024,
>                 .pixel_pipes = 1,
> @@ -175,6 +197,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>                 .thread_count = 1024,
>                 .shader_core_count = 4,
>                 .nn_core_count = 0,
> +               .nn_mad_per_core = 0,
> +               .tp_core_count = 0,
> +               .on_chip_sram_size = 0,
> +               .axi_sram_size = 0,
>                 .vertex_cache_size = 16,
>                 .vertex_output_buffer_size = 1024,
>                 .pixel_pipes = 2,
> @@ -207,6 +233,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>                 .thread_count = 256,
>                 .shader_core_count = 1,
>                 .nn_core_count = 8,
> +               .nn_mad_per_core = 64,
> +               .tp_core_count = 4,
> +               .on_chip_sram_size = 524288,
> +               .axi_sram_size = 1048576,
>                 .vertex_cache_size = 16,
>                 .vertex_output_buffer_size = 1024,
>                 .pixel_pipes = 1,
> @@ -239,6 +269,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>                 .thread_count = 256,
>                 .shader_core_count = 1,
>                 .nn_core_count = 6,
> +               .nn_mad_per_core = 64,
> +               .tp_core_count = 3,
> +               .on_chip_sram_size = 262144,
> +               .axi_sram_size = 0,
>                 .vertex_cache_size = 16,
>                 .vertex_output_buffer_size = 1024,
>                 .pixel_pipes = 1,
> diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
> index af024d90453d..d87410a8443a 100644
> --- a/include/uapi/drm/etnaviv_drm.h
> +++ b/include/uapi/drm/etnaviv_drm.h
> @@ -77,6 +77,11 @@ struct drm_etnaviv_timespec {
>  #define ETNAVIV_PARAM_GPU_PRODUCT_ID                0x1c
>  #define ETNAVIV_PARAM_GPU_CUSTOMER_ID               0x1d
>  #define ETNAVIV_PARAM_GPU_ECO_ID                    0x1e
> +#define ETNAVIV_PARAM_GPU_NN_CORE_COUNT             0x1f
> +#define ETNAVIV_PARAM_GPU_NN_MAD_PER_CORE           0x20
> +#define ETNAVIV_PARAM_GPU_TP_CORE_COUNT             0x21
> +#define ETNAVIV_PARAM_GPU_ON_CHIP_SRAM_SIZE         0x22
> +#define ETNAVIV_PARAM_GPU_AXI_SRAM_SIZE             0x23
>
>  #define ETNA_MAX_PIPES 4
>
> --
> 2.42.0
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
