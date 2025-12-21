Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44211CD458B
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 21:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB8210E3C4;
	Sun, 21 Dec 2025 20:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dionne-riel-com.20230601.gappssmtp.com header.i=@dionne-riel-com.20230601.gappssmtp.com header.b="AXPaih6d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBA210E0D4
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 20:04:46 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4ee05b2b1beso32964871cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 12:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dionne-riel-com.20230601.gappssmtp.com; s=20230601; t=1766347485;
 x=1766952285; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qcubWTT1Pz5+LyJxHMvMkV1HwdecC4T519WRIUvUPgQ=;
 b=AXPaih6d2L/lzeOKWKNc6VihVB8JuS2VA4AXjiG3jhH+Sg8ilbViEegTYHtGxj5egV
 x87yHrIcBO9lew5S8ghBcqcVFm50gWJoPzl1FNgbBpCDfRqjwCZ6ujs23oAKGKKhclBZ
 iWR+4wamQIb1HqlmiffgNOuICfO5E7UE6QLiQJuFBgb2Pw8elwBeG847eufr5BDhSuNw
 7lt2KY2utd9zRUcU1fV7a/Ab3vszbe6zsg34neonbZ9snwMgl6u3p30BH37xfSeODnvP
 7ej5fKU+Am1DCMKcu18c6oU3wyhjGYUsGFDxWK5JZkKcTMj9GKah2fakDjsxbkNKLdKY
 BcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766347485; x=1766952285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qcubWTT1Pz5+LyJxHMvMkV1HwdecC4T519WRIUvUPgQ=;
 b=P2HnpsCd0wTbvGR8kxnxfMN1sc/UCeMmhTAG79vzgp/8E9l11TIEs3PukLO+nyDco/
 nXLAy3s8/5IbfZU9/KweykMTcoxmpn+ZzmYeerFm0y8M1xVVk7aiHqWjuPCv/K6Yi0Zx
 LlkjgPBQTVzpqoVtJOmGEnfyGb521sssQI80m7eFx2L8mJWr/ILvSD5U7AbJJUL3RJg5
 IBJ8yUP+WnMlj9MDxP/7VhhevqoBAA5aixNQw6FLMZPxNQuKdMiWH8JAUSgPMO0bucns
 clCQadFTk+Jp9swnJ84RiKZ6FxHQCWzliLXzrNlSeS5LvrbVFL1jEzencKc/fGbcWDjr
 rn/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZfdDT06riHgZjtzvbUOcBMNedc/qszrkdjxCyffAvga3VU4UiTgB+cQM26iUGGx/ZFlmSVwtXb7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzP65/P5ZjAouDrdskajtD5kIHW1El7s8jvY0elEBeXgeHISASy
 iqwqT2PPGA7p8uBYgS0Cg78qyrRACG6EQaCZPonfoy/z/myr3gF7YgkFt9W6lMTmMA==
X-Gm-Gg: AY/fxX6sQEaxxrJluYlaMiWxCil9cVMlkITLJY7ni0vz82zq7aRMBPTHKhov37LZg9A
 gFaF9vUIaWn/D/cZ7C33Q9ocZ/TYESpknjSGganLkgtQVNyv2s2dqvKo+2WqN9LRQiYLV8JMOjr
 P+N1fkcpeilPkhnW7e9j4MQT0Vh4G5FEDIEeocTVYxX76oCJ9B7r8Fqz0Gv+GEOv9bsYIyC2GY4
 T2FTrpe3w3DJNEVojTVraCwJNZ4mfOubq/cq4qGPxpjeu5hPDGpJsbt5kY3VScLp4wiYt7uvQmN
 Bg4ySrQf4My7CEv/tcLjc+o56+E2DyO+7TD8UI2CkcdyexS4rI+uBmULynIi8jijdoKJ+mlAbWo
 SLkvxHdW4DmnnbEANZjMRfwKDNm8whiIPAbsDGE3BT5eSwoz6XrifEcsSz87l29mSxlAoqyPjDR
 50acravo//yRCCPRWdJbaLrFJS3RBilvY9/zulcACsN3YC3EAwafDPObMbXrEjIp8YFQ==
