Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568506110C8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 14:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6131910E80E;
	Fri, 28 Oct 2022 12:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580B010E0CB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 12:08:24 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z18so2561887edb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J/gtiEXD+8uUkkIaghTv4hrEKAMCKaLjc9YinjxqWWo=;
 b=QRdI1yDkxsMRbomr2xeVl1S3oGNYlV+7UkLhH0STOtOKyee85y7Ty6dnzGe1Da+lbq
 sfK0X4YQCtcNOm1hAwcMFaYmub6S7xhQ8nnXWbQv8eeTIFD2LrZQLAck/03ibM/D7Uff
 RG2H5t3snHFN0LHcC4G2YQywZz88HNuBldWSQLXmuV5hxdCXgD9RFK1nhXzGew2HPyr/
 fJV2YS+uwnyM6X3xvURArmYCef9b1kuK8e5ZBzmSA2WcpoiqFmZa51fUpR72XSZ78Nho
 ZVME3m3JtA2Bb0gAWGl0c5I/DXTy95tkyVOrVpkoszvA2lioFdAMiPWLDoWwaBj3/YkJ
 27Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J/gtiEXD+8uUkkIaghTv4hrEKAMCKaLjc9YinjxqWWo=;
 b=4OqiAsUYyx7gNAppb7Ai7HyVWA9QLopYmVwwuaTKBL/iDZLoUkspg11dmEsQc66QZi
 wIE4TQFSo9LN3akQ3ChofY5I1m6cLNikth9y7CPqxoxith+ZD8NuttTvBag6QIf1y8YR
 9kmmd3eUQnOzVDzCH3Fo8IrxpV5nHmu32asOGqMyXf4QoEV437yyIdDSr7M3QMN/YoB+
 ATA8Gz0ze+9+vs3071lJedR4djCKDkTHu/tdtJN0WcY3RLlEEowMm2sUQ3uAky64Zxc9
 XGAShfuXPeL0BzQ633FhwptFBIejZbMxveonTnifn4RXPp5pj0ApUSKrtlrbqoQx7YZY
 IgYA==
X-Gm-Message-State: ACrzQf2MElzuL4XuigJSXXXBx80MaZ+KPs2OWQ36D18LOAGfbwBwd1ep
 EaU0sOA9VjJsIT9x0teEyvpFvA==
X-Google-Smtp-Source: AMsMyM5WUQDfutYRFNEgV8bjucY7YE+caWuR7DEIYmHISEEGI9x5oGJojJJ1t/FcKDzntjA7yyvUkg==
X-Received: by 2002:a05:6402:348b:b0:45c:b22b:c4a9 with SMTP id
 v11-20020a056402348b00b0045cb22bc4a9mr51712910edc.65.1666958902502; 
 Fri, 28 Oct 2022 05:08:22 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170906124d00b00782e3cf7277sm2067258eja.120.2022.10.28.05.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:08:21 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com
Subject: [PATCH v1 2/9] drm/msm/dpu: Refactor sc7280_pp location
Date: Fri, 28 Oct 2022 14:08:05 +0200
Message-Id: <20221028120812.339100-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028120812.339100-1-robert.foss@linaro.org>
References: <20221028120812.339100-1-robert.foss@linaro.org>
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

The sc7280_pp declaration is not located by the other _pp
declarations, but rather hidden around the _merge_3d
declarations. Let's fix this to avoid confusion.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0239a811d5ec..d0ce7612fee8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1175,6 +1175,13 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 			-1),
 };
 
+static const struct dpu_pingpong_cfg sc7280_pp[] = {
+	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
+};
+
 static struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -1198,13 +1205,6 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
 };
 
-static const struct dpu_pingpong_cfg sc7280_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
-};
-
 /*************************************************************
  * DSC sub blocks config
  *************************************************************/
-- 
2.34.1

