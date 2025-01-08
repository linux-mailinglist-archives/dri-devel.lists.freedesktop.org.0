Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0748A05FEF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 16:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8368F10E8D9;
	Wed,  8 Jan 2025 15:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ajqS98Ul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7386110E8D9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 15:22:54 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5d9837f201aso288958a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 07:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736349713; x=1736954513; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ozxVqcvRkquGhB1kzrDi6yJPiO5kbxqyUPBtpe2sSKE=;
 b=ajqS98UlM27KoNnXDgrvE6MWtz+4Ov8/0PrEXcRGQnAOCXlnQiRRbhlTBiTRi9gX9z
 hgbwOj3iVmURJg8eMcHefqVC102OJMflhsSONRBKtd3OK+jac91V2/EPyARG2F/QI989
 6TI7zgx1fzFF1xK1N0UrrCquktkGpge7HnMf6RshPBicmopXzpp0BELhmdxW8mnMFrfL
 dhcxhB8Wm11I5Ed0msbllLDcrT+7aI7JeQd+vfxsbF98evQMssmHdF6E34KNku1EVvlf
 ZKqJ+AOPcWu1LFstvQ88UjLK/K/HM9twsVYcCfdFm7CUfnLXCVYslIIOZtJEDXHAHLp7
 ZMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736349713; x=1736954513;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ozxVqcvRkquGhB1kzrDi6yJPiO5kbxqyUPBtpe2sSKE=;
 b=L8aGQv+3gd2HxyWfGqa0fHOYnutLtJ8GWr9dw+l5gA0wjNEms2lELm2ZJafsJgWMR7
 Wfo6ffdgW+cutBT5pgtamKZ40rws+6A+CdR9SsEY0V2Yw0QbZWYlnVOFOVcBX7tQnX2N
 Ug9MIyhcCAoKeyKLQ11moBrJMfwtFrI/xL3wlikZADX9d++KKtrgcM2YP6pZZAFgahlx
 SU8fjYYTWVKn5o8PDyIOE5UHyoBSUgWMov6Qrsw6vzvXUamUgkm+StBrOlNgdivqfaNq
 Qpg8xQh6E2vsdE1snnE99AIarTuH89nK5YrPpFQL23Yl6FVcREidqgCi85KHbhpFi6jm
 caEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeGYNQAYuHrhLODsZFyo5z73w63xzLFQmjHJALR8qiawFTtImW0IujXa5pyZ3Mcfo2wXeoe9P1L0c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwN7LeTDz7P2UNKN+aV6tDBH38c8qbKhiT1qFlGBp+yAmu+hVxX
 gT+zMUvLbqFsq40KlPCwiu12MG+HQCJYwfP6FI41ikR+UhoCmX/LJx+FZWTxr7mUWo6q121vTU/
 7
X-Gm-Gg: ASbGncsjGKrzWeGFSjwwS2GwtSdYSgsYijiw+V3Cys22zf9EsORXonGyZQ+iD8ao5GJ
 DbXRaMlFFKPCwSJRmkIUO2IdAurO8cZqsaSQelUuUO+7KD3FlD4LQdRRNKyOVo73PmgfiVzk1L0
 zV+zUzVGpRSQMCQxjAtPBZCP/eZACFP97l+gbCRuIC7NxSwjeAJ9NPqdolTk3Sl/DYoTkONLgt0
 X5J+3OzOOVx2KB3D1OSDfU1SNDGhkJjkLhj1RFQ9UIL9v1SBUZwgQ11
X-Google-Smtp-Source: AGHT+IE3dafdYBKlINfwAnwKDn5hfhG8IPyNYTDRcGz81zuaq/Vi6giz/D+3dnPZVSuuVV/IkiR6dw==
X-Received: by 2002:a5d:64af:0:b0:38a:49c1:8345 with SMTP id
 ffacd0b85a97d-38a7923b926mr6118668f8f.18.1736346725277; 
 Wed, 08 Jan 2025 06:32:05 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e89e14sm22741445e9.33.2025.01.08.06.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:32:04 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 08 Jan 2025 16:31:43 +0200
