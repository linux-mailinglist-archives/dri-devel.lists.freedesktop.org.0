Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F62E8A8073
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 12:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC6E1120DF;
	Wed, 17 Apr 2024 10:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZRCz0NtO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4800911337C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 10:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713348877;
 bh=YvVBQEYNETjnryX3V3rRszU6fJ5mSGyMpP5/6fWcdx0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZRCz0NtOmGL19dZ/AZdo/eQy9yQ/QLs/EgbA8ahuojL/37QEyFW/BCKJYkFjZy3x/
 q9Ammmd57wt4pdsZfcbnDam3UveEKyWuDwOgxPUqd/BoGzRBke/cPeyuRuQ4lI3DGL
 UKFDrnWF5J4xbfrW6UuFUMZZDiNrGwMpX6RPmFNHZqEAnmaRvlN5aTS2N6UE9dc78d
 iWoe5AFsSG0un1IExZ5Gd2YI5S9PuLzKCDdqyG6iQfNFfZhv28KHPlOfppszSx1hJa
 ATLyLerogfrBucrR0WZ+Gjq1/L4Ay3hmdnhAaP9EmZa+vCM0iAn2+zXPvMIRbtpllT
 pj7RwG5VkGNRQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B84D437820F9;
 Wed, 17 Apr 2024 10:14:35 +0000 (UTC)
Message-ID: <2550d65a-7963-40d1-b360-8ce7a2aff1a8@collabora.com>
Date: Wed, 17 Apr 2024 12:14:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/18] drm/mediatek: add mt8365 dpi support
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-14-33ce8864b227@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v2-14-33ce8864b227@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 16/04/24 17:53, Alexandre Mergnat ha scritto:
> - Add compatibles and platform data into the Mediatek DPI driver.
> - Fix the DPI0 parent clock to be consistent.
> 
> This SoC is compatible with the mt8183 calculate factor.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   drivers/clk/mediatek/clk-mt8365-mm.c |  2 +-
>   drivers/gpu/drm/mediatek/mtk_dpi.c   | 18 ++++++++++++++++++
>   2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8365-mm.c b/drivers/clk/mediatek/clk-mt8365-mm.c
> index 01a2ef8f594e..3f62ec750733 100644
> --- a/drivers/clk/mediatek/clk-mt8365-mm.c
> +++ b/drivers/clk/mediatek/clk-mt8365-mm.c
> @@ -53,7 +53,7 @@ static const struct mtk_gate mm_clks[] = {
>   	GATE_MM0(CLK_MM_MM_DSI0, "mm_dsi0", "mm_sel", 17),
>   	GATE_MM0(CLK_MM_MM_DISP_RDMA1, "mm_disp_rdma1", "mm_sel", 18),
>   	GATE_MM0(CLK_MM_MM_MDP_RDMA1, "mm_mdp_rdma1", "mm_sel", 19),
> -	GATE_MM0(CLK_MM_DPI0_DPI0, "mm_dpi0_dpi0", "vpll_dpix", 20),
> +	GATE_MM0(CLK_MM_DPI0_DPI0, "mm_dpi0_dpi0", "dpi0_sel", 20),

While I can agree with that change, this needs a Fixes tag and needs a commit on
its own.

>   	GATE_MM0(CLK_MM_MM_FAKE, "mm_fake", "mm_sel", 21),
>   	GATE_MM0(CLK_MM_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 22),
>   	GATE_MM0(CLK_MM_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 23),
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index beb7d9d08e97..a4f9376ee472 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -997,6 +997,23 @@ static const struct mtk_dpi_conf mt8195_dpintf_conf = {
>   	.csc_enable_bit = DPINTF_CSC_ENABLE,
>   };
>   
> +static const struct mtk_dpi_conf mt8365_conf = {
> +	.cal_factor = mt8183_calculate_factor,
> +	.reg_h_fre_con = 0xe0,
> +	.max_clock_khz = 150000,
> +	.output_fmts = mt8183_output_fmts,
> +	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> +	.pixels_per_iter = 1,
> +	.is_ck_de_pol = true,
> +	.swap_input_support = true,
> +	.support_direct_pin = true,
> +	.dimension_mask = HPW_MASK,
> +	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
> +	.yuv422_en_bit = YUV422_EN,
> +	.csc_enable_bit = CSC_ENABLE,
> +};

You don't need this, as that's a direct copy of `mt8192_conf`.

> +
>   static int mtk_dpi_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -1092,6 +1109,7 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
>   	{ .compatible = "mediatek,mt8188-dp-intf", .data = &mt8195_dpintf_conf },
>   	{ .compatible = "mediatek,mt8192-dpi", .data = &mt8192_conf },
>   	{ .compatible = "mediatek,mt8195-dp-intf", .data = &mt8195_dpintf_conf },
> +	{ .compatible = "mediatek,mt8365-dpi", .data = &mt8365_conf },

...and you don't need to add any mt8365 specific compatible in there as well,
as you can simply add the node as

compatible = "mediatek,mt8365-dpi", "mediatek,mt8192-dpi";

Cheers,
Angelo

>   	{ /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
> 

