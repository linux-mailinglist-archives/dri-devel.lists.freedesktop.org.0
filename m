Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357F49D546C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 22:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1E910E053;
	Thu, 21 Nov 2024 21:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X1zAqew2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFCA10E053
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 21:02:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9E030A40EB7;
 Thu, 21 Nov 2024 21:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3C7C4CECC;
 Thu, 21 Nov 2024 21:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732222957;
 bh=GM3w9B7r/t0zBm+hXRgtpgZU0x9idteO2H6rmGktuaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X1zAqew2MWcEEWPd9iStevglFRhfKSXOylhXAK6bkhjqwDXmpznRQJINCU4m1GPPE
 PLdZ88moM1eAZ1roOlNBOKJrOzGmZzu0+Avl1rUuIyRh3kyevAGWE9+tYvsUKmQNsB
 Pyr+/wtS9OBbDl/IRXMRM9/pfebUb0Nd2XDgRuaNvoYpXBGFJvfBMaMhN9tgev7uK9
 Q0ljzrDg3kH9DIh5r4+Ep7HqFspUHrPHYN6rQq+4wotDF0YSFcIRHMH4h+VtqnkxlZ
 dp6B1P6Q9NOqlpxIIlYxqOMhE/DA1KTvOJyADV2rRcmqq5P1+R9qTYa9vMuMwTPQ6c
 96h2d2/jH8Lhw==
Date: Thu, 21 Nov 2024 15:02:35 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 1/7] dt-bindings: display: mediatek: Add binding for
 HDMIv2 DDC
Message-ID: <20241121210235.GA3798341-robh@kernel.org>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120124512.134278-2-angelogioacchino.delregno@collabora.com>
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

On Wed, Nov 20, 2024 at 01:45:06PM +0100, AngeloGioacchino Del Regno wrote:
> Add a binding for the Display Data Channel (DDC) IP in MediaTek
> SoCs with version 2 HDMI TX IP.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> new file mode 100644
> index 000000000000..d85e8ed2ffa7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek HDMI Display Data Channel (DDC) v2
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +  - CK Hu <ck.hu@mediatek.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: mediatek,mt8195-hdmi-ddc
> +      - items:
> +          - const: mediatek,mt8188-hdmi-ddc
> +          - const: mediatek,mt8195-hdmi-ddc
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hdmi {
> +        hdmi_ddc: i2c {
> +            compatible = "mediatek,mt8195-hdmi-ddc";
> +            clocks = <&clk26m>;

Is this really a separate block? Doesn't really look like it. You don't 
even have registers to interact with it.

> +        };
> +    };
> +...
> -- 
> 2.47.0
> 
