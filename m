Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A619BC684A7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067B310E44A;
	Tue, 18 Nov 2025 08:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VD5WjbSl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H74Is7/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4579010E44A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI6fojN2343817
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9ZwXB4RhWASSlUxI/fZ15AWl1OAJD3U3jm7GNFqQCE8=; b=VD5WjbSlg10PR/Zz
 pPHjDzjg5RAlNjJdXNcCt6EyVw1dWV4LFvu2W8mh0ykFKrqWuXTocWOi9yKp1+85
 nDxGFvum+YIeTDyDfQvwMgiB1bUmFsHpAtzcZEB9PB8zC7dclNmKyW3n583iU5m6
 ptG+8Ij9EpKJcwubisfQ5WJ2OQIVSE0C8L36wzYO4RHQuoxfDPrPOVU/2hlHhq7q
 lvEDunjlQN5X9WIjfap/UgCyipt559vM0fGTzyXtUJGYFvvtLnN5eu7bzft+Q3kE
 CQ9/VR24JHsBtFu7xV2FrGn6TAMFeJP/tDYVg7nULVNcsmlzNIarK3/po60Y//zv
 HslQvQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrn0c16-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-297df52c960so136900385ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 00:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763455908; x=1764060708;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9ZwXB4RhWASSlUxI/fZ15AWl1OAJD3U3jm7GNFqQCE8=;
 b=H74Is7/3k1sWZPBFWgwLIb8G0/WchH+mmPUTgmsgNsYWafG5snWkYdHZKwUrBNOkY4
 K2VTu7uGfmJ7rHMGCj7MdT7lDSLWtO5VUB0Ezu0oTZnPD4Ql9vel65nYZdBTr3y/jTsO
 XJ/w3cYJ10kAJ+W4KV2vg2ZROJ+n8Hf4R2G3Swqg+/82AclLgPRJBnYvamrz49LhN4W1
 WaASqIKqhqYBAze/Ni5nlwP0Aw+wQWqmUl5wUB9QRbdvStfvTbAUxbatdVPVNkJNyDAi
 aCPn6GxIGDdyOWhUBLYN1mZdFUxUWeuLWnG20C3cnkwCmI3yJoCCZze5m3yMJvh6C3/f
 vjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455908; x=1764060708;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9ZwXB4RhWASSlUxI/fZ15AWl1OAJD3U3jm7GNFqQCE8=;
 b=nSZD4pUmxtYj1kH4DWIeXrKTnBSaxM4Bl9trfe8GRNtpa0yIt8tzAuEmIycOPppSRk
 zwQyB3spSSrPyMMYORe22BADExlYfxvX5mWEVBWbwEOcBhRMUHpQzWKwkJ70gXwbj1Y6
 PYarl6YKkKwJNFW6ysT/u01jwi/+4pmCvMlDOQ+jI38nSvuvvLpuZRKYjnvoBDVWp69o
 mVQGloC6JwSMwxB0EkoAJlWIlmM5fQ3UrL3ABokBFnD5YyJU46ustgXfB0tOefq4C5d4
 ROdVD0+XhaSIlrXyIf6Vannnr2qLQkbAUgrcP2K0DHVOshAUmiUgWBfIYGtbaCQo7xUa
 gmvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsEMvXid5GafAdw7xDqcfkplU+R0TNZULTaqhIxzYpRVOilEvJcuj7nsBFBTQW218pg53A0aiH9dM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbbBSPUXsF4M6LyGRPk+OQmWrXK8UxCsumkEWNUSfV35Igyy3v
 0niVKzCMjDiPKYrt/GNBNUDN3cp8ayT045GTIlaKT8ZFrvzojO1Bknb4wt9n/FzA73D6qxuPAkZ
 UA5FqyhA1Cpa1vnjuDWDmjp6ylBg21r48kbMqHm3eUP1PrEWINscYzl4Zt6V0rAvkJ/FNqps=
