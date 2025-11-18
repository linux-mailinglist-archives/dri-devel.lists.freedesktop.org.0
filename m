Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088A7C68498
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D71F10E447;
	Tue, 18 Nov 2025 08:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kG6MWYFm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zl0kG9w9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1F710E447
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI6V9YN384218
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Rlajs93xW44KTRN0rgVj9S8DZUtP1T558SNf4fvM8c4=; b=kG6MWYFm56FyS/dY
 diVBK7hBFx8rRM4vKOd/gDWtBy5atPPXqh736uHfkgPth0FtmszfkkNkx1Al1Ctz
 hn/znHNRxvEpkE7EVk9/tEtpMINtxH4qN/WQHA+oWq5VzVWYilZ8j88RssNxzy7W
 LQeouQChS/YLGHmgDxJd6lUPl98Pc1+GvDWy9jUyAFVcbh2YZDgtB+vP/0bFAeOs
 4uqf/7o3HkLwGcGtfa1yeEYTW02L3HXzEBLplDER9cjVE2ZVj0QmRNmwumGkjL2U
 zbSKkQ7CzNI5S/wLh+rf/i4WumDKsKNUTCNyTCSmOBpMG/DUOhtgALIi0LfklkFO
 PrerhA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8hsxj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-297f48e81b8so85683315ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 00:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763455901; x=1764060701;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Rlajs93xW44KTRN0rgVj9S8DZUtP1T558SNf4fvM8c4=;
 b=Zl0kG9w9s9PRas5YUMDElm7zf6Rghz3z2bFGeMV3Kb5pfkPRczwfy8SW25zZeziXH/
 9rpdYkErXqE4NagHF5Aipjwio3xSj0Al15TMh6WERIW1aV7X+cy/c7NmRq9biJmJYbIQ
 kpLOiJ7nawZPrMVFrB2hFV7hEADXgFk5mjRP/pSJw20WHnC/H1Nx4dCNEIxD4vE9Ahn+
 OBaCh3aHA+RzdK/VS/k1noRvct9bNoqxFizFJygwBCnvk0Hcbeph9KR6zT7v2RKjfvRg
 gWJZZVOz/K3B4BElzNI1WQ+fw6fW7E4FZrpKm9E1MHcKOuJUlYFpniyyNFb+XMUkSd4w
 ufuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455901; x=1764060701;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Rlajs93xW44KTRN0rgVj9S8DZUtP1T558SNf4fvM8c4=;
 b=QIIR4k0vDhxx1JzgAyJg43tq3NxQORq5qAEXDgz0NQQq5ChMtV5mjoB48CRwRy0C9m
 t9fIcQ1c/ML7Oi2D2iO3qAQdDwcZrpyckWxDJOfwgRUkBy5/FMSLCszvKm6kNvelAxOd
 fQHD7pMQJZmBhu7ZqgXg1VCa6cBB5bLoviS+FX32VCfqzbi/5ZFTF38rMnTl/HNxGXN+
 DN3bJPDEZ2aQGdp7s6OtvwhHenK3DIMHlVmT0r83Hbx9x5vzjhTqDHioHiZ/7tF2eDOn
 RrnaQjS3QYbo8DdC1AyhyZv8yBodAW3tjezbAd14S74+63gNEQ+U3F+CWHDwuhW+AGN1
 2iyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/BgE0jNF3JlQ2lo/HyJyeMc0dFxmb8ZkZWypdauzdh2sN/5kDAfaVJwbX4t41+g+6UL/iS69W+n4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybxr6Zh4C9wH4AE/dHeHWbtt0H54rdvxHb9uSNB0iIH7SsUFWB
 yiJs0bhP8I42F3q7D6379RhDflhyQiD0eIdoF78Mbjlyh3qV+UK5GJH4XscHIVK76zdhvQnuLqs
 oWUQTHgRoa9nP4EhDdJmdr5UohndtqUn+BMHwJOG2GY/4Yw3PsBJXYgd2JU+n7e9ibNNAPtk=
