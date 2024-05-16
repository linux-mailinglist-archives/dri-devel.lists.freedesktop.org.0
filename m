Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE4E8C76A3
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 14:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C5010E07A;
	Thu, 16 May 2024 12:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B22610E07A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 12:38:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1s7aNi-0003RR-Nc; Thu, 16 May 2024 14:38:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1s7aNh-001iQm-Ki; Thu, 16 May 2024 14:38:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1s7aNh-005vJj-1n;
 Thu, 16 May 2024 14:38:45 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	kernel@pengutronix.de
Subject: [PATCH] drm: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Date: Thu, 16 May 2024 14:38:38 +0200
Message-ID: <20240516123837.81664-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=12137;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=/f+pLQhmL4znulmnxYPwmF+NeJjhOc64mWyg3iYbcU8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmRf5Oq0y3Uo7pwtkD2ngn1LVHUkX2RSVpxGYwz
 fgPtjXzqh2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZkX+TgAKCRCPgPtYfRL+
 TjJrB/9r+6N7j7/A69NNZtqY5M7JjspUy4xk5z6hrerbY9Fp4PF9zvf6crsKZDWvcV/Xl1W4Xbl
 oRny7z4yNGCZreZmpBZaSjHbR6LWRJf7toQR0imQqrpx+6V3vR2KeBM+1vWIGlAOlkJl19nMYYd
 1qnqLCCXAnfISJzA7QhA9+JXi9D3K+rScPSbRrXhM4f6Yoly6iCR271imlmzFacrwgsRXN7oopE
 qCEq7DN9l/GS1xpeA32J78MdY9XRldvMH+nIvTVj7OpTz+eFtkZZcCV5mkADZFRhQ7K9QOqx48f
 yREBaJpNkgKX4bwI5HFrPWUIyDIdY2mEkyUF5CRhg/DOFaMS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

