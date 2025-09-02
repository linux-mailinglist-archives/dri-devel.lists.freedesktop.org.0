Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E98AB3FE6F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0B810E689;
	Tue,  2 Sep 2025 11:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNw51qeb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FAA10E68A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:50:58 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B0nXU016317
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 11:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uX04f8wmwAHTEoCBwCRpg9tdJXyCAWOIBcQwAGC0LXw=; b=oNw51qeb20gRjh5K
 SJcSqN5ur9YoYdqRKWm9llbBe3eiVlesT2Fx66WHqOb034ZYy3dxmRjtYb72jMG5
 5/0vqw7EPbnbe7QVv+aPp1UWh0KHrSFGohsWTQN1VkfBuqogbs3IXMMwPvITfNDp
 VKZ4Lm3RH+KU3F0u/iGhPXWx1L2HBjOybiIN4WZnQ6oTmnUNJUX4krJqhzsmifsF
 uNjxD4q4MCtzk86FBcjDYPDQ76v4d58SfkT/di42x2MaC8ra9vHhOJXTCfZMe9nM
 5fiCvpVWJEwVBV9RKzLOgHzsFEpevhoY7FPLszqABuVCn6s+yZVDcUXqQ8UX2Iam
 tIk+EQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyynb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 11:50:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-329dfdc23d2so774974a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756813857; x=1757418657;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uX04f8wmwAHTEoCBwCRpg9tdJXyCAWOIBcQwAGC0LXw=;
 b=BwqOgr250bYuCSKG/kEOrDyXi3TszOg5DMA/wCjI8mEwXauCdEDPV9SnnZQIZHpl4w
 NcNEZRFSbPMGW0qxXBPE//b4bRj1XOr8lLFJ3SA0m5lQ1Na+RrDDOV2xGUOL0Jp2vdUR
 7hJftnoBIzbsEayG15cV3oEKRV6vcHgrJl19CbeetbwfQi5x1cjRU7VTtdFY9ZiwntMv
 q+SYDTJAdafWQzcZ55xY1R6AKWkKd38nhaflGtjXvHdkSXH8otMSEcBsdGbWxfBw9Brv
 rrE+O2YMu/7R6ltlfrd2X+K6/NXLcJa6EzgrUFkR+5+qk/9LvgHOb66QY9+0HuZyCRch
 iddA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMJHbCG4iXNeaRrRevJOImLLCbUPttgWu3i1Wi+WvOVQPsoeEIkOaSvpegIKehi3j/OLWDYRsWPCw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxH6iX4oNDpIuCYY6CJtnEgKQT3DfvLeyp+/lXuOeXfT/BfYWaL
 diGY2e96mpBLbafFvo/zuNblVTbXmUQzfq8KxGKA9GLIQCkLWK0Ltz0dQ372jgdJAbs1VZr7EVR
 A66lK4NEdu51/a0hcXatCpBTmYxVnTpjORuCvyBesNx5NZ7te+aXz0xteJ8ZwUXe2xU1gXzY=
X-Gm-Gg: ASbGncvApKAU2Tb+s9a0e1k+jcXBpefaVKMuTjcXttLJjt1xK8/I1j2p/LRi9MJYmS7
 KWBcrO0MZxX3nWIxFTsFhSJc2KQTfJDSMUc4HWhdEYvaDfWmZAcaACI2bJEQBKvZjDvQDmt24NQ
 lSISIcXUIWN9MjSqhYnZaPbk3UWqOO/befphNKBSFWwNnrlBaEmI4lRJup2HqAvP9BBfz6nIoYU
 1DhYPCNr/0WtJ/aI+PPee1NxdiZnzEntDk81BBBo4MGo7Neip37l0QrUf34KjZXc94dIFMuHUga
 m8Ka5cp43oBmauQ6XLt77iQZ4QBCY3SvWQw5RAC9YB4K98meXbEXpX3gvidpSHgb
