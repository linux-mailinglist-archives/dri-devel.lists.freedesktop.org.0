Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA969E3817
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 11:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E9910E31B;
	Wed,  4 Dec 2024 10:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uhAyHj4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B908E10E31B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 10:58:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id
 ffacd0b85a97d-385e3621518so3514988f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 02:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733309915; x=1733914715;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BZIc5cVzg+MyBN31jwpSUPX2HKfKP1QIo88+hPX8KsY=;
 b=uhAyHj4L4IxW2Gc//4VR47tWHBi3J3tvpbEsf+NDTNxvjCauCc75uaClDvVgQwHzAb
 IkkPJetvlkq9QNOyDrySPQavisqoXp7EIczneHPr2SEQdrjS9DLb2xTtU6M6z8TqEiix
 HD3N3vww+qSIfVmi+8msHGviR2FepQBf26znBbkfV/9nsS1kuQmiAY9q553O3QAmwRNs
 +358Fuek+NkO7tHj7lQKtqxN6I8+H+UN1BMp1VnVOFq3oHhGv0OcyIqneRa0Aqt6EdGg
 VMysR2+CWdez/5IK68oOFHTu667hsWGfyQuSskoTqjq3XPbDezSjQHhce8OAJEmDzkfS
 hREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733309915; x=1733914715;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BZIc5cVzg+MyBN31jwpSUPX2HKfKP1QIo88+hPX8KsY=;
 b=aNHA3KFDa/gKerrNMoBQwY1B+HkoZ0pfAd4ewEmINnCS59dHFxLxQSi1KxUX33X6eD
 k7WNSHCZxfpFNI/fEBXpLxxINluYQF6D8iI52L6SoSCeLYgS/ZIA+DWY6pUHUcdQKMce
 mw45g3WmuYHU28u5htnykO8+tTV6PHW9cmvIDth9C9KATPSPilHJ+DTBnz14WfkKuKbH
 cmowUCRo9EZxDVzopaJisJOWMpyJ0OEF+1tYdSDTBVB8b7QLO5/aFNY3mlkI5EBiMuie
 FdYV5yStjm+TMuxuGFP/a1tPzdnc71mUmbJO0iaMpIoAxMoNPepSmCwQhwqGQzbxbSPJ
 wXNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/plwt1iSeGBZUVcb6+A8mVGnNB/iUO7twxHe3SZGLAHPCoeSf3YXMOWzeKEE7tYSZ/jhe0ni6pvo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT6jOBNzXBPxRHUpn/GzgIe33LpWF74nGUPzpKni6Uj8hYPYll
 a6IZd0fv5tklgnU4LHywm/V9zT3xztccwPfeFCg2xb2fs4Z9WG5EahN1AKA+fWU=
X-Gm-Gg: ASbGncuaeevycmFnyGncMtR9iu14lFZFDMlEBPTBLCD6YV1WYpW/FSkUDJy+dEKdpEp
 JSw8u8HTey/0tmW8oUQ49dORWBLEM/HF2EXb8pgcG+BKkNTtpWLXoHIW4L1rMW/Z9LsPVK8jpaB
 MaSm9raDSbEzvIcZn4QvB3vCQ7lVHR1aDc0gXExpEC4RjulB6wyNmatD0OftSS8SAFxy3uMa8NI
 a4eD63D4LZED2AKHmO24f55wT4YAhAuZ+UuItpmN2AvjHvf1IFzAt+Tu2TUqLgCX4v0uwIC0G+w
 bJTc
X-Google-Smtp-Source: AGHT+IHLBPCT7PSq9XLIlCQToRzCmgpXpYF5fvYgxDnKYVSvR7cmryPFqEgpff13K/YgKOZWK6U1Hw==
X-Received: by 2002:a05:6000:18a9:b0:385:f0d4:d5ed with SMTP id
 ffacd0b85a97d-385fd403392mr5434662f8f.22.1733309914960; 
 Wed, 04 Dec 2024 02:58:34 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ee4d932asm9684059f8f.26.2024.12.04.02.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 02:58:34 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Douglas Anderson <dianders@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Liu Ying <victor.liu@nxp.com>, Adrien Grassein <adrien.grassein@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Russell King <linux@armlinux.org.uk>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Jani Nikula <jani.nikula@intel.com>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Date: Wed,  4 Dec 2024 11:58:27 +0100
Message-ID: <20241204105827.1682632-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=13868;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=VYhdleKe/F+kOI7dHFUZuSbrGAnRZh+ZwLiOmkRzuls=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnUDXURgr46YKb6bW/P1O17E0cHiyUZOd+ujETP
 OiETsijDZOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ1A11AAKCRCPgPtYfRL+
 TnanCACts8SzSlCgUb8hndSiO2dzmKUcyAH0sz3NMkwMlbNZCh6AFrxFY3mDA4+6dqHiJf8MJTs
 6S6QDhmPyzNdcPDrvC14mA3VCLGJzkxkejR+dZMHhsWvKGkJznmGhqCmX4DjAVbxRNLpOExh6Da
 LosBXgrVQ2r3YIJxEVjXFjptQzbLuZQawUUVeDzuobtQzwSdT/+Eoo8ypX4CHJfv6mWGuDVsei9
 UldlN44vKACCCn2m+SFDtVnsWBQ/KmbQfwRvXnddB7Ib41BhXNv81e9y2NTZuMpy7UE/Fm8Xj4S
 Es1GDJxHe59EXPjfKzQzgO4KdFf/grA0P2NDo4b/FpU2oSfT
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Liu Ying <victor.liu@nxp.com> # ite-it6263.c
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

On Mon, Dec 02, 2024 at 04:50:01PM -0800, Doug Anderson wrote in reply
to v2:
> This conflicts with commit dbf7986f8a56 ("drm/bridge: Constify struct
> i2c_device_id"). Can you rebase, please?
> 
> Other than that:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

It took me a moment to find a tree + branch that contained the
above mentioned commit. It would be a real time saver if drm-misc-next
was included in next. At least saying "drm-misc-next" in such a context
would be helpful, bonus points for mentioning

	https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next

.

The changes in this patch compared to v2,
https://lore.kernel.org/dri-devel/20241202114731.1005549-2-u.kleine-koenig@baylibre.com/:

 - Rebased to drm-misc-next, resolving conflicts in
   drivers/gpu/drm/bridge/lontium-lt9611.c
   drivers/gpu/drm/bridge/lontium-lt9611uxc.c
   drivers/gpu/drm/bridge/ti-sn65dsi86.c

 - Applied the R-b tag received for v2.

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
index 8f25b338a8d8..80c98c586e56 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1236,7 +1236,7 @@ static void lt9611_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lt9611_id[] = {
-	{ "lontium,lt9611", 0 },
+	{ "lontium,lt9611" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, lt9611_id);
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index f89af8203c9d..db9a5466060b 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -914,7 +914,7 @@ static void lt9611uxc_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lt9611uxc_id[] = {
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
index ce4c026b064f..e4d9006b59f1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1971,8 +1971,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ti_sn65dsi86_id[] = {
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

base-commit: f3c03be182efccce3f6c2d8ceb35ba43e77ac128
-- 
2.45.2

