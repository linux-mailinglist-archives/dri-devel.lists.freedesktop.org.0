Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377AF966FB5
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 08:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAAFE10E0ED;
	Sat, 31 Aug 2024 06:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rfvl9omS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077A610E0C8
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 06:16:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9C4D35C4426;
 Sat, 31 Aug 2024 06:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E5DC4CEC0;
 Sat, 31 Aug 2024 06:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725084990;
 bh=Itrc34IYAY3xn9/wCabZCczGxzpgNo8B22FkQ32dCTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rfvl9omSqu1jEcX+TQ5OzZmzSgYejtsE5EMIJfBBcgCcsNGvYEIz2Ljwd/f+bf4ak
 XS3MgHGGQ+W6ed050cNvRCggcLUDoqIdJqn+pOIbaI2XBbJooz1l2v0gD+fJie5kh5
 ATqIZG10O2ewOmXNEi0tQqW4lXg6XBoalcb3MJpTms2hKefa+6OYecfZjj1y4+vW2Y
 zar0ZQ6y+5oClQCl2nBXdpEo3KdUfXVJ44bSikR/QDJMFM67tQ9mCT7aZeSihcpg1J
 Iz6Xqtubv8sfhMnwyxLzJN3vgFM6HWf9vrs3e6pJ/gW7mDQu3IZcWP44L+jEzdzDoq
 Iw5OY4LHLRxiQ==
Date: Sat, 31 Aug 2024 08:16:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Mark Yao <markyao0591@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>, 
 Luis de Arquer <ldearquer@gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: display: bridge: Add schema for
 Synopsys DW HDMI QP TX IP
Message-ID: <57wj2vwjv7eehlix2bmvbm3z4agv5fsyp6vmwwqzotkdsadx7n@azqg2kkaeuxz>
References: <20240831-b4-rk3588-bridge-upstream-v5-0-9503bece0136@collabora.com>
 <20240831-b4-rk3588-bridge-upstream-v5-1-9503bece0136@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240831-b4-rk3588-bridge-upstream-v5-1-9503bece0136@collabora.com>
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

On Sat, Aug 31, 2024 at 12:55:29AM +0300, Cristian Ciocaltea wrote:
> Add dt-binding schema containing the common properties for the Synopsys
> DesignWare HDMI QP TX controller.
> 
> Note this is not a full dt-binding specification, but is meant to be
> referenced by platform-specific bindings for this IP core.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../display/bridge/synopsys,dw-hdmi-qp.yaml        | 88 ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi-qp.yaml
> new file mode 100644
> index 000000000000..771f7fba6c50
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi-qp.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/synopsys,dw-hdmi-qp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Properties for Synopsys DesignWare HDMI QP TX Controller IP
> +
> +maintainers:
> +  - Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> +
> +description: |
> +  The Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP) TX Controller IP core
> +  supports the following features, among others:
> +
> +  * Fixed Rate Link (FRL)
> +  * Display Stream Compression (DSC)
> +  * 4K@120Hz and 8K@60Hz video modes
> +  * Variable Refresh Rate (VRR) including Quick Media Switching (QMS)
> +  * Fast Vactive (FVA)
> +  * SCDC I2C DDC access
> +  * Multi-stream audio
> +  * Enhanced Audio Return Channel (EARC)
> +
> +  Note this is not a full dt-binding specification, but is meant to be
> +  referenced by platform-specific bindings for this IP core.
> +
> +properties:
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 4
> +    maxItems: 6
> +    items:
> +      - description: Peripheral/APB bus clock
> +      - description: EARC RX biphase clock
> +      - description: Reference clock
> +      - description: Audio interface clock
> +    additionalItems: true

What is the usefulness of all this? How can you even be sure that each
implementation of this core will have exactly these clocks?


> +
> +  clock-names:
> +    minItems: 4
> +    maxItems: 6
> +    items:
> +      - const: pclk
> +      - const: earc
> +      - const: ref
> +      - const: aud
> +    additionalItems: true
> +
> +  interrupts:
> +    minItems: 4
> +    maxItems: 5
> +    items:
> +      - description: AVP Unit interrupt
> +      - description: CEC interrupt
> +      - description: eARC RX interrupt
> +      - description: Main Unit interrupt

If these are real pins, then this seems more possible, but
additionalItems does not make me happy.

I don't see much value in this schema and I am afraid even enforcing
clock and interrupt names won't work for the second or third user.

Best regards,
Krzysztof

