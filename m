Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F258DACC0D3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB9110E6BE;
	Tue,  3 Jun 2025 07:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bx8zfx3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1B710E6B6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 07:10:40 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-742c7a52e97so4319981b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 00:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748934640; x=1749539440; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=09EQIdwbqPWaqIZsSaoyN953CphfLgGdEAZpUMvdFt0=;
 b=bx8zfx3n+OQqavuwNVFyaXu3izXMrZaFfl7VFol6adsITJEofgkONoY09hjlDBHGqv
 1crgiC/4EXgxhn3S3F078bLrwZoSMTIt7NkJU4jwqSUKSQ7Bo2prGtWhjI3Ziv0O1gzl
 QgMSUa4HmR0O2TEMAwOG8ZRL9FTuiNv3QIsCvQT+W89RumPCFvd8Qc1I2PUPiMbOamuS
 JXPrmJ40TboshUM4bqyG6Rcs6rZVSIiiqLdcTMrlraj+upwf3zoHHf4Ky6NnF0wnc0Dt
 4UU42+14kjx9X4uuEmFzFmE8VvTvLuTPNfLjT5ak1ksJSV24ktnqqhPD179j1t/ZIuWW
 BftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748934640; x=1749539440;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=09EQIdwbqPWaqIZsSaoyN953CphfLgGdEAZpUMvdFt0=;
 b=XMA5g5iMXKzmsMMRnzeOvLplimEOBuGsyqt89QqTw9tIouPSZ8sSWrHvpdsC/nBmV7
 gAgIBNZWv7AMj9b6e/XONTUAApYyOOBvw8I57d3tut20nJGdh70J7GHwUiD7hH5dWY7i
 69yoe1hdzM5sasDjM53vA6TAWFHZKxWA1lijcMLSyb0rthNQTNqnivZZbt9OO9ZXfM99
 pd7eql9rdFvgQ29jdIQ5iqUUuJyU6aKfOMkKhJoA5I8n9JG314Ms18WOOwTTBm3jQwHI
 d3ZsXcVVnvAeUUcWjl6GWI/463FLrq9hdQUWgT+CD98sXBRtHEZNTJWrVVwQ9BNtDfXi
 ldBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2ZCCD5vFuyk1rnIXoyfglqKmd336NUBXiBnQD/RTc+XlbVFRL1eI16cpfaNtq8ha2Zmlx+rSXs0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/f9vBVJQP97Lr1zsGAdDT47PBo6WjuaIeB0VulRdLtQ1yzMrJ
 JlFXPD/6cOrUOtzv+PaaSIta6AE9NHiaE+4oBUNG3zVS52mUkV1rI6PVBrq/xuR0e0I=
X-Gm-Gg: ASbGncuGNTNfielTzsQqLkdWZ8eoEAInWnVfsJu/cUy5yyccBgP2IX9aznY57wQqYgC
 RdjUMdJiP/DuDAbfk92goWt65Mu8JycbOPpBOkn0BXT6QhShEvnpNCDvjPC6KQ1FzwtI4wJBsf8
 E6VALVxsmpGZAWW6D+1/YSlKicSaGnaeRxGiACdVtquTojLaUYiMU4iLwmSthd8bHzhxOi8pdKW
 aB6iHQjuZpB1gkGIxUwo5lhC57v9CY+xnMYdYBwWlFoLIjE0QAgPaiWz4APpfw2HPS5sFXhe+V4
 Zz8pTVTi1Vk9bvnUn/jeMQWmeZ05xm9mgNAJfyoooeSDI/boQVPVtZjHIMb+
X-Google-Smtp-Source: AGHT+IGzhRm7yCbJkZmMOYNmqhqg7WjLaJzDcNMkuQQ9cKNvZstXE3/8OZNtphp+Z/UVx8De5OFWBw==
X-Received: by 2002:a05:6a00:1749:b0:746:27fc:fea9 with SMTP id
 d2e1a72fcca58-747c1bcb1demr19677936b3a.11.1748934640332; 
 Tue, 03 Jun 2025 00:10:40 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 00:10:39 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:01 +0800
Subject: [PATCH v11 02/12] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-2-c3af7190613d@linaro.org>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=S7+JCdaVrPN/DIMlTCVGutgCbXcGk68o1VHEmTYxOSE=;
 b=SjZQ7raLn0cs26/PX0rJbOfm9udILhDAvPUe6OQ7Ops/duf02VCDnvY7zWww3qoXOsuGJc2d+
 p9aBR8zoVKzB65IOiLNXkNu9DsFizXrUaOo95xyRjU4bvq4Poszgi0E
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

Currently, only one pair of mixers is supported, so a non-zero counter
value is sufficient to identify the correct mixer within that pair.
However, future implementations may involve multiple mixer pairs. With
the current implementation, all mixers within the second pair would be
incorrectly selected as right mixer. To correctly select the mixer
within a pair, test the least significant bit of the counter. If the
least significant bit is not set, select the mixer as left one;
otherwise, select the mixer as right one for all pairs.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..90941ff4104f620d1f4f18ec260418ee59dc16b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 {
 	struct dpu_crtc_state *crtc_state;
-	int lm_idx, lm_horiz_position;
+	int lm_idx;
 
 	crtc_state = to_dpu_crtc_state(crtc->state);
 
-	lm_horiz_position = 0;
 	for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
 		const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
 		struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
@@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 
 		cfg.out_width = drm_rect_width(lm_roi);
 		cfg.out_height = drm_rect_height(lm_roi);
-		cfg.right_mixer = lm_horiz_position++;
+		cfg.right_mixer = lm_idx & 0x1;
 		cfg.flags = 0;
 		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
 	}

-- 
2.34.1

