Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D3CA1340F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1104110E8C8;
	Thu, 16 Jan 2025 07:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cDAmmhNM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6A510E8C6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:27:43 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2161eb95317so9366945ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012403; x=1737617203; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6vUwtbv6QkBMkinOtoSzI57ocGpisrQ8kP4ZBj8OJ9w=;
 b=cDAmmhNMhLVvJxXNgZknwL4NTkIb/Pyw3FIWu6VpT43U1CUHdGuwrY3IPkVn4WD+mP
 JxpzbBGyM6h6ieA2eaeEI4gl7Pg7jpnOV0wtOmW4n8vFxoHgeFibJd7lcwqg+Eh4LFG9
 QpHX9vhu0nTV18Mgxm9V8xKt4mgoyvnFuFAnmBpXFisKR80FtNdvibyOxS808poSEox6
 qfc3L4f6EQ9fWvJSLVPpauA8SE6vUZbd+0LRwvPBqfJkYLKRqkhQYF7RxghDa1MiYf1J
 BK0UJaam1XxIF2dBQzHL821K/+ZPRss2TLn03GX/O4uBx7OtKSAAK1ryiDCEsb/6iqFt
 eO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012403; x=1737617203;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6vUwtbv6QkBMkinOtoSzI57ocGpisrQ8kP4ZBj8OJ9w=;
 b=bfIn3oPEOl8v2PoXHgA2J3L5yfwwrKe/5k3B9UquXl1WCQV8dw47wiSKi3pvm+0eRj
 3RpsxsY14AklStyHwASfBNfthNjrFHRblReOieX7IANv2FcYTjBFZyDVXZ2SMUw/dIdv
 bsRMoNJjPW/e/cw+DHuozPi3pW8K7PsNUIPn08iFq2useLgAjOZhwnbeRh38QrJmMwRM
 7/Og+QxmuT7+p6fsCy+91Depr9NLebi7R1yWobICanXmOVeRMBh+M/6D80YOK9oLC2Fy
 5esIwiGpxapL1oxoWH9DQXQq0rsQJ/O0Zsw7t9Ij5d13W6vfqKGG02irn1XqzXsJtOSy
 V0Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf2xlo1MQlY6rUaoxbXbl34j/lO0yfMFaaSCc1Vb0reKOVsgESVyidP1Bhbbifq1erFJviCJVuIHY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/eOQq3V0H5MFy9HkrTDFbzEZ66A/bFaGUST+jSPCtVFCtS6Nk
 pxrHm8wzYt+LwntjSjm5k1W9WeBBrayAF46PxE+cX7mTogL3cLt0hr2tCDR6rG4=
X-Gm-Gg: ASbGnctpMaLSLx77Z93rN9oZEeZjGp9RjNS1BOFpKryszFx1Iw0QTU/k62ZcIfWYV2q
 A30ZWvBbtfiHh/pbc+F0uPa5KDFQQLGl/gBMmlQ0new++1SH6ldGJtMmyUlqU6vWopQ07msgPvS
 8ldVnby/yRIKgjYACPrxZffweC+HNC8aX2poRrOW2Q8PvAZ21IxQkTOfXOKHPQqDL5eV6NC4o7Z
 l7Vk4qSkazc49LGbtc/HgROvpLm2IdlO8Xlb43SJHJWjA6Rd7nabw==
X-Google-Smtp-Source: AGHT+IHEZ8xbbHf6WOE5lVgvL/EZZjzSZcR/ONwuLfwLhiLy0XL6LoLqBpWJ3PuAXM7IxlN82vAVrA==
X-Received: by 2002:a05:6a00:4485:b0:71e:16b3:e5dc with SMTP id
 d2e1a72fcca58-72d21fd8b84mr48514252b3a.19.1737012403491; 
 Wed, 15 Jan 2025 23:26:43 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:26:43 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:55 +0800
Subject: [PATCH v4 06/16] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-6-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1148;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Sj3Czivhsbaa4LJdooT+esNwlFrWC/YCnOEkeTa//RM=;
 b=wwLDum0ZmSKxVWLUCff0iyuTso8UOKgLOcC3MiXn4ZuV5Y6iB9FHmaZj2ZQVC7cFkBqmZxjDI
 a2qygM2FjnWB8cXJ4P9EoUGyKCT+CWVNu+4OQpOFxt5SOMAwFQ1W45Q
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

Reset the current lm_count to an even number instead of completely
clearing it. This prevents all pairs from being cleared in cases
where multiple LM pairs are needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 24e085437039e..3b3660d0b166d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -321,7 +321,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
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