While add it, also remove commas after the sentinel entries.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       | 2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c                | 2 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c                 | 2 +-
 drivers/gpu/drm/bridge/ite-it6505.c                      | 2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c                 | 4 ++--
 drivers/gpu/drm/bridge/lontium-lt9611.c                  | 2 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c               | 2 +-
 drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 8 ++++----
 drivers/gpu/drm/bridge/nxp-ptn3460.c                     | 4 ++--
 drivers/gpu/drm/bridge/sii902x.c                         | 4 ++--
 drivers/gpu/drm/bridge/sii9234.c                         | 4 ++--
 drivers/gpu/drm/bridge/sil-sii8620.c                     | 4 ++--
 drivers/gpu/drm/bridge/tc358767.c                        | 2 +-
 drivers/gpu/drm/bridge/tc358768.c                        | 4 ++--
 drivers/gpu/drm/bridge/ti-dlpc3433.c                     | 2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c                    | 4 ++--
 drivers/gpu/drm/bridge/ti-tfp410.c                       | 2 +-
 drivers/gpu/drm/i2c/ch7006_drv.c                         | 2 +-
 drivers/gpu/drm/i2c/sil164_drv.c                         | 2 +-
 drivers/gpu/drm/i2c/tda9950.c                            | 4 ++--
 drivers/gpu/drm/i2c/tda998x_drv.c                        | 2 +-
 21 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index c9e35731e6a1..44e913715b32 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -799,7 +799,7 @@ static void anx6345_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id anx6345_id[] = {
-	{ "anx6345", 0 },
+	{ "anx6345" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, anx6345_id);
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 59e9ad349969..c42bdf879089 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2805,7 +2805,7 @@ static void anx7625_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id anx7625_id[] = {
-	{"anx7625", 0},
+	{ "anx7625" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index c83486cf6b15..da17f0978a79 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -597,7 +597,7 @@ static const struct of_device_id ch7033_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, ch7033_dt_ids);
 
 static const struct i2c_device_id ch7033_ids[] = {
-	{ "ch7033", 0 },
+	{ "ch7033" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ch7033_ids);
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 3f68c82888c2..7c9dede2e31e 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3468,7 +3468,7 @@ static void it6505_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id it6505_id[] = {
-	{ "it6505", 0 },
+	{ "it6505" },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 1a9defa15663..690e5dd14b3a 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -814,8 +814,8 @@ static const struct of_device_id lt8912_dt_match[] = {
 MODULE_DEVICE_TABLE(of, lt8912_dt_match);
 
 static const struct i2c_device_id lt8912_id[] = {
-	{"lt8912", 0},
-	{},
+	{ "lt8912" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, lt8912_id);
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index b99fe87ec738..7a3074ad10ac 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1173,7 +1173,7 @@ static void lt9611_remove(struct i2c_client *client)
 }
 
 static struct i2c_device_id lt9611_id[] = {
-	{ "lontium,lt9611", 0 },
+	{ "lontium,lt9611" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, lt9611_id);
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index ab702471f3ab..a48b214d3291 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -998,7 +998,7 @@ static void lt9611uxc_remove(struct i2c_client *client)
 }
 
 static struct i2c_device_id lt9611uxc_id[] = {
-	{ "lontium,lt9611uxc", 0 },
+	{ "lontium,lt9611uxc" },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 4480523244e4..23d5420609bc 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -323,8 +323,8 @@ static void stdp4028_ge_b850v3_fw_remove(struct i2c_client *stdp4028_i2c)
 }
 
 static const struct i2c_device_id stdp4028_ge_b850v3_fw_i2c_table[] = {
-	{"stdp4028_ge_fw", 0},
-	{},
+	{ "stdp4028_ge_fw" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, stdp4028_ge_b850v3_fw_i2c_table);
 
@@ -370,8 +370,8 @@ static void stdp2690_ge_b850v3_fw_remove(struct i2c_client *stdp2690_i2c)
 }
 
 static const struct i2c_device_id stdp2690_ge_b850v3_fw_i2c_table[] = {
-	{"stdp2690_ge_fw", 0},
-	{},
+	{ "stdp2690_ge_fw" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, stdp2690_ge_b850v3_fw_i2c_table);
 
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index ed93fd4c3265..a295b2ac0f4f 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -324,8 +324,8 @@ static void ptn3460_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ptn3460_i2c_table[] = {
-	{"ptn3460", 0},
-	{},
+	{ "ptn3460" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, ptn3460_i2c_table);
 
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 2fbeda9025bf..55d1d96b772d 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -1197,8 +1197,8 @@ static const struct of_device_id sii902x_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, sii902x_dt_ids);
 
 static const struct i2c_device_id sii902x_i2c_ids[] = {
-	{ "sii9022", 0 },
-	{ },
+	{ "sii9022" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sii902x_i2c_ids);
 
diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index d8373d918324..d5f16439d02d 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -945,8 +945,8 @@ static const struct of_device_id sii9234_dt_match[] = {
 MODULE_DEVICE_TABLE(of, sii9234_dt_match);
 
 static const struct i2c_device_id sii9234_id[] = {
-	{ "SII9234", 0 },
-	{ },
+	{ "SII9234" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sii9234_id);
 
diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 599164e3877d..27daa5b0a59f 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2368,8 +2368,8 @@ static const struct of_device_id sii8620_dt_match[] = {
 MODULE_DEVICE_TABLE(of, sii8620_dt_match);
 
 static const struct i2c_device_id sii8620_id[] = {
-	{ "sii8620", 0 },
-	{ },
+	{ "sii8620" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, sii8620_id);
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 166f9a3e9622..c20b6c7edbd3 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2469,7 +2469,7 @@ static void tc_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tc358767_i2c_ids[] = {
-	{ "tc358767", 0 },
+	{ "tc358767" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tc358767_i2c_ids);
diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 0e8813278a2f..6d6dd9470599 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -1225,8 +1225,8 @@ static const struct regmap_config tc358768_regmap_config = {
 };
 
 static const struct i2c_device_id tc358768_i2c_ids[] = {
-	{ "tc358768", 0 },
-	{ "tc358778", 0 },
+	{ "tc358768" },
+	{ "tc358778" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tc358768_i2c_ids);
diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
index 6b559e071301..a597cbf8b2d6 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -389,7 +389,7 @@ static void dlpc3433_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id dlpc3433_id[] = {
-	{ "ti,dlpc3433", 0 },
+	{ "ti,dlpc3433" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, dlpc3433_id);
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 84698a0b27a8..97d7a5dace2c 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1971,8 +1971,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 }
 
 static struct i2c_device_id ti_sn65dsi86_id[] = {
-	{ "ti,sn65dsi86", 0},
-	{},
+	{ "ti,sn65dsi86" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, ti_sn65dsi86_id);
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index c7bef5c23927..819864a4a5cf 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -440,7 +440,7 @@ static void tfp410_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tfp410_i2c_ids[] = {
-	{ "tfp410", 0 },
+	{ "tfp410" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tfp410_i2c_ids);
diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index 131512a5f3bd..fcb0fcd6c897 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -486,7 +486,7 @@ static int ch7006_encoder_init(struct i2c_client *client,
 }
 
 static const struct i2c_device_id ch7006_ids[] = {
-	{ "ch7006", 0 },
+	{ "ch7006" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ch7006_ids);
diff --git a/drivers/gpu/drm/i2c/sil164_drv.c b/drivers/gpu/drm/i2c/sil164_drv.c
index ff23422727fc..c17afa025d9d 100644
--- a/drivers/gpu/drm/i2c/sil164_drv.c
+++ b/drivers/gpu/drm/i2c/sil164_drv.c
@@ -413,7 +413,7 @@ sil164_encoder_init(struct i2c_client *client,
 }
 
 static const struct i2c_device_id sil164_ids[] = {
-	{ "sil164", 0 },
+	{ "sil164" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sil164_ids);
diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
index 82d618c40dce..cbff851e0c85 100644
--- a/drivers/gpu/drm/i2c/tda9950.c
+++ b/drivers/gpu/drm/i2c/tda9950.c
@@ -486,8 +486,8 @@ static void tda9950_remove(struct i2c_client *client)
 }
 
 static struct i2c_device_id tda9950_ids[] = {
-	{ "tda9950", 0 },
-	{ },
+	{ "tda9950" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tda9950_ids);
 
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index d8d7de18dd65..199f49fe2939 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -2093,7 +2093,7 @@ MODULE_DEVICE_TABLE(of, tda998x_dt_ids);
 #endif
 
 static const struct i2c_device_id tda998x_ids[] = {
-	{ "tda998x", 0 },
+	{ "tda998x" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tda998x_ids);

base-commit: dbd9e2e056d8577375ae4b31ada94f8aa3769e8a
-- 
2.43.0

