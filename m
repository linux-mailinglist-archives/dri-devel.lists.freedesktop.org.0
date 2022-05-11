Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD63752408A
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 01:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC26610FFA6;
	Wed, 11 May 2022 23:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E54F10FFA6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 23:07:53 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so3342066pjm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 16:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+h5BGQI49DQhmjTX/s14iEXNSZvSAwC6EupheV291XM=;
 b=Kf6FrMiEHjfjgfJDZBcMBtfwhvrQBGI8YwXYvszIiRGeAevlX/VNGJ7UBEIpS5gcD6
 wIOo7hmnT9KxBUpZCKlhpH/DypcqSV1BTLiOoGqqu+jv06Lni3KphsYn87K1GMHGpgOg
 Wyff30l9oQ6lcC4u6AiQ/D1Wr+0xajD28SwUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+h5BGQI49DQhmjTX/s14iEXNSZvSAwC6EupheV291XM=;
 b=CWnqDji/ugMmUfRqNwzXr4w1V4oBt6eLxMMIVwdK5mEJ6mJae2wZ2LmorFCvP5PH0y
 91WDolmidS/sE4KOd6QXlfkCjIA0iZ7eW+ySVfUeNKZ22FElwsjZDeRTyX6B3/pbBNr+
 uvsZzKvR5HcPKw7cDq+O5slgIslmQZNezF91xdmuczS5jlU6hfXrD06nIvVputs1wNeE
 JZDWn29UZsBB2pXpx9+XsNh/w4vp8Pn0QgF6y4Lo4xdYeCK6vDnE0ar1ReR2KUBvzNGK
 mrxTB63qTZsLHQ43ikyYrI+itmJbrIXKwy441EJvLpuF0CDbj3AXAvIf9UGq7V3TEnf9
 NpAg==
X-Gm-Message-State: AOAM531AzzERMGhQKh5PaeKzJDsgPhfntbGdyRIXKyGZszoPO29eeJ4x
 iZFbC98o61HuMUd4i11kn7FTlg==
X-Google-Smtp-Source: ABdhPJxB2qvIIMgI6yy/IZ+UdmjxpvtVH1PdpeNF88kRVGM0lXOSoqgHygFnKX7NE9n58Hd5f8EwSw==
X-Received: by 2002:a17:90a:b10c:b0:1d9:49de:81c5 with SMTP id
 z12-20020a17090ab10c00b001d949de81c5mr7602112pjq.120.1652310472972; 
 Wed, 11 May 2022 16:07:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:504e:720d:de58:4f66])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a170902714800b0015e8d4eb276sm2398985plm.192.2022.05.11.16.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 16:07:52 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] Revert "FROMGIT: drm/msm/dsi: move DSI host powerup to
 modeset time"
Date: Wed, 11 May 2022 16:07:41 -0700
Message-Id: <20220511160720.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
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
Cc: Matt Turner <msturner@google.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit c7e4a2a72e696aa6aed2c8b651279f491bb096fe.

The patch causes sc7180 Chromebooks that use the parade-ps8640 bridge
chip to fail to turn the display back on after it turns off.

Let's revert to get these devices back to a working state. It seems
like the DSI powerup problem is somewhat common and probably we should
land something more general like Dave Stevenson's series [1] that
would give more flexibility.

[1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com

Fixes: c7e4a2a72e69 ("FROMGIT: drm/msm/dsi: move DSI host powerup to modeset time")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/dsi/dsi_manager.c | 43 ++++++++-------------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 50b987658b1f..8d51711a3417 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -315,12 +315,13 @@ dsi_mgr_connector_best_encoder(struct drm_connector *connector)
 	return msm_dsi_get_encoder(msm_dsi);
 }
 
-static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
+static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 {
 	int id = dsi_mgr_bridge_get_id(bridge);
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
 	struct mipi_dsi_host *host = msm_dsi->host;
+	struct drm_panel *panel = msm_dsi->panel;
 	struct msm_dsi_phy_shared_timings phy_shared_timings[DSI_MAX];
 	bool is_bonded_dsi = IS_BONDED_DSI();
 	int ret;
@@ -361,34 +362,6 @@ static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 	if (is_bonded_dsi && msm_dsi1)
 		msm_dsi_host_enable_irq(msm_dsi1->host);
 
-	return;
-
-host1_on_fail:
-	msm_dsi_host_power_off(host);
-host_on_fail:
-	dsi_mgr_phy_disable(id);
-phy_en_fail:
-	return;
-}
-
-static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
-{
-	int id = dsi_mgr_bridge_get_id(bridge);
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
-	struct mipi_dsi_host *host = msm_dsi->host;
-	struct drm_panel *panel = msm_dsi->panel;
-	bool is_bonded_dsi = IS_BONDED_DSI();
-	int ret;
-
-	DBG("id=%d", id);
-	if (!msm_dsi_device_connected(msm_dsi))
-		return;
-
-	/* Do nothing with the host if it is slave-DSI in case of bonded DSI */
-	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
-		return;
-
 	/* Always call panel functions once, because even for dual panels,
 	 * there is only one drm_panel instance.
 	 */
@@ -423,7 +396,17 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (panel)
 		drm_panel_unprepare(panel);
 panel_prep_fail:
+	msm_dsi_host_disable_irq(host);
+	if (is_bonded_dsi && msm_dsi1)
+		msm_dsi_host_disable_irq(msm_dsi1->host);
 
+	if (is_bonded_dsi && msm_dsi1)
+		msm_dsi_host_power_off(msm_dsi1->host);
+host1_on_fail:
+	msm_dsi_host_power_off(host);
+host_on_fail:
+	dsi_mgr_phy_disable(id);
+phy_en_fail:
 	return;
 }
 
@@ -569,8 +552,6 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
 	msm_dsi_host_set_display_mode(host, adjusted_mode);
 	if (is_bonded_dsi && other_dsi)
 		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
-
-	dsi_mgr_bridge_power_on(bridge);
 }
 
 static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
-- 
2.36.0.550.gb090851708-goog

