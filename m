Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D67D8163ECE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DB76EB1A;
	Wed, 19 Feb 2020 08:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF97B6E38A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 17:50:37 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y6so24016880lji.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 09:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jSPOPeuyv6X0CnInvNkcvya9Y67/qUcIjhk322wCKUc=;
 b=MNwL8PSYhHdSj1F1zhVgb+7VBSF2GVAdZDTKEogPx0XtmbvzwexdZ3jipmGBLXTbRc
 o35jq02YuHYhlPXIdY+Qtlf+byJ6ohM2WSIutfMQx23lgEMsBk9g3QC7SdWpfFUsr+Zx
 AvaBRrsjiWbknRZZdD2YF3Vox+CqRNM2vXz0MNLH+HYa7VmWXF4kWktNg8g6zlhfGeHX
 mhjg9O7mViWubwDH40xw72R8Se2+W6fzh82o6J3NivbLbZW+S2jgcWNvFM13O7DBfYXN
 E17NibKIOvgJB7/kc3Z82y1/kMdEiUC8lvl7Eyzbj7Za23CJCDduMjPCzs5YK/Dn1twh
 5jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jSPOPeuyv6X0CnInvNkcvya9Y67/qUcIjhk322wCKUc=;
 b=dTPThVrcXOWNdiHxasvkKSFo/YI/Xihg9zF2CEUjlC5AtlFa1JS+IQ2IQ8Q5jxhbFL
 CVsGwNbVkLJLg0MkJaWw0ajUUnQQh4tAlRFgP+knWZZY6+7W/rSKYxu2Xy3yWbvsCmLX
 8Bd4R3+jcCOQFb5fUutefZeHZNohyiiyPCKfoM+ARpxCqMhBqOJjfUF71D3/+KaNYMbW
 tXCUZCuXZjGrNF4ZJGV07QbPIT1InWYjAXEK949folcbmRZZ3kYeOhxlSLg/xLhcK8FN
 iwbRSeGuZF1YpGvs/XYMZ/b/tMISbp9LMKIzrpFfLtG6YLXPxOZFjQEaeIamsecE0CRR
 EuzQ==
X-Gm-Message-State: APjAAAW5dm7BnqI5lD+iNsNmNNIST4WHqnKKfkJsKLILLCBKsHtHBV1t
 WUgmsOzatQQJABm+H+XrlqE=
X-Google-Smtp-Source: APXvYqzPg8ZPFXLqhoYWrAMxsQWiNN6rzoOF4CLEUYfXurUp+aoaYr4o1PdNBdL4SAqF69N/gjy1Aw==
X-Received: by 2002:a2e:b0c4:: with SMTP id g4mr13653725ljl.83.1582048235775; 
 Tue, 18 Feb 2020 09:50:35 -0800 (PST)
