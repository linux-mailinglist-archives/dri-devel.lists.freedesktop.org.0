Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0F65500B1
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 01:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A16110E242;
	Fri, 17 Jun 2022 23:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD0610E242
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 23:24:37 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id l18so6169339lje.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 16:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V3CoSuB4D5qInJIqDTgQj0Rw+X+4vfSubGhWpl0S/2Q=;
 b=Z+mW8n/vzz2WwQ8BmJtwxjGoBuU8ju8kzUyG9femrn7n6qDgnDFA3Z+bHo++Qi9POf
 QRc8LwhGzFscD8ICBYEvF7Ny85JNxxMsdz5/JkWnKRtRq2x3ceFvVvyifySutuNuru7J
 7HBho3f8PuULqNWNDdrTg1PAPpChWW2NVVwqvrO8MPCXTEl36y0eUDKNBUL5ar5w6S82
 u1pWLrh/2fOPhGd2BsL85yzo5WCJl4xTZvKrpO2jeRtJucFFfe+R/+86NF1/VGUVH6dj
 /h0JW1tsZk7DgT10xNcwktf8Kes5jdTMvqaGe8mYybdcD9laT4q+MkD5kyILOuV9j3Qa
 msKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V3CoSuB4D5qInJIqDTgQj0Rw+X+4vfSubGhWpl0S/2Q=;
 b=qoBFi+kmIDX+h9VqpeFpl/hQCiO2dq/2Hcf2RzF495dSpvEOdlKPWLc54Rnii1dkkI
 iMWaY7vID24YF/6gHGZ9z21n9O1h8dV0rn8x0mgY1ldA7urJiAIom5FcE4SNgZ8TugR9
 HkzKcrdnZCrzbdk4kaS5RAfG4Iyy+OVwiwZL8GXuhv7R/eGTHWnBv+Pkn+xM4WDgDGK8
 c5bV8t6S7X3Mm4Crh0/xzOWTLtY3UIiUeh4df5ROAHBI0Y3igS7b34DG9biEPmreWE84
 CIr0Yag/eJ5w5CiIVk42emR8BYi8jZwnavkt1ttQe4JkQQTa0p55IxbtAS2Lrrbg0GjB
 2Ozg==
X-Gm-Message-State: AJIora+dSRykSUu5WuNF8mSjhTe/4Jm2RZkNWJbB6/u9xm9WFlhM0nW9
 p7dUlubQwMce+B7GYdS5fy/TUQ==
X-Google-Smtp-Source: AGRyM1v4Kt1s+lv2jMlNJEh5BGzkXvB/hPQ0IvYIrRfGYdlkZA6sSojphvexXEm4aRL63Bp96r/3MA==
X-Received: by 2002:a05:651c:23b:b0:259:fee:cc2a with SMTP id
 z27-20020a05651c023b00b002590feecc2amr6118733ljn.400.1655508275957; 
 Fri, 17 Jun 2022 16:24:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a7-20020a194f47000000b00478f9517a60sm802742lfk.38.2022.06.17.16.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 16:24:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 1/3] drm/msm/dp: remove unused stubs
Date: Sat, 18 Jun 2022 02:24:32 +0300
Message-Id: <20220617232434.1139950-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Refactoring DP code transformed several functions into empty stubs.
Remove them.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 35 -----------------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 08e3f0b1b395..fea610793dc4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -857,11 +857,6 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 	return 0;
 }
 
-static int dp_display_prepare(struct msm_dp *dp_display)
-{
-	return 0;
-}
-
 static int dp_display_enable(struct dp_display_private *dp, u32 data)
 {
 	int rc = 0;
@@ -938,11 +933,6 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 	return 0;
 }
 
-static int dp_display_unprepare(struct msm_dp *dp_display)
-{
-	return 0;
-}
-
 int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 		hdmi_codec_plugged_cb fn, struct device *codec_dev)
 {
@@ -1458,21 +1448,9 @@ static int dp_pm_suspend(struct device *dev)
 	return 0;
 }
 
-static int dp_pm_prepare(struct device *dev)
-{
-	return 0;
-}
-
-static void dp_pm_complete(struct device *dev)
-{
-
-}
-
 static const struct dev_pm_ops dp_pm_ops = {
 	.suspend = dp_pm_suspend,
 	.resume =  dp_pm_resume,
-	.prepare = dp_pm_prepare,
-	.complete = dp_pm_complete,
 };
 
 static struct platform_driver dp_display_driver = {
@@ -1686,13 +1664,6 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 		return;
 	}
 
-	rc = dp_display_prepare(dp);
-	if (rc) {
-		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
-		mutex_unlock(&dp_display->event_mutex);
-		return;
-	}
-
 	state =  dp_display->hpd_state;
 
 	if (state == ST_DISPLAY_OFF) {
@@ -1706,7 +1677,6 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
 		dp_display_disable(dp_display, 0);
-		dp_display_unprepare(dp);
 	}
 
 	/* completed connection */
@@ -1731,7 +1701,6 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
-	int rc = 0;
 	u32 state;
 	struct dp_display_private *dp_display;
 
@@ -1750,10 +1719,6 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 
 	dp_display_disable(dp_display, 0);
 
-	rc = dp_display_unprepare(dp);
-	if (rc)
-		DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
-
 	state =  dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
-- 
2.35.1