X-Google-Smtp-Source: AGHT+IHjMsneMdbMo6QX5DQyZgWSFlMlf1e85YnTnHkFeIucTQyjyuU9w8NrvIqxqGP47xXp9FUyAg==
X-Received: by 2002:a05:622a:250c:b0:4ee:24b8:2275 with SMTP id
 d75a77b69052e-4f4abcf6df2mr142149051cf.1.1766347485320; 
 Sun, 21 Dec 2025 12:04:45 -0800 (PST)
Received: from frankgrimes.elk-nominal.ts.net (135-23-195-66.cpe.pppoe.ca.
 [135.23.195.66]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f4ac62d53dsm63802501cf.19.2025.12.21.12.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Dec 2025 12:04:43 -0800 (PST)
From: Samuel Dionne-Riel <samuel@dionne-riel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Samuel Dionne-Riel <samuel@dionne-riel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] drm: panel-backlight-quirks: Add kernel parameters for
 quirks
Date: Sun, 21 Dec 2025 15:04:34 -0500
Message-ID: <20251221200434.2735218-2-samuel@dionne-riel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Dec 2025 20:27:00 +0000
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

The goal is to enable end-users to try the different values quickly, so
that they can document, for example, the better minimum backlight values
for their systems.

All quirks should be implemented, since this is a change meant to
empower end-users in providing quick and complete quirks data for later
addition to the quirks data.

This is attempting to keep the largely unspecified behaviour as close as
possible to the previous behaviour.

This is currently an amdgpu-specific driver, but it shouldn't stay
specific to that driver. The current usage always copies the values to
its own runtime data (caps, in amdgpu).

Without knowing the contract between this module and other modules, it's
impossible to know if the driver could instead keep the pointer to the
returned quirk.

This quirk also currently has no multi-panel uses, but theoretically
could be used on a system with dual screens, and with multiple different
EDID matched panels.

As such, the change has been authored to harden against this situation,
and ensure that when no parameter has been given, that this would
continue returning the same values (i.e. pointing at the quirk data
structure elements directly).

It may be preferrable to instead document that the values returned by
this function are only good until then next time the function is called.

Or it may be that filling a caller-owned structure may be preferred, so
that there never is any concurrency concerns.

Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>

---

This is sent as an RFC as I have basically no idea if this is correct,
or desirable in its form.

This was authored on top of the backlight curve changes, so this exact
implementation depends on "Add quirk to disable custom brightness
curve", but decoupling it is trivial, if for some reason that change
gets held back for longer than this one.

As stated in the patch, the rationale is that end-users should be able
to quickly try values without having to mess with either a full kernel
rebuild (easiest) or somehow messing with their systems so an updated
quirks module is loaded before amdgpu gets loaded.

I believe that the current semantics are *sufficient*, and that
supporting more than one display on the kernel cmdline might not be
worth the pain, when this would be a rare situation, and mainly as a
means to gather the correct values for sending the appropriate changes.

The implementation, though, I don't know how good or bad it is, and how
palatable specifically for its maintainers. So please provide
suggestions on how this should be done.

Thanks!

Link: https://lore.kernel.org/all/20251221192422.2726883-1-samuel@dionne-riel.com/
Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
---
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 79 +++++++++++++++++---
 1 file changed, 69 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index 537dc6dd05343..1682409613d22 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -8,6 +8,21 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_utils.h>
 
