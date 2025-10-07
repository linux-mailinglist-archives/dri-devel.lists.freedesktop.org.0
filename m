Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F04BC157F
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 14:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0CC10E191;
	Tue,  7 Oct 2025 12:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jy1eqSnq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60A210E191
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 12:18:48 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59744m5W031103
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 12:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=5dWz3ECxHXJJo7so4Ok0l1Cq4x4gampn3mT
 o1GLrOWI=; b=jy1eqSnquNtQLr8vUZ5rqa6talz3DHZE5MzK+RIim9W02QO6hC/
 mEo79N6ARJ6QfOA/tXIvKglnzXWDn4KeYMDR+CjBxAiUvzMsGNcy6LtJkh5/BxuS
 4wuKTq9t5p9RXTaTnQoueC+C01IuMN1doSF7V5/IwbAnYjIleewEFCR1jD4ZaPGd
 Llw8+aiyYaUyzuHWEj0wS9sSGhP0p6YNYfATCDvz8m1t910fV2ijK7ZhkY8siy9E
 +71tCtUp6WWTbkzJ2cf+NCXppMvmuMVvCsrt80Su+VrmTEPec7F9kzwtzMAX/YWL
 Unr1o6mfSZEOA5F/oFBQ/CNvx5QkC8L/CIQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgq6p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 12:18:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d6a82099cfso160718651cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 05:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759839527; x=1760444327;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5dWz3ECxHXJJo7so4Ok0l1Cq4x4gampn3mTo1GLrOWI=;
 b=Gt/dj1AJiYe6CN1M7fPAi/gBFnDDWkkUTSlmSOleyQmdBEkOGBm0w5kw+JEosa5pRB
 pky2KxQ/Ryig4s0+Rg2nNBAmXXa03bTASLPB8MJ5vhgVgIsRsCXwKXoE0x+sD8BiRd6I
 SUdV5cNWi2mOlnAoNtQwkmoeplnJd/RM1vXiGnZrDLLanV7cIp5UOSrmyEh7tX3e5pFt
 jPdvcHFWu+4Ztje2Fus7d38j8LABm0eI9tcCUuPhFDU8mncnSLMl+hDRokcB/ql3xBfx
 Q67Rj+le+G6nyg5GZuwTBqs1MU1cAMJHJilVRB/xix4oZmZhy3TZeRbKAgfO1cbOGj1h
 UBNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFJFNsI35y1Rukh+aeIk2eDz4TelDijBuYX9V1i6+c8vW45bE0AWrzbuMwaGded4m5CAzOfAor6ns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeeXY7y9/7E7cWpUATgr/5sUs9Zow80ofViXqwO4NImlihgh5L
 tmArT7r3in66ts9Hfdy3if6wvRvYcbkUqotHaYxa6o4B368EuZEKJCTKRZNYDX/uPpsDWjg7Ack
 MmJ3uTojREs6IkNnbqrZv5K/wjb/McWmtsiFixg+ZNE8Wy+KR2mbseI7gWsOx3Gkyx8qpcdg=
X-Gm-Gg: ASbGncvHSXUaCQUM4KjOz2pgXLlSK/dIgbqwDNhCcY4Oq2gLLsrJO4rPdV6f4YBhZXt
 TLZJsQXU2eVNJvdboyr7y4h3ohyFpN04bOdX3i2f+v/K+xzn8KlLDNTHXsj1QLSBS1nOObrnm0Z
 XvvmDvhwBH/6Mz/GRidoU/R8V2XPDZoENzKA/yWJWNAxzO0VSqZ2UUshT93L6EKJ/7jBue9/eM2
 X1TmqZdFnGjoEY6oGJtrznYpQPkqHOFHKHOAuVVpEtlBxYj7s/67XM8uM7Pppetc6TkPtUzTpI0
 XtoMdBCplG/MpF+rnLzzKvgToCf3S7cMhq60EIoxFcmkAZ2iG9ipS8nJLk+3afOQd59hf8YVrHl
 FRGdlNfUghw==
