Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90825A75BEE
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 21:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FDD10E34E;
	Sun, 30 Mar 2025 19:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hJSkiO6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357C710E290
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 19:31:15 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so2871253f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 12:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743363074; x=1743967874; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SDqK019yeshO+8g7PhIq3wTEpbXJRza7Dz3IGb5loNQ=;
 b=hJSkiO6Eqo6AEV0uLJ81NxbZcTXe0vDSA2Cx8ovqTqC4pl4CY2NKOdVbn00gCeVWYv
 0h95+UdFsWeRcFX6NGAd+HddsNC0KArC8ISIQ0qxPxjByVRTr9n4AVWAztG+HddO+Pau
 tXcBA4vxj4UGHEeiYGpfSBfxthFOlvAJ6SzxgFlu0lR3XZHLByqb5XD10HcXdqPaOrRN
 r0FzSBY8y69ZbJS7Gv8m8qT0etApMUTOJbcI68RdIUjS9d++744p0FiG44TwYh6OAfE2
 YJRgMfUyem3h5/6VfLQbf88w7MpUQy3CrQJbaMM+1R8GECNhH3oqlj1NR93kkCD4RqAx
 Unww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743363074; x=1743967874;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SDqK019yeshO+8g7PhIq3wTEpbXJRza7Dz3IGb5loNQ=;
 b=XkgWo5FvE52a10dzxpiU9xy1Ut9ONNZoonxXVb9K27ScQBQiDTfrYMZfpGcrOiYtwh
 zzS1fNqD1o/zHyoDXQ2u1BFO9bWTl4aL+vdvs2D1Gb5IKJGkfVMrIsXQGlf7HSvSPwad
 8mYuX2AD2volB2PA1oLCT82FGpfiiQoGGohGeeqM5NM8vk9kP9mYn4KXKcgzWdhlPfgH
 Lq2kVAD00buEBkUsAPjO/ewyI+1p7SBsrbpS67o8q/I8vwcHza5xbITCAwNmZww1+XXW
 Bo8my87A9pAWdQCxCBsTEEkD4mNbzq1LdHgStdIpTCGSKgKTsvXaVUwejsu5kgTbCPqD
 Q77Q==
X-Gm-Message-State: AOJu0YzKx3CCR5ulkheDuadYq8GwwNXyHOGEu9eD8AyWbFgj8pl2KHaN
 Zv9ZjCbucDhRX+lU2louDgy+6JgO0bz77U5ggpjB03ZX3IoZxgwkAH/Ut79Qjvo=
X-Gm-Gg: ASbGncsowYdH2OKI8k5RHjVPXv9k6rGdwbyupfhjXMvmpRrPxud8IUl4/EnBuwZdxqR
 HSmC4IVMdxlAbNKAB2RgjNDzdOc2TSle5neNv2MJ78lYNa9I8Sg9ICC87vtNf4Lj/7W18LKX9un
 KhHr+AfU7UFKQMlLsTRk0EivMT+fDglIcywvQwo3KkQhCQzc9Co/LVLyME/ZeZuGFT5P0JZNZ6a
 kOzTtVmueA0rMfLeC7/gsLdr3TeoFvsk1A+cVGsTdPI9Uue9n9n2UFhKoUreu9VqjSU+FiCBxl6
 TImWodIescVpYX809bTjMpwp24Ckfi+WKHZWka/DMoNgexkxNvGuwkui
X-Google-Smtp-Source: AGHT+IEFCAqGYO03jhjz7bazgYv3ZrmHLvxsn+N8ZhYEwcdY3fyeGZHkmjQ/AqQTGIDhm5Ps9g+yYw==
X-Received: by 2002:a5d:47ca:0:b0:391:158f:3d59 with SMTP id
 ffacd0b85a97d-39c120de81dmr3921619f8f.15.1743363073700; 
 Sun, 30 Mar 2025 12:31:13 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39c0b79e37bsm9390988f8f.61.2025.03.30.12.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 12:31:13 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 30 Mar 2025 20:31:07 +0100
