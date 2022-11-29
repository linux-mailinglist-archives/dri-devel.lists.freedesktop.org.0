Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE6E63C560
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 17:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8289A10E038;
	Tue, 29 Nov 2022 16:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EF010E038
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 16:42:02 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b3so22937939lfv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 08:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XWZiFupZmDV7/chy9twlz/bKtxk28a/BQ1OZ+FIK00Q=;
 b=j3EsDtkRr80dfR/xeJF6gwYP1e2sFcIhQ0oQxLHTXGRJMj/Bmz6c7p2NFqU7z7QWo1
 biaxP/5qvxiT1oMtwIETJvlry+NdYKhI1LiZsQlnXQlVpDfGYzKbfFbjXGbJ2vmfUOxm
 YhOJGMmSCtbXYaw5JSVRR2qWhbjifompBrqmVbMvW6H8L9SrVWDZagp5r2/LzDK7B5EG
 xUOAPKWgj3Zunrr3jWYwAzeV9cF4+rJqeRWkkh+4nwTHSgJQjUkOtHs2oI21xd0xZsJK
 YLW6LWbjiecVovrgfTN1M+dkkMEeztmHmxD3b1t5rp3+wvMwamvASvUsASBPUvcReqLI
 njNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XWZiFupZmDV7/chy9twlz/bKtxk28a/BQ1OZ+FIK00Q=;
 b=OWTBriyYR6n36lqCQ3ZTwlY31IylvLrq1VA+acx0Na3V7nQjIfZkZyoorxAuQKjeyT
 CmfF8JXLTHA+6m6mo7yprpClSCyVT1UPqiDIeV9a3K35dzZCOgbKNdqbdCNNpby9y4fK
 GEJDbTTMJhBZwh28SSnfIs/4nZtfVRu5taCaNunpDBtWgPMSdz3oHoS4f6mZ9S7zNS+b
 l8LG+xuu+wWt0VqPJzvrf8GjIRWHcGYgoByAC1TLPC4rQhiQWvcpw37qIoneGvL8BI26
 FVC+O6j295yIsqJS1OFm26xE7arOjcaF+jVNtjNvYSKgi8/1EiZ+sd+lQ9uLO+Rnzp9s
 fdoA==
X-Gm-Message-State: ANoB5pn2iAYO2mcWTW1v8F4hOBkkFNmB6lRfN80m4AYZsQRmUjrBV3u5
 3Hvo3kX64LtTXIC1KlusTaF3Kg==
X-Google-Smtp-Source: AA0mqf6bs+MHPq8y/pL1cJ9bImpeUwmQ9PU7zQoTQbWZQI9Y71CuCT3zsDhIG8N1gXr1WdkMo53Jlw==
X-Received: by 2002:ac2:4e82:0:b0:4ac:9f25:21c2 with SMTP id
 o2-20020ac24e82000000b004ac9f2521c2mr16017549lfr.519.1669740120942; 
 Tue, 29 Nov 2022 08:42:00 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 d13-20020ac244cd000000b004b48e0f619asm2271574lfm.48.2022.11.29.08.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 08:42:00 -0800 (PST)
Message-ID: <4299d2eb-7724-ced4-dd68-0f0734725e6b@linaro.org>
Date: Tue, 29 Nov 2022 17:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/6] dt-bindings: mediatek: modify VDOSYS0 mmsys device
 tree Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20221129143503.16638-1-nathan.lu@mediatek.com>
 <20221129143503.16638-3-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221129143503.16638-3-nathan.lu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/11/2022 15:34, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 mmsys device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 0711f1834fbd..3e7fb33201c5 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -47,6 +47,10 @@ properties:
>            - const: mediatek,mt2701-mmsys
>            - const: syscon
>  
> +      - items:
> +          - const: mediatek,mt8188-vdosys0

Why this is not part of previous enum?

Best regards,
Krzysztof

