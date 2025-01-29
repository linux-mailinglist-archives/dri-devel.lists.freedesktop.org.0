Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0338A21B6E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 11:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735DC10E102;
	Wed, 29 Jan 2025 10:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LuJ/O2V8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7648610E102
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 10:58:44 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so76075535e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 02:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738148323; x=1738753123; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BCZc8xDP9pPSNxttm70iMigfL5th12FqcCo7IOA6V+Q=;
 b=LuJ/O2V8CCsh2G92V041NCnGZSoqzTAxLq1ER73ZYKPMDL1yPRLxiDb7MDR0YGbgSV
 H0Od2NschCLeP9CNZolikpsAtvh/s5Tp5BBFTkQ4QXTrYwML66yJ0PdRqIpALnMn+9is
 5WOWVBnWFj71Bhx8QTbAOfS/pEoP4BMDsHd6l3++0HVu+ZkCsZFf/1VFUiGSBA75j02I
 WBQR1RZI85mE41hPke8WFEqUxr1V+eJYEr2H9/JwiQ3tM8H75k32xH08C/QnwFwP6ZnK
 TaCuqPM1arf6uPxjTV/c9HkUJSiSx35DZoxpxUZha4sGCkG8S/hpIRzCm+a2E1bscgoe
 r1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148323; x=1738753123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BCZc8xDP9pPSNxttm70iMigfL5th12FqcCo7IOA6V+Q=;
 b=FlnGo98Us4e24OFF0x5hi3oPb3y1Lgbk4tHPS3uVODKQrrQ6tNg2/ABpxXTw40F6qf
 DorDjGqqxgbnwBMyPeeau0m/rq4cAD+pyiDJDqu1lWwbhuX/V1uBGc/pmllRDyeT/Qgd
 /HkoVaXwm9sj8gxRfTc6UIh8YfcvB2uvPBXdtY8LBfKBXMO74bWsd0voFh0quCBXA65X
 nlHC0/CggPmkPJdhKVfZyHIm51Xu7obBWr/aJ1/GU9yb1cxkBhsay3EIqSlACVdi7JWc
 BnrRImeplmM9cOaHS7/JlnJOf0/43QbSc31pa7dsaB8t0LL6Nh/Z3n3zJj85G709bmux
 XgYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHeTpSRu7j+WyN4QuvOCkOHs2eHq0NUXx/BJmzYLgvH1oMAbthTzMokc/yRSghA2+kwHAN2SOnJpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweOmnqruIVjmNlSEJ1sMYSmc86jthsTIRf23TA49Dxr4M1eTL5
 PHO5s/jvw3lXP0vogurcoRzi2xHvxcZGSbBPHzuCw+wcsJJOwc21
X-Gm-Gg: ASbGncuExB7GtLAG1p2gS7oxf8y/+rSkdMKMKmRNvPjrPbjyz9JGPeavtPkgxoUW4TX
 IfbPNwA+jr7eEGUqRtUTENM7L1XOi+NHCa8pegcZAhI2rw6ocXHF98JeMn4z04uz89oPkVmrbLF
 O9EYK74mBiKBAp3NAlHEkke9C2r8Nt3OQXrMuFPPA5SWy2M73AYL3QT1YyNKTvKFxN9cyZQ1bkw
 1l9fPPE2/Tkkrh8Exp9nErrHNUWG31aFebccdtc/rU0kMJR19vF/1yG4WWkZvVDGAckADPCEbgV
 nOhrSLAZubMFsqiBnoz+7pprx+dV
X-Google-Smtp-Source: AGHT+IGgtaEqtH/cW/86/vQfGKpvANAEytRLXGcfmwRSAwJkb80m0MYMQgXmvACFtIwUpFret10jlQ==
X-Received: by 2002:a05:600c:1987:b0:434:fa61:fdfb with SMTP id
 5b1f17b1804b1-438dc3ccaf8mr20504355e9.18.1738148322573; 
 Wed, 29 Jan 2025 02:58:42 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:155e:6600:95fb:4b3a:6bf6:e1ae])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc27125sm18370265e9.15.2025.01.29.02.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 02:58:42 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: l.stach@pengutronix.de,
	marek.olsak@amd.com,
	sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: fix timeout handling in dma_resv_wait_timeout v2
Date: Wed, 29 Jan 2025 11:58:41 +0100
Message-Id: <20250129105841.1806-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Even the kerneldoc says that with a zero timeout the function should not
wait for anything, but still return 1 to indicate that the fences are
signaled now.

Unfortunately that isn't what was implemented, instead of only returning
1 we also waited for at least one jiffies.

Fix that by adjusting the handling to what the function is actually
documented to do.

v2: improve code readability

Reported-by: Marek Olšák <marek.olsak@amd.com>
Reported-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: <stable@vger.kernel.org>
---
 drivers/dma-buf/dma-resv.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 5f8d010516f0..c78cdae3deaf 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -684,11 +684,13 @@ long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
 	dma_resv_iter_begin(&cursor, obj, usage);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
-		ret = dma_fence_wait_timeout(fence, intr, ret);
-		if (ret <= 0) {
-			dma_resv_iter_end(&cursor);
-			return ret;
-		}
+		ret = dma_fence_wait_timeout(fence, intr, timeout);
+		if (ret <= 0)
+			break;
+
+		/* Even for zero timeout the return value is 1 */
+		if (timeout)
+			timeout = ret;
 	}
 	dma_resv_iter_end(&cursor);
 
-- 
2.34.1

