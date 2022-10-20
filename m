Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4516059E4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 10:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3DA10E426;
	Thu, 20 Oct 2022 08:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31B610E171
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 08:33:53 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 685AB66023A2;
 Thu, 20 Oct 2022 09:33:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666254832;
 bh=eYxMz6zERQc7GTytaTxwkwMkEwSbrxhut31+a3wEpqo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=McX7Tn5gyIzVRQETcl61spVTpz7+tpl7vReaL79clhy9oI8LNQw/BCnp1mCRLEMj2
 UoppxK88l1oNtHXEjz0UChsVJk01qesYhOaTWdyiwoHbeu+55JW2XeTZFGInqr34KU
 Fdh4tOwi6HLmiLrcLP4wD5aw6Cl/UpxzuAAfdbtCxbbFdmiWeX6fvJ8h2NQjXJ3Qut
 AEh3lX/7PKynaZ61blx05q9pnsR9QTfB/i5lxK9+JeFVu7kvL781F+O/XXRaBk6ey4
 e2SVZ02BqzwUIUV5tgxg60vCcQwR+h5FYkQDkJiCOTZxKjlZDPzWU5ttZ3C6l6CcpR
 zqXswuAhJclyQ==
Message-ID: <3e20104a-674a-666a-10b4-4a19abeabc9a@collabora.com>
Date: Thu, 20 Oct 2022 10:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH,2/2] drm: mediatek: Add mt8188 dpi compatibles and
 platform data
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com
References: <1666249553-15801-1-git-send-email-xinlei.lee@mediatek.com>
 <1666249553-15801-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1666249553-15801-3-git-send-email-xinlei.lee@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 20/10/22 09:05, xinlei.lee@mediatek.com ha scritto:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> For MT8188, the vdosys0 only supports 1T1P mode, so we need to add the compatible for mt8188 edp-intf.
> 
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c     | 17 +++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
>   2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 508a6d9..5cefda4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -929,6 +929,20 @@ static const struct mtk_dpi_conf mt8183_conf = {
>   	.csc_enable_bit = CSC_ENABLE,
>   };
>   
> +static const struct mtk_dpi_conf mt8188_edpintf_conf = {
> +	.cal_factor = mt8195_dpintf_calculate_factor,
> +	.max_clock_khz = 600000,
> +	.output_fmts = mt8195_output_fmts,
> +	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
> +	.pixels_per_iter = 4,
> +	.input_2pixel = false,
> +	.dimension_mask = DPINTF_HPW_MASK,
> +	.hvsize_mask = DPINTF_HSIZE_MASK,
> +	.channel_swap_shift = DPINTF_CH_SWAP,
> +	.yuv422_en_bit = DPINTF_YUV422_EN,
> +	.csc_enable_bit = DPINTF_CSC_ENABLE,
> +};
> +
>   static const struct mtk_dpi_conf mt8192_conf = {
>   	.cal_factor = mt8183_calculate_factor,
>   	.reg_h_fre_con = 0xe0,
> @@ -1079,6 +1093,9 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
>   	{ .compatible = "mediatek,mt8183-dpi",
>   	  .data = &mt8183_conf,
>   	},
> +	{ .compatible = "mediatek,mt8188-edp-intf",
> +	  .data = &mt8188_edpintf_conf,

Please rename to:

mediatek,mt8188-dp-intf

and

&mt8188_dpintf_conf

> +	},
>   	{ .compatible = "mediatek,mt8192-dpi",
>   	  .data = &mt8192_conf,
>   	},
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 91f58db..5732ed8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -631,6 +631,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>   	  .data = (void *)MTK_DPI },
>   	{ .compatible = "mediatek,mt8183-dpi",
>   	  .data = (void *)MTK_DPI },
> +	{ .compatible = "mediatek,mt8188-edp-intf",

Same here.

Regards,
Angelo

