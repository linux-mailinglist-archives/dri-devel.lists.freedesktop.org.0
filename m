Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD93191EB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 19:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3D96E48C;
	Thu, 11 Feb 2021 18:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB546E48C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 18:11:03 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id u20so6117309qku.7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 10:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFjJmq0Au97vKEfgrOVE/VaVkFx8gpBh2nvbd9qF3qo=;
 b=oLsfKtdBHgllepKJH+vCG8ut+yPBNLBuIoJxElvlb/FuPzcilauZ/SmNL6X5o5UsRt
 7kgMYEisLa3F6ekLvZS0hKkit4uEnWNYGoZN51/8t6V7wRzntCT08ZURW8fVnqtINRDe
 GCEE1RwttUoNIuzNv/9nLugzzoGR5F3XOdhjCbBX5EWpoiiQMBcC5+LYFm3JFd9WaVBJ
 BgEdSnczRdO8p/cG0vx3NHGkZS61JVd4N+YdbVLA8Zhbdk8HDY1QEUfUOXv+/KTde2HV
 ZWwZwRdcbZRinUwpKnkckinczIHGV1qs+/yejTNURBpRBDvNgfKZ/y93LNfsNWS83m6y
 ogNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VFjJmq0Au97vKEfgrOVE/VaVkFx8gpBh2nvbd9qF3qo=;
 b=f0tvRa4Nszhditu2TArDldvk1/mjqXvnaWNoCznkFiYl7y2ECffl0te7tGBBrLrgOX
 vPRFVdf0TTCoRQvZqid80VBU0LGVYG5eBxQ/PLPb9cGrnTg8cpF2t/TYqA+53if/QE6B
 VXxpFqiZMSpuIgDQPQXJ1qm6w7uZahZrUZEepbwFDFOXcopMcfJbT345jHQianhOPM/Q
 3Qtydr1MuH5KR7vStSzEyUIdB1nvx1dKKBAMAeKMpBFHZu89d1eKyXFA/xgC+OBWS0tT
 NRUoIG+6ZhrmEi6ShfCf1U5Vz3CXT38a7FrT8sXmuH6WfMECMGs+qmO4piOMrt3Zt43v
 KzjA==
X-Gm-Message-State: AOAM530PH3L9Y7h+eHcmFDVG319LtJBP0k3tx/b1oZHF+FcgwQxkmD9m
 +LMQszewLVq3SWfb0/sziwTy5g==
X-Google-Smtp-Source: ABdhPJwGeYIMl8RtZKOdfKhuiF+eJt//mE53X4FrP9+Ds8+LpqwJVfthU5hhps7b9Knm+Ahd3Dorvg==
X-Received: by 2002:a05:620a:1315:: with SMTP id
 o21mr7456372qkj.3.1613067061549; 
 Thu, 11 Feb 2021 10:11:01 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id 11sm4615412qkm.25.2021.02.11.10.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 10:11:01 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] drm/msm: add compatibles for sm8150/sm8250 display
Date: Thu, 11 Feb 2021 13:09:58 -0500
Message-Id: <20210211181002.22922-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210211181002.22922-1-jonathan@marek.ca>
References: <20210211181002.22922-1-jonathan@marek.ca>
MIME-Version: 1.0
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Tanmay Shah <tanmay@codeaurora.org>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, tongtiangen <tongtiangen@huawei.com>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver already has support for sm8150/sm8250, but the compatibles were
never added.

Also inverse the non-mdp4 condition in add_display_components() to avoid
having to check every new compatible in the condition.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c               | 2 ++
 drivers/gpu/drm/msm/msm_drv.c                         | 6 +++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index 551ae26f60da..5763f43200a0 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
 
 MDSS:
 Required properties:
-- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
+- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss", "qcom,sm8150-mdss", "qcom,sm8250-mdss"
 - reg: physical base address and length of contoller's registers.
 - reg-names: register region names. The following region is required:
   * "mdss"
@@ -41,7 +41,7 @@ Optional properties:
 
 MDP:
 Required properties:
-- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
+- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu", "qcom,sm8150-dpu", "qcom,sm8250-dpu"
 - reg: physical base address and length of controller's registers.
 - reg-names : register region names. The following region is required:
   * "mdp"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5a8e3e1fc48c..fff12a4c8bfc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1219,6 +1219,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
 static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sdm845-dpu", },
 	{ .compatible = "qcom,sc7180-dpu", },
+	{ .compatible = "qcom,sm8150-dpu", },
+	{ .compatible = "qcom,sm8250-dpu", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dpu_dt_match);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 94525ac76d4e..928f13d4bfbc 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1185,9 +1185,7 @@ static int add_display_components(struct device *dev,
 	 * Populate the children devices, find the MDP5/DPU node, and then add
 	 * the interfaces to our components list.
 	 */
-	if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
-	    of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
-	    of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
+	if (!of_device_is_compatible(dev->of_node, "qcom,mdp4")) {
 		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 		if (ret) {
 			DRM_DEV_ERROR(dev, "failed to populate children devices\n");
@@ -1320,6 +1318,8 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
 	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
 	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
