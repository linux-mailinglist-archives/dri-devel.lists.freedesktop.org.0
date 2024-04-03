Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B92896A14
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C5E112901;
	Wed,  3 Apr 2024 09:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KzqM733O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AAE112904
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:11:17 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1e27e174ccbso9391055ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 02:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712135477; x=1712740277; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NP1mArxks5bntvoBu6vgePRngXslO+DwNYzgIBI4xco=;
 b=KzqM733OIhec22dzGuI8IXRMJhkNkr6QKmU/jUWi3A7IDT6TJSbNrCAW8FSq3Ed/gr
 5iQcK3rWfyqHmVuDG6D9+KNVv4WjYSg3o6UsLNV58GhkUk9bbcFfXGO/beuAau/lcUCa
 sxXYXT+NRt/leoo8FYzewckzjFnW16KGi9YpGl2I93GBt3Ep9Dl9ANRn9kXM/V0QWjGs
 kEszj4C5gtyy8aQGi5sN6P7x4D7U81U0k82vrZZYZWhX7npvWK1JFuzZuoUk4sJPNazo
 65ojDvrKwyF8TapA3qYOJQ338Ny2hx/deTsQm0zuz8CclOSrEw/Av/MQ6U94nI4pgEL4
 jSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712135477; x=1712740277;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NP1mArxks5bntvoBu6vgePRngXslO+DwNYzgIBI4xco=;
 b=oWCT8HC5iBa3KsJtnnySqyxoZR+3VNMiNp4wRT7Y5j7UpjbPuOEJT+9dNHGUTdKURR
 mTG2ohSOLHZEYS+3DAu9vOjumbTAmJqgyDonNtiJc8zg1gcGozsaVLPHtfpZgn02ddrq
 /ryLfDbAT9BP6LJ/xVwZAoMsBqmuGgIiMsMfa5V9xWPrBdgNCI/2ExcsXtkKiOAPHU/T
 uQmeN7ZEHL1u8lLJBW4K+x4H358kZlFjGE36HMklEctG6TJId+9dX3pibJzqkWRKO4Pg
 qD0NZZrtSkTxMDgeF8Fjayum9Zd5sCsbi4+NvV/kE79+SvGgaOU2GEb+jHMTZoSSMDTg
 lTKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTKZv+Mji0+na0VqJr8aR6mxmyB3LpDBgr84S5tf+iskzdos7uNOo/AJFJEPluMLmLTKZOn397HgUZ1HiGOd7rssN0mOq4XRzG8KyEHTTS
X-Gm-Message-State: AOJu0YwKHuECCzHHfP6K1cVpjW6y74k6vj/PyaCA5xO8GB9E2z3pRmlR
 rbJlo+qGxJDyG8vj5Tx0x2eN6y0QFwbHL2RHTu+HzuZzcInUUQvl7vWRSZ541Wc=
X-Google-Smtp-Source: AGHT+IEvnZUXLpdEar+zDu2dEcKJ3XPbx7m6PBvpXM6ninTCE0WpaPkwirt2qnexBqWzAKnOJ5d/Zw==
X-Received: by 2002:a17:903:2285:b0:1e0:b872:d862 with SMTP id
 b5-20020a170903228500b001e0b872d862mr19646560plh.52.1712135476796; 
 Wed, 03 Apr 2024 02:11:16 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.66]) by smtp.gmail.com with ESMTPSA id
 lo14-20020a170903434e00b001e0aded0ca7sm12688087plb.239.2024.04.03.02.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 02:11:16 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 03 Apr 2024 17:10:57 +0800
Subject: [PATCH v3 1/6] drm/msm/dpu: fix video mode DSC for DSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-msm-drm-dsc-dsi-video-upstream-v1-1-db5036443545@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712135460; l=2016;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=m6HQvVN42IUfffBpA5rSrdSQLAGl00b8q3W/bbmwYL0=;
 b=X1XSY5kWlW4EvhrnUx70p2aoQcx3f1DnnQ4OyjHIWQvbWeRXvcU2GduJDjEEDh2iXJNAm4MLN
 Z3Bv1A5eBC0BqnYTDzQzUt3NZ19ccVql5AenjM0xwfQJWidDKXu80Ql
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

Add necessary DPU timing and control changes for DSC to work with DSI
video mode.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index d9e7dbf0499c..c7b009a60b63 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -115,6 +115,15 @@ static void drm_mode_to_intf_timing_params(
 		timing->h_front_porch = timing->h_front_porch >> 1;
 		timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
 	}
+
+	/*
+	 * for DSI, if compression is enabled, then divide the horizonal active
+	 * timing parameters by compression ratio.
+	 */
+	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
+		timing->width = timing->width / 3; /* XXX: don't assume 3:1 compression ratio */
+		timing->xres = timing->width;
+	}
 }
 
 static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 965692ef7892..079efb48db05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -167,6 +167,14 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
 
 	data_width = p->width;
+	if (p->wide_bus_en && !dp_intf)
+		data_width = p->width >> 1;
+
+	if (p->compression_en)
+		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
+
+	if (p->compression_en && dp_intf)
+		DPU_ERROR("missing adjustments for DSC+DP\n");
 
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;

-- 
2.34.1

