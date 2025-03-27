Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27600A73A53
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 18:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE0010E0F1;
	Thu, 27 Mar 2025 17:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ws6vBnpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB0C10E0F1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 17:25:20 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so10019325e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 10:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743096319; x=1743701119; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uFNNjaE2jorSLUU/UXYsik7tXL37/Ckqc+9BheoGsBM=;
 b=ws6vBnpY/D9tEp/JA3AnZqy54zIKxBAjjCoKfsy4tCWMlx3pOwZF5DvuSjPrZ/dbav
 5Incks+pddE2D6HqtReqzaD+wxk56lmT0hU+Zp0ZngqufsdV5BZigutOqvKUCBrm/zAT
 wgzTk0QxC6kcIhvHbBCZtQpnfI/qTHNZk1LtNaJVykgZcO900Hz03FaXtrEEdtcQuDOG
 qYqKHI1M1ME/dxst/pvC9d1bJnODCiCaKPzZsM6eu/tBACj7Ao/2izj2MeEel+zIFEYu
 FAtzCoFo+WY5N5pr2A+mOJSfJA6UEP0GBDTFQcH9bvmjusyGqbgJHgf88w2A0HMtffwi
 Ka4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743096319; x=1743701119;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uFNNjaE2jorSLUU/UXYsik7tXL37/Ckqc+9BheoGsBM=;
 b=oENUOCgNhP34Pg6RpToF54QlOLg9BhKvnGuzsE5S7aZGFA1th3aExllO65xCu6CeGH
 S/aMnboQ3FY3Skad++UmoxcYUsS6hFlTmOyfsd7s3WiR5h1Yn0ng4+pvFfw72mPxpEsj
 YNi7QAceQlRkoSHZ8XCpqhG4q29A7ZoZjE/H2i4JJYBjdx/VpoC2uJO/jZxNUQ//FSzc
 7JLq481kJDALr8eDfdY36cLlq72XqEi48bq2oHxxUUKOZwCJ5yh835EohdeOVEot38+C
 yOMIL0EEam6ZG6AumqrV6nUPvDeEAtXRnLgCdynj31+JAkBYed3hzakikYj9dcCxUQ85
 wO2g==
X-Gm-Message-State: AOJu0Yy5OZWRz8BQTyDm4M9Uga8cfN0KYSi0FOgEAhxEEcGow1w7cbuv
 aM12jIuesmvVFx5za+t2Euw8QVoMZ+HEixOfEtjM7MpYF3ahABlT4mamFhlVtrTZHwdWJgZge8O
 UB6c=
X-Gm-Gg: ASbGncvcq7b8DFOMdZf/LBBI0KPz3d1XksNVv6RjlahNjPcTaB/2yLcYOpyNn0pBVCj
 Ud73xbl8Jij5FZ36n14Nhd16Fe12KxUaEG46kW1InuLGYlSHnYk1NsrkCiA77jJlh5O56yEAwLP
 Zi1eej7Kt2HYsc1Q6oGVcUSe535cgJtWNzG/UJsZkYIF5J9WVdv+cJdCOlVLATLsyMvfhaTFYXu
 bDY72awr9/yavE0XiEw0t9wvXdWVRkiIGqkIHNMS2HPr0N6j44X2pqoth8e5z3A9F412UaxKI5w
 S4Qdbu8SBE3+tst0yzeDyq2/DBz/pNivjAVOm50jcm5CF2niFdx4jDlC
X-Google-Smtp-Source: AGHT+IG6HZVRndm/SI4MfA5kUV10tRAvIz8zy6VUE73vnCcorqncpm2q15iOxitfjTm65+tpqf32cg==
X-Received: by 2002:a05:600c:1604:b0:434:fa55:eb56 with SMTP id
 5b1f17b1804b1-43d8522cca1mr36264425e9.7.1743096318599; 
 Thu, 27 Mar 2025 10:25:18 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39c0b79e304sm103142f8f.73.2025.03.27.10.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 10:25:18 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 27 Mar 2025 17:25:10 +0000
Subject: [PATCH v2] drm/dp: fallback to minimum when PWM bit count is zero
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPWJ5WcC/x3NTQrCMBBA4auUWTsQx6YWryJd5GdsB2oSM0WF0
 rsbXH6b93ZQrsIKt26Hym9RyamBTh2ExaWZUWIzkCFrLnTFjxTM3rsaA75CfuJ27hXzyhGLS7y
 irzIvW2JV7A2ZcbB+sKOBViyVH/L93+7TcfwALVIRAH0AAAA=
