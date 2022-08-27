Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AD85A362C
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 11:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592A610E09E;
	Sat, 27 Aug 2022 09:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B1510E09E
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 09:08:29 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id l8so4811403lfc.12
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 02:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=FSNTuMMXeoC70lxTKB570T+X2lQfg//2X9+xflsPUaU=;
 b=euY+IKg1WUwyREaVEkC0vU0Uiy/uYIpgANHbnYpTVD/4w2Wr8nhaBpwM2t1AcH+N25
 cuT7659vaQd7rrq4jKApPhnVWFpSr0L+GwVVNeieQ0GKuAWjWh0KIhqshC8IXsymjoKb
 M0IHcmjiLUF1FBuAnpiHI5j1uwvGIjc9vB5Sxi5lclwcz4v1PO/y1PrQD3rkGtBshsfX
 Tb+29FfeAwzTSzIpHYPFqws8kKPQqCNidSIHCZnZ47gFf6/G8385bznQzr/pXffeMc48
 ueaJYBcXp0iAcdqITrpTT3F9ohgo+ZgrTHTJ1JX1/eYopbfnLchcB0zJFSBVCAGlyjba
 qZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=FSNTuMMXeoC70lxTKB570T+X2lQfg//2X9+xflsPUaU=;
 b=Ewyh42ICLhxCta6Mb2Mbmpk27xKy3h2vTteVqGBYvzkkP4okhe3/wMTgMqADquRW4A
 rwwVOzsQV7edOTLrzy0mB6XDDIWSeTNYzlCfpwaOtE/Ga1gmLk7ySI7DmbYAdtwZq0gv
 hLpjSqkYBa67+bjlPhXACQ9ZXKxi3m2j6g1k01cVt7e1AD4xSQ4CxN10QchIk/AFI4cI
 cvzELND88gHPT1XgDwAT/2b4zmz+9jEgDqa0N9R6HiJ/cGtr1CSQSVUV+QknK3zS7Chd
 HEqQqhF+4lwi8M5U+wEDJngILRDc+FTGsUy+M2qYUZVU7NHx/yWhXlD9emU3onZGgwPL
 Y/1w==
X-Gm-Message-State: ACgBeo1W0RT1p0cSvSLhI+IA3QFZGDI+3rpiKvQx7WxOmO+CR8gJI3K+
 bAWv7noX00VKZt72yGC9xQ8rkw==
X-Google-Smtp-Source: AA6agR7eHbsuSjMDWmlRF4XAP2ouN+fu6UYv20PiYQrU2hi7LhX6V6Xtz4JdK1hSZIBLuss6y/sPGg==
X-Received: by 2002:a19:dc4a:0:b0:493:e21:b77d with SMTP id
 f10-20020a19dc4a000000b004930e21b77dmr3422263lfj.580.1661591307685; 
 Sat, 27 Aug 2022 02:08:27 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a05651203e300b0048a757d1303sm606847lfq.217.2022.08.27.02.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 02:08:27 -0700 (PDT)
Message-ID: <e072a8aa-512c-12f5-85e8-aa2fd46ebe8c@linaro.org>
Date: Sat, 27 Aug 2022 12:08:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI TX
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20220826192424.3216734-1-l.stach@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220826192424.3216734-1-l.stach@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/08/2022 22:24, Lucas Stach wrote:
> The HDMI TX controller on the i.MX8MP SoC is a Synopsys designware IP
> core with a little bit of SoC integration around it.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Marek Vasut <marex@denx.de>

What tested-by means in the terms of bindings? What tests were applied
exactly?

> ---
>  .../bindings/display/imx/fsl,imx8mp-hdmi.yaml | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
> new file mode 100644
> index 000000000000..14f7cd47209c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8MP DWC HDMI TX Encoder
> +
> +maintainers:
> +  - Lucas Stach <l.stach@pengutronix.de>
> +
> +description: |
> +  The HDMI transmitter is a Synopsys DesignWare HDMI 2.0 TX controller IP.
> +
> +allOf:
> +  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mp-hdmi
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-io-width:
> +    const: 1
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - {}
> +      - {}

Clocks should be strictly defined.

> +      - const: cec
> +      - const: pix
> +      - const: fdcc
> +
> +  interrupts:
> +    maxItems: 1

This is coming from synopsys. Skip it and use unevaluatedProperties:false

reg actually as well...

> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +
> +additionalProperties: false
> +

Best regards,
Krzysztof
