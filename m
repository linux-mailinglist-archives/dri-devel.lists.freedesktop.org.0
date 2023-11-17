Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ACB7EEDD7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 09:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C488D10E72E;
	Fri, 17 Nov 2023 08:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1F610E72E;
 Fri, 17 Nov 2023 08:51:14 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1e9c42fc0c9so795427fac.1; 
 Fri, 17 Nov 2023 00:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700211073; x=1700815873; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BMjYq8KIiIVaTPNF6OfRzBg75TE8YFMdh3udmnKItcQ=;
 b=U9wJkm447kjwwGLUU5eRld66E97ucOTBWnkkKQb/Sj4q9LLzmNDmZUhlOlJmy72Hs+
 emHZoF7LLQIjWkaxLBzI/ThVJ5Ch5wua2nPGF94nxw6SLCKD8I2YpbTyM7myfSO4Hc6f
 NLU5ww9XcJcOvIvpJIbV4vmYhpmN50w9SZ9Tp6R4D/5lhaHEMGovrtYUhm/BCgfC8vD7
 7lhLIk5MYe7bZZ0iannTb3VL5CjOim+CinBO4Hhfh0t6SVQQfX7OirGRpmTEPLRzovW5
 tCRHx7CHphhlrQSb6J93JCHea/ZTtvZbNucbM/V+Qz8GaHcJpnotOuqDXKVJ4ZmGClvA
 rLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700211073; x=1700815873;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BMjYq8KIiIVaTPNF6OfRzBg75TE8YFMdh3udmnKItcQ=;
 b=fQLl/DI6g8mWbeBd3WFlB2bz2YCbwXO0H2eIic12vuxLkCGwdCgaeZiZgkeXkjlLKK
 kkCZARWW4u4yg/rAI3kkdCvQ4yhBpS9zc3L6rxMZjYp5tyhAbQKNua6aWXfAcutK8iUn
 VlUDGtomvLQ6vy8l+n4yl59iKYG9Xe3dlpqXQb770MB1gU6d3D1u3bSYS58et/gChXG0
 4qhhMydht6W26B/vUBwixdxX0jLw2qlYeq24KpxwF0y53P0t1/JOp4zlfUkAZjPhJcNX
 uaIUJ4a5A1DhiMADcJZaPn7X32A4J0kGk92oWe4E25zuWsf9te8DczgXfMrM5qsFTUIj
 EXnQ==
X-Gm-Message-State: AOJu0YwnQRi9QgE6IapGZ1ExWAPSlKZF0ANH2yQTOfHH5lM018/yO78E
 HpHYxb2i4pfctIPa513rHKOIv4Mdo021cHgEs8+1Zo/GLIMyIg==
X-Google-Smtp-Source: AGHT+IGWZnSkqKhI+H8sbF8oGYpyll/AkRs+lhfeBggoCHDmnifbR7umqBjbXHSJvxCYHfWQ4/py9REJrFq1WaFqEGU=
X-Received: by 2002:a05:6870:eca1:b0:1e9:bc79:9fa6 with SMTP id
 eo33-20020a056870eca100b001e9bc799fa6mr20244496oab.50.1700211073311; Fri, 17
 Nov 2023 00:51:13 -0800 (PST)
MIME-Version: 1.0
References: <20231116140910.1613508-1-tomeu@tomeuvizoso.net>
In-Reply-To: <20231116140910.1613508-1-tomeu@tomeuvizoso.net>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 17 Nov 2023 09:51:02 +0100
Message-ID: <CAH9NwWc6Dw-M90eQsYG4mej=oWdtc+UdvYVp-u05c_PyqzHZUg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Expose a few more chipspecs to userspace
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomeu


>
> These ones will be needed to make use fo the NN and TP units in the NPUs
> based on Vivante IP.
>
> Also fix the number of NN cores in the VIPNano-qi.
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 20 ++++++++++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 12 ++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 22 +++++++++++++++++++++-
>  include/uapi/drm/etnaviv_drm.h         |  5 +++++
>  4 files changed, 58 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 5f96e7b1a9ec..9a18b5431975 100644
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
> index c8f3ad2031ce..83ef3c06da5d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -53,6 +53,18 @@ struct etnaviv_chip_identity {
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
> index 0cb5aacaf384..93f15cce6d22 100644
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
> @@ -49,6 +53,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
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
> @@ -81,6 +89,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
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
> @@ -113,6 +125,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
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
> @@ -144,7 +160,11 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>                 .register_max = 64,
>                 .thread_count = 256,
>                 .shader_core_count = 1,
> -               .nn_core_count = 1,
> +               .nn_core_count = 8,
> +               .nn_mad_per_core = 64,
> +               .tp_core_count = 4,
> +               .on_chip_sram_size = 524288,
> +               .axi_sram_size = 1048576,
>                 .vertex_cache_size = 16,
>                 .vertex_output_buffer_size = 1024,
>                 .pixel_pipes = 1,

I am counting 8 entries in the etnaviv_chip_identities array and you
are just updating 5 of them.

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
> 2.41.0
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
