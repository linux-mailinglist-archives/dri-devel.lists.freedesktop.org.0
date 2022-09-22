Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BB45E5C37
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BD810E5B8;
	Thu, 22 Sep 2022 07:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990C310E5B8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 07:20:23 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id j24so9369519lja.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 00:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=l75230f4/Tc4m+TS6iA4e2H4Q+VpG770+Je6OFiVsyM=;
 b=hQ/UL/kN7XbzEXqfO+tmv964OK2GMoUE38JlkbYLqDPJ3sX9aZ7YaBiMAegrLKbyFm
 0lZTvlLYhE4eq+ExfRYlG4w+IguonGImEXN1v7MA9wWCrKgtVqE6SlrQ5VX0NG5E9Y38
 /4BtzZAHXkNvDllPnvs5t7kQv4zT0w0CgLdr2XvTwVocykNzokmm0+yttQvK5fx3Huhi
 zNfdsrW1u+Dk3rWZfo4H2Ndvrr5eoKn1l2tfcmE+E+seNPLEYCzpsjlgaKMuf7tWEqls
 XHvG3Ou2t6CdsQ7XwS5mMARAd0yru57ioABcS+6+ct3Mv211ahTfWMz9T8lmsbob5+7B
 DFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=l75230f4/Tc4m+TS6iA4e2H4Q+VpG770+Je6OFiVsyM=;
 b=7r94Xppc7sCewSAPpGAm7/1D6d5LRJEYLx8q6E5Op8UXVpaxnsLBYscqrja6xzYXHj
 EK782o/1qUm3HNGl+d0hN2FlgEqQT5SF0YvkjMT8z9GS8Gt0g8bWeS/Wm+m+J5K8i7yh
 V1IJNCNQ8l5oKRPdgI9hJ9mJmcHSwP67NOXa34XpHy0VDi71AF9ubsr5zeCjlQpJs43r
 /1jDfx2GtzteYcr3tJOMrNdg0PoNhkeNQ6680KdeWnqpsS7cUFTk3I5cga45jWPGqLp4
 bp7Vl+me8198WLjqVBqcmDBRrOtb4mnSAdP4YSPBC57/WPrl5x/ivGd2evtz/5/H6otZ
 nadA==
X-Gm-Message-State: ACrzQf1hHymrG7wRKfG5ZQml7Yb3FbBReKxUQRoskv/1e1K2yl1eXNNK
 1GowwCoQwf8XSqiHGRIoSgfLIQ==
X-Google-Smtp-Source: AMsMyM5wVw1kKJjWwk0eAv9vC8nvZTseIqkjOoLB/YN16eVtCyQpO11pitWkmTSeOsIupJQ3U8Qndg==
X-Received: by 2002:a2e:9b17:0:b0:26c:4ede:512c with SMTP id
 u23-20020a2e9b17000000b0026c4ede512cmr577476lji.529.1663831221961; 
 Thu, 22 Sep 2022 00:20:21 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 a14-20020a195f4e000000b0048ae316caf0sm805348lfj.18.2022.09.22.00.20.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 00:20:21 -0700 (PDT)
Message-ID: <e993c25e-f334-e1ca-73f8-58cf141c521e@linaro.org>
Date: Thu, 22 Sep 2022 09:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 15/17] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8195
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
 <20220919-v1-15-4844816c9808@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-15-4844816c9808@baylibre.com>
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
> Add dt-binding documentation of dpi for MediaTek MT8195 SoC.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index 5bb23e97cf33..2c7ecef54986 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -24,6 +24,7 @@ properties:
>        - mediatek,mt8183-dpi
>        - mediatek,mt8186-dpi
>        - mediatek,mt8192-dpi
> +      - mediatek,mt8195-dpi
>        - mediatek,mt8195-dp-intf

Aren't these the same?

Best regards,
Krzysztof

