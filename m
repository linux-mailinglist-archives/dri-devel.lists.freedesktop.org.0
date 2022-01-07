Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489CF487018
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 03:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B7910EDCE;
	Fri,  7 Jan 2022 02:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192A510EDB5
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 02:01:42 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h7so10283266lfu.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 18:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OHbsyEqfteS19OgRRcOzHQJayCE7Kspad11GnKSJ9XY=;
 b=XSClUiDypO5YErliO//FA6YKgZb1nKZcX4VYG3rMZJ39C3UsrGP+GpaRA6Z6h2qM+v
 GIbLcKHSdf5qY+XBsm0rkxj44+wzTQbt0vwSKBH/5DPNzRVzKVIx3ePwCND5L+txbZCg
 tSc+0sSjh2zNu8nDsdElL4GeIXixf9Ewlg8lXNB8riuFuRUR8cPIfWXKKNr5DmZs8Eud
 cJBO8Ev3OU2uHU0690cM92iFddrIMJx9SrPFqAKKx6N/Q+xv3TkTlIaF2gXWgSCy+Bq8
 YuR8JTWcVb5ZGRstoDj8m0YKFILxR8lVSBIybfVjWLWQozpK85LuFqMKhZYqM03OZh9K
 0Akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OHbsyEqfteS19OgRRcOzHQJayCE7Kspad11GnKSJ9XY=;
 b=qGX9t9MRWUobyP/Fx+odYFwDlbcZYlONFeGonNnpxtoc92gbQ6SLhps+iqRelrgV6d
 84xiLSQaH7k5kUTXjBAf9RpGK8kV0R+Am2unuxXucztmU9teENcdhqSI4soOoX92PrQv
 FTACuJdkWf6iwn8i4rar247EZpJ/C1Tg4thSAGUwUKDUXNWOTjIC4DlRBiMxxbyKFwKH
 uIzmFOfjQe7B8HSTUkmfGCNOug6JPA/9JUXFeo4q5E2lSjA7EtsjIGq4l/ltT/Uck7E8
 Y1uigiHAmS393/3Tn8Wr0dpJdaE/MQpoqUx6wXLTpBp4eR8d1EQlgY0Ts7vPCYmZBDlL
 Jelw==
X-Gm-Message-State: AOAM531iY4FBPujntHzZo9qq4fn+HbanajVenyA5edkIf9+8pgh/RyUe
 smUAxBkgCw1m0l5bP6CZWCykayWh0ST2Ng==
X-Google-Smtp-Source: ABdhPJxWuoABGW1szvhXbVPJleMmIshIUx7TC2kgz2wI6G4TwBcxecCnri+QDRzjYAmY8GBjTv7t6w==
X-Received: by 2002:a05:6512:2149:: with SMTP id
 s9mr53882517lfr.96.1641520900476; 
 Thu, 06 Jan 2022 18:01:40 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w12sm382837lfe.256.2022.01.06.18.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 18:01:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [RFC PATCH 6/7] drm/msm/dp: remove dp_display_en/disable prototypes
 and data argument
Date: Fri,  7 Jan 2022 05:01:31 +0300
Message-Id: <20220107020132.587811-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
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

Remove unused dp_display_en/disable prototypes. While we are at it,
remove extra 'data' argument that is unused.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e63d6056e39d..720e80ea99cb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -559,9 +559,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	return 0;
 };
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data);
-static int dp_display_disable(struct dp_display_private *dp, u32 data);
-
 static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
 {
 	u32 state;
@@ -841,7 +838,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 	return 0;
 }
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data)
+static int dp_display_enable(struct dp_display_private *dp)
 {
 	int rc = 0;
 	struct msm_dp *dp_display = &dp->dp_display;
@@ -878,7 +875,7 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 	return 0;
 }
 
-static int dp_display_disable(struct dp_display_private *dp, u32 data)
+static int dp_display_disable(struct dp_display_private *dp)
 {
 	struct msm_dp *dp_display = &dp->dp_display;
 
@@ -1548,12 +1545,12 @@ static void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	if (state == ST_DISPLAY_OFF)
 		dp_display_host_init(dp_display, true);
 
-	dp_display_enable(dp_display, 0);
+	dp_display_enable(dp_display);
 
 	rc = dp_display_post_enable(dp);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		dp_display_disable(dp_display, 0);
+		dp_display_disable(dp_display);
 	}
 
 	/* manual kick off plug event to train link */
@@ -1591,7 +1588,7 @@ static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 	/* stop sentinel checking */
 	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
 
-	dp_display_disable(dp_display, 0);
+	dp_display_disable(dp_display);
 
 	state =  dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
-- 
2.34.1

