Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BEE9E00E3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 12:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1FF10E02B;
	Mon,  2 Dec 2024 11:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="noSqR5IQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C5C10E02B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 11:47:41 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-434aabd688fso25687315e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 03:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733140060; x=1733744860;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fjgXoFQQWKCDNObA+oYpxiI89IdnA85QlW64MwvXD98=;
 b=noSqR5IQb4SkdcRU6AvtTB6KLSfiKsNNo1HmohlIMVWn4czzqRPG8/spnmfwwmjCsu
 ljvfPFMy15uXwL0qLCMKl5nnYicG25qTcchJ57LmHkAfJcVoK9uGLdrzloprRQrt6QL0
 FQYo5nqzRLYRz5M+2wvboeSBt85VGRhf1igaLNPAeYa30HOmkvKGgo4WQ/i5lVPCEnKc
 KRJQzi8nOSmsJoKgSamzukshB0lGMJq8rhbAisDuZXiJCK71zg9oX92cV5jEqV9V6U/0
 RHp/Bn4/+VmdOErcefJ70agt2abhxoyR0OZC3E/eLog9DOBji7RcKz5H7RR1bwV1LspZ
 3d+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733140060; x=1733744860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fjgXoFQQWKCDNObA+oYpxiI89IdnA85QlW64MwvXD98=;
 b=oVbkLmgyjpJa3yMTmkETrMaMonvDNv/jDbeX5iYgV6iWVlKNKP0hstVIGYcYnjlnC+
 av0OwYc25droWiz8Cc3jRl6rXZ7iNPOXcVbKt0JrmBgWDCkic8FTY3ctwULx73EZbCom
 klYLwOjcjpVef7b18vamn3zPyU9jL4zi7o/aOycQWcUxGwfPT/e78uWk+tjYi3n7buHB
 wJ7qHBV+KiDzs9OSzG8uTnyYcHQUt5buByWW1tkcUCEq3etrocoSLSgqObu63eGCU5Ev
 FySlz4HEBAEiedkrSTrThAPhco++4vyEyRT9M9xTSqVNYIPxSMDQOhc/+A5IVl3+vWOD
 44Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJxa9F/0YvYJEui4a2V8bXut+WywBfTayMmjRz673lyA7qbYFNdMPAZZmrQw4xnGkWwztAlgQlDuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmNLP7+zjDs8GMvEjnBzngRBIhKRhIKA/GL29Rd4hkPP7cgznk
 j72sRMxzdZHxQmkHaTg1KPrQDObUlyVyMxz02tYdWH05JPa2l0Cm8XJb5ZYYea8=
X-Gm-Gg: ASbGncvdjvG0zDYsklJYTSO+2zL6Xh+O8Lbhdtdow1oGfDNKEkm4VIZmwPdWHcbFqSP
 nblEBAZfpU/350WHVy1I0QzSQzbg4IizC6BW2tixzlmGDgJ7g3uBdrbjx928Gw8PCKx3g+/N2p1
 61/xfZiJG4Siua1YjvHkzjbMSKEC3gGnMeVSROuSbjCYJwW1HpYtoXp10pVtr7YiWt4fZtkw4fv
 5nC/8AXcWBnmqf7+NEhHyOJbazxqvByRxMMh+E1eXlevfnkHa1SCysDb2cNmYVdNmV4N0kDV/Zd
 QRED
X-Google-Smtp-Source: AGHT+IGMHrbpPG59C1uiL7CyEB0/Eq4tvHsxk5S5CztU97AROPrjylV01egDO7BAlS9fdMDbGBc8NA==
X-Received: by 2002:a05:600c:450a:b0:431:5f1c:8352 with SMTP id
 5b1f17b1804b1-434a9dbb930mr204577805e9.5.1733140060007; 
 Mon, 02 Dec 2024 03:47:40 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0f70d91sm147917005e9.39.2024.12.02.03.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 03:47:39 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Liu Ying <victor.liu@nxp.com>, Adrien Grassein <adrien.grassein@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Douglas Anderson <dianders@chromium.org>,
 Russell King <linux@armlinux.org.uk>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Jani Nikula <jani.nikula@intel.com>,
 Pin-yen Lin <treapking@chromium.org>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>,
 =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Date: Mon,  2 Dec 2024 12:47:31 +0100
Message-ID: <20241202114731.1005549-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=13030;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=G3wg1FF/2dos+PZs2qSZH64KqDsZtgK/NGu1IVYg/P8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnTZ5TiDFURRWrJfsYo7o7/SeeKWjCPFSLu6sfi
 49JZb/3KS6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ02eUwAKCRCPgPtYfRL+
 TueZB/9TOUktVc3GDEYQ1Rw1ND5CpcM6jLatZNzoxKsZVeCNIDwRJB9PHhdEWoDwHilURzmFeMt
 noRodMSFEZbn8JiKFUZy4tNXCCuPitQQph2UQ3UV9UNRqkTk/RMoZr5oE1ZbQbB43LWlmt59cr2
 lvVNSz/NFHl7NvEeoRp5VWAN5z1R+1yVAQ81QisZwLr7HQqTXo1YGW3xFtZ8R0cp3GMm6hcWpbX
 Kn1q3P9XdmL073KJMdDPR9WMBp7jlcFu8yIlA6ZWM0E5mWXPqb+kb8WdNmS1+zDnqbWJ76ZHSgv
 sCnvb9xUX0LiPT1aGnD0BROL/TNBvjtFA/3JE/lLHgiPgsuJ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
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

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