X-Received: by 2002:a05:622a:4012:b0:4b7:aa99:5459 with SMTP id
 d75a77b69052e-4e576af2716mr221230621cf.76.1759839526742; 
 Tue, 07 Oct 2025 05:18:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6SQQh91mohrrjxHh6JP8YOjkEi4tK0iTQoftOGQeGK+nLYdlU4L68WfYoOUfov+vajrKWJw==
X-Received: by 2002:a05:622a:4012:b0:4b7:aa99:5459 with SMTP id
 d75a77b69052e-4e576af2716mr221229981cf.76.1759839526230; 
 Tue, 07 Oct 2025 05:18:46 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970b315sm1383081066b.64.2025.10.07.05.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 05:18:45 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Use kvcalloc() for slice requests allocation
Date: Tue,  7 Oct 2025 14:18:45 +0200
Message-ID: <20251007121845.337382-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX0m9xMVLRrmkY
 3NEzY9K5bg+A0h5mIvzdaU3gapbKaXmvpQK9Fv4K1EZrpPBa82x2hMWH5NXf7LQSMHJf/izLZol
 xK/XUZk5mHsHmgw4ejlbcu75UkiabZ14KO+uj7lm4fiJXG/R4SkKBmGIM0tiM3Wiuvncl+kqBEo
 dFz0tb2m5YINF3rh3OyvoU5TzozkBFasJ8cjQyUfQvP7W1rvlJ/HKnnrs6P0hg9qs+ybV8xIY6C
 qdxHxlDi8zX4AuxCc4EWGxDEuun8i5tiRSILT69BSvpg1YlBj1T7jkLLr29U6VMNkfMuM4SgjKB
 a9rvFRAegGtPxnI1QQ3Kr1tcHzndSYbtodbNcpDNiNbLOL6Hs2ivN67/HnUwLVBIl7fLqXBEXzv
 VEfgZSH5JaS4PerYND9E0ddDqTKbVQ==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e50527 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=CJ3JEFviXy7-Y_lWR7YA:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3qEE8IVMnaEJ0i6VqX967MoBbjyb1r1G
X-Proofpoint-ORIG-GUID: 3qEE8IVMnaEJ0i6VqX967MoBbjyb1r1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019
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

From: Youssef Samir <quic_yabdulra@quicinc.com>

When a BO is created, qaic will use the page allocator to request the
memory chunks that the BO will be composed of in-memory. The number of
chunks increases when memory is segmented. For example, a 16MB BO can
be composed of four 4MB chunks or 4096 4KB chunks.

A BO is then sliced into a single or multiple slices to be transferred
to the device on the DBC's xfer queue. For that to happen, the slice
needs to encode its memory chunks into DBC requests and keep track of
them in an array, which is allocated using kcalloc(). Knowing that the
BO might be very fragmented, this array can grow so large that the
allocation may fail to find contiguous memory for it.

Replace kcalloc() with kvcalloc() to allocate the DBC requests array
for a slice.

Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_data.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 797289e9d780..27c24eb351c7 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -165,7 +165,7 @@ static void free_slice(struct kref *kref)
 	drm_gem_object_put(&slice->bo->base);
 	sg_free_table(slice->sgt);
 	kfree(slice->sgt);
-	kfree(slice->reqs);
+	kvfree(slice->reqs);
 	kfree(slice);
 }
 
@@ -404,7 +404,7 @@ static int qaic_map_one_slice(struct qaic_device *qdev, struct qaic_bo *bo,
 		goto free_sgt;
 	}
 
-	slice->reqs = kcalloc(sgt->nents, sizeof(*slice->reqs), GFP_KERNEL);
+	slice->reqs = kvcalloc(sgt->nents, sizeof(*slice->reqs), GFP_KERNEL);
 	if (!slice->reqs) {
 		ret = -ENOMEM;
 		goto free_slice;
@@ -430,7 +430,7 @@ static int qaic_map_one_slice(struct qaic_device *qdev, struct qaic_bo *bo,
 	return 0;
 
 free_req:
-	kfree(slice->reqs);
+	kvfree(slice->reqs);
 free_slice:
 	kfree(slice);
 free_sgt:
-- 
2.43.0

