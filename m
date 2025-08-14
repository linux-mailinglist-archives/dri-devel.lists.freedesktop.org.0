Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A965B268DB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 16:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2AD10E1BF;
	Thu, 14 Aug 2025 14:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RsCwOQbx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6C710E1BF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:16:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-45a1b0bde14so4968825e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755180976; x=1755785776; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=enTAHeWTRo9eQLT5sL3CB9Qx1tAhO3uPSW9JWsk0jtU=;
 b=RsCwOQbxK148pAI9k73wpEpBnG9eDvn+reoWrxM4vVevJbdCrg/HjEI00fGhQOzwSQ
 kX4MF0al4OpXKf3G3pRzlf5dHMvx4vhtG1S5GJLVPv1C88MCD+CTV68y1WWzmyb7Mpr5
 bT6IMzlmvJBf9aTWAuSrIMSxJBDmUuXmg0FNVUQpj3+rT2byhAAnqr7JfA8+cnrvH6cj
 3tA+FnAB16PJnUWtFcDsykRAgdFwBSEF2OYG6VGHyCX0MOQ0MylGb1vaaV0TWoyKb+Mq
 sxMNxSFHvZezFcXIWrKcXtvEAO7p9ZO+fnDW1x9gMuVGDc0HpAYKfYhQOtJwkmyBLvv+
 h5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755180976; x=1755785776;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=enTAHeWTRo9eQLT5sL3CB9Qx1tAhO3uPSW9JWsk0jtU=;
 b=m8V7zOapf0PzeJqcmPN8ZBta+EN/v2CNa5wGbfVfYxSdMvjQ5dhLReRW1WRf6hVFzp
 rETrypY563U/XdYD1SgqrxW0KEdxo0/zx5t7Y7b36yXK4qXvT8rjDVJoLLLqAyCTseaG
 CD+BlgsO8CuMGGmCqDBiTxsye3M5RQPg3Bo2Oko5pDLKm4GBS+5uILaOBmmQ6k1lZwpi
 m3lC/NCyacksVYUGq8w0LIBBJgrVSykf2VRObR5Lgf1WnD6H2EAR8CqkxmnJ2XPLteHU
 y7Em6Nf8xYOt8AQlhjHqYLRLMvcGFEuSFHFMKRNHtqB5WsCBjSdDZrzTDHxwAq2Q7Efq
 y74g==
X-Gm-Message-State: AOJu0YwtodD91pdYTa9f/U+1/lWsSu5w877mcXS2ap+pUsB8CLHzQRe3
 X/q3l6htTzQ4NSpiFHSglsKmuBukUTj/OQFpMA3QuNOqCmZgpWAFVpRXXSdqtn2fdgE=
X-Gm-Gg: ASbGncu3/sP5cwfOH5EmuaC62eqV+vbbYlbVRHP2xr+1K/sNt0vnbPGdDV5r4P8BETM
 mkn0Xa1TULsZZYUvrADLDayuhZZV9BSttOIF4lFhkZVS37BraagjkXeRFgQF4FE/cuAadUVtZXc
 adQb9BRTKIo0zcncYpAV51XXbpNKL3f+TIAJMdGsECwabPyqsTk5rtmUD5nbnZ3StJc0X6h7WjQ
 M9Q0iG2r4MWbpSg7T4c1HX93SKSuyqpiB3YxrTWOtRbBXdjDZ4ACQ7chshE4FBfEUCWt963QC2D
 HK5NtuqnfMU0SLPGqYHuwZlieqpIyuZKxda2Qxvq3QdXty8meI61ov9ryPQDNBCW6XdqmnykZoX
 kj66wSiNY/1CHdLJfmM3qp17MFgXCnx6Ga7Yiz5+/8Mg=
X-Google-Smtp-Source: AGHT+IHhUfl5yldyfcKxnZmAYd7Ox6/qSLrIXnCMXweR55b0I87rPZkXJK9dQDcnHeRcbasbHGUBNw==
X-Received: by 2002:a05:600c:8b5b:b0:458:bf7c:f744 with SMTP id
 5b1f17b1804b1-45a1b6754d2mr24461125e9.32.1755180975528; 
 Thu, 14 Aug 2025 07:16:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6fcd32sm24940215e9.22.2025.08.14.07.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 07:16:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 14 Aug 2025 16:16:09 +0200
