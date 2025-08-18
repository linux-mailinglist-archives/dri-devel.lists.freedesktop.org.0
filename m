Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A637DB2A0BE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 13:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB0E10E437;
	Mon, 18 Aug 2025 11:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mYcAS7aH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFA610E431
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 11:50:25 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-76e2e8aff06so3122937b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 04:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755517825; x=1756122625;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zb1sCPo77mcuKw2zTHcH238POIGc59QSz6qQTiNa2Mw=;
 b=mYcAS7aH6yCFh4yDYGjc3PWXFHOGIx/XQQAphLt1uRXsOlKuEu7RK2mrGcgGttjpZH
 dGi2CjOL63qxbaItBX+Pehr0hC1rym/DrRhW63dqDZpKWUPB/id1sKancz+WVnNGn+RO
 u4FXd9Mv+i7tqoKtvERwdiX85dVcspTZ8kkww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755517825; x=1756122625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zb1sCPo77mcuKw2zTHcH238POIGc59QSz6qQTiNa2Mw=;
 b=vfNCLaIGBccK5UjsrJ6SX4VORnnxa7EfcKYFFPdFg/PPbRxfy+/xQg+MspRNXNkQCw
 GgdTJ/uICh+mnuinjuvrsuzrY44qjRSDpHV9vNRN+a0UK2GHHt6h+u5T+W4DtOdH3UlR
 4OYoYkQZhlWlDwxfxDzmo6eAdfXIu6TWXS9IiBB+k2zvUJKqcrGfNjakBbtDPmQHc7U4
 RGN+abgq8XM0hXLOYJPXbmX9W5Hb2Z3jgt8QB21ZQty/ClIbp9UjLjSBwk9OoO+vCxc/
 Ah5xVgoxl2f3CiMywoxsZVG6KE+w5qdKqSwx6uToNmOCipujtH89h15Bz1hatgk5302o
 SfwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3v3bLW+VFnJeDLcxhYq9cFw7fSr4Mi5isKHHKN/Ocv7ghjDtPHDBBhi/xYKY0nOqVlZJFyelLPVM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIcj8erRwa8sC3PE4goGNQ7eApFFCY5AgfJPrEMzcHlMU/WJYl
 6URFecQXYBYY0xflkCYKsT2E4D6FWONv+Tx1mja6dV3ob8CiZNYZvBB3UsrPtD2Xvw==
X-Gm-Gg: ASbGncukCUi+Dqpth16GGianreETVJzRNVHFRRf+0rRi0o+PSSf5zIKz5YdOjunBtpd
 Gqs859O1cTKRcjTJ9Njnu48vzzTVK3XRp1sNlgDmvhYU5/0RAdT6X6lZlSh197m0Y6TGgwe2gr4
 KATGR91uF0aMZc4x8rPC96DsuVffE/5/ZSVrgz5ZGlsnQP8uThkpu+tOf946dfgO7M8GrhiVrb5
 JLL5qLK3QZUf85xfBPh4bn0npJUtDOl19N9L04o2PxxC0aOxQmB0NZ76e+VXrgvZW0ZT9WOaPRx
 myxiHdpW4XLrzvOI8DvMCJ5v8M5GJcRuOddMkwhSYARWdPYDCklUntaLTGZrMycfen4+nw4zGYj
 rUN+/AiVHkm/ov/sf9hPNKa1+weuGR4C7fE9L9pyawRsqZ8ubva1amDu1
X-Google-Smtp-Source: AGHT+IEnZmo97hTPFZMCorIymSRvtFy/EQxRfq2GVJu7TQxCxXPZYFAQNMo9Bj8lA2NgaOC3Q4hnKw==
X-Received: by 2002:a17:902:d2c9:b0:242:461b:7d4 with SMTP id
 d9443c01a7336-2446d71ed3amr173689245ad.15.1755517825070; 
 Mon, 18 Aug 2025 04:50:25 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:5130:767b:3a09:59d6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446ca9ee03sm78997715ad.15.2025.08.18.04.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 04:50:24 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 linux-input@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v3 2/2] HID: Make elan touch controllers power on after panel
 is enabled
Date: Mon, 18 Aug 2025 19:49:34 +0800
Message-ID: <20250818115015.2909525-2-treapking@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250818115015.2909525-1-treapking@chromium.org>
References: <20250818115015.2909525-1-treapking@chromium.org>
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
device and read the VID/PID. When this quirk is enabled, register
.panel_enabled()/.panel_disabling() instead for the panel follower.

Also rename the *panel_prepare* functions into *panel_follower* because
they could be called in other situations now.

Fixes: bd3cba00dcc63 ("HID: i2c-hid: elan: Add support for Elan eKTH6915 i2c-hid touchscreens")
Fixes: d06651bebf99e ("HID: i2c-hid: elan: Add elan-ekth6a12nay timing")

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v3:
- Collect review tag
- Add fixes tags

Changes in v2:
- Rename *panel_prepare* functions to *panel_follower*
- Replace after_panel_enabled flag with enabled/disabling callbacks

 drivers/hid/i2c-hid/i2c-hid-core.c    | 46 ++++++++++++++++-----------
 drivers/hid/i2c-hid/i2c-hid-of-elan.c | 11 ++++++-
 include/linux/hid.h                   |  2 ++
 3 files changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index d3912e3f2f13a..99ce6386176c6 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -112,9 +112,9 @@ struct i2c_hid {
 
 	struct i2chid_ops	*ops;
 	struct drm_panel_follower panel_follower;
-	struct work_struct	panel_follower_prepare_work;
+	struct work_struct	panel_follower_work;
 	bool			is_panel_follower;
-	bool			prepare_work_finished;
+	bool			panel_follower_work_finished;
 };
 
 static const struct i2c_hid_quirks {
@@ -1110,10 +1110,10 @@ static int i2c_hid_core_probe_panel_follower(struct i2c_hid *ihid)
 	return ret;
 }
 
