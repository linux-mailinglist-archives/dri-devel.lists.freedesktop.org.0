Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278CCAFA494
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 12:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAE510E28B;
	Sun,  6 Jul 2025 10:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="goY77ZMh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C5F10E280
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 10:50:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5665dGPY003004
 for <dri-devel@lists.freedesktop.org>; Sun, 6 Jul 2025 10:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TXj2kLxWlavFfODBCwO4C0ty0sy70kRk1f8+2FzBiKk=; b=goY77ZMh7wpYl4CD
 97r0d25IbvAKRjshLAnj/gebj0p7V0ciNSu2pJKCR7nZ5W2rnw7vU8x2pcT8TWMr
 WreXaFnLMszLfn6FJrz3ISm2wYOz3qlwyCIDLOK+wtwm9k1sgmngyxnegxB72q9Q
 cUH59uIqnc2DBCLcXsmdxQNVom040/8Yj/PritiKPxk+LbHNxcP3vWnEBH4aONrt
 mEEccjWRn3JMMfC2csJclEHKVPurYmRsLCW43jaGhuEhH1awuHbXddPRcnmucP6d
 o8383lK+NTs5/RSKWMuSX0recRtg01/A2II/03Lr1TjjfmZVSLKfFUcRM92Rdvns
 PtCYMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0vukfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 10:50:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d40f335529so517177385a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 03:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751799045; x=1752403845;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TXj2kLxWlavFfODBCwO4C0ty0sy70kRk1f8+2FzBiKk=;
 b=oL19/BWbEtdbIFOKflBwX2fouj9IsPU2LduJv7uRNEaEsG+LF341IpEKBZJ892tVPx
 iqC9S/OSw11TLhwkeS6TkH21EWeEqrOjORdYRLBOKkFTHQD8SNphAFNa0Vwd85CxmBKb
 Ujwa5kSNp9qAAjD0/bT+5BBXLQ1dHIfnZbCPMMmNWPGVfmeI1y7akmaa5eMJwKUjZJwy
 BA9OXVdx+a8RtSdL6DvScVZxE0TmVmqCTmZ85qaNsp+fd0wK3YK6nigm7ZfbgdXOghEo
 dNQGcVgpRL1mCOn5R7A8yC9SSqrosifMMdurnaU7mN0b0+cd4bcbZNI3xeOyIh69Wju8
 aL/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV78awvggTrBTWELwzBzH4UEjTR7Ms62wbWQX8xJqSNjMOETXPfEzgDb4aNfvddHqBNd2holGri+f4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD32ufgtZXkN/fLIQvh/Re9rZhvbUnrk5hx9zmyjyuoMJktN2w
 TMda/Y8iXcbk3wiOmwtC41A62miXaZWUpPfzzo3Nt/7Omj7riZxdXn5beZvDqEyfvx9JoFS4W0L
 +thR/sSIZE1WpPF9IKAkQb7LJGMz0ZWqiqBAkNA7PhjdyXcyxHUBY3f7KoD7kpRM0tF9iRYM=
X-Gm-Gg: ASbGncup0Pv/zqoL7vZ2YmRKK0oPvSagICYZqJIxLs03I2vQX0ZLuqQtmImDGsIrDAg
 6IEbUCGsPHXLa8GwMfJjwRgLN8/nQ1bv73Ow7tYRk9GgyjNgttT9om7ZB0banIUKXMpAOj2KXaC
 WdKPNp49hyKlJHzPFEDddbR+t3CV+QFnTMm7SdNsZsUaI0Q9BfgX8M3UvZmTGcRupO8FdhK6XFp
 qnay4RqDM3HHSA5Zpd1Y8RFj0cBPw8UgdTFx0lLpEyZNS2esk6gzb/0yiRcoaSFvEjrVUNYOuiu
 NUO9jg2RKjtJyddLeQSr6ROhZmsU6sO/f0n9wUMUaDGo5TkmMPsKYDYowi9jOffsAaQ2RNKn16D
 YIggekfJUOLSMYMLmhFCwJl8LI82VKYyD6bE=
