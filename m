Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98598B16F40
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 12:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBA510E264;
	Thu, 31 Jul 2025 10:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SNO7QjYj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CE410E264
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 10:13:55 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-76bd041c431so294141b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 03:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753956834; x=1754561634;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vbmP0QkKxqA/DbyjgD1AWdfq/ymSytlBSv09DpEvJnQ=;
 b=SNO7QjYji/8+24W8pKntVN5kB68W2Ce1/6qlGXvrBReeZMTgayG+aF8OSMCmSPPqGV
 EGKMQkCCfQcXLceZOtYPSP4RpNfY28xPWhhO57616sQRqvsscLJWY+YFQebnZT+kEE4Y
 NVtlNckFfeS7PTjnpbTlyD0QuZgOUye2TpVRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753956834; x=1754561634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vbmP0QkKxqA/DbyjgD1AWdfq/ymSytlBSv09DpEvJnQ=;
 b=EpBmanViIUvifZJm2uMvHXrKed0mzuadKnTch4VqgBSIwF0K3VaLgcSaJpCcBYP2i3
 HJJ3iX4O8Uqw+8LiLoa1iyeqp2fQHjrbS6IgN1FBfj+3OzD5yeFbN5xDO/x4kbyub8q0
 5qXsPyYQa7y1TmH+y7VdnaP8kaKYpuF2EUEdGJl532NZLF+X6bBr9fGz1C1x9ZANaDY8
 R/Fha0elwPQcCnK57yurWMXJFcKDjDidP98hqr1XJAnujZrmyDOGq4zkkEqyV4Ne9i2G
 PvMV5e5vs7+WCA7BDEMrGC2lGX544rVc50sVjZdu8kN+bX6s8lalx7h6/sj0CxxsccJI
 Kp3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdP9aDQwlULnoVxlEHRqvE1sAliLzM3Yjv/zE2n7gZrUzfoCJbzVxUk2AfaXOtf3nLyEyJJjmtyrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt/BY4+f8kykKG3vXDlGLQHbzlJKyx3XEdwTmJAjneqvgiucCD
 baVy0uMQcWdBeX1G5re49QKgNs09k2Q/ZxBdByCUoiTvUGcbGifVQXK5FescvskDxw==
X-Gm-Gg: ASbGnct/zJC+yYWznqQaCtjIsj1bSNEd9lbDhYmiMzWAEIZcU0k27FHOgBlkto09Lf6
 RmYDPEcaL0s6rp8WZFctgxRBDXey53MpCsHlHzptzuepQ5CAStPqyI7BBT3+KwlIircP/iFuQwG
 52RXpH3k5OeqH26YOM20/pXuZWAKDrlhC5bJY2NhWQiks5563TYQMNdm5XGIWQAu4oSxdWRXoEh
 jimN0WvsLZeJ8dzRrnM2AY1Qfq3zS66dvmb/MzyDQrwskSlffq+XItIwYuq/z9DxmnpFjv5hz81
 PkWSlvOIuRqC+xZ926GnVr/dQnuMTogNT84b81B+D/IcVSa3R77jPgAc73rdblczL/PzBCtOXj3
 d7PdjL4V77yjcMTIEQyyC4y35zubbQ99YkXsBM74BG1k=
X-Google-Smtp-Source: AGHT+IHss+OJHmD0FAT3nC9RmC2MQCveb1+xJQvOEYyG7cW9OhPxDF0JmjTzbXM6LOHd95qxmTPNHw==
X-Received: by 2002:a05:6a20:3ca8:b0:234:80f6:2b3a with SMTP id
 adf61e73a8af0-23dc0cf78ecmr10951554637.4.1753956834512; 
 Thu, 31 Jul 2025 03:13:54 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:8177:f5a7:88a1:4ed9])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f5f5sm1229265b3a.10.2025.07.31.03.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 03:13:54 -0700 (PDT)
From: Pin-Yen Lin <treapking@chromium.org>
X-Google-Original-From: Pin-Yen Lin <treapking@google.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wenst@chromium.org>, Pin-Yen Lin <treapking@google.com>
Subject: [PATCH 2/2] HID: Make elan touch controllers power on after panel is
 enabled
Date: Thu, 31 Jul 2025 18:13:15 +0800
Message-ID: <20250731101344.2761757-2-treapking@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
In-Reply-To: <20250731101344.2761757-1-treapking@google.com>
References: <20250731101344.2761757-1-treapking@google.com>
MIME-Version: 1.0
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

