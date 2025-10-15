Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32134BDEBD9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 15:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D97110E7E4;
	Wed, 15 Oct 2025 13:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tNH2wHcG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380C910E7E4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 13:24:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DEFA945440;
 Wed, 15 Oct 2025 13:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4B7C2BC87;
 Wed, 15 Oct 2025 13:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760534684;
 bh=+PQNqX6gMuYpsO5dyv6A77vO1jpZNDtI0y4dh0PlVsg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tNH2wHcGLKEopWnn6dtv3Guntm2gDqa28wUfwL7veY1feRvROo/0HdYgMSYoieIYm
 3rzdAECnSHKGJ/UXeqdJErE9r3dYGT7BhbpLW+FOXaVBfm/QK0qoOctjLWjZ0HqO9j
 7GOT1sxoQ4tHehql3ulZjEYyeKJC2LZlwakqKYeHi8IK0CkWV8dW9iUYlLlTrHG19L
 FCbMtJiUgOhcAN+m5h0b+4l+5PNFQYpmkAIGOF4xx8wynBMhRdc8gyde0XgIsLsejY
 yyoFXyFQDN38p8XG6KKYnhZrcODRMQ1plSTEghFIteWZHGXdVgAvqlM6w5ov+J1Ww7
 KTuthKBgE25Ug==
Date: Wed, 15 Oct 2025 08:24:42 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
Message-ID: <20251015132442.GA3241958-robh@kernel.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-2-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-2-marek.vasut@mailbox.org>
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

On Sat, Oct 11, 2025 at 06:51:16PM +0200, Marek Vasut wrote:
> i.MX95 Display Controller display engine consists of all processing
> units that operate in a display clock domain. Document DomainBlend
> block which is specific to i.MX95 and required to get any display
> output on that SoC.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  .../display/imx/fsl,imx95-dc-domainblend.yaml | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
> new file mode 100644
> index 0000000000000..703f98e3321e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx95-dc-domainblend.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX95 Display Controller Domain Blend Unit
> +
> +description: Combines two input frames to a single output frame.
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut@mailbox.org>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx95-dc-domainblend
> +
> +  reg:
> +    maxItems: 1

No clocks or other resources?

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    domainblend@4b6a0000 {
> +        compatible = "fsl,imx95-dc-domainblend";
> +        reg = <0x4b6a0000 0x10>;
> +    };
> -- 
> 2.51.0
> 
