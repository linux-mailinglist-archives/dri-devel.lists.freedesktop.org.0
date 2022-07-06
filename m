Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0ED5688CA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 14:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1771E11B01C;
	Wed,  6 Jul 2022 12:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB62211B01F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 12:57:39 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id bx13so18367155ljb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 05:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=q4qL646g+dPV/1dAguuPRJHbp+riKG5TWuUodAczhNs=;
 b=bLFBOIfT+FRUTzf2Ks12yMYU4s5V4up/R+PtWt8nbikcgt9NCOKMfeLcdKDhkhwl0v
 91rDCPlPZS7N9fZLgJSZrlP6l5RFxWukCoOwWF/sprACqs8TD/XVCx43j+jP8H3lLGTm
 ZrK3B3B+TDwa/pOdvV2HLijpVWPoPaloRYZU8Fv9moyRt7Kle/xZ8fGEkqi1D4J246oi
 MqyTtkToqlrktl174U3Gbevdic1nFeZ+s+tmH/PvEoNxP0TXIeQkz7lEdjwpa+eGifdX
 0EuUbUfBlUiRf6dAUO9dmot/C/lRCBzbt1gylFiaKKRy/TWVps3SLOE0I7h2k71U94Qq
 lWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q4qL646g+dPV/1dAguuPRJHbp+riKG5TWuUodAczhNs=;
 b=PrS+hC/F7LB62bTfQo0tQJP6UVI0FG3akooQuT5xHSY6aXFuR8WXb9bTK4Tfi3FljT
 VfMb4wLDxBRSTUFy4/LTx7iVGCP1ljENe322cr/1BiJ/9K61n6KUrw9sTvcM4bhER51A
 ulgABn6kueIrn3vpM8VL+hqeYpGhIQQVX5NsW9AoebrcmYeEi0Gvc3n/PkmNHO9TeypK
 A8TAf5Tr8kfz5EqgCcq5400A18XfFDfh33Wb/oQdoKlYcnxfQ9h6dnwwgKUaYIo+vcKt
 1N6sooeBnag74TL+mpRAKZRlUfmE0wOaem7GOtxTd4ehKoWQoN4DOeyb8jxydSKa9w2i
 klEw==
X-Gm-Message-State: AJIora/vvNaiSwiP1QYLJr2ud0z2p2aVOyjL2/cvX3CiAPW700M/HQIb
 P8KP5kQ8EhEE5uA4HfqV5BnotQ==
X-Google-Smtp-Source: AGRyM1sxSzE4RVFE/z7AFhVcj2m8K5D5n91eVpcb8YK/KiiDH7f5ktCSCDvDHHo9EBFmBkwiBIRyzg==
X-Received: by 2002:a2e:3215:0:b0:25a:93bb:f801 with SMTP id
 y21-20020a2e3215000000b0025a93bbf801mr23378514ljy.489.1657112258181; 
 Wed, 06 Jul 2022 05:57:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c25-20020ac24159000000b00478f174c598sm6268148lfi.95.2022.07.06.05.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 05:57:37 -0700 (PDT)
Message-ID: <6130f39d-21b6-145d-8e6b-26c2f4b89e88@linaro.org>
Date: Wed, 6 Jul 2022 15:57:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/7] dt-bindings: msm: dsi: Add missing clocks to 28nm DSI
 PHY YAML
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-7-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220630120845.3356144-7-bryan.odonoghue@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2022 15:08, Bryan O'Donoghue wrote:
> Add in missing clock and clock-names declarations to the 28nm DSI PHY.
> When converting from .txt to .yaml we missed these.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

I checked the schema. I think you can drop this patch. The issue that 
you probably saw with apq8064 should be solved in the dtsi, not in the 
schema.

> ---
>   .../bindings/display/msm/dsi-phy-28nm.yaml      | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> index 3d8540a06fe22..9ecd513d93661 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> @@ -19,6 +19,21 @@ properties:
>         - qcom,dsi-phy-28nm-lp
>         - qcom,dsi-phy-28nm-8960
>   
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +        description: AHB clock
> +      - const: iface_clk
> +        description: AHB clock
> +      - const: ref
> +        description: Block reference clock
> +    minItems: 1
> +    maxItems: 2
> +
>     reg:
>       items:
>         - description: dsi pll register set
> @@ -36,6 +51,8 @@ properties:
>   
>   required:
>     - compatible
> +  - clocks
> +  - clock-names
>     - reg
>     - reg-names
>     - vddio-supply


-- 
With best wishes
Dmitry
