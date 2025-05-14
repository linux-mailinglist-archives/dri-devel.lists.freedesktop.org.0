Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFDFAB73B4
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B839510E6EE;
	Wed, 14 May 2025 17:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jd4TT/XI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF65F10E6F3;
 Wed, 14 May 2025 17:57:29 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-74251cb4a05so217890b3a.3; 
 Wed, 14 May 2025 10:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245449; x=1747850249; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5vZUP3yiYvnGJEGnZA5yTtXN5qfGZSR/tLPaaIrC1kY=;
 b=jd4TT/XIyGyrLd17tfhuS7P61V52rvPE904uS3r9OLmxBWxfU5W+OXmtFEMWsVJHEE
 ERlwtAq1A6amLbmKvXiovL0IV271mJLJ040OV5dAP3e9wOTsIV+YIsMviQye6AGd9Rz+
 tS0p8wBhywDguo19yS0QC9lu0zkWh9aGQWBfxY5dPZrxjvpMCXA1+vB4dq2Xm+Soz3ff
 XB/bLTfwdKWbZ2xNlFFSLCeqSYHzIOTQRAevbjaPYKAnGPgb01wS5oVwXoMqKMDL7mMZ
 JyakpLOT85e978yqa55qx6mtEnc3vCe9qphNXE/ORQYxE9GAkbCAPQaiUO4xYGlkBHMR
 0kmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245449; x=1747850249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5vZUP3yiYvnGJEGnZA5yTtXN5qfGZSR/tLPaaIrC1kY=;
 b=iXFjJcdyjxV0H1pTgyDzt9w1ETz0OQccVmXDt+RgOIwuP7s8X1nIXZUiuiCNaV1ubz
 L08BsJg4W0QjgB2rsJx+EdnoPHFq8Qc9UkaTW73TvobbsPzNIlU6JQGtmIUn6xBjcJga
 YtQjBhHkLG0vovW80wv+9eEWkpDW4xfNpsVUMp8cAk5tdOwt2kCNkBUkv09kbD0/EqEf
 cZ0aCTHjUcUDmspuOvrdQuSE5hjUJmK+qu60AwmYG3eMVV635rRe7IC7fKZSWBFBuqwJ
 qvR5kx4KLYUkvtDS37FZnSrQ3e0k4NGxO8m7SopoByz4Dt0T5/MUySBFrmfI5mrocOBz
 sZ6Q==
X-Gm-Message-State: AOJu0YyWU+lQQls1YgVXteWW24ySkO2PoN8gu/WOdK6HTT2W6nLcq5kO
 aOGEDQE/piRZFfYJ++z4EbuJ6J8vXdGWphyYbLwNwhwKKU/HtxwAdIJIDw==
X-Gm-Gg: ASbGncuGhOHoVT7zvg9B03F4hRMohimB8PXjv4JNcsm5NT0lEBA203xsv4fcHQeTKaQ
 XTZ0r2KBeWGYLoREM+55W2t2zcwSclQigVPMcy/qGVEuCwGGOfXqxesnxevCWjnwi6JwBgYkItA
 4qLiu+P/Ll/jTDJbjmyNuhkcd5oCNjaHtV8Ch0FaUSSJnVveOfhcUYQjf98SyTOOgGV5n6Sx+hI
 mX/dN2a0vF3W4MOtbFuCvg5cSkle5hD3OcGydDCLXlP8p6OOyDvOGyIQAAzUP8jf8Q9jZm0LEX1
 yzHTd69wde95WJhRuYnxaziiw0LYTMDLowqbTO0Mw+9/y3C9TWxoOp8FUAa9YccAXzuaqwwQF5g
 8Xbewu0/0twanNlKWMq17LoSHRg==
X-Google-Smtp-Source: AGHT+IFAb6eTKRNfd7E/h3KyQK5OTZipPPfZzvdv53yXZDo69nHkzR5LlYArW5mqLE1u50vA4UVzdw==
X-Received: by 2002:a05:6a20:b40a:b0:1ee:d8c8:4b7f with SMTP id
 adf61e73a8af0-215ff11a54bmr6793511637.25.1747245449104; 
 Wed, 14 May 2025 10:57:29 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237761e45sm9715747b3a.81.2025.05.14.10.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:57:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 38/40] drm/msm: Add mmu prealloc tracepoint
Date: Wed, 14 May 2025 10:53:52 -0700
Message-ID: <20250514175527.42488-39-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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

So we can monitor how many pages are getting preallocated vs how many
get used.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_trace.h | 14 ++++++++++++++
 drivers/gpu/drm/msm/msm_iommu.c     |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 7f863282db0d..781bbe5540bd 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -205,6 +205,20 @@ TRACE_EVENT(msm_gpu_preemption_irq,
 		TP_printk("preempted to %u", __entry->ring_id)
 );
 
+TRACE_EVENT(msm_mmu_prealloc_cleanup,
+		TP_PROTO(u32 count, u32 remaining),
+		TP_ARGS(count, remaining),
+		TP_STRUCT__entry(
+			__field(u32, count)
+			__field(u32, remaining)
+			),
+		TP_fast_assign(
+			__entry->count = count;
+			__entry->remaining = remaining;
+			),
+		TP_printk("count=%u, remaining=%u", __entry->count, __entry->remaining)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index d04837461c3d..b5d019093380 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -8,6 +8,7 @@
 #include <linux/io-pgtable.h>
 #include <linux/kmemleak.h>
 #include "msm_drv.h"
+#include "msm_gpu_trace.h"
 #include "msm_mmu.h"
 
 struct msm_iommu {
@@ -346,6 +347,9 @@ msm_iommu_pagetable_prealloc_cleanup(struct msm_mmu *mmu, struct msm_mmu_preallo
 	struct kmem_cache *pt_cache = get_pt_cache(mmu);
 	uint32_t remaining_pt_count = p->count - p->ptr;
 
+	if (p->count > 0)
+		trace_msm_mmu_prealloc_cleanup(p->count, remaining_pt_count);
+
 	kmem_cache_free_bulk(pt_cache, remaining_pt_count, &p->pages[p->ptr]);
 	kvfree(p->pages);
 }
-- 
2.49.0

