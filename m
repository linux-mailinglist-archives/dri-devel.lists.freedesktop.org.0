Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BFEA70A2E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 20:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E0C10E5E5;
	Tue, 25 Mar 2025 19:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mM19fhk4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100CC10E5DC
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 19:21:47 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43bb6b0b898so58196225e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 12:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742930505; x=1743535305; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GfMUnRKa6FZTnWMdT4iRvYn+H2j4PDg2i8e1Rmjpi6Q=;
 b=mM19fhk49zn0oANY5wc96eG39BTuLPQ+tf/otio2rzkY7O2M1p8amIdfUbJhtSUcDZ
 fQ72nKq3Q/3vE92LEzaj7hLU9NeXxmbbCqOf5WOyekuE7XBKpp08kN+KiDlFv139w5h4
 62BTwVsQ3IA5DLUP+PSB+baQJcajgn0NgnQv/yLcxIN+7v2Fljl3oB8sCvjb6wSY61gQ
 6q59xrvIj9VIAq0MWIgWX8uE0E1uvitADJGspHUm/+Rc2DBNHqrL6GQvtF68Y3dSWkgr
 jwtWkRBkUL9Rioab4IPhJ5ERVDao6CkY83ykI99DEJ8rG0t4ruY1n6DhEXDEXzv/FaAI
 iAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742930505; x=1743535305;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GfMUnRKa6FZTnWMdT4iRvYn+H2j4PDg2i8e1Rmjpi6Q=;
 b=RFyWrPyo+KBjp4oCO30WnBj3X6pqjjfAXjlPDwxjtc0W5vOXR2MyapxPNQEj/MFoPh
 peGC0UbbcJ1c9LtOVfWfEKYeirKu/hBhTqRYUrRsQeS1wQ04C3wL4piZCRWcls2USQVn
 iiAwBHqMGzMyArbY746eR3gJJCxVLYlehhCyX59Jz6LyGh+BnEbo3XsM94+u5BEDWUm4
 /fR0uH4i6O+65ZPYEHnpseqZR+Rk39NzCrINf/eCtX056cZxd00leHFPyVabFBSBYh+9
 TAOvhGCbNiYpOeoLK1trsdcFFMOxLTN6hXdsWXZp2uOYlleH888C0aQE9GRK21wrf2LM
 GhRw==
X-Gm-Message-State: AOJu0Yz/50LNZfBG9Be2P52o0w1CbuBEH2afi48Vmaw4/MF5PAjIxGc4
 EOM6koSVNcxIveShCR5z4bk+6YisTEq5LnynnWPF6jKSHvwJyq7RsQVWX0hSqwo=
X-Gm-Gg: ASbGncvUUcHG4ZDZWJOqjQzxQdGgxPr4bq/Laxj8MaAUraXjn+GAB59NSLNJUSh+cTr
 KWGFYkcRkkkXwKwumSHB8+qcmVGsVORLoc+uY69QBhEe3pjFwvIMgbsn87CKl44uzNMwPa+ID6c
 ILrSZNhRXucDxiND9JF7sJfq1sKDle/gekP4l1M6d58BsqCGkP417vJ7voJaGUTQqBq8b0MOAFJ
 JIN7ZSmtDWBNG8Y3tJScGrbFhjbTZIsps3Q+IWqymAijx/v+cUjoC1eZEcaGGkbM3iKK66SpvFc
 Wni73m/8M4UDQ0V8NDD0o8sYwHwz12VmMZdkFqOR/0KKv4qkqG7uhHuR
X-Google-Smtp-Source: AGHT+IFSJk7sX8ah/jLfo3djxid/LJPIi8rrO/WV4KITHQ/DIuSczuOmd//GwyvtrJBHrFrWDtgXQw==
X-Received: by 2002:a05:600c:138a:b0:43c:f184:2e16 with SMTP id
 5b1f17b1804b1-43d509e3fcdmr171193605e9.5.1742930505522; 
 Tue, 25 Mar 2025 12:21:45 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3997f995a05sm14372870f8f.8.2025.03.25.12.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 12:21:45 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Tue, 25 Mar 2025 19:21:29 +0000
