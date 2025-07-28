Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448A6B14358
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 22:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966BD10E593;
	Mon, 28 Jul 2025 20:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zn/Jihe6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E974810E595
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlMAF018859
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=I8t+2xKA9TH
 HZTmJzGvWTh6YVgWzaeQG0zONpcACs58=; b=Zn/Jihe6d+bzp6z/IcaME1UWJC5
 GillVYY1LDFxQ1lU6yCMRy6zJ9eDOUpeeLk2BDSfXrjIDPQdU1oqHMxhDHUsX0nI
 fZCvXDNCn/8+y3k9RddhKe94kfDoKawqT6p4oGEaMFFBNWFsM6EimnAHT4AsWrMB
 dXERVW8mi4U+Fe3AXQ6Vtouqcps7GtB68ykAow32KhqSJkp//9DAi0pnIbWeMyXV
 LuVpFO5gOaYg2vAnHqZpHBPj5eh1ubi0qfopGR/VIPND7xH/AgUkfWI/FyW7tP5j
 g3LLkwIe9X4zDktg0zi+FtTf7taMjldos6ut6xJp+zya5amVH5tQ33zOzkw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q85wu30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3132c1942a1so7259302a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753734865; x=1754339665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I8t+2xKA9THHZTmJzGvWTh6YVgWzaeQG0zONpcACs58=;
 b=WzAjPl4xHgqqT5z/L1MMYx8Y8iF9f5+8Ty3I9slirhKDUfitFAV5VrGhzanHd4Z6x/
 a4/39oLPpx6mK66ECytoLUJZdCNjg1O+283CCVhkFVtRLh7cSzTHo/BekNnzYnT+hBMP
 EQAPm0ggXAgJ//sd6AyO3qY4MQNPunxoUubXfFgxswonw6SNeQw6zBGNys41ErZN3i2P
 Q9E4qGCVTKzX7NyST/zfc0VRjTbc2MVnF4Nn7c7K8ecbCIb7N9gu5NJZW9ptAbbvgdcc
 ODb7aHawdCxiM+xD7av2PY3fc4RUIrn57jtYwCaRjqvQB3DAIAJEnwgzp2tVRz3QV/fS
 NKDw==
X-Gm-Message-State: AOJu0Yxuc5RwXRQz3W8gpN0maHMlkhjDxF7cCfjKFQrWiEv6NLEmlygK
 UbKrW0ehCf6/nJkHRpa372tEl94/V9DTwZ2cD9CLcjHnpycGQtMuNK5kl/PBg3QE3H33nA0ipzM
 prgYknroqxz4UiqvF3WdPSlrnCA4XfFlwO55g1nWH/Xq3khhsb3PAullpFVD34Us4bJZl1nVzSB
 eq5BU=
X-Gm-Gg: ASbGncuMzc0tOYZ2pyJiBnmhMTVxoN+VUO/NdllKCNcSBlz4C/65fN1xs8iKHU5ZrQe
 joVx/6gCG0Mmsbt7Ez6li24/KR5Oh/6AK3IVEUlfJsxFkr7ZkUCHESGwt1r6lxpxSO7FlZpr5r7
 gsqG4/GneYI2uqPwcKe9EqhiGKMzIP6f5gmXjfpX8AUBeZCqzXIu3jsVzyW+tPTidl777hvOy32
 kOWrribj3bYCWZOt7AIl1wnp7O9v1ch/VVFxtgBX+s94JPG9LxIbIGQsrwms61jv/4EuwNV9Vh1
 g00un9q7VIwMaKqUoEPb901/zvegWkeOHnULXWWwX6J7h9cw3w0=
X-Received: by 2002:a17:90b:2409:b0:31e:d2a5:c08d with SMTP id
 98e67ed59e1d1-31ed2a5c5a1mr6681365a91.33.1753734865317; 
 Mon, 28 Jul 2025 13:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdlbZQJgZiV/klf4QMEE5MCR2s1YEQimkMRUs0qJyT+RaCeltmukYVdgn4Uepp3jzkO6MZlA==
X-Received: by 2002:a17:90b:2409:b0:31e:d2a5:c08d with SMTP id
 98e67ed59e1d1-31ed2a5c5a1mr6681351a91.33.1753734864911; 
 Mon, 28 Jul 2025 13:34:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f00e778f4sm2480959a91.23.2025.07.28.13.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:34:24 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/7] drm/msm: Fix a7xx debugbus read
Date: Mon, 28 Jul 2025 13:34:05 -0700
Message-ID: <20250728203412.22573-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE0OSBTYWx0ZWRfX9zY6PIRmMx6o
 WiQNrSlATR8NZVQ4htiDg1ezoL6kvED2GNG0wy/Aeo3JqFrz0+bQdM77RRKmLPElj8Man2oMWTy
 J6/SukePyg9JvMFvKQ1g0zaDzG1xfTc1iXf/lT8BuBO5t8RyNNkxhJRwhayJfzJNSy2/oN8Pcjn
 8gM6bKF7raVNauA+s/ExvGGmfqBtrWG8IzWfkt59qAGPg+KbJtlqbrBFHJ0B0Gl///xz1+O/rvn
 p7furLLxThWm/K2slGVbjGRsgV4Ij4JV2sAc5g7GJw8QdBR4uFfJ/AwHpad/unOaql8BHhiy+U5
 sj4Eq42PiXcYsAMED8zVQ+4ZgXSmgXitfkA9miW1txT957hUQ7Z4g/HrNCMF3/S3juAiLVMNwpN
 aBOvFGe6gOpv8y9KLmKP3lvMfUlUuBWnWK1qc4nw361zsNTHPiI/3PLLYIPyF3ho5Lreh7kr
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=6887ded2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=E4Rgrv4FocJ6r0LxV30A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: INqSgx9IR2bNJCiUaYGbIJwiQxHi5LYU
X-Proofpoint-GUID: INqSgx9IR2bNJCiUaYGbIJwiQxHi5LYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280149
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

The bitfield positions changed in a7xx.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 7ba7113f33cd..33df12898902 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -174,8 +174,15 @@ static int a6xx_crashdumper_run(struct msm_gpu *gpu,
 static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
 		u32 *data)
 {
-	u32 reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
-		A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	u32 reg;
+
+	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
+		reg = FIELD_PREP(GENMASK(7, 0), offset) |
+			FIELD_PREP(GENMASK(24, 16), block);
+	} else {
+		reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	}
 
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
-- 
2.50.1

