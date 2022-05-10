Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D5A5223AB
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 20:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A042310E179;
	Tue, 10 May 2022 18:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603CE10E668
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 18:14:18 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 v33-20020a4a9764000000b0035f814bb06eso1362853ooi.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 11:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bqzP6kLC9TvD/eZVDvG+k9Cz3CtHjrwdnS/BDXCrozk=;
 b=P58Hj1fSgu1CBrilsw99OPBpS/jNgumeQMFARMLohp4g/VTjKKjnbKL8mtqBFeVV3y
 0EpbiCvkC3mbXqsluHlFA3gcBWF6OUiZFFcYwOndz6yJQlFd2iJie54TEUwbi499vNKL
 iYOhM97ccyuNdwF65yy8L59UE4D7JY52x81VpNGFIL3yBYZ0NYY+8DWUAnaNp+wNQQsp
 7ZBSTP4bZYzIkcLacMIDdg8YEgbEypqjg+MIEMj3+EmWsU7eNble8grWY1GNhog5JMs3
 Ypho5ptFBoMzWp/4ArBuzCEQaLXpaf/azYkvNv/fw/YO1rrJhtkb6j8X39jv8WHEzP/o
 uvUA==
X-Gm-Message-State: AOAM5333agqlAIaHveT4AsT9N/5HmgyiwgcixpkqlSVSDJZhVvZPYnl+
 5H+UZjUfTdSdoUIuWLrrIg==
X-Google-Smtp-Source: ABdhPJyfV9W5KcMMLkxExjfN4a6CpVE64vC6bZ6q+D3QKn6QIc1wk0xfg8j8ZGyynxcm2C2pKY+9IA==
X-Received: by 2002:a05:6830:3108:b0:606:581b:b7bb with SMTP id
 b8-20020a056830310800b00606581bb7bbmr8250687ots.270.1652206457584; 
 Tue, 10 May 2022 11:14:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h23-20020a4adcd7000000b0035eb4e5a6b6sm27454oou.12.2022.05.10.11.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 11:14:17 -0700 (PDT)
Received: (nullmailer pid 2319536 invoked by uid 1000);
 Tue, 10 May 2022 18:14:16 -0000
Date: Tue, 10 May 2022 13:14:16 -0500
From: Rob Herring <robh@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v0.5 5/9] dt-bindings: phy: add binding for the i.MX8MP
 HDMI PHY
Message-ID: <YnqreMpQI317fq19@robh.at.kernel.org>
References: <20220506181034.2001548-1-l.stach@pengutronix.de>
 <20220506181034.2001548-6-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220506181034.2001548-6-l.stach@pengutronix.de>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, Andrzej Hajda <andrzej.hajda@intel.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-phy@lists.infradead.org,
 Robert Foss <robert.foss@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 06, 2022 at 08:10:30PM +0200, Lucas Stach wrote:
> Add a DT binding for the HDMI PHY found on the i.MX8MP SoC.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../bindings/phy/fsl,imx8mp-hdmi-phy.yaml     | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
> new file mode 100644
> index 000000000000..bc21c073e92a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/fsl,imx8mp-hdmi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8MP HDMI PHY binding
> +
> +maintainers:
> +  - Lucas Stach <l.stach@pengutronix.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mp-hdmi-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: ref
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +  - power-domains

#phy-cells should be required.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/power/imx8mp-power.h>
> +
> +    phy@32fdff00 {
> +        compatible = "fsl,imx8mp-hdmi-phy";
> +        reg = <0x32fdff00 0x100>;
> +        clocks = <&clk IMX8MP_CLK_HDMI_APB>,
> +                 <&clk IMX8MP_CLK_HDMI_24M>;
> +        clock-names = "apb", "ref";
> +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_HDMI_TX_PHY>;
> +        #clock-cells = <0>;
> +        #phy-cells = <0>;
> +    };
> -- 
> 2.30.2
> 
> 
