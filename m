Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4578A9676DF
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 15:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B2110E0D1;
	Sun,  1 Sep 2024 13:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PTM9L29q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E32D10E0D0;
 Sun,  1 Sep 2024 13:58:34 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2f50966c478so34823381fa.1; 
 Sun, 01 Sep 2024 06:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725199112; x=1725803912; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+eCXOU2o0WyaxUOWiQryFOZ2WSRKqjV/d0DGCFko1Bo=;
 b=PTM9L29qpyGGaa9joW7y+ONNfjZwtfpCds55EoaLFJfFGC0g7O/HwTRc1oB3kQ1vGD
 aCCGi8+9p1xQxukMth7RMYbbo2+TL/Qyv7538DwBJ06+Wnh5DWccFyy4aPtiYpCURC6r
 78W19slShWBDSICB/QtpknMQuujPWVLJ9gxArExJaYrIVZJhGDQo36/0BbMyadmsPaiv
 r9hdRtevATSGvaHLQSowjd5a2Mpt2iK5C4X/HIVRDC0tFUphjjynsB4XTM6kKAgFFjmK
 GPVuTDUyH7/9VU7ofl6pUKB8f5WOO58tiRA7Ip/tMiipHf1Ob1HfWezQJMQBpPGKcr63
 58UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725199112; x=1725803912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+eCXOU2o0WyaxUOWiQryFOZ2WSRKqjV/d0DGCFko1Bo=;
 b=YcN2G+YQ/GwIwLjeG3GjPgmNq/ivHDNBkc2F4Y+8+3mScTmK6AtZov/EaNWrWcpvqE
 GuFg72ZUX0yHnzYLci1Rgkgkay9XPOCBJ5A17gLIiD7zzgSSoJSfBP///qK+ziDtfk7S
 9P2/cAKa10ZiSKWi18a+BDB2Fug1zIXDBSFynlxSWAUHskdaGsXmEf3YFRK3rmUyKkWc
 cevX7nJQ5OPY386ZRnGDltF457w/bFJSPsI+ADOuffAWo49QlP0smaQH2vxHBBRIr4cf
 fSwlIPrDObsxvhy1JhZhTj0gVxW96inCOiv4w44JhUPxaTcCWYTyn67GO0b+DvZOkJCP
 Vj5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKfiASfOYcmQwilHvwKJSFxNeL3YURtHWqzx9rCqhc7+DB5nymhUfORoQmZar/G7kfv1q3DEhau6uk@lists.freedesktop.org,
 AJvYcCVk+rysHFy3PeyxX8m1DT/JUZOGBJfQeu75wziyJcXoWaQgIwSWxxN/CxemgK1HVVxEfVq+xMGAuho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3OwfMVqWGIQlIiZUtL4xNAbkwgJt7qtuhC4dCxwe3pJyyQB1T
 pxu7TNJG4M2cUCT9AvWq83OTKdsgwgvCvYFV2cMLkdO4crxkEJ2J
X-Google-Smtp-Source: AGHT+IEhJhR+EGTz9SVuSnRPn3GWsNoA7zhQ8yY5bQFJ0WhnpllSB30EbmSSaMGVYnNQTqlr8qSSfg==
X-Received: by 2002:a2e:851:0:b0:2ee:7a71:6e3b with SMTP id
 38308e7fff4ca-2f61e05d76fmr44960571fa.27.1725199111104; 
 Sun, 01 Sep 2024 06:58:31 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp.
 [219.100.37.233]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccff17sm4051295a12.73.2024.09.01.06.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 06:58:30 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] drm/msm/a5xx: disable preemption in submits by default
Date: Sun,  1 Sep 2024 13:54:00 +0000
Message-ID: <20240901135419.1075412-2-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901135419.1075412-1-vladimir.lypak@gmail.com>
References: <20240901135419.1075412-1-vladimir.lypak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Fine grain preemption (switching from/to points within submits)
requires extra handling in command stream of those submits, especially
when rendering with tiling (using GMEM). However this handling is
missing at this point in mesa (and always was). For this reason we get
random GPU faults and hangs if more than one priority level is used
because local preemption is enabled prior to executing command stream
from submit.
With that said it was ahead of time to enable local preemption by
default considering the fact that even on downstream kernel it is only
enabled if requested via UAPI.

Fixes: a7a4c19c36de ("drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c0b5373e90d7..6c80d3003966 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -150,9 +150,13 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
 	OUT_RING(ring, 1);
 
-	/* Enable local preemption for finegrain preemption */
+	/*
+	 * Disable local preemption by default because it requires
+	 * user-space to be aware of it and provide additional handling
+	 * to restore rendering state or do various flushes on switch.
+	 */
 	OUT_PKT7(ring, CP_PREEMPT_ENABLE_LOCAL, 1);
-	OUT_RING(ring, 0x1);
+	OUT_RING(ring, 0x0);
 
 	/* Allow CP_CONTEXT_SWITCH_YIELD packets in the IB2 */
 	OUT_PKT7(ring, CP_YIELD_ENABLE, 1);
-- 
2.46.0

