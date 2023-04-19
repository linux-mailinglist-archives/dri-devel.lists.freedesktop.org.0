Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB496E72F8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 08:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F9410E10B;
	Wed, 19 Apr 2023 06:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD32610E10B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 06:16:34 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F0547660318E;
 Wed, 19 Apr 2023 07:16:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681884991;
 bh=bWxInygmnDUySp/Z/CBRWlkSud/aUMTg/zbRKc98Frc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MY2upY96vakUBLWHLlC00twx9VhBCWVBU+yzuFoHgsVG8oKB6WduOFyn1T9y/Bmm2
 kmQ1XB0oL3pBxImyRBgLzdz57OzoMk5D2M+6IRsR5tG4RySWMHxrDINFIMJUWsKNgJ
 OzTwhvn9RggX3Xb3LLOkQuIjdsExNjSI6xniH7R8DO0XhK+/3J29E9EvwG1bSRSTfv
 4SzeeKKg/tSz3GUkopxHUWIa6dOC/NhdV7PlwZapCgMYx4MCO/fjEc5d405aElQyKv
 TyRFNlQwoUS02Vv3/1YCr0Xtw+WJ8oTA9tPyz1SSwKkqd2h4D+JOuDfe3AvVQWnQAt
 u0+Uxigp3npFg==
Message-ID: <fcb6638b-0298-74b7-c375-f563a8115596@collabora.com>
Date: Wed, 19 Apr 2023 08:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/mediatek: Clarify/finish documentation for some
 driver structures
Content-Language: en-US
To: chunkuang.hu@kernel.org
References: <20230321111448.270110-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230321111448.270110-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: lee@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 21/03/23 12:14, AngeloGioacchino Del Regno ha scritto:
> The documentation for some of the driver structures in mediatek-drm
> was set to be kerneldoc but some code additions didn't actually update
> the comments accordingly and this caused triggering some warnings.
> 
> Add comments for the remaining undocumented entries; while at it, also
> clarify some acronyms for various display HW blocks and fix some comment
> blocks to actually get parsed as kerneldoc.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hello CK,
I just noticed that this patch is getting stale and forgotten.

Please take a look at it, as this solves kerneldoc warnings during kernel build.

Regards,
Angelo

> --- >   drivers/gpu/drm/mediatek/mtk_disp_aal.c   |  8 +++++---
>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c |  8 +++++---
>   drivers/gpu/drm/mediatek/mtk_disp_color.c | 11 +++++++----
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c |  8 ++++++--
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 13 +++++++++----
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c  | 12 +++++++++---
>   6 files changed, 41 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> index 434e8a9ce8ab..12d1800c1d34 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> @@ -27,9 +27,11 @@ struct mtk_disp_aal_data {
>   };
>   
>   /**
> - * struct mtk_disp_aal - DISP_AAL driver structure
> - * @ddp_comp - structure containing type enum and hardware resources
> - * @crtc - associated crtc to report irq events to
> + * struct mtk_disp_aal - Display Adaptive Ambient Light driver structure
> + * @clk:      clock for DISP_AAL controller
> + * @regs:     MMIO registers base
> + * @cmdq_reg: CMDQ Client register
> + * @data:     platform specific data for DISP_AAL
>    */
>   struct mtk_disp_aal {
>   	struct clk *clk;
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> index 1773379b2439..b173aa058573 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -35,9 +35,11 @@ struct mtk_disp_ccorr_data {
>   };
>   
>   /**
> - * struct mtk_disp_ccorr - DISP_CCORR driver structure
> - * @ddp_comp - structure containing type enum and hardware resources
> - * @crtc - associated crtc to report irq events to
> + * struct mtk_disp_ccorr - Display Color Correction driver structure
> + * @clk:      clock for DISP_CCORR block
> + * @regs:     MMIO registers base
> + * @cmdq_reg: CMDQ Client register
> + * @data:     platform specific data for DISP_CCORR
>    */
>   struct mtk_disp_ccorr {
>   	struct clk *clk;
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> index cac9206079e7..7884f4736b7c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> @@ -31,10 +31,13 @@ struct mtk_disp_color_data {
>   	unsigned int color_offset;
>   };
>   
> -/*
> - * struct mtk_disp_color - DISP_COLOR driver structure
> - * @crtc: associated crtc to report irq events to
> - * @data: platform colour driver data
> +/**
> + * struct mtk_disp_color - DISP_COLOR (Display Color) driver structure
> + * @crtc:     associated crtc to report irq events to
> + * @clk:      clock for DISP_COLOR block
> + * @regs:     MMIO registers base
> + * @cmdq_reg: CMDQ Client register
> + * @data:     platform specific data for DISP_COLOR
>    */
>   struct mtk_disp_color {
>   	struct drm_crtc				*crtc;
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index c844942603f7..7e748613fccb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -31,8 +31,12 @@ struct mtk_disp_gamma_data {
>   	bool lut_diff;
>   };
>   
> -/*
> - * struct mtk_disp_gamma - DISP_GAMMA driver structure
> +/**
> + * struct mtk_disp_gamma - Display Gamma driver structure
> + * @clk:      clock for DISP_GAMMA block
> + * @regs:     MMIO registers base
> + * @cmdq_reg: CMDQ Client register
> + * @data:     platform data for DISP_GAMMA
>    */
>   struct mtk_disp_gamma {
>   	struct clk *clk;
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 9d8c986700ee..00f2871fd1a4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -76,10 +76,15 @@ struct mtk_disp_ovl_data {
>   	bool supports_afbc;
>   };
>   
> -/*
> - * struct mtk_disp_ovl - DISP_OVL driver structure
> - * @crtc: associated crtc to report vblank events to
> - * @data: platform data
> +/**
> + * struct mtk_disp_ovl - Display Overlay driver structure
> + * @crtc:           associated crtc to report vblank events to
> + * @clk:            clock for DISP_OVL block
> + * @regs:           MMIO registers base
> + * @cmdq_reg:       CMDQ Client register
> + * @data:           platform data
> + * @vblank_cb:      vblank callback function
> + * @vblank_cb_data: pointer to data that will be passed to vblank_cb()
>    */
>   struct mtk_disp_ovl {
>   	struct drm_crtc			*crtc;
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index e8e337903b0d..74f4a0bce5cc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -59,9 +59,15 @@ struct mtk_disp_rdma_data {
>   	unsigned int fifo_size;
>   };
>   
> -/*
> - * struct mtk_disp_rdma - DISP_RDMA driver structure
> - * @data: local driver data
> +/**
> + * struct mtk_disp_rdma - Display Read DMA driver structure
> + * @clk:            clock for DISP_RDMA block
> + * @regs:           MMIO registers base
> + * @cmdq_reg:       CMDQ Client register
> + * @data:           platform data
> + * @vblank_cb:      vblank callback function
> + * @vblank_cb_data: pointer to data that will be passed to vblank_cb()
> + * @fifo_size:      size of DISP_RDMA block's FIFO
>    */
>   struct mtk_disp_rdma {
>   	struct clk			*clk;

-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

