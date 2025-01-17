Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AADB4A14BA2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 09:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1534310EAB3;
	Fri, 17 Jan 2025 08:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LY3AaDc3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9601F10EAB3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:57:49 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30229d5b21cso15996511fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 00:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737104208; x=1737709008; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qb4oveiD4oZ+e9jC2M0t/ZEeRTgoO0cCrmJpAiFB+yY=;
 b=LY3AaDc3o+BgC/ZvoDmBP3j7Lmq0hzqUDJl1H4ajyXzMILX3NGhnvG4Gwx61r+nWS8
 s0hDeEyH1y4SInMJ2YbyLD11h+iEju5Zg1QnR7VKqF6f22xT59wCingybBVC6+J//9//
 D+IgIRXbsMnXnbJ8gG3RMD1jWVcVIcN/1Nt3BhCBkKA74pGGqHG1XmkF0GQGuoyB5Ab7
 Wp+rGBGRfGeWs2wtPebVskO8OkRd7h4j2Q9hb6ueLJ0nYUfvd6ZMSS1nyTgY9WFSPkFi
 rlu8nD9RUyzlkucmg9HA8rf/jUJ3YRq5mRizCKfDiUkmeW2W8RGSTnCUd0H3jll9hTaI
 kuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737104208; x=1737709008;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qb4oveiD4oZ+e9jC2M0t/ZEeRTgoO0cCrmJpAiFB+yY=;
 b=lLeE1L+B5xnQnzdAiUEOfF6O8SUzgWh9SRnNGmUQQ3Li5pf35a+pUTMIuOT90I5wTg
 ZM71By2OUON4ozz28k+BH4zzl8/SabEQFxxlSxZAZ/ENU3Vz0wyL+fLJUqhNuaP8ruSS
 00bEngRa4pF2Dq1qONlq0/GenmtTxkrW2LQHv4OEcI5O0lz500u1f2kVWBvrTdg/aKjf
 8xy6jmC6knS9ewUyzHMz/7ymLIkF4ArXQ9WBVaYKTCjPYUezZ9sOZl0nCp2f7vZuaY2r
 x/gtFGUZbz9I2nviy8vYXMkvmVL39/9OKYzAK+VZAokD2qkkAvPOnH99kUi7Q2Hrh0e/
 Bw/g==
X-Gm-Message-State: AOJu0Yylz/gP4vjRaS17eICYYxrN/FjEpXR+4gQMlz6JQWUq9Q3gzccF
 jHeHUZVtFkFN9hwF/S83JNZZeGdZd9+W5jy77MalSJvvKPfLLPInEIuBMoh9Ue0=
X-Gm-Gg: ASbGnct+HsY1+bkje4OVkyDJ/qWqhRcCt9sdGK2CuCyfz0706N2sxlpJYM1XjHsvbt7
 PSfh19x5NuuXpdPV3iqRAyvH0mNRJDhyhZRazhIlly4qIWBxh40qmSgnWmPlaOTfO2sdSVMY9f1
 T2i13p87QSuOk/pAiLckEGk0cVWEchr8zfzr6fon8/vlXaNrXwWCErwhmMtH61BSX23SsGDNb4j
 bLodHuEuy8IVp2eRv8dWQsf8rjOFU09+DjC2sPLRfUMbQcOEqGVLA8JeWx651m+
X-Google-Smtp-Source: AGHT+IHGuEXzW19VI35ZYAK/BV+vp+JPl/VJ09xT8nIcjmwlimXmjWj10OLnaGc77KW1Pt78sUKcJw==
X-Received: by 2002:a05:651c:10a2:b0:302:251a:bd21 with SMTP id
 38308e7fff4ca-3072cad1ff7mr4228851fa.15.1737104207777; 
 Fri, 17 Jan 2025 00:56:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a330764sm3402101fa.3.2025.01.17.00.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 00:56:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 10:56:38 +0200
