Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AA63B0AEF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825B06E7E2;
	Tue, 22 Jun 2021 16:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5196E7E2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 16:56:52 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id h3so19049927ilc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 09:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XXD64DW43MkEPz+dTKES9lCjXNn8ZHTv2qhDOUEKvHY=;
 b=IU5S1mxUYWc08YbbJweo5E7T1I86gAYvUDXFRnrW1knd0sEs506kf1bys8a8yYwMcX
 JRkYZDrCDQJ4XGUOgxQwMDrlVPbyh+nMEnTTFX2OGp3Lh8UELtAUVmp7ivf8dcQ2yfl3
 Lzced9Ax9rLxFCvlkXU38NnDfF0AzrFdyNdFQcRdr81BRxyNOwVzediniUAvHMYO1cdX
 oQf2JQ641DAxpr5mdHhRoJW/VjKFG5pEZ8MPvoCr+H+8bGmt7+XJ3KDeOfZhPRWg9iX+
 Uk33ERExHjCI3J7GAmRaXZ6xatSTpmLgeILaj+/NZl2Dgj2fTo4IQG0f1fabJ9QsBw+L
 aDdw==
X-Gm-Message-State: AOAM533WF5n1e5TrWV7kdvCKI7XAao/w1T7l99eXnM3k49bVhIJs2qWB
 wL2sl+H/bI6coid3EUOV2w==
X-Google-Smtp-Source: ABdhPJypIwlNsW2XYlIq0IjRsoUGyvqG8oeTVi3ETiXk+6aO7i069nPHEq/tw4RVzMKG/Qxmyv4cuQ==
X-Received: by 2002:a92:280a:: with SMTP id l10mr2702990ilf.265.1624381011704; 
 Tue, 22 Jun 2021 09:56:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id l11sm11055629ios.8.2021.06.22.09.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 09:56:49 -0700 (PDT)
Received: (nullmailer pid 3840158 invoked by uid 1000);
 Tue, 22 Jun 2021 16:56:46 -0000
Date: Tue, 22 Jun 2021 10:56:46 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [RFC PATCH 3/9] dt-bindings: phy: Add SEC DSIM DPHY bindings
Message-ID: <20210622165646.GA3838180@robh.at.kernel.org>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-4-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621072424.111733-4-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, linux-amarula@amarulasolutions.com,
 Tomasz Figa <t.figa@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 Fancy Fang <chen.fang@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 12:54:18PM +0530, Jagan Teki wrote:
> Samsung SEC MIPI DSIM DPHY controller is part of registers
> available in SEC MIPI DSIM bridge for NXP's i.MX8M Mini and
> Nano Processors.
> 
> Add dt-bingings for it.
> 
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../bindings/phy/samsung,sec-dsim-dphy.yaml   | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,sec-dsim-dphy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,sec-dsim-dphy.yaml b/Documentation/devicetree/bindings/phy/samsung,sec-dsim-dphy.yaml
> new file mode 100644
> index 000000000000..c5770c8035e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/samsung,sec-dsim-dphy.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/samsung,sec-dsim-dphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SEC MIPI DSIM DPHY controller on i.MX8M Mini and Nano SoCs
> +
> +maintainers:
> +  - Jagan Teki <jagan@amarulasolutions.com>
> +
> +properties:
> +  "#phy-cells":
> +    const: 0
> +
> +  compatible:
> +    enum:
> +      - fsl,imx8mm-sec-dsim-dphy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Phy Ref Clock
> +
> +  clock-names:
> +    items:
> +      - const: phy_ref

'ref' is sufficient.

> +
> +  power-domains:
> +    maxItems: 1
> +    description: phandle to the associated power domain
> +
> +required:
> +  - "#phy-cells"
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mm-clock.h>
> +    #include <dt-bindings/power/imx8mm-power.h>
> +
> +    dphy: dphy@32e100a4 {

phy@...

> +      compatible = "fsl,imx8mm-sec-dsim-dphy";
> +      reg = <0x32e100a4 0xbc>;
> +      clocks = <&clk IMX8MM_CLK_DSI_PHY_REF>;
> +      clock-names = "phy_ref";
> +      power-domains = <&dispmix_blk_ctl IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_DPHY>;
> +      #phy-cells = <0>;
> +    };
> -- 
> 2.25.1
> 
> 
