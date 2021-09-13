Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7A5409B92
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 19:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32A16ECFA;
	Mon, 13 Sep 2021 17:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A578E6ECFB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 17:58:52 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id b14so8907961qtb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+dSXnhdzjFJXzK51Dmd0hgv8CXCybvAs8AQlMSj0u8Q=;
 b=fd2rUMyFHZ4NlcUEDCMONElMpKRc8TTBfmbo0mL8y/rMv8e6hQBsevVu+s+y2VY7Io
 6kArj9gXsa6hY7t8w8k8nnqiCY6JtwPKyX472lRTizZc+ZJ+D4igrYGx9/jpsDGWscn2
 zbfaEWONF2r1WhqCW5XnT42+f6ZLu5XWnzOXpvDvWJFVdCgg24quHwqFNJOjM5AZQeeg
 G9y0ptvV8VUVpK12Ohpwq1UoTs605h42eA+CGkQ/5JRNrvcR3OIxXU4qJ05rxZE+b45G
 O31qKxIkoR+rymb08PSSSi0a7p8+mkF34OLw/lPl/V4ekjQQX+wdiSU5bOV0Twe/Ufsw
 i5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+dSXnhdzjFJXzK51Dmd0hgv8CXCybvAs8AQlMSj0u8Q=;
 b=6Mu0LtdKiKW02cegqRRX0i761PFTvW87/byIPo3WhgAMudaPNflbUMEIFhpsVgCMHS
 UGVcVFHqNPT1ZjzrPYsQMzdJZ0rgqcvFgknFvzVouMn4g9FtC5befPLgK24RDMBBEBwr
 EK6k3M99goWgVZmQ75wC6DcLIc0i8odTUFjDqYCCM4/NP/nqknA0GhaD5KwdMtSYFO2g
 f+nCANnTgWH5AygL6RoErrB5HDqa/zQFQNlP8AGWj45h+KR36Gp6Uxp2vx2r7nSI3BWe
 3ER5jtmwlFkEKCC0nK6kDXsWXrRorR87vJN4oT+JrQ5Hy1cVUso3RAFhN1ap9O28yrwr
 RaJg==
X-Gm-Message-State: AOAM531gNXos0fEfA9NhgE/+oa9A8PqAdlFPD97o3Or+w35NlD+zEabS
 u76VKkVq2eV6wK9qa+DLuakJ9EZuNf3PrA==
X-Google-Smtp-Source: ABdhPJxyiQcEQoeEl1UqeR8DNMSgLD1602n6j8KYhmuj6B8esO/hM6jJ9/uxYF9ilMRCSDcKK/2opA==
X-Received: by 2002:ac8:5a86:: with SMTP id c6mr759716qtc.171.1631555931619;
 Mon, 13 Sep 2021 10:58:51 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id h2sm6096937qkf.106.2021.09.13.10.58.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Sep 2021 10:58:51 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 13/14] drm/msm: Add hdcp register ranges to sc7180 device tree
Date: Mon, 13 Sep 2021 13:57:44 -0400
Message-Id: <20210913175747.47456-14-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Sean Paul <seanpaul@chromium.org>

This patch adds the register ranges required for HDCP to the sc7180
device tree. These registers will be used to inject HDCP key as well as
toggle HDCP on and off.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 30 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_parser.h |  4 ++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 0519dd3ac3c3..4bbe2485ce3c 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -20,11 +20,19 @@ static const struct dp_regulator_cfg sdm845_dp_reg_cfg = {
 };
 
 static int msm_dss_ioremap(struct platform_device *pdev,
-				struct dss_io_data *io_data)
+				struct dss_io_data *io_data, const char *name,
+				int fallback_idx)
 {
 	struct resource *res = NULL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+
+	/* Support dts which do not have named resources */
+	if (!res) {
+		if (fallback_idx >= 0)
+			res = platform_get_resource(pdev, IORESOURCE_MEM,
+						    fallback_idx);
+	}
 	if (!res) {
 		DRM_ERROR("%pS->%s: msm_dss_get_res failed\n",
 			__builtin_return_address(0), __func__);
@@ -55,6 +63,8 @@ static void dp_parser_unmap_io_resources(struct dp_parser *parser)
 {
 	struct dp_io *io = &parser->io;
 
+	msm_dss_iounmap(&io->hdcp_tz);
+	msm_dss_iounmap(&io->hdcp_key);
 	msm_dss_iounmap(&io->dp_controller);
 }
 
@@ -64,12 +74,26 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	struct platform_device *pdev = parser->pdev;
 	struct dp_io *io = &parser->io;
 
-	rc = msm_dss_ioremap(pdev, &io->dp_controller);
+	rc = msm_dss_ioremap(pdev, &io->dp_controller, "dp_controller", 0);
 	if (rc) {
 		DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
 		goto err;
 	}
 
+	rc = msm_dss_ioremap(pdev, &io->hdcp_key, "hdcp_key", -1);
+	if (rc) {
+		DRM_INFO("unable to remap dp hdcp resources, rc=%d\n", rc);
+		io->hdcp_key.base = NULL;
+		io->hdcp_key.len = 0;
+	}
+
+	rc = msm_dss_ioremap(pdev, &io->hdcp_tz, "hdcp_tz", -1);
+	if (rc) {
+		DRM_INFO("unable to remap dp hdcp resources, rc=%d\n", rc);
+		io->hdcp_tz.base = NULL;
+		io->hdcp_tz.len = 0;
+	}
+
 	io->phy = devm_phy_get(&pdev->dev, "dp");
 	if (IS_ERR(io->phy)) {
 		rc = PTR_ERR(io->phy);
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 34b49628bbaf..09d876620175 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -62,10 +62,14 @@ struct dp_display_data {
  * struct dp_ctrl_resource - controller's IO related data
  *
  * @dp_controller: Display Port controller mapped memory address
+ * @hdcp_key: mapped memory for HDCP key ingestion
+ * @hdcp_tz: mapped memory for HDCP TZ interaction
  * @phy_io: phy's mapped memory address
  */
 struct dp_io {
 	struct dss_io_data dp_controller;
+	struct dss_io_data hdcp_key;
+	struct dss_io_data hdcp_tz;
 	struct phy *phy;
 	union phy_configure_opts phy_opts;
 };
-- 
Sean Paul, Software Engineer, Google / Chromium OS

