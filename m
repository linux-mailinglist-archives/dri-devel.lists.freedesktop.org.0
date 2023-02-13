Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F16AF69435B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 11:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8424410E53F;
	Mon, 13 Feb 2023 10:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FDD10E53F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 10:45:27 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j23so11714193wra.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 02:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S8UFJP/UsuYqUTLKQBl4SQ4Mr97Ly8Qtr9hCCluFle0=;
 b=w1TE7+oGW0mDhzCJKIBQ089FkiikyWVzp7J9tboeLGaYgdxyePRgEKjsEnHyfg1FEb
 plvUG/2QT9T0VcRW9NcJmsKkSkMjuRBJ99IDP1NqC3fdB/2FMk3Qyrp9oH6xU2gC3Rhc
 V4pV0u3MxSHx5MsUMGC91h/ZnKNtSMxVHHpOliqfrRahwlUPOK2he8Z7kTyQIFwqB56I
 Dy3CoKwusYYkubdvR+rDQ9XPzfucmNWOVnU4nuK0gbYcPVqX/rkZRM43J+pC+s6JBEMJ
 NbqcUFQeY/yZSakd78R7UqzVJQBpYDHAoui9QQ/kSY8DBOTf/eEWXsdGjqCoCK8xSZSA
 em8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S8UFJP/UsuYqUTLKQBl4SQ4Mr97Ly8Qtr9hCCluFle0=;
 b=MMjPjQU69apez1Sfoe4SICoAO2pM6fR/zbc4xYT5OJMxqMVIAzy1EdsuhLpdF7nsbj
 NGJn/T+j8YD+5EigtSvDxy10WM8eYR7WVH6wEF3yQLQ0QX4bzQ0MUrRPZB5uq7f+JDcc
 S0+ekuoU1tpLQODU7ML/vIW2BRC/VcVTZnLYph+NjX4M5JxdqSlXSMxgi24iFJ71XkmP
 nkmwtN4EJERe8UZExxP9h4mk2Ekxpof1T+gX7d1bXWjhYE4MI2AkKF5BCDfejIz9me/R
 CB5LiorWxJxgzAh7NTxyTm57K90z1Rt8SLa8IfshQx3dg2N4TzW1iCa9N+57uF9qN+Lo
 GOUw==
X-Gm-Message-State: AO0yUKUw4ITThHfAfJbMamFLJM0/a+K0wfDjKX7Lh6zRUMM1ZB00ehuk
 tOpw75UG3cKtCbPMg3pBiW78/w==
X-Google-Smtp-Source: AK7set+bcQ0uYZj3HdW+5cFNLawHTRc6K780n1e0pMVm/oqSPl7N0qrcpd6wOKFuR+f8L5wtBku57w==
X-Received: by 2002:adf:f111:0:b0:2c3:f06f:850c with SMTP id
 r17-20020adff111000000b002c3f06f850cmr20889689wro.31.1676285126140; 
 Mon, 13 Feb 2023 02:45:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 k6-20020adfe8c6000000b002c55551e6e9sm3416169wrn.108.2023.02.13.02.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 02:45:25 -0800 (PST)
Message-ID: <6cffa875-d8cc-a4fe-e18d-2e24c28a49d8@linaro.org>
Date: Mon, 13 Feb 2023 11:45:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Novatek NT36523
 bindings
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230210161925.32343-1-lujianhua000@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230210161925.32343-1-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2023 17:19, Jianhua Lu wrote:
> Novatek NT36523 is a display driver IC that can drive DSI panel. It
> is also present in the csot and boe video mode panels. It is found
> in Xiaomi Mi Pad 5 series.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>  .../display/panel/novatek,nt36523.yaml        | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> new file mode 100644
> index 000000000000..a7098d0ce7e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/novatek,nt36523.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT36523 based DSI display Panels
> +
> +maintainers:
> +  - Jianhua Lu <lujianhua000@gmail.com>
> +
> +description: |
> +  The nt36523 IC from Novatek is a generic DSI Panel IC used to drive dsi
> +  panels.
> +  Right now, only support cost and boe LCD display panels with the

boe? both?

> +  resolution of 1600x2560. It is a video mode DSI panel.

The binding or hardware supports only 1600x2560? The how it can be
"right now"? It's defined, isn't it?

> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - xiaomi,elish-csot-nt36523
> +          - xiaomi,elish-boe-nt36523
> +      - const: novatek,nt36523
> +    description: This indicates the panel manufacturer of the panel that is
> +      in turn using the NT36523 panel driver. This compatible string
> +      determines how the NT36523 panel driver is configured for the indicated
> +      panel. The novatek,nt36523 compatible shall always be provided as a fallback.

Drop description. First it is free form text of binding, so unnecessary.
Second, does not really bring any new information.

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: phandle of gpio for reset line - This should be 8mA, gpio
> +      can be configured using mux, pinctrl, pinctrl-names (active high)

Simplify description - 90% of it is redundant and only drive strength of
8 mA is important.

> +
> +  vddio-supply:
> +    description: regulator that supplies the I/O voltage
> +
> +  vddpos-supply:
> +    description: positive boost supply regulator
> +
> +  vddneg-supply:
> +    description: negative boost supply regulator
> +
> +  reg: true
> +  ports: true
> +  backlight: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddio-supply
> +  - vddpos-supply
> +  - vddneg-supply
> +  - reset-gpios
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |+

Drop +

> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi0 {

dsi {

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "xiaomi,elish-csot-nt36523", "novatek,nt36523";
> +            reg = <0>;
> +            vddio-supply = <&vreg_l14a_1p88>;
> +            vddpos-supply = <&lcd_vddpos_5p5>;
> +            vddneg-supply = <&lcd_vddneg_5p5>;
> +
> +            backlight = <&backlight>;
> +            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
> +
> +            ports {
> +              #address-cells = <1>;
> +              #size-cells = <0>;
> +
> +              port@0 {
> +                reg = <0>;

Mixed up indentation.

Best regards,
Krzysztof

