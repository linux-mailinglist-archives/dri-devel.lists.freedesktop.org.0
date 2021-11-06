Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F2C446F52
	for <lists+dri-devel@lfdr.de>; Sat,  6 Nov 2021 18:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D1B6E199;
	Sat,  6 Nov 2021 17:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C216EABE
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Nov 2021 17:21:09 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id o4so20082878oia.10
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Nov 2021 10:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vTSLEwZ2lTdgm04aqi8C+KVIKM9ISYcIdJi5xTJQmDQ=;
 b=TM7HT/3kUvCVkyIyxqrla2bPoXwiNaUgVa/rkdmDjclsBlQ+MF4cgYeM/LlxxQn+u+
 Upxm0KHjHAlzeiGcjmD3wX0/bO2011j3SFBKR+42KzRtu3rUHR486mXtat3EwEIQLY5O
 xB5EJZNBvZHyQap3cH0THKAk/lKVH3CLTC/c2HSCGZBqt6vc6Dn//I+0ydBVp/BrFWgv
 8KpLjGyF3Ozozmncwwdp2w9H5NjqlVxTFPofh5Hfo7RiO99fV3XnkB2PN8voK5dB71ik
 jlwRhUwFz+mvHuqzHdqZI64R6e/1wCRhpaOuvqeibUZLnmp+SQ9JSFe6+Mz0OQxOzpUU
 7nvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vTSLEwZ2lTdgm04aqi8C+KVIKM9ISYcIdJi5xTJQmDQ=;
 b=LdHww02I8cr42rgEFK/Zg5HtpTRC/HKevB91zVBp1rvBBsOOr1prJ7xebMvMhqB/eR
 UaglULvviEJ9SEcD+c1eLpLYOQHiAqHafA1MQfYBXrPe9Q7CQ1kZiMDh8Rh0Zkaz+Vcv
 fnswRKRVlV/Od9Qou8EjJf9pzxXakAw6TJ8YvAFxKMthbZ+R4wmxI8rD/80tfRMwQcjE
 quPu9jasTwZlVAsTCsMWzQP/gUiAtZ/6EpxSrbu0papRC1ZWNndnfKbRUka9NRQUHagZ
 b4QWYCb2pxUJURgEgISHbO4a5WszN7xPbRXvFQUTVsZ9rIimPvWTrTXuaX+k4W8S0kkk
 TLMA==
X-Gm-Message-State: AOAM530x3QrEGDghjMpxTJsbWOXD3HUVJu+RvLtdG4K4EcgmaEPFz8y0
 JIqiXUdFUDSMuLkt76ETmR7c8A==
X-Google-Smtp-Source: ABdhPJwqV+YJ+7OmqgyefLnoB9WNSGrGUryYUqJWPS8f6XLyzo2xKmxNbd/mkUmHKL02UYGvTeOrxw==
X-Received: by 2002:a05:6808:1897:: with SMTP id
 bi23mr6223384oib.111.1636219268707; 
 Sat, 06 Nov 2021 10:21:08 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 64sm3905304otm.37.2021.11.06.10.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 10:21:08 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/msm/dp: Drop now unused hpd_high member
Date: Sat,  6 Nov 2021 10:22:46 -0700
Message-Id: <20211106172246.2597431-1-bjorn.andersson@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since '8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon
Chipsets")' the hpd_high member of struct dp_usbpd has been write-only.

Let's clean up the code a little bit by removing the writes as well.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
 drivers/gpu/drm/msm/dp/dp_hpd.c     | 2 --
 drivers/gpu/drm/msm/dp/dp_hpd.h     | 2 --
 3 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aba8aa47ed76..70177c0d6a37 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -522,11 +522,8 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 
 	dp->hpd_state = ST_CONNECT_PENDING;
 
-	hpd->hpd_high = 1;
-
 	ret = dp_display_usbpd_configure_cb(&dp->pdev->dev);
 	if (ret) {	/* link train failed */
-		hpd->hpd_high = 0;
 		dp->hpd_state = ST_DISCONNECTED;
 
 		if (ret == -ECONNRESET) { /* cable unplugged */
@@ -603,7 +600,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 		/* triggered by irq_hdp with sink_count = 0 */
 		if (dp->link->sink_count == 0) {
 			dp_ctrl_off_phy(dp->ctrl);
-			hpd->hpd_high = 0;
 			dp->core_initialized = false;
 		}
 		mutex_unlock(&dp->event_mutex);
@@ -627,8 +623,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	/* disable HPD plug interrupts */
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
 
-	hpd->hpd_high = 0;
-
 	/*
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
index e1c90fa47411..db98a1d431eb 100644
--- a/drivers/gpu/drm/msm/dp/dp_hpd.c
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.c
@@ -32,8 +32,6 @@ int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
 	hpd_priv = container_of(dp_usbpd, struct dp_hpd_private,
 					dp_usbpd);
 
-	dp_usbpd->hpd_high = hpd;
-
 	if (!hpd_priv->dp_cb || !hpd_priv->dp_cb->configure
 				|| !hpd_priv->dp_cb->disconnect) {
 		pr_err("hpd dp_cb not initialized\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.h b/drivers/gpu/drm/msm/dp/dp_hpd.h
index 5bc5bb64680f..8feec5aa5027 100644
--- a/drivers/gpu/drm/msm/dp/dp_hpd.h
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.h
@@ -26,7 +26,6 @@ enum plug_orientation {
  * @multi_func: multi-function preferred
  * @usb_config_req: request to switch to usb
  * @exit_dp_mode: request exit from displayport mode
- * @hpd_high: Hot Plug Detect signal is high.
  * @hpd_irq: Change in the status since last message
  * @alt_mode_cfg_done: bool to specify alt mode status
  * @debug_en: bool to specify debug mode
@@ -39,7 +38,6 @@ struct dp_usbpd {
 	bool multi_func;
 	bool usb_config_req;
 	bool exit_dp_mode;
-	bool hpd_high;
 	bool hpd_irq;
 	bool alt_mode_cfg_done;
 	bool debug_en;
-- 
2.33.1