X-Change-ID: 20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-4020865b6580
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4303;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=/2xRSARzKGQ4h11CgHv2bq7msP9g4VI83b030w4wYFo=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn5Yn64KspE82XCwduXNxq/mObSEjV0OktoKB7O
 CS69xjfLtmJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+WJ+gAKCRBjTcTwaHBG
 +DvjEACDhVZKkIaryW8LiPt8FICYljuve62aItGb4wA7S4RMrXyj8uYCAg8zAUCD5tldojT7ApC
 YUoYDHVt8t/4eYjcpr6RICIB5z2lYNgczioVM0SREcxzEjrlxWFdmC1EgtShvGfk0jI0YaRXmfE
 3KeSD0a7OqKOd4Vo9+74FYphr5TSs1qexIu5FjQniCUYCcMeZ+YHvFL/JtpMZTlcTkcSDbKrmnT
 xysU/0e9Ter1sQCS2Qh9U9HSNvDwlHiAs+Cp9cF4GQktBCO6+GL1fSA0NzaS94WRbn+4BOvo4sW
 J86LEB83x0IPfxi83q2bjJil7b2u3AJ7jBo98l1rbTemcDyPEd0tksOymypOwXrpebNC59SO9Su
 1X3HZUHNomwVvSGTKcxKLiLYVlxjMKuQDNBBuXVrBc2P2f8/ADUTP7OyQtI5F6R+hHD5PkcS6vF
 rEb6PVeN59NXfGKGMNFe3I5XDZbq3lunUmB8doVTKQ+9EhYOmDdur4PS9feN+pEPCNFF1GM5AZk
 sAmhA9AcSNAamVn5yvqQX9na09Vmy1BKI3bOsQXeZafbJjzUug3J/2QzAnBFm9RmqvLlU/xY0lX
 aH9swSYFbn0wT6kZl+Lpxhr5/KKemIaa2dvd0Dwe0zqMfKYQo8H/yWraPZJOC9gFNFFONNYgIIC
 2bCk39V856Psrtg==
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

According to the eDP specification (e.g., VESA eDP 1.4b, section 3.3.10.2),
if DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
the sink is required to use the MIN value as the effective bit count.

Some eDP panels report DP_EDP_PWMGEN_BIT_COUNT as 0 while still providing
valid non-zero MIN and MAX capability values. This patch updates the logic
to use the CAP_MIN value in such cases, ensuring correct scaling of AUX-set
backlight brightness values.

This improves compatibility with panels like the Samsung ATNA40YK20 used
on the Lenovo T14s Gen6 (Snapdragon variant with OLED) which report a
bit count of 0 but declares an 11-bit PWM capability range.

Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
Changes in v2:
- Split backlight brightness patch from T14s OLED enablement series.
- Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
- Rework commit message to reference eDP spec.
- Rebase on drm-misc-next.
- Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
---
 drivers/gpu/drm/display/drm_dp_helper.c | 50 ++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index dbce1c3f49691fc687fee2404b723c73d533f23d..0b843d5b634f89f144b62b30311834d118b79ba9 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4083,7 +4083,7 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 {
 	int fxp, fxp_min, fxp_max, fxp_actual, f = 1;
 	int ret;
-	u8 pn, pn_min, pn_max;
+	u8 pn, pn_min, pn_max, bl_caps;
 
 	if (!bl->aux_set)
 		return 0;
@@ -4094,8 +4094,39 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 			    aux->name, ret);
 		return -ENODEV;
 	}
-
 	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
+	if (ret != 1) {
+		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
+			    aux->name, ret);
+		return 0;
+	}
+	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
+	if (ret != 1) {
+		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
+			    aux->name, ret);
+		return 0;
+	}
+	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_ADJUSTMENT_CAP, &bl_caps);
+	if (ret != 1) {
+		bl_caps = 0;
+		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight adjustment cap: %d\n",
+			aux->name, ret);
+	}
+
+	/*
+	 * Some eDP panels report brightness byte count support, but the byte count
+	 * reading is 0 (e.g. Samsung ATNA40YK20) so use pn_min instead.
+	 */
+	if (!pn && (bl_caps & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
+	    && pn_min)
+		pn = pn_min;
+
 	bl->max = (1 << pn) - 1;
 	if (!driver_pwm_freq_hz)
 		return 0;
@@ -4122,21 +4153,6 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 	 * - FxP is within 25% of desired value.
 	 *   Note: 25% is arbitrary value and may need some tweak.
 	 */
-	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
-	if (ret != 1) {
-		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
-			    aux->name, ret);
-		return 0;
-	}
-	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
-	if (ret != 1) {
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
base-commit: ee20c69c789b6cb2179a535cf440d72b98f4a134
change-id: 20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-4020865b6580

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>

