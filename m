Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95379B09047
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 17:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396D510E242;
	Thu, 17 Jul 2025 15:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8AscNDs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7357E10E83F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 15:12:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCYMcq025197
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 15:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=9pJTFEenY3rWVgqlsRhih+or7W0MW5NJ012
 2DRYZs8s=; b=G8AscNDsDktygSubSOSuuClEkViZ1voMSYdMFDhtdunPUR0EhvL
 v6b7c56Wiz2NOApId5/ok6ytPHNU392+vJ2g1mK9liSAvtsGTWHRrE9KL7DzDb2t
 /y08LE+AWiaJ/4HgY6+EjIRlfoBOSoO32iT403u9egb807ythASsuylRFeX3XNRv
 AmYy8llaKMTWLMnFEMsmwyxRyykTbtdARDkcmryxwZfYnevrkYkhzSZOiUWDsAb5
 G9gCoi0VuZ+DFb5VSMi/I5cwvZlmN4POT9bdcIkuoubQhCyx+VV4J1EEhERhUojz
 G+Okan//1h0laG764Evx4GavBX4xhqIwFEw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqcbfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 15:12:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74ae13e99d6so1336647b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 08:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752765127; x=1753369927;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9pJTFEenY3rWVgqlsRhih+or7W0MW5NJ0122DRYZs8s=;
 b=qNvyLX2VOm6v1W4uOLtoDm8HN49R/E7cgGRjThFphGass5tmeTBCXOhfTerrEe8jTD
 OZR02FsuhwXZPOi8qhbguyHo2G8KUmMofgZP7J9N54H2seYcWt+h8otHigsCxduK0FJh
 nNs96id3lAk1Gu8cEjPOTaGdAkeNUSFvkr5WHNuiahF61QVWQEZxLxjjCKHgJinH3m3B
 9EoVVVc/CwZZvsIXF0agjvepOEydiRsftf3Z92DalhYqXdPW3EkuAifjKEEz65hiwbtR
 PGi0Af8XMrihvMgz/ddhlV3miuaeMrBwd9NXc/MM8Hng/e31M99PR3skeeWIRDzmY0Ci
 5mtg==
X-Gm-Message-State: AOJu0Yz1SIeiiOycOWkfrfEboeDr803ruWwn1ZoUPJobEsMx4hC2LAvW
 PU/G7aa1BRkxMBhJ9AltzTX99O6e+FFPxvJWPiTG2WiTlEe34Ifds54ScVsKZVc7R6XzdhGn8kl
 dBROo6gc7k0wRGMLbIpU3X83XFHikdswXy8nIebEYSml1daWWskH1Z5dTXha1VMsK731Q9pUHm4
 fChDA=
X-Gm-Gg: ASbGncu14jDtYlM6bxs46GYgF5bTb/1yfw71CuXMZ0CutHy7gU0Rdm2irVQfnNJDSQv
 uSMoPqCwQ075cPDGuTjMHupX1o/MdLFm8aJfiWrhHsW6uNfOwMEEpVYRb0+1AyQ4OJ7RqiTaWD8
 bMfXIkQbIY/HwDEFw+MdfIOinq//06Au1v1vi7C9OjER+tzxUQlxyV5v0kSoQBFBjfIp9UvPlPO
 NeZrLvXUEKqk0z/m1vNjAJOncQbn1XnaqV2jSKWlKQ+OgPKrwxq2ngRmVVyEUZp0HDzZAxD23+o
 Xpp2BHTOAY7723IoLtqDOEAsqkaeQcoD68RNfFqay1tx/WXqFsE=
X-Received: by 2002:a05:6a21:329d:b0:234:21aa:b538 with SMTP id
 adf61e73a8af0-2390c744e99mr5905538637.1.1752765126996; 
 Thu, 17 Jul 2025 08:12:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTO8+Xo0qyZNjecPdyEQ1E7S+g3tlFLsy6r4ztKGL0EU33rzpzcW1a1wjSpktmiADaNdA2KQ==
X-Received: by 2002:a05:6a21:329d:b0:234:21aa:b538 with SMTP id
 adf61e73a8af0-2390c744e99mr5905493637.1.1752765126508; 
 Thu, 17 Jul 2025 08:12:06 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9dd5d3esm16293073b3a.4.2025.07.17.08.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 08:12:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Drop unneeded NULL check
Date: Thu, 17 Jul 2025 08:12:01 -0700
Message-ID: <20250717151202.7987-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=687912c8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eWlSUfSnBrBg5eVjM6UA:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fVvPxg5ue9eTTdZORn2YkyK_gT7XCyGM
X-Proofpoint-GUID: fVvPxg5ue9eTTdZORn2YkyK_gT7XCyGM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEzMyBTYWx0ZWRfXz75ffvJTSg2S
 cWdRKXLuXve5Uygd1uLytQQmZ3992jfShG9oh5DJq+5Be1AA5STEFEQrkx05NA/uWQdcjIw94XT
 vuk41gxSyKG2MXjSoq0d1FanliTSmcnkzqzel6b294T0VHbKE+Xb30VYWTeUXpDZgQam+9hVVb5
 aPyfshDMgqcSRARHevZrQfiuCSnyFGXAnQnraBvSnXNmMATHjMfR72e1nkyn5nb2Xl78e1mvC4+
 FzS+0fP9x6Cw+/Niq1aeEALeupVouf9F1gjECvsfbbDT/byWH7V9yqTn3lcOOGtnUuYKXZXJBut
 dRfBOFZ0EUU/3zgxbmytEDy85W0gE3yteq+1+QskCGNuDwZ1CZKL9oM+7fz78fTrdi+kBTIGWz4
 HUHm7lniJOpHMzCMC5/ATa4ljVCB4WeqRjEAXD2gx9rqy8KjFcE3n4hWlcppRo/C6TNAi6Hp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170133
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

This is always set in msm_gpu_init(), and can never be NULL.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 55c29f49b788..cefa50192391 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -768,7 +768,7 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
 		return mmu;
 
 	iommu = to_msm_iommu(mmu);
-	if (adreno_smmu && adreno_smmu->cookie) {
+	if (adreno_smmu->cookie) {
 		const struct io_pgtable_cfg *cfg =
 			adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
 		size_t tblsz = get_tblsz(cfg);
-- 
2.50.1

