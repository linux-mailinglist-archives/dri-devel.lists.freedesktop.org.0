Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B1F478139
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF6C10E19F;
	Fri, 17 Dec 2021 00:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE7610E19F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:25:30 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id q25so1375433oiw.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L42E328JA86n5jcTl+bCP40afiqbeg4RjbZPTUGNIHY=;
 b=dUmlG5lJicYneJ1f4yEHYdYyKPoKaHdY1pi0pCz2Fuu3ZzXkmt21TGoGjJOFA0g6k6
 lmzW0AMB/4b7UjmKfoMqXmq8Qw54qFp2RWwmyRoa7rGZDvnksapDIniclJKk+WZn8rpT
 Pn4QxdZ5bhAKvNK6xwd9gTD5OtBYSm1FT4xCyRYx+g0vLz+YoM2cC5lcM6M9DoYr3adc
 AEpUneOwgwgWTVbE1OT5DBXCmiXiRfq7wQONzdBlY6+bnCseNsdO6jWSewHZrjKNua4p
 vpk22V+D4AyRadLBwVvtsnaBkX4pJfp+pWX6gJzY1Xx5wkOksiJUrOfFVSKbIz1fHY4b
 K6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L42E328JA86n5jcTl+bCP40afiqbeg4RjbZPTUGNIHY=;
 b=ljQUnhYb+FhODdti6RRRBhrJfO78Yvl86ncSxcE2OZAQG5UN5s8UuU+I1q4jlSPVkP
 Qz02qfysTsqSSFJVD60i6yiLNKKj7qteJY2kQSkclzoxSG7wwrPavhrmUaWFSMtDjAOB
 N+xKg+dZoB9sLoezOGb3ytLdJXbJtzP5+LfD3wtbaDS5+ajdF/Qsv9GR5hCPDaeiHP4f
 PSdsK7/PnhYPeWNd4k4MA8C3Blmytwf+oWEBQbLkvKSrPiJyZUAPjMoDJKpn+sv3hEcL
 ucWrZDWD7jwyP4wiiqvT8RcACmou/tOX2/ryga3aUgl3hCUYk7y5xA0Ccdz/hfIhq+Fs
 gSSQ==
X-Gm-Message-State: AOAM533XqqYHO9k4dFoq/dFCCQwHd14x8or2pZqA55A3gbwsN84YRngD
 u/9LWPAn8iHeGxml2dUo/qEMXw==
X-Google-Smtp-Source: ABdhPJyPGUEwkpTisIyEtIxA7AqL5O/rQdW/wl3Fvbfc3dyzLdRWLQEMcLTMMH1LVTJWQU+PHMDjWg==
X-Received: by 2002:aca:c45:: with SMTP id i5mr6384532oiy.176.1639700729402;
 Thu, 16 Dec 2021 16:25:29 -0800 (PST)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t3sm1303905otk.44.2021.12.16.16.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:25:29 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6] drm/msm/dp: Add sc8180x DP controllers
Date: Thu, 16 Dec 2021 16:26:43 -0800
Message-Id: <20211217002643.2305526-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
DP driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v5:
- Dropped DPU hw catalog change from the patch
- Rebased the patch

 drivers/gpu/drm/msm/dp/dp_display.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8d9c19dbf33e..a9f5368559b4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -143,10 +143,21 @@ static const struct msm_dp_config sc7280_dp_cfg = {
 	.num_descs = 2,
 };
 
+static const struct msm_dp_config sc8180x_dp_cfg = {
+	.descs = (const struct msm_dp_desc[]) {
+		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+		[MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+		[MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
+	},
+	.num_descs = 3,
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
 	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },
 	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
+	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
+	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },
 	{}
 };
 
-- 
2.33.1