X-Gm-Gg: ASbGnctuSMRbiyx4jMUf048IwOQQKH3WY/c046+xUoUS54+N+tcmnSYTPfqGCBzTegl
 FK5cFYVlqJrztTySL6lQfxx4VKqsm4sqdbqB+2WyElU9MkQTq5hrm7i8aNv27hC4sKg4C3N3Ld5
 5pvI7A3ks/QNJ9FW9vR7W+jkN0PiztvZADWCsV5oNJNlEPBYLTN3eyIqNvE+P/Tcpd8a94BistW
 2OeUW4Xs5g11V+baQWVtqY4fvTkob6pBdTeo5IEy3qhpOOayiIL9UTa+HzFSvQ8iZWMkBHyTQiI
 ifzWJQMfHr3oGHr+DP7x8okQ/Uz9yhLnECHAHwjWXjp6jcXL4/vTP4O+iivUKwKrh0AnXJKRYGw
 KcnDQkTzhtgNErUfy8jTasxI=
X-Received: by 2002:a17:903:2c0d:b0:282:2c52:508e with SMTP id
 d9443c01a7336-299f55124b9mr25184905ad.8.1763455900687; 
 Tue, 18 Nov 2025 00:51:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCsVUT/gyxi19V6NNcgQ1Bhhk7hd0QU8Q3IwF4m63Apgo8HYRSB6+A4jdvCpbIXf22MBDTag==
X-Received: by 2002:a17:903:2c0d:b0:282:2c52:508e with SMTP id
 d9443c01a7336-299f55124b9mr25184705ad.8.1763455900192; 
 Tue, 18 Nov 2025 00:51:40 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:51:39 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:30 +0530
Subject: [PATCH v4 03/22] drm/msm/a6xx: Fix the gemnoc workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-3-86eeb8e93fb6@oss.qualcomm.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1590;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9A5anEH53GnLLVd9MMQtmEBnjJez85XhahSgwIYwj+o=;
 b=GKVy5XYk8J2atz7vVd9cbq8c445N4UJwCVBFzNslb6yr289XyqRF14cJW4/UDx5T1sgwFfTBe
 gLOlQU5BxT6CV9lRW2Re59yEwx79W/9ih/7ktY1yUUPaQPppV5gcEHU
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 8QhTGcR0WYFPrzxCW78jpt7_x8vWkI8d
X-Proofpoint-ORIG-GUID: 8QhTGcR0WYFPrzxCW78jpt7_x8vWkI8d
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c339d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=twmNDnkDfZCprR7-lykA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX+qs1m2OpqOLt
 FBOrITVtC/DotIetywS/klxe6GjZYI+JgIsnj8m5eU4SGf3NjfjLTmgr4eogTX/I+kRedeTZD51
 aBaBh5QEksKkE9IZpiFa1/di2rF+JlYHDkn+G69xoGXSTrgcZarj69CA/jA7q+LpA8mQPHGnRpM
 C2jXvqFbcUrBSOMOQn3nQ+VB6i5AshYXrqxb49zB/7PwOChxeVo+rbtFdfcMNA8EDbF9LTCf7mR
 dnJWuZf1YBBef0S3f7pn8yA3aE8zvdTDZukTAx+lPgsj8RXhP/Babul8/iyYIdLijWUCTKG6V0V
 +C/bLgW1MsQamfOKQNYLgl1WYPZabhCqgACsxZy9rwLTrZCg1McsqcFJVYyCIM3BURwgtZ7K45D
 z2Br0cHP14s1yVBnFjFeQtFey135fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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

Correct the register offset and enable this workaround for all A7x
and newer GPUs to match the recommendation. Also, downstream does this
w/a after moving the fence to allow mode. So do the same.

Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 72cd4fe0905c..52653ad376fc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -511,8 +511,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
 	 * in the power down sequence not being fully executed. That in turn can
 	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
 	 */
-	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
-		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
+	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
+				adreno_is_7c3(adreno_gpu)))
+		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
 }
 
 /* Let the GMU know that we are about to go into slumber */
@@ -548,10 +549,9 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 	}
 
 out:
-	a6xx_gemnoc_workaround(gmu);
-
 	/* Put fence into allow mode */
 	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+	a6xx_gemnoc_workaround(gmu);
 	return ret;
 }
 

-- 
2.51.0

