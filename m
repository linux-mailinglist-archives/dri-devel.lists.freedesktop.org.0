Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 505DC6396A2
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 15:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B0210E150;
	Sat, 26 Nov 2022 14:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCCD10E14B
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 14:46:31 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id b9so8196859ljr.5
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 06:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6cZq8OT8F2u1G+4KG5gAMpwVp5A0HMoWu/Eqh8dw+/I=;
 b=O/f4KfYlk4WCT/fyRp+lpMRV2476Va8uYDvN74Dii3D2KJinIBhs0Gw9QTEW898DI+
 OBNZr3b9HiW8hk/34tqUR0bdke9WGmA8/cnQ6HL+XoOkT/N6VKwA+GX17LCzNjZzTsUS
 cp7zcm1rguf4JKlilXLNBPA8UYruJpz2BdenOFaTqps8YIQQ6f/TR2tSiUJSiQSwEWq0
 7mTTMtYIuraGbbGGWDXOWz3j1Uz/8hRHW8jfRvCBABRDT9MmaHH/umQENZciqdJP2uF+
 EVpH0/z1W2RdNudceST+0Lok3UaGNMgZkxNzuzS+Y8vDesoXbUjBRNOKN4eKX6dbrHrD
 r54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6cZq8OT8F2u1G+4KG5gAMpwVp5A0HMoWu/Eqh8dw+/I=;
 b=eU7/VlYMnYlL8fjrOX6dpKAtzhnRDFwn/Uxcv6Db9l925LiXPeeAKJbUx16jW3GOGT
 Fbb/xy0sSO44x60+aUq69AZofmjSrDiQM4KNMYTKPb4xT+sPau8anhHtvJNY54xhGUdn
 YGCgMXpBZ7PGnaRHzHd+W58noCG8UbKT6xM4oHz/eifBuzngQmOg00skSVCU+OumDLOq
 wGeO5Sk6nZ7YTSN+2sGAnI/jv7ejunD+4iOgQpzAi8vilBbQ3RG3wB0UTLxUQ6QS4NHD
 jH4OjN+nzjMDDCp6L2g1AELxeXweL7WtkFJzsNgy6t6bB1VgJgBwPiry6nBmF4Af4pNk
 tsUg==
X-Gm-Message-State: ANoB5pn0oHl6thMtEcckG3XfPg+zWF7ggO9p/edouG4gfOmepx5y43NK
 wsbKBKaFMkU19819V0WDS26/OQ==
X-Google-Smtp-Source: AA0mqf7l3fakUd44VH4Y1atC95rlxJUi7tt32oesGR4CbTxFRdKiko9XXZCSiCq5OA1bGwKmQYKjyA==
X-Received: by 2002:a2e:3a1a:0:b0:278:f073:d3c0 with SMTP id
 h26-20020a2e3a1a000000b00278f073d3c0mr15168000lja.357.1669473989436; 
 Sat, 26 Nov 2022 06:46:29 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a05651c032c00b0027741daec09sm643691ljp.107.2022.11.26.06.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 06:46:29 -0800 (PST)
Message-ID: <b3a9f5e2-56ca-b112-e0f5-563404dcb05e@linaro.org>
Date: Sat, 26 Nov 2022 15:46:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 08/18] dt-bindings: msm: dsi-controller-main: Add vdd*
 descriptions back in
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
 <20221124004801.361232-9-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124004801.361232-9-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/11/2022 01:47, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml we didn't include descriptions for the
> existing regulator supplies.
> 
> - vdd
> - vdda
> - vddio
> 
> Add those descriptions into the yaml now as they were prior to the
> conversion. In the .txt description we marked these regulators as required,
> however, that requirement appears to have been in error.
> 
> Taking the example of sc7180-trogdor-wormdingler.dtsi. The avdd and avee
> come from GPIO controlled external regulators, not the SoC and in this case
> there's no need for vddio to power an I/O bus. Similarly the regulators for
> the LCD are controlled by the panel driver not by the dsi-ctrl driver.
> 
> It would be possible to connect a different type of panel to the DSI bus
> here in which case we may or may not want to make use of vdd, vdda or
> vddio.
> 
> This is also the case for older chipsets like apq8064, msm8916 etc the vdd*
> regulators in the dsi-ctrl block are helpers not dependencies.
> 
> Add the description of vdd, vdda and vddio back in for the existing
> upstream dts where vdd, vdda or vddio are already declared but, don't
> declare those regulators required - they are not SoC requirements.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 0fbb0c04f4b06..bcbcbdca1a78a 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -133,6 +133,18 @@ properties:
>        - port@0
>        - port@1
>  
> +  vdd-supply:
> +    description:
> +      vdd regulator device node

I see my comment was not really implemented. I asked:
1. vdd->VDD
2. Drop "device node". It's not a device node. It's a VDD regulator.


Best regards,
Krzysztof

