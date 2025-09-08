Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 677AAB486FE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 10:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8CB10E41E;
	Mon,  8 Sep 2025 08:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqgU229t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D382910E41E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 08:27:57 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LnaMI024006
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 08:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1nUyUpKi7e4ePG1N5pB+4o6pcKvcsMs745pR85FFLuM=; b=nqgU229tcFj8ljF9
 nUifj4avGfh7JDdoMTPeFRsPolELSloHpT+VVWbsJilpefCLQztprAAp7vNeJZU9
 alHYzaRcUdEBLhJ1i5Qy8DZQBWs03vGpmbNiUV+1OkRk/xUiAOyl0FYxmaywt+Zp
 J/S2tlXWDxhgna2sfAm0FG+FmZ0gtkT4DWBgZ3O46T+BflchZMnlv3YrnhkdqYRK
 dpx+ROt7RNiZ3HEWKmiWIfd76pMh6Q7qO9dIypQzsEwB7GSzeNVukbu6/P13NPLm
 WEzYyB9XzXTikWdQKyR/6e9pQMWhQgwTH7JiigsaJZ7DjAk5eYhoBAytytNi4yc0
 7iNOQA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapc1yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:27:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7741f6b939dso2675302b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 01:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320068; x=1757924868;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1nUyUpKi7e4ePG1N5pB+4o6pcKvcsMs745pR85FFLuM=;
 b=t3IP9UKzK1TFgsv0x3ThuD4RO7XW3oeGITgEh4LBLynreSTn2YsefZRUFKStIWHvnv
 eUHtehLGA4Nv7bvNg7mVJg+DtAYcEdhOaf8q8ApvgTwHKeM+tF6SWsFYJ83AS/xxdscz
 wxdyP1z+VQXsnxPDH53PbbqCSI5VzdQSGlGNUvSIlSzk0jNNKgYAZkNw5IdMGHzn82TP
 vsrm/ituVmOZCNu8uvEIiROhRM5RRaoTvl7TYheVTy22USmVrCC1zXvFdWrqCcJMDm3K
 NhrEX15LruC8CRxNuj2wD3yXpMwO6AHBJq9oJRjWB4bSFWkOoBWZODm8cJ+nu+YV/WJV
 5/zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjk11wrh8I/V4YlHWeAoPXJNu5Muuc+0/PGxf8FunLwCDh8bfvbLtpzV1K4j716yNByUNWR+H/VcA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypLcrlnPeEqKN8C6Xl4R3f0ZP8/9RjaWEc+SkR9t4bjP/fvIc6
 uNpkYdNMGYTiW2sEzZZIdhpBibZjlYQbVLc7PuIwtVaVeVNcr2rodHv/46k/NGfCUwRcXLv66+o
 w+lbne/EbRb8s9bxHkq+HlQDrEkhzvSNb0gEjwZU91CPqDwy2U8gwSoQuJ1sIgr6C549FXwM=
X-Gm-Gg: ASbGncvqWh2mlpLAMqbyMoFaxK9zOIutP4zPBuwJ7h2TSVF3/Zc25JGDGvB1uR1PH2d
 m8E+hksRraqwC4ge9pH4zTrXIV1jqdu1CpiP11+nFxZy6bkikye8JA1HVa6xnoEPj6ObhAtAMwY
 adlJx1lysRlwu4YDBqrR9jdCHtZE3w4D4ccGqhH9vBLDf6PJp+piYW7BHa5Sm22/ulKidDQugFm
 NwscgxhWbKDGckzD1bYXY95avc4GewWOosKUDdEIEeGyf2TqL8G3stlWtRCKZ0IzXdLMOAvT5Yo
 1KrhlbZi0BIfe+u+GWZmUHvObeMkGs4QzTdi5CahncystodKgVSuBe3InhS83DoP
X-Received: by 2002:a05:6a00:140d:b0:772:7b9b:b1b6 with SMTP id
 d2e1a72fcca58-7742e4744e3mr8523412b3a.9.1757320068427; 
 Mon, 08 Sep 2025 01:27:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVjuJK/G+P4YvXM69DGczHhw72zFeO7sf37Efafvi/Vxh1TICLvoz+DFmTAkwbSZSkIWwwyA==
X-Received: by 2002:a05:6a00:140d:b0:772:7b9b:b1b6 with SMTP id
 d2e1a72fcca58-7742e4744e3mr8523381b3a.9.1757320067910; 
 Mon, 08 Sep 2025 01:27:47 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:27:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:56:59 +0530