Subject: [PATCH v7] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-topic-x1e80100-t14s-oled-dp-brightness-v7-1-b3d7b4dfe8c5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKjvnWgC/x3NwQqDMAyA4VeRnBdIguK2Vxk7bDbTwGhLU0QQ3
 93i8bv8/w6uxdTh2e1QdDW3FBvGWwfT8omzooVmEJKBRumxpmwTbqx3YiKs3DumvwYMGb/F5qV
 GdUfiB+kgxIEEWiwX/dl2jV7v4zgBaxTuiHgAAAA=
X-Change-ID: 20250724-topic-x1e80100-t14s-oled-dp-brightness-0190e5201d02
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 linux-arm-msm@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7537;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=U0Z/PWROvEXhparbnVTWNTM2+mbhR9/F3cuOnvJBvy0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBone+uazZdfMQp4hW8OQZODTPFYqq9odT3Yt5GxFcU
 ndLivxSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaJ3vrgAKCRB33NvayMhJ0bT1D/
 4zoNrLGJLmkriHbhULPlj6ywvY2vjfutGE5T8hT2b0VU9+XzsZmBnev7eDGJq8CZGhfgTFZFlhHeSU
 jY5K+w4LHR0ygWANTk/Go+vEzhfk9CwdgU3G57DFR5OBFlyC6YS9g2+gw76+JCLBLG5FQWoud+78lf
 4TiVOAVC9uCerPxfTXkB85Qlr+ZVLYAk1bhsdElXG/MzBOOjN7itMD06Mu3kC2hkcjDrAJh7tc388x
 WDDQI5g/UZpBA++ABxqRNh/KnrsNiYBhZP/6m12c8cIZp9iiRC+jq01T1EhKYHFUWXUyNbhrr2toRO
 ygxHAp55Vb+acTUnjHd+HvNqazoEoDhHQ3gM0clxnkkMLnqDMKRwHZUA8pPC86NkfCyThV5bixE77j
 /LKiHnna7pWaQ6geSKh1cILHNsw4WR80ucjpmM453Q5XVbpulM3wiS1eG/Safiz0Yqwx7WCJkVTCu5
 8DoIJmnHkVoIkXZFTJAaWs2eBAQaQbkt5rRWCgdJ8uHVU/PBEZIl1muhYxnQPZGyRBE1vuOrSVQ4e6
 x2cMnh1NXN0+pWWRF7AvK82PMns2QJYv0cMyg1jMRI8jHFAWJAbrloQXLPJDMXqT8wpBtsFOPCy0h6
 wNGi5NYxwj41HHrBjaMiCsusi/P8PwT2SuNC5Q4YqHmuIbeVk1DmmD255Ecg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

From: Christopher Obbard <christopher.obbard@linaro.org>

