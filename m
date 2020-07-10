Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0901321C01E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BD36ED40;
	Fri, 10 Jul 2020 22:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5836ED40
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:50:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D55F62C0;
 Sat, 11 Jul 2020 00:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594421446;
 bh=18Z90ZunYSgLAwDlO01vtncPi5Vsgpi6t9PmK1tnIww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FVu4uBdwnoxD7JlLZ49khmS9rUSZkmtzIeNhg+EQL9dOSpV8Vyh+EnXyqEq4RsXBC
 lq7wOAw9XYjBqRuvnzFgAsCXxVEgXK/I+27WUIRqo+OGjxSAg+YZd1HQ5cr3A7mrXc
 X7NXE5soVAm4GRTHxywhyxvzRnrwzcJXAB/dNpJ0=
Date: Sat, 11 Jul 2020 01:50:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv1 3/4] ARM: dts: omap4-droid4: add panel compatible
Message-ID: <20200710225039.GZ5964@pendragon.ideasonboard.com>
References: <20200629223315.118256-1-sebastian.reichel@collabora.com>
 <20200629223315.118256-4-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629223315.118256-4-sebastian.reichel@collabora.com>
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
Cc: devicetree@vger.kernel.org, kernel@collabora.com,
 Tony Lindgren <tony@atomide.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

Thank you for the patch, and for your continuous effort on this.

On Tue, Jun 30, 2020 at 12:33:14AM +0200, Sebastian Reichel wrote:
> Add Droid 4 specific compatible value in addition to the
> generic one, so that we have the ability to add panel
> specific quirks in the future.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/motorola-mapphone-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> index 4ffe461c3808..0e22fdfa42aa 100644
> --- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> +++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> @@ -208,7 +208,7 @@ dsi1_out_ep: endpoint {
>  	};
>  
>  	lcd0: panel@0 {
> -		compatible = "panel-dsi-cm";
> +		compatible = "motorola,droid4-panel", "panel-dsi-cm";
>  		reg = <0>;
>  		label = "lcd0";
>  		vddi-supply = <&lcd_regulator>;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
