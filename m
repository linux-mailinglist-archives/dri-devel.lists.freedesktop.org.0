Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B781320FA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BFB89A7A;
	Tue,  7 Jan 2020 08:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C176E31D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 14:00:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t2so49719180wrr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 06:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=RzIMtNvAGQDbPQVx0Hz3IAid0OWJww7Kls0bXG4Uy/E=;
 b=PHWtKbOq/CrEs4SUS0sUv0iWuifZsXc4GJvxG3DUxbB4axii0Sejhfh423vwJbn5ir
 s6IUgTdi/i/a7HmdLf7FFRncae8amgnaQHDmizwDygH2u6JBVkf9kt4dFiqMDXSw1RCe
 MewDaPHANWnLQkO6Sf6xgsSeUIdj/c8hzz0s3rTL3mug6xWH5+TE+6AbV/ehr7xEIkXu
 U+x1jNhka2otSOp2qRo1jK7QXsxJ+t/QjYtJprNIkhRb9vQpNoCC9PVdRcyICnmj745t
 lHiodzueeyX9ZGfz9wNHUgE8fD4EHCAjTtt67RxGO09OfuOLbQ8DKbQbQleVMR/7Fzyy
 OONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RzIMtNvAGQDbPQVx0Hz3IAid0OWJww7Kls0bXG4Uy/E=;
 b=oF6gy0OjyD52SiStflI1ED6ZeGmWRFkoWaNgavBBdvuJMJNuyvOl9iNXxioXAzwe8P
 vQ8ZpkFcSAtlc8H/5f4qA5lArVVMic2kyjvxphj2jO/koUSNZN2b/PkouzOIHT/Cd6yg
 K3REmnp9geUCQxjKWTZnbo+qN0oTjb29oKJ+3KghfkgGZLRIkrQ2RUNVZQx8RIeVuDVy
 9nIkkPwmwLCO3Oh85VldrAorlOcaG0ICC0t/YY4groPy9xogiOmFfWEiriv3xybXi2fS
 ALDSe2+BonM2DrIee1VHFBZuZaVL3z5MjM/+YBMsNh2n6kWIWV/TJgEQ7xzCXQPRMrOx
 2V6Q==
X-Gm-Message-State: APjAAAWg+42U5i9IHqVflYUnnh8whytfntZm8iN1sjnE3zYnbpx6QBrV
 IKPnt7kaZ9fcbvBhOgPouRg=
X-Google-Smtp-Source: APXvYqwegU8fPwN/m0F//DfKIlBREr//Y7HVFmc5A7QaEiFngWeOC/9nSkyQ7d0wVBce3/I6w6Zv5w==
X-Received: by 2002:a05:6000:1187:: with SMTP id
 g7mr49594123wrx.109.1578319257965; 
 Mon, 06 Jan 2020 06:00:57 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id p26sm22566715wmc.24.2020.01.06.06.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 06:00:57 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: mripard@kernel.org,
	wens@csie.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/sun4i: use PTR_ERR_OR_ZERO macro.
Date: Mon,  6 Jan 2020 17:00:52 +0300
Message-Id: <20200106140052.30747-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:05:10 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of IS_ERR and PTR_ZERO macros by returning the
PTR_ERR_OR_ZERO macro.
Changes suggested by coccinelle. 

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_dotclock.c     | 4 +---
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 4 +---
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c     | 4 +---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c | 4 +---
 4 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_dotclock.c b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
index 417ade3d2565..84c04d8192b3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_dotclock.c
+++ b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
@@ -191,10 +191,8 @@ int sun4i_dclk_create(struct device *dev, struct sun4i_tcon *tcon)
 	dclk->hw.init = &init;
 
 	tcon->dclk = clk_register(dev, &dclk->hw);
-	if (IS_ERR(tcon->dclk))
-		return PTR_ERR(tcon->dclk);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(tcon->dclk);
 }
 EXPORT_SYMBOL(sun4i_dclk_create);
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
index 2ff780114106..7a59505d6907 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
@@ -135,8 +135,6 @@ int sun4i_ddc_create(struct sun4i_hdmi *hdmi, struct clk *parent)
 	ddc->m_offset = hdmi->variant->ddc_clk_m_offset;
 
 	hdmi->ddc_clk = devm_clk_register(hdmi->dev, &ddc->hw);
-	if (IS_ERR(hdmi->ddc_clk))
-		return PTR_ERR(hdmi->ddc_clk);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(hdmi->ddc_clk);
 }
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
index b66fa27fe6ea..12a7b7b1c99c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
@@ -278,10 +278,8 @@ static int sun4i_hdmi_init_regmap_fields(struct sun4i_hdmi *hdmi)
 	hdmi->field_ddc_sck_en =
 		devm_regmap_field_alloc(hdmi->dev, hdmi->regmap,
 					hdmi->variant->field_ddc_sck_en);
-	if (IS_ERR(hdmi->field_ddc_sck_en))
-		return PTR_ERR(hdmi->field_ddc_sck_en);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(hdmi->field_ddc_sck_en);
 }
 
 int sun4i_hdmi_i2c_create(struct device *dev, struct sun4i_hdmi *hdmi)
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
index a4d31fe3abff..fd09eff21b25 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
@@ -171,8 +171,6 @@ int sun8i_phy_clk_create(struct sun8i_hdmi_phy *phy, struct device *dev,
 	priv->hw.init = &init;
 
 	phy->clk_phy = devm_clk_register(dev, &priv->hw);
-	if (IS_ERR(phy->clk_phy))
-		return PTR_ERR(phy->clk_phy);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(phy->clk_phy)
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
