Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA88E68E991
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 09:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D710F10E037;
	Wed,  8 Feb 2023 08:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9349D10E696
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 03:16:10 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id o13so17073552pjg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 19:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asus-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EJ7yIiNmxy2KVInIF+Vk3HIxzGj3yaMUNFlUJEi5vOo=;
 b=SLu+9aAiZzYF2D8KJKMO8rpkSZdQdSZQqjXpu3H/ZhMK4XXfiFeUtjbnFJTnlVR+7J
 qPMCvI2Xtr9393mEfQCBgRmekVdDCueADh3RZ1lebkjMdhclEsuFNJ9H5gJSu/fgcJPT
 8mKL4Vg/+udQkW13jm+SPai42vZrpExHMWQIT7nwKMrOJdcLvDjblzS7R/qwTeE454At
 KvRApNIUm8OEFjI4d99DGfSKFPtaOzZ+qzMqSkJlU4iq9lVKoRNWRy1f49zn0WsRQ75A
 Um/jijaBruK+rNqMSlCPkjD9VYKIxbhRH2FwM6C1hgll4dTNq8DatAmh1quoLEhIsHPX
 pB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EJ7yIiNmxy2KVInIF+Vk3HIxzGj3yaMUNFlUJEi5vOo=;
 b=GEfhQztV3lRrEpDXph1x7Mh0pLdj56R6pUbMgbn5SqSQQqYKitx72s5FV16OuUq4m1
 gJoPmyodsokH3iZBNurM66JlyuvqoIM+qCWQqLwfQKDsfKIxZwurpnINtq19yGA3aMfM
 vTY2CMdqRgqJgd3fJNp0CoTBMpnmA6w5MzST4QUdVW7grV2lqUii12Vu5R/9qVNmjvrB
 SXmZosjgfisE+OgKgG6+2oqPdRGKB4B1stm7E9HzLc5WAl1fqlzsxfJel8Bk9hVU3dxF
 W1j1EtuR5ZsgtCSP2+I5e0cAoJ6eOfXbd+yi6aer4rREMMlw4I3rY7q9lFbZKy3b+joT
 J05A==
X-Gm-Message-State: AO0yUKVieBI5etTcUIE2MSECPhW5W4hhWN9yVWCDW41Q7zNAg3cMPhui
 sZheeHunzi2l31KHgQ28cIoUJg==
X-Google-Smtp-Source: AK7set8kbvLyhrvJRranMQqUl3CTxP3WW9l9AHRwpCxsGAzwowEHQrtRnuxFr0YJ7MDhshRrl/vK1Q==
X-Received: by 2002:a17:902:ca83:b0:198:e39a:b9ca with SMTP id
 v3-20020a170902ca8300b00198e39ab9camr4349240pld.23.1675826170167; 
 Tue, 07 Feb 2023 19:16:10 -0800 (PST)
Received: from ken-ASUS-EXPERTBOOK-B1500CBA-B1500CBA..
 (61-216-65-192.hinet-ip.hinet.net. [61.216.65.192])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a1709027e4400b0019942377f0bsm318860pln.91.2023.02.07.19.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 19:16:09 -0800 (PST)
From: Kencp huang <kencp_huang@asus.corp-partner.google.com>
To: a.hajda@samsung.com, armstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/1] drm/bridge: analogix_dp: add a quirk for Bob panel
Date: Wed,  8 Feb 2023 11:15:19 +0800
Message-Id: <20230208031519.7440-1-kencp_huang@asus.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 Feb 2023 08:09:13 +0000
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
Cc: wzz@rock-chips.com, briannorris@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Kencp huang <kencp_huang@asus.corp-partner.google.com>, kencp_huang@asus.com,
 seanpaul@chromium.org, zyw@rock-chips.com, hoegsberg@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zain wang <wzz@rock-chips.com>

Some panels' DP_PSR_STATUS (DPCD 0x2008) may be unstable when we
enable psr. If we get the unexpected psr state, We need try the
debounce to ensure the panel was in PSR

