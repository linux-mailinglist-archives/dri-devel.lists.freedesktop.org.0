Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B95463FBBD
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 00:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E96E10E687;
	Thu,  1 Dec 2022 23:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B647C10E686
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 23:13:03 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id c129so3746757oia.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 15:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OKxrfU4YmpY1Kl1yHeMXQyKUWxu44u51bjZxjiYhfek=;
 b=SDu61Y2VbPMLQaBCokOYX/ZEQaRJQHJhZbVQUBoPr9zt893TWEnB35/Lc26NiuLYmp
 6KWKpo7KhBreCvVgSGtR2+EtOmjItZMF9GM0AEqAT5zicpPaHyqpnHaV2OznZj5C5GmC
 343LuDa495O6ERti2NyaEYe86gdEnega3eHEyAHutjGN1GkM+PPyaxGv5y+rteRBvuZa
 nHsTp/Yegf0AQXVtsGFtxPEZUU3fVwD0C2TDWSXlqAW0ulYAHzjiT1c/hTCDE42BGJ2a
 eGDHXuEGl1HfK6lvxURvngsKEr4ce7qEk/mvaKC73YG3/pYndLkra+/6pNIMzj9GQ3I2
 G34Q==
X-Gm-Message-State: ANoB5pnDdNjFDUEyGaZN0701PXrMUOEYnFQ92cf3dZx/92DCxaUCENjq
 fj2kW2ijwibfLDWUEdo94w==
X-Google-Smtp-Source: AA0mqf6Hw+Gk/anvjA2tVJyGiBiFgpkYa/VeAI295MqD5oc4uGzJJSmIKRZpn+m9seyj7pP7+kUz+A==
X-Received: by 2002:a54:4783:0:b0:354:7e1:d3ac with SMTP id
 o3-20020a544783000000b0035407e1d3acmr26707554oic.237.1669936382827; 
 Thu, 01 Dec 2022 15:13:02 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p64-20020acad843000000b0035a9003b8edsm2345943oig.40.2022.12.01.15.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 15:13:02 -0800 (PST)
Received: (nullmailer pid 1658241 invoked by uid 1000);
 Thu, 01 Dec 2022 23:13:01 -0000
Date: Thu, 1 Dec 2022 17:13:01 -0600
From: Rob Herring <robh@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v5 07/10] dt-bindings: phy: Add Cadence HDP-TX DP PHY
Message-ID: <20221201231301.GA1653935-robh@kernel.org>
References: <cover.1669620155.git.Sandor.yu@nxp.com>
 <beb1dae2a08595a6b9a6b6028ac994faa207d4bd.1669620155.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <beb1dae2a08595a6b9a6b6028ac994faa207d4bd.1669620155.git.Sandor.yu@nxp.com>
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
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org,
 oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 vkoul@kernel.org, robert.foss@linaro.org, andrzej.hajda@intel.com,
 linux-phy@lists.infradead.org, linux-imx@nxp.com, kernel@pengutronix.de,
 devicetree@vger.kernel.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 28, 2022 at 03:36:15PM +0800, Sandor Yu wrote:
> Add bindings for Cadence HDP-TX DisplayPort PHY.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../bindings/phy/cdns,hdptx-dp-phy.yaml       | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml
> new file mode 100644
> index 000000000000..f4f741150c12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/cdns,hdptx-dp-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence HDP-TX(HDMI/DisplayPort) PHY for DisplayPort protocol
> +
> +maintainers:
> +  - Sandor Yu <sandor.yu@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,hdptx-dp-phy

Again, name based on SoC and SoC vendor.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: PHY reference clock.
> +      - description: APB clock.
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: apb
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  cdns,num-lanes:

There is a standard way to define the number of lanes. That goes in 
output endpoint for the DP node. Not that convenient to the phy, but the 
information is already there, don't duplicate it.

> +    description:
> +      Number of lanes.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3, 4]
> +    default: 4
> +
> +  cdns,max-bit-rate:

Same with this.

> +    description:
> +      Maximum DisplayPort link bit rate to use, in Mbps
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [2160, 2430, 2700, 3240, 4320, 5400]
> +    default: 5400
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/phy/phy.h>
> +    dp_phy: phy@32c00000 {
> +        compatible = "cdns,hdptx-dp-phy";
> +        reg = <0x32c00000 0x100000>;
> +        #phy-cells = <0>;
> +        clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
> +        clock-names = "ref", "apb";
> +        cdns,num-lanes = <4>;
> +        cdns,max-bit-rate = <5400>;
> +    };
> -- 
> 2.34.1
> 
> 
