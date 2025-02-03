Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5E8A25782
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 11:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846CC10E481;
	Mon,  3 Feb 2025 10:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fElKCnxl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFDD10E484
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 10:58:23 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-436341f575fso48943465e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 02:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738580301; x=1739185101; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=S2PDrSggs/qvWJ0wmbl57SFwliqss9oSkkJg/zY+uKY=;
 b=fElKCnxl+i3yoAQeL3tKieBNRMAE9OLlg7ET2DEf8jT4UPVC0zo7M6JWOCrH010Tvq
 +uQHMRlhGDmJ3djso0xy8U/pOc+tgMel8ghdRx1AmyQptQFQHoM4j7psLco3Og6tolu0
 3MQ/skq7lStkEKi3hsZMvryj55vkZTkHm0PwNRKdPxE7Ka+l0iwh7VOMOTkfaz0vB+gp
 BHZ7Yfsm2hmUd6Q3VLP7X5qAOM0LUS0ZAsxfAbrQUgjnkZlK0bfka51CHc+32vOr9ssM
 aSL4xIcGt2Lley9FSrHmDlo1jdSURgloi5ZXowp9xcE7UKTm1pRF6BPjN8UPlJILMrX8
 oxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738580301; x=1739185101;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2PDrSggs/qvWJ0wmbl57SFwliqss9oSkkJg/zY+uKY=;
 b=pdNYrakAIYqZtpGRKZpBawyfTJr3GQUbCTUWZSmKXjkVvCgk+Il+HjDZ3TABaa/DVl
 cgNOV40AYM+he8CF31nrOZQO71tRlPUUbJiRVzMGougw01BRwzOnd7k82UpClH9shxGt
 Na4BHefxfml6IKh2pHU6ynBmnqALunEqlgwOA+WCyAH57ye1gCW2zmymnLfyMw0nxXsi
 FXIexWgg1QrT9CbKtZt1py+nV+DcWYsBAAInD5dRbJIAUjZs+/Boc3sldmLBK03Yuhod
 NVfvXz+xxxr1z63jrYVQgz1jJOuNx/PAGtM0j26CQDBUCniXRE1occThLWrqWA4yZfzB
 W20A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAvH6eir0wSPyOQmFLNqg9SRXgnQPMGSoVojxqwskmNlsuXsyJ5hw0aXEV35DmxPUZL4nVLXtJVO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziZ7OQ59hLxSXfkHbC3uz4yky1dUeE/R3brTXPikq2WOwhMQNT
 HjZJxsKZg2mLL82SzAKxRr6ZB3TnUV+fQ/Rw7naqM+aYiuYzBgFQthhWTaTB9mk=
X-Gm-Gg: ASbGncvaxf4YvJSbUi1+hwVaE0QoOsQxyFwR/5oqp8S5ZFrPfi1+JYcWKoJiSc75vRa
 HMZIisIsShPPIqz+1EBg/ZYrCGY2tugAyJsngXprCbRtV3s65kONkLf0LNDgc9rbZcFrXSb2Rur
 +bqPuuB+SIKWeqzTrBi1AEPS6VDNiB9TW0PdeLPyvFLL7jZ1lQkmo0BYoqRZkXfGjjgut3768Kq
 8JVq8L9pdKlMKpOOW4VdQnuePqzVIIUvCmS7jHWEJ37seMFWFqxHPLYRekfuz7QCmW9btJxb2lC
 qsFv6KFKjDoIgnM=
X-Google-Smtp-Source: AGHT+IGN36phU2HT7tCupyKJD12EwPvmQAUkoCX3ifHXulTtaxt/EYCFNMaPrYCZ0Vr2bnElK/dpDg==
X-Received: by 2002:a05:600c:4753:b0:434:f817:4492 with SMTP id
 5b1f17b1804b1-438dc435842mr215585115e9.31.1738580301516; 
 Mon, 03 Feb 2025 02:58:21 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c13a0efsm12555083f8f.60.2025.02.03.02.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 02:58:21 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 03 Feb 2025 12:57:56 +0200
Subject: [PATCH v5 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-1-c865d0e56d6e@linaro.org>
References: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
In-Reply-To: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4430; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=GWDPLjsD/LaP+fD+1LfYD/7l93rcVcvESuGQSIuupYA=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnoKFE89QOXDiWSJro65eII8Rv3UxY8Qc4UyUUI
 531ArtGoZaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ6ChRAAKCRAbX0TJAJUV
 VgtjD/43YCJn+kR3wQvW34kEv7ddETk/bpBbvc+gF6M7mOlHTfHynaAffq939L1AgY2sKs0Ehem
 W3Ql9tbPbR5GPSxwLs+TK6wRt6Gqia8dwDdS+GRPBl8JtMFEI3Hf1Rzs9akUdToFV5BFIaqm1a+
 zZgwAdSycOWeyoVwotoojTFVBH5l9iHVl7xJkcCIMYP+LRke8XLepAW23jcYrjpo0Af3uk2UxZv
 PNigdxWHhIMyubZI1QzE8RoaJFLVEvwiIymaaICaU51PXN4p+651Jgyz5v2Wd/zWAelnH89HFV3
 jhVfTpHgVEx/2ELpV2HjnWApWKO2y3UxalTfbG4z4twC6sR8bj4zoR3e6A4H+tp3ZM/IL++quo6
 toJJwamCFUy0XUFSQm7HY4z1jVrWNvtns4yBm6c+iAXAIIKtoDfgI/XWCrEo514Qyeoba45IovW
 VfyWGZpYEEIKw1TOCGMMdEqUCikLbg9UtID5UCtqGU4oQelo06HWIJCYrvH3cblppwNc5gRacyb
 v2MIbm8qQ4wPv8iltN0OK+XRbanbtcC9N5PbB5x+eX3pswEUz51It3L3cSRY1HGLKuB3w0vDchB
 Kt6XEsCoDVip8OJAOhfAc79z2yz0Xvjz1chZCqg/vNqm06bjUOuQWUYVQRlEh+hX7WVf/Grria5
 86nPpHdX0g3xNrQ==
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
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 61 +++++++++++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  2 ++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index da3c8521a7fa7d3c9761377363cdd4b44ab1106e..ea3ad0fe51c4ce13961f2918cd651ab2d23b4edd 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2817,6 +2817,67 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
 }
 EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
 
+/**
+ * drm_dp_lttpr_set_transparent_mode() - set the LTTPR in transparent mode
+ * @aux: DisplayPort AUX channel
+ * @enable: Enable or disable transparent mode
+ *
+ * Returns: 0 on success or a negative error code on failure.
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
+ * drm_dp_lttpr_init() - init LTTPR transparency mode according to DP standard
+ * @aux: DisplayPort AUX channel
+ * @lttpr_count: Number of LTTPRs. Between 0 and 8, according to DP standard.
+ *               Negative error code for any non-valid number.
+ *               See drm_dp_lttpr_count().
+ *
+ * Returns: 0 on success or a negative error code on failure.
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

