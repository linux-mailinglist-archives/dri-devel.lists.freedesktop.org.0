Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C641AED09A
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9CE10E379;
	Sun, 29 Jun 2025 20:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+fjg4A0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8121910E37D
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAsCBM012874
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=5mY0F5PMmU9
 vrS33+13h25TEJD4UxWJEsq72XU3xSVs=; b=P+fjg4A0RZe6REe3XrkoPcZmiE2
 OcTh9tv7DwGlIzx2RC8LdNJZNsqxuuMYRM+aL0FhYrNgxk6qJBt/FnSKIyqXQ+Bd
 WV1953yLX6NW39Ns9BklbuvSRNchtfwp9ndDR45xf1IVhb6hfyPgDDjjRgSSwxff
 1lU3Bn8F3aWOCRU+Ve7zQLtqyPJXXna72nx3aAVxiTqKD/KV92YrDibrcnLH6NiY
 DPBD2HMtL2BQi80rxpJYqotdJiaW+hmH7akgXgEflBwdjvTcbNyDY2/YjycPnmXY
 DvAcrfH947y2/u0VG1YZc7lqDtRxjKObMAPWDo/Pxe7dcArHpzlXJYMAwzw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcjjft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74913385dd8so2763983b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228234; x=1751833034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5mY0F5PMmU9vrS33+13h25TEJD4UxWJEsq72XU3xSVs=;
 b=nukA7oKA3ap+zfNHTESv7a0tGGymwmn5xZhgU0UxwJSvCWIjLK3kkm2oiBc5DL6MDs
 gh53HxHejHGmIIRP3Xrt6RkFY/eMzgcRHiVcSfDviBOM4jSQy8oefRg/EWnrjed0d8Zm
 hXVgIvt3v9HSWhBJCVGdDd9B3PwPnto5ydSGohehTBOqFp9GMe9cXqeRWl02oUWu3Mg2
 BWM86TTLep2N1fO080610naWLNkcQAmJwy2GS7LWvPxCdUi1vCgOzsMa1MgSKRZCFxog
 nXAkFw5N+36u98aALOppqH4hWJuOfJvMVhZzBH9goDkWFFH+zdwKYh4XtodO7yuKKpZC
 +nhw==
X-Gm-Message-State: AOJu0Yz9ZX7rRs4Hg7E/yD1RZMAuCv4rCtQHfEkGEb+hlaSJspeNqC5l
 53fRoDhhBW2TK5fFWM4xNomA9OUgxhCGBWC3fkMU1h3BS7ST8Sv4FmmHXYwCmoyYRnc1Tljejwp
 z90T1PG6RqNjiCVkVjZUsQtXzlp9m0U5HtL/+gl3j6rOxKQ8ynNuKf2EH6k6nJcPqduVkABO7Hy
 2qBLA=
X-Gm-Gg: ASbGncvIySP4Y9iG/TQ2AVfWeEfm68BWtvj30TDB6mTct9gCMPELfFpwsHeSAeMuJ0U
 BdSRYZPtRzBvbjLHmNY6yb8PTGMVB0llC2++GwyxV6XOla34DvqWeNhLEbU0aF3UNYxokrB8bEB
 BYWzvwu8FZydij35MvjVhfnsBNjfjX4MfNcEJJXf9r1nBs0Z/P4cb1WhDtf2v4kBURFEQcZQhZJ
 uHTpnPtq4xKdjgjSiJz+gu4Hlk+42meMj6HY99BVmgFkqyS/R3LpmNclNwxg4VkYC9HniHq0tnw
 SValGNkyo5aIq9c3liE125L1Pd1pQi27Pw==
X-Received: by 2002:a05:6a00:3cd5:b0:74a:f611:484 with SMTP id
 d2e1a72fcca58-74af70a825cmr16437201b3a.24.1751228233856; 
 Sun, 29 Jun 2025 13:17:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOpY4JD8XXzpeyT/cFkQnTv9hNBJBrOs2mriXfKg05KpBh8dREEFouJKKLOYU1fqTJGyyiJw==
X-Received: by 2002:a05:6a00:3cd5:b0:74a:f611:484 with SMTP id
 d2e1a72fcca58-74af70a825cmr16437173b3a.24.1751228233466; 
 Sun, 29 Jun 2025 13:17:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af57efae1sm7273234b3a.163.2025.06.29.13.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:17:13 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 38/42] drm/msm: Add mmu prealloc tracepoint
Date: Sun, 29 Jun 2025 13:13:21 -0700
Message-ID: <20250629201530.25775-39-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r1yrXUm4TExEhoQiSAuP1ewKJ3201bY7
X-Proofpoint-ORIG-GUID: r1yrXUm4TExEhoQiSAuP1ewKJ3201bY7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXxelBJSm06JT4
 CRSJKrnpbkVBtljvpIlUtA/nUmvWpOEl5eY7qy0jq+jIDKh558465KWTd+mqkreS6XPJR5NMXXG
 egt3G7E7dsYUXqiRDw2FWRlIu8kghnDCGT0jL5AyQv/efGGmkTgi9vzwavEoVhCqkD09jI6pDeW
 N6H3lFuYf7BEhvLusCVkrKhUkc50Ib625b44jP98308Yk3sqnQ99RCLfJKcTRlbI1URyvjt2GDm
 abiWaMSCdnVR6NnDwnPHnIsAnnG3lIZHYELbQ8rTHFGArmTdJMFjR6/gcz8pF6BVLpWnTiywpYO
 n8wewQkQ36ltanbJ4DVeQ0IR6QT6jsx58al5NqgrZ40Vm3eVwEA7dJ9qxXyjZ16NScCLIsoDMve
 vFG1ItrkANABZSryv2yvlz0DQ5f2NDO6XYul8o0LEksXSrepuJ1BExmYP8NexM4APuw1iOYC
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=68619f4b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=W9C9WuCMp67TlgULjysA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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

