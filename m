Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72444158A5B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 08:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089A26EDC3;
	Tue, 11 Feb 2020 07:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107116ED3C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 19:56:37 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id n25so5181050lfl.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 11:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=+Vp99gmXOmzAr4kwih73mUZpLLZhJP36bCWbtwEkM2M=;
 b=IVE1m+boYfFsAkei5sitHTt42rYyvgx7AefTzenzYhhSMxqkFdxhNXKdDGoBR8jpDo
 zf/f0G138XO4TRcSsRaftBds6Ljoo0hBOg4jocFiWM5eMnLBAtrXK6+BHhIvf52pUH7a
 LusYw26sxV/OXGgW1u8DukjIxkFo2wlFtM4+mFliGQ/gn11Og5NXYMaXrc9eEg81nBeL
 467mcbrM6z18MRAhdsIeicEQ024azdFbedeDewbjmbnTcJoAHnFrB8PgnuoREyTpDhv0
 O1yGInNXxsOiqZLwe+bdQLmD73gzSXQepWD/h80wltyf6ZJayT66Eys+mxNf5DwBpb0+
 oVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=+Vp99gmXOmzAr4kwih73mUZpLLZhJP36bCWbtwEkM2M=;
 b=L5GtctM0FxvzhTNmL4KmcHEoI+ia/hSbM6zcriIcc+n5A8AIKM2h2/kpBvC4yticO4
 VIewUKkRkwsak2jzWRxh2oqHsnbJxRFNhAidUwXDRiH+SRNv9NsVpjp+0OXQHvcUER+2
 Y2Je8NlhunFxojK/iiczfcY/JSufK/cwlyK2PwJZuF3xl+gC3L4pdWBBVRYpSKHtl0JK
 4JodI9APAj3pmRO8M10HouTcmTrQxFZDJln6k8fdQmFUtdlQH9xaaylFaq3eALPStAeH
 8t6vd5EopC9QzMWPwMDBmh+B1srFQIhYevGaFOcUzA2izHMGZjnPsEEnhvQyuR0Tgau+
 IzQw==
X-Gm-Message-State: APjAAAWKis80j9yT7A4hM1TNIR0+aQiI5r1QO6vMLV8cIdUR0o+FSCyM
 Nl7IBvU+Pc5GDxTbUFzrH78=
X-Google-Smtp-Source: APXvYqzA17Cje2rmusmUFfK7j4fQQTvl9LMCQYu9vbuB0SOT5FOPce6rXHFVzj7jm75uI+0iw/xhUQ==
X-Received: by 2002:a19:4cc6:: with SMTP id z189mr1492261lfa.171.1581364596307; 
 Mon, 10 Feb 2020 11:56:36 -0800 (PST)
Received: from kedthinkpad ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id h10sm848723ljc.39.2020.02.10.11.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 11:56:35 -0800 (PST)
Date: Mon, 10 Feb 2020 21:56:33 +0200
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: mripard@kernel.org, wens@csie.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] Support LVDS output on Allwinner A20
Message-ID: <20200210195633.GA21832@kedthinkpad>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 11 Feb 2020 07:26:04 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A20 SoC (found in Cubieboard 2 among others) requires different LVDS set
up procedure than A33. Timing controller (tcon) driver only implements
sun6i-style procedure, that doesn't work on A20 (sun7i).

The support for such procedure is ported from u-boot and follows u-boot
naming convention: SUN6I* for sun6i-style procedure, and SUN4I for other
(which happens to be compatible with A20).
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 91 ++++++++++++++++++++----------
 drivers/gpu/drm/sun4i/sun4i_tcon.h | 12 ++++
 2 files changed, 73 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index c81cdce6ed55..78896e907ca9 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -114,46 +114,74 @@ static void sun4i_tcon_channel_set_status(struct sun4i_tcon *tcon, int channel,
 	}
 }
 
