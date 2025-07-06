Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7DCAFA495
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 12:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7564B10E38D;
	Sun,  6 Jul 2025 10:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9HJKwee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933A210E27E
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 10:50:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56690iUR002607
 for <dri-devel@lists.freedesktop.org>; Sun, 6 Jul 2025 10:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gQwF7BjTXtg7965OybbDmRj0hZykpVfXE58N/V76Bys=; b=Z9HJKwee5TLv50Zw
 jjBRKSb+twj3ZK0Kls/ivOxeaVRfH3rRcJT59qXJXEvXLfoqGKhRGYEuHZumMNqt
 diUZwR3TASXONH00f5XJ8l1LvHs+jiAJvJ/h1U/hNbriShmnWHo0WF/Zkc7nWrh+
 cpnGOHZT1SkVzYLnmq21We2O6Uo35xeulz0PbAeqj4x+DPZedtyEovdNT8B4Nv6P
 XIjcUnu0qKcXJUr8CYzHNQXQhCIkFUBv8dLvF1e0MZQ7+xgbyTfow9aF5+DSFRVW
 08+LEt6o7lSF3EXVGbJn3Kpey/9iAtYwWb8wxnjbpbaWtfR4QIRqEZTInWBCIoBL
 tqq+Sw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0vukg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 10:50:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d09ed509aaso268709085a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 03:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751799048; x=1752403848;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gQwF7BjTXtg7965OybbDmRj0hZykpVfXE58N/V76Bys=;
 b=Rr70DtWDddJR72YYIDVmo9wkCzDRxqC0IJErju2Ym/eQ5W638M/+dYWZOITbXYVOBd
 wjtu8nKfXblqaTqWMVpMeWzSFxalLdubWkE416FDP2gu1Pk/PegjnqrgnyPcIL2t8d5+
 B2IZZK6Rxk+wBr9/A8Ns8Inx3/fY/KdI2ROgdmBw6Ji7bOVddEvLTk442isc/PlqFjnf
 qLbahHEQheWr8rwir9qYL3sbBkX8onfoTWJmiJqJjdhwIrXNCog7OhxlH/FDfmyPtXHT
 6pFYQdbTmyEH3Nv/4q6mm4JZg0J8yfmOMsl7w9lxQzDM7CBFBlK4EazmGKlo8Jfx5CsP
 Driw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1//7hAlhVNYsp2R0ZjsHN1LgCVP5E+6NydfLBZSEKFYmfT7/qENR/3beprISiv5xEu78hHaZLR4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+3Ho/d4jBc2bx4Z+E7PHZr+9OTABluhepVs1ZYdz9iVzSBlBa
 lotHnD26EgeLNzAGbLP3NzGG/KyDmnzGCFXxHgtmUQ7Lsqei8UFNMJmH9Hj27viLM4/Da5Jr2Uw
 Y87OEBcDLzIbSTNfQKFMhFGsWvg1cZZIBXuNpg+pQ9nz3wD32nO/k5a/+QsuP7451jVpIcNk=
X-Gm-Gg: ASbGncvtj8mNWof3VkxZ7ZbRm0UpkXwGHVvUD7jLYqG8vZIjJqcuu2FUG9lPxT/NVo/
 X9BpRK3Jml/GlqQnxrg+Q12tEpxW9Ybm43s5Wg/a1bybWqSmElJzcIc3CtgE63vOdasvsFSF4oA
 K0PzK4Od8J7fLzHKyl5gTCq1jufKPnTZIIOI5CMfFqc/wxv6vlkgXvKagdlke2hHjUlNpMOcXAo
 5SyX4zMt5JROQgebYnBon/5ju9yMg2rJZI2hyBsqPRusDURL0dcvTPRrNtFS5U0TXRVPgNZR4SX
 SpaRXK27USG10FVVTiGWrLcmE+1C2cYhurhwvkOqgxpHMa9Y8jPxX7iSDwZSrxmC37395TeW5po
 AUco9Y/hU+NWBY5WGyw7h3CZkLZSIhZlfbl4=
