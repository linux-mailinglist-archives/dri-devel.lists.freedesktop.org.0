Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD476562D8B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 10:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D9410E0CD;
	Fri,  1 Jul 2022 08:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5938E10E0CD
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 08:14:08 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3FA956601974;
 Fri,  1 Jul 2022 09:14:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656663247;
 bh=oX88CugqBfAMEuhfwgO7WJ1IBMMlTDVxIs1zooaswFg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OrhyVBuFvFKAcT64g3zBqktpN6W6lmU6Z7vqgOE+kfn63T3GUrTPJf1Brz6hpDrus
 zY/MMpdHKye4D1rc5SHWwbNyJ/rM4S3NJsgL9538JL85q1d8o+KvsX4uW+bdplDH+d
 k9wzv6YqD1Ac+hOJ016TwfphmemQzRLsXI8D91pJc4Sn9vzQZP+dGY0uouTZny/68V
 gYpiHqbS/wmnq6esnVTOtYzOsdC73JJGMzMJ4FQKztfvN4ZgrbPK8DUFZ2w5/N7Tv3
 Kt9ACJ1fKb8l8eYtcMzZVJIfKWPpuNCQkyR2LQ6yNw3U8qT3IHl2+GS5UFAuBCxHye
 5WSCex46vm2uQ==
Message-ID: <5971f465-9514-d830-8467-e722475ecc7f@collabora.com>
Date: Fri, 1 Jul 2022 10:14:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 06/10] drm/mediatek: Add MT8195 External DisplayPort
 support
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
References: <20220701062808.18596-1-rex-bc.chen@mediatek.com>
 <20220701062808.18596-7-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220701062808.18596-7-rex-bc.chen@mediatek.com>
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
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 01/07/22 08:28, Bo-Chen Chen ha scritto:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> This patch adds External DisplayPort support to the mt8195 eDP driver.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c     | 197 +++++++++++++++++++++-----
>   drivers/gpu/drm/mediatek/mtk_dp_reg.h |   1 +
>   2 files changed, 161 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index b672d5a6f5bd..c3be97dd055c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -105,6 +105,7 @@ struct mtk_dp {
>   	struct regmap *regs;
>   
>   	bool enabled;
> +	bool has_fec;

You're introducing this has_fec variable here....

>   
>   	struct drm_connector *conn;
>   };


> @@ -1018,6 +1074,8 @@ static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
>   	mtk_dp->info.depth = DP_MSA_MISC_8_BPC;
>   	memset(&mtk_dp->info.timings, 0, sizeof(struct mtk_dp_timings));
>   	mtk_dp->info.timings.frame_rate = 60;
> +
> +	mtk_dp->has_fec = false;

.... setting it as false here ....

>   }
>   
>   static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)

> @@ -1498,15 +1562,38 @@ static int mtk_dp_init_port(struct mtk_dp *mtk_dp)
>   static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
>   {
>   	struct mtk_dp *mtk_dp = dev;
> +	int event;
>   	u8 buf[DP_RECEIVER_CAP_SIZE] = {};
>   
> +	event = mtk_dp_plug_state(mtk_dp) ?
> +		connector_status_connected : connector_status_disconnected;
> +
> +	if (event < 0)
> +		return IRQ_HANDLED;
> +
> +	dev_info(mtk_dp->dev, "drm_helper_hpd_irq_event\n");

P.S.: This should be a dev_dbg().

> +	drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
> +
>   	if (mtk_dp->train_info.cable_state_change) {
>   		mtk_dp->train_info.cable_state_change = false;
>   
> -		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> -				   DP_PWR_STATE_MASK);
> -		drm_dp_read_dpcd_caps(&mtk_dp->aux, buf);
> +		if (!mtk_dp->train_info.cable_plugged_in) {
> +			mtk_dp_video_mute(mtk_dp, true);
> +
> +			mtk_dp_initialize_priv_data(mtk_dp);
> +			mtk_dp_set_idle_pattern(mtk_dp, true);
> +			if (mtk_dp->has_fec)

...and you're checking it here, but there's nothing ever setting that as true!

Is there anything you forgot? :-)

Cheers,
Angelo
