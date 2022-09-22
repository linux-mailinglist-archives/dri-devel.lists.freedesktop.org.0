Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15665E62CB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 14:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF15410EB02;
	Thu, 22 Sep 2022 12:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2367410EB02
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 12:51:16 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id l12so10849721ljg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=AcReqp2gEJDplwIiqlXdRZl1+dQuLiAN6jLoyy64CrI=;
 b=vniiXCPYi2uHVswmxrHaLfifuGnTgh31cEiXXDrVozUBpdvgG1p2hAl0Iuww/tOgJC
 51g7fQ3iDc/taoVV7V4GHA31OjtWbcgJMDX+hUwoS5rCcH8Dl+8Stfx1M/7mE1+2Bd5A
 FS/3RYRQ2KRYMI6qPadyS/zKUJ0TBby48SUTUC1KBsX5KZbvKo+hEWmsvOh2eFQKBdcC
 lOXsuuZFZ01TsN9IObctd00VrMglSMuCMpC2mBh7+57odvkGvsZJc7Hl12+6BMPhz4h0
 VlXKpbLhfEODyJm8qT4XpB00JjoItgQhb2I/QFcMCOxYSwJH/kgC8yWpEJ4swhQZGhR5
 5V7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=AcReqp2gEJDplwIiqlXdRZl1+dQuLiAN6jLoyy64CrI=;
 b=t4tevz6YSsUe2UI/I6P6kJUE/AVuV6VUWY/yOkjhIEqIZ2BbRW3fX+lTwSr2ThUqhh
 Fl9qO56V2IjtXfi7sdMI9cOZifamoaye9rkFHAlU6D/9kd0qdPagDnIsLviGSHVNPzd5
 x1kBabsxzVQcr9wMWgd4T0saCqZgLX5xtNK8uS1KSCIJBKGwrA4GFJeHz997xR8pnPAn
 NDOOmnXJPmGUKej+44lu60cNNamipjXCf7j1DUW9am59pMr7MiHU6y3wrAau5aZkrlnr
 fKrHazJMZGtOJfk9OgDgvvQQO1YOUxZZadVXsrDg4cbjiSNrloiKORlJPNsCtYt48PZ1
 PQCA==
X-Gm-Message-State: ACrzQf03CtuecnUXm4/rOC4Fk1DxUfHrmiMRVOvATEGbkyX78nOrz17Y
 5EfDSGBCwicQoNHiXg52a9xVZw==
X-Google-Smtp-Source: AMsMyM6zFmrBuzTnD7uKlfv9Cfe4AuqBZFpoTZEtb1B6RSpxjj2qH9pnzETt4sbwd+x+Txnu7oQFsg==
X-Received: by 2002:a2e:bf0c:0:b0:260:3df:1bce with SMTP id
 c12-20020a2ebf0c000000b0026003df1bcemr1096075ljr.117.1663851074490; 
 Thu, 22 Sep 2022 05:51:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 k20-20020a2eb754000000b0026c64fd8f0csm845872ljo.71.2022.09.22.05.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 05:51:14 -0700 (PDT)
Message-ID: <98e33290-b571-221a-75cd-386ab39a4819@linaro.org>
Date: Thu, 22 Sep 2022 14:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 01/17] dt-bindings: clk: mediatek: Add MT8195 DPI clocks
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
 <20220919-v1-1-4844816c9808@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-1-4844816c9808@baylibre.com>
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

On 19/09/2022 18:55, Guillaume Ranquet wrote:
> From: Pablo Sun <pablo.sun@mediatek.com>
> 
> Expand dt-bindings slot for VDOSYS1 of MT8195.
> This clock is required by the DPI1 hardware
> and is a downstream of the HDMI pixel clock.
> 
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

