Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA2BAECD5C
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8489E10E35A;
	Sun, 29 Jun 2025 14:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QtR1bxDX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C0E10E355
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:17 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDTXgD019282
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=5mY0F5PMmU9
 vrS33+13h25TEJD4UxWJEsq72XU3xSVs=; b=QtR1bxDXoq1dpVHguN0qwtmvC4Y
 0xC18TAnzct4aipM6HUb94TLMrrCAKsP60bZJFPIsgOe2s0DgsONMSWzseKdGXgn
 twCKv1gfnAGO3FObyCtuEdEhGDD+ulXJn+iMNSaCZW1QNygoMfx5w6yaj5gBNIQp
 LkBJDFS5H1Hac4sYN2Bt2aEpUrQVKMH5LQYw/mqxQ85l7wj6hDTZKAwJhsz9u46I
 pG/Vx2U6r4U3p9LSsIZXgKYHsXkItu72ynwuONtWSrmBnp0HkBjY7cVa4VzWpGPS
 MPOvBWqwCa6qvpJoyf6fdYRRFR+Pz2Z96JIenGdByZyT4PCqjrsFILRe9Cg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvj9t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7398d70abbfso5596731b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206096; x=1751810896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5mY0F5PMmU9vrS33+13h25TEJD4UxWJEsq72XU3xSVs=;
 b=LIiRUiEH4jwhPEXV3E8ejIFjxsngKry82fyxf/ByXhnDSEkrOPgCQjiVmg5w37TB2v
 ILiMtGd9U5IwUd2AlUxYzqwsBGd2HTIi42+LQeU2spOIpmv3jGevOa3o/I3HgGamWN5I
 1Nu03p06nQ2pbtO4htiSDQsTshZNGLsfPGljm632bxY0sBYQnwFlQ2/LJjQfYzhbdy8r
 fBpSZfQY+/z+AB6fsRqJT+PpQdNEsyIDBu/uSsCKKfJZk54Bvws2ESPW9jSFbYniIgqq
 IyBi26eHzCg9UPFq3h7cxZtcJ+/rjRwY0CzrZHF7R0LmADDZl/K1cdQQrqyTmnnURZuL
 XFZw==
X-Gm-Message-State: AOJu0YwDo8/W2+u1wz20HwcluKCfY6wcEEbh+/8kkNDfYg1pM/dftPJS
 b8O6HgWMG2edAr7PLyjB/onbqT0ivc8a52ei2uRMgvqyc/eOANSalHKyD4ue5U1ngYcc1nP3OB6
 7EYmGmHEjgXNnuyM/WvNWItkET921gNglChrmIZDVn6xcKoH4koy+2CxFDOmjPjc5FSvfLg7kwM
 Hq7Bc=
X-Gm-Gg: ASbGncsXPjT/GXDioMJaWfwv8IsXeK9AqKRb/fAcM/WDGLQQ/EhOXzkJGNAH172+gir
 elh9x2HV7XKWTk1Z8/YKfhcbctq1aY63r7t3NA2Xf4ctZ+lcrQ0c5c0hTZMscW5edZ4+oG0+pES
 SrotYHS5gq1B31F7shH5TCcoJWaRsXpH6l+xwhLR6/KT01TUjUSyjSLwa1szPhqGw54+pWl5G0/
 PRot3c/nGuxiIkCzzkqVSbBWsb5mmDQLGC/9hzAhNs41GpMhrGipz/pcIjry8bL5KblOLtGZ3mM
 xJ2LHepiRcTIBYSSbArwhOnA42SWL274
X-Received: by 2002:a05:6a21:6b0f:b0:21f:5361:d7f7 with SMTP id
 adf61e73a8af0-220a18343cdmr17849601637.31.1751206095925; 
 Sun, 29 Jun 2025 07:08:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfYDkWzgCDdpgGyHKdq4vr6VIPmal4jKOqqpi3gamCdrIPmrcPzY2NWoSmG5zIgIYn9cnZRA==
X-Received: by 2002:a05:6a21:6b0f:b0:21f:5361:d7f7 with SMTP id
 adf61e73a8af0-220a18343cdmr17849557637.31.1751206095533; 
 Sun, 29 Jun 2025 07:08:15 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af541c369sm6676309b3a.42.2025.06.29.07.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:15 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 38/42] drm/msm: Add mmu prealloc tracepoint
Date: Sun, 29 Jun 2025 07:03:41 -0700
Message-ID: <20250629140537.30850-39-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: G8H9GCCrBaX_QaMMVB_oWTtPET4KS_iF
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=686148d1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=W9C9WuCMp67TlgULjysA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: G8H9GCCrBaX_QaMMVB_oWTtPET4KS_iF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX/p751AVKVP4e
 iKsNoClk6GIUfdx6hVA243F2/mxTIZaJjATsD3XrstKfhv68o04LAdV4Ca5lnIrAu8E9scRLrvi
 NzFaCROuykpLETWmfjQeWMpT61kh8ZnU+JwH48PoZ4mVtQX8eK+yEAISdRditYmw8ONZQOZFL4s
 xSIkwq0yOnWi3aVA9msEUsEEeYilb4ZzCv8Vugg8Il7b9SlmnXiQXaNcG+fQcw1jq2JkHCBvciR
 9ilRBLuRV+4fJ3sXgW/NszeiA9klGLMRAprgXctw+kP97ZPRpL6FWtncpanro2zqo6iQTHpBYCJ
 K8Rw6gITgjkBXBmRpjulC+H7UaY/qIHG8BcIbeB3HvGnlVDqOy0C5rAHqV6hp11w2fm1pWkoNfj
 vJNlTm08axgfpGeWleOTTW6iN/H94TvrXvilnJK4jukAhQsPOUhpiIAE0V/XFAmlqPYuAUbb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119
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
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
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
index 887c9023f8a2..55c29f49b788 100644
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
2.50.0

