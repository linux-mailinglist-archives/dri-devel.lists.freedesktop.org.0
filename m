Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BD7BFB878
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 13:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF8710E751;
	Wed, 22 Oct 2025 11:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FDDr5FG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083EE10E751
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 11:04:34 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4710683a644so7673605e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 04:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761131072; x=1761735872; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qEafg9Klu5zOL06Nglfzdv2mgxyWpLG/yLgQwga+NA8=;
 b=FDDr5FG0SimetTw7Z0vlrBz2Ucdau/XGAMbA13O0FJxkhS+M4DnPxIJCCUenWVHk93
 WO/V/OMcpvhVda1hah6uGinRaVsDvVh6WNc1rR9ZmPrmW57t8IG+0tDk1WMMnW7wQGMl
 iWfwckCcSRwSag5+Liueas5hAD3Ke8aGBSSZZfDT/7+I2cTbLBdAw8TBZWhOibB2X91U
 TGBQc/akCJH+z3mCQHqdNd3c7LKpfK8S1G37oKmLJsLm4MU7hnD0WsKlgmIqDrryzyfD
 G8HaTMe8LzJUSijObJmDtoKom58rHob85JRZTywtKmvcFcDET9vwkmxrzzN4+JEPUQrA
 E9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761131072; x=1761735872;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qEafg9Klu5zOL06Nglfzdv2mgxyWpLG/yLgQwga+NA8=;
 b=H9PNC171bCg34bXztutEUi8LrmxdJ5mAY+O1f2TLeAdx+y+v/Gcd1j45bV8WvSwYMH
 k5QzJWe6M99sSqv2QTafLnjt9Xk261/r/qs5540msYyTZLbhV9WdsSwdIKMgo7L2uLWU
 zss8Q948YSRXmigbm/Kwu1tyyfOoY99aNCCWSj7vYWeCcnUdy6TDk0uKECtZlcGJ8hhP
 0BJFH9xlbtbb99ubQOWHPFCusOA63Vo6g52G/hOyuK6X8naGL5uWmBeizThwrVpNDj5b
 ID8/aUgQrwMIBJrIm4A+ZB/h12zMtC6OVHSthBxR4x5ZGq9C5yRhWHGPhIW8yIMNqGlh
 gXow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOSnyV8lVVhnEVu0yqEtIpIjBpYv6zO4q+5afwNFbqZpcGxJQxloZe4e2LHaYxyQYMOAwvBIrG4XE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYB9jSMEZkln3BokK14Ltm3jHv865xd9dvArCx0krHetjndAaL
 zBKR5Biyff0em4fpt708asd24uGVagqNSY0/3UyIB4XH/Qay4CutBHBrzZ6+1lrD+NA=
X-Gm-Gg: ASbGncsZr8ORYC0Rr8cdnkymC/jKr/zIdreTK6NmRODBPKiMk+MREXPos8rM6w4VUxY
 8FY/8IeoyeVALntCxnGS2rSMm9d6Et/JsivibxtDQX8ps5qJH8N+YUx0xg2Sj05fAaRTDeqt+JP
 DpJvAIxDV+rQYT4LU3vfI3yWhmDrCDeEkrj8Um06p55BzjaqiMpS/WjYJv8giVPBZD6ZQHcyHuM
 RGZqk6QjpHsFhXqj4W5y5+Z6NJKD1+xh/AHvtrSs02bcA+UlPJxteeNj9dZTEdwKXEH1T6hQARt
 CxO0Gbs5QVUUs8OloNgN+T3gbncITHSaPtr6FGtG+DKektC1QUszfC6rCNI5peRZDgAxAqhTtaz
 qBOZCyIb46WWCdHWFDDKJ6n8kVZFbIaxSOclnrF++0x6Bn4okvUOM52bnPGVr/fgAKDJaPa2MHR
 PLN0vfIg==
X-Google-Smtp-Source: AGHT+IEvzeQmuJZVlQvxOVzt5DBIbtifvWSq41OHqDirBuHQNqktljPPP8+Q3xqBRDvi5bTZGQ8Z5A==
X-Received: by 2002:a05:600d:4265:b0:471:1e:ebe8 with SMTP id
 5b1f17b1804b1-475c6f5d0edmr6359645e9.10.1761131072473; 
 Wed, 22 Oct 2025 04:04:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-475c428a534sm44924865e9.6.2025.10.22.04.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 04:04:32 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:04:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amd/ras: Fix a NULL vs IS_ERR() bug in
 ras_process_init()
Message-ID: <aPi6PTnGfpG02RgK@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The kthread_run() function never returns NULL, it returns error pointers.
Fix the error checking to match.

Fixes: ea61341b9014 ("drm/amd/ras: Add thread to handle ras events")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/ras/rascore/ras_process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_process.c b/drivers/gpu/drm/amd/ras/rascore/ras_process.c
index 02f0657f78a3..1d2f136fbe2b 100644
--- a/drivers/gpu/drm/amd/ras/rascore/ras_process.c
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_process.c
@@ -241,9 +241,9 @@ int ras_process_init(struct ras_core_context *ras_core)
 
 	ras_proc->ras_process_thread = kthread_run(ras_process_thread,
 							(void *)ras_core, "ras_process_thread");
-	if (!ras_proc->ras_process_thread) {
+	if (IS_ERR(ras_proc->ras_process_thread)) {
 		RAS_DEV_ERR(ras_core->dev, "Failed to create ras_process_thread.\n");
-		ret =  -ENOMEM;
+		ret = PTR_ERR(ras_proc->ras_process_thread);
 		goto err;
 	}
 
-- 
2.51.0

