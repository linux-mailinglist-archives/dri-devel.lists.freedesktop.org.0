Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD1582093B
	for <lists+dri-devel@lfdr.de>; Sun, 31 Dec 2023 01:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E86610E04A;
	Sun, 31 Dec 2023 00:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1E610E04A
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Dec 2023 00:43:58 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50e7e55c0f6so4730418e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Dec 2023 16:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703983437; x=1704588237; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3oS3e08i9+4napyM4Cx2ITHLfZ0NtaHlzp9IZJ5e4DI=;
 b=qTc9FexcP0mwKsZ+uptbYnIpDuLTGnZeI0Vnt0nWsnn/Z/WUXWJKwRXnHY1nVV6HMJ
 IUJSU7YCCl9nEQ729J9rWiIXuXTb2hh1Io8vEs0Lj9tdWHLoJ7lXWmrszztmtLveqJHw
 pKIvbpWHFNrl2ebZ5zgLV1mITl3ycMQnUAFW4V/dponhMGRa9/zwJJGleWo392b0Ynjj
 94z0wi3vzOy622qxISIbthum1ws74oNVm/vqi0hXDEwZwJCUaftXb2pYTnWi0bOZy0PY
 nw/kyDPDL/8lNZNdXr4y4VL3Z7PAxZrX9oOzRu59ccHn1XTSE+8GDuIlevkC1jdv83R+
 TgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703983437; x=1704588237;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3oS3e08i9+4napyM4Cx2ITHLfZ0NtaHlzp9IZJ5e4DI=;
 b=Y+FhAoaWnQvavsODQsDoZDSOrEu1bRWXWM5MbJBNZhyP5qjcZ68LdYKquDFAN/xkMA
 Wxi8vzngXo3Nw0gF16D20kgFkcjldieUrfFiTE+srHLBd4UfweCW7VLsyS7dMCOkzlN6
 wOqkDQJbZpct9e0ysfUcBE4SdjmkrGJvSTPjqYLr04VGfmbOXhPkXMWD1lwbLmhl4ph2
 XvqBUUUpkRMHcNwc07ojhsiqR1VfMnkBS9MC8TQe7M8vwMsFw1xJ0GhHc867lHrnC/p0
 +UBTzygOwKNnHLBmfpIx1HTQb6AnDVdxIupcXn1Rb1wg+2S0vkJkaXLnAk5CyPJ5EhhU
 GwQg==
X-Gm-Message-State: AOJu0Yx2fZJnIi3B+fjn/EhVeFL0psN0E2UWW3BRjDZFjqsumQCfL03X
 RMrFx9w7n0NcqQq0QMq9KX3/TP0M5cl0lA==
X-Google-Smtp-Source: AGHT+IG/BQ6GApy4H/SeCJffIMC1S1kURQGtN4k5+GaCdaX81KwQ4RajZwmthCVAOZU1lksWe59Oag==
X-Received: by 2002:ac2:4245:0:b0:50e:7e38:6e09 with SMTP id
 m5-20020ac24245000000b0050e7e386e09mr1639786lfl.192.1703983437145; 
 Sat, 30 Dec 2023 16:43:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 16:43:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 02:43:48 +0200
Subject: [PATCH v2 01/15] drm/msm/dp: drop unused parser definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-dp-power-parser-cleanup-v2-1-fc3e902a6f5b@linaro.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yVyRmmNda9mfXwPWksVdLkO9SsjdUAzlZBACGcKQbRg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkLlJxDusX/Mwxoi5Za1T0xN6tZBtKSS46fvKj
 rES0TQ+n66JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZC5SQAKCRCLPIo+Aiko
 1eZ3B/wPO1Rh++PAEXQawRFR2VwvctoM9Rzvn8dCISWUeFJz1zWbzPN/xFw3qtzU4v+syJ+ZZjK
 GLjFkyYfL1j2TrBpYuu6UywJJmAqy1TXzY1d6osF9ioPaRNW43UHcAvMMm/KfmDDAvfnlmiSif5
 qHdFbNcbL9gQd71SnrA6uy1QBI2deU8TBfW4Z9YJveUBH1AeXOFqAPPD2YxiiF+Lb020lRdvE6p
 lohRtzNcD+QBHk3rIxFfGEo405nZAfCDoNUKw/Roec/DWv3FtmngQl3n9CnWrUO36w4X8EOUHgv
 XCjLDS3RNZdTTFGzTKHpBoJ/k4cjTriRR3ZbJN6s8YwmgoYM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop several unused and obsolete definitions from the dp_parser module.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_parser.h | 46 --------------------------------------
 1 file changed, 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 1f068626d445..90a2cdbbe344 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -12,7 +12,6 @@
 
 #include "msm_drv.h"
 
-#define DP_LABEL "MDSS DP DISPLAY"
 #define DP_MAX_PIXEL_CLK_KHZ	675000
 #define DP_MAX_NUM_DP_LANES	4
 #define DP_LINK_RATE_HBR2	540000 /* kbytes */
@@ -21,7 +20,6 @@ enum dp_pm_type {
 	DP_CORE_PM,
 	DP_CTRL_PM,
 	DP_STREAM_PM,
-	DP_PHY_PM,
 	DP_MAX_PM
 };
 
@@ -43,28 +41,10 @@ static inline const char *dp_parser_pm_name(enum dp_pm_type module)
 	case DP_CORE_PM:	return "DP_CORE_PM";
 	case DP_CTRL_PM:	return "DP_CTRL_PM";
 	case DP_STREAM_PM:	return "DP_STREAM_PM";
-	case DP_PHY_PM:		return "DP_PHY_PM";
 	default:		return "???";
 	}
 }
 
-/**
- * struct dp_display_data  - display related device tree data.
- *
- * @ctrl_node: referece to controller device
- * @phy_node:  reference to phy device
- * @is_active: is the controller currently active
- * @name: name of the display
- * @display_type: type of the display
- */
-struct dp_display_data {
-	struct device_node *ctrl_node;
-	struct device_node *phy_node;
-	bool is_active;
-	const char *name;
-	const char *display_type;
-};
-
 /**
  * struct dp_ctrl_resource - controller's IO related data
  *
@@ -77,28 +57,6 @@ struct dp_io {
 	union phy_configure_opts phy_opts;
 };
 
-/**
- * struct dp_pinctrl - DP's pin control
- *
- * @pin: pin-controller's instance
- * @state_active: active state pin control
- * @state_hpd_active: hpd active state pin control
- * @state_suspend: suspend state pin control
- */
-struct dp_pinctrl {
-	struct pinctrl *pin;
-	struct pinctrl_state *state_active;
-	struct pinctrl_state *state_hpd_active;
-	struct pinctrl_state *state_suspend;
-};
-
-/* Regulators for DP devices */
-struct dp_reg_entry {
-	char name[32];
-	int enable_load;
-	int disable_load;
-};
-
 struct dss_module_power {
 	unsigned int num_clk;
 	struct clk_bulk_data *clocks;
@@ -109,16 +67,12 @@ struct dss_module_power {
  *
  * @pdev: platform data of the client
  * @mp: gpio, regulator and clock related data
- * @pinctrl: pin-control related data
- * @disp_data: controller's display related data
  * @parse: function to be called by client to parse device tree.
  */
 struct dp_parser {
 	struct platform_device *pdev;
 	struct dss_module_power mp[DP_MAX_PM];
-	struct dp_pinctrl pinctrl;
 	struct dp_io io;
-	struct dp_display_data disp_data;
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;
 	struct drm_bridge *next_bridge;

-- 
2.39.2

