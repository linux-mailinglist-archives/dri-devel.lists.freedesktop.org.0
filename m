Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB491673EC4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E0E10E9A5;
	Thu, 19 Jan 2023 16:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D3B10E9B7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 16:27:44 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id n7so2401755wrx.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 08:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G/U5zgB7p6OPqHMQlkEy+bwIc9R4WIoTQK22mTGWePo=;
 b=fehBeiL89VwQgVcafbZ9QQSKjqCm23MRx5+udadtSKvVH7KDt3+9ShdubuWImJZN/d
 hWHtyRDCOTanWJpvde1aFlT+v2Q+xYATcGL4q1NVrotOUXxUqFeTWXWJfgo9a0F/LrK7
 dcLbQMkXf057SiNAUXv2qK89NpwC8CGpy40BDeccLXhCdCcj8a7VaNsJsiX0m2GV50gJ
 f1a/OxIqlVSvdITWsbx6fVKoy/306HGBPBl8SfeZsONDZ2qrOfWfa+QDqBEVm6wSmGJI
 aDSoOaqcOOT4Yq4pcCZc1qO00QACoRO9B/3vJM6eiRtXluU2ClwyQznEWa5GZG72NLbB
 Js8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G/U5zgB7p6OPqHMQlkEy+bwIc9R4WIoTQK22mTGWePo=;
 b=YkZGtJVhjQAwejysByZbTqZ8Nw1zgIBtAgeJMNuw4Ims2biGJiLf7YEaPOxQBUWezc
 uGv5IUr79fkAIopaPTjw89FiIzRGzo8Y/4ng/OvgP7Bc872M+AI0QUgdlJ44gBMgiDpG
 ZnRb2g8Kv4/5s33gcy2mKlM99/dSRv9Tmk6KrV5lXdPXgmVVTPEM9uu3uRNZWkkTpXcQ
 OeihUiQOrcLs0CT4RhJoY0BTUiY4U/6W6E2SJV1DNWBT9xOZvf7mxQVhq2r22KytWyni
 wDrgMoUVtBiiGXIOhUiqEbI2GUJZBJnMV0C6v+wwxPi9XksAmp12I5iZge3Azz81YNEF
 Y8kg==
X-Gm-Message-State: AFqh2koMxufi8j5v146Y2Qy41UjL/G1mB+jIekNsFRXLfExXPVCs9pRz
 O6++52SA6BkI3SALnooUrwQ=
X-Google-Smtp-Source: AMrXdXs9Cqz0kN5li7jUZKL9XHr8uTasSMBvof1S8Lp/gYpd11zsi5j9VtdWxlRUsSXtROeRulr9/w==
X-Received: by 2002:adf:ee10:0:b0:2bd:d5f5:8820 with SMTP id
 y16-20020adfee10000000b002bdd5f58820mr10124489wrn.27.1674145663376; 
 Thu, 19 Jan 2023 08:27:43 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 co22-20020a0560000a1600b002a01e64f7a1sm10707038wrb.88.2023.01.19.08.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 08:27:42 -0800 (PST)
Message-ID: <9d991211-4c5a-f6c7-6179-b5740a484a75@gmail.com>
Date: Thu, 19 Jan 2023 17:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/9] dt-bindings: spmi: spmi-mtk-pmif: Document
 mediatek,mt8195-spmi as fallback of mediatek,mt8186-spmi
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
 <20230118091829.755-3-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118091829.755-3-allen-kh.cheng@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18/01/2023 10:18, Allen-KH Cheng wrote:
> The mt8186-spmi is used as compatible with mt8195-spmi on the MT8186,
> document this situation.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml   | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> index abcbbe13723f..e4f465abcfe9 100644
> --- a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> +++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> @@ -18,9 +18,14 @@ allOf:
>   
>   properties:
>     compatible:
> -    enum:
> -      - mediatek,mt6873-spmi
> -      - mediatek,mt8195-spmi
> +    oneOf:
> +      - enum:
> +          - mediatek,mt6873-spmi
> +          - mediatek,mt8195-spmi
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-spmi
> +          - const: mediatek,mt8195-spmi
>   
>     reg:
>       maxItems: 2
