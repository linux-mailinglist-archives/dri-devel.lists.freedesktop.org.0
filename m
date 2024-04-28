Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC758B4BC5
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 14:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD9A10F45F;
	Sun, 28 Apr 2024 12:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kURQd0nT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3864110F6AB
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 12:42:51 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a58989cd1f8so458910466b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 05:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714308169; x=1714912969; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ruxM04DcwSqc1+5CUH/yirqxxYT+4VUtJYzmah4p6Dc=;
 b=kURQd0nTLVYg5oQENTxEy8GnPLC8jiyRZmiN200RDI1yVDbssailfhHevxw/9MgiRt
 NrBVz+2efkMOuflrXS1S+yhngsGixqelt1Zggg83h+SX2P9DKjnJSUYNtWCFxZmumupD
 h2WzfLBkuDANX9x1vgJm8kMb2Z/XLfz1xz3KDMnsvLvEKyum+SlhI3IaIHeE50c+2KQ2
 IXENigMz3L6GlSxA2n2XQlE6mod1p+mWYNnLfy7E9B89x854X7R0j5TBMWwX1L+iFeUd
 SVtRIS/HnALmy0ZLwv3j+YcKKMxdEm/y/od/EyENfGKuxkmkwEHaq6siT9vr/DxbBDIh
 mUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714308169; x=1714912969;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ruxM04DcwSqc1+5CUH/yirqxxYT+4VUtJYzmah4p6Dc=;
 b=L4BLzVO+cEpFV3VXri+c7c9Js+WonY8Lkh+biPYr0g0u0PrC6bLfVrapfqgGO8Lt8F
 Sjb0z8a71wZlZIS3H4BlHXRS+bwTg1Erex0XJh3ePWOoCw6uMOCubMSvi4u9bptXrLDp
 pY+f3U+aubYKamHyRhD4VzMl92HO6+e+azfhl7+uu4a/7XqQtI3fztG2fLfZ4RirquC1
 26Ataz+iTXAxuI7/lUUkPr+QIRVcmQdnOJyOLTiFeYFOZ/98yolqAw+aVeCLTcN7exZY
 SHmaAI/v6z0XcdNAA4WYbskS1lAAyU0fByO9KUlij/LZf605vf9XhZtG81Km7fr1a9+5
 SBIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCpZWMMVrfTfhvXo4bEHZUwgOsuYnzhH6wenp8zTiX+Pe0yQEXY9e5pBYb4lRC+1ndjBfYPjcx8PVdAdE0hnFKqVNESjENiKMdWthTRbz8
X-Gm-Message-State: AOJu0YxkwIaGjAfbPoUaexkEQ5G4kyiec0ykRcLs090ApVg2wJ4cyKRm
 6OOzfYzGHR/9xCCfFl/k+28/GH7I23Ylsz11cTt0NFI1miqp7e+RsM6zgzL28EQ=
X-Google-Smtp-Source: AGHT+IFEmenVCstN3qRQ3VZod695J/pFmJ7LOK2zFQWoDBSbhtYZRvHLRnkehwSsSY/MkO5h5SEVWQ==
X-Received: by 2002:a17:906:a2d3:b0:a55:856b:5892 with SMTP id
 by19-20020a170906a2d300b00a55856b5892mr2957543ejb.30.1714308169136; 
 Sun, 28 Apr 2024 05:42:49 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 b25-20020a17090630d900b00a5875b34b6asm6935689ejb.14.2024.04.28.05.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Apr 2024 05:42:48 -0700 (PDT)
Date: Sun, 28 Apr 2024 15:42:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: re-indent dpp401_dscl_program_isharp()
Message-ID: <2b0a61a0-baca-415f-aad4-7dc4cde73ef7@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

Smatch complains because some lines are indented more than they should
be.  I went a bit crazy re-indenting this.  ;)

The comments were not useful except as a marker of things which are left
to implement so I deleted most of them except for the TODO.

