Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 191BEB433D8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8C610E98C;
	Thu,  4 Sep 2025 07:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I3CSQtaW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D6510E98C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 07:25:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 758604051B;
 Thu,  4 Sep 2025 07:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB03AC4CEF0;
 Thu,  4 Sep 2025 07:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756970700;
 bh=g0FuMImBTb4zXFyvNIW7Qc6+EhCzoXvGszP1fCb2DTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I3CSQtaWLoUBZ85Cvb1X1zBhfnr9t+Mlx6sTaW7ep3CIC2futjzePPUqmfPk6v9Q3
 7hyDBFdOohOGBjOSv7NYmUiz/q01m8EecwxOGilSwsSSK4cdgjx6DOOJTUoLnnrkXD
 e0WgFviKLo69ikPOJ/vBYz0JPxcHfpMMiemJiGbKXu/ws4+yt3LOW0Qx2DCS3gv+8L
 CxYzje0TKoCaNijozuS+Uhu+deDHwFjdVbb9hAzF7QZqxYFYFRvhZQC058vyGhZvSk
 NRCTbMu7MA6lGlr0YbKBbumnI2POEyid1a7vxYb2Ef2XdgEgttGQjaZqBOzsrPN5qh
 SsKhLz9eDCnXg==
Date: Thu, 4 Sep 2025 09:24:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/9] dt-bindings: display: imx: Add bindings for
 i.MX94 DCIF
Message-ID: <20250904-attentive-seagull-of-fantasy-adea9f@kuoka>
References: <20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com>
 <20250903123332.2569241-5-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903123332.2569241-5-laurentiu.palcu@oss.nxp.com>
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

On Wed, Sep 03, 2025 at 03:33:22PM +0300, Laurentiu Palcu wrote:
> DCIF is the i.MX94 Display Controller Interface which is used to
> drive a TFT LCD panel or connects to a display interface depending
> on the chip configuration.

It looks like you are going to send v5, so:

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Anyway, nothing in the changelog explains dropping tags.

I am not going to do the work twice. Write proper changelogs.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/display/imx/nxp,imx94-dcif.yaml  | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> new file mode 100644
> index 0000000000000..54419c589ef74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2025 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/nxp,imx94-dcif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX94 Display Control Interface (DCIF)
> +
> +maintainers:
> +  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> +
> +description:
> +  The Display Control Interface(DCIF) is a system master that fetches graphics
> +  stored in memory and displays them on a TFT LCD panel or connects to a
> +  display interface depending on the chip configuration.
> +
> +properties:
> +  compatible:
> +    const: nxp,imx94-dcif
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: CPU domain 0 (controlled by common registers group).
> +      - description: CPU domain 1 (controlled by background layer registers group).
> +      - description: CPU domain 2 (controlled by foreground layer registers group).
> +
> +  interrupt-names:
> +    items:
> +      - const: common
> +      - const: bg_layer
> +      - const: fg_layer
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: axi
> +      - const: pix
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Display Pixel Interface(DPI) output port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        display-controller@4b120000 {
> +            compatible = "nxp,imx94-dcif";
> +            reg = <0x0 0x4b120000 0x0 0x300000>;
> +            interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "common", "bg_layer", "fg_layer";
> +            clocks = <&scmi_clk 69>, <&scmi_clk 70>, <&dispmix_csr 0>;
> +            clock-names = "apb", "axi", "pix";
> +            assigned-clocks = <&dispmix_csr 0>;
> +            assigned-clock-parents = <&ldb_pll_pixel>;
> +            power-domains = <&scmi_devpd 11>;
> +
> +            port {
> +                dcif_out: endpoint {
> +                    remote-endpoint = <&ldb_in>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.49.0
> 