Received: from kedthinkpad ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id l22sm2948359ljb.2.2020.02.18.09.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 09:50:35 -0800 (PST)
Date: Tue, 18 Feb 2020 19:50:33 +0200
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 2/2] ARM: sun7i: dts: Add LVDS panel support on A20
Message-ID: <20200218175033.GA25850@kedthinkpad>
References: <20200210195633.GA21832@kedthinkpad>
 <20200212222355.17141-2-andrey.lebedev@gmail.com>
 <20200213094304.hf3glhgmquypxpyf@gilmour.lan>
 <20200213200823.GA28336@kedthinkpad>
 <20200214075218.huxdhmd4qfoakat2@gilmour.lan>
 <20200214084358.GA25266@kedthinkpad>
 <20200214085351.2whnfyulrmyex2va@gilmour.lan>
 <20200214213231.GA6583@kedthinkpad>
 <20200217175135.ldtqji4mrwz2wbn5@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217175135.ldtqji4mrwz2wbn5@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrey Lebedev <andrey@lebedev.lt>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 17, 2020 at 06:51:35PM +0100, Maxime Ripard wrote:
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> > index cfbf4e6c1679..bc87d28ee341 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> > @@ -235,6 +235,8 @@ struct sun4i_tcon_quirks {
> >  	bool	needs_de_be_mux; /* sun6i needs mux to select backend */
> >  	bool    needs_edp_reset; /* a80 edp reset needed for tcon0 access */
> >  	bool	supports_lvds;   /* Does the TCON support an LVDS output? */
> > +	/* "compatible" string of TCON that exclusively supports LVDS */
> > +	const char *lvds_compatible_tcon;
> 
> However this is far more complicated than needed, you can simply add a
> new quirks structure associated to the tcon0 compatible in
> sun4i_tcon_of_table, and that will do

Aha! Does this look good to you?

From 4ad2978e404c63d4cca1b7890bc5bdd4d1e8965d Mon Sep 17 00:00:00 2001
From: Andrey Lebedev <andrey@lebedev.lt>
Date: Tue, 18 Feb 2020 19:47:33 +0200
Subject: [PATCH] Mark tcon0 to be the only tcon capable of LVDS on sun7i-a20

This allows to avoid warnings about reset line not provided for tcon1.

Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
---
 arch/arm/boot/dts/sun7i-a20.dtsi   |  6 ++++--
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 14 ++++++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index dc4f3f249aee..d50263c1ca9a 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -405,7 +405,8 @@
 		};
 
 		tcon0: lcd-controller@1c0c000 {
-			compatible = "allwinner,sun7i-a20-tcon";
+			compatible = "allwinner,sun7i-a20-tcon0",
+				     "allwinner,sun7i-a20-tcon";
 			reg = <0x01c0c000 0x1000>;
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&ccu RST_TCON0>, <&ccu RST_LVDS>;
@@ -460,7 +461,8 @@
 		};
 
 		tcon1: lcd-controller@1c0d000 {
-			compatible = "allwinner,sun7i-a20-tcon";
+			compatible = "allwinner,sun7i-a20-tcon1",
+				     "allwinner,sun7i-a20-tcon";
 			reg = <0x01c0d000 0x1000>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&ccu RST_TCON1>;
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 800a9bd86112..d9605d331010 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1479,7 +1479,7 @@ static const struct sun4i_tcon_quirks sun6i_a31s_quirks = {
 	.dclk_min_div		= 1,
 };
 
-static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
+static const struct sun4i_tcon_quirks sun7i_a20_tcon0_quirks = {
 	.supports_lvds		= true,
 	.has_channel_0		= true,
 	.has_channel_1		= true,
@@ -1489,6 +1489,15 @@ static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
 	.setup_lvds_phy		= sun4i_tcon_setup_lvds_phy,
 };
 
+static const struct sun4i_tcon_quirks sun7i_a20_tcon1_quirks = {
+	.supports_lvds		= false,
+	.has_channel_0		= true,
+	.has_channel_1		= true,
+	.dclk_min_div		= 4,
+	/* Same display pipeline structure as A10 */
+	.set_mux		= sun4i_a10_tcon_set_mux,
+};
+
 static const struct sun4i_tcon_quirks sun8i_a33_quirks = {
 	.has_channel_0		= true,
 	.has_lvds_alt		= true,
@@ -1534,7 +1543,8 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun5i-a13-tcon", .data = &sun5i_a13_quirks },
 	{ .compatible = "allwinner,sun6i-a31-tcon", .data = &sun6i_a31_quirks },
 	{ .compatible = "allwinner,sun6i-a31s-tcon", .data = &sun6i_a31s_quirks },
-	{ .compatible = "allwinner,sun7i-a20-tcon", .data = &sun7i_a20_quirks },
+	{ .compatible = "allwinner,sun7i-a20-tcon0", .data = &sun7i_a20_tcon0_quirks },
+	{ .compatible = "allwinner,sun7i-a20-tcon1", .data = &sun7i_a20_tcon1_quirks },
 	{ .compatible = "allwinner,sun8i-a23-tcon", .data = &sun8i_a33_quirks },
 	{ .compatible = "allwinner,sun8i-a33-tcon", .data = &sun8i_a33_quirks },
 	{ .compatible = "allwinner,sun8i-a83t-tcon-lcd", .data = &sun8i_a83t_lcd_quirks },
-- 
2.20.1


-- 
Andrey Lebedev aka -.- . -.. -.. . .-.
Software engineer
Homepage: http://lebedev.lt/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
