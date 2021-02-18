Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B4331F16A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 21:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8256E887;
	Thu, 18 Feb 2021 20:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480D86E887
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 20:55:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613681721; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=1YLiLIzD9r+Pl9WVJiewfNV1c8r/VJFP379oAJmm6Wo=;
 b=MLQxCvB1V+3LSnyGOlEMNvyO5mNclwscAmgPIZ3ioGpTFEP1rIk2hQqzYaxrMXHA8EyfPJnS
 RRAZyZdudSxu13JIjc7TH6hw8xGGJKkgKCYyp+Gi16fj5eRdvENxZZy/Nw1INUK6Gf9a3snc
 fcPbJlpvMylgmuhiAQKBDu6M7e4=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 602ed431f33d74123fd0b9c9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Feb 2021 20:55:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 02DDCC43466; Thu, 18 Feb 2021 20:55:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D76AC43461;
 Thu, 18 Feb 2021 20:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1D76AC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org
Subject: [PATCH v2 2/2] drm/msm/dp: add supported max link rate specified from
 dtsi
Date: Thu, 18 Feb 2021 12:55:04 -0800
Message-Id: <1613681704-12539-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow supported link rate to be limited to the value specified at
dtsi. If it is not specified, then link rate is derived from dpcd
directly. Below are examples,
link-rate = <162000> for max link rate limited at 1.62G
link-rate = <270000> for max link rate limited at 2.7G
link-rate = <540000> for max link rate limited at 5.4G
link-rate = <810000> for max link rate limited at 8.1G

Changes in V2:
-- allow supported max link rate specified from dtsi

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  1 +
 drivers/gpu/drm/msm/dp/dp_panel.c   |  7 ++++---
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
 drivers/gpu/drm/msm/dp/dp_parser.c  | 13 +++++++++++++
 drivers/gpu/drm/msm/dp/dp_parser.h  |  1 +
 5 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5a39da6..f633ba6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -322,6 +322,7 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	struct edid *edid;
 
 	dp->panel->max_dp_lanes = dp->parser->max_dp_lanes;
+	dp->panel->max_link_rate = dp->parser->max_link_rate;
 
 	rc = dp_panel_read_sink_caps(dp->panel, dp->dp_display.connector);
 	if (rc)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 9cc8166..be7f102 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -76,9 +76,10 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 	if (link_info->num_lanes > dp_panel->max_dp_lanes)
 		link_info->num_lanes = dp_panel->max_dp_lanes;
 
-	/* Limit support upto HBR2 until HBR3 support is added */
-	if (link_info->rate >= (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
-		link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
+	/* Limit support of ink rate if specified */
+	if (dp_panel->max_link_rate &&
+			(link_info->rate > dp_panel->max_link_rate))
+		link_info->rate = dp_panel->max_link_rate;
 
 	DRM_DEBUG_DP("version: %d.%d\n", major, minor);
 	DRM_DEBUG_DP("link_rate=%d\n", link_info->rate);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9023e5b..1876f5e 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -51,6 +51,7 @@ struct dp_panel {
 	u32 vic;
 	u32 max_pclk_khz;
 	u32 max_dp_lanes;
+	u32 max_link_rate;
 
 	u32 max_bw_code;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 0519dd3..d8b6898 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -87,6 +87,8 @@ static int dp_parser_misc(struct dp_parser *parser)
 	struct device_node *of_node = parser->pdev->dev.of_node;
 	int len = 0;
 	const char *data_lane_property = "data-lanes";
+	const char *link_rate_property = "link-rate";
+	u32 rate = 0;
 
 	len = of_property_count_elems_of_size(of_node,
 			 data_lane_property, sizeof(u32));
@@ -97,6 +99,17 @@ static int dp_parser_misc(struct dp_parser *parser)
 	}
 
 	parser->max_dp_lanes = len;
+
+	len = of_property_count_elems_of_size(of_node,
+			 link_rate_property, sizeof(u32));
+
+	if (len == 1) {
+		of_property_read_u32_index(of_node,
+				link_rate_property, 0, &rate);
+
+		parser->max_link_rate = rate;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 34b4962..7046fce 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -116,6 +116,7 @@ struct dp_parser {
 	struct dp_display_data disp_data;
 	const struct dp_regulator_cfg *regulator_cfg;
 	u32 max_dp_lanes;
+	u32 max_link_rate;
 
 	int (*parse)(struct dp_parser *parser);
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
