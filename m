Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A67A5E5C49
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E022610E0C2;
	Thu, 22 Sep 2022 07:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F3810E0C2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 07:22:55 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id z25so13232395lfr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=JDY3wyLD4djHNv21bBZZzvFe5rrOQU/pLSj/gQsk7Ps=;
 b=XwHK0QxbkukB+0pfeLp3iJq83T4xdeHh69DQgP8mfmueJLRE765/q+ase9/sNnJs21
 gef4QcYwhvGMJ5I1rOMv4c8iBQEkec5oCScXqe7tEEAh1hYgL/KDHOgUqd+Y2D7/j3qh
 ZQ4uIoPTMlwg/4tS9A7ZZFfoIDVQ2RJjSyPcTigutEkwRe1QNvQ7h9X83DJcBahprX+J
 dZNgSRwzevigqAap02exRBv78XIlWrdN6evViK4G4y3mTDz+ei4bVP1lYTyUF1vdPNZA
 0xD8F3pll7zdcIu5IlxU0TFQmobM5M56Pr+dXMaCNQmKgBXoiyoGaTwzgD0iXpKJUQQ8
 OP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JDY3wyLD4djHNv21bBZZzvFe5rrOQU/pLSj/gQsk7Ps=;
 b=IdLdOa4REtB7NV3lYoDrz3NjulB7cWfQuC94E+ikZLG4diCCPAOt65OzU4AXqcg4zb
 jZBJJSICBpS+xKEU0R5AW2OBzuH37yPbOlROliicCy7ssjOFGwp+dhAi/Zgdcc0mhlZJ
 RNWT5rQ8dJnz0/pOaXCv5gqKnNF0N/2KD+msLHyUKCpu9LRR2qVyd/alt+bKFxCJFHN4
 5iJ0iQIIIJp1J80TPG7LgnmNNgWZiUxuySF1pZBY3+ARhRtKjV1hMcn2dPdNakg/15p0
 +jN/DYm/+FTP+cyFCH9YwdqWoSwvMq1XohfyUAQrc+W3ogVhCsPE2fXOTZ+DIpPhFDE7
 +hfQ==
X-Gm-Message-State: ACrzQf0KgfFr/rUoGcRbRyTDXjr78QqmUFa/6xenBbr4/YBDmJ/vKAnS
 FT7+VfuaKy3qnzLwwmHNtQQrgw==
X-Google-Smtp-Source: AMsMyM5+A2X0Idpf2Cy8iDaQZo+BvsjA2Xr5j4lwWyGuafVss0uDTPYm+TtzlvtHMoansllc4Ccy/w==
X-Received: by 2002:a05:6512:b9a:b0:499:b537:fe60 with SMTP id
 b26-20020a0565120b9a00b00499b537fe60mr785618lfv.319.1663831373857; 
 Thu, 22 Sep 2022 00:22:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 i20-20020a198c54000000b004946c3cf53fsm804450lfj.59.2022.09.22.00.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 00:22:53 -0700 (PDT)
Message-ID: <11592bcd-eec7-7cc0-86c6-8f440b6af447@linaro.org>
Date: Thu, 22 Sep 2022 09:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
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
 <20220919-v1-16-4844816c9808@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-16-4844816c9808@baylibre.com>
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
> Add the DPI1 hdmi path support in mtk dpi driver
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 630a4e301ef6..91212b7610e8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -15,7 +15,10 @@
>  #include <linux/of_graph.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/types.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>

Why do you need these headers in this patch?

Best regards,
Krzysztof