+static void sun4i_tcon_lvds_sun6i_enable(struct sun4i_tcon *tcon,
+					 const struct drm_encoder *encoder) {
+	u8 val;
+	regmap_write(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+		     SUN6I_TCON0_LVDS_ANA0_C(2) |
+		     SUN6I_TCON0_LVDS_ANA0_V(3) |
+		     SUN6I_TCON0_LVDS_ANA0_PD(2) |
+		     SUN6I_TCON0_LVDS_ANA0_EN_LDO);
+	udelay(2);
+
+	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+			   SUN6I_TCON0_LVDS_ANA0_EN_MB,
+			   SUN6I_TCON0_LVDS_ANA0_EN_MB);
+	udelay(2);
+
+	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+			   SUN6I_TCON0_LVDS_ANA0_EN_DRVC,
+			   SUN6I_TCON0_LVDS_ANA0_EN_DRVC);
+
+	if (sun4i_tcon_get_pixel_depth(encoder) == 18)
+		val = 7;
+	else
+		val = 0xf;
+
+	regmap_write_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(0xf),
+			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(val));
+
+}
+
+static void sun4i_tcon_lvds_sun4i_enable(struct sun4i_tcon *tcon) {
+	regmap_write(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
+		     SUN4I_TCON0_LVDS_ANA0_CK_EN |
+		     SUN4I_TCON0_LVDS_ANA0_REG_V |
+		     SUN4I_TCON0_LVDS_ANA0_REG_C |
+		     SUN4I_TCON0_LVDS_ANA0_EN_MB |
+		     SUN4I_TCON0_LVDS_ANA0_PD |
+		     SUN4I_TCON0_LVDS_ANA0_DCHS);
+
+	udelay(2); /* delay at least 1200 ns */
+	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA1_REG,
+			   SUN4I_TCON0_LVDS_ANA1_INIT,
+			   SUN4I_TCON0_LVDS_ANA1_INIT);
+	udelay(1); /* delay at least 1200 ns */
+	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA1_REG,
+			   SUN4I_TCON0_LVDS_ANA1_UPDATE,
+			   SUN4I_TCON0_LVDS_ANA1_UPDATE);
+}
+
+
 static void sun4i_tcon_lvds_set_status(struct sun4i_tcon *tcon,
 				       const struct drm_encoder *encoder,
 				       bool enabled)
 {
 	if (enabled) {
-		u8 val;
-
+		// Enable LVDS interface
 		regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_IF_REG,
 				   SUN4I_TCON0_LVDS_IF_EN,
 				   SUN4I_TCON0_LVDS_IF_EN);
 
-		/*
-		 * As their name suggest, these values only apply to the A31
-		 * and later SoCs. We'll have to rework this when merging
-		 * support for the older SoCs.
-		 */
-		regmap_write(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
-			     SUN6I_TCON0_LVDS_ANA0_C(2) |
-			     SUN6I_TCON0_LVDS_ANA0_V(3) |
-			     SUN6I_TCON0_LVDS_ANA0_PD(2) |
-			     SUN6I_TCON0_LVDS_ANA0_EN_LDO);
-		udelay(2);
-
-		regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
-				   SUN6I_TCON0_LVDS_ANA0_EN_MB,
-				   SUN6I_TCON0_LVDS_ANA0_EN_MB);
-		udelay(2);
-
-		regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
-				   SUN6I_TCON0_LVDS_ANA0_EN_DRVC,
-				   SUN6I_TCON0_LVDS_ANA0_EN_DRVC);
-
-		if (sun4i_tcon_get_pixel_depth(encoder) == 18)
-			val = 7;
-		else
-			val = 0xf;
+		// Perform SoC-specific setup procedure
+		if (tcon->quirks->sun6i_lvds_init) {
+			sun4i_tcon_lvds_sun6i_enable(tcon, encoder);
+		}
+		else {
+			sun4i_tcon_lvds_sun4i_enable(tcon);
+		}
 
-		regmap_write_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
-				  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(0xf),
-				  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(val));
 	} else {
 		regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_IF_REG,
 				   SUN4I_TCON0_LVDS_IF_EN, 0);
@@ -1454,6 +1482,7 @@ static const struct sun4i_tcon_quirks sun6i_a31s_quirks = {
 };
 
 static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
+	.supports_lvds		= true,
 	.has_channel_0		= true,
 	.has_channel_1		= true,
 	.dclk_min_div		= 4,
@@ -1464,11 +1493,13 @@ static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
 static const struct sun4i_tcon_quirks sun8i_a33_quirks = {
 	.has_channel_0		= true,
 	.has_lvds_alt		= true,
+	.sun6i_lvds_init	= true,
 	.dclk_min_div		= 1,
 };
 
 static const struct sun4i_tcon_quirks sun8i_a83t_lcd_quirks = {
 	.supports_lvds		= true,
+	.sun6i_lvds_init	= true,
 	.has_channel_0		= true,
 	.dclk_min_div		= 1,
 };
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index a62ec826ae71..973901c1bee5 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -193,6 +193,13 @@
 #define SUN4I_TCON_MUX_CTRL_REG			0x200
 
 #define SUN4I_TCON0_LVDS_ANA0_REG		0x220
+#define SUN4I_TCON0_LVDS_ANA0_DCHS			BIT(16)
+#define SUN4I_TCON0_LVDS_ANA0_PD			BIT(20) | BIT(21)
+#define SUN4I_TCON0_LVDS_ANA0_EN_MB			BIT(22)
+#define SUN4I_TCON0_LVDS_ANA0_REG_C			BIT(24) | BIT(25)
+#define SUN4I_TCON0_LVDS_ANA0_REG_V			BIT(26) | BIT(27)
+#define SUN4I_TCON0_LVDS_ANA0_CK_EN			BIT(29) | BIT(28)
+
 #define SUN6I_TCON0_LVDS_ANA0_EN_MB			BIT(31)
 #define SUN6I_TCON0_LVDS_ANA0_EN_LDO			BIT(30)
 #define SUN6I_TCON0_LVDS_ANA0_EN_DRVC			BIT(24)
@@ -201,6 +208,10 @@
 #define SUN6I_TCON0_LVDS_ANA0_V(x)			(((x) & 3) << 8)
 #define SUN6I_TCON0_LVDS_ANA0_PD(x)			(((x) & 3) << 4)
 
+#define SUN4I_TCON0_LVDS_ANA1_REG		0x224
+#define SUN4I_TCON0_LVDS_ANA1_INIT			(0x1f << 26 | 0x1f << 10)
+#define SUN4I_TCON0_LVDS_ANA1_UPDATE			(0x1f << 16 | 0x1f << 00)
+
 #define SUN4I_TCON1_FILL_CTL_REG		0x300
 #define SUN4I_TCON1_FILL_BEG0_REG		0x304
 #define SUN4I_TCON1_FILL_END0_REG		0x308
@@ -224,6 +235,7 @@ struct sun4i_tcon_quirks {
 	bool	needs_de_be_mux; /* sun6i needs mux to select backend */
 	bool    needs_edp_reset; /* a80 edp reset needed for tcon0 access */
 	bool	supports_lvds;   /* Does the TCON support an LVDS output? */
+	bool	sun6i_lvds_init; /* Requires sun6i lvds initialization? */
 	u8	dclk_min_div;	/* minimum divider for TCON0 DCLK */
 
 	/* callback to handle tcon muxing options */
-- 
2.20.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
