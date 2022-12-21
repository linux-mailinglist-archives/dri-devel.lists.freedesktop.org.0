Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99F065392E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 23:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E0E10E116;
	Wed, 21 Dec 2022 22:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F8610E116
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 22:57:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4710E61985
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 22:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0DBC43398
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 22:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671663437;
 bh=p/d+M9r7ITh2w59vVZqeoAL9P0N0ajEh+6Ikj1Olqcw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FRIQWj8QNym7Lgtt0hN09PnQ+bmqSUWyHbekZokhh7TMSc8g5orjf51MPcxO7s7lw
 u59L8ti6+QOlL7GHzMYAC/R5DyzMFXgbtaVi3i7HzXUIV53mgjnou5sLYBPqMKkv/T
 0H3ssv1gVXmsQl1sTz/2n1TuveyKlnBqjtrWiaUZZV9QP6Wtl9A4+PglCAz/JOzkSD
 PqkRj5/hVnr/jgoAX9+vKG68F3NrDanLsFdVah7HCU69q+u9szU+zpwyYKgw4UKgpb
 xmSikjrOa7/ub2DjD3gEB2eqtUaxDX31mPR6CKERmVJpvKg13P6f28Wk0dpJgEKOyc
 3OJ2LzTjwp1IQ==
Received: by mail-vk1-f171.google.com with SMTP id r204so204440vkf.8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 14:57:17 -0800 (PST)
X-Gm-Message-State: AFqh2krnc47pelP/7DopJrdcmjQSYhB/ATX1X2N5apJ913+CoIEvQ3lb
 0NMvfPG6bORIjJR5YsOs5yLrso3lG8IcDZoktQ==
X-Google-Smtp-Source: AMrXdXtOxGAAV3/RcvJu4N69Ld9G6cmDEb6znum6n0CR7Dt6Hse+Zf0OkcajWto0cwliCLLDBu44HcCCj0DqZDVjM+4=
X-Received: by 2002:a1f:e801:0:b0:3bd:ce89:f4e6 with SMTP id
 f1-20020a1fe801000000b003bdce89f4e6mr420377vkh.26.1671663435938; Wed, 21 Dec
 2022 14:57:15 -0800 (PST)
MIME-Version: 1.0
References: <7f883643-c796-029f-ba38-73532325632d@gmail.com>
 <245d4cd5-819c-8c6f-c448-107936ec9e88@gmail.com>
In-Reply-To: <245d4cd5-819c-8c6f-c448-107936ec9e88@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 21 Dec 2022 16:57:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK2BnDFx3fZSJeNZe1V8PBm6wNZZqn_i5Q2SS11HCt9xw@mail.gmail.com>
Message-ID: <CAL_JsqK2BnDFx3fZSJeNZe1V8PBm6wNZZqn_i5Q2SS11HCt9xw@mail.gmail.com>
Subject: Re: [PATCH v5 04/12] dt-bindings: display: rockchip: convert
 dw_mipi_dsi_rockchip.txt to yaml
To: Johan Jonker <jbx6244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, hjc@rock-chips.com, robert.foss@linaro.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 andrzej.hajda@intel.com, Laurent.pinchart@ideasonboard.com,
 devicetree@vger.kernel.org, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 21, 2022 at 12:22 PM Johan Jonker <jbx6244@gmail.com> wrote:
