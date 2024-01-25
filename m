Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD2083D03E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 00:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114A210EBAA;
	Thu, 25 Jan 2024 23:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDC310E92E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 23:03:37 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2cf33035d1dso1992701fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 15:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706223755; x=1706828555; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3oS3e08i9+4napyM4Cx2ITHLfZ0NtaHlzp9IZJ5e4DI=;
 b=GRLgVjMAx42+0QknR0boC8MFcI4Bgdfk+TmyfIHi7AlS+xv26DwPsiaiMQc+w8q4a+
 +iaGBQfr18McTyt4Vq6SSEIPoVHx158MnhzWxs1uuYiKVvea4dhH3RPLLgADTgC+3XBG
 vJYM+EIg97+txNL369H2Kd0CCH0qZ9O9ynmruanwMn6R6GbR+WIR9BaDKXZ+4W+SHu/x
 7SSwFIu1UjWVfZotPQUxNcpSm036gyiCgUTVTrK21L94cihH9xQWNlj56gFpagr4CXcm
 ab32q8wwzveZww5QMoIjWO/wP/tKfqxJTDT4XaI6GxrF9OY7gxDgKrsE4+HP6IR2V7Id
 5ufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706223755; x=1706828555;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3oS3e08i9+4napyM4Cx2ITHLfZ0NtaHlzp9IZJ5e4DI=;
 b=BAlaFjX6UxbvSlXr3PjbMBQhMWKV6VwSZBg7dMeOTrDpmva6pqiAhYy9PS3mEoTfqf
 cp88acDP/EfVESPAJJGu7jA0KTZQ+cAwbbfCXJFrkgttX9vJxxyMEOQsu3jhv4C3ku9O
 PDC0+UE7kwgPYhgDt9JmvKlFKMyKFdfnQ2NE3uJy9eQDoTH1viw0X6YwZSrteF3Kdr1S
 DTdYHtg12jOMS1CVLmfrBEosFn2EjBv/oF5pmxrQRDX5bP0OwwjcR269IX2a19lIDnGC
 VpoH604QtGJacmW73UqFiAVAld62ltaXugGV5nl/voJCSWPNJZN/fwAIaA/dNjKhEuJC
 gh7g==
X-Gm-Message-State: AOJu0YzFE9dCz4nSOFjZ2aNLpA6d/qm0E45W+c38RDXjroI6blHKGCWE
 N+7ATCG7s8DztaJAixfPuFVj3hQPpyjU3yH2uiq2KWErf6zKaYnSH3CeZFYMfHY=
X-Google-Smtp-Source: AGHT+IGSPB8nJPFKwB4TbiQzcc+eLmvCB3m7LW7+0Hir4MYc5gEZOJyeud9KXrgGzn4nvRG+ISp0FA==
X-Received: by 2002:a2e:7a16:0:b0:2cf:3144:3a4b with SMTP id
 v22-20020a2e7a16000000b002cf31443a4bmr194281ljc.37.1706223755300; 
 Thu, 25 Jan 2024 15:02:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 15:02:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:02:30 +0200
Subject: [PATCH v3 01/15] drm/msm/dp: drop unused parser definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-1-e2e46f4d390c@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiGYEavyaGfF/CAioPyUcxvN+cLN32AAS7wm
 cOjfDER+M2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLohgAKCRCLPIo+Aiko
 1dJbB/4rFyOynpwtn4Zr+cn5sslHLwkW4VCsC9N+pjY0MLGw/rVZo7hjU59pWMXDQxZEvSZVBD9
 yfamhNXIgzJ8b/huF7eDriTAzij0bI+SWCU6sNYgNHAi1pQjOUXhoml7LEznLOMQog0OFsKe1L0
 2t2C3hEGbXMHPY5Om7fYIWYixyDrFQt2Dr6mCVzQvfhSuXtVs3+UmHmXZgSrcHoxHFFAzXH8G0R
 kJyi1bFZnhFPmFxF2z10KE7FUNWyPaeS+ljPbn+n3rJm5VFZYwBA6oRsLR3VKqv6im+qVqSMt3m
 e1J0sRNLJvsW4OlTo67dLKtwIGvq98CZ3rdSX48ZTkHW/xzx
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

