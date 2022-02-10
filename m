Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17414B0C8B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893C710E816;
	Thu, 10 Feb 2022 11:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB70810E815;
 Thu, 10 Feb 2022 11:41:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1DBEE61D12;
 Thu, 10 Feb 2022 11:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C632EC004E1;
 Thu, 10 Feb 2022 11:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644493275;
 bh=YX1gi59/HZbFW3O0Wnmg+lqGfVhLTyza+iIoN+OkqZ4=;
 h=From:To:Cc:Subject:Date:From;
 b=WdhEQGRtOpRhyZ6JWVwUVoJSQt9Imap+QU8DPJgQYnD4UI6NkPC67iN6XW2w4X4zx
 sRcVtwhOm9l3tiEY6pMPQlccFPEDowvg7IVRhr1hTosIlbhx0RZR6Jc21emXLIX7KY
 XCjFH6rdRXbkuSQVEii+16t3UZk3uWOPbmBz2dcPsjtIwfsa66vLxkxdwvOi8nMCbS
 aN4h77DFeEsc+PMnpyxGgfGQZzAn0a8zKoiJZtrEBK6v8mXBJvShV++3j1pbL2zItX
 6FhW2VjPqdwm2xjlFNP8oPu04Cfn5eT88xdnXL2UynMZ9jwKj69rKFpOQ9cJwKrw9p
 JmVgwIN2YxCBw==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 1/3] drm/msm/dpu: Remove set but unused variables
Date: Thu, 10 Feb 2022 17:11:04 +0530
Message-Id: <20220210114106.290669-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Guenter Roeck <linux@roeck-us.net>, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We get warning:

In function ‘dpu_encoder_virt_enable’: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1145:33:
warning: variable ‘priv’ set but not used [-Wunused-but-set-variable]
 1145 |         struct msm_drm_private *priv;

In function ‘dpu_encoder_virt_disable’: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1182:33:
warning: variable ‘priv’ set but not used [-Wunused-but-set-variable]
 1182 |         struct msm_drm_private *priv;

Remove these unused but set variables

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1e648db439f9..132844801e92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1142,14 +1142,12 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int ret = 0;
-	struct msm_drm_private *priv;
 	struct drm_display_mode *cur_mode = NULL;
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
 	mutex_lock(&dpu_enc->enc_lock);
 	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
-	priv = drm_enc->dev->dev_private;
 
 	trace_dpu_enc_enable(DRMID(drm_enc), cur_mode->hdisplay,
 			     cur_mode->vdisplay);
@@ -1179,7 +1177,6 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
-	struct msm_drm_private *priv;
 	int i = 0;
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
@@ -1188,8 +1185,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	mutex_lock(&dpu_enc->enc_lock);
 	dpu_enc->enabled = false;
 
-	priv = drm_enc->dev->dev_private;
-
 	trace_dpu_enc_disable(DRMID(drm_enc));
 
 	/* wait for idle */
-- 
2.31.1