According to the eDP specification (VESA Embedded DisplayPort Standard
v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
the MIN value as the effective PWM bit count.

This commit updates the logic to clamp the reported
DP_EDP_PWMGEN_BIT_COUNT to the range defined by _CAP_MIN and _CAP_MAX.

As part of this change, the behavior is modified such that reading both
_CAP_MIN and _CAP_MAX registers is now required to succeed, otherwise
bl->max value could end up being not set although
drm_edp_backlight_probe_max() returned success.

This ensures correct handling of eDP panels that report a zero PWM
bit count but still provide valid non-zero MIN and MAX capability
values. Without this clamping, brightness values may be interpreted
incorrectly, leading to a dim or non-functional backlight.

For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
supports AUX backlight control and declares a valid 11-bit range.
Clamping ensures brightness scaling works as intended on such panels.

Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v7:
- Take in account invalid bit_count
- Write bit_count back if clamped within BIT_COUNT_CAP_MIN & BIT_COUNT_CAP_MAX 
- Link to v6: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org 

Changes in v6:
- Update commit message around chaning reading PWMGEN_BIT_COUNT_CAP_MIN
  and _CAP_MAX to be required.
- Link to v5: https://lore.kernel.org/r/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v5-1-25083d9732fc@linaro.org

Changes in v5:
- Correctly check return value when reading PWMGEN_BIT_COUNT_CAP_MIN
  and _CAP_MAX.
- Link to v4: https://lore.kernel.org/r/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v4-1-85ef0991bdf8@linaro.org

Changes in v4:
- Remove unrelated whitespace changes.
- Remove unrelated commit change.
- Add note to commit message about changing read of PWMGEN_BIT_COUNT_CAP_MIN
  and _CAP__MAX from optional to required.
- Link to v3: https://lore.kernel.org/r/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org

Changes in v3:
- Properly rebase patch on top of latest version of drm-misc-next.
- Make patch more generic by clamping PWM bit count to advertised MIN
  and MAX capabilities (suggested by Dmitry).
- Link to v2: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org

Changes in v2:
- Split backlight brightness patch from T14s OLED enablement series.
- Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
- Rework commit message to reference eDP spec.
- Rebase on drm-misc-next.
- Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
---
 drivers/gpu/drm/display/drm_dp_helper.c | 68 ++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1ecc3df7e3167d13636e194c4aab44ee8979aa11..011a493f06d4871074832ec954a05697103466b2 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -29,6 +29,7 @@
 #include <linux/init.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
@@ -4126,22 +4127,61 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 {
 	int fxp, fxp_min, fxp_max, fxp_actual, f = 1;
 	int ret;
-	u8 pn, pn_min, pn_max;
+	u8 pn, pn_min, pn_max, bit_count;
 
 	if (!bl->aux_set)
 		return 0;
 
-	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT, &pn);
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT, &bit_count);
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap: %d\n",
 			    aux->name, ret);
 		return -ENODEV;
 	}
 
-	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+	bit_count &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
+	if (ret < 0) {
+		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
+			    aux->name, ret);
+		return -ENODEV;
+	}
+	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
+	if (ret < 0) {
+		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
+			    aux->name, ret);
+		return -ENODEV;
+	}
+	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	if (unlikely(pn_min > pn_max)) {
+		drm_dbg_kms(aux->drm_dev, "%s: Invalid pwmgen bit count cap min/max returned: %d %d\n",
+			    aux->name, pn_min, pn_max);
+		return -EINVAL;
+	}
+
+	/*
+	 * Per VESA eDP Spec v1.4b, section 3.3.10.2:
+	 * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
+	 * the sink must use the MIN value as the effective PWM bit count.
+	 * Clamp the reported value to the [MIN, MAX] capability range to ensure
+	 * correct brightness scaling on compliant eDP panels.
+	 * Only enable this logic if the [MIN, MAX] range is valid in regard to Spec.
+	 */
+	pn = bit_count;
+	if (bit_count < pn_min)
+		pn = clamp(bit_count, pn_min, pn_max);
+
 	bl->max = (1 << pn) - 1;
-	if (!driver_pwm_freq_hz)
+	if (!driver_pwm_freq_hz) {
+		if (pn != bit_count)
+			goto bit_count_write_back;
+
 		return 0;
+	}
 
 	/*
 	 * Set PWM Frequency divider to match desired frequency provided by the driver.
@@ -4165,21 +4205,6 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 	 * - FxP is within 25% of desired value.
 	 *   Note: 25% is arbitrary value and may need some tweak.
 	 */
-	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
-	if (ret < 0) {
-		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
-			    aux->name, ret);
-		return 0;
-	}
-	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
-	if (ret < 0) {
-		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
-			    aux->name, ret);
-		return 0;
-	}
-	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
-	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
-
 	/* Ensure frequency is within 25% of desired value */
 	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
 	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
@@ -4197,12 +4222,17 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 			break;
 	}
 
+bit_count_write_back:
 	ret = drm_dp_dpcd_write_byte(aux, DP_EDP_PWMGEN_BIT_COUNT, pn);
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux pwmgen bit count: %d\n",
 			    aux->name, ret);
 		return 0;
 	}
+
+	if (!driver_pwm_freq_hz)
+		return 0;
+
 	bl->pwmgen_bit_count = pn;
 	bl->max = (1 << pn) - 1;
 

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250724-topic-x1e80100-t14s-oled-dp-brightness-0190e5201d02

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

