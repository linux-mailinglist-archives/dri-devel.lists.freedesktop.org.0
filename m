Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2479A33338
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 00:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35DA10E294;
	Wed, 12 Feb 2025 23:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OlOPJZSA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844BC10E294;
 Wed, 12 Feb 2025 23:04:46 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2f9bac7699aso459387a91.1; 
 Wed, 12 Feb 2025 15:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739401486; x=1740006286; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=o6fZexvMzlS57FlcyC9jwgq8Jb44X105OrNbzoHVQ5U=;
 b=OlOPJZSAza2O9j3ryVjiQtrSjr+tc1uIIIfkbXhYoRxJgCLz3ohQt7zsNCf+pDXRCZ
 84kBV5TomYzQ76hWPC7aiCEit+gLnsqCw0OECIks5hEapFYyEs1SeMsq0O5U4fIhJOol
 J7BgkU4FOTYOKuxckzayXEt9CQmLFnvt0Q963xbqkKG8QvtbO1UQC88CbfH+dQ8988Il
 bezMvXZMhIAMLWM3jTuzGcGFUJKWJOmTpFYoZfg3dvf3YLGKbuZfcTCwLysG/ys/NMCP
 Yd+3fYEia4oMvNIT59fyR/xZKZ93LhrxREFhVkwDdPmTsQmUIyKdcdzjlpW+aB++QIYD
 RIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739401486; x=1740006286;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o6fZexvMzlS57FlcyC9jwgq8Jb44X105OrNbzoHVQ5U=;
 b=WOH4MBSdKFCoz4XtLIE5yrhgBHY4mIDwPL0uPBy9VhmmnoYT9kinyUQQPO+UzQ6/C6
 DKp5L+kSQB8UDcoCCiYoPx0xEVQQghSdYDTrIHC76xZniOyB6d6tt0/ewOm/jJ5LZrBS
 FEwyjag+iZKR4L2HrhMCzjwj+3Yqh6/xxT/H8wKDK6hOvFJQrViy/Mbo7SGA3c0/lojz
 W6KwhweERuOhXj0R6uOsCWSdH6GkfcH9t8++0mAytsBZzCOJEbpbV15ObwIA/VA58IKp
 ZXdKsW6pVyMTDFVLak4ZwaAB66KOZaTN7qvAOaVJvecUBEk93XsLAU2GIiW4w3y1K1pi
 Vaiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFZ5hNebo0hy+yUuAM945zPkTttYf60Ur+xNhHRTPzhJJtG7jROIjRJ5qsKuU3P2ZbsekUxn2dGd4=@lists.freedesktop.org,
 AJvYcCWL63Ux5FDjwPe7hYQ1Wpz3QMjUOW51uVwLogxD+swQ1dal2JfGWfUQH/07Ku4weOSXoX6l0dOZxacT@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz16oIN0PIAg5w+Y0nhYNxC10lkcgSNmiGfeS6xP+Ddl+8Pm5La
 u1vT90qRi2mPI+YM7ShRz7WUbvpDn4OKM+0JX6c8C9HAMyrY+OAb
X-Gm-Gg: ASbGnct7yOHLdtOTxMOlHRc9zZIIZ/bCg1o8UhrGcY3gd6PEog+w2HUmlvo5JNKz4zK
 tQpzAW0aABceqdljDCVbhun9CouhHhS6vI+8ZtWPGj053w16H8RTQNsQjEZPQjnJujKwiYWVXVR
 KxFTv4NS8vkdl4MRUFu0tpTvfDZvExDCTO7L6i0nNr+4FXMPiMnGYqWMBoPk4z7BvjtTfDTi43F
 WmkGY/DdF9Te6vREEsfPrLRhljErLg51uZ5/jEWL+COHrS31jqn6y4I9y5c7zj+ceyWy33UxKhl
 gG1xl7MwH27ruQwCu/+wN2RF
X-Google-Smtp-Source: AGHT+IHP0p+NONiLl7i2Vw7OYvZPcYWuVz1tQmt2LIN0LjY2OtrDWpizb9LboFu7wNKv18MMihvTqw==
X-Received: by 2002:a17:90b:358d:b0:2ee:ead6:6213 with SMTP id
 98e67ed59e1d1-2fbf8f59ed1mr5770571a91.19.1739401485964; 
 Wed, 12 Feb 2025 15:04:45 -0800 (PST)
Received: from [127.0.1.1] ([66.119.214.127]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d556da47sm695655ad.187.2025.02.12.15.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 15:04:45 -0800 (PST)
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
Date: Wed, 12 Feb 2025 15:03:47 -0800
Subject: [PATCH v2 2/2] drm/msm/disp: Correct porch timing for SDM845
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
In-Reply-To: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>, 
 Tanmay Shah <tanmay@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <groeck@chromium.org>, Rob Clark <robdclark@chromium.org>, 
 "James A. MacInnes" <james.a.macinnes@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739401480; l=1738;
 i=james.a.macinnes@gmail.com; h=from:subject:message-id;
 bh=y4Incp0qb4B4ngPLB+sALUgrKMocGxeOHTAr68tsUbw=;
 b=Vqx/NFaijxFNP/RnAZxTLuD4GWG+Eyg+gmPQCUi+e2pVNsHZnPUs5Ow8PG22uJ66Z56c3Jw58
 2AgMigYprCpCCP64ekS83C1DDQfTO+hVrVLsPfH/cwQ5AuB69VpWm/G
X-Developer-Key: i=james.a.macinnes@gmail.com; a=ed25519;
 pk=3z+XoIMKkNT7N5GL2WOp/Lcz2ghtr7b8RBCa1usTz9U=
X-Mailman-Approved-At: Wed, 12 Feb 2025 23:13:20 +0000
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

Type-C DisplayPort inoperable due to incorrect porch settings.
- Re-used wide_bus_en as flag to prevent porch shifting

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index abd6600046cb..a21addc4794f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -94,17 +94,21 @@ static void drm_mode_to_intf_timing_params(
 		timing->vsync_polarity = 0;
 	}
 
-	/* for DP/EDP, Shift timings to align it to bottom right */
-	if (phys_enc->hw_intf->cap->type == INTF_DP) {
+	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
+	timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
+
+	/*
+	 *  For DP/EDP, Shift timings to align it to bottom right.
+	 *  wide_bus_en is set for everything excluding SDM845 &
+	 *  porch changes cause DisplayPort failure and HDMI tearing.
+	 */
+	if (phys_enc->hw_intf->cap->type == INTF_DP && timing->wide_bus_en) {
 		timing->h_back_porch += timing->h_front_porch;
 		timing->h_front_porch = 0;
 		timing->v_back_porch += timing->v_front_porch;
 		timing->v_front_porch = 0;
 	}
 
-	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
-	timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
-
 	/*
 	 * for DP, divide the horizonal parameters by 2 when
 	 * widebus is enabled

-- 
2.43.0

