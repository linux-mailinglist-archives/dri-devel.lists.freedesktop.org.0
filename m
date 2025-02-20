Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E0DA3D609
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A6B10E907;
	Thu, 20 Feb 2025 10:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HofWaUyZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEC610E907
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:08:37 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2fc4418c0e1so3159518a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740046116; x=1740650916; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kSkCVd5LUxAUyX9NrstLbvjZXotPNfmdtqi1iMTXbDI=;
 b=HofWaUyZQpmeX2z9jwMu6ZC3+A8PE8ruTkQHqGgGgeNks+ebUHeZXfjIUNmwCEpiHe
 GCtbv3li5VdzEhu6OQiGoCBWlqGIh542iYwqbKW5TCU7RlDZ41pqMMyFXoH056S1Q9t6
 FIrHrmC36eXBKFon2pGbRQpiI9amEq81l2HrwTywoqDBhXxlWo++kM3IbuIVXtaDWXVc
 igqYpS0I8SJOR5BXCgOul/MpQNyAbkZ7+TFtqfTObDe3pB27xT/SeufjU6TrjCs4zST6
 0SfoGV06skXj7QeklMI9lOGnpcpbTtFsPVMWPDA4zw5z3jcfhagO5NZHBAUMeJKDyKHF
 +j0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740046116; x=1740650916;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kSkCVd5LUxAUyX9NrstLbvjZXotPNfmdtqi1iMTXbDI=;
 b=EJLSnU9+GozQ3rGwHKWSWUFYciQx0NI1qlKdyqhPQ95Y+OmAE3FDnM9h6LNpP44Qha
 PkzcZhDpcp3q6hY/cMhpe674ZWg15Vc00OoXNAked5sWDZsHlGsfkXhYaHPrUsAq7e/3
 qQlQf+01IOXxk2RgsAIwg1zomPYC8mFo5VHpHoQOwkuvFPY53Br1rmCmsZ/+nU1kgRiu
 LypaVl6/8sFmX1IoqyRqaeBMbK6H6cciZ5X7TLm2mQoN/YD2YLLUItUk9+oJQXz3+/aG
 h1XYWmxGHcZwrTsguaunwEVL8JG4ARwqvLsvKLFGnHw3SDDJ4GaZRjsAUxDcg7tajqiH
 FNUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWePliiGv5VND77ZfgEABqXvqtwU77sUkXZLjihEMFOljXzOS6+LKkuDhBPxn18llBciHs0Kbj7XIk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYHFLfFeSEc7T2G61+xxNJo30FPYQB2/H1Z5cq101eJvLMht/1
 jGdF+z3rqHuNeKQaWLmOz5Ll5nYCTMtJ4ODKFYuDkUFaVN7+ScOcpJSIrB3jwu4=
X-Gm-Gg: ASbGncvs7c5oJhIpnkIEEPrI5Y/DnndAlDdTLgDXivs4szRK4DpMHJCQEecklw4KLc3
 0On8fcmcDHn2bsfgaahhg1Bjy4acChxhzzeuLAX3gt6J0ozLhtAXUyIDEbPwablZNMoSsNJ83PE
 yrVSYeNvnuXbeSZgus1x/T4eP9OW33rXMH/x8DlS80g12Cm+WsxZ0PxCYcj9I74N31cJHc1+ADC
 3q4QUoMZlUQIyx9S/34uMFypo/eSz/hYrweMhNgpo2PofwRv7q5hdAYCVseslp5nD2aVpO/GU3G
 rSGf/vIFNGe3
X-Google-Smtp-Source: AGHT+IFzj/xwznLXRFqC+C83ybLhwwV/mxtSKzwSxHqW0v9brMeQgIoHXZpn1wk268OK+8d2OehMSQ==
X-Received: by 2002:a17:90b:53c3:b0:2fa:176e:9705 with SMTP id
 98e67ed59e1d1-2fccc15a991mr4563107a91.10.1740046116545; 
 Thu, 20 Feb 2025 02:08:36 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fbf98b3305sm15304645a91.6.2025.02.20.02.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:08:36 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 20 Feb 2025 18:07:54 +0800
Subject: [PATCH v2 3/5] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dual-dsi-v2-3-6c0038d5a2ef@linaro.org>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
In-Reply-To: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>, 
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740046076; l=3811;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=y1LcRbi9IxHrfqru+iB9M02tuGxZS/RP9o/BqRSO94c=;
 b=TVJ9dgwDkjUei05ilR8Ttmo9k48qbl/iKLv9heTWcvdJszQRCDBhXNhMOY0Rso7yLwJ9duJDH
 6SBsBVj86DqBMWnnRbNoG0v/GSpzE6JXH7I+dJT2rlUh04eyxEXvZxK
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Some panels support multiple slice to be sent in a single DSC packet. And
this feature is a must for specific panels, such as JDI LPM026M648C. Add a
dsc_slice_per_pkt member into struct mipi_dsi_device and support the
feature in msm mdss driver.

Co-developed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
 include/drm/drm_mipi_dsi.h         |  2 ++
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 908f5f1649d650f1cf152fc0b263541dc566ac68..976c5d82a2efa0fc51657b8534675890be7c33a6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -157,6 +157,7 @@ struct msm_dsi_host {
 
 	struct drm_display_mode *mode;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 
 	/* connected device info */
 	unsigned int channel;
@@ -861,17 +862,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = dsc->slice_count;
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
-	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
+	bytes_per_pkt = dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt;
 
 	eol_byte_num = total_bytes_per_intf % 3;
-
-	/*
-	 * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
-	 *
-	 * Since the current driver only supports slice_per_pkt = 1,
-	 * pkt_per_line will be equal to slice per intf for now.
-	 */
-	pkt_per_line = slice_per_intf;
+	pkt_per_line = slice_per_intf / msm_host->dsc_slice_per_pkt;
 
 	if (is_cmd_mode) /* packet data type */
 		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
@@ -1020,12 +1014,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		else
 			/*
 			 * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
-			 * Currently, the driver only supports default value of slice_per_pkt = 1
-			 *
-			 * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
-			 *       and adjust DSC math to account for slice_per_pkt.
 			 */
-			wc = msm_host->dsc->slice_chunk_size + 1;
+			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt + 1;
 
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
@@ -1630,8 +1620,13 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
 	msm_host->mode_flags = dsi->mode_flags;
-	if (dsi->dsc)
+	if (dsi->dsc) {
 		msm_host->dsc = dsi->dsc;
+		msm_host->dsc_slice_per_pkt = dsi->dsc_slice_per_pkt;
+		/* for backwards compatibility, assume 1 if not set */
+		if (!msm_host->dsc_slice_per_pkt)
+			msm_host->dsc_slice_per_pkt = 1;
+	}
 
 	ret = dsi_dev_attach(msm_host->pdev);
 	if (ret)
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 94400a78031f1b5f515c4a1519f604c0df7f3e0c..f13ed73b54b0af6d93456f4b8c8257c4f8419023 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -182,6 +182,7 @@ struct mipi_dsi_device_info {
  * be set to the real limits of the hardware, zero is only accepted for
  * legacy drivers
  * @dsc: panel/bridge DSC pps payload to be sent
+ * @dsc_slice_per_pkt: number of DSC slices to be sent as in a single packet
  */
 struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
@@ -196,6 +197,7 @@ struct mipi_dsi_device {
 	unsigned long hs_rate;
 	unsigned long lp_rate;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 };
 
 /**

-- 
2.34.1

