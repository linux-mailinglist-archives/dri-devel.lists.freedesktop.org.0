Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F25D14854
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 18:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B6910E426;
	Mon, 12 Jan 2026 17:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r+fsgxij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1907B10E426
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 17:50:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi
 [81.175.209.152])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D49C1316;
 Mon, 12 Jan 2026 18:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1768240180;
 bh=If0EDU6H4zCtbyzNr1wpDXu4gqKUvy4RcPtwcDab0Jg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r+fsgxijiI5VwhvVQ0/zspPgkpcAp+k8uz8tvsulb5M0phoPVD8Nc1C9NL7cBFz0W
 lasBayTK2d5c34FlRBIkNR+PeiAyIq/IG6n3YP7rLTFV1VQAYoDos/iYaiqY7pimQw
 tzy52CdaIw4CdBV+qoEM45ZOLeExVKNY22nxdrPI=
Date: Mon, 12 Jan 2026 19:49:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: bridge: nxp,tda998x: Add missing
 clocks
Message-ID: <20260112174945.GC26365@pendragon.ideasonboard.com>
References: <2b66577296583a6787f770f0eb13c42a6b50768b.1768233569.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2b66577296583a6787f770f0eb13c42a6b50768b.1768233569.git.geert+renesas@glider.be>
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

Hi Geert,

Thank you for the patch.

On Mon, Jan 12, 2026 at 05:02:40PM +0100, Geert Uytterhoeven wrote:
> Some TDA998x variants (e.g. TDA19988) have an OSC_IN pin, to connect
> an external oscillator circuit or clock source.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This fixes "make dtbs_check":
> 
>     arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
>     arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
>     arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
>     arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> 
> This patch can be considered v3 of "[PATCH v2 2/3] [RFC] arm64: dts:
> renesas: cat874: Drop bogus clocks property"[1], as the pin is actually
> connected to a clock source on that board.  On BeagleBone Black, it is
> also connected to a clock source, but not described in DT.
> 
> The linux driver does not use this clock directly, but I suspect[2] the
> use of this pin is controlled through the AP_ENA register value, as
> specified in the second cell of the the audio-ports property.
> 
> [1] https://lore.kernel.org/97b949cddd7e30e9c05873800330dccd3483b12b.1663165552.git.geert+renesas@glider.be
> [2] I do not have access to the programming manual.
> ---
>  .../devicetree/bindings/display/bridge/nxp,tda998x.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> index 3fce9e698ea1d2dd..1205c8e9de329bbc 100644
> --- a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> @@ -19,6 +19,9 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  clocks:
> +    maxItems: 1
> +

I wonder if we should add a compatible string for the variants with a
clock pin, to let drivers manage the clock.

If the clock does not need to be controlled, an alternative would be to
drop the clocks property from
arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts.

>    video-ports:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      default: 0x230145

-- 
Regards,

Laurent Pinchart
