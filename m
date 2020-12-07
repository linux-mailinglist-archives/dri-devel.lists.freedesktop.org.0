Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0DC2D1BDD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 22:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7426E8BF;
	Mon,  7 Dec 2020 21:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC73C6E8BF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 21:19:23 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id j12so13894882ota.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 13:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SbwIEIDsfJusH7q4FbfrkA5Ki4JFFsWymqArfWeiFAM=;
 b=Q3MH22zpCsHyyEX1+3teY6c5q5LH4b4DvDNUcFarWfpu6te3TYnm28MDqXmNtHHouV
 SVuQ8fbgVaXawKXrh6MEWUwUeu0VCSUo8Pbfc9iGi/ue4z0p7WhHcs/yPGeQXmK9Wh8d
 +nKV/8L3vTghwjVzl1Q8wQqdZIx9M3Tf1WxjYY9WH+xu6Tp9wHCsrDJJbmZVNsCUEjV2
 WK/TPblqceLi36tI9gWLCWTNjFt6zK2wApkTAJfX+vii0rJASF9U6RvsOYNnlfoSJ2bQ
 ad+NueXOcu3WU2KFpUxsqYD3EuxCX1EniBLhri4Sm0q2+lBphsNO8mPoa9lQ3LOoMwRb
 US5g==
X-Gm-Message-State: AOAM533d6vsJ8y5IAh8LqISddnx0JbI5HAMzPe9VRLcO1ao8by1RJy9g
 nIIRAnoHYGfcQt+eRiB5cg==
X-Google-Smtp-Source: ABdhPJyj0ImAtzWmZceRBxwogeoYsfCN+hwQgb4OhgF3vgwB2VPPj52jUJoBYD6yl9PpYyS5uR48/g==
X-Received: by 2002:a05:6830:1501:: with SMTP id
 k1mr9393799otp.12.1607375963123; 
 Mon, 07 Dec 2020 13:19:23 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k5sm2863341oot.30.2020.12.07.13.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 13:19:22 -0800 (PST)
Received: (nullmailer pid 844274 invoked by uid 1000);
 Mon, 07 Dec 2020 21:19:20 -0000
Date: Mon, 7 Dec 2020 15:19:20 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v3 07/11] dt-bindings: phy: convert MIP DSI PHY binding
 to YAML schema
Message-ID: <20201207211920.GA841059@robh.at.kernel.org>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
 <20201118082126.42701-7-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118082126.42701-7-chunfeng.yun@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 18, 2020 at 04:21:22PM +0800, Chunfeng Yun wrote:
> Convert MIPI DSI PHY binding to YAML schema mediatek,dsi-phy.yaml
> 
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3: new patch
> ---
>  .../display/mediatek/mediatek,dsi.txt         | 18 +---
>  .../bindings/phy/mediatek,dsi-phy.yaml        | 83 +++++++++++++++++++
>  2 files changed, 84 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> index f06f24d405a5..8238a86686be 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> @@ -22,23 +22,7 @@ Required properties:
>  MIPI TX Configuration Module
>  ============================
>  
> -The MIPI TX configuration module controls the MIPI D-PHY.
> -
> -Required properties:
> -- compatible: "mediatek,<chip>-mipi-tx"
> -- the supported chips are mt2701, 7623, mt8173 and mt8183.
> -- reg: Physical base address and length of the controller's registers
> -- clocks: PLL reference clock
> -- clock-output-names: name of the output clock line to the DSI encoder
> -- #clock-cells: must be <0>;
> -- #phy-cells: must be <0>.
> -
> -Optional properties:
> -- drive-strength-microamp: adjust driving current, should be 3000 ~ 6000. And
> -						   the step is 200.
> -- nvmem-cells: A phandle to the calibration data provided by a nvmem device. If
> -               unspecified default values shall be used.
> -- nvmem-cell-names: Should be "calibration-data"
> +See phy/mediatek,dsi-phy.yaml
>  
>  Example:
>  
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> new file mode 100644
> index 000000000000..87f8df251ab0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MIPI Display Serial Interface (DSI) PHY binding
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> +
> +description: The MIPI DSI PHY supports up to 4-lane output.
> +
> +properties:
> +  $nodename:
> +    pattern: "^dsi-phy@[0-9a-f]+$"
> +
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-mipi-tx
> +      - mediatek,mt7623-mipi-tx
> +      - mediatek,mt8173-mipi-tx
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: PLL reference clock
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  nvmem-cells:
> +    maxItems: 1
> +    description: A phandle to the calibration data provided by a nvmem device,
> +      if unspecified, default values shall be used.
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: calibration-data
> +
> +  drive-strength-microamp:
> +    description: adjust driving current, the step is 200.

multipleOf: 200

> +    $ref: /schemas/types.yaml#/definitions/uint32

Can drop. Standard unit suffixes have a type already.

> +    minimum: 2000
> +    maximum: 6000
> +    default: 4600
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-output-names
> +  - "#phy-cells"
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    dsi-phy@10215000 {
> +        compatible = "mediatek,mt8173-mipi-tx";
> +        reg = <0x10215000 0x1000>;
> +        clocks = <&clk26m>;
> +        clock-output-names = "mipi_tx0_pll";
> +        drive-strength-microamp = <4000>;
> +        nvmem-cells= <&mipi_tx_calibration>;
> +        nvmem-cell-names = "calibration-data";
> +        #clock-cells = <0>;
> +        #phy-cells = <0>;
> +    };
> +
> +...
> -- 
> 2.18.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
