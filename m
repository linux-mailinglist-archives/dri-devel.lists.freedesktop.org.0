Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1C94CD3F7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 13:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5E210F330;
	Fri,  4 Mar 2022 12:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77F410F330
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 12:05:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0B0381F4666B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646395510;
 bh=VHYyfrj27ghhFNATqiJptaXl35MZfcmk6S/le8aQ8V0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lBWseeaKZhZUehk0Y28SYbDmAJ1Q/Hne5Swp5jgROU/3jmS5A7rr2qkQRqKMYQJY4
 mmWtA4wfg4dg2WR74NHRBkotetmfIKFd/19UPI1EziPT8FxeP1EryMr7JFB/XA2ZRx
 mSyoWgf1pGFRscJiMo5b2qdPe0ZiwGxdK50aBKTCf7tb8YD3mtWWJ41mOr8uNHbriY
 8OZQUnPQkqpf71Vcnoih32oZyX69Rf73umh86Yn/rFQSaGuCV4/S9OvMT1oP9vl3Uz
 x9yUuOZLt3UOFRI20SlICBP9nhbraU/Da4iFv0zG99PVBysrkjQSg3wMUCiL0Aeo4v
 rxwFr5/NQ7sOQ==
Message-ID: <4e45bd1d-c81c-97be-f505-cd03ffcdd442@collabora.com>
Date: Fri, 4 Mar 2022 13:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2,3/3] drm/mediatek: Add mt8186 dsi compatible to
 mtk_dsi.c
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com
References: <1645178869-18048-1-git-send-email-xinlei.lee@mediatek.com>
 <1645178869-18048-4-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1645178869-18048-4-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/02/22 11:07, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add the compatible because use different cmdq addresses in mt8186.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index bced4c7d668e..8c61c4f412bc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1140,6 +1140,12 @@ static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
>   	.has_size_ctl = true,
>   };
>   
> +static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
> +	.reg_cmdq_off = 0xd00,
> +	.has_shadow_ctl = true,
> +	.has_size_ctl = true,
> +};
> +
>   static const struct of_device_id mtk_dsi_of_match[] = {
>   	{ .compatible = "mediatek,mt2701-dsi",
>   	  .data = &mt2701_dsi_driver_data },
> @@ -1147,6 +1153,8 @@ static const struct of_device_id mtk_dsi_of_match[] = {
>   	  .data = &mt8173_dsi_driver_data },
>   	{ .compatible = "mediatek,mt8183-dsi",
>   	  .data = &mt8183_dsi_driver_data },
> +	{ .compatible = "mediatek,mt8186-dsi",
> +	  .data = &mt8186_dsi_driver_data },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
> 