-static void ihid_core_panel_prepare_work(struct work_struct *work)
+static void ihid_core_panel_follower_work(struct work_struct *work)
 {
 	struct i2c_hid *ihid = container_of(work, struct i2c_hid,
-					    panel_follower_prepare_work);
+					    panel_follower_work);
 	struct hid_device *hid = ihid->hid;
 	int ret;
 
@@ -1130,7 +1130,7 @@ static void ihid_core_panel_prepare_work(struct work_struct *work)
 	if (ret)
 		dev_warn(&ihid->client->dev, "Power on failed: %d\n", ret);
 	else
-		WRITE_ONCE(ihid->prepare_work_finished, true);
+		WRITE_ONCE(ihid->panel_follower_work_finished, true);
 
 	/*
 	 * The work APIs provide a number of memory ordering guarantees
@@ -1139,12 +1139,12 @@ static void ihid_core_panel_prepare_work(struct work_struct *work)
 	 * guarantee that a write that happened in the work is visible after
 	 * cancel_work_sync(). We'll add a write memory barrier here to match
 	 * with i2c_hid_core_panel_unpreparing() to ensure that our write to
-	 * prepare_work_finished is visible there.
+	 * panel_follower_work_finished is visible there.
 	 */
 	smp_wmb();
 }
 
-static int i2c_hid_core_panel_prepared(struct drm_panel_follower *follower)
+static int i2c_hid_core_panel_follower_resume(struct drm_panel_follower *follower)
 {
 	struct i2c_hid *ihid = container_of(follower, struct i2c_hid, panel_follower);
 
@@ -1152,29 +1152,36 @@ static int i2c_hid_core_panel_prepared(struct drm_panel_follower *follower)
 	 * Powering on a touchscreen can be a slow process. Queue the work to
 	 * the system workqueue so we don't block the panel's power up.
 	 */
-	WRITE_ONCE(ihid->prepare_work_finished, false);
-	schedule_work(&ihid->panel_follower_prepare_work);
+	WRITE_ONCE(ihid->panel_follower_work_finished, false);
+	schedule_work(&ihid->panel_follower_work);
 
 	return 0;
 }
 
-static int i2c_hid_core_panel_unpreparing(struct drm_panel_follower *follower)
+static int i2c_hid_core_panel_follower_suspend(struct drm_panel_follower *follower)
 {
 	struct i2c_hid *ihid = container_of(follower, struct i2c_hid, panel_follower);
 
-	cancel_work_sync(&ihid->panel_follower_prepare_work);
+	cancel_work_sync(&ihid->panel_follower_work);
 
-	/* Match with ihid_core_panel_prepare_work() */
+	/* Match with ihid_core_panel_follower_work() */
 	smp_rmb();
-	if (!READ_ONCE(ihid->prepare_work_finished))
+	if (!READ_ONCE(ihid->panel_follower_work_finished))
 		return 0;
 
 	return i2c_hid_core_suspend(ihid, true);
 }
 
-static const struct drm_panel_follower_funcs i2c_hid_core_panel_follower_funcs = {
-	.panel_prepared = i2c_hid_core_panel_prepared,
-	.panel_unpreparing = i2c_hid_core_panel_unpreparing,
+static const struct drm_panel_follower_funcs
+				i2c_hid_core_panel_follower_prepare_funcs = {
+	.panel_prepared = i2c_hid_core_panel_follower_resume,
+	.panel_unpreparing = i2c_hid_core_panel_follower_suspend,
+};
+
+static const struct drm_panel_follower_funcs
+				i2c_hid_core_panel_follower_enable_funcs = {
+	.panel_enabled = i2c_hid_core_panel_follower_resume,
+	.panel_disabling = i2c_hid_core_panel_follower_suspend,
 };
 
 static int i2c_hid_core_register_panel_follower(struct i2c_hid *ihid)
@@ -1182,7 +1189,10 @@ static int i2c_hid_core_register_panel_follower(struct i2c_hid *ihid)
 	struct device *dev = &ihid->client->dev;
 	int ret;
 
-	ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_funcs;
+	if (ihid->hid->initial_quirks | HID_QUIRK_POWER_ON_AFTER_BACKLIGHT)
+		ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_enable_funcs;
+	else
+		ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_prepare_funcs;
 
 	/*
 	 * If we're not in control of our own power up/power down then we can't
@@ -1237,7 +1247,7 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	init_waitqueue_head(&ihid->wait);
 	mutex_init(&ihid->cmd_lock);
 	mutex_init(&ihid->reset_lock);
-	INIT_WORK(&ihid->panel_follower_prepare_work, ihid_core_panel_prepare_work);
+	INIT_WORK(&ihid->panel_follower_work, ihid_core_panel_follower_work);
 
 	/* we need to allocate the command buffer without knowing the maximum
 	 * size of the reports. Let's use HID_MIN_BUFFER_SIZE, then we do the
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
2.51.0.rc1.163.g2494970778-goog

