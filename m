Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FA965263D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 19:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007D110E0F5;
	Tue, 20 Dec 2022 18:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D277889C0D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 18:28:59 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id v82so11322197oib.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 10:28:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7voxDVbjuMHrLKhmlZZ+4WN07ar4kceaQpkDC9Gcu4=;
 b=p6BSykTgbIQMoIfCimb9G/xYYBvMQnIMOD62kACvdVJqLMYIVYdwlm7FRuHYMAyPiS
 XFh7ikFGpJqkZegV/PuzvgSFt2USXXCYEI3avmjgYd5mL5DoReetJ6ik4kAWxzPGOJj7
 EGvl0B+3sJDVJ6u+ZMhRPJV7rVa8OBRIABkh5YMt04eFiur14MbVYHudc5KtP3OxKzXk
 iCtCQU69Jw3vl++gIdrHUVqdlMB5drFNDvYtIqSvBF9DU/ijIJSp7xx/2owolZ2JGozY
 6apJZ9fuUinn3xnXBbghPk6uIbEd/NyrusZux1ot9z+IF+GblfQyBJ6mm1A+w3wZ7BgU
 Zoyg==
X-Gm-Message-State: AFqh2kq8lTJhvtVZhZNn4W6kLqAzXKSTnEWjI0DMJDN6UYCSWE67w7t6
 kjwbdnx18neeQFDSqQhVhg==
X-Google-Smtp-Source: AMrXdXurRizsNMCeU3eYh0lw92coSnjiA72SRQvm5c1tmS+9m3g+eOHLlvUu0nAUKtdUEhcVzfKtCg==
X-Received: by 2002:a05:6808:1525:b0:35c:3e8e:de6e with SMTP id
 u37-20020a056808152500b0035c3e8ede6emr8469336oiw.22.1671560938976; 
 Tue, 20 Dec 2022 10:28:58 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u19-20020a0568301f5300b0066da36d2c45sm5973624oth.22.2022.12.20.10.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 10:28:58 -0800 (PST)
Received: (nullmailer pid 870653 invoked by uid 1000);
 Tue, 20 Dec 2022 18:28:57 -0000
Date: Tue, 20 Dec 2022 12:28:57 -0600
From: Rob Herring <robh@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI TX
Message-ID: <20221220182857.GA860843-robh@kernel.org>
References: <20221216210742.3233382-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216210742.3233382-1-l.stach@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 16, 2022 at 10:07:39PM +0100, Lucas Stach wrote:
> The HDMI TX controller on the i.MX8MP SoC is a Synopsys designware IP
> core with a little bit of SoC integration around it.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../bindings/display/imx/fsl,imx8mp-hdmi.yaml | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
> new file mode 100644
> index 000000000000..75ebeaa8c9d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
> @@ -0,0 +1,69 @@
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

Don't need '|'.

> +  The i.MX8MP HDMI transmitter is a Synopsys DesignWare
> +  HDMI 2.0 TX controller IP.
> +
> +allOf:
> +  - $ref: ../bridge/synopsys,dw-hdmi.yaml#

/schemas/display/bridge/...

> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mp-hdmi
> +
> +  reg-io-width:
> +    const: 1
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: iahb
> +      - const: isfr
> +      - const: fdcc
> +      - const: cec
> +      - const: pix
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
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/power/imx8mp-power.h>
> +
> +    hdmi@32fd8000 {
> +        compatible = "fsl,imx8mp-hdmi";
> +        reg = <0x32fd8000 0x7eff>;
> +        interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clk IMX8MP_CLK_HDMI_APB>,
> +                 <&clk IMX8MP_CLK_HDMI_REF_266M>,
> +                 <&clk IMX8MP_CLK_HDMI_FDCC_TST>,
> +                 <&clk IMX8MP_CLK_32K>,
> +                 <&hdmi_tx_phy>;
> +        clock-names = "iahb", "isfr", "fdcc", "cec", "pix";
> +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_HDMI_TX>;
> +        reg-io-width = <1>;


ports? This block isn't connected to anything? Like an 'hdmi-connector'?

Rob
