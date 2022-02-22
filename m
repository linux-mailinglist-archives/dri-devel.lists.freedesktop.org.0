Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 156084BF20C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 07:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E9010EF4E;
	Tue, 22 Feb 2022 06:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7993A10EF41
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 06:22:54 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id j15so22711811lfe.11
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 22:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iM+9d1vlrH8gvtpIKyDvBZU+m+WcrI9EbVXkjqnwrgU=;
 b=jpGdL2UWzg/HKSOtVLZnndwPDPtVWzbb/QNHcN8zho5Y4LDCr6KGRRmZM1LjG6NEDY
 JqmJeTejQukUyQGDA/TWOzev/9JOJU5/DGz2EpyXttNZDomlw9luYuOahhTVUDvPBTYL
 MaZb+lHFrE7aj9PKwD5qN3a8tgkzWQa9MHgCVQyi3fUxfiY1ScQBxWTbK7R8iv0ALLHD
 8jrPCcI9OzfYNrYyr/PyC0P1xA2vEbufk887wsdKkDQA6oHSCj3ZJu2CHd9eydQAnmiW
 cmxImIEI6Y0qWMdGJAOw9fBHJkagYwdTyhVhRfp8rXrTKnpnk74wCD/YWowxVPCcl+ls
 V0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iM+9d1vlrH8gvtpIKyDvBZU+m+WcrI9EbVXkjqnwrgU=;
 b=oRPXA+idQI3fnv2Q48JUKWOXe+TFq/Tr6kYMA9qNwLkWuPondAfVAEE08xogERgntp
 04+x9K2RTjLKUV5y3HXCDICVhahH4C7nej6tv7U2o1NRo4A5X2sWbaPhKu19rSbqwNCS
 ohjokV+Y3VKDXtG6ywMxOn+Zx39vlOdMp/iNk9VEl1x6dmfHEpqPO2WE/vhIMfvm5gbu
 eaQsk8UY4+WOrs2VmfPUncZC49nvMM4DLdUVL+U5/RsQw9RHCxWvNfQWmBzxxubD93Dz
 OgAChvFXlcd+2wW5qT4XxiIVGlAtvZbyXXSihIbg7pqOK3r4kOzjNSWh5fvu8GcRkEZv
 BOCw==
X-Gm-Message-State: AOAM530bYjNjpkDBMHmHX0cCwosa0m3I/n5N0qygAdhXXC0OsDwal01m
 MUb3O/2YbMOP6L2RIlIUr8AivQ==
X-Google-Smtp-Source: ABdhPJzGc5/AYdPbOPH3yazzGj2gw4n70PKZg3iu2vcQFrpdXtOfIZtRtK2lwEwAqOAfSpt9NBsT+Q==
X-Received: by 2002:a05:6512:3e0e:b0:443:3cba:9e26 with SMTP id
 i14-20020a0565123e0e00b004433cba9e26mr16341176lfv.590.1645510972828; 
 Mon, 21 Feb 2022 22:22:52 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.65.160])
 by smtp.gmail.com with ESMTPSA id j24sm1216245lfb.59.2022.02.21.22.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 22:22:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 4/4] drm/msm/dpu: drop INTF_EDP from interface type conditions
Date: Tue, 22 Feb 2022 09:22:46 +0300
Message-Id: <20220222062246.242577-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To remove possible confusion between (old) INTF_EDP and newer INTF_DP,
stop using INTF_EDP in DPU's code. Until the 8x74/8x84 SoCs are
supported by DPU driver, there is no point in using INTF_EDP.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 478a608ba7f2..e76d240f554d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -92,8 +92,7 @@ static void drm_mode_to_intf_timing_params(
 	}
 
 	/* for DP/EDP, Shift timings to align it to bottom right */
-	if ((phys_enc->hw_intf->cap->type == INTF_DP) ||
-		(phys_enc->hw_intf->cap->type == INTF_EDP)) {
+	if (phys_enc->hw_intf->cap->type == INTF_DP) {
 		timing->h_back_porch += timing->h_front_porch;
 		timing->h_front_porch = 0;
 		timing->v_back_porch += timing->v_front_porch;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 116e2b5b1a90..1548614c508b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -141,7 +141,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 
-	if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP) {
+	if (ctx->cap->type == INTF_DP) {
 		active_h_start = hsync_start_x;
 		active_h_end = active_h_start + p->xres - 1;
 		active_v_start = display_v_start;
-- 
2.34.1