X-Gm-Gg: ASbGncsJHj/Y1eiviIZbhuMDawk02ltUuh2P+sSIdp9Z3VwBtsYvBBvCGN6yEhL9Yuo
 fu6MCDd4w+3FaUeG4BCeyElMLdMZZ7FYMIkfcAly6pbuZJUOxuIlXT8KZ2pXJX2hwuylP6xur7G
 KHzH2e88fADtY1B8uqxCYXiFAuOaUAabUSoXEmhGkt6Hc7spPXW7fnGzG/4ON23vnKRly1xdSUB
 dTTm1iJ577ISDG+V5kPPvqyuFZ7FLmGGfOJBTvoDPXWBsT5hID1LIGyNeXSh8KSEuE728utc+9y
 vJfJ6/XvnUunA8AXCXyPLoQ1dUG+cEo9G+0oI4l0LcARmVaUC55YS//NVjHaDdZYZA8SY5bCCIC
 cDqpc6uJbZmVg7wz/+oLko+8=
X-Received: by 2002:a17:902:d58f:b0:297:dad8:f265 with SMTP id
 d9443c01a7336-2986a6bd2a9mr208182265ad.3.1763455908392; 
 Tue, 18 Nov 2025 00:51:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtBwZUTiYtLygrybb58YIF/amuW50qQQNcGd/n0p3+CKZ3EeqPoD0tAmXoPQD31iO91XcZYg==
X-Received: by 2002:a17:902:d58f:b0:297:dad8:f265 with SMTP id
 d9443c01a7336-2986a6bd2a9mr208181955ad.3.1763455907923; 
 Tue, 18 Nov 2025 00:51:47 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:51:47 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:31 +0530
Subject: [PATCH v4 04/22] drm/msm/a6xx: Skip dumping SCRATCH registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-4-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1280;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=/bkGsdPodJ4SkKP3xxQOVAelGLT5UoB+go22DhK77KQ=;
 b=Cu8W/7U4vntfUypSIoT+e6ZMqwHXL7dXJoM/TB2ZZ5v2hzpBwXrk0KoTeeYPef/fxMeMm2NbR
 A2soFU6jNtJDglw1G9wBMZQVrVwgL6mvZP4CKOGIPlVdXK+L2shNBIy
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: sGjGQ8ZO0DsYijf-CZQoKQd0nLyjO12v
X-Proofpoint-ORIG-GUID: sGjGQ8ZO0DsYijf-CZQoKQd0nLyjO12v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX2v8YxdGWVCdC
 eKzaQf6BiAfMJEiJxxP+iZGX/0ixVuiteD+E91skEece7H2PQnYPijbabKyud2mS/oxOQhhqYxX
 z4ACewIWjSzkmwyalG6FjfyMVKTCG8gIft7xhXiZKFxihgRr/wjnJgUfdE4DfxsmcK6q5zcOY7j
 7haX6KZhAX2d4a3cfrcmGFmaFTno93xHJ9R6zgsEowc8A0VfFBpV8p+mk0c9XjHRluZRIRjxMyg
 7AaqhnRB+WLXyL3C5TCfsEmy/rzXPjRaXyP2a2BOYo2qKveFRNIN2Xx30Y3yAjfeyHjh6LCEkpd
 sajyG+xN9jp3ktxBHd0oyXwqYr8L1YxDAWH0uLt/rfYpPp6s2da48T2Xme+ZbeAtzJgNGXBqVYA
 dsQoTkPLTnxov/XNLVN5/V6NEdYbZw==
X-Authority-Analysis: v=2.4 cv=L+kQguT8 c=1 sm=1 tr=0 ts=691c33a5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rH6QHmREy2P50qlKy74A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069
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

Crashdec doesn't require SCRATCH registers anymore for a6xx and newer
architectures. So skip dumping them during recovery.

Suggested-by: Rob Clark <rob.clark@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e6393ef0fd78..c6b2fdb86c17 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1561,7 +1561,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	int i, active_submits;
+	int active_submits;
 
 	adreno_dump_info(gpu);
 
@@ -1569,10 +1569,6 @@ static void a6xx_recover(struct msm_gpu *gpu)
 		/* Sometimes crashstate capture is skipped, so SQE should be halted here again */
 		gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
 
-		for (i = 0; i < 8; i++)
-			DRM_DEV_INFO(&gpu->pdev->dev, "CP_SCRATCH_REG%d: %u\n", i,
-				gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(i)));
-
 		if (hang_debug)
 			a6xx_dump(gpu);
 

-- 
2.51.0

