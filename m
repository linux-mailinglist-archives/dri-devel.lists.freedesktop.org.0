Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF94896A23
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43310112910;
	Wed,  3 Apr 2024 09:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b2WwNkal";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF7E11290F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:11:51 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1e0f3052145so57682595ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 02:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712135511; x=1712740311; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+nFa+DoX75Gh3LGa/SLXrbw1YnZbOgzc+2X5SVpsYKU=;
 b=b2WwNkals+qAVnRK5LC/SxLJufTkaAZHfz6cOP/fTQhbBdKjwz2WekwooMs5IGhiA4
 YZ//Jc5jKwiz+OEZPuhHDu+xj3dn0fS7+W03QTerDu/KWM7QAqfyhrjhdG3V999tkMZH
 sgvd5DepmDmNoxIsBRVI0/5sV8T5dVxfm31V+2IHrQJc7CiEBbxW0i78oe8e21kvhrHC
 KHw04F5RoHsu7lFb9/BHUuzCD+/tLUXYmch/tpV0ENW/4cUa6xeOC/hhMsB4QFPQ7+ae
 /rq7Bvc/diZLbdBR+veI/fU5XQxQBjQs7zgL13kBvA4b6S595vVLA1QuJTL6Sy9l8wN3
 YcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712135511; x=1712740311;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+nFa+DoX75Gh3LGa/SLXrbw1YnZbOgzc+2X5SVpsYKU=;
 b=tvjK21roh2ERHYg1j5jA5luIddrw6I1pg2MbnUpP/b3C8aupp/v9TUgOueaFTZbUB0
 RSayjc9M46HK49W1ytU6iiovd5lM49dsT7n1nmXmFOZs9jeOU+K4ZWVlXevfv8qRkUgb
 F6P2/Ws4r+/+LNIhH6WM+mo0LPt8Xrdnyh4p4XlGJQLY5eZfZl3aHx0Tf9eAd5YVlxJy
 DxojoUE/cBPyvbjQG1dBmVWmFmaQm7SoMlw106wt/i/1/71LmYfr476z1x9+pg4M3Sbp
 dN3IjCxdcCDBvB8pSOflygaZDzsei5WyR+4snfLvjq/Lld64e61PiBvNbYMrIg62MWen
 LD0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQrgfD95zMlFsBpFLAed8nsiMjVZ9vLHpR4Jn4XRImDvWhcUzLvlD50vKz4NZIOV2YsNGUH+wLbRKmljBo2gFX/292uRmY3pLwNL31O3Uf
X-Gm-Message-State: AOJu0Yzltt/q2QmokKcRFuh9PKPWAFIaxUKQbN0GTzmYMzTaKIbBwP2B
 sU04BWh70lbGIM4JIPTAoFvch6VjSp9gdyaLGNcf6yUP7+yc7Lvp2ihU7REXJ1A=
X-Google-Smtp-Source: AGHT+IGDKZpi6IzWPwxcA3gkwURqgiirh03g+6YOT47tXCPNep36CItbq3BtloN4WYOSIhk1Xi88sQ==
X-Received: by 2002:a17:903:18f:b0:1e2:920a:4add with SMTP id
 z15-20020a170903018f00b001e2920a4addmr1179553plg.16.1712135511328; 
 Wed, 03 Apr 2024 02:11:51 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.66]) by smtp.gmail.com with ESMTPSA id
 lo14-20020a170903434e00b001e0aded0ca7sm12688087plb.239.2024.04.03.02.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 02:11:50 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 03 Apr 2024 17:11:02 +0800
Subject: [PATCH v3 6/6] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-msm-drm-dsc-dsi-video-upstream-v1-6-db5036443545@linaro.org>
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712135460; l=4300;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KdBFnUu2Qm6ZZ65hBcXTk+Bm1tsC1DSuVU4sJTWGxzk=;
 b=0c+GOay4d8sYuEfmKXCY3qnC69M5LNKT/bdL1VuwVHTTHSJMUP6DvEIlrEPtXbRf7brwZBC9G
 THfCXQuOr93AkNUmqicPhAO7A7LuE1Xr9W6EM3TZrI+KgKHpwS6Ti1a
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

From: Jonathan Marek <jonathan@marek.ca>

Support slice_per_pkt in msm driver.

Note that the removed "pkt_per_line = slice_per_intf * slice_per_pkt"
comment is incorrect.

Also trim the code to simplify the dsc reference.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index b0507a42ee6a..0c6f40dbd25c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -866,17 +866,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
-	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
-
+	bytes_per_pkt = dsc->slice_chunk_size * dsc->slice_per_pkt;
 	eol_byte_num = total_bytes_per_intf % 3;
 
-	/*
-	 * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
-	 *
-	 * Since the current driver only supports slice_per_pkt = 1,
-	 * pkt_per_line will be equal to slice per intf for now.
-	 */
-	pkt_per_line = slice_per_intf;
+	pkt_per_line = slice_per_intf / dsc->slice_per_pkt;
 
 	if (is_cmd_mode) /* packet data type */
 		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
@@ -916,6 +909,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
 	struct drm_display_mode *mode = msm_host->mode;
+	struct drm_dsc_config *dsc = msm_host->dsc;
 	u32 hs_start = 0, vs_start = 0; /* take sync start as 0 */
 	u32 h_total = mode->htotal;
 	u32 v_total = mode->vtotal;
@@ -947,8 +941,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		hdisplay /= 2;
 	}
 
-	if (msm_host->dsc) {
-		struct drm_dsc_config *dsc = msm_host->dsc;
+	if (dsc) {
 		u32 bytes_per_pclk;
 
 		/* update dsc params with timing params */
@@ -988,14 +981,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		else
 			bytes_per_pclk = 3;
 
-		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), bytes_per_pclk);
+		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(dsc), bytes_per_pclk);
 
 		h_total += hdisplay;
 		ha_end = ha_start + hdisplay;
 	}
 
 	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
-		if (msm_host->dsc)
+		if (dsc)
 			dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
 
 		dsi_write(msm_host, REG_DSI_ACTIVE_H,
@@ -1016,21 +1009,17 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
 			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
 	} else {		/* command mode */
-		if (msm_host->dsc)
+		if (dsc)
 			dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
 
 		/* image data and 1 byte write_memory_start cmd */
-		if (!msm_host->dsc)
+		if (!dsc)
 			wc = hdisplay * mipi_dsi_pixel_format_to_bpp(msm_host->format) / 8 + 1;
 		else
 			/*
 			 * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
-			 * Currently, the driver only supports default value of slice_per_pkt = 1
-			 *
-			 * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
-			 *       and adjust DSC math to account for slice_per_pkt.
 			 */
-			wc = msm_host->dsc->slice_chunk_size + 1;
+			wc = dsc->slice_chunk_size * dsc->slice_per_pkt + 1;
 
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
@@ -1657,8 +1646,12 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
 	msm_host->mode_flags = dsi->mode_flags;
-	if (dsi->dsc)
+	if (dsi->dsc) {
 		msm_host->dsc = dsi->dsc;
+		/* for backwards compatibility, assume 1 if not set */
+		if (!dsi->dsc->slice_per_pkt)
+			dsi->dsc->slice_per_pkt = 1;
+	}
 
 	/* Some gpios defined in panel DT need to be controlled by host */
 	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);

-- 
2.34.1

