Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76647A75B6B
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 19:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E5A10E30E;
	Sun, 30 Mar 2025 17:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pKqIqF2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E4810E30E
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:31:52 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso28244855e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743355911; x=1743960711; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4kuD+z9d8fzDqjbwJOgrxPtsymg2CstyO9XOKR2toEI=;
 b=pKqIqF2t03+6nncanUbYasDZkuPWH4qWL8bSZkPLahX/HF4Y/D4PB3VF7zVCu54LRG
 MvA8fRfpiEMZVubQJyWWEXQifpeoyXJtc4L6FmoDKClWwv/T5xqXL5O2JzY+X2v8VDfV
 jHPIaPc2zSOLMhrUzQk+LT8A5EbdWVHfYMZ+z1Rmw7HuCtven7SZk4lssAQ24KdPMSG1
 +6aAvdH85VdLhrCoEfTqi+dPjo35YX3VYQoKadaa6aWY0Ig30bKALyPUw3ywmKuOuR38
 md9VPdykebSEkgWaCY4XzAqy8M7w0nWiKlkhaVML7iRxHIBpHZAZHi1O9uxY0lbTMRqu
 we8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743355911; x=1743960711;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4kuD+z9d8fzDqjbwJOgrxPtsymg2CstyO9XOKR2toEI=;
 b=YP2DeyXlLHjorm580C5XEDAG9Zukt0YIHDBoaVyVjUF9k/qlyklqhASQnT/8vE9reX
 4838L1YJIdttbRxIc1jSgXlBrrNCrl/KCesXa3hov1NbAo2cSreCRYkQQ3MF6W4tZyxf
 VB1/q22R+apd1dPnl9BXb6w6/gz6rNjySo6/wHyWLDDLGkc6pZGYJEgtIUGe7UR/JXk0
 D4dT7JxAo0Pn52IfTjb55h4jvfyJ6Ft+YBu7o2wInpVB4hIb+lU9CujSvNTyq/3FsJV/
 dg2E/5lyLOVxD6q4XsYZQrMPgiANmmEBdqEzoHTtVBuSZp+C/E/HgJdyXr0R7Ht2ipEU
 2Cjw==
X-Gm-Message-State: AOJu0Yzish82VHfGvi52Gadw5bCOnAxVMIerxYriKZFMLi21P+jQog37
 9sYuDuzsr2t3qW6Tqhm3A2lBIgjO06lLmDfbslVu66Gt9ewrdOf2U9gyUaFlVAg=
X-Gm-Gg: ASbGncsfmn2S7feqmLzjXeFiq1jNXOOP/QD2PK6TkQxvixTvM3tVEQpxZ7TTusoJcdr
 LFCgSS5xutwfCKh+7aONN/11K61MtYcpIg1XSI+NOOyIpG+4J7CNYSy/cScVzAYTiKBKPDyN6Zw
 OHNlun0itXT7X9Q2NTZIVmWPchcNWY4T8f4lgEnu9B+mhd79mRBUql1G/YqVBNmUi1FAbu5nQ8Y
 fhoGafXTMKlIjltl+DMb/BqM5RcKXP1HsmMGIG/xCBxCETB8Q/igYckVMjqDP+7q8QlIJbWuFKg
 mxh22yVL7u5QSSSFkMbatfrHAJ1UJvyIad7Nv8kPADAFEKr1PtaN33/w7xF0A364pQ8=
X-Google-Smtp-Source: AGHT+IEVRlHmG2mH8oUFMuBEpKfeOktvd5xIWSvQ3wq8kAQ7XDGucHNqB0BGw9M+v/NB0mBCdHhnVA==
X-Received: by 2002:a05:600c:4f51:b0:43c:ea1a:720a with SMTP id
 5b1f17b1804b1-43db61d8deemr49713865e9.1.1743355910783; 
 Sun, 30 Mar 2025 10:31:50 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39c0b66285bsm8937562f8f.21.2025.03.30.10.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 10:31:50 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 30 Mar 2025 18:31:43 +0100
Subject: [PATCH v4] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v4-1-85ef0991bdf8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAP5/6WcC/53NQQ6CMBCF4auQrh0ztFDQlfcwLgodYRJssSWoI
 dxdYKVLXb63+P5JRApMURyTSQQaObJ3y8h2iahb4xoCtssWEmWOShbw4B58VZlga7jX/gZDmkX
 wHVnojaMOqsBNOziKETKUWOq80nmJYhH7QFd+brXzZdktx8GH1xYf5fr+1xklpJBqWysiRFnoU
 8fOBL/3oRFraFQfuMLfcLXiuS4xtYfClOYLn+f5DcePISVEAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5226;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=Y4jbzaAmAQ1oYeQ+EOGvGhqKfwemzx+gKNU285N2Cnw=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn6YACalb0k+gr8SNYeQxrL+cZdxKEY+y2ujEON
 uvootr7qBKJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+mAAgAKCRBjTcTwaHBG
 +IRND/49eCJCJeGZg9woVUtbPOIo9pHwyV4otaiN5urWIXupo3U5Nk2y0cXI2Lcx5rCnfN6+jYb
 PZ0Bf2m8OM5woK7zQxrFyyA9UMYIBqTba1XUyAlPUPHo+lUrU6CzEm5TI71wUx8GcAwZh/mF+q0
 CDH1krUTYtolRUCODqSzKcOHk0Lc+4UML1cf25765YpxBR0ywHNr89xWgndAxuzKfOkhORoiJho
 x5hdioQG915EyIFTK7zMzUyhnHehsNMk2D5wWYzWiYOF2ye+nz1iTWw0WyeOI7917C9do8ndBrD
 rzzh9ftF9y4DoO5cJhCNBHRybDgj7xuVb2tmPnDV/eFLh5ujT0Hm4AY2oaJjO4xxQg9Z1uxk+Ux
 C8vcMoVEWoellc2BWEB6v70z8ot0Kotb0KbGHTeVqhNYJxkKDIVCKFqCG9ZKeQJV66xPU2qg4TW
 vG2N6VF/Qdx6mdDyZkNZqmNZbNsMBsktOp+pY0B9WjycSczEQaAV06S1aiB5kluRxZxhL4ItwQl
 IXV/UGNa9Xwcq3P1B83mqZn31KuCVrCrQCpR7Xhp0ZcP0xfn0nM5mtr7iK6P9CeV7i7zl7N1Krr
 dikPUIJskr9aURPKVP1KRQqYmaGWWmiQ5jw+ZiC5OBkMWvAVnlYjBjkX2BG2hAsU+TIWziqNk/P
 /jyZkDKo/ziEN+A==
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
DP_EDP_PWMGEN_BIT_COUNT to the range defined by
DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. As part of this change,
the behavior is modified such that reading _CAP_MIN and _CAP_MAX
registers is now required to succeed. Before reading these registers
was optional.

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
index e2439c8a7fefe116b04aaa689b557e2387b05540..b5c8a75d036b5d65262417de363409e3ff3f4560 100644
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
+	if (ret != 1) {
+		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
+			    aux->name, ret);
+		return -ENODEV;
+	}
+	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
+	if (ret != 1) {
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

