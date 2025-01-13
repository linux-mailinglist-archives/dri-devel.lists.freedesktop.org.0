Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46D0A0B727
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 13:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2FD10E21F;
	Mon, 13 Jan 2025 12:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mthwYCH9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DB210E21F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 12:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736772111;
 bh=0regcGnIiOmQotfiGELt5jiaeJOWuIi22iTIBQAFX6Q=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=mthwYCH9BDqTa6lcFAbSQZQ5FP4QTeiwXGOOyLe4ArVITbuDL3fwwtoqazrU/Bua+
 eLrUqtGBEpWkZ5aLMe9QTqzYPfPERMqReB8+3TWGf4qfyHZ2GRHXumzZf0mX1Q5xME
 lkxPMEk2fkWAivWK+gTqIi2MhAi42cp4f1jgxxGEyEu1dqWa/E6SqGXhN8wHhSU+HQ
 QMuH0zunkGC6MzfphecAFRloluvs9QHnqQ4zWrnQKasDVkW5dPp2UPdPYqcwkZbkHC
 TeOIIutCrSBcBR4HDYvHQ1+BBQtXxY/RdJv96c+5dpJqwJ+O121X1EHhAlWVzHvUfL
 i1tIwT+Y8sGug==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EC05217E09AF;
 Mon, 13 Jan 2025 13:41:50 +0100 (CET)
Message-ID: <ef0baed6-54d2-4f1f-9a4a-769ec09a069f@collabora.com>
Date: Mon, 13 Jan 2025 13:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/mediatek/hdmi: Simplify with dev_err_probe
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
 <20250112134708.46100-2-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250112134708.46100-2-krzysztof.kozlowski@linaro.org>
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

Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
> Use dev_err_probe() to make error code and deferred probe handling
> simpler.
> 

That's already done in [1] so you can drop this commit.

[1]: 
https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com

Cheers,
Angelo

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 4b0eb7dc25d8..22935fdc5afe 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1429,19 +1429,13 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>   	int ret;
>   
>   	ret = mtk_hdmi_get_all_clk(hdmi, np);
> -	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "Failed to get clocks: %d\n", ret);
> -
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get clocks\n");
>   
>   	/* The CEC module handles HDMI hotplug detection */
>   	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
> -	if (!cec_np) {
> -		dev_err(dev, "Failed to find CEC node\n");
> -		return -EINVAL;
> -	}
> +	if (!cec_np)
> +		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
>   
>   	cec_pdev = of_find_device_by_node(cec_np);
>   	if (!cec_pdev) {
> @@ -1492,10 +1486,9 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>   
>   	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
>   	if (!i2c_np) {
> -		dev_err(dev, "Failed to find ddc-i2c-bus node in %pOF\n",
> -			remote);
> +		ret = dev_err_probe(dev, -EINVAL, "Failed to find ddc-i2c-bus node in %pOF\n",
> +				    remote);
>   		of_node_put(remote);
> -		ret = -EINVAL;
>   		goto put_device;
>   	}
>   	of_node_put(remote);
> @@ -1503,8 +1496,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>   	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
>   	of_node_put(i2c_np);
>   	if (!hdmi->ddc_adpt) {
> -		dev_err(dev, "Failed to get ddc i2c adapter by node\n");
> -		ret = -EINVAL;
> +		ret = dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
>   		goto put_device;
>   	}
>   

