Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C288C6134F
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 12:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F0610E030;
	Sun, 16 Nov 2025 11:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wzunf4+D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D356310E030
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 11:29:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 20C2A60183;
 Sun, 16 Nov 2025 11:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A557C4CEF1;
 Sun, 16 Nov 2025 11:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763292569;
 bh=mnXvqYmImcinYneeN4zW9LnuvANHy8IWtl4d1UPxOE8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wzunf4+Dqpm8I172TRzSWUXI6UzmdSlHBq8WRdCWcS94xCaQm+lKMWs54tSMmFeSu
 0GmB/twTiwhYFSrxFAG1f3TYhJ7Gd42+wN5/tmmAJRuT3km0Uq2dRgy6vQDE+FSKSG
 Ks6rda4N7Eam799dwq3KdZDNuxIqAwMe6/i4Iy++9UxUjxAMwD/tZB3XJCg9TygBmi
 yYG3g3vk3adHL/vlhpDzM0UjZjNeiTH2SelYpRF+zwBb06K7yET+XUXd8Ftwiw67CA
 p8+z0LYsDz/GVpjoHsbqJqVqSwlQXit2P5MxXdrnVIIAUvONjeYP4QsV9P4aJMlu3n
 VoSpxAaT3fE+w==
Date: Sun, 16 Nov 2025 12:29:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, 
 sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: display: allwinner: Add DE33 planes
Message-ID: <20251116-humongous-ant-from-betelgeuse-c0c416@kuoka>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-5-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251115141347.13087-5-jernej.skrabec@gmail.com>
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

On Sat, Nov 15, 2025 at 03:13:44PM +0100, Jernej Skrabec wrote:
> Allwinner Display Engine 3.3 contains planes, which are shared resources
> between all mixers present in SoC. They can be assigned to specific
> mixer by using registers which reside in display clocks MMIO.
> 
> Add a binding for them.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
> new file mode 100644
> index 000000000000..801e5068a6b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-planes.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner H616 Display Engine 3.3 planes
> +
> +maintainers:
> +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Display Engine 3.3 planes are independent of mixers, contrary to
> +  previous generations of Display Engine. Planes can be assigned to
> +  mixers independently and even dynamically during runtime.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - allwinner,sun50i-h616-de33-planes
> +
> +  reg:
> +    maxItems: 1
> +
> +  allwinner,plane-mapping:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle of Display Engine clock node

You description is almost duplicating property name. You need to explain
here how this device uses them.

Esxpecially that clocks do not go via custom properties.

Best regards,
Krzysztof

