Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DE4B9A77D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 17:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF9710E74D;
	Wed, 24 Sep 2025 15:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mPu6sWus";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7943A10E74C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 15:08:35 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2570bf6058aso93334735ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 08:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758726515; x=1759331315; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B+m5vlhNwunXS3NJ6FmDWyfCPUSXUtwy+/7tRflWyDU=;
 b=mPu6sWus97tBL7K9zG9VIzopgVEVuEaSBUIWq4h+FHCbUh/jVKuQTU7mwGYt57jx1m
 uuQNaAyfjg+V9knPMLGzMG9fTNAHzxP28Mc1pS6d5Bh8qHiftxykd63HwWv/b5rEXLMU
 S0TQ82K6//QfX54TDoUZkEXJxu5Mq5ixkSsbrHXSHDH7wAK/UdQz+aDH+Ice8M1QdAq3
 RhuZB1qyLT9bTLTX9aaA9w22UNcUDv5g6sm6E2EBDV/m8iN1gmsNPU0jrcFD9LaGLhKN
 xJaxUCNudaDykd8oxZk7PETzmZ7sjrvBcF03Jslkl7YAFof6G/hqaIrHng0N3735Woiw
 dCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758726515; x=1759331315;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+m5vlhNwunXS3NJ6FmDWyfCPUSXUtwy+/7tRflWyDU=;
 b=MC+cI/rxSFHNYPyjkIitwlv9U3uTwFYbLj0AVysYuknfMUoOBDI7GREmF8VDnOCvse
 N5/8pUP4UqHaes+S+fgYK1AH6NJ3g22aQ1sX+iE0TNXZ+Gqkq3b8eocV/s7ccWxC7rJ8
 M66IdbBnN0/ZZ59Z/PC4Xlo1WmD8JRQ37DOb56obRaDBTeMtpwfOXwVtvRvmBNr7lFEd
 0N+HORIL6sxDrckXeAfeGNmDJ3RuouB6Sj6fEX1qbeeQeEpdo+35Vb3r5AaaIB4MtXI3
 kk1MzgwyWoaXW1gu3Bo9Ml11cdEjRUa9hRMfw2F7Iglk1TZi7XEUENBL9FB/pOwFQtku
 Yu8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLnlr+yIkpA/Jyjan5S9HQotYYFP92fEIifXmE/sY6itqpiLCiye1G3r2lITUOI0zL049EoaMu4g0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztmKKpvtNCMhT4e7bN147LTWhW/kPzzi7ygHbsMiwWSuEfntJm
 3PEo+kkvx0jV2watILmoGAA7FriRALmyhw5Bss39GpsV6wtiLeG8X4MQuPuG4Ass3/0=
X-Gm-Gg: ASbGnctTyeZOs3TLlweXFfXUdKK/ciJJdvtgqFasmlHhp43ZkDFPVPZWTkPFhAvLxKT
 oK6cGagb+O9KBvZIilNutYBwJYCvq7TGUNs2cZyAQVZap4aLphkN9St4GVJID4lF4ySH0Y+BC7U
 gy0t1yuUSJSPxfwI1n8qAGM1eJKI5fbAF4eCkOB8bfg020Aww9DGJNdFQpA1LER/H+uhk+vBbnV
 t/68cv7khDjeH5Poz7YtjxhD4uMtTGfiM+1gsyO73n2F55jYg6kgHsAaEp+2MdrRjRT3Lj1Jm4R
 aZcruOZd4ifPJQCW9W2xUXVn7e9J9w/3pEiKwD3HOqQMdESshCrG70mr9d1RfM3UND9Uilz7Fts
 5mGOvCuhmvHMoH9MP
X-Google-Smtp-Source: AGHT+IFiyjrTclsNn9tPuvEEVJ9Cj7y7SUK7Sjpx8qt64CmQ70ylZm8IikptBEeoSu7N0IEZVVDOqQ==
X-Received: by 2002:a17:903:1a85:b0:273:31fb:a86d with SMTP id
 d9443c01a7336-27ed4a4929amr602205ad.48.1758726514821; 
 Wed, 24 Sep 2025 08:08:34 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26b59d6538bsm158717445ad.82.2025.09.24.08.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 08:08:34 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 24 Sep 2025 23:08:10 +0800
Subject: [PATCH v3 1/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-dsi-dual-panel-upstream-v3-1-6927284f1098@linaro.org>
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
In-Reply-To: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726499; l=3811;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=PTADnA0LADRWGW6ihK0MzVzHyCbS7FLm6geROUlYFeE=;
 b=9s1hagBRl2nfojsoIc6t6lqJydaDeozos2jpTYSSwNCUNLBec91ZvR3LGnrNT6lUKs4WYT/LZ
 a20IkJSHHkVBu8BCcLR3NOHM6tq4Wvzn2IMIkZ+TjdI+cFbNqlSdun+
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
index f297e3de8c3dc4e1326e70c78c046b5a19568cef..de51cb02f267205320c5a94fc4188413e05907e6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -157,6 +157,7 @@ struct msm_dsi_host {
 
 	struct drm_display_mode *mode;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 
 	/* connected device info */
 	unsigned int channel;
@@ -849,17 +850,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
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
@@ -1008,12 +1002,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
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
@@ -1623,8 +1613,13 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
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
index 6d2c08e8110151a97620389197f1ef79c058329d..5a85ba01f402a3866b70828391bb417bb8dd5956 100644
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

