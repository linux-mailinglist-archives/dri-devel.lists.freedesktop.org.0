Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 844815BE371
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 12:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C1910E4BD;
	Tue, 20 Sep 2022 10:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F099910E15C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 10:38:34 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6FF5F6601F3B;
 Tue, 20 Sep 2022 11:38:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663670313;
 bh=CPxTsxwwUNVTZuVWPCLD0D4xQtfZBz/Zni7nORIgDcQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eTw9OQKFdxPnrguxbqFoyF1fV4CKVwuPAMQyMRgJuj+DgcKN1WIFBGD1ZHYBk6yIE
 jZTpkwMJakGsN+IqRkGfy3++gp9bSfK3mVqkP8RIm1uIXVcwyLuQnP+85hn81XTlow
 9mRz1PqsPAlZ6SBEAqK5twFvYSTwJvXzBmY+wTqKDwBuoRCnnjUIzGAAKwVMS5sP06
 z7jE6JkaFMLkNGe2tVfuITbdu7JWfhrgFPJpiAKDFTlPyzhmhGD8T8b6JeZ/YXcRY7
 csx15Vlm7Vl2z/uhn9HRswHDyT5pXPho4M6/FLRUuDTg4yo1zsvtvqntZ7/UycAnwL
 dcf85iGHGCMGQ==
Message-ID: <5920ba96-886c-1195-656a-a98d7b1f6623@collabora.com>
Date: Tue, 20 Sep 2022 12:38:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 09/17] drm/mediatek: hdmi: add connector flag
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-9-4844816c9808@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v1-9-4844816c9808@baylibre.com>
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
Cc: devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
> Add a flag to indicate support for an external connector
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> index 86653ebaacfd..30407603d693 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> @@ -199,20 +199,22 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
>   		goto put_device;
>   	}
>   
> -	remote = of_graph_get_remote_node(np, 1, 0);
> -	if (!remote) {
> -		ret = -EINVAL;
> -		goto put_device;
> -	}
> -
> -	if (!of_device_is_compatible(remote, "hdmi-connector")) {
> -		hdmi->next_bridge = of_drm_find_bridge(remote);
> -		if (!hdmi->next_bridge) {
> -			dev_err(dev, "Waiting for external bridge\n");
> -			of_node_put(remote);
> -			ret = -EPROBE_DEFER;
> +	if (hdmi->conf->has_connector) {

If MT8195's DPI uses the internal HDMI->DP converter, I say that the external
DP has HDMI input and DP output.
Logically, you can't have a HDMI port that's connected to nothing.

Please, rethink this change.

Regards,
Angelo
