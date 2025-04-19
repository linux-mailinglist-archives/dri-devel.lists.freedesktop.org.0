Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D54A944A0
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 18:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A4C10E047;
	Sat, 19 Apr 2025 16:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PG9nQocl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8260610E047
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Apr 2025 16:32:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F2CF7A49B36;
 Sat, 19 Apr 2025 16:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71973C4CEE7;
 Sat, 19 Apr 2025 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745080315;
 bh=p87HLeXoiavv+snXbGDgtJZGy4EraHN21PH0zs1j6Bk=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=PG9nQoclCPRmR11vhrh1tjjX2V9gohlplZbcpJK93bXjwosqqBK3rGciFS+L3zA/z
 s+3XkA0ryf8aUK3JRK5b+nsbkYlOdnQThZfhQh5v9C8BGtK/9wbH/PIzy3XHqC5L3Q
 +hDhcU+of9IglRt8aSOGx3TD5O3bYFoigs3rLsGOEAGMNtPpTwiWEEfnGTm1O355L8
 rxFggNUQkFvTkverR4Q/s1Fl9hV8xsRILnhYJ6qVfDMnwIXbNFgr6eW73vT3v8CTsN
 06uhAwmW7vlV1Lnq5J+J1f4IAoHja4PYxvfzCunHR7LTvPKqiGKZeZKNkliist2XyA
 A5e6ebbblrnww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5A452C369CA;
 Sat, 19 Apr 2025 16:31:55 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 19 Apr 2025 18:31:44 +0200
Subject: [PATCH] drm/panel: samsung-sofef00: Drop s6e3fc2x01 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-drop-s6e3fc2x01-support-v1-1-05edfe0d27aa@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAO/PA2gC/x3MwQqDMAyA4VeRnBdIaqfoq4wdio1bLrYk2xDEd
 7fs+B3+/wAXU3GYuwNMfupatga+dbC80/YS1NwMgcKdIk+YrVT0Qfp1CTsx+rfWYh/MNFDimOI
 4MbS6mqy6/8+P53leV0y9vmkAAAA=
X-Change-ID: 20250419-drop-s6e3fc2x01-support-d060a14a4791
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, Casey Connolly <casey@connolly.tech>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Casey Connolly <casey.connolly@linaro.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2917; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=WtxEn0HTzZjfselm8Aqjn31PvJL7jN5CLyc/6Fwtk3U=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoA8/6jTNZ2YOsx5m2Mbi4Y1/EqomiK3gYeyrjn
 77dNtYhvIiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaAPP+gAKCRBgAj/E00kg
 cpZ0D/0SDuDDnSurE2uIC3RWZ2ohVscZr/tu5DhFLrcKnCqtx3BHDN7R8IM+IDm2QijcF0FGlBl
 F1XqiAibFDpSZ8wAGIJRIsC4r73TjZi0vW/g6I0BEAkWnkZaPPViTemn+HjDRpec8NDGDggRhQN
 H9JtzUtXiIU3nuPu8Tizyy5/avei18IADT9uy6ZjUnHZRP8jM/3dKHvSU35vjYI9hlThB2qe5m+
 4q2aCisVEc1dcLkcsRMIydbH9Wm0I4ZcuZ1Nx/Xfjknds6d96/y3oK6LRUzlEJSuJt0TxlnvBn+
 gjjOTESQMuLPcIL4u5iuqmPCRxTkXMwe6+iMJIFvvefisCTLftLqFWGTqQ9k86+GO1PEJIqZ1+3
 Z53ZjZvScCMJ5Nqb674PRnOPSbnw4jx5NKYHwuxbtvkvcacju4bvGd0wvxB4G7bL78OoUSiIcKT
 pmWKfdw70A/WoOplcvZ+urlhcyw0ZFYkgpMjiw1IhK4F36aHqgvB3xBm5FTeDHFv10LpeqC0SGf
 LabxCPXI6H7knni6LCjr8iq4CwzsixN0dIfsbOvgnb2j5LYdoWbqN+gIX7G1xIBqJ+XhgC2p96V
 Sp0BfjKrjE6qYGfPmlHp7fXGrdA7YNQAkELn/28PG7ltnvetQNTSALsb5pMKu+1dcPpuUvCrORm
 yfmNXN0Jq1jyBKw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Casey Connolly <casey.connolly@linaro.org>

We never properly supported this panel and always used the wrong init
sequence. Drop support so we can move it to it's own proper driver.

Fixes: 5933baa36e26 ("drm/panel/samsung-sofef00: Add panel for OnePlus 6/T devices")
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 34 ++-------------------------
 1 file changed, 2 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 04ce925b3d9dbd91841f4b4e4a12320eac8e03af..49cfa84b34f0ca75394b74b5765a0931d9fefba0 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -22,7 +22,6 @@ struct sofef00_panel {
 	struct mipi_dsi_device *dsi;
 	struct regulator *supply;
 	struct gpio_desc *reset_gpio;
-	const struct drm_display_mode *mode;
 };
 
 static inline
@@ -159,26 +158,11 @@ static const struct drm_display_mode enchilada_panel_mode = {
 	.height_mm = 145,
 };
 
-static const struct drm_display_mode fajita_panel_mode = {
-	.clock = (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
-	.hdisplay = 1080,
-	.hsync_start = 1080 + 72,
-	.hsync_end = 1080 + 72 + 16,
-	.htotal = 1080 + 72 + 16 + 36,
-	.vdisplay = 2340,
-	.vsync_start = 2340 + 32,
-	.vsync_end = 2340 + 32 + 4,
-	.vtotal = 2340 + 32 + 4 + 18,
-	.width_mm = 68,
-	.height_mm = 145,
-};
-
 static int sofef00_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector)
 {
 	struct drm_display_mode *mode;
-	struct sofef00_panel *ctx = to_sofef00_panel(panel);
 
-	mode = drm_mode_duplicate(connector->dev, ctx->mode);
+	mode = drm_mode_duplicate(connector->dev, &enchilada_panel_mode);
 	if (!mode)
 		return -ENOMEM;
 
@@ -239,13 +223,6 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->mode = of_device_get_match_data(dev);
-
-	if (!ctx->mode) {
-		dev_err(dev, "Missing device mode\n");
-		return -ENODEV;
-	}
-
 	ctx->supply = devm_regulator_get(dev, "vddio");
 	if (IS_ERR(ctx->supply))
 		return dev_err_probe(dev, PTR_ERR(ctx->supply),
@@ -295,14 +272,7 @@ static void sofef00_panel_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id sofef00_panel_of_match[] = {
-	{ // OnePlus 6 / enchilada
-		.compatible = "samsung,sofef00",
-		.data = &enchilada_panel_mode,
-	},
-	{ // OnePlus 6T / fajita
-		.compatible = "samsung,s6e3fc2x01",
-		.data = &fajita_panel_mode,
-	},
+	{ .compatible = "samsung,sofef00" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sofef00_panel_of_match);

---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250419-drop-s6e3fc2x01-support-d060a14a4791

Best regards,
-- 
David Heidelberg <david@ixit.cz>


