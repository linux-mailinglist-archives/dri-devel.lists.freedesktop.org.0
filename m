Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A7855B917
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 12:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C1111392A;
	Mon, 27 Jun 2022 10:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A753911394D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 10:17:56 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 513486601822;
 Mon, 27 Jun 2022 11:17:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656325075;
 bh=gPMKA+TXzvNNQnJbtffGIvH6FH7jJsGG4bhtsEAfauI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kdaVIi5qjxIA3P/VeS0G7C9MeuJYH+nakGyrLNF1vOrlRBU1/K/aLyVs9nxMtt6Mt
 D/Wxie+0/Iu0BY3M9XCfTQcMesgoYKnwz1W9V1ldlY5DwUXcevFE9EFaMU/SKewQ0d
 YOJFP1vhQzw1h7DwhCoFr3q6J8QkKH2j2GEWtRmAW5a2diEJZ5zi6GKNj+IQo9oXnM
 aGYyCH2LK3rbLt8Sxg1CuVoOIEvhNpvOEkaO9qI6NF7QCdNi/cuKHjeMc3KA8omCiw
 6rb27icKMdqJoYHpZ1P/lKjecWdIws2Pc/kRCN6Z6TRodOQ+LWPnLnRzYfqwznwyip
 HEbJcAUPmrBLw==
Message-ID: <ed0396cc-c180-1c60-20ec-83b4d4eb1993@collabora.com>
Date: Mon, 27 Jun 2022 12:17:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v12 06/10] drm/mediatek: Add MT8195 External DisplayPort
 support
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
References: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
 <20220627080341.5087-7-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220627080341.5087-7-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/06/22 10:03, Bo-Chen Chen ha scritto:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> This patch adds External DisplayPort support to the mt8195 eDP driver.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Move some dp features here and modify for reviewers' comments.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c | 217 ++++++++++++++++++++++++------
>   1 file changed, 174 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 9e9b516409e2..1697c61462b7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -111,6 +111,7 @@ struct mtk_dp {
>   	struct regmap *regs;
>   
>   	bool enabled;
> +	bool has_fec;
>   
>   	struct drm_connector *conn;
>   };
> @@ -123,6 +124,11 @@ static struct regmap_config mtk_dp_regmap_config = {
>   	.name = "mtk-dp-registers",
>   };
>   
> +static bool mtk_dp_is_edp(struct mtk_dp *mtk_dp)
> +{
> +	return mtk_dp->next_bridge;
> +}
> +
>   static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
>   {
>   	return container_of(b, struct mtk_dp, bridge);
> @@ -401,6 +407,20 @@ static bool mtk_dp_plug_state(struct mtk_dp *mtk_dp)
>   		  HPD_DB_DP_TRANS_P0_MASK);
>   }
>   
> +static bool mtk_dp_plug_state_avoid_pulse(struct mtk_dp *mtk_dp)
> +{
> +	int wait;
> +
> +	for (wait = 7; !mtk_dp_plug_state(mtk_dp) && wait > 0; --wait)
> +		/* Avoid short pulses on the HPD isr */
> +		usleep_range(1000, 5000);
> +
> +	if (wait == 0)
> +		return false;
> +

You can as well use existing APIs for that:

static bool mtk_dp_plug_state_avoid_pulse(struct mtk_dp *mtk_dp)
{
	int ret;

	return !!(readx_poll_timeout(mtk_dp_plug_state, mtk_dp, ret, ret,
				     4000, (7 * 4000)));
}

P.S.: I've used 4000 instead of 5000 on purpose, check the definition of
       readx_poll_timeout for more information.

All the rest of this commit looks good to me.

Cheers,
Angelo