Signed-off-by: zain wang <wzz@rock-chips.com>
Signed-off-by: Chris Zhong <zyw@rock-chips.com>
Commit-Ready: Kristian H. Kristensen <hoegsberg@chromium.org>
Tested-by: Kristian H. Kristensen <hoegsberg@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@chromium.org>
Tested-by: Kencp huang <kencp_huang@asus.corp-partner.google.com>
Signed-off-by: Kencp huang <kencp_huang@asus.corp-partner.google.com>
---
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 71 +++++++++++--------
 1 file changed, 42 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 6a4f20fccf84..7b6e3f8f85b0 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -935,25 +935,54 @@ void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp)
 	writel(PSR_VID_CRC_ENABLE, dp->reg_base + ANALOGIX_DP_CRC_CON);
 }
 
-static ssize_t analogix_dp_get_psr_status(struct analogix_dp_device *dp)
+static int analogix_dp_get_psr_status(struct analogix_dp_device *dp,
+				      int status)
 {
 	ssize_t val;
-	u8 status;
+	u8 reg, store = 0;
+	int cnt = 0;
+
+	/* About 3ms for a loop */
+	while (cnt < 100) {
+		/* Read operation would takes 900us */
+		val = drm_dp_dpcd_readb(&dp->aux, DP_PSR_STATUS, &reg);
+		if (val < 0) {
+			dev_err(dp->dev, "PSR_STATUS read failed ret=%zd", val);
+			return val;
+		}
+
+		/*
+		 * Ensure the PSR_STATE should go to DP_PSR_SINK_ACTIVE_RFB
+		 * from DP_PSR_SINK_ACTIVE_SINK_SYNCED or
+		 * DP_PSR_SINK_ACTIVE_SRC_SYNCED.
+		 * Otherwise, if we get DP_PSR_SINK_ACTIVE_RFB twice in
+		 * succession, it show the Panel is stable PSR enabled state.
+		 */
+		if (status == DP_PSR_SINK_ACTIVE_RFB) {
+			if ((reg == DP_PSR_SINK_ACTIVE_RFB) &&
+			    ((store == DP_PSR_SINK_ACTIVE_SINK_SYNCED) ||
+			     (store == DP_PSR_SINK_ACTIVE_SRC_SYNCED) ||
+			     (store == DP_PSR_SINK_ACTIVE_RFB)))
+				return 0;
+			else
+				store = reg;
+		} else {
+			if ((reg == DP_PSR_SINK_INACTIVE) ||
+			    (reg == DP_PSR_SINK_ACTIVE_RESYNC))
+				return 0;
+		}
 
-	val = drm_dp_dpcd_readb(&dp->aux, DP_PSR_STATUS, &status);
-	if (val < 0) {
-		dev_err(dp->dev, "PSR_STATUS read failed ret=%zd", val);
-		return val;
+		usleep_range(2100, 2200);
+		cnt++;
 	}
-	return status;
+
+	return -ETIMEDOUT;
 }
 
 int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
 			     struct dp_sdp *vsc, bool blocking)
 {
 	unsigned int val;
-	int ret;
-	ssize_t psr_status;
 
 	/* don't send info frame */
 	val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
@@ -998,26 +1027,10 @@ int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
 	if (!blocking)
 		return 0;
 
-	/*
-	 * db[1]!=0: entering PSR, wait for fully active remote frame buffer.
-	 * db[1]==0: exiting PSR, wait for either
-	 *  (a) ACTIVE_RESYNC - the sink "must display the
-	 *      incoming active frames from the Source device with no visible
-	 *      glitches and/or artifacts", even though timings may still be
-	 *      re-synchronizing; or
-	 *  (b) INACTIVE - the transition is fully complete.
-	 */
-	ret = readx_poll_timeout(analogix_dp_get_psr_status, dp, psr_status,
-		psr_status >= 0 &&
-		((vsc->db[1] && psr_status == DP_PSR_SINK_ACTIVE_RFB) ||
-		(!vsc->db[1] && (psr_status == DP_PSR_SINK_ACTIVE_RESYNC ||
-				 psr_status == DP_PSR_SINK_INACTIVE))),
-		1500, DP_TIMEOUT_PSR_LOOP_MS * 1000);
-	if (ret) {
-		dev_warn(dp->dev, "Failed to apply PSR %d\n", ret);
-		return ret;
-	}
-	return 0;
+	if (vsc->db[1])
+		return analogix_dp_get_psr_status(dp, DP_PSR_SINK_ACTIVE_RFB);
+	else
+		return analogix_dp_get_psr_status(dp, 0);
 }
 
 ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
-- 
2.34.1