>
> Convert dw_mipi_dsi_rockchip.txt to yaml.
>
> Changed:
>   add clock-master property
>   file name
>   requirements
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../display/rockchip/dw_mipi_dsi_rockchip.txt |  94 ----------
>  .../rockchip/rockchip,dw-mipi-dsi.yaml        | 173 ++++++++++++++++++
>  2 files changed, 173 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
> deleted file mode 100644
> index 9a223df85..000000000
> --- a/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -Rockchip specific extensions to the Synopsys Designware MIPI DSI
> -================================
> -
> -Required properties:
> -- #address-cells: Should be <1>.
> -- #size-cells: Should be <0>.
> -- compatible: one of
> -       "rockchip,px30-mipi-dsi", "snps,dw-mipi-dsi"
> -       "rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi"
> -       "rockchip,rk3399-mipi-dsi", "snps,dw-mipi-dsi"
> -       "rockchip,rk3568-mipi-dsi", "snps,dw-mipi-dsi"
> -- reg: Represent the physical address range of the controller.
> -- interrupts: Represent the controller's interrupt to the CPU(s).
> -- clocks, clock-names: Phandles to the controller's pll reference
> -  clock(ref) when using an internal dphy and APB clock(pclk).
> -  For RK3399, a phy config clock (phy_cfg) and a grf clock(grf)
> -  are required. As described in [1].
> -- rockchip,grf: this soc should set GRF regs to mux vopl/vopb.
> -- ports: contain a port node with endpoint definitions as defined in [2].
> -  For vopb,set the reg = <0> and set the reg = <1> for vopl.
> -- video port 0 for the VOP input, the remote endpoint maybe vopb or vopl
> -- video port 1 for either a panel or subsequent encoder
> -
> -Optional properties:
> -- phys: from general PHY binding: the phandle for the PHY device.
> -- phy-names: Should be "dphy" if phys references an external phy.
> -- #phy-cells: Defined when used as ISP phy, should be 0.
> -- power-domains: a phandle to mipi dsi power domain node.
> -- resets: list of phandle + reset specifier pairs, as described in [3].
> -- reset-names: string reset name, must be "apb".
> -
> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -[2] Documentation/devicetree/bindings/media/video-interfaces.txt
> -[3] Documentation/devicetree/bindings/reset/reset.txt
> -
> -Example:
> -       mipi_dsi: mipi@ff960000 {
> -               #address-cells = <1>;
> -               #size-cells = <0>;
> -               compatible = "rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi";
> -               reg = <0xff960000 0x4000>;
> -               interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> -               clocks = <&cru SCLK_MIPI_24M>, <&cru PCLK_MIPI_DSI0>;
> -               clock-names = "ref", "pclk";
> -               resets = <&cru SRST_MIPIDSI0>;
> -               reset-names = "apb";
> -               rockchip,grf = <&grf>;
> -
> -               ports {
> -                       #address-cells = <1>;
> -                       #size-cells = <0>;
> -
> -                       mipi_in: port@0 {
> -                               reg = <0>;
> -                               #address-cells = <1>;
> -                               #size-cells = <0>;
> -
> -                               mipi_in_vopb: endpoint@0 {
> -                                       reg = <0>;
> -                                       remote-endpoint = <&vopb_out_mipi>;
> -                               };
> -                               mipi_in_vopl: endpoint@1 {
> -                                       reg = <1>;
> -                                       remote-endpoint = <&vopl_out_mipi>;
> -                               };
> -                       };
> -
> -                       mipi_out: port@1 {
> -                               reg = <1>;
> -                               #address-cells = <1>;
> -                               #size-cells = <0>;
> -
> -                               mipi_out_panel: endpoint {
> -                                       remote-endpoint = <&panel_in_mipi>;
> -                               };
> -                       };
> -               };
> -
> -               panel {
> -                       compatible ="boe,tv080wum-nl0";
> -                       reg = <0>;
> -
> -                       enable-gpios = <&gpio7 3 GPIO_ACTIVE_HIGH>;
> -                       pinctrl-names = "default";
> -                       pinctrl-0 = <&lcd_en>;
> -                       backlight = <&backlight>;
> -
> -                       port {
> -                               panel_in_mipi: endpoint {
> -                                       remote-endpoint = <&mipi_out_panel>;
> -                               };
> -                       };
> -               };
> -       };
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
> new file mode 100644
> index 000000000..441e283b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
> @@ -0,0 +1,173 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip specific extensions to the Synopsys Designware MIPI DSI
> +
> +maintainers:
> +  - Sandy Huang <hjc@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - rockchip,px30-mipi-dsi
> +          - rockchip,rk3288-mipi-dsi
> +          - rockchip,rk3399-mipi-dsi
> +          - rockchip,rk3568-mipi-dsi
> +      - const: snps,dw-mipi-dsi
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 4
> +
> +  clock-names:
> +    oneOf:
> +      - minItems: 2
> +        items:
> +          - const: ref
> +          - const: pclk
> +          - const: phy_cfg
> +          - const: grf
> +      - const: pclk
> +
> +  clock-master:
> +    type: boolean
> +    description:
> +      As described in the general dual-dsi devicetree binding the panel should
> +      define two input ports and point each of them to one of the used
> +      dsi-controllers, as well as declare one of them as clock-master.

Humm, dsi-controller.yaml defines this to be in a panel child node.
mipi-dsi-bus.txt shows it in the parent node like this. RK3399 is the
only in tree user of this, so perhaps dsi-controller.yaml should be
fixed. Then you can drop it from here.

> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      This SoC uses GRF regs to switch between vopl/vopb.
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: dphy
> +
> +  "#phy-cells":
> +    const: 0
> +    description:
> +      Defined when in use as ISP phy.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - rockchip,grf
> +
> +allOf:
> +  - $ref: ../bridge/snps,dw-mipi-dsi.yaml#

/schemas/display/bridge/...

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,px30-mipi-dsi
> +              - rockchip,rk3568-mipi-dsi
> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
> +        clock-names:
> +          maxItems: 1
> +
> +      required:
> +        - phys
> +        - phy-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3288-mipi-dsi
> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +
> +        clock-names:
> +          maxItems: 2
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3399-mipi-dsi
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +
> +        clock-names:
> +          minItems: 4
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3288-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    mipi_dsi: dsi@ff960000 {
> +      compatible = "rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi";
> +      reg = <0xff960000 0x4000>;
> +      interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_MIPI_DSI0>;
> +      clock-names = "ref", "pclk";
> +      resets = <&cru SRST_MIPIDSI0>;
> +      reset-names = "apb";
> +      rockchip,grf = <&grf>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mipi_in: port@0 {
> +          reg = <0>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          mipi_in_vopb: endpoint@0 {
> +            reg = <0>;
> +            remote-endpoint = <&vopb_out_mipi>;
> +          };
> +          mipi_in_vopl: endpoint@1 {
> +            reg = <1>;
> +            remote-endpoint = <&vopl_out_mipi>;
> +          };
> +        };
> +
> +        mipi_out: port@1 {
> +          reg = <1>;
> +
> +          mipi_out_panel: endpoint {
> +            remote-endpoint = <&panel_in_mipi>;
> +          };
> +        };
> +      };
> +    };
> --
> 2.20.1
>
