Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 942BE5E5C53
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA00410EA59;
	Thu, 22 Sep 2022 07:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAB410E0CE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 07:24:29 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id k10so13211105lfm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 00:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=fVcE2reQEfaEop4WRxdK1mO72Ip3uJjJkJGgaluoDsM=;
 b=MSlRGljboTuGCdg3YEgOuKZBwTHCYcmzhnbgNphcxRdZyyfnwC664T8n53L+7Kb5A1
 cBjGVu/xWbq4oUq8SLl+K3rsUKIyb/pAPtYAe6Ak01fZY6SfyZEnTaLs/z3BMKPjkSgv
 vjmGQIgs1lLjxNx/uTL+ut/giC8XhZcsQwMrTBvzpBex0lB1/0LvbylWJluy/Ic3INLQ
 SjlutBZR81gnaEMn5Jc0oha2px1AkGagITF9BddZQkinMio1PuFwtZLaGSUmLItkLHzB
 1LEDnf+uCMw/DTWJNW0akGZdDtngxnSDEMs68J10o1m+HzEjBBsp1pp6Xc4Uce8MuQ5O
 YqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=fVcE2reQEfaEop4WRxdK1mO72Ip3uJjJkJGgaluoDsM=;
 b=IdS5gbgVAEpS6PEdalDsvBPtFSJIO/RqYjzfiooLtjlO4bpQVfpM2UrP8WFW2IXdj4
 mAYzhG4wDCh1okR6GZk+yhSiNf2KGD6TdWNDwJ+9e2zf6zz6L/+WR9gTWmTm7Hmzrc/W
 lY7/S2kYXq5QdzG+5htn/8S4aBAn3732FlTmQYqR6fC8wm9wA42qybd3YkVoTSqSOOn5
 3oihWUVFv4e10nfLgr7lcGynUDt4OCzqWO4Q0zZJPt48vdbLwkkq68mz0vArmQut0eBC
 Pmrijf0WS/HqQiArDKYB9l2vOCpYwuIbrLS77/6nPXdlUOT/oDbJJAEzOo6G7X455+XB
 3P0A==
X-Gm-Message-State: ACrzQf2quzJU8nUUTpH+graZEofXuJ7G2qWV6VgX0sSXcQBkje63iKYY
 bYg79F1wwfgO9pXE/qU/43VtOw==
X-Google-Smtp-Source: AMsMyM5zA8VBFZmHafhekY2Y0dpCwQNF2kNCm9Hgz6tvQd/1QC+mRy8x/sO+uaHu1Mn31n8rO9wtGA==
X-Received: by 2002:a05:6512:370c:b0:49f:c4fb:8706 with SMTP id
 z12-20020a056512370c00b0049fc4fb8706mr723544lfr.635.1663831468306; 
 Thu, 22 Sep 2022 00:24:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 j5-20020a2e6e05000000b0026c59d3f557sm769428ljc.33.2022.09.22.00.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 00:24:27 -0700 (PDT)
Message-ID: <c74b4ab7-e307-482b-c4fc-0a7a1e39d6d1@linaro.org>
Date: Thu, 22 Sep 2022 09:24:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 11/17] drm/mediatek: hdmi: add mt8195 support
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
 <20220919-v1-11-4844816c9808@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-11-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8
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

On 19/09/2022 18:56, Guillaume Ranquet wrote:
> Adds hdmi and hdmi-ddc support for mt8195.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>


> +static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_hdmi_ddc *ddc;
> +	int ret;
> +
> +	ddc = devm_kzalloc(dev, sizeof(struct mtk_hdmi_ddc), GFP_KERNEL);
> +	if (!ddc)
> +		return -ENOMEM;
> +
> +	ddc->regs = syscon_regmap_lookup_by_compatible("mediatek,mt8195-hdmi");

That's not how you get regmaps. If you the driver grows, are you going
to grow the list to e.g. 10 syscon_regmap_lookup_by_compatible() calls?
This has to be by phandle.

Best regards,
Krzysztof