Introduce a new HID quirk to indicate that this device has to be enabled
after the panel's backlight is enabled, and update the driver data for
the elan devices to enable this quirk. This cannot be a I2C HID quirk
because the kernel needs to acknowledge this before powering up the
device and read the VID/PID.

Signed-off-by: Pin-Yen Lin <treapking@google.com>

---

 drivers/hid/i2c-hid/i2c-hid-core.c    |  2 ++
 drivers/hid/i2c-hid/i2c-hid-of-elan.c | 11 ++++++++++-
 include/linux/hid.h                   |  2 ++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index d3912e3f2f13a..8dc4d5d56d399 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1183,6 +1183,8 @@ static int i2c_hid_core_register_panel_follower(struct i2c_hid *ihid)
 	int ret;
 
 	ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_funcs;
+	if (ihid->hid->initial_quirks | HID_QUIRK_POWER_ON_AFTER_BACKLIGHT)
+		ihid->panel_follower.after_panel_enabled = true;
 
 	/*
 	 * If we're not in control of our own power up/power down then we can't
diff --git a/drivers/hid/i2c-hid/i2c-hid-of-elan.c b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
index 3fcff6daa0d3a..0215f217f6d86 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/hid.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -23,6 +24,7 @@ struct elan_i2c_hid_chip_data {
 	unsigned int post_power_delay_ms;
 	u16 hid_descriptor_address;
 	const char *main_supply_name;
+	bool power_after_backlight;
 };
 
 struct i2c_hid_of_elan {
@@ -97,6 +99,7 @@ static int i2c_hid_of_elan_probe(struct i2c_client *client)
 {
 	struct i2c_hid_of_elan *ihid_elan;
 	int ret;
+	u32 quirks = 0;
 
 	ihid_elan = devm_kzalloc(&client->dev, sizeof(*ihid_elan), GFP_KERNEL);
 	if (!ihid_elan)
@@ -131,8 +134,12 @@ static int i2c_hid_of_elan_probe(struct i2c_client *client)
 		}
 	}
 
+	if (ihid_elan->chip_data->power_after_backlight)
+		quirks = HID_QUIRK_POWER_ON_AFTER_BACKLIGHT;
+
 	ret = i2c_hid_core_probe(client, &ihid_elan->ops,
-				 ihid_elan->chip_data->hid_descriptor_address, 0);
+				 ihid_elan->chip_data->hid_descriptor_address,
+				 quirks);
 	if (ret)
 		goto err_deassert_reset;
 
@@ -150,6 +157,7 @@ static const struct elan_i2c_hid_chip_data elan_ekth6915_chip_data = {
 	.post_gpio_reset_on_delay_ms = 300,
 	.hid_descriptor_address = 0x0001,
 	.main_supply_name = "vcc33",
+	.power_after_backlight = true,
 };
 
 static const struct elan_i2c_hid_chip_data elan_ekth6a12nay_chip_data = {
@@ -157,6 +165,7 @@ static const struct elan_i2c_hid_chip_data elan_ekth6a12nay_chip_data = {
 	.post_gpio_reset_on_delay_ms = 300,
 	.hid_descriptor_address = 0x0001,
 	.main_supply_name = "vcc33",
+	.power_after_backlight = true,
 };
 
 static const struct elan_i2c_hid_chip_data ilitek_ili9882t_chip_data = {
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 2cc4f1e4ea963..c32425b5d0119 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -364,6 +364,7 @@ struct hid_item {
  * | @HID_QUIRK_HAVE_SPECIAL_DRIVER:
  * | @HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE:
  * | @HID_QUIRK_IGNORE_SPECIAL_DRIVER
+ * | @HID_QUIRK_POWER_ON_AFTER_BACKLIGHT
  * | @HID_QUIRK_FULLSPEED_INTERVAL:
  * | @HID_QUIRK_NO_INIT_REPORTS:
  * | @HID_QUIRK_NO_IGNORE:
@@ -391,6 +392,7 @@ struct hid_item {
 #define HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE	BIT(20)
 #define HID_QUIRK_NOINVERT			BIT(21)
 #define HID_QUIRK_IGNORE_SPECIAL_DRIVER		BIT(22)
+#define HID_QUIRK_POWER_ON_AFTER_BACKLIGHT	BIT(23)
 #define HID_QUIRK_FULLSPEED_INTERVAL		BIT(28)
 #define HID_QUIRK_NO_INIT_REPORTS		BIT(29)
 #define HID_QUIRK_NO_IGNORE			BIT(30)
-- 
2.50.1.552.g942d659e1b-goog