changes since (implicit) v1
(https://lore.kernel.org/dri-devel/20240516123837.81664-2-u.kleine-koenig@pengutronix.de):

 - Update author email address
 - Rebase (trivially) to latest next
 - Also convert drivers/gpu/drm/bridge/ite-it6263.c (which is new since
   the series was orginally sent in May)

Best regards
Uwe

 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       | 2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c                | 2 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c                 | 2 +-
 drivers/gpu/drm/bridge/ite-it6263.c                      | 2 +-
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
 22 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index b754947e3e00..83d711ee3a2e 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -793,7 +793,7 @@ static void anx6345_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id anx6345_id[] = {
-	{ "anx6345", 0 },
+	{ "anx6345" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, anx6345_id);
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a2675b121fe4..3427322f986a 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2795,7 +2795,7 @@ static void anx7625_i2c_remove(struct i2c_client *client)
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
diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cbabd4e20d3e..1e4b20abc335 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -878,7 +878,7 @@ static const struct of_device_id it6263_of_match[] = {
 MODULE_DEVICE_TABLE(of, it6263_of_match);
 
 static const struct i2c_device_id it6263_i2c_ids[] = {
-	{ "it6263", 0 },
+	{ "it6263" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, it6263_i2c_ids);
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 008d86cc562a..0faad10ba8e4 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3497,7 +3497,7 @@ static void it6505_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id it6505_id[] = {
-	{ "it6505", 0 },
+	{ "it6505" },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index e265ab3c8c92..52da204f5740 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -815,8 +815,8 @@ static const struct of_device_id lt8912_dt_match[] = {
 MODULE_DEVICE_TABLE(of, lt8912_dt_match);
 
 static const struct i2c_device_id lt8912_id[] = {
-	{"lt8912", 0},
-	{},
+	{ "lt8912" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, lt8912_id);
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 1b31fdebe164..b3f5e69fb39b 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1236,7 +1236,7 @@ static void lt9611_remove(struct i2c_client *client)
 }
 
 static struct i2c_device_id lt9611_id[] = {
-	{ "lontium,lt9611", 0 },
+	{ "lontium,lt9611" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, lt9611_id);
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 4d1d40e1f1b4..57f66e4f7843 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -914,7 +914,7 @@ static void lt9611uxc_remove(struct i2c_client *client)
 }
 
 static struct i2c_device_id lt9611uxc_id[] = {
-	{ "lontium,lt9611uxc", 0 },
+	{ "lontium,lt9611uxc" },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 37f1acf5c0f8..a3dcee62e7a5 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -318,8 +318,8 @@ static void stdp4028_ge_b850v3_fw_remove(struct i2c_client *stdp4028_i2c)
 }
 
 static const struct i2c_device_id stdp4028_ge_b850v3_fw_i2c_table[] = {
-	{"stdp4028_ge_fw", 0},
-	{},
+	{ "stdp4028_ge_fw" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, stdp4028_ge_b850v3_fw_i2c_table);
 
@@ -365,8 +365,8 @@ static void stdp2690_ge_b850v3_fw_remove(struct i2c_client *stdp2690_i2c)
 }
 
 static const struct i2c_device_id stdp2690_ge_b850v3_fw_i2c_table[] = {
-	{"stdp2690_ge_fw", 0},
-	{},
+	{ "stdp2690_ge_fw" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, stdp2690_ge_b850v3_fw_i2c_table);
 
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index e77aab965fcf..44e36ae66db4 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -319,8 +319,8 @@ static void ptn3460_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ptn3460_i2c_table[] = {
-	{"ptn3460", 0},
-	{},
+	{ "ptn3460" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, ptn3460_i2c_table);
 
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 9be9cc5b9025..127da22011b3 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -1239,8 +1239,8 @@ static const struct of_device_id sii902x_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, sii902x_dt_ids);
 
 static const struct i2c_device_id sii902x_i2c_ids[] = {
-	{ "sii9022", 0 },
-	{ },
+	{ "sii9022" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sii902x_i2c_ids);
 
diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index 0c74cdc07032..cd7837c9a6e0 100644
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
index 26b8d137bce0..28a2e1ee04b2 100644
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
index 7275e66faefc..4637bf6ea7a3 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2587,7 +2587,7 @@ static void tc_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tc358767_i2c_ids[] = {
-	{ "tc358767", 0 },
+	{ "tc358767" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tc358767_i2c_ids);
diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 2cb748bbefcd..ec79b0dd0e2c 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -1244,8 +1244,8 @@ static const struct regmap_config tc358768_regmap_config = {
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
index a0a1b5dd794e..eaec70fa42b6 100644
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
index 9e31f750fd88..3f31102bef5f 100644
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
index b1b1e4d5a24a..7b8492d91df8 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -435,7 +435,7 @@ static void tfp410_i2c_remove(struct i2c_client *client)
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
index 2160f05bbd16..57ce77c2be24 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -2094,7 +2094,7 @@ MODULE_DEVICE_TABLE(of, tda998x_dt_ids);
 #endif
 
 static const struct i2c_device_id tda998x_ids[] = {
-	{ "tda998x", 0 },
+	{ "tda998x" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tda998x_ids);

base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
-- 
2.45.2

