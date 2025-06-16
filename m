Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54260ADB4AE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 17:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A7210E3CF;
	Mon, 16 Jun 2025 15:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxbYSMFr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC6210E3D0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:06 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8QtgC031850
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=C2Mw8hDedlh
 HIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=; b=ZxbYSMFrn7l7CisnPoThSRW7Vr1
 6wo/B1bmVhyPYilbv6eAQ8x0DTGbHzQ3+P3PlfK6VD3uRlaBfkI7c9f2I45rYcCY
 /5+R0PYNux+VnLhw2uzm/2+wEEmDMtXAhWu5W1Xq4xBuJo44ua76aso1xfJ/Nu2d
 0vVCQPTTOy3vNv2AXPDpSzBJDqSKAYha34GRF6Ie5nvK9dBp/NTlHaJEkTxPodVG
 Yfq2h56XLfCGzdafhhf6PTeY8xnNFOmXCd7hvXO/X8ovJhkS4XvQiBtT3etYsNST
 Jgzg2ChR0cT4swJVH2uA52XK/JOel4yTa08r2FL1oQfagLZOtX5zoA5gLZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9vxkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3138e64b3f1so5570716a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 08:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750086005; x=1750690805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2Mw8hDedlhHIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=;
 b=mKRNJnp5zEnnZeOPeTqkRUxOpuBMFQd3rfT5nDo1bK+pEezT8wqu0Yke9dtBV1CssI
 b9Veb4GwJCeyluZ65/G9Kqk8yKjwQ0G4ZgZn7fotAE0tuzL5FimQOPbW4ik8ZYt/FoFR
 8kW8LXnDQwXOxa6d+6VaEt1TZbgJaS/yMKdYC+1pkO4QhgG609zvZ+M44W/huO39fjb2
 Txvym4iA6EmjTMbZQtZgrJYapiouRCluIXNGHRsCuzy2ByprBSlJB27V5x8AD7FGwF9h
 D7tKeTJFfP4xu+6k1cJvBN5FUQHjWms3YGBsaS6FDolcRbiwdJeAz8ToCXTLIIRlAJTq
 JKaQ==
X-Gm-Message-State: AOJu0YzMjEEQoZ1vlxbzVqqbewpur8amQmSWvBjNhAW8sQ3ZdeYwMbRk
 XfapQBZVZG9oBwg5PUfA5IPOSvsyGpoP7TafLQy5xnCxnzTEU4FkBI1B1FMbVV+qcwLiFCTFvYL
 CJnLXOb9Nu7ft9so0RK/gumV7An9QqaSe9v5nIrBCP9DV583X/NqFdkojuZr8Dl5Np1WMbM7/MS
 yvQB0=
X-Gm-Gg: ASbGncvHmpWAe41IXVGagBDjkSyJ5iDJNIVRqwQ841j3P8d7Qf3rPbX+9C7DDuejhfg
 ITToX5dj01U5j82pJ/cnY5QkofEMVJOHW1MN3FFOA4j3K2//JZGRqiuJ6Lo33KSi9rIgFBmwufk
 KEpYiF3dzSIZnx9+qC5mODx/qSPWud0DNTJgt7I6Wwb3cYjN0N5DSNVMrr0YeLu0CWTYWoNQTBO
 6PNghiyQ8BIDSyTVB/8jAWEgRXmkYnVZrLyUgIvdk8x0Ne5yZ+jCvqd24pb2t9OrxQPUR4TpVln
 RNGDd/3I03hkOcoF34uxEvRkeA006pU3
X-Received: by 2002:a17:90b:1b10:b0:313:28f1:fc33 with SMTP id
 98e67ed59e1d1-313f1cd5a81mr16293970a91.10.1750086004604; 
 Mon, 16 Jun 2025 08:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhSwyYJbkfuG+cowVkLmWP7rTUfqw9+6BV4SQmAMwgYeSuRZuWklUdQ7zzXGTIOcmBX5tInA==
X-Received: by 2002:a17:90b:1b10:b0:313:28f1:fc33 with SMTP id
 98e67ed59e1d1-313f1cd5a81mr16293906a91.10.1750086004136; 
 Mon, 16 Jun 2025 08:00:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1b6d4c8sm8716826a91.48.2025.06.16.08.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 08:00:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/gpuvm: Fix doc comments
Date: Mon, 16 Jun 2025 07:59:56 -0700
Message-ID: <20250616145958.167351-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
References: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: u22552S2WaLV2RSBZCtRqxiL3ES2FyfO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5NSBTYWx0ZWRfX32ImG8VUWQsq
 EIU9qZvgT5Z5lLjw1QAR+Kb/p4t4NOb1gweIMxDW22cdaJLBBy0wvipafoyfa+wSbMhFZjquBUL
 o3bIf5mfnNsDDg5qDTd7cVIx5gYBH6S2dDkaZVpdPSDO9vjw8IWLzTitoJdnwld1+38xGIRdQmx
 vETLqRx7VSShoAdNPXpR0zX6JcQMuFMP50wGmrKOYz3bI/n2wkuw81G98zi/QyMOT5u4Nrmm4e+
 xK/uSBitYjOTRIrfxU0YaBOz3omnGwV+I2nNr9zjXApb+ERSqBzknDwxjAV8nCMY2wwebvQS0vp
 tTOOfVOnilZqF0lLgN1G2FpWnbDh2z+AHwinES1aGi++wYU6Ds3iSnUWwPVpXPQRa3PoKV0zYDW
 kwEC9rKP1Sy3VpykdzPjEL/U2w6kouMfaveNNFq1gug4cqU3EQisVf5SzkqtXqdOCuBcSMB3
X-Proofpoint-ORIG-GUID: u22552S2WaLV2RSBZCtRqxiL3ES2FyfO
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=68503175 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160095
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

Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
and names.  Just something I noticed in passing.

v2: Don't rename the arg names in prototypes to match function
    declarations [Danilo]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..0ca717130541 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2299,13 +2299,13 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 }
 
 /**
- * drm_gpuvm_sm_map() - creates the &drm_gpuva_op split/merge steps
+ * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the new mapping
  * @req_range: the range of the new mapping
  * @req_obj: the &drm_gem_object to map
  * @req_offset: the offset within the &drm_gem_object
- * @priv: pointer to a driver private data structure
  *
  * This function iterates the given range of the GPU VA space. It utilizes the
  * &drm_gpuvm_ops to call back into the driver providing the split and merge
@@ -2349,7 +2349,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
 /**
- * drm_gpuvm_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
+ * drm_gpuvm_sm_unmap() - calls the &drm_gpuva_ops to split on unmap
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the range to unmap
-- 
2.49.0

