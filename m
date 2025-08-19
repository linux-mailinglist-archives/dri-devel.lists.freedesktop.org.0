Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945D2B2B60D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 03:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EB810E508;
	Tue, 19 Aug 2025 01:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eDAD3pL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732D410E501
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 01:31:33 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2445806d44fso38991795ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 18:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755567093; x=1756171893; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
 b=eDAD3pL+Wv7mUmvk8UIAVcXXmu8+8rBOd06XdEVhQh4MbTBqLZxdP2NaVclDh7LrqZ
 H9RaEA4z/LGAwZg6s1lD1dXaqKWWqar7faTqsXLMc8yG7W0MA77j/Ddsppi0Lgkjt8aZ
 ViQabswzIWec/UlqSNKhufCcoDrvyrmclMsetFFsmt6boO9ih537dweGx8R53TE/iX9G
 +yCRlceBhjvS/wuqKS7CJT5lWPVOTyM/EyKHIfU9mPEmnZfQbJhMZvaNOf8PymfBvt6C
 DUFsg1bZeKTIGXFuApzbP8CqT38EuoKSlZYJG62i9wHIEpvuTPIOiQc1Stfc69C09n6P
 5cwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755567093; x=1756171893;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
 b=wLj7SbMr0PYs4JwBsX1uwhfvmQk7krAz0sXKUeR0hI1jTRT5HMBZWsHhjKVOaue65L
 LW00balzLdqp97FlUK4OPjLj4n2ICxaLDRjGiUX+Bq4sGGIwwRGCWdT7b+x+u0l2a831
 jMK4nkhhGCKP2uwA/ES0t7dWytGJXSc5Jz96NLG1M/iVju+a5c8Zs1YBsoodQJP98X7k
 rlc1Wd5CoYXXFTgqcgfnFrPHt2zjfn1IltDiGLiin/PbKeYhO89CWvuD/sfo5JiUsmoZ
 0NLGR5tlSec58IhAPPeEju4OBVnmxtw75Y59wUB7YQYSQPYzu5nFGHxFJP5kTBM3TPVC
 zAlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJEFOziypFHzfqRciYqar4hogNn77elXtLqlXUOSI1Ix334SYjCeZKf8GuZrKrUMpE5q/+nPB8VxU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6h0N1c/1aeXn+pQwQAZ/FF+vDy5VfJby1d7yvEH6iPNSk9V/6
 YcSzst/87m7A2j1hOezu0x6Azeum22XND473/wWKPfIqX3IorfglwGfh1yNZ2Lf5pT4=
X-Gm-Gg: ASbGnct1g5oZ+3lwIxARENUSjXdqNjW6DssVEg3yecXDKeIDm3hC95RuwwhqfReheKm
 FTp5o2uz5M2j7Wq6PaDXW+gE90q40JeXMFpZK8L8LmDweStagV8BPWhzDG8apb6nxCtjmgXHxbN
 5/G6VW+4DokVaD+YcM4P7TiSTTAD1PUgiECWMu5wKAXcHET4uO99wK92BZrB2p0PSQuzFy+vKIs
 4/MnmvBjSMm4pWxVs17jNJ5E3UJq4S4fsb7hnWZxMzwW08fRmxITAhbuvFqFFaNlTXf22DnWeGX
 kMF8DJ0OYief1PMfMiOxKBFDwYUcQpgLs0JRhlx3c/zwMi3v2guNekABjGqx9G4GYK4ll0m+A5q
 uLv5FWiDrT4xzNQ9zKg==
X-Google-Smtp-Source: AGHT+IHVbtYW4RYQHQZZskiSfzFwAgdNTCMwz7Kd2QtknRvYYfJid2ZZhGW6Kqr8W4eOUL8j+y1ocw==
X-Received: by 2002:a17:902:e5d1:b0:234:ed31:fca7 with SMTP id
 d9443c01a7336-245e04ca7b3mr10841685ad.48.1755567092833; 
 Mon, 18 Aug 2025 18:31:32 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3245e4faf80sm248637a91.5.2025.08.18.18.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 18:31:32 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 19 Aug 2025 09:30:59 +0800
Subject: [PATCH v15 05/13] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-v6-16-rc2-quad-pipe-upstream-v15-5-2c7a85089db8@linaro.org>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567061; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=flbnou7XSx1ETCmAxdlZnvB3+bqdNxru9LUU48yIE7A=;
 b=tjVmr1icovhUDDSu+7xCILY21LeUOkpXcuU8bCCTs9359a8eqqh7Ucze0DQ59Ne0RsSEPBbFS
 W+ASKuucYSxDL8++f36loqo0PdDJ1JBQt26jhvadshdJAR+5eZCiEmL
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

There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
interface to 3rd PP instead of the 2nd PP.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b476d3c97ac9b6b4c5ca2963aa4a5805d57c8d7e..2d88d9129ec787df6dac70e6f4488ab77c6aeeed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1158,7 +1158,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
@@ -1237,10 +1237,16 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_pp / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);

-- 
2.34.1