X-Received: by 2002:a05:620a:7014:b0:7d4:53d4:578d with SMTP id
 af79cd13be357-7d5f10fa22fmr697623085a.36.1751799047556; 
 Sun, 06 Jul 2025 03:50:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtyZ9ucK7jsORVaYGW7av0WIAu76YoLf2T3keQ5iRHn3mdAtAO4h06LyQ2I0lncFhsncDHXw==
X-Received: by 2002:a05:620a:7014:b0:7d4:53d4:578d with SMTP id
 af79cd13be357-7d5f10fa22fmr697620385a.36.1751799047134; 
 Sun, 06 Jul 2025 03:50:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383bb555sm920621e87.20.2025.07.06.03.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 03:50:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 13:50:37 +0300
Subject: [PATCH 2/3] drm/msm: stop supporting no-IOMMU configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-msm-no-iommu-v1-2-9e8274b30c33@oss.qualcomm.com>
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
In-Reply-To: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CVAxMJ583rYEGC1+K/sUzP+WPoNKZGaqzP5oZqg2sAw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoalUB1+xuuKCza8FRxLDaIpuk4/9nNPUhbOJSM
 jVRNJAo8N6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGpVAQAKCRCLPIo+Aiko
 1UkMB/9kTumwrySnCjd4VSt41UeB4BUW/u21VLeSik9PtHt1VuBLn6bQIhc2174IcmTnc1lQ0PQ
 SP8DPvssNDhjdb25NISWlpA22w5hYNeZnoBcwZ1hspvX01vSaHDyavJXQWSsfQAruHog8hEMsjY
 K+USDp5d+IN6DrP0nM3EJ6/beHJ6aDOyRiM3l9A5IXL7B3Xhe1LS20yXeokJ4aICVQf1vyfzSyC
 cvagS7NZpMysbO+OeFMjwPvp+N1nXsYGzKCR4R7UKBWs9QeyB/5afJLgsMOCBq9wNURns5Pz2od
 UJXe5YkdA+va3Df2WP+dyqGhfFsDNpcvDBspBEq4LKD/SDGD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: SyHWKAVcJTbjwhA5qSDhS5oi6cpOZ3Nw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2NyBTYWx0ZWRfX6z2LprBtWimU
 bsWOP6s+e5LiP4eTTUL/Ka+eQenJVxbnmiVw/9SruWlwWXwsZS2t87/uxihSLERs7darK8jvctj
 UTFK0XuTJRSLNHgcKVJMBh04+yh1cOeZNPxbrX6qMG2BoiVgNV+FCKCky+k5/cosn3nR6HHaQJn
 iJWLpMFhWfeqBfI+ZUBoA/TLiIR19LXthJyL550/lihVU5bQyj7nSEkwnwAioTeoNVUFeqyn1Sg
 spsXCdlSZRgdFD1Dq1Yx8sggQGEZUoAkEyd1hHNT9n8Hx+dsbWW0AQEW8GYzJbVXJPNwz8YVUZU
 ixkuGdKHsbq/lr443COgAJfps9e4jaGpl3dajSAh0CghNkxjdw5jipw13VLOswIDpI3yc6FDXvU
 iRrbK6HDaUSY9tyg61OGa9q3sV5oaGfcL6zY+8f7vRAhFK2n1+++yUEDcjw09lR93Noi9Lgb
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686a5509 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=bqLZAy-zUTJ7f3hpqcwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: SyHWKAVcJTbjwhA5qSDhS5oi6cpOZ3Nw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060067
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

With the switch to GPUVM the msm driver no longer supports the no-IOMMU
configurations (even without the actual GPU). Return an error in case we
face the lack of the IOMMU for an MDP4 device.

Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 6889f1c1e72121dcc735fa460ea04cdab11c6705..2e2ab93b0f6f6a462e99d54b33da6dc21b1e8435 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -201,8 +201,8 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
 		return ERR_CAST(mmu);
 
 	if (!mmu) {
-		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
-		return NULL;
+		drm_info(dev, "no IOMMU configuration is no longer supported\n");
+		return ERR_PTR(-ENODEV);
 	}
 
 	vm = msm_gem_vm_create(dev, mmu, "mdp_kms",

-- 
2.39.5