Subject: [PATCH RFC 3/7] drm/display: dp: use new DCPD access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-drm-rework-dpcd-access-v1-3-7fc020e04dbc@linaro.org>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=28191;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3e5CVm/XCvd2nGt/RiTkySmCWSQDcr7f0uQKBw6OCCU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnihtFPY0SFxiwxlHBde46VmW/4ukjL4TKTpmlE
 uPyCMgMT0aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4obRQAKCRCLPIo+Aiko
 1cfnB/9klIctPkY4XjppfOwPMExEsE1zR5BN8+TDfaTyrooLGnHfxJEo+/WaEp0lBaqOctG3EYO
 T3t46hXsDTJ2leS6YayOBRMtmREqA+Yt7TjYZ5XXRn/p+uZ96BrncdzEV+lgO+9VS8Q7LURmKTC
 FdXNwzNC4QF9ngjNjz5VzCkWi316D3mRanW/RkEmxDKEv008VHw9SckH3vqHuJ+3OSe1+uaD4X1
 l1y+MDI2YVp0FqPfRMqw5wQmjriCz5lSyR0Vuo20BqjmmIhopo9lpPaPnTM9u/JZIN5cZkqBp09
 l8NiACjuM6wu1ktllgenpQAZPEL9Sybipkkciaix8EjFoOF2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Switch drm_dp_helper.c to use new set of DPCD read / write helpers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 309 ++++++++++++--------------------
 1 file changed, 118 insertions(+), 191 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 5a693f2779284467e2d05b9d8b2c2bee0ad6c112..a6a64e1897e9aec4cf1c0420a909a917e92fdbaf 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -327,7 +327,7 @@ static int __read_delay(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SI
 	if (offset < DP_RECEIVER_CAP_SIZE) {
 		rd_interval = dpcd[offset];
 	} else {
-		if (drm_dp_dpcd_readb(aux, offset, &rd_interval) != 1) {
+		if (drm_dp_dpcd_read_byte(aux, offset, &rd_interval) < 0) {
 			drm_dbg_kms(aux->drm_dev, "%s: failed rd interval read\n",
 				    aux->name);
 			/* arbitrary default delay */
@@ -358,7 +358,7 @@ int drm_dp_128b132b_read_aux_rd_interval(struct drm_dp_aux *aux)
 	int unit;
 	u8 val;
 
-	if (drm_dp_dpcd_readb(aux, DP_128B132B_TRAINING_AUX_RD_INTERVAL, &val) != 1) {
+	if (drm_dp_dpcd_read_byte(aux, DP_128B132B_TRAINING_AUX_RD_INTERVAL, &val) < 0) {
 		drm_err(aux->drm_dev, "%s: failed rd interval read\n",
 			aux->name);
 		/* default to max */
@@ -723,17 +723,8 @@ EXPORT_SYMBOL(drm_dp_dpcd_write_data);
 int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 				 u8 status[DP_LINK_STATUS_SIZE])
 {
-	int ret;
-
-	ret = drm_dp_dpcd_read(aux, DP_LANE0_1_STATUS, status,
-			       DP_LINK_STATUS_SIZE);
-	if (ret < 0)
-		return ret;
-
-	if (ret < DP_LINK_STATUS_SIZE)
-		return -EPROTO;
-
-	return 0;
+	return drm_dp_dpcd_read_data(aux, DP_LANE0_1_STATUS, status,
+				     DP_LINK_STATUS_SIZE);
 }
 EXPORT_SYMBOL(drm_dp_dpcd_read_link_status);
 
@@ -756,30 +747,20 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
 {
 	int ret;
 
-	if (dp_phy == DP_PHY_DPRX) {
-		ret = drm_dp_dpcd_read(aux,
-				       DP_LANE0_1_STATUS,
-				       link_status,
-				       DP_LINK_STATUS_SIZE);
-
-		if (ret < 0)
-			return ret;
+	if (dp_phy == DP_PHY_DPRX)
+		return drm_dp_dpcd_read_data(aux,
+					     DP_LANE0_1_STATUS,
+					     link_status,
+					     DP_LINK_STATUS_SIZE);
 
-		WARN_ON(ret != DP_LINK_STATUS_SIZE);
-
-		return 0;
-	}
-
-	ret = drm_dp_dpcd_read(aux,
-			       DP_LANE0_1_STATUS_PHY_REPEATER(dp_phy),
-			       link_status,
-			       DP_LINK_STATUS_SIZE - 1);
+	ret = drm_dp_dpcd_read_data(aux,
+				    DP_LANE0_1_STATUS_PHY_REPEATER(dp_phy),
+				    link_status,
+				    DP_LINK_STATUS_SIZE - 1);
 
 	if (ret < 0)
 		return ret;
 
-	WARN_ON(ret != DP_LINK_STATUS_SIZE - 1);
-
 	/* Convert the LTTPR to the sink PHY link status layout */
 	memmove(&link_status[DP_SINK_STATUS - DP_LANE0_1_STATUS + 1],
 		&link_status[DP_SINK_STATUS - DP_LANE0_1_STATUS],
@@ -795,7 +776,7 @@ static int read_payload_update_status(struct drm_dp_aux *aux)
 	int ret;
 	u8 status;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
 	if (ret < 0)
 		return ret;
 
@@ -822,21 +803,21 @@ int drm_dp_dpcd_write_payload(struct drm_dp_aux *aux,
 	int ret;
 	int retries = 0;
 
-	drm_dp_dpcd_writeb(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS,
-			   DP_PAYLOAD_TABLE_UPDATED);
+	drm_dp_dpcd_write_byte(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS,
+			       DP_PAYLOAD_TABLE_UPDATED);
 
 	payload_alloc[0] = vcpid;
 	payload_alloc[1] = start_time_slot;
 	payload_alloc[2] = time_slot_count;
 
-	ret = drm_dp_dpcd_write(aux, DP_PAYLOAD_ALLOCATE_SET, payload_alloc, 3);
-	if (ret != 3) {
+	ret = drm_dp_dpcd_write_data(aux, DP_PAYLOAD_ALLOCATE_SET, payload_alloc, 3);
+	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "failed to write payload allocation %d\n", ret);
 		goto fail;
 	}
 
 retry:
-	ret = drm_dp_dpcd_readb(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "failed to read payload table status %d\n", ret);
 		goto fail;
@@ -992,15 +973,15 @@ bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
 {
 	u8 link_edid_read = 0, auto_test_req = 0, test_resp = 0;
 
-	if (drm_dp_dpcd_read(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
-			     &auto_test_req, 1) < 1) {
+	if (drm_dp_dpcd_read_byte(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
+				  &auto_test_req) < 0) {
 		drm_err(aux->drm_dev, "%s: DPCD failed read at register 0x%x\n",
 			aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
 		return false;
 	}
 	auto_test_req &= DP_AUTOMATED_TEST_REQUEST;
 
-	if (drm_dp_dpcd_read(aux, DP_TEST_REQUEST, &link_edid_read, 1) < 1) {
+	if (drm_dp_dpcd_read_byte(aux, DP_TEST_REQUEST, &link_edid_read) < 0) {
 		drm_err(aux->drm_dev, "%s: DPCD failed read at register 0x%x\n",
 			aux->name, DP_TEST_REQUEST);
 		return false;
@@ -1013,23 +994,23 @@ bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
 		return false;
 	}
 
-	if (drm_dp_dpcd_write(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
-			      &auto_test_req, 1) < 1) {
+	if (drm_dp_dpcd_write_byte(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
+				   auto_test_req) < 0) {
 		drm_err(aux->drm_dev, "%s: DPCD failed write at register 0x%x\n",
 			aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
 		return false;
 	}
 
 	/* send back checksum for the last edid extension block data */
-	if (drm_dp_dpcd_write(aux, DP_TEST_EDID_CHECKSUM,
-			      &real_edid_checksum, 1) < 1) {
+	if (drm_dp_dpcd_write_byte(aux, DP_TEST_EDID_CHECKSUM,
+				   real_edid_checksum) < 0) {
 		drm_err(aux->drm_dev, "%s: DPCD failed write at register 0x%x\n",
 			aux->name, DP_TEST_EDID_CHECKSUM);
 		return false;
 	}
 
 	test_resp |= DP_TEST_EDID_CHECKSUM_WRITE;
-	if (drm_dp_dpcd_write(aux, DP_TEST_RESPONSE, &test_resp, 1) < 1) {
+	if (drm_dp_dpcd_write_byte(aux, DP_TEST_RESPONSE, test_resp) < 0) {
 		drm_err(aux->drm_dev, "%s: DPCD failed write at register 0x%x\n",
 			aux->name, DP_TEST_RESPONSE);
 		return false;
@@ -1066,12 +1047,10 @@ static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
 	      DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
 		return 0;
 
-	ret = drm_dp_dpcd_read(aux, DP_DP13_DPCD_REV, &dpcd_ext,
-			       sizeof(dpcd_ext));
+	ret = drm_dp_dpcd_read_data(aux, DP_DP13_DPCD_REV, &dpcd_ext,
+				    sizeof(dpcd_ext));
 	if (ret < 0)
 		return ret;
-	if (ret != sizeof(dpcd_ext))
-		return -EIO;
 
 	if (dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
 		drm_dbg_kms(aux->drm_dev,
@@ -1108,10 +1087,10 @@ int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
 {
 	int ret;
 
-	ret = drm_dp_dpcd_read(aux, DP_DPCD_REV, dpcd, DP_RECEIVER_CAP_SIZE);
+	ret = drm_dp_dpcd_read_data(aux, DP_DPCD_REV, dpcd, DP_RECEIVER_CAP_SIZE);
 	if (ret < 0)
 		return ret;
-	if (ret != DP_RECEIVER_CAP_SIZE || dpcd[DP_DPCD_REV] == 0)
+	if (dpcd[DP_DPCD_REV] == 0)
 		return -EIO;
 
 	ret = drm_dp_read_extended_dpcd_caps(aux, dpcd);
@@ -1161,11 +1140,9 @@ int drm_dp_read_downstream_info(struct drm_dp_aux *aux,
 	if (dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DETAILED_CAP_INFO_AVAILABLE)
 		len *= 4;
 
-	ret = drm_dp_dpcd_read(aux, DP_DOWNSTREAM_PORT_0, downstream_ports, len);
+	ret = drm_dp_dpcd_read_data(aux, DP_DOWNSTREAM_PORT_0, downstream_ports, len);
 	if (ret < 0)
 		return ret;
-	if (ret != len)
-		return -EIO;
 
 	drm_dbg_kms(aux->drm_dev, "%s: DPCD DFP: %*ph\n", aux->name, len, downstream_ports);
 
@@ -1522,7 +1499,7 @@ EXPORT_SYMBOL(drm_dp_downstream_mode);
  */
 int drm_dp_downstream_id(struct drm_dp_aux *aux, char id[6])
 {
-	return drm_dp_dpcd_read(aux, DP_BRANCH_ID, id, 6);
+	return drm_dp_dpcd_read_data(aux, DP_BRANCH_ID, id, 6);
 }
 EXPORT_SYMBOL(drm_dp_downstream_id);
 
@@ -1587,13 +1564,13 @@ void drm_dp_downstream_debug(struct seq_file *m,
 	drm_dp_downstream_id(aux, id);
 	seq_printf(m, "\t\tID: %s\n", id);
 
-	len = drm_dp_dpcd_read(aux, DP_BRANCH_HW_REV, &rev[0], 1);
-	if (len > 0)
+	len = drm_dp_dpcd_read_data(aux, DP_BRANCH_HW_REV, &rev[0], 1);
+	if (!len)
 		seq_printf(m, "\t\tHW: %d.%d\n",
 			   (rev[0] & 0xf0) >> 4, rev[0] & 0xf);
 
-	len = drm_dp_dpcd_read(aux, DP_BRANCH_SW_REV, rev, 2);
-	if (len > 0)
+	len = drm_dp_dpcd_read_data(aux, DP_BRANCH_SW_REV, rev, 2);
+	if (!len)
 		seq_printf(m, "\t\tSW: %d.%d\n", rev[0], rev[1]);
 
 	if (detailed_cap_info) {
@@ -1731,11 +1708,9 @@ int drm_dp_read_sink_count(struct drm_dp_aux *aux)
 	u8 count;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(aux, DP_SINK_COUNT, &count);
+	ret = drm_dp_dpcd_read_byte(aux, DP_SINK_COUNT, &count);
 	if (ret < 0)
 		return ret;
-	if (ret != 1)
-		return -EIO;
 
 	return DP_GET_SINK_COUNT(count);
 }
@@ -2124,13 +2099,13 @@ static int drm_dp_aux_get_crc(struct drm_dp_aux *aux, u8 *crc)
 	u8 buf, count;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(aux, DP_TEST_SINK, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_TEST_SINK, &buf);
 	if (ret < 0)
 		return ret;
 
 	WARN_ON(!(buf & DP_TEST_SINK_START));
 
-	ret = drm_dp_dpcd_readb(aux, DP_TEST_SINK_MISC, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_TEST_SINK_MISC, &buf);
 	if (ret < 0)
 		return ret;
 
@@ -2144,11 +2119,7 @@ static int drm_dp_aux_get_crc(struct drm_dp_aux *aux, u8 *crc)
 	 * At DP_TEST_CRC_R_CR, there's 6 bytes containing CRC data, 2 bytes
 	 * per component (RGB or CrYCb).
 	 */
-	ret = drm_dp_dpcd_read(aux, DP_TEST_CRC_R_CR, crc, 6);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_dpcd_read_data(aux, DP_TEST_CRC_R_CR, crc, 6);
 }
 
 static void drm_dp_aux_crc_work(struct work_struct *work)
@@ -2347,11 +2318,11 @@ int drm_dp_start_crc(struct drm_dp_aux *aux, struct drm_crtc *crtc)
 	u8 buf;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(aux, DP_TEST_SINK, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_TEST_SINK, &buf);
 	if (ret < 0)
 		return ret;
 
-	ret = drm_dp_dpcd_writeb(aux, DP_TEST_SINK, buf | DP_TEST_SINK_START);
+	ret = drm_dp_dpcd_write_byte(aux, DP_TEST_SINK, buf | DP_TEST_SINK_START);
 	if (ret < 0)
 		return ret;
 
@@ -2374,11 +2345,11 @@ int drm_dp_stop_crc(struct drm_dp_aux *aux)
 	u8 buf;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(aux, DP_TEST_SINK, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_TEST_SINK, &buf);
 	if (ret < 0)
 		return ret;
 
-	ret = drm_dp_dpcd_writeb(aux, DP_TEST_SINK, buf & ~DP_TEST_SINK_START);
+	ret = drm_dp_dpcd_write_byte(aux, DP_TEST_SINK, buf & ~DP_TEST_SINK_START);
 	if (ret < 0)
 		return ret;
 
@@ -2464,11 +2435,7 @@ drm_dp_get_quirks(const struct drm_dp_dpcd_ident *ident, bool is_branch)
 static int drm_dp_read_ident(struct drm_dp_aux *aux, unsigned int offset,
 			     struct drm_dp_dpcd_ident *ident)
 {
-	int ret;
-
-	ret = drm_dp_dpcd_read(aux, offset, ident, sizeof(*ident));
-
-	return ret < 0 ? ret : 0;
+	return drm_dp_dpcd_read_data(aux, offset, ident, sizeof(*ident));
 }
 
 static void drm_dp_dump_desc(struct drm_dp_aux *aux,
@@ -2726,13 +2693,11 @@ static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux,
 	int ret;
 
 	for (offset = 0; offset < buf_size; offset += block_size) {
-		ret = drm_dp_dpcd_read(aux,
-				       address + offset,
-				       &buf[offset], block_size);
+		ret = drm_dp_dpcd_read_data(aux,
+					    address + offset,
+					    &buf[offset], block_size);
 		if (ret < 0)
 			return ret;
-
-		WARN_ON(ret != block_size);
 	}
 
 	return 0;
@@ -2886,12 +2851,12 @@ int drm_dp_get_phy_test_pattern(struct drm_dp_aux *aux,
 	int err;
 	u8 rate, lanes;
 
-	err = drm_dp_dpcd_readb(aux, DP_TEST_LINK_RATE, &rate);
+	err = drm_dp_dpcd_read_byte(aux, DP_TEST_LINK_RATE, &rate);
 	if (err < 0)
 		return err;
 	data->link_rate = drm_dp_bw_code_to_link_rate(rate);
 
-	err = drm_dp_dpcd_readb(aux, DP_TEST_LANE_COUNT, &lanes);
+	err = drm_dp_dpcd_read_byte(aux, DP_TEST_LANE_COUNT, &lanes);
 	if (err < 0)
 		return err;
 	data->num_lanes = lanes & DP_MAX_LANE_COUNT_MASK;
@@ -2899,22 +2864,22 @@ int drm_dp_get_phy_test_pattern(struct drm_dp_aux *aux,
 	if (lanes & DP_ENHANCED_FRAME_CAP)
 		data->enhanced_frame_cap = true;
 
-	err = drm_dp_dpcd_readb(aux, DP_PHY_TEST_PATTERN, &data->phy_pattern);
+	err = drm_dp_dpcd_read_byte(aux, DP_PHY_TEST_PATTERN, &data->phy_pattern);
 	if (err < 0)
 		return err;
 
 	switch (data->phy_pattern) {
 	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
-		err = drm_dp_dpcd_read(aux, DP_TEST_80BIT_CUSTOM_PATTERN_7_0,
-				       &data->custom80, sizeof(data->custom80));
+		err = drm_dp_dpcd_read_data(aux, DP_TEST_80BIT_CUSTOM_PATTERN_7_0,
+					    &data->custom80, sizeof(data->custom80));
 		if (err < 0)
 			return err;
 
 		break;
 	case DP_PHY_TEST_PATTERN_CP2520:
-		err = drm_dp_dpcd_read(aux, DP_TEST_HBR2_SCRAMBLER_RESET,
-				       &data->hbr2_reset,
-				       sizeof(data->hbr2_reset));
+		err = drm_dp_dpcd_read_data(aux, DP_TEST_HBR2_SCRAMBLER_RESET,
+					    &data->hbr2_reset,
+					    sizeof(data->hbr2_reset));
 		if (err < 0)
 			return err;
 	}
@@ -2941,15 +2906,15 @@ int drm_dp_set_phy_test_pattern(struct drm_dp_aux *aux,
 	if (dp_rev < 0x12) {
 		test_pattern = (test_pattern << 2) &
 			       DP_LINK_QUAL_PATTERN_11_MASK;
-		err = drm_dp_dpcd_writeb(aux, DP_TRAINING_PATTERN_SET,
-					 test_pattern);
+		err = drm_dp_dpcd_write_byte(aux, DP_TRAINING_PATTERN_SET,
+					     test_pattern);
 		if (err < 0)
 			return err;
 	} else {
 		for (i = 0; i < data->num_lanes; i++) {
-			err = drm_dp_dpcd_writeb(aux,
-						 DP_LINK_QUAL_LANE0_SET + i,
-						 test_pattern);
+			err = drm_dp_dpcd_write_byte(aux,
+						     DP_LINK_QUAL_LANE0_SET + i,
+						     test_pattern);
 			if (err < 0)
 				return err;
 		}
@@ -3156,8 +3121,8 @@ bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_C
 	if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_13)
 		return false;
 
-	if (drm_dp_dpcd_readb(aux, DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1,
-			      &rx_feature) != 1) {
+	if (drm_dp_dpcd_read_byte(aux, DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1,
+				  &rx_feature) < 0) {
 		drm_dbg_dp(aux->drm_dev,
 			   "Failed to read DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1\n");
 		return false;
@@ -3181,7 +3146,7 @@ bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_
 	if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_13)
 		return false;
 
-	if (drm_dp_dpcd_readb(aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature) != 1) {
+	if (drm_dp_dpcd_read_byte(aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature) < 0) {
 		drm_dbg_dp(aux->drm_dev, "failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
 		return false;
 	}
@@ -3312,16 +3277,13 @@ EXPORT_SYMBOL(drm_dp_get_pcon_max_frl_bw);
  */
 int drm_dp_pcon_frl_prepare(struct drm_dp_aux *aux, bool enable_frl_ready_hpd)
 {
-	int ret;
 	u8 buf = DP_PCON_ENABLE_SOURCE_CTL_MODE |
 		 DP_PCON_ENABLE_LINK_FRL_MODE;
 
 	if (enable_frl_ready_hpd)
 		buf |= DP_PCON_ENABLE_HPD_READY;
 
-	ret = drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
-
-	return ret;
+	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
 }
 EXPORT_SYMBOL(drm_dp_pcon_frl_prepare);
 
@@ -3336,7 +3298,7 @@ bool drm_dp_pcon_is_frl_ready(struct drm_dp_aux *aux)
 	int ret;
 	u8 buf;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PCON_HDMI_TX_LINK_STATUS, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PCON_HDMI_TX_LINK_STATUS, &buf);
 	if (ret < 0)
 		return false;
 
@@ -3365,7 +3327,7 @@ int drm_dp_pcon_frl_configure_1(struct drm_dp_aux *aux, int max_frl_gbps,
 	int ret;
 	u8 buf;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PCON_HDMI_LINK_CONFIG_1, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PCON_HDMI_LINK_CONFIG_1, &buf);
 	if (ret < 0)
 		return ret;
 
@@ -3400,11 +3362,7 @@ int drm_dp_pcon_frl_configure_1(struct drm_dp_aux *aux, int max_frl_gbps,
 		return -EINVAL;
 	}
 
-	ret = drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
 }
 EXPORT_SYMBOL(drm_dp_pcon_frl_configure_1);
 
@@ -3430,7 +3388,7 @@ int drm_dp_pcon_frl_configure_2(struct drm_dp_aux *aux, int max_frl_mask,
 	else
 		buf &= ~DP_PCON_FRL_LINK_TRAIN_EXTENDED;
 
-	ret = drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_2, buf);
+	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_2, buf);
 	if (ret < 0)
 		return ret;
 
@@ -3446,13 +3404,7 @@ EXPORT_SYMBOL(drm_dp_pcon_frl_configure_2);
  */
 int drm_dp_pcon_reset_frl_config(struct drm_dp_aux *aux)
 {
-	int ret;
-
-	ret = drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_1, 0x0);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_1, 0x0);
 }
 EXPORT_SYMBOL(drm_dp_pcon_reset_frl_config);
 
@@ -3467,7 +3419,7 @@ int drm_dp_pcon_frl_enable(struct drm_dp_aux *aux)
 	int ret;
 	u8 buf = 0;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PCON_HDMI_LINK_CONFIG_1, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PCON_HDMI_LINK_CONFIG_1, &buf);
 	if (ret < 0)
 		return ret;
 	if (!(buf & DP_PCON_ENABLE_SOURCE_CTL_MODE)) {
@@ -3476,11 +3428,7 @@ int drm_dp_pcon_frl_enable(struct drm_dp_aux *aux)
 		return -EINVAL;
 	}
 	buf |= DP_PCON_ENABLE_HDMI_LINK;
-	ret = drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
 }
 EXPORT_SYMBOL(drm_dp_pcon_frl_enable);
 
@@ -3495,7 +3443,7 @@ bool drm_dp_pcon_hdmi_link_active(struct drm_dp_aux *aux)
 	u8 buf;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PCON_HDMI_TX_LINK_STATUS, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PCON_HDMI_TX_LINK_STATUS, &buf);
 	if (ret < 0)
 		return false;
 
@@ -3520,7 +3468,7 @@ int drm_dp_pcon_hdmi_link_mode(struct drm_dp_aux *aux, u8 *frl_trained_mask)
 	int mode;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PCON_HDMI_POST_FRL_STATUS, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PCON_HDMI_POST_FRL_STATUS, &buf);
 	if (ret < 0)
 		return ret;
 
@@ -3549,7 +3497,7 @@ void drm_dp_pcon_hdmi_frl_link_error_count(struct drm_dp_aux *aux,
 	struct drm_hdmi_info *hdmi = &connector->display_info.hdmi;
 
 	for (i = 0; i < hdmi->max_lanes; i++) {
-		if (drm_dp_dpcd_readb(aux, DP_PCON_HDMI_ERROR_STATUS_LN0 + i, &buf) < 0)
+		if (drm_dp_dpcd_read_byte(aux, DP_PCON_HDMI_ERROR_STATUS_LN0 + i, &buf) < 0)
 			return;
 
 		error_count = buf & DP_PCON_HDMI_ERROR_COUNT_MASK;
@@ -3684,7 +3632,7 @@ int drm_dp_pcon_configure_dsc_enc(struct drm_dp_aux *aux, u8 pps_buf_config)
 	u8 buf;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, &buf);
 	if (ret < 0)
 		return ret;
 
@@ -3695,11 +3643,7 @@ int drm_dp_pcon_configure_dsc_enc(struct drm_dp_aux *aux, u8 pps_buf_config)
 		buf |= pps_buf_config << 2;
 	}
 
-	ret = drm_dp_dpcd_writeb(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, buf);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_dpcd_write_byte(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, buf);
 }
 
 /**
@@ -3711,13 +3655,7 @@ int drm_dp_pcon_configure_dsc_enc(struct drm_dp_aux *aux, u8 pps_buf_config)
  */
 int drm_dp_pcon_pps_default(struct drm_dp_aux *aux)
 {
-	int ret;
-
-	ret = drm_dp_pcon_configure_dsc_enc(aux, DP_PCON_ENC_PPS_OVERRIDE_DISABLED);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_pcon_configure_dsc_enc(aux, DP_PCON_ENC_PPS_OVERRIDE_DISABLED);
 }
 EXPORT_SYMBOL(drm_dp_pcon_pps_default);
 
@@ -3733,15 +3671,11 @@ int drm_dp_pcon_pps_override_buf(struct drm_dp_aux *aux, u8 pps_buf[128])
 {
 	int ret;
 
-	ret = drm_dp_dpcd_write(aux, DP_PCON_HDMI_PPS_OVERRIDE_BASE, &pps_buf, 128);
-	if (ret < 0)
-		return ret;
-
-	ret = drm_dp_pcon_configure_dsc_enc(aux, DP_PCON_ENC_PPS_OVERRIDE_EN_BUFFER);
+	ret = drm_dp_dpcd_write_data(aux, DP_PCON_HDMI_PPS_OVERRIDE_BASE, &pps_buf, 128);
 	if (ret < 0)
 		return ret;
 
-	return 0;
+	return drm_dp_pcon_configure_dsc_enc(aux, DP_PCON_ENC_PPS_OVERRIDE_EN_BUFFER);
 }
 EXPORT_SYMBOL(drm_dp_pcon_pps_override_buf);
 
@@ -3758,21 +3692,17 @@ int drm_dp_pcon_pps_override_param(struct drm_dp_aux *aux, u8 pps_param[6])
 {
 	int ret;
 
-	ret = drm_dp_dpcd_write(aux, DP_PCON_HDMI_PPS_OVRD_SLICE_HEIGHT, &pps_param[0], 2);
+	ret = drm_dp_dpcd_write_data(aux, DP_PCON_HDMI_PPS_OVRD_SLICE_HEIGHT, &pps_param[0], 2);
 	if (ret < 0)
 		return ret;
-	ret = drm_dp_dpcd_write(aux, DP_PCON_HDMI_PPS_OVRD_SLICE_WIDTH, &pps_param[2], 2);
+	ret = drm_dp_dpcd_write_data(aux, DP_PCON_HDMI_PPS_OVRD_SLICE_WIDTH, &pps_param[2], 2);
 	if (ret < 0)
 		return ret;
-	ret = drm_dp_dpcd_write(aux, DP_PCON_HDMI_PPS_OVRD_BPP, &pps_param[4], 2);
+	ret = drm_dp_dpcd_write_data(aux, DP_PCON_HDMI_PPS_OVRD_BPP, &pps_param[4], 2);
 	if (ret < 0)
 		return ret;
 
-	ret = drm_dp_pcon_configure_dsc_enc(aux, DP_PCON_ENC_PPS_OVERRIDE_EN_BUFFER);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_pcon_configure_dsc_enc(aux, DP_PCON_ENC_PPS_OVERRIDE_EN_BUFFER);
 }
 EXPORT_SYMBOL(drm_dp_pcon_pps_override_param);
 
@@ -3788,7 +3718,7 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc)
 	int ret;
 	u8 buf;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, &buf);
 	if (ret < 0)
 		return ret;
 
@@ -3797,11 +3727,7 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc)
 	else
 		buf &= ~DP_CONVERSION_RGB_YCBCR_MASK;
 
-	ret = drm_dp_dpcd_writeb(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, buf);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_dpcd_write_byte(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, buf);
 }
 EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
 
@@ -3833,12 +3759,12 @@ int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_bac
 		buf[0] = level;
 	}
 
-	ret = drm_dp_dpcd_write(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, sizeof(buf));
-	if (ret != sizeof(buf)) {
+	ret = drm_dp_dpcd_write_data(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, sizeof(buf));
+	if (ret < 0) {
 		drm_err(aux->drm_dev,
 			"%s: Failed to write aux backlight level: %d\n",
 			aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	return 0;
@@ -3856,22 +3782,22 @@ drm_edp_backlight_set_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 	if (!bl->aux_enable)
 		return 0;
 
-	ret = drm_dp_dpcd_readb(aux, DP_EDP_DISPLAY_CONTROL_REGISTER, &buf);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_DISPLAY_CONTROL_REGISTER, &buf);
+	if (ret < 0) {
 		drm_err(aux->drm_dev, "%s: Failed to read eDP display control register: %d\n",
 			aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 	if (enable)
 		buf |= DP_EDP_BACKLIGHT_ENABLE;
 	else
 		buf &= ~DP_EDP_BACKLIGHT_ENABLE;
 
-	ret = drm_dp_dpcd_writeb(aux, DP_EDP_DISPLAY_CONTROL_REGISTER, buf);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_write_byte(aux, DP_EDP_DISPLAY_CONTROL_REGISTER, buf);
+	if (ret < 0) {
 		drm_err(aux->drm_dev, "%s: Failed to write eDP display control register: %d\n",
 			aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	return 0;
@@ -3907,15 +3833,16 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 		dpcd_buf = DP_EDP_BACKLIGHT_CONTROL_MODE_PWM;
 
 	if (bl->pwmgen_bit_count) {
-		ret = drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
-		if (ret != 1)
+		ret = drm_dp_dpcd_write_byte(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
+		if (ret < 0)
 			drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux pwmgen bit count: %d\n",
 				    aux->name, ret);
 	}
 
 	if (bl->pwm_freq_pre_divider) {
-		ret = drm_dp_dpcd_writeb(aux, DP_EDP_BACKLIGHT_FREQ_SET, bl->pwm_freq_pre_divider);
-		if (ret != 1)
+		ret = drm_dp_dpcd_write_byte(aux, DP_EDP_BACKLIGHT_FREQ_SET,
+					     bl->pwm_freq_pre_divider);
+		if (ret < 0)
 			drm_dbg_kms(aux->drm_dev,
 				    "%s: Failed to write aux backlight frequency: %d\n",
 				    aux->name, ret);
@@ -3923,8 +3850,8 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 			dpcd_buf |= DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
 	}
 
-	ret = drm_dp_dpcd_writeb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, dpcd_buf);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_write_byte(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, dpcd_buf);
+	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux backlight mode: %d\n",
 			    aux->name, ret);
 		return ret < 0 ? ret : -EIO;
@@ -3979,8 +3906,8 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 	if (!bl->aux_set)
 		return 0;
 
-	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT, &pn);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT, &pn);
+	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap: %d\n",
 			    aux->name, ret);
 		return -ENODEV;
@@ -4013,14 +3940,14 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 	 * - FxP is within 25% of desired value.
 	 *   Note: 25% is arbitrary value and may need some tweak.
 	 */
-	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
+	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
 			    aux->name, ret);
 		return 0;
 	}
-	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
+	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
 			    aux->name, ret);
 		return 0;
@@ -4045,8 +3972,8 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 			break;
 	}
 
-	ret = drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, pn);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_write_byte(aux, DP_EDP_PWMGEN_BIT_COUNT, pn);
+	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux pwmgen bit count: %d\n",
 			    aux->name, ret);
 		return 0;
@@ -4071,8 +3998,8 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 	u8 buf[2];
 	u8 mode_reg;
 
-	ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &mode_reg);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &mode_reg);
+	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight mode: %d\n",
 			    aux->name, ret);
 		return ret < 0 ? ret : -EIO;
@@ -4085,11 +4012,11 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 	if (*current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
 		int size = 1 + bl->lsb_reg_used;
 
-		ret = drm_dp_dpcd_read(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, size);
-		if (ret != size) {
+		ret = drm_dp_dpcd_read_data(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, size);
+		if (ret < 0) {
 			drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight level: %d\n",
 				    aux->name, ret);
-			return ret < 0 ? ret : -EIO;
+			return ret;
 		}
 
 		if (bl->lsb_reg_used)
@@ -4234,8 +4161,8 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
 	if (!panel || !panel->dev || !aux)
 		return -EINVAL;
 
-	ret = drm_dp_dpcd_read(aux, DP_EDP_DPCD_REV, edp_dpcd,
-			       EDP_DISPLAY_CTL_CAP_SIZE);
+	ret = drm_dp_dpcd_read_data(aux, DP_EDP_DPCD_REV, edp_dpcd,
+				    EDP_DISPLAY_CTL_CAP_SIZE);
 	if (ret < 0)
 		return ret;
 

-- 
2.39.5

