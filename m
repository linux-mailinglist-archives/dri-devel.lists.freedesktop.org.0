Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7393ABC682
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767A810E4C8;
	Mon, 19 May 2025 17:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jFWKnA6b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9175410E481;
 Mon, 19 May 2025 17:58:52 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-742c46611b6so2413111b3a.1; 
 Mon, 19 May 2025 10:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677532; x=1748282332; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5vZUP3yiYvnGJEGnZA5yTtXN5qfGZSR/tLPaaIrC1kY=;
 b=jFWKnA6b+zdG0k8ONMpHzVbsMvGn4hUrd1NOnIRFOieKUYc+9ML8o6+9QvnUuWEf0g
 YmbjczQPy34I47eEltmCdpy6kqWFMWGvZasGUqIJBRfcZES9TLnzK9w2SkIaOTFfHrx5
 f7nyW6G2mR2NdoZWIAzOHU2U9XxmRGCadehXER2g8zd1rYAFjznpvy5LdIu/ejl6NtkK
 vk/omtxb47/8KVhEShtOHRl9DXe10/BXrnjkugGGiSwWT7CR/TZTpIQ7U9RDiQ3TXqHk
 BWYOC07IysKF/PThtSpfKA2jOXgNt1ewn09NAq44LoaStvcj3wYMTIA8WjABnoRWxiwv
 mjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677532; x=1748282332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5vZUP3yiYvnGJEGnZA5yTtXN5qfGZSR/tLPaaIrC1kY=;
 b=BluYsRUrukvGa+goB7W9P7WTG0hpDTOHOk0DqjTSFEMvm/BoUE/WiZLBkWSwhT4yGB
 kM8IVVUiwQDiVBAFwLjpVY2Urb9FCikqasIe9mpxmI/ihLOi6AWOWndpV6K40bOlVTW7
 6eM2ioFwMdJFsuh689HhUHui+1TvnnsNnCavQkaYMToDNnihP/DhhH2YtXGBqsDUiirw
 /9VA9Lcjt6BjRaFjp6bMyRYAh8kXdjHF9zOVXekR1u/2sfgCOpcT6C7njCPBON5frnqJ
 /Qx77BDxY9q3T7eYyWiVZvyXuTdGNbjxfS9N/lIaQttFdCC2NXvnsbn+qOg90HgMThVG
 BOpg==
X-Gm-Message-State: AOJu0YyUlD7d5uOFEnJWQ3bvWTyMHIJhkYforUq1E8oOx4jVE/3d0lXu
 pq1V4DPrlEd2WR9M7lhO5BQOXLzlHiluiZSxQOrO6SqsCpKd1QVxyao2MdWwDw==
X-Gm-Gg: ASbGncu83iZ5YPPB0sj+yV+H23J7Bp0l73CQsRObiyr2KxRXjHHzhytRdaBXPbYWYD7
 GCBe4qS/V0D0FqFElqannlqB30DEQ4AJL56xpPLIFATTJ08Z2ymHOGv0k/1SloLYZtDJ3xSAZ/X
 slmjC5V5mp63S8Wkgl7QJhPBYJ6tFcF9IHEtiA4I6tC4AmBGPeZzOMjU4ntkhjnKyfXImqkEPAP
 Yzqkq75TWD1McFdutjUcAAG+5ifyrC8Sab9nqShpRYO7hR6evgN9EZ3njL4k5BQiS/KmDPtuBk6
 ZZ4koucD7SYP6R93igTk0Kl0IX2mp6Af6qWd5O1y/r9Fohtx5nizAGLlE8MNhpAJkcoF7oW/QRO
 23ktdPZXoSi4BtEbSiW0491V4Mw==
X-Google-Smtp-Source: AGHT+IGRr3wC6zNEkbbZIOqB63IqRXMNCh4mPcpqHYlPlc47+qmcazwgSDB4ccUJf9IGlUSasHlnXw==
X-Received: by 2002:a05:6a20:6a2b:b0:215:dfee:bb70 with SMTP id
 adf61e73a8af0-2170cde519dmr20916003637.29.1747677531712; 
 Mon, 19 May 2025 10:58:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9876e28sm6726150b3a.139.2025.05.19.10.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:58:50 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 38/40] drm/msm: Add mmu prealloc tracepoint
Date: Mon, 19 May 2025 10:57:35 -0700
Message-ID: <20250519175755.13037-26-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
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

