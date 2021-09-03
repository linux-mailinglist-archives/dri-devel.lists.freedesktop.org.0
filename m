Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6EC40051D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 20:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0256E8CF;
	Fri,  3 Sep 2021 18:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395A46E8CF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 18:44:17 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id n18so6338651pgm.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 11:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ePxJybomMw7KwNl/06F/f9BuSUg0DBEjdIp9sOebF7o=;
 b=BvMTOHBoJQkt0BIhnKLwCwWsS493zyVEfOi0uWmcJC2buz2melLUXyaqwMUK4fSo3I
 y3aDAag69Mz6ynkPjigXyEg9Jl0nV+MYC1ndP1ma/Lh44jH/QjHOSs6x/3U/H1rD3bHS
 mGsKVnKN3FCYSTm655cSyebyavRCqtX2W3RFDB86rHu6twvqj4jx5KGUAgBKK/nWaiND
 dPap3WbMNgoBPMYK+DkbLTNIVDSf/Zi0N/glyV5rQz1uZ+3yUxXWiSjQrQONKO06UL+g
 gCo2fQMcpUmwzjBRHMY/2iVs3gkNmgkKjLnhHIvrWnKiOFne/vCmrW31siHiRvex8buq
 e2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ePxJybomMw7KwNl/06F/f9BuSUg0DBEjdIp9sOebF7o=;
 b=lTYlVcTTcdN1O6AzjvVgSdyEooKKbNocsNceeILqx2fI1+KMAqBqynfnkj5HHeasmZ
 lAY5Rdpo5aHhdS+a+Fs04Yvsy6deVnM1+M5F2lBebrzD4kUxAYcBRzLjAOBTsAXnB1mI
 VpZnVUl0yyTetZO8SmAV/CTaAjb23ZfXeKaL/gHEup6vrNNhiGJhkxpUPCucWhMz1Mzr
 NttBzJP2zbQD71Wtt2CXUB2Tndw0mp/ubX8f08vUpO1nQCPkpJTDWtIuP/TvtcMYwu93
 3mqM3bIYY2reOY6PFyTb4BKMc/mszCfWF3VNQQ4Nr1bxlqiYggpkrK4IY6AdVNwSZLQ6
 4rsw==
X-Gm-Message-State: AOAM5308JlWqCwr7J8frXI37ymlx0YSko+1iwo3h6o24h+CXid6TgDgA
 W+EmojxCHT94qiXxkGUpES26T0kW8Jo=
X-Google-Smtp-Source: ABdhPJyGwtF5mT3HvxEWHeK5JnkHczkKSvr/MzHyDH1596nS2xrPI0PFohMJe721nbImhGOHVn4BLA==
X-Received: by 2002:a63:6f83:: with SMTP id k125mr365747pgc.379.1630694655988; 
 Fri, 03 Sep 2021 11:44:15 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 n13sm113692pff.164.2021.09.03.11.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:44:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Cc: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org (open list:SYNC FILE FRAMEWORK),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 6/9] dma-buf/fence-array: Add fence deadline support
Date: Fri,  3 Sep 2021 11:47:57 -0700
Message-Id: <20210903184806.1680887-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903184806.1680887-1-robdclark@gmail.com>
References: <20210903184806.1680887-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/dma-fence-array.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index d3fbd950be94..8d194b09ee3d 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -119,12 +119,23 @@ static void dma_fence_array_release(struct dma_fence *fence)
 	dma_fence_free(fence);
 }
 
+static void dma_fence_array_set_deadline(struct dma_fence *fence,
+					 ktime_t deadline)
+{
+	struct dma_fence_array *array = to_dma_fence_array(fence);
+	unsigned i;
+
+	for (i = 0; i < array->num_fences; ++i)
+		dma_fence_set_deadline(array->fences[i], deadline);
+}
+
 const struct dma_fence_ops dma_fence_array_ops = {
 	.get_driver_name = dma_fence_array_get_driver_name,
 	.get_timeline_name = dma_fence_array_get_timeline_name,
 	.enable_signaling = dma_fence_array_enable_signaling,
 	.signaled = dma_fence_array_signaled,
 	.release = dma_fence_array_release,
+	.set_deadline = dma_fence_array_set_deadline,
 };
 EXPORT_SYMBOL(dma_fence_array_ops);
 
-- 
2.31.1