Subject: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPqb6WcC/6XOTW7DIBCG4atErDvVAAbjrnqPKgt+xjaSa1ywn
 FaR716cVaus2iy/kXherqxQjlTYy+nKMm2xxDTXoZ9OzI92HghiqJsJFAqlaOESF0jO2Rw8fPj
 0DitvCqSJAix2pglcjsO4zlQKNCjQaOW0MsiquGTq4+et9naue4xlTfnrFt/Ecf1fZxPAgevgJ
 RGiaPXrFGeb03PKAztCm/yBS/wbLg9caYM8dK019g5vHsCbihtFPXYdd6E3d7h6AFcVr++MrB+
 Xove/8H3fvwFwRMqx/gEAAA==
X-Change-ID: 20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-4020865b6580
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5745;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=y9ZXPnZNCRtYwGG7/6ABbS9xCKqc+s/sSflTPA+Th+k=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn6Zv9FhSpe7gB2hlAOaUeSB1159NZxRInsmKev
 cHFg9qAMqGJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+mb/QAKCRBjTcTwaHBG
 +L0xEACQlxoKHyeZCqq+REXM1r6N0hjgfYATr4AZ6ns43FB01Y5PhPRAP3FI5QcwD1PtfR0NHO9
 L03+vCM8mAb+7rL4VqFY4J1YOzOeCmJc/ZbmxF0OIQo5X3tZiinq9cT723LTjGdiMHNe21bnJMO
 Nv//c7anS7BJ/pMeq+ZJQyc59HEfSurCQ+UV3PPmpGY3b4q0FKQpk+pfabSY5puVtB+pftGKsFg
 biYjQVGx9xQt8QUB866AAjWLQ4hEt/0PmVEv0Rto0JPavk+J2FDODBAUytBLULFwuNnEPt4Ehkh
 x5wi1drjBPM45cHxy5z0VagJLJP37Wrd6nbVzJCYcTgEMIq0nIZ6PdPa85BemDvYWdR+SLiJ970
 vr031UsuwvbO/ylCVcX1OtoklN29v6Mu6Bdumk0TEOWA5/JzqLgyOSw68on49IHUY1/vsJb4bJ1
 43VaMlkb5iwiV23ETjO8OgFWbsOyCSbijEdAW5y/2/DMqMdui1JBhx+L/jU0Izg7isQESylPR2Q
 wZZPNnpTOUkNrIx731r8FXNeF0UqF8qOMWR8JMg8zGRB3x7HmTo8855IjmIUMBMSCSkjzByWwJl
 Bf0h76zMQaLUTCrvAsSLjGH2eSmh+ZyTyIAg2K1P+9RCA5ZYaLC5YA8DZyLoPPFYP1EzuM6ZtAg
 4IB3Y3zpTA/xSjA==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
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
---
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
 drivers/gpu/drm/display/drm_dp_helper.c | 42 +++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e2439c8a7fefe116b04aaa689b557e2387b05540..5550c40310c55ee275b3ebec08a7500cab38ae78 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -28,6 +28,7 @@
 #include <linux/init.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
@@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 	}
 
 	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
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
+	/*
+	 * Per VESA eDP Spec v1.4b, section 3.3.10.2:
+	 * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
+	 * the sink must use the MIN value as the effective PWM bit count.
+	 * Clamp the reported value to the [MIN, MAX] capability range to ensure
+	 * correct brightness scaling on compliant eDP panels.
+	 */
+	pn = clamp(pn, pn_min, pn_max);
+
 	bl->max = (1 << pn) - 1;
 	if (!driver_pwm_freq_hz)
 		return 0;
@@ -4061,21 +4088,6 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
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

---
base-commit: 4c4d9b7b6c6e676eca22585139aba5f03de74b90
change-id: 20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-4020865b6580

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>

