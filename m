Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D68B6A1ABA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 11:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A1C10E0C5;
	Fri, 24 Feb 2023 10:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1B910E0C5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:57:44 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so1477999wmq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wUzlOGkuT0rri1NZcy3oPLiyFwjaeCiqRMJCuHFb5ts=;
 b=dLreh8Yxx9kckvOfZdklyGyT2utdxcqAYoLD3p9a4v83wuopSnCDDCTGaXv54KIEQg
 HYn16dO3Oc5y2cTr2+l1u+X3s3DwdDED9B9auqLhQKERxmugO+WcUKG/x1Fc61aFEor7
 8qYRGkXuBeElYZuzxQHLCLA9wwgSrU5BXVDyPA4bX4ouiLj0HL1nOHCXo5G79sT2CF9r
 Ok5ISa0ZCDtHrCR1e4D2U12jI16IZrCqvn15mIxIMSBixhPWjr06VZenN7d8NEJ7pc3e
 OYr4csPS6itxsoPWEepLxbHpDqCnQjhYziAm/UyoHuwfZxFGfRzRU/DfUIh+zaj03QiU
 VarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wUzlOGkuT0rri1NZcy3oPLiyFwjaeCiqRMJCuHFb5ts=;
 b=EIrM7gU0luwaNQa7BP8+NH15I3EPYVujEEgJIyfVpf1LCb9p+632VEZIq1mDieVYO5
 QjFtxcQqMucA86xDunnvXIifMZG4W8gWQltChKnjYWSezEQqR+UDVuhZrMoji9XMcNHO
 tTNTI0+FjPsFevPBD8kivG56Ck57JHECuHNsUC9c2rm9e1Dftny855AjrRqAwSEHujW/
 tzgs3s1Q+2H8JJp7Ftw5icW79/jvPb6ChRoPkftfPwlHDmJoY3FBzlr7g8MvKH44ugQ4
 Wl3eD5M6cPovJIg9oD2p/9pGlYqAOlP4z+yYbAsCeWFcaDIBw7HdTKUIlXCxheSdW0S6
 svNQ==
X-Gm-Message-State: AO0yUKVg7CreosGNBs/J+8WtR9358kFQhiLEbOtWf+NmlZYAjyFyUgaC
 6vApMw7nYzwGgHRckUPmNCsF/A==
X-Google-Smtp-Source: AK7set8ofc+BvKAusfSUZGB0OaFA138AUMJg1kOmeEms6DUeu1XH/pOv+hyOfB0pioS72PKGct/gZA==
X-Received: by 2002:a7b:c7d4:0:b0:3df:de28:f819 with SMTP id
 z20-20020a7bc7d4000000b003dfde28f819mr11541352wmk.15.1677236263072; 
 Fri, 24 Feb 2023 02:57:43 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c42c700b003db012d49b7sm8464475wme.2.2023.02.24.02.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 02:57:42 -0800 (PST)
Message-ID: <f38158f6-5493-5b85-1353-9b75f66ad0d3@linaro.org>
Date: Fri, 24 Feb 2023 11:57:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 02/11] dt-bindings: gpu: mali-bifrost: Split out
 MediaTek power-domains variation
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-3-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223133440.80941-3-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2023 14:34, AngeloGioacchino Del Regno wrote:
> In preparation for adding new bindings for new MediaTek SoCs, split out
> the power-domain-names and power-domainsvariation from the `else` in
> the current mediatek,mt8183-mali conditional.
> 
> The sram-supply part is left in place to be disallowed for anything
> that is not compatible with "mediatek,mt8183-mali" as this regulator
> is MediaTek-specific and it is, and will ever be, used only for this
> specific string due to the addition of the mediatek-regulator-coupler
> driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 02699d389be1..ac174c17e25f 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -145,6 +145,18 @@ allOf:
>          - power-domains
>          - resets
>          - reset-names
> +  - if:
> +      not:

I think this makes the binding difficult to maintain. You have:
1. if - amlogic - then - some properties
2. if - renesas - then - some properties
3. if - not mediatek - then - something else
4. if - mediatek - then - some properties

Instead just disallow power domains in each of other variants.

Best regards,
Krzysztof