X-Received: by 2002:a05:620a:6289:b0:7c5:95e6:62c9 with SMTP id
 af79cd13be357-7d5dcd47e14mr1035826385a.29.1751799045089; 
 Sun, 06 Jul 2025 03:50:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENzyvjnnPNU0+auiROsO8L9tJv+5rcHPjjuz97ShcVFzt8dFEs20zG+8sIADzQBxRqDaUTUA==
X-Received: by 2002:a05:620a:6289:b0:7c5:95e6:62c9 with SMTP id
 af79cd13be357-7d5dcd47e14mr1035824685a.29.1751799044764; 
 Sun, 06 Jul 2025 03:50:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383bb555sm920621e87.20.2025.07.06.03.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 03:50:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 13:50:36 +0300
Subject: [PATCH 1/3] drm/msm/mdp4: stop supporting no-IOMMU configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-msm-no-iommu-v1-1-9e8274b30c33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N1V1r2a+Uu111oA5aVLPWmTma/v7zxodScONBUW8ukI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoalUBQahHAv2TwvvVK6FFPuXM20VbAQOAG8788
 ssuEBgbNNGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGpVAQAKCRCLPIo+Aiko
 1f0mB/9PUKhWISZlHBDACtU3YF/1alKgkRr5n3JHsdRqlQeuTcv7GtWeTdbBgfcxxcR1qnFRZwd
 +o40ttKKbXMaTPm3hfz9nSbot1W+caMuNXSLtZUzk2tDECCK0EGsPk5UrRHzVOV9RGR8fWK0Gqo
 GW9m7ZEIJOJqOPXtzaXSeF9DBgHtbWr4mvxSvipVlRBUgJzUCQ8rmNdkpcvdwB/LWtX+d9OSdGD
 XuiYccV7R44JUN6RSc6EhjfQM953FfA9QFRMvrTSqbYhpy+DrYQyOGQm+MvMJmU45x+ofhnueYa
 6rrDlr4nMhqujzT8V2Zrk7tqCMpl4zFHJMRZGA/hBUIxxDMa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: O_6a6FQvhY_1GVzVD4EXteSjgyE6FVw4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2NyBTYWx0ZWRfXzax4duZqq5Gd
 avginp6FAuIjQj6usi/evwUdXnT2sz12U061//reeWfDKokvK7rhkwNKDvauXIKM//9fZae9m6p
 KblixA4AuNjH4HYz3QU4+e+7OKU9fbXH7PZZONV/y6AdxDOVZaixSHdMxF6CxN267FOjuimjw+C
 v3hTfFqI7igQIrajcQYrn9hxddkKlTFBmy39K1ESrp67KpCAkTUxuYf4TOfbw9BtS6SCsI7H7Bb
 RKuoeFPMfV1yyzIssQxXlDto2fHK6aaXnJordrK2WhWQoooIPlddm+5l3QBnedGv+frDjfFO2AW
 1h3PTHN1RKxvdF4lALobVAe00nDbWZPo4HSdHG0M3nEYky+G6pXKjxjSRp71RkSWwhponHt0XkS
 oePdoEKc3YsuGD+ZIBLWpYwOM+YOE0k8m/nAwX3qomWRXIq5sgC8qcc2O+lkfC+9YxsqVxAS
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686a5506 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=0pe4r8NFi1m0JDAohsgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: O_6a6FQvhY_1GVzVD4EXteSjgyE6FVw4
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
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 0952c7f18abdca4a7e24e5af8a7132456bfec129..88296c41d1a5eb0e16cb6ec4d0475000b6318c4e 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -463,9 +463,9 @@ static int mdp4_kms_init(struct drm_device *dev)
 		ret = PTR_ERR(mmu);
 		goto fail;
 	} else if (!mmu) {
-		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
-				"contig buffers for scanout\n");
-		vm = NULL;
+		DRM_DEV_INFO(dev->dev, "no IOMMU configuration is no longer supported\n");
+		ret = -ENODEV;
+		goto fail;
 	} else {
 		vm  = msm_gem_vm_create(dev, mmu, "mdp4",
 					0x1000, 0x100000000 - 0x1000,

-- 
2.39.5

