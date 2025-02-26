Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 930CBA45F22
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 13:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BB210E148;
	Wed, 26 Feb 2025 12:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xkbib7e1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7710E10E23E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 12:32:38 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-220bff984a0so142820075ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 04:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740573158; x=1741177958; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ieoJPWE+tVOeqiIoh5GOinrnACdNHE09O5GdzPDKAj8=;
 b=Xkbib7e1kSHsYg+KzV0ojagzII0hFQWUag1KtExfYc60AO9KZF3G8khDdpGOfr4dAH
 sJZng4IYSIDc8Rq6dq/KEa6UJ3QiB2IZVsPbX7fEIFTojE99oZWJ4upLCEZzOFXHeE8o
 Dp4UUqK1SutjpKigV8K43lY9+5NtQxbwxJIPXga9qcKK0xB0jcpGxH6LIdmWOzBFL0In
 +UB7s64ZaIKZT3rMkkUQYXf18W+G7Ys+H4BrgiH4dowj/0RoLH+TVl2/5CJLjEd9zGMY
 P4JWa6g7j+ktUo3dUUdfbf+0m4Fh9KeCPJ8f/gDeY2+MWhqo50H5SWgEs43sAqDgZy4Z
 WwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740573158; x=1741177958;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ieoJPWE+tVOeqiIoh5GOinrnACdNHE09O5GdzPDKAj8=;
 b=hW0V1uXNIx9f1etUNV/mzdCZsG7PQTb9BaokVZrwSwfRqZrCV9293dX3zJ6EoGf9Ge
 bsppM/MVaOH/uhEsS43kbSze8GwgQSn3cSplnOMd7J6LWJCL0i3DTKtLIQuGDgm6bGw2
 U/4KTnNZ8XHcVpU4v4Rq0ExN0OUivROK62DgO4vYbUv1AeRHiT6j4+4hbhtM8MtBq/sw
 azldkxqLxbQHSnGd629LEoOKfPQ0a/pZnksGx+bpn8v34UFHBh2NqYUUnEiRjatq1xc8
 IBhUZnc+hcyfvTUwF/LaGBZu7rDsTRd0fuGl7VWf2vBuaOfhxuoGrXE6h8WAdqwTxaJh
 SM9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIl4f7fgkt/n4C1LmFWCgmK784albRfOEiZZN6q1o7UmKkqkcDC/+8E6dBhnObd/eIiAUyeMHUoDE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzowCZ5pK7YkZsrlwfPC2HuGjjQZyJqwrN+JMYVlb7YaAx+FcWR
 DOLobXLxIUfZM4JexlaimyYRrFcFE6VsEE5Nu/bi7i48/2ov47Cmu+niwfMYEYI=
X-Gm-Gg: ASbGncvtGlM8NQrLx9l9Ysqay37JCX2s5ZzG67T006iFuB/tqUT7n4YNo3cRNpfogxa
 4Pv3zVz2ZKXwR5RX8VDVPe++q/+HzScXnVImDismv5TighGRVp62FQhdJBkl/uF5ha337CntcHo
 2+T4uXispn2y3NIXMA850P/wv8XIjr63D4rSedaI+6vTCO62FyaHqsXgeYfjZNbj76by1Qg/5uM
 OKfLz/m3dhwUmOM4KiZ2tGhJ2/Sf0DlR5fTOc06PIgfEHNK/nexXvKnK9gsfqDewmtvmHqWdwZC
 jgT51cRMaENVx+QrIiiLjw0=
X-Google-Smtp-Source: AGHT+IGxCpm6c87VHcHSRCVwCoTBdyNlaV16AoGKzUByQr34biDV2PJwVjWTV2ugBLhEsXuId0VJTQ==
X-Received: by 2002:a17:902:d2cf:b0:220:cb6c:2e30 with SMTP id
 d9443c01a7336-22307e70df5mr103034395ad.49.1740573158022; 
 Wed, 26 Feb 2025 04:32:38 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 04:32:37 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:30:52 +0800
Subject: [PATCH v7 03/15] drm/msm/dpu: configure DSC per number in use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-3-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=2046;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OxydkO597ugBLy/eoQLhIhZIi3C8VBz20HvkW34FMds=;
 b=8LsEkvfOXTRwY+2+qNOVgFqmJCnNVHJ+BnG9iZofkWpIytLXTAnwPgykXX2EP7dpmSQV5YtFq
 7XxjMuY8LC9BjBcG6Zl5DHZjN7xn9fLiR/uXg2uPW5dEaGthrdNHXT2
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

Currently if DSC support is requested, the driver only supports using
2 DSC blocks. We need 4 DSC in quad-pipe topology in future. So Only
configure DSC engines in use, instead of the maximum number of DSC
engines.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c734d2c5790d2a8f5f20c4b5aa1e316062d9b34d..5b98ae96bf5d46872a7af801d4157820d72af01f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2027,11 +2027,11 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
 static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 				 struct drm_dsc_config *dsc)
 {
-	/* coding only for 2LM, 2enc, 1 dsc config */
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
 	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
+	int num_dsc = dpu_enc->num_dscs;
 	int this_frame_slices;
 	int intf_ip_w, enc_ip_w;
 	int dsc_common_mode;
@@ -2039,7 +2039,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	u32 initial_lines;
 	int i;
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (i = 0; i < num_dsc; i++) {
 		hw_pp[i] = dpu_enc->hw_pp[i];
 		hw_dsc[i] = dpu_enc->hw_dsc[i];
 
@@ -2068,7 +2068,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	enc_ip_w = intf_ip_w / 2;
 	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+	for (i = 0; i < num_dsc; i++)
 		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
 					 dsc, dsc_common_mode, initial_lines);
 }

-- 
2.34.1