Subject: [PATCH v2 4/4] drm/dp: fallback to maximum when PWM bit count is zero
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org>
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3611;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=mLHtZJFLMF48TiDY/Fyy9ntYtplBGAFzZq4lKzgNgsc=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn4wJFBoQIZRwm4MEfRBT/amOrrbqvY6meAJUGs
 Zzs1ajSUdGJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+MCRQAKCRBjTcTwaHBG
 +NBjEACj/fERHN6R6wNa/Q6CY47brEh3D2ieKKqZBxc1NEsvAR37Zc3L7OdNhHDhO0qX76l2bVz
 0grE7BB4wuc7NzXZ5+fxfu5eq25/rHeM2FyHFx3XDB5Vs6s+FXp4BVh017F7kJEzfZ/lucDeVa6
 +1odcCZkLKkGoV6bNBU1L3xCweb0uF2N4y5P07QWF8fJMPXz6kVXHHTi4STVlWOkua2P3GjQAPz
 CUshB4Vl56YUudtq8tSN694HVj78hy9vtjI9NEPsbVQcYUmETh+lBRT1wotQuj677Snt4faSTye
 10veysIYlYdAe2YbXTsvNQkU7rh5HR9QSP9WCDTKuXBa1dPSVnvr3Q/csL8WrWld3tYod+XTm8W
 ZQINeb2U1/CnzLnpIJmaJBQuUrk5t/avx0W2AfF+HQi3YHjHz0qFfu+DCtOldywK8gQNC4aq3sP
 kSZ9jDk9s4CG4w92Ch6C0YSgXFBbzueiIcz/AgRDFUB4u5H9ov5vK5/Ip4CgY7AYz6VfKwflZs0
 3pS3ZJH32J0AWxp3q3AHo+YM5WWrNgwz2omWAVVhNqEtOHzPACWCLtS42J+JwQF4ipqnLJVooKL
 T2vclFbbcxl0MU+8q8N9KaohCHZm7s6cxFPtBlWrAFirGE77N7HLFAs/1KUgOqxFtq+PXR0wsO0
 vWpEvDkVpx9PB6Q==
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

Some eDP devices report DP_EDP_PWMGEN_BIT_COUNT as 0, but still provide
valid non-zero MIN and MAX values. This patch reworks the logic to
fallback to the max value in such cases, ensuring correct backlight PWM
configuration even when the bit count value is not explicitly set.

This improves compatibility with eDP panels (e.g. Samsung ATNA40YK20
used on the Lenovo T14s Gen6 Snapdragon with OLED panel) which reports
DP_EDP_PWMGEN_BIT_COUNT as 0 but still provides valid non-zero MIN/MAX
values.

Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 51 ++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index da3c8521a7fa7d3c9761377363cdd4b44ab1106e..734b7b8e46394de21837cda6ca1b189413b25cd8 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3964,7 +3964,7 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 {
 	int fxp, fxp_min, fxp_max, fxp_actual, f = 1;
 	int ret;
-	u8 pn, pn_min, pn_max;
+	u8 pn, pn_min, pn_max, bl_caps;
 
 	if (!bl->aux_set)
 		return 0;
@@ -3975,8 +3975,40 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
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
+	 * reading is 0 (e.g. Samsung ATNA40YK20) so in these cases use pn_max
+	 * for pn.
+	 */
+	if (!pn && (bl_caps & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
+	    && pn_max)
+		pn = pn_max;
+
 	bl->max = (1 << pn) - 1;
 	if (!driver_pwm_freq_hz)
 		return 0;
@@ -4003,21 +4035,6 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
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

-- 
2.49.0