X-Received: by 2002:a17:90b:17cd:b0:32a:e706:b7b6 with SMTP id
 98e67ed59e1d1-32ae706be21mr503225a91.11.1756813856668; 
 Tue, 02 Sep 2025 04:50:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErTRmAFRWJHqjCbxLE3P2bbrtdzC5Cpz+xDsMeCUqIW1F+tMhJ6J1sfw37u0AjKJ9vrGGI6Q==
X-Received: by 2002:a17:90b:17cd:b0:32a:e706:b7b6 with SMTP id
 98e67ed59e1d1-32ae706be21mr503191a91.11.1756813856183; 
 Tue, 02 Sep 2025 04:50:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329d089395esm3175428a91.1.2025.09.02.04.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 04:50:55 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 17:20:02 +0530
Subject: [PATCH 3/4] drm/msm/adreno: Add a modparam to skip GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756813835; l=1742;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NOwN+cR8tlV/aqnCXaU04cGy/XLeEqERgLf8m3fHuTk=;
 b=nETh6INr+D/D59TGsO48PohgUoYDADrMA8vDopH+eYwucT0xR9w6Xy9nVRTXxpN6RHUT8Y2cd
 vj8CoQJRz/+CLeVlmJ41VG+K5uMvPKxvAXahNtEUBILnkPu31iD82g2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: Xg0fSwjqHzASHkllZJ_FDs-oqYk4SUvs
X-Proofpoint-ORIG-GUID: Xg0fSwjqHzASHkllZJ_FDs-oqYk4SUvs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX8zbLnHVPLiAW
 wpQXTiy2WtiQDkqVf9gmhKCMhhQcLklLBEwdS9w3dB73BPPgn2dpp2+AphFEdLh2EDiAres89DF
 IdVQ1jLV6MMIFZCAo3bKPIGS//HI4Fd5gAroUvMOZR1tfdej/NWorx26QY7Z5eumOIeHqvVYMku
 dNCVyVkEbTKvLIpZBrZzYfMWUhVjfjWQ2nu1PxeRSMRO3i7MB3j1lJMLGsjTJF+aGaCf5PFZCYK
 NJARpvZqyQX3rhQohY+O7Njdl6DQgAo26c6I/rXTUH5Em7GaqKDHjZ1hSsfWGmoh7LMzAdi5h3J
 OCLnf8dZ7NBpUG8Rc4DwObnLZtfmtC3nkOVpd5gDNXGbqx/n33KTNa6Yi6swyD5Kuxcf68IPpXz
 LjnJ8WdJ
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6da22 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5u7-6dn6khLgd3CzhdsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

During bringup of a new GPU support, it is convenient to have knob to
quickly disable GPU, but keep the display support. This helps to
fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
modparam to support this.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 50945bfe9b4992118f23db3cd17ac348be9f9c9d..28f744f3caf7c59412aab06f912cd09a01e185ea 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -24,6 +24,10 @@ bool disable_acd;
 MODULE_PARM_DESC(disable_acd, "Forcefully disable GPU ACD");
 module_param_unsafe(disable_acd, bool, 0400);
 
+static bool skip_gpu;
+MODULE_PARM_DESC(no_gpu, "Disable GPU driver register (0=enable GPU driver register (default), 1=skip GPU driver register");
+module_param(skip_gpu, bool, 0400);
+
 extern const struct adreno_gpulist a2xx_gpulist;
 extern const struct adreno_gpulist a3xx_gpulist;
 extern const struct adreno_gpulist a4xx_gpulist;
@@ -184,6 +188,9 @@ bool adreno_has_gpu(struct device_node *node)
 	uint32_t chip_id;
 	int ret;
 
+	if (skip_gpu)
+		return false;
+
 	ret = find_chipid(node, &chip_id);
 	if (ret)
 		return false;
@@ -404,10 +411,16 @@ static struct platform_driver adreno_driver = {
 
 void __init adreno_register(void)
 {
+	if (skip_gpu)
+		return;
+
 	platform_driver_register(&adreno_driver);
 }
 
 void __exit adreno_unregister(void)
 {
+	if (skip_gpu)
+		return;
+
 	platform_driver_unregister(&adreno_driver);
 }

-- 
2.50.1

