Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6C7A93797
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 15:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9309610EBA4;
	Fri, 18 Apr 2025 13:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VzGQkfUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB07110E081
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 13:07:08 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so18476335e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 06:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744981627; x=1745586427; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fPmaDVcyCN8xn5x/2E/HujSFy+Zs3h3dzceOeOvtskU=;
 b=VzGQkfUGN0rEaldXWCAQ5b9PkEviKY+sjSB69NnOs64pXcqH/VoP05Gar9XA6vSEhB
 Ert09z8bDm47YTzjHn84nHfDHBb0ve9yUO08Tj7WRY7rdy8bqNKrH8JioGoKVzp6gQuU
 OnXHxLwM6Gpv7qz/JpFsKU8SQYLyHjVygauYkw5fdaiNF9nKp243vCgn+Qbu8o2JFO0d
 iLd+ziGaAQpWx+iQaoddJav3rJbSvEX23AC+hcVxWW/rWwzOiVICDln8/1PMk5epdgux
 rTS/UpuyXbuZjGgQJJ7SkhSSJkH6Bxq823mU/jBLUaiqIM1x1cv//rUNwag1hoKAq12k
 EVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744981627; x=1745586427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fPmaDVcyCN8xn5x/2E/HujSFy+Zs3h3dzceOeOvtskU=;
 b=YY3QIl7ssacIRs7zludwJyR0tmxQAzaqLIXlIkCnAl5KbpyuUdVsGMc5pWhgkcMNE1
 ZW+k+qQ/v9bxmOM+Fzt9oXQhS+2Ki5vQiorht1aZ2SdbucrVWXLXbW671LNBtpMd7uFE
 /WCWHz7asObl85Y6J7W4/29OevzpszHkDp5QAB0ET1B3HeF+LwIaZLm3/QwF2V7vQLIe
 PCmea5gSmrj+7VlqbqUsPhcpx/fA6cgohxmmktmaxmDwD9Kp2mNBDM+8mXqnrv8wc5ib
 0EEmtNZ595NiDEwrBfD6jxWI1j0xGvyTptDMDlWdKmYY0ImO+0PdqyYYqvxKBxL6yByd
 hn8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMzJVnDSU3MncKbD03kAwQnuN8yyWNOjoeZIgN0yAYlpeaAM4eIIhi1b/0ROMpFl44J0ZUwUhK59w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWu2v+BI0Fc8l/J9jqt+r0bJyrRrSFB949R8ISeK3TLMVvsJf8
 hKY6SpfJqMiCdawB0KjoNyyhhTCp26Jsl219c2Z9ehI+tbp4dplY
X-Gm-Gg: ASbGncvB2EN8NLDd9LjLWrh743hm/1uxq4ZvbmuG3Sh6rKMNsdCGpkpBdLhX1xooUuR
 VqjccGI1jxyetZwMa9B/IebuohqT1Vmsy/2T1X0sUkpLHC5JB4sRLtUtbn9t3Lv6yv2nynfsWwh
 FGuDBy3kOzLiISelmyZ1vZAiEvd8XVLjztT8/WMtPi0xBiDbeVMrA+EJrCZdNNp96fJIRzYDLUb
 o/QDpZwS35J5CntxJrxifvt0UY4hvbNGCwF9M4pomCMISCvSx6cd9y59FSPMvoKv8gCW/kSVrVN
 gDGKTnL2cfAG9mPHmuGhbnyIeqd6kxGSzCLGBY1RZw==
X-Google-Smtp-Source: AGHT+IExMbsAQz7Mwc12HiLkpWeb7K2O1dS/WK/atDtpdKNgEq1aIQw+33yHgxXO3RSHnYFs46ICbA==
X-Received: by 2002:a05:600c:1547:b0:43c:e481:3353 with SMTP id
 5b1f17b1804b1-4406ababea3mr21349975e9.17.1744981626906; 
 Fri, 18 Apr 2025 06:07:06 -0700 (PDT)
Received: from localhost ([194.120.133.58])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39efa4330d8sm2796501f8f.33.2025.04.18.06.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 06:07:06 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/exynos: Fix spelling mistake "enqueu" -> "enqueue"
Date: Fri, 18 Apr 2025 14:07:00 +0100
Message-ID: <20250418130700.540590-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a spelling mistake in a DRM_DEV_DEBUG_KMS message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index b150cfd92f6e..09e33a26caaf 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -908,7 +908,7 @@ static void fimc_dst_set_buf_seq(struct fimc_context *ctx, u32 buf_id,
 	u32 buf_num;
 	u32 cfg;
 
-	DRM_DEV_DEBUG_KMS(ctx->dev, "buf_id[%d]enqueu[%d]\n", buf_id, enqueue);
+	DRM_DEV_DEBUG_KMS(ctx->dev, "buf_id[%d]enqueue[%d]\n", buf_id, enqueue);
 
 	spin_lock_irqsave(&ctx->lock, flags);
 
-- 
2.49.0

