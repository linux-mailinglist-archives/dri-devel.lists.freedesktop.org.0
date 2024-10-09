Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A4E9963C1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 10:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC75210E696;
	Wed,  9 Oct 2024 08:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zY27jmH+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3F410E152
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 08:50:39 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2e28d7d44dbso1195738a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 01:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728463839; x=1729068639; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=E/voAymQ+FLo0K2rDmsz5j/XLkoeZJYYbnZfE87o5mA=;
 b=zY27jmH+xUoDbr18qCzIzUK1hej4cWtLcezJfiQ68QAqZdh1+rpFODsOQGKR8iN1WD
 /JWzRwEekKyP+kqvJeR3KIWIVZIeDJvaag5MbGZZn4VeobHEIXbB1aWia2wjGt0lEgcm
 VNBe0m1NtstJof6R2LbHX30wUKHVMB4tPVUwCB5yzmfobkNGA2SxKkk9Zw//CHhPd8Zo
 Y9A2i/L7+yRCwg0RiF9c/kOCpHL6yyO+6Cn2tkXFLV2y2lqkJqhChMJuG8KjS0nVS2Vp
 xfz6fHoAygyh5VoJhwaPPjBjsG5Onq57jGzZqkLAabw+/ACvxp8g8APAp0UejtG7hIGZ
 E8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728463839; x=1729068639;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E/voAymQ+FLo0K2rDmsz5j/XLkoeZJYYbnZfE87o5mA=;
 b=YKyZpyIP0s3R88AAexPJ5ZLIYQCU89jwjcY0LMbodhfxMOuLUKTQ969SE1+KK+5YAa
 2cFSN/UI76MhsR1lAIwqbdWrzqU88np5LqxXUR/8yvqYp4Y3CDrLef3DvM3TAx3eUbzL
 Y28GbFzIyVProQdmMZMiSSb9bHDBohVr1gRMy0XC6SExMrJMvD/+8FTvZVVnv1AQxp0L
 XCuMNIhwTDleSFgVGYZiwYse3nnd2+zmeX3fexK/Uc8tYHKgt6kVG7GxgHGjgWNOmYsd
 E19bZwvlTvzJNakr97dySP0F84lc+GyuI8m3JutP6u+tUTv1FA32rQOnu1B6kyJ4uHMR
 02rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0HiNuc66xvWtB+pOdBzyMpQJKINDCAtRBTPjAK/YYOPesa5N/gyrzNczjCfeReWulvkOyed0d9F8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweyzVk66muRS9osVP+GFMXSvlxnae6StIlGne0qTcXYA9ptIRK
 QMct/O8L66WGFKTZgZQW8mR8P21YH0+kmG/W6plI4xGBqQd9VJj2o4HEnDxb1T8=
X-Google-Smtp-Source: AGHT+IGLdVPxQWHieF+9EHa8/WCKnJVudcn9L6wpuGsElJdCrsUD5SxSB2GtYHpHGZh8Ho+Hcyh1Xw==
X-Received: by 2002:a17:90a:3489:b0:2e2:9a2a:d218 with SMTP id
 98e67ed59e1d1-2e2a21ef24bmr2165076a91.2.1728463839143; 
 Wed, 09 Oct 2024 01:50:39 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:50:38 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:16 +0800
Subject: [PATCH v2 03/14] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-3-76d4f5d413bf@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=1237;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=WThdm3+r0o6lcg95hlJxNuerWQ1yzvjO0VMSK/DVslE=;
 b=XyWO3HZGDntoWFWpltwc8jk91TUGcI9j/DmmGgwXf1vPYLP+Lq3fLNGmynRO2WPSmNAdXF8VD
 e+84dPuuD53B+CK0+Zi+DNVJEJHL2kkrA5b3HQ84N4bqC1gD7g3BBDq
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

Add the case to reserve multiple pairs mixers for high resolution.
Current code only supports one pair of mixer usage case. To support
quad-pipe usage case, two pairs of mixers are needed.

Current code resets number of mixer on failure of pair's peer test and
retry on another pair. If two pairs are needed, the failure on the test
of 2nd pair results clearing to the 1st pair. This patch only clear the
bit for the 2nd pair allocation before retry on another pair.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2b03ab907c2bc..5c9bb64df7930 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -306,7 +306,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Clear the last bit to drop the previous primary mixer if
+		 * fail to find its peer.
+		 */
+		lm_count &= 0xfe;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,

-- 
2.34.1

