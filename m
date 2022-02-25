Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228834C4E98
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 20:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C0B10E8BA;
	Fri, 25 Feb 2022 19:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B3E10E91E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 19:22:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1645816926; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=7XIgIPMw1xaAU2PGzc80TV+xNkIU5RQN+WvgogiqyWQ=;
 b=dk3ysvxE5KzKOuXmZPQTk9r60aCcDmczJadqMTd/nggIiPYbRvtdJFPFFcFwD/1H7kFkaLtk
 ooLDv30BTaRPUwikDM642ib+AQDDJQTHAFPwzmG1AoreimPa35D+YeUxfAJugom+vvRNti4A
 C0DYIPK6ct95+IdxZT+YBoiIRnw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 62192c5d0f85aa2ea3db431d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Feb 2022 19:22:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D9A10C43616; Fri, 25 Feb 2022 19:22:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F9DCC43619;
 Fri, 25 Feb 2022 19:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4F9DCC43619
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=quicinc.com
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 3/5] drm/msm/a6xx: Add support for 7c3 SKUs
Date: Sat, 26 Feb 2022 00:51:30 +0530
Message-Id: <20220226005021.v2.3.I6e89c014eb17f090f716fba662bdd33073920804@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645816893-22815-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1645816893-22815-1-git-send-email-quic_akhilpo@quicinc.com>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for 7c3 SKU detection using speedbin fuse.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

(no changes since v1)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 17cfad64..f308a3f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1736,6 +1736,18 @@ static u32 a618_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 adreno_7c3_get_speed_bin(u32 fuse)
+{
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 117)
+		return 0;
+	else if (fuse == 190)
+		return 1;
+
+	return UINT_MAX;
+}
+
 static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 {
 	u32 val = UINT_MAX;
@@ -1743,6 +1755,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+		val = adreno_7c3_get_speed_bin(fuse);
+
 	if (val == UINT_MAX) {
 		DRM_DEV_ERROR(dev,
 			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware",
-- 
2.7.4