+// The parameters use the type-specific max value as a flag for being unset.
+// The semantics of these quirk values are drivers and device-specific.
+
+u16 param_min_brightness = U16_MAX;
+MODULE_PARM_DESC(min_brightness, "minimum brightness override for all panel backlights. Value usage is driver-specific.");
+module_param_named(min_brightness, param_min_brightness, ushort, 0444);
+
+u32 param_brightness_mask = U32_MAX;
+MODULE_PARM_DESC(brightness_mask, "integer mask to bitwise OR with set brightness values for panel-specific fixes. Value usage is driver-specific.");
+module_param_named(brightness_mask, param_brightness_mask, uint, 0444);
+
+bool param_disable_custom_brightness_curve = false;
+MODULE_PARM_DESC(disable_custom_brightness_curve, "when true, custom brightness curve support is disabled in the driver. Value usage is driver-specific.");
+module_param_named(disable_custom_brightness_curve, param_disable_custom_brightness_curve, bool, 0444);
+
 struct drm_panel_match {
 	enum dmi_field field;
 	const char * const value;
@@ -98,6 +113,8 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
 	},
 };
 
+static struct drm_panel_backlight_quirk quirk_from_param = { };
+
 static bool drm_panel_min_backlight_quirk_matches(
 	const struct drm_get_panel_backlight_quirk *quirk,
 	const struct drm_edid *edid)
@@ -132,23 +149,65 @@ static bool drm_panel_min_backlight_quirk_matches(
 const struct drm_panel_backlight_quirk *
 drm_get_panel_backlight_quirk(const struct drm_edid *edid)
 {
-	const struct drm_get_panel_backlight_quirk *quirk;
+	const struct drm_get_panel_backlight_quirk *quirk = NULL;
 	size_t i;
+	bool parameters_given = false;
 
-	if (!IS_ENABLED(CONFIG_DMI))
-		return ERR_PTR(-ENODATA);
+	if (param_min_brightness < U16_MAX)
+		parameters_given = true;
 
-	if (!edid)
-		return ERR_PTR(-EINVAL);
+	if (param_brightness_mask < U32_MAX)
+		parameters_given = true;
 
-	for (i = 0; i < ARRAY_SIZE(drm_panel_min_backlight_quirks); i++) {
-		quirk = &drm_panel_min_backlight_quirks[i];
+	if (param_disable_custom_brightness_curve)
+		parameters_given = true;
 
-		if (drm_panel_min_backlight_quirk_matches(quirk, edid))
-			return &quirk->quirk;
+	if (IS_ENABLED(CONFIG_DMI) && edid) {
+		for (i = 0; i < ARRAY_SIZE(drm_panel_min_backlight_quirks); i++) {
+			quirk = &drm_panel_min_backlight_quirks[i];
+
+			if (drm_panel_min_backlight_quirk_matches(quirk, edid))
+				break;
+		}
 	}
 
-	return ERR_PTR(-ENODATA);
+	if (i == ARRAY_SIZE(drm_panel_min_backlight_quirks)) {
+		// Found no quirk.
+		quirk = NULL;
+	}
+
+	if (!parameters_given && !quirk) {
+		if (!edid)
+			return ERR_PTR(-EINVAL);
+
+		return ERR_PTR(-ENODATA);
+	}
+
+	// We are returning from quirk_from_param only when parameters are given.
+	// This assumes that the return value's data can be kept by the driver,
+	// and that the driver supports more than one match at a time.
+	// (Think multiple-display devices.)
+	// When using a module parameter, only one set of values is supported.
+	if (parameters_given) {
+		// First copy the matched data, when found.
+		if (quirk)
+			memcpy(&quirk_from_param, &quirk->quirk, sizeof(quirk_from_param));
+
+		// Apply module parameters to the found quirk.
+		if (param_min_brightness < U16_MAX)
+			quirk_from_param.min_brightness = param_min_brightness;
+		if (param_brightness_mask < U32_MAX)
+			quirk_from_param.brightness_mask = param_brightness_mask;
+
+		// We force the disable_custom_brightness_curve value when any parameter is given.
+		// This ensures users can override the quirk-defined value.
+		// This comes at the cost of requiring any other value to be specified to work.
+		quirk_from_param.disable_custom_brightness_curve = param_disable_custom_brightness_curve;
+
+		return &quirk_from_param;
+	}
+
+	return &quirk->quirk;
 }
 EXPORT_SYMBOL(drm_get_panel_backlight_quirk);
 
-- 
2.51.0

