Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEB186B50B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 17:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6293010E056;
	Wed, 28 Feb 2024 16:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JEq8YU5Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0951F10E056
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:33:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E5196B3;
 Wed, 28 Feb 2024 17:32:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709137970;
 bh=WpEvuwbQqpreIe52/sd2Mcz0JuvJUxbOEsWvJ1YBNo8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JEq8YU5ZK2sTFXcAhT5IyohlO9Wh3ZxTIe0h6vv3Y2ZOvuKOyjpE5VsZFfo7l61Gt
 hhC7uVAA4PKglQqALuCgxG8cVTst1iNOljRBqMHbKxeRCY5r8VZS+hY8YI8i0UHyiB
 wKblZF2HKE7RJLmyE7jA3Nr4oeTxHvyU7X2xo45U=
Date: Wed, 28 Feb 2024 18:33:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 aford@beaconembedded.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp-beacon-kit: Enable HDMI bridge HPD
Message-ID: <20240228163304.GI9863@pendragon.ideasonboard.com>
References: <20240228113737.43434-1-aford173@gmail.com>
 <20240228113737.43434-2-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240228113737.43434-2-aford173@gmail.com>
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

Hi Adam,

Thank you for the patch.

On Wed, Feb 28, 2024 at 05:37:36AM -0600, Adam Ford wrote:
> The DSI to HDMI bridge supports hot-plut-detect, but the
> driver didn't previously support a shared IRQ GPIO.  With
> the driver updated, the interrupt can be added to the bridge.

You can reflow the commit message to 72 columns.

> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> index 8de4dd268908..d854c94ec997 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> @@ -405,6 +405,8 @@ adv_bridge: hdmi@3d {
>  		compatible = "adi,adv7535";
>  		reg = <0x3d>, <0x3c>, <0x3e>, <0x3f>;
>  		reg-names = "main", "cec", "edid", "packet";
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
>  		adi,dsi-lanes = <4>;
>  		#sound-dai-cells = <0>;
>  

-- 
Regards,

Laurent Pinchart
