Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF7A9E166B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810FE10E989;
	Tue,  3 Dec 2024 08:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="chRQafVg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E5810E98C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:57:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 175DA8DB;
 Tue,  3 Dec 2024 09:57:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733216243;
 bh=x30FrEaj8WE6tyivQYNyKSXsF9RnXvjmutw0qPlrjCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=chRQafVg137urB2cXCuZ7fDxP2iKxiv5ZtCjo2pUZRbis13Z+iNKKVsNaSO6F7f5r
 qG3ZyqvBO31HJ3N4nCcFcYIYyKakmPpN6R4BsHncZLALddq4pVA5+hT91QiqOUod6h
 2ffOoQG0HbMsMMjBYzFb2O66KU08JTXE98pxXw1Y=
Date: Tue, 3 Dec 2024 10:57:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 7/9] arm64: dts: renesas: gray-hawk-single: Fix indentation
Message-ID: <20241203085739.GK10736@pendragon.ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-7-738ae1a95d2a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203-rcar-gh-dsi-v1-7-738ae1a95d2a@ideasonboard.com>
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

Hi Tomi,

Thank you for the patch.

On Tue, Dec 03, 2024 at 10:01:41AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Fix the indent on the two regulators.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 24 +++++++++++-----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> index 9a1917b87f61..057f959d67b3 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> @@ -127,21 +127,21 @@ memory@480000000 {
>  	};
>  
>  	reg_1p8v: regulator-1p8v {
> -			compatible = "regulator-fixed";
> -			regulator-name = "fixed-1.8V";
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> -			regulator-boot-on;
> -			regulator-always-on;
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-1.8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +		regulator-always-on;
>  	};
>  
>  	reg_3p3v: regulator-3p3v {
> -			compatible = "regulator-fixed";
> -			regulator-name = "fixed-3.3V";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			regulator-boot-on;
> -			regulator-always-on;
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-3.3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
>  	};
>  
>  	sound_mux: sound-mux {

-- 
Regards,

Laurent Pinchart
