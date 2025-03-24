Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C863FA6DF33
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 17:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C154410E494;
	Mon, 24 Mar 2025 16:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fYwYfGSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DEC10E3EF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 16:02:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 36ABE6157F;
 Mon, 24 Mar 2025 16:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88EC6C4CEDD;
 Mon, 24 Mar 2025 16:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742832155;
 bh=lO70/EyOTHsSUCsToe3wwdpu/s9KqX41Qnit5o85758=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fYwYfGSZVzY31upbyL96Mn2jcC6wRm9sskzWthKcQ05zB6hH9VZVivy37hpuecwwl
 xc2cFdT2vZ5M7IjIYVJ6TZuD6OUHfwsb26FmHK6iijmHFu2rBYCrdXeACBHEqImCbu
 OH06I7Goiyrr9tiCwAvThh7vEAbwwHqzkhjTRWGsDcDJ0Jhr/y6cL6cEme8Wz8+/pO
 Yqe5AYNV3x7zfSs1n3TOg8GMJluf8wXbd9OiiqYwdjq0lhiy93wOFoWpfycs8xnFL0
 5XqidcdArCoZQE38NAu06CxseJ9qKIeK02KWZG/Sk34UbSU9a6zm2heVsfXUyDqjPY
 ew4royVay7aKw==
Date: Mon, 24 Mar 2025 11:02:34 -0500
From: Rob Herring <robh@kernel.org>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, jason-jh.lin@mediatek.com,
 nancy.lin@mediatek.com, singo.chang@mediatek.com,
 xiandong.wang@mediatek.com, sirius.wang@mediatek.com,
 sunny.shen@mediatek.com, fshao@chromium.org, treapking@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 05/15] dt-bindings: display: mediatek: add OUTPROC
 yaml for MT8196
Message-ID: <20250324160234.GA113887-robh@kernel.org>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
 <20250321093435.94835-6-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321093435.94835-6-paul-pl.chen@mediatek.com>
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

On Fri, Mar 21, 2025 at 05:33:34PM +0800, paul-pl.chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediate,outproc.yaml to support OUTPROC for MT8196.
> MediaTek display overlap output processor, namely OVL_OUTPROC
> or OUTPROC,handles the post-stage of pixel processing in the
> overlapping procedure.
> 
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,outproc.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
> new file mode 100644
> index 000000000000..f42e9abc1436
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek display overlap output processor
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |

Don't need '|' if no formatting to preserve.

> +  MediaTek display overlap output processor, namely OVL_OUTPROC or OUTPROC,
> +  handles the post-stage of pixel processing in the overlapping procedure.
> +  OVL_OUTPROC manages pixels for gamma correction and ensures that pixel
> +  values are within the correct range.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-outproc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        disp_ovl0_outproc0: outproc@32970000 {

Drop unused labels.

> +            compatible = "mediatek,mt8196-outproc";
> +            reg = <0 0x32970000 0 0x1000>;
> +            clocks = <&ovlsys_config_clk 49>;
> +            interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH 0>;
> +        };
> +    };
> -- 
> 2.45.2
> 
