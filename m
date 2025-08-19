Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614CFB2B608
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 03:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8B410E506;
	Tue, 19 Aug 2025 01:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f8P0qEkq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F274010E506
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 01:31:21 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-32326e5a623so3885021a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 18:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755567081; x=1756171881; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
 b=f8P0qEkqmlkS1o+Ml2mIR/DmC+OEQBi1VqszylAjWgYwx6ffKBuuX2S70z39wrJZS4
 QD1Ii10EaTezO2djnE/dNZrMd56HtiFDHHU9g3H7hFDgd1xmCRwBIU8Wd7gGOOqDcVsT
 C+UntNzJ+kZgYEHpluj4/8cvnN0r7NSpt8ZKxDVpFAZU40v2CXmiPIr11Xr3gJ2zNXW9
 gBm31923ykEYU+2X4kNqgYofE7E19kJFS7fwqZPXX3iaXfRL6FH977q/9ahWcsWJjbEE
 pdk7NEXPXP8rnY4Qk4rAunFvMRmEd/CNu5urTCdgRPc25HiNA+Ptn60RRzq0QtM0vDJf
 5TUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755567081; x=1756171881;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
 b=RhhX03i77K4JfmUEQ6GmG2NkFiJ4AqgukZChLbRadiuRoEPuYOp/k0HwaDPMZhtkGF
 +CFMcWQktyqE++rwB/H5ni48wLnO7zuUVgI5/Usr421nQHc4gaOkOroaqe5SkrxwZci8
 Q5FtLly3f3d5+qiuhnxnSx1Vl42nJfA1riAh6TTzt8sadjIig1ugj2bEq9uw/aBx/coo
 SbBMF9/t0099XaHspZjalMYcEf38JrbYirrgN8Vw+1M2oVDJkqFpkyzEdOcHQbbkJMAs
 ntq/YJMb2iDvK2DatH44uzQ2LY8Bw1JXDvX8hD9qOiLbAND1UYM2W2FWzPBKcNSRug68
 0faA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoFfFvB/Pzw4w9e4YH9gsiJDfbwVAu9FoibBGN2d8ADR1AHiXAIgYVYSOnHQ/kJBBWAJgYesFw1I4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztOziANApNghqoqAFnq7NfeKFdmv8Bn6Hruxh7USVQfXI/nZLl
 NvAu2MITB1tkv7cqf9f5VQGCzOPrwKbwZKCaLj9I2PxsNs27aUQnuEVju0rFZcdRNEA=
X-Gm-Gg: ASbGncvF6BPvMAMkWHIPXovLfSzmBIj7tPlulrAA3mNM22juMnY9s1f2ONqWcGWYhgo
 penDgf3NE367Cjq6G+H4Pkmfp78lqSu6WtnnA+38UxD6cmBEO33NoX+HNuUIzdu6ZNp2cbTZEhJ
 PsfXEj2v0uVfo1psAX6EdrTvu4uq/zb9+iIBQuP1ZMnzsJrLlM5JDanLSO1viWjc7Fe7XLOa2eo
 F9Cl6kiQRS3ftfQWuWH9SKXbJQmOoWlh1vjfXgI9AGZ76YC5WlikrKdSQpvJQpDvi7NSyKActVt
 XX3dOlUDvNXIGfLCTSdjEk2RJwVnAHX6Yla6jrRmjIj1/NSZy1eeRWMYwRLXpPggUCIsUbFWnY9
 p3oCgEaJXkRU5Koatzw==
X-Google-Smtp-Source: AGHT+IHsqfSLfsmrlFST+ENYayoezQghp4VEB2nLn4dJzMzMWEWc/lmmasXNyozxF8zA5e3IljcCrg==
X-Received: by 2002:a17:90b:2cc8:b0:311:c939:c851 with SMTP id
 98e67ed59e1d1-32476a4f190mr1303029a91.4.1755567081241; 
 Mon, 18 Aug 2025 18:31:21 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3245e4faf80sm248637a91.5.2025.08.18.18.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 18:31:20 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 19 Aug 2025 09:30:57 +0800
Subject: [PATCH v15 03/13] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-v6-16-rc2-quad-pipe-upstream-v15-3-2c7a85089db8@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567061; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KP97mkf4mFx6Hynpv+UvTtqAjJLhCHcsa39rmhW+j40=;
 b=YoZ5FtiM7UZD4XTi6fivtdVzU+G2ybZj+qrFjggUBlCvL1Krk5X0FNM4ec81wpW7LAShhi1N+
 DMHZL59GWxPCXAwtIhih5Ir2QOQcxPAWn45fJTn5T9iZCg6Ml0flHyO
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
index d4b545448d74657aafc96e9042c7756654b4f0e7..9a40492e5aa961f7180ba4ac6c86e06fcccef8c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -377,11 +377,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
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
@@ -392,7 +391,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 
 		cfg.out_width = drm_rect_width(lm_roi);
 		cfg.out_height = drm_rect_height(lm_roi);
-		cfg.right_mixer = lm_horiz_position++;
+		cfg.right_mixer = lm_idx & 0x1;
 		cfg.flags = 0;
 		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
 	}

-- 
2.34.1

