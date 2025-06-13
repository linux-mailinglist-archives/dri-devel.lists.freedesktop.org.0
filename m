Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03219AD98D6
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 01:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BB310EA4E;
	Fri, 13 Jun 2025 23:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5doqY16";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07C710E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 23:57:13 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9jbik027374
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 23:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=6n4/m7XLpgv
 1bmn1KU5WILxeVGc6KBK6T1WyY0EI2mI=; b=M5doqY16KyIl5mXiMuUzorHKCki
 boR03cwKH0hqdP4Sm5/JDgyW5hXhN4lcZB1LTzhS/++yFUEGUAxaQ8/49CsYnwrH
 8OzPTskcDLiSGpUpQHD5hPvS+OvJMZRH1kHkWw4u+8t6Hju7A1is+DJiMLUAnjyi
 nzE92AsQbsC4uM9YIQkTSUyw+lxtACiKRDEvcEihou9dJ3Vdhs4R7XC5eQu29JBC
 zGfrS7fKlLlv+TD0DCXT+0g8huMFwR8RpPxV5l2QhQqVBWgFTHFuidKuGtuqkABk
 NdNq3qLqnH2KmYrtj29faQDvq/E3mmFc4F3rj2YS6WF9Fhd21Rpc77a1tiw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhkk74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 23:57:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-74868e73f4fso2054386b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 16:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749859031; x=1750463831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6n4/m7XLpgv1bmn1KU5WILxeVGc6KBK6T1WyY0EI2mI=;
 b=q4Wajnw6YAkPpZDoKBwVg83TCIc9JAf7DOeV81Vp3W5ma29GM78N74ER8OyKAua3PM
 EYVZ0T11KUczGbseeKiaTdtaQU3cH4q7m3cdP9c2RAf2rkoppVciead7h0/vtZ8CGVLP
 IrbqgQz+tJlkpz3E3gYnYM31nCWyriN4gijiNqlP3sRVSZAGRVDtgaqP2C0ZgHE4S81A
 IWVXuZUW0d3OfSRE50+0HPCSSia9cro4l/sXbwqa//ymMP32nFV6XfOcuLsoTExr1VuY
 rBO0n/1HQbKgtZoaWb/tH0kWXwfRsjNSq23E1qg7X5csuMACRA5TI/v3pWYlXgL0E3LY
 wirA==
X-Gm-Message-State: AOJu0YzzDKNXBRd8mdQWqpUlMWTyVHdhvYLQOurJStUbPrWBK/ZVI7aQ
 FsaYLBZ5X7vrsrmb5+rMTAtN2md3c5D2prRh8dT+YA1jj3YOVkQzJj+ZOpOYFwy44/oJoCDgyec
 QgOIo0GG3k1IlMCGBj/OTxs3HoTRxUUb1hF9fKyPFbuhRDglc06x2aGu/aeYlQ0s9G+7iybwPuL
 qH/eY=
X-Gm-Gg: ASbGncvtMjWaKum5G5A/JSKTIFT1gudfl28FhAqbooadwra7hSZQ8LgHE7r6ItCXJ4W
 4fhwPRKJkPsQuvA1Bd9A+x8xRPP7zXtO5HYl+vSKXkRbYDieOV28SYVBcaPG2HArH3hjx68HHTm
 RkkUaJ9VD0fOWVc5rYOYfnkmwvD3lJh73aGnLGzikdzbz2oLho0nx6HYqXSTxDwRiu/HfnSM7pt
 eju6VsuZKXL9JL6CPQvsv89X36+H4S0+qtQgMz9U+BH/XX6hd6TpdQBgzerMzUBl5xNXD05HKTp
 26l1Vow6+Ov4BD6RpO/NMPHCFDwQCnae
X-Received: by 2002:aa7:8884:0:b0:736:a6e0:e66d with SMTP id
 d2e1a72fcca58-7489ce0c6cdmr1483739b3a.6.1749859031374; 
 Fri, 13 Jun 2025 16:57:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCRfklBUOjp5KBQmK/hK6hjxc67A7avI5+sKeqVuyj+UT0qNB0kPJETEj0TxOCbpS0dd+Z8g==
X-Received: by 2002:aa7:8884:0:b0:736:a6e0:e66d with SMTP id
 d2e1a72fcca58-7489ce0c6cdmr1483714b3a.6.1749859030978; 
 Fri, 13 Jun 2025 16:57:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900b28b7sm2330672b3a.136.2025.06.13.16.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 16:57:10 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/gpuvm: Fix doc comments
Date: Fri, 13 Jun 2025 16:57:02 -0700
Message-ID: <20250613235705.28006-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=684cbad9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=A6x8cpN4-4lAvlAOjyUA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: SWn49lrsedWQ-VgFSJHRLXB-VugEBdy5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDE3NyBTYWx0ZWRfX4hdU3NKD3TE3
 WnPu8IyOM68RxFdNpdcoUuFevcTpCYDrZ4pRGbZ7IL8LEJ6Lx/MuY28z/wVRrLE/jX5o9BDz9tQ
 Aze4ifj0gWMRBUuykga9nil7py8LNbmu+OTwieHwYOO47rbD/lgP0M17S5zCFt9VNUT939xknYV
 PlsO4je5OeOJKrLEuRi7mSbkRkMmrt1A9j+rxnXH3cztLI/oi7wlAIvP2Uvh6cMYOHuT6Mq+fqw
 aBPVjVzljQloc9CZn6Cfwk7iUoDEWRX8D2WMu8DeNIAcvoaLw5ynqcl2nHZ3aKx2XMeVeT23cZF
 gGwQyyhH5nG3WSA0kKL0IgRuR+iqNQJBAw9LKjDnfDT/n13T2vSAKXPWYZAh4LWaMy2A7QWPTwr
 THZFHlpj6KGwLFBekSYq2H8LsG8GEAQlyks2inoT0ZUakMSUMbPFo6IVG+54oOnFTn/4GnMv
X-Proofpoint-GUID: SWn49lrsedWQ-VgFSJHRLXB-VugEBdy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130177
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

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 6 +++---
 include/drm/drm_gpuvm.h     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

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
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..0ef837a331d6 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1205,11 +1205,11 @@ struct drm_gpuvm_ops {
 };
 
 int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
-		     u64 addr, u64 range,
-		     struct drm_gem_object *obj, u64 offset);
+		     u64 req_addr, u64 req_range,
+		     struct drm_gem_object *req_obj, u64 req_offset);
 
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
-		       u64 addr, u64 range);
+		       u64 req_addr, u64 req_range);
 
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
-- 
2.49.0

