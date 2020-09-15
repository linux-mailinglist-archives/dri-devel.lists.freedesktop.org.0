Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D005026A8F9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 17:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2370789FD3;
	Tue, 15 Sep 2020 15:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AE889FD3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 15:41:21 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id g128so4524459iof.11
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 08:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9td3CHrhD2ePyY61tWqpgj5SUv0on2Qa1ge62urpHGs=;
 b=lsBU1yio4Cg/3RHF6BnJ96/wS1V9crEQ/Mwkr1drCe06qCkGTIxfElP2IuOtaub1Pe
 SG8v55cHqM41guOxb262bXEnUIOLU4WZMt3SpuBMiE3V367xfhRRgJCXF9+rO936mKgp
 Te9Lq5WOmLv5OofhiDeZan8tsW+JrbJxq5Xsp/E0gNZ6J2Swohxj9gqNY8DiylG9AVzJ
 Q3lYJLwMCgm02mR7neSf/raxRSVw4mRwUY3rDhlU+58Qeo8SqEXlxyNWmfWDEkW8i3gZ
 /BfBbNIcJRyqoBegNiBa5rzeNEBw8f13QQE61TrW9TUCcSnABaEYK/PdURII66WvTQ/g
 fYkA==
X-Gm-Message-State: AOAM532HfBdDxzUAvdjOQyp5b9M5+bTlzuWihh4Y3KRixwxmjzaRu5Xl
 uMyHuzhm507lg8Wj2P+I4CuB2YHcdEGB
X-Google-Smtp-Source: ABdhPJwNFt8xtG/jVr9dFKGqM4jI/u+N27xrn10aCxWh4fQsBFtbNUAm75Pkj7j/t6t5kOZ/mWI69Q==
X-Received: by 2002:a6b:c997:: with SMTP id
 z145mr15671026iof.136.1600184480497; 
 Tue, 15 Sep 2020 08:41:20 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id s2sm9369515ili.49.2020.09.15.08.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:41:19 -0700 (PDT)
Received: (nullmailer pid 1999129 invoked by uid 1000);
 Tue, 15 Sep 2020 15:41:19 -0000
Date: Tue, 15 Sep 2020 09:41:19 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/6] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Message-ID: <20200915154118.GA1988840@bogus>
References: <20200907081825.1654-1-narmstrong@baylibre.com>
 <20200907081825.1654-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907081825.1654-3-narmstrong@baylibre.com>
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
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2020 at 10:18:21AM +0200, Neil Armstrong wrote:
> The Amlogic AXg SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a), with a custom
> glue managing the IP resets, clock and data input similar to the DW-HDMI Glue on other
> Amlogic SoCs.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../display/amlogic,meson-dw-mipi-dsi.yaml    | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
> new file mode 100644
> index 000000000000..6177f45ea1a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2020 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/amlogic,meson-dw-mipi-dsi.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic specific extensions to the Synopsys Designware MIPI DSI Host Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |
> +  The Amlogic Meson Synopsys Designware Integration is composed of
> +  - A Synopsys DesignWare MIPI DSI Host Controller IP
> +  - A TOP control block controlling the Clocks & Resets of the IP
> +
> +allOf:
> +  - $ref: dsi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-axg-dw-mipi-dsi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: pclk
> +      - const: px_clk
> +      - const: meas_clk
> +
> +  resets:
> +    minItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: top
> +
> +  phys:
> +    minItems: 1
> +
> +  phy-names:
> +    items:
> +      - const: dphy
> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: Input node to receive pixel data.
> +      port@1:
> +        type: object
> +        description: DSI output node to panel.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - phys
> +  - phy-names
> +  - ports
> +
> +additionalProperties: false

Presumably you may have panel/bridge child nodes, so this needs to be 
'unevaluatedProperties: false'.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