Subject: [PATCH v4 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-1-918949bc2e3a@linaro.org>
References: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
In-Reply-To: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=hQr/IAsgI391eMqAJ/TFfPR5pzoBg71o+SfYOehGuXo=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnfoxc1Tokb8M+VMMDW1j0rqVaD8jJ1LEA0bvc3
 9bB3X1npsGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ36MXAAKCRAbX0TJAJUV
 Vj8MD/9mF1N+AQ0FRE4H9Xg7TXqo3McbsRtCf7si0ZpOt7ze90eWbuEii7Dc/ThErOHA5jI9By+
 QuRcu9XJH9msZIDKlvFhl2zqTjxYFzu6JXTniUreJZQSgJLFoMKli88oYIDW9iiszIGP61Hri/h
 ri4s86DL8DLaoLtLn14nrgGwypGy0NAzCImgX46Iit6MqD12XFnK6gS4NqHVx5cpN8lTfHpweGt
 aViYrMxF7oxe4+zusH4OXtVyckGUnXxLyY6q55x1tDXRiZty17Nr4xnFpyNNQ7HH6oJcvh83ZHZ
 rO13MvjyDK+4st6XxUsansLCP54YUl3JB3OuHPAxjdvyUBGD74CkUP+2efjq4Xw5N4E1EHibsG8
 82Umkwl1EVBjhQyezcWALqxadrQrRcVxmaArM0hoEdM7rhkrCbSQkXluUeBFLgGNpBsRTkQcnXP
 dLk7dBL9XW955AxT1H1sapcj/b5tLvjwxUkWiq93CA9tJ82RPrMH6hS+qmekUlhqYP+6FoshiUb
 UznOay6J6WDxjyDIZwNeyS2Z8xPEOoHYoW1GRgaCetzJml8MxpK8kWfIXHj0ezVOr7GvErHlWLY
 gIo/tf9Vw9dVtrwKNWOlhnLpHfuxrb6+v62zFpkXRP8ra8KSudsu9ZY+ZMzSE8J5Gu/eC4Fh3RB
 U33EKNfD8tibPTA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

According to the DisplayPort standard, LTTPRs have two operating
modes:
 - non-transparent - it replies to DPCD LTTPR field specific AUX
   requests, while passes through all other AUX requests
 - transparent - it passes through all AUX requests.

Switching between this two modes is done by the DPTX by issuing
an AUX write to the DPCD PHY_REPEATER_MODE register.

Add a generic helper that allows switching between these modes.

Also add a generic wrapper for the helper that handles the explicit
disabling of non-transparent mode and its disable->enable sequence
mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
to move this handling out of the vendor specific driver implementation
into the generic framework.

Tested-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 62 +++++++++++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  2 ++
 2 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index da3c8521a7fa7d3c9761377363cdd4b44ab1106e..fa7eff94d408718a1762834597f0cd51376d2596 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2817,6 +2817,68 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
 }
 EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
 
+/**
+ * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
+ * @aux: DisplayPort AUX channel
+ * @enable: Enable or disable transparent mode
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
+{
+	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
+			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
+	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
+
+	if (ret < 0)
+		return ret;
+
+	return (ret == 1) ? 0 : -EIO;
+}
+EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
+
+/**
+ * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
+ *
+ * @aux: DisplayPort AUX channel
+ * @lttpr_count: Number of LTTPRs. Between 0 and 8, according to DP standard.
+ *               Negative error code for any non-valid number.
+ *               See drm_dp_lttpr_count().
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
+{
+	int ret;
+
+	if (!lttpr_count)
+		return 0;
+
+	/*
+	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
+	 * non-transparent mode and the disable->enable non-transparent mode
+	 * sequence.
+	 */
+	ret = drm_dp_lttpr_set_transparent_mode(aux, true);
+	if (ret)
+		return ret;
+
+	if (lttpr_count < 0)
+		return -ENODEV;
+
+	if (drm_dp_lttpr_set_transparent_mode(aux, false)) {
+		/*
+		 * Roll-back to transparent mode if setting non-transparent
+		 * mode has failed
+		 */
+		drm_dp_lttpr_set_transparent_mode(aux, true);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_lttpr_init);
+
 /**
  * drm_dp_lttpr_max_lane_count - get the maximum lane count supported by all LTTPRs
  * @caps: LTTPR common capabilities
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 8f4054a560396a43750570a8c2e95624039ab8ad..3311df3b58255cf0620391d0948ccf6b569a8a34 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -630,6 +630,8 @@ int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
 			       u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 int drm_dp_lttpr_count(const u8 cap[DP_LTTPR_COMMON_CAP_SIZE]);
 int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
+int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable);
+int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count);
 int drm_dp_lttpr_max_lane_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
 bool drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);

-- 
2.34.1

