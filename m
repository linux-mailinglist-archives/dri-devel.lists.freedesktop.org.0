Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D1F96413A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DFE10E4FD;
	Thu, 29 Aug 2024 10:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OU7WIYt1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE5110E4E6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:19:31 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-715e3e03831so456002b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926771; x=1725531571; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YT/oslnAviObem/Io85gQj+L4LOssdl6Cnm2LzK67QU=;
 b=OU7WIYt1a4JBK9/02XPKFfZ0sbL2Ti+D28NOxWB5TF5bm8pNxHwIRrqPPXq3MKYqCw
 i+5udD5XUbhq+bw4VdbtMhaAJETD4393YJc3D6UCfxxZz+CwVytLOSMGh/oGqwmrCCcM
 A4oGQDKs81QMBz6Gg7S6Y25ajKnX72jP5yUOQy7BsrC7ZJLmzrzK+XjM/iX9j3ySWE2R
 aq0gXgdu+ELlb/MeGhhBU0SxzMh1pDRV3OI3KzIAEcdB++OYwU0BG9NxpPVE2It06VhD
 UCHoUWOndp+KHabFJgGahiBdY7mVd+cYg1qEKk+fG6judGGLBbd0/h0fyWJyBENn5xHW
 DSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926771; x=1725531571;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YT/oslnAviObem/Io85gQj+L4LOssdl6Cnm2LzK67QU=;
 b=PWrAfAKmCefkvgqxx+vwoCxd71jw3llKJKL+MAd9peiHkC4ymGTj8YLlKEkWBrjwpC
 16kqwTyvsuvGjJY/xPjZEusijIEX7aj312LRq9t/thlLBgOCU3mLgQdnmv2w1PB+tn7+
 xEJTJTD4YgGwDXfJ66pMUoyKY9Nhivtv7TQ4bYk6wL99w+uJ8FxyxvJmdGSg9Wkuyzph
 WxGFSBBMY2WsTronCDGUvVw04GJa4srIHayDAkys1mhoQhU9E0wMUXijQcSFR3OTQZ2C
 +THGvmkBgx4GPtMPSE063tWNKFJ+ngVLbj6Qj3snHrYPHNZskyA8nXliKfmSDUoiXSNp
 m3gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSQzaAH2CLERMgHvu3p44z/O/YwIkIXDHEj4VIRfNVY6Vz8fW9+qtrQlK93nu7ycoSFgnhvvhwJfg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMrGmUxKoLj8ubMuHbTL7O5vVkdCNLDPMSjRqmx1Eqj1zP054W
 J/+i4FsB+0//P6oSLKZfnGq12nVXA7SRxGl75MbsDvu8LzHXV2JMQKsL7k0Ok/s=
X-Google-Smtp-Source: AGHT+IHcvsg7fZYGxqm7ChIBko2zPV37f4pchYS4RO/UEJv/BV2Datn0nVhZhKL+JHS7piaG7e078Q==
X-Received: by 2002:a05:6a00:21c9:b0:714:2881:44cc with SMTP id
 d2e1a72fcca58-715dfaf3a0bmr2666674b3a.10.1724926771151; 
 Thu, 29 Aug 2024 03:19:31 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:19:30 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:32 +0800
Subject: [PATCH 03/21] drm/msm/dsi: pass the right width to dsc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-3-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=2169;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=SPm33PXBWIKSppH1J5nRIqVSKT5JheP2bTluuMrYOXw=;
 b=2uMFbX70ER8OkBTRn+QVNb6hp3X5asWvQnYadjSLOcg5TmgHNJubsEGmnCe4Vuhcmfo3hKd+l
 Q1K6HbGoKNyBFSkdiSz9mYPQkAwUWKvJeWIfcvYYF/5SnKzF16Wwo7d
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

Data width for dsc engine is aligned with pipe, not with whole screen
width. Because the width may be halved in DSI bonded case.

The dsc width is not related to the timing with back front porch in
later stage, so update dsc timing earlier.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 7a4d9c071be5a..5abade8f26b88 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -953,7 +953,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			return;
 		}
 
-		dsc->pic_width = mode->hdisplay;
+		dsc->pic_width = hdisplay;
 		dsc->pic_height = mode->vdisplay;
 		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
 
@@ -964,6 +964,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		if (ret)
 			return;
 
+		if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
+			dsi_update_dsc_timing(msm_host, false, hdisplay);
+		else
+			dsi_update_dsc_timing(msm_host, true, hdisplay);
+
 		/*
 		 * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
 		 * enabled, bus width is extended to 6 bytes.
@@ -990,9 +995,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 	}
 
 	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
-		if (msm_host->dsc)
-			dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
-
 		dsi_write(msm_host, REG_DSI_ACTIVE_H,
 			DSI_ACTIVE_H_START(ha_start) |
 			DSI_ACTIVE_H_END(ha_end));
@@ -1011,9 +1013,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
 			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
 	} else {		/* command mode */
-		if (msm_host->dsc)
-			dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
-
 		/* image data and 1 byte write_memory_start cmd */
 		if (!msm_host->dsc)
 			wc = hdisplay * mipi_dsi_pixel_format_to_bpp(msm_host->format) / 8 + 1;

-- 
2.34.1

