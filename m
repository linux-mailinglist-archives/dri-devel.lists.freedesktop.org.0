Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CE44C4FEF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 21:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF88410E970;
	Fri, 25 Feb 2022 20:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB9E10E969;
 Fri, 25 Feb 2022 20:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645821981; x=1677357981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=edj4a5Fb5FkXS85XEW8rDGfe9Ngg7piSQ1t876oLoyY=;
 b=yyfAbNm8PcSB0B8WSgzhRCOzNAqNZurRhyANQeNrHvdF06mBTVoFag1C
 6upfaAPC04T3yZjvBjCucU1xPWqtI9lSWmA8hMBVnAMDlwhs2cc6X5ceA
 bjoRHIt4l++gEODQBrNZmG0EFyswxBv5mDtsuPe0eavqdbpgtnTc1eLyA 0=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 25 Feb 2022 12:46:21 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:46:20 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 12:46:20 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 12:46:19 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH v11 2/4] drm/msm/dpu: replace BIT(x) with correspond marco
 define string
Date: Fri, 25 Feb 2022 12:45:55 -0800
Message-ID: <1645821957-22633-4-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645821957-22633-1-git-send-email-quic_khsieh@quicinc.com>
References: <1645821957-22633-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To improve code readability, this patch replace BIT(x) with
correspond register bit define string

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 284f561..c2cd185 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -60,6 +60,12 @@
 
 #define   INTF_MUX                      0x25C
 
+#define INTF_CFG_ACTIVE_H_EN	BIT(29)
+#define INTF_CFG_ACTIVE_V_EN	BIT(30)
+
+#define INTF_CFG2_DATABUS_WIDEN	BIT(0)
+#define INTF_CFG2_DATA_HCTL_EN	BIT(4)
+
 static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
 		const struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -130,13 +136,13 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 
 	if (active_h_end) {
 		active_hctl = (active_h_end << 16) | active_h_start;
-		intf_cfg |= BIT(29);	/* ACTIVE_H_ENABLE */
+		intf_cfg |= INTF_CFG_ACTIVE_H_EN;
 	} else {
 		active_hctl = 0;
 	}
 
 	if (active_v_end)
-		intf_cfg |= BIT(30); /* ACTIVE_V_ENABLE */
+		intf_cfg |= INTF_CFG_ACTIVE_V_EN;
 
 	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
@@ -182,7 +188,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 				(0x21 << 8));
 
 	if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
-		intf_cfg2 |= BIT(4);
+		intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
 		display_data_hctl = display_hctl;
 		DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
 		DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

