Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC8254FDDA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 21:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5EA10FA26;
	Fri, 17 Jun 2022 19:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0EB10F747
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 19:49:25 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i29so8407609lfp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 12:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fSnYvcOuCiamnP9Z5uioqN+dnNbuGPozK0YcZA0yw7k=;
 b=O/L/3n1L4LiDtAaNQwitcfon+MtLonwl235pPq+SHbqRU5FO/IIftavNfH4qij99f0
 H57NflJWuDwG7bl0n16yfRM6TWlPnejy4z21nIBznJgwxEMGVq1WNsGYiX99BwgJHwyN
 OScWjDH/2ZJTOUpSvtf05wR3JQdJE+Vj/IlV7O0woIFvL5MNkz0mzPO914lMpSqYXUTv
 l8Kxi1/Aygjqwyxa1iHHvQNquigUqTSm1Szq97TAWfQ79jBL2VaBQnixenHE7iCEUwGF
 ooqQJygHkb2M4H1/9CRxNQTwMwOaRtakYsls3DOWi/KgxaZ+utt7IZyvdkicDpQWrPcp
 Zqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fSnYvcOuCiamnP9Z5uioqN+dnNbuGPozK0YcZA0yw7k=;
 b=ARqCSPT80H8Y1zXV+JAa8YdHjDRMNgXCbYOZ46kn7078s8mq8NET3IPpSEMJliOIBx
 n0yCJmPK0FzlfV77qWVl+Mc/IH+nFdZcwDNsMyYw/u5nCQWEcyTlFa/TUAL1fkyn3o+v
 xCWN6isIwLJIhQgjN2xSueCdjGwdgrNmswyJ6VcvcKl2BvQ/9nmLYuqBYUZtNZrAO53R
 c9JBctvf1WTtn78Pb3ecO9X+mDuIhQeIGsbKahIQi67R4UmPMlw16FKh00UUXFvBJdPM
 4DY0/3LIu+SLqLvX7VY4gGUJzXUACSVofb9GjgI0HPhtgPpQfXXeGKtPPw7Inq0+RwMt
 S8ew==
X-Gm-Message-State: AJIora8st4ooNwg9YOXMxw3Yx+urqnbZrjP/RPDHaeqVVYY/EwaVOIiR
 rqcuouCVex2Fp0MK+yx4fcaVWw==
X-Google-Smtp-Source: AGRyM1tPjB5/2OmOaXLxaLnLZSh/Doi8HeyHN4bAnQLWHQTTzWYTZwD7MFV9tZasuL1AvlniMnRgBA==
X-Received: by 2002:ac2:5ec8:0:b0:47d:af0b:d631 with SMTP id
 d8-20020ac25ec8000000b0047daf0bd631mr6443929lfq.170.1655495364105; 
 Fri, 17 Jun 2022 12:49:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([95.161.222.60])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a056512328c00b0047255d211bbsm738987lfe.234.2022.06.17.12.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 12:49:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/2] drm/msm/dp: remove dp_display_en/disable prototypes and
 data argument
Date: Fri, 17 Jun 2022 22:49:21 +0300
Message-Id: <20220617194921.1098725-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org>
References: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org>
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

Remove unused dp_display_en/disable prototypes. While we are at it,
remove extra 'data' argument that is unused.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1e34ac2126f6..42ceb4c5796c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -607,9 +607,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	return 0;
 };
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data);
-static int dp_display_disable(struct dp_display_private *dp, u32 data);
-
 static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
 		bool plugged)
 {
@@ -856,7 +853,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 	return 0;
 }
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data)
+static int dp_display_enable(struct dp_display_private *dp)
 {
 	int rc = 0;
 	struct msm_dp *dp_display = &dp->dp_display;
@@ -893,7 +890,7 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 	return 0;
 }
 
-static int dp_display_disable(struct dp_display_private *dp, u32 data)
+static int dp_display_disable(struct dp_display_private *dp)
 {
 	struct msm_dp *dp_display = &dp->dp_display;
 
@@ -1667,12 +1664,12 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	if (state == ST_DISPLAY_OFF)
 		dp_display_host_phy_init(dp_display);
 
-	dp_display_enable(dp_display, 0);
+	dp_display_enable(dp_display);
 
 	rc = dp_display_post_enable(dp);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		dp_display_disable(dp_display, 0);
+		dp_display_disable(dp_display);
 	}
 
 	/* manual kick off plug event to train link */
@@ -1717,7 +1714,7 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 		return;
 	}
 
-	dp_display_disable(dp_display, 0);
+	dp_display_disable(dp_display);
 
 	state =  dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
-- 
2.35.1

