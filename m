Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F28ACF6EE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBB310E9E8;
	Thu,  5 Jun 2025 18:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhVw0kSf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B106D10E94B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:50 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HRhA2004213
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=E0CQf8ECEko
 EZPuzosk2AQuQ/2hYymsahlQVM4KlO5E=; b=LhVw0kSfCagt1hE3EbqQFhcSwTz
 jNIZhPETxbdWpiKNWh6SlWzzz8pI2sQz1VU63FbymNH1wz6vxjP1dwplO0yJROus
 y8EVElidhgJ0V9BMT5abry+KJwCJ4ngUa2xfOUn/EYiEJ45U0tCXivKmC9GT0gzq
 rWnTgT4ANyrHfr8X7aPcZhSc10Lek6wcad3/S2kSDCaWYUmtX9wYwfOnZZpUexEf
 qXy/w/xsVRRcyRuyHw8Aq60gJve0uaHzmlIja7UJFPdzEkOE+tpuBLyYtBm6CifT
 8AnkqBdcBuP3OlmoOhHvGkhk+71q7Cvvq7yMI3xC0WhD3JxgpQTuvj3c0JA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s2cde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-311b6d25163so1280003a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148400; x=1749753200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E0CQf8ECEkoEZPuzosk2AQuQ/2hYymsahlQVM4KlO5E=;
 b=fPdFoujeeD+0Qxcdbf+sRgCJHj/doicxHdpNExfvszyxwvSCGyWRMXC3jce7bqFVmx
 f7IMQxsD4iKBmlA+qjdpNvnoWZz89szph+fd63Gt9/fcZsERY5G6/auYH2O9mibP7S4d
 U9hKqeeZxhlEry+0F1K/wWAyyMhZ66nWKUJrnlqIIRC/WOv4RnKEKoE/CQXeZU1WkSnm
 9fKGoZZhJx9nszV3+6vJFjKZdfoiJ730fREL5fCmgTFFjv43mjz7vmlIzLe2Tqse28Cd
 TWTkJAGBwthkNeQ7wH9RrJ0CJyVkDxLQA94fQBCRn76AZJm2P23DlQCNHneaPiu5/okt
 Iu3Q==
X-Gm-Message-State: AOJu0Yx2X7XvsZ5dBvoDjMdihwuWCmltwOIjnG/91Y++o18xv9MaqKxg
 tLlpJkdnYTIqdIRZsaD9uV46lUJLD5xn4baw4TcnpAXek0JnP9o0aeQ5Bur4TmGq6km27AP96L2
 PRqI/bjTekp2agjWzPcQdVZ9abGmV6tHivvovqEzMTpc+ympaknMmAiC5PU/ide2CGj4ibjP9V7
 BtkNw=
X-Gm-Gg: ASbGnctyGjMIvOhDIwSp4ac7jGJQilE7Yg9RVeVziX+8Jmyh5zJHokW73WEeMDg7kR8
 6buPS1Cz/0WAq7/GG/V9DzrGupsQ5WM/MxIFQzreqA9ZlBbdO6Vh7AiQkb3zGUvNkqIDOhz8YWJ
 lsEeSH6/hPPHgHiXjnbAOsGvLjnQF6lcFkVQdXBwfwMv5umcPKgJYU/vpwPx/n6VMRMlRoo5C66
 zzGEAq7d0qE0TYMkDziJEMefTTNcjqteT277YbjI3/6Ve1Z8zKcplKAu7hsm3Z5l5ONf4VN523M
 J2eE+4JgadNlvO30Syqjrw==
X-Received: by 2002:a17:90b:4e86:b0:311:b0ec:135f with SMTP id
 98e67ed59e1d1-3134706f8efmr1045850a91.30.1749148399687; 
 Thu, 05 Jun 2025 11:33:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtRHbayHnOG/QPhFRjld2rJq5hRHHtm7rPI8PxA2Bd1CySo0EJuFhDV1n0cRcHKai1dDS1Qw==
X-Received: by 2002:a17:90b:4e86:b0:311:b0ec:135f with SMTP id
 98e67ed59e1d1-3134706f8efmr1045803a91.30.1749148399107; 
 Thu, 05 Jun 2025 11:33:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349fc373esm61635a91.32.2025.06.05.11.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:18 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 36/40] drm/msm: Add mmu prealloc tracepoint
Date: Thu,  5 Jun 2025 11:29:21 -0700
Message-ID: <20250605183111.163594-37-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: U2jriDFrlL8z_06r9Gc4Y7_7GZM0pGuO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NiBTYWx0ZWRfX9Dwn6U6X4ytM
 oYu91474MxzTexiR13i//2QXr6PadxR1bvlvtlPqSM9Ncbe7QoEXlV3f1y5x9NlHeGZbZYIooLl
 lT3/s8wHhQfKloqFy3RaFDSVKoWwAb8JyPZc8+DfcJ9p4IOwcwYQhNmsIqT4A64enBnooNB9zN9
 ok1QbMIEW/inNNCOtLE2eFz/bJKUIqPi1s7yniO8CYs+lYHVdUiFUbRPwjov/64XFgqcOgZVD6j
 OcZ5oVPhnr/xBTeh53QrurfESc9ZxHaoWJV+neK0jsQRa9FCswbdAEV6MZo8/hqh+4s6ZEs/2hI
 vgbw327mIImfLvHILn8Sb3IwvqiAKHFwfeXO85CB3FqyjqqhJsXFMpJgJ2NfYcIwOof1s2S0xmn
 MV1hvHD2PDLK61YvsHnGC1SP+ilnd9ZkHM6ys+gmhBU3991gWJK9/nsLgSHVSWpIl0zIBb3k
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=6841e30d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=W9C9WuCMp67TlgULjysA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: U2jriDFrlL8z_06r9Gc4Y7_7GZM0pGuO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050166
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
index bfee3e0dcb23..09fd99ac06f6 100644
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

