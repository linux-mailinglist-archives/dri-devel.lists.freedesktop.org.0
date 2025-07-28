Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F444B13B1F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 15:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E073310E510;
	Mon, 28 Jul 2025 13:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HZGDm25d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C57010E508
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:15:04 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-74b56b1d301so2883104b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 06:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753708503; x=1754313303; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=HZGDm25dLP9kMNs3Zka5tJKKfu23o6ulUs0Tfk+v1lZKsa1DbzmEHuDWwj+N9P5v0j
 8lAtazxvTLBpa+STyAPvFZGtgiF3Qfehbo9Zsm977P7q1k3fao26ggfaIL7865c0GNgG
 MDTkxU6XDanRxBBsCjQPWdr7LMZQaU9A3PSFIL0UiSTsbdEEb+NmD9DNMFB4xEM7B89O
 wuprQfzAYOnW0Q8OeUax4IybtX8qmNGnqxuQ3sAuOlizW9KaVLIrUgo+reH7tqOqrZ3W
 3LCZR6CwEBe4S4EpQhQqr+jfMlcb8Fv06nIEp/SVs4ZOmeLVpjpOnhbIbmi33f2hBXXM
 DoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753708503; x=1754313303;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=TguHXjQHsK1FyIdFDxg9j7u3Ub2I2qtdZP75w8yOtIiTFHGbIdw1pDFw7EHcDaMJsB
 uck0fYB/Diu4Jk5uySY+HK3MUo/Rwul6xMhJBvHZRdFl7/30DRtBH1mCrEcPaS1qAo0L
 5q8GfJ++F8TiyiAu3f4RE5GxubmZLW9Uye4BEZhuOUmT5oihrKCUIV8KgxpgeA7vp9ex
 NZBrXk9AKProqet8DwL68jUrnhIc9dsCUeBiIA7br2lCv9F4uAzM7eGv8xILaGzu9vVa
 rYb5GNieFtYEmXto+baRRrCzIZblby+SNpM1yyxMWQS7QlBvCPcqhcGwSEieUdIvsApZ
 bp6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYWVFyV2DXpYcSKrHyeyB6gLsZHGMOJnmpYimAWKB3PRTbubDu6dkQFRnnC+N+w230Kheo8s1u2Xg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfboekSqoRHqD2LCtnUKIjySIJvDiyGG6WW0O2HVaCT9izL8b6
 WY1vQo+JZAT3C/oCzCW4pH/bYFqlYiBh4DzzxA1HxJzstjNfFrbSjF443t9DbIl1ncSe51jD+Sz
 0MDzggWciNQ==
X-Gm-Gg: ASbGnctqwOqYves/te3MPYWPja2Eme6EFKPSuqk77HuzlqoVe2b8LyI0ibjXfuDcbYI
 HeV7ILKcFYI22qSC16bhlrqw7kPAvv3kw1ZP1yNM7UGnZ9an5ymI/fKNRAtCWrszv8AYBU1P2dC
 uwaZw4a3Bg8zWYSGXJIFyM0L3f0yHkIdE9WQjYq8RsL7Qe14jXKAAiXUtlX/Pf/T7Ijr+HfOwGN
 1Uv49yfKQ8ouhUJ+9R3zWPXRX2dX3slbf698ffzDYgsmTWM6XYVkQfz5HJKDkVTzEgGEpMk8O9K
 xQfOn22FlPjzUtiySTP6obYtHzsSJgZqTrSSh16XanYeXyKGQjlSIcJbkoo5GcIPulPQnE0zNle
 4INYMK4QIc2M+DHzbfQ==
X-Google-Smtp-Source: AGHT+IFj2E3U/6YpkOvYCA8ArMdplIVsCoa2oY8AWe4ZUCEotDWUm+laRMwrkmmmmbNPtBLZanSIFQ==
X-Received: by 2002:a05:6a20:a121:b0:23d:54cb:2df6 with SMTP id
 adf61e73a8af0-23d70052901mr16496549637.3.1753708503406; 
 Mon, 28 Jul 2025 06:15:03 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 06:15:03 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:27 +0800
Subject: [PATCH v13 03/12] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-3-954e4917fe4f@linaro.org>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
 b=1mgRp4HOTSbHr7EQxPhuUonHpasr6Cq6GSUykYOQvvzIjqlRzPVAefXzpymPuLtdRZmR0RIlb
 ZTopy74UAxhBMLncqhnjq7wEJ9ZjeYT4uM658ifKa6cUe5E0h6w6SJ6
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

Current code only supports usage cases with one pair of mixers at
most. To support quad-pipe usage case, two pairs of mixers need to
be reserved. The lm_count for all pairs is cleared if a peer
allocation fails in current implementation. Reset the current lm_count
to an even number instead of completely clearing it. This prevents all
pairs from being cleared in cases where multiple LM pairs are needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2c77c74fac0fda649da8ce19b7b3c6cb32b9535c..3f344322b7f214d0050986e675b32522f8eb0ba7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -374,7 +374,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Reset lm_count to an even index. This will drop the previous
+		 * primary mixer if failed to find its peer.
+		 */
+		lm_count &= ~1;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,

-- 
2.34.1