Subject: [PATCH v2 06/16] drm/msm: Add an ftrace for gpu register access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-6-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=2909;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=YQ2FW8mrQywbHukXvi9BRZ8Zf2lAQF8Asu7HWpVsQ6w=;
 b=FnEKqw7xBdZgbmj77T8HCgPsmNDKyxAmJ3IKiWW8PFY/RpSu7S3o7rVgi8HfZRBx2G/WFi4M5
 P08U8MzeCGKBhSzx7qW04sC7hddFrieB7QxtnW1+nsqpzBIt+J7Mew4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68be938c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=exQ2vEUdbx4SU7VtH2AA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: nG-Lv56GsnlHnQa54sT8tCctJ5hEJCz0
X-Proofpoint-ORIG-GUID: nG-Lv56GsnlHnQa54sT8tCctJ5hEJCz0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX6/ItfoYIKcSc
 bOw0ru8U7Ais7OCrbQofxgbvjjeogGOsUn/lp0+x1zg0TyF8Y1D4B+ac7510p7lTkMuuhGsfGSi
 w8S5am1iRVAI+dGm79uWu2Gbkslp2ySehaCx+anb+X2zNSpKiVLEaWlwcdzlnfwY91astcH3o64
 EzHlE/R7Ka9w19i76hE9xaIa5p8ZZ/UCRm3inr6XUOLCd6i5TN9jU/AIKCMVlwOmoIC6GLtmNRj
 r76OpocvvyLL5X1CoC4poQCmujAcFCxCdOXB65kEk8235P4Y+HHbmLLKAURsw7tiP/dAOBKvwAa
 GnI/vLNLgFquPMOUGN0UptCtJjXDCgwBSEZBWsttx8STfhMg8e2zPmHDhWgZU2rYuUfG0dGcqX9
 qtyxcTeF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

With IFPC, there is a probability of accessing a GX domain register when
it is collapsed, which leads to gmu fence errors. To debug this, we need
to trace every gpu register accesses and identify the one just before a
gmu fence error. So, add an ftrace to track all gpu register accesses.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h       |  8 ++++++++
 drivers/gpu/drm/msm/msm_gpu_trace.h | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index b2a96544f92a55cdb372729498b8f0b0f9ca80bd..866bb090af064666586cea7125254bd375b7a35c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -16,6 +16,7 @@
 
 #include "msm_drv.h"
 #include "msm_fence.h"
+#include "msm_gpu_trace.h"
 #include "msm_ringbuffer.h"
 #include "msm_gem.h"
 
@@ -613,16 +614,19 @@ struct msm_gpu_state {
 
 static inline void gpu_write(struct msm_gpu *gpu, u32 reg, u32 data)
 {
+	trace_msm_gpu_regaccess(reg);
 	writel(data, gpu->mmio + (reg << 2));
 }
 
 static inline u32 gpu_read(struct msm_gpu *gpu, u32 reg)
 {
+	trace_msm_gpu_regaccess(reg);
 	return readl(gpu->mmio + (reg << 2));
 }
 
 static inline void gpu_rmw(struct msm_gpu *gpu, u32 reg, u32 mask, u32 or)
 {
+	trace_msm_gpu_regaccess(reg);
 	msm_rmw(gpu->mmio + (reg << 2), mask, or);
 }
 
@@ -644,7 +648,9 @@ static inline u64 gpu_read64(struct msm_gpu *gpu, u32 reg)
 	 * when the lo is read, so make sure to read the lo first to trigger
 	 * that
 	 */
+	trace_msm_gpu_regaccess(reg);
 	val = (u64) readl(gpu->mmio + (reg << 2));
+	trace_msm_gpu_regaccess(reg+1);
 	val |= ((u64) readl(gpu->mmio + ((reg + 1) << 2)) << 32);
 
 	return val;
@@ -652,8 +658,10 @@ static inline u64 gpu_read64(struct msm_gpu *gpu, u32 reg)
 
 static inline void gpu_write64(struct msm_gpu *gpu, u32 reg, u64 val)
 {
+	trace_msm_gpu_regaccess(reg);
 	/* Why not a writeq here? Read the screed above */
 	writel(lower_32_bits(val), gpu->mmio + (reg << 2));
+	trace_msm_gpu_regaccess(reg+1);
 	writel(upper_32_bits(val), gpu->mmio + ((reg + 1) << 2));
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 781bbe5540bde6d9cd6758050229fd0406fad232..5417f8d389a370e8d0b9c7e447050e2965011c0a 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -219,6 +219,18 @@ TRACE_EVENT(msm_mmu_prealloc_cleanup,
 		TP_printk("count=%u, remaining=%u", __entry->count, __entry->remaining)
 );
 
+TRACE_EVENT(msm_gpu_regaccess,
+		TP_PROTO(u32 offset),
+		TP_ARGS(offset),
+		TP_STRUCT__entry(
+			__field(u32, offset)
+			),
+		TP_fast_assign(
+			__entry->offset = offset;
+			),
+		TP_printk("offset=0x%x", __entry->offset)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH

-- 
2.50.1