I introduced a "data" pointer so that I could replace
"scl_data->dscl_prog_data." with just "data->" and shorten the lines a
bit.  It's more readable without the line breaks.

I also tried to align it so you can see what is changing on each line.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../display/dc/dpp/dcn401/dcn401_dpp_dscl.c   | 93 ++++++-------------
 1 file changed, 30 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
index c20376083441..696ccf96b847 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
@@ -779,75 +779,42 @@ static void dpp401_dscl_program_isharp(struct dpp *dpp_base,
 		const struct scaler_data *scl_data)
 {
 	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
+	const struct dscl_prog_data *data;
 
 	if (memcmp(&dpp->scl_data, scl_data, sizeof(*scl_data)) == 0)
 		return;
 
 	PERF_TRACE();
 	dpp->scl_data = *scl_data;
-	// ISHARP_EN
-	REG_SET(ISHARP_MODE, 0,
-		ISHARP_EN, scl_data->dscl_prog_data.isharp_en);
-		// ISHARP_NOISEDET_EN
-		REG_SET(ISHARP_MODE, 0,
-				ISHARP_NOISEDET_EN, scl_data->dscl_prog_data.isharp_noise_det.enable);
-		// ISHARP_NOISEDET_MODE
-		REG_SET(ISHARP_MODE, 0,
-				ISHARP_NOISEDET_MODE, scl_data->dscl_prog_data.isharp_noise_det.mode);
-		// ISHARP_NOISEDET_UTHRE
-		REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
-				ISHARP_NOISEDET_UTHRE, scl_data->dscl_prog_data.isharp_noise_det.uthreshold);
-		// ISHARP_NOISEDET_DTHRE
-		REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
-				ISHARP_NOISEDET_DTHRE, scl_data->dscl_prog_data.isharp_noise_det.dthreshold);
-		REG_SET(ISHARP_MODE, 0,
-				ISHARP_NOISEDET_MODE, scl_data->dscl_prog_data.isharp_noise_det.mode);
-		// ISHARP_NOISEDET_UTHRE
-		REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
-				ISHARP_NOISEDET_UTHRE, scl_data->dscl_prog_data.isharp_noise_det.uthreshold);
-		// ISHARP_NOISEDET_DTHRE
-		REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
-				ISHARP_NOISEDET_DTHRE, scl_data->dscl_prog_data.isharp_noise_det.dthreshold);
-		// ISHARP_NOISEDET_PWL_START_IN
-		REG_SET(ISHARP_NOISE_GAIN_PWL, 0,
-				ISHARP_NOISEDET_PWL_START_IN, scl_data->dscl_prog_data.isharp_noise_det.pwl_start_in);
-		// ISHARP_NOISEDET_PWL_END_IN
-		REG_SET(ISHARP_NOISE_GAIN_PWL, 0,
-				ISHARP_NOISEDET_PWL_END_IN, scl_data->dscl_prog_data.isharp_noise_det.pwl_end_in);
-		// ISHARP_NOISEDET_PWL_SLOPE
-		REG_SET(ISHARP_NOISE_GAIN_PWL, 0,
-				ISHARP_NOISEDET_PWL_SLOPE, scl_data->dscl_prog_data.isharp_noise_det.pwl_slope);
-		// ISHARP_LBA_MODE
-		REG_SET(ISHARP_MODE, 0,
-				ISHARP_LBA_MODE, scl_data->dscl_prog_data.isharp_lba.mode);
-		// TODO: ISHARP_LBA: IN_SEG, BASE_SEG, SLOPE_SEG
-		// ISHARP_FMT_MODE
-		REG_SET(ISHARP_MODE, 0,
-				ISHARP_FMT_MODE, scl_data->dscl_prog_data.isharp_fmt.mode);
-		// ISHARP_FMT_NORM
-		REG_SET(ISHARP_MODE, 0,
-				ISHARP_FMT_NORM, scl_data->dscl_prog_data.isharp_fmt.norm);
-		// ISHARP_DELTA_LUT
-		dpp401_dscl_set_isharp_filter(dpp, scl_data->dscl_prog_data.isharp_delta);
-		// ISHARP_NLDELTA_SCLIP_EN_P
-		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
-				ISHARP_NLDELTA_SCLIP_EN_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_p);
-		// ISHARP_NLDELTA_SCLIP_PIVOT_P
-		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
-				ISHARP_NLDELTA_SCLIP_PIVOT_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_p);
-		// ISHARP_NLDELTA_SCLIP_SLOPE_P
-		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
-				ISHARP_NLDELTA_SCLIP_SLOPE_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.slope_p);
-		// ISHARP_NLDELTA_SCLIP_EN_N
-		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
-				ISHARP_NLDELTA_SCLIP_EN_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_n);
-		// ISHARP_NLDELTA_SCLIP_PIVOT_N
-		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
-				ISHARP_NLDELTA_SCLIP_PIVOT_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_n);
-		// ISHARP_NLDELTA_SCLIP_SLOPE_N
-		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
-				ISHARP_NLDELTA_SCLIP_SLOPE_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.slope_n);
-		PERF_TRACE();
+	data = &scl_data->dscl_prog_data;
+
+	REG_SET(ISHARP_MODE, 0,	ISHARP_EN, data->isharp_en);
+
+	REG_SET(ISHARP_MODE, 0,	              ISHARP_NOISEDET_EN,    data->isharp_noise_det.enable);
+	REG_SET(ISHARP_MODE, 0,               ISHARP_NOISEDET_MODE,  data->isharp_noise_det.mode);
+	REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_UTHRE, data->isharp_noise_det.uthreshold);
+	REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_DTHRE, data->isharp_noise_det.dthreshold);
+	REG_SET(ISHARP_MODE, 0,               ISHARP_NOISEDET_MODE,  data->isharp_noise_det.mode);
+	REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_UTHRE, data->isharp_noise_det.uthreshold);
+	REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_DTHRE, data->isharp_noise_det.dthreshold);
+	REG_SET(ISHARP_NOISE_GAIN_PWL, 0, ISHARP_NOISEDET_PWL_START_IN, data->isharp_noise_det.pwl_start_in);
+	REG_SET(ISHARP_NOISE_GAIN_PWL, 0, ISHARP_NOISEDET_PWL_END_IN, data->isharp_noise_det.pwl_end_in);
+	REG_SET(ISHARP_NOISE_GAIN_PWL, 0, ISHARP_NOISEDET_PWL_SLOPE, data->isharp_noise_det.pwl_slope);
+
+	REG_SET(ISHARP_MODE, 0, ISHARP_LBA_MODE, data->isharp_lba.mode);
+	// TODO: ISHARP_LBA: IN_SEG, BASE_SEG, SLOPE_SEG
+	REG_SET(ISHARP_MODE, 0, ISHARP_FMT_MODE, data->isharp_fmt.mode);
+	REG_SET(ISHARP_MODE, 0, ISHARP_FMT_NORM, data->isharp_fmt.norm);
+
+	dpp401_dscl_set_isharp_filter(dpp, data->isharp_delta);
+
+	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_EN_P,    data->isharp_nldelta_sclip.enable_p);
+	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_PIVOT_P, data->isharp_nldelta_sclip.pivot_p);
+	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_SLOPE_P, data->isharp_nldelta_sclip.slope_p);
+	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_EN_N,    data->isharp_nldelta_sclip.enable_n);
+	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_PIVOT_N, data->isharp_nldelta_sclip.pivot_n);
+	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_SLOPE_N, data->isharp_nldelta_sclip.slope_n);
+	PERF_TRACE();
 } // dpp401_dscl_program_isharp
 /**
  * dpp401_dscl_set_scaler_manual_scale - Manually program scaler and line buffer
-- 
2.43.0

