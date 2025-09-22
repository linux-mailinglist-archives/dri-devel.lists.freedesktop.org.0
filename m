Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AC7B93416
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 22:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026C010E513;
	Mon, 22 Sep 2025 20:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lkxzgKHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8290910E513
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 20:43:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8837460241;
 Mon, 22 Sep 2025 20:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028A4C4CEF0;
 Mon, 22 Sep 2025 20:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758573830;
 bh=Vy80BelxmGUNpFFuDIVKX3KUuEZh7ay4ov/SQneHVHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lkxzgKHmfF3t4PNAyjogZDoIDiRVy71l18WPbvBAfNwv2BGc8deTkq4LNWRPiL8eW
 zDazyR61jMG+X8+v9Lvh4Q2vvZ+e0ObpolgRM/HJuS0uRvelPoklqvfwD9yEzwdgfK
 MHIwcokie9KF92Lo/ihQCLLtxpCi8Sez2G3uKpVQlA+6vTaUrw7Na3Dw3Y+0akxF4b
 TUjgihjb/ux6nIDi0z5jpKTpCALwwFg6mVQcKpoMrKC0x7ToeivqKafLFVyrtFUKjZ
 c9uz8OvOXOhQwrhGLNuxqueS879tNh9XZaavay/Khc45zV1JHczBFJzP+NPoLzQ8SS
 RX64uAZLFGgvA==
Date: Mon, 22 Sep 2025 15:43:49 -0500
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/8] dt-bindings: display: add verisilicon,dc
Message-ID: <20250922204349.GA1290045-robh@kernel.org>
References: <20250921083446.790374-1-uwu@icenowy.me>
 <20250921083446.790374-3-uwu@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921083446.790374-3-uwu@icenowy.me>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 21, 2025 at 04:34:40PM +0800, Icenowy Zheng wrote:
> Verisilicon has a series of display controllers prefixed with DC and
> with self-identification facility like their GC series GPUs.
> 
> Add a device tree binding for it.
> 
> Depends on the specific DC model, it can have either one or two display
> outputs, and each display output could be set to DPI signal or "DP"
> signal (which seems to be some plain parallel bus to HDMI controllers).
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> Changes in v2:
> - Fixed misspelt "versilicon" in title.
> - Moved minItems in clock properties to be earlier than items.
> - Re-aligned multi-line clocks and resets in example.
> 
>  .../bindings/display/verisilicon,dc.yaml      | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> new file mode 100644
> index 0000000000000..07fedc4c7cc13
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/verisilicon,dc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Verisilicon DC-series display controllers
> +
> +maintainers:
> +  - Icenowy Zheng <uwu@icenowy.me>
> +
> +properties:
> +  $nodename:
> +    pattern: "^display@[0-9a-f]+$"
> +
> +  compatible:
> +    const: verisilicon,dc

This needs an SoC specific compatible. Generally licensed IP compatibles 
are useless because the specs aren't public and there's always 
integration quirks.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 4
> +    items:
> +      - description: DC Core clock
> +      - description: DMA AXI bus clock
> +      - description: Configuration AHB bus clock
> +      - description: Pixel clock of output 0
> +      - description: Pixel clock of output 1
> +
> +  clock-names:
> +    minItems: 4
> +    items:
> +      - const: core
> +      - const: axi
> +      - const: ahb
> +      - const: pix0
> +      - const: pix1
> +
> +  resets:
> +    items:
> +      - description: DC Core reset
> +      - description: DMA AXI bus reset
> +      - description: Configuration AHB bus reset
> +
> +  reset-names:
> +    items:
> +      - const: core
> +      - const: axi
> +      - const: ahb
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The first output channel, endpoint 0 should be
> +          used for DPI format output and endpoint 1 should be used
> +          for DP format output.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The second output channel if the DC variant
> +          supports and used. Follow the same endpoint addressing
> +          rule with the first port.
> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> +    #include <dt-bindings/reset/thead,th1520-reset.h>
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      display@ffef600000 {
> +        compatible = "verisilicon,dc";
> +        reg = <0xff 0xef600000 0x0 0x100000>;
> +        interrupts = <93 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clk_vo CLK_DPU_CCLK>,
> +                 <&clk_vo CLK_DPU_ACLK>,
> +                 <&clk_vo CLK_DPU_HCLK>,
> +                 <&clk_vo CLK_DPU_PIXELCLK0>,
> +                 <&clk_vo CLK_DPU_PIXELCLK1>;
> +        clock-names = "core", "axi", "ahb", "pix0", "pix1";
> +        resets = <&rst TH1520_RESET_ID_DPU_CORE>,
> +                 <&rst TH1520_RESET_ID_DPU_AXI>,
> +                 <&rst TH1520_RESET_ID_DPU_AHB>;
> +        reset-names = "core", "axi", "ahb";
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          port@0 {
> +            reg = <0>;
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            dpu_out_dp1: endpoint@1 {
> +              reg = <1>;
> +              remote-endpoint = <&hdmi_in>;
> +            };
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.51.0
> 
