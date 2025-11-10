Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B421EC4806A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3D410E46E;
	Mon, 10 Nov 2025 16:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NfloY2Uc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yal4idhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8D810E483
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:39:40 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAFQ9MC4071541
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qhWAU4GwkZc/7vJbgqlZua/hMbE+FKAm5HguK+Q4/xI=; b=NfloY2UcabBEHbGh
 fl9Eps4ZBX7fNEkkBh8BEYS+32vOxrIK2m6yXUnyWDwM+rERBerTUbwIy0uBH/SL
 u/3DOWkDZeUjVkRKjme4f50ly78gXxUsNDnxiJV+ILo/qTdHLAmqpVtQ0P87xvIc
 ZFH9bvL+B39iKMvKb4P0QavNQ2z/VPkJSrxjl/EZq92g2HwjDzSWFkmwDpxDZSzo
 ZZLF+B6RrkPZLbAZgLbUssgeTb+j8BWwv3up7KXy/9GrwZPlU8z0twkUmiExaCpV
 8RjBZJYAZtzr3kDYlgmwAZDngc/mHntvaZ4GGSo5eIOo2vKfCzjvu/0JD2CBbaAw
 Cunn5Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjpgr91d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:39:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3418ada9e6cso3947598a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792778; x=1763397578;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qhWAU4GwkZc/7vJbgqlZua/hMbE+FKAm5HguK+Q4/xI=;
 b=Yal4idhKRnNkIuMbeLG8GjlQC7GX/0W51VT3jKu7GNXQgDXfHJmwAATfEO7QjQDvLZ
 j7hVxaO9eNPEJH7Xe+yJjM8MmwzP9Bn4eEkJdFLtSGDxFHthzQY3M4lkrEXlEQ+PjXkn
 S+wvhyvuDvxoQm3IvjEqyDLkdTpoylDEbmwz0C3GXOgpC4RGz6ncSFqUlFLKBVwtVLV2
 yZ/oqPLWqEnwnQNDVvMCgkYcRZxjQ+eVHZBvtyOLem47WyI/BJcqygCK0E1+SFjlJsCa
 0JSyqhyRINbNYh8AUOvYQR5N37f3CVcQSxRvS+KXeyQeEWiQMkiK3XPNXiyUAsklx5Vk
 PRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792778; x=1763397578;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qhWAU4GwkZc/7vJbgqlZua/hMbE+FKAm5HguK+Q4/xI=;
 b=tsKrfiVEie4ZbDaUORE+pDzQYEBC6d6vQ7G09Bqtvkdrh7NGVJvKLYAI8bryQ31h3H
 AsaAzTNuVCnESNFpx2c4f61SRccqL+kouCgOq2CBPEpjP5LHMP1GXkcfNpkJu32yDyBt
 AjCcCmpEfV2xTBBgotqZLmNlfXlUtfPaaSFrJmKrB0Ek5IBn3Lnlpz01XuFTikYlBvJB
 5RDsiPnyL5tL3QIIwevgWj9q6JFxbNh+pZncIQb2GaN6Pn/0VJlCvb5OP8DAqeqdje5b
 3P3ndKpPiyL+YYmPHbxObDfpV+iDZ0lqkuSSsQAOcQkveS4Ju+okP97/p9gLeAZmdAMy
 OtvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmn0vlVPW+gksiSqjFgRB6HdbjSO0RC9h67O7NIzf/XYJjwg54x7tl8sbboR78MUhvaF5uVK/qNaQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8zzP4hrsPOsv8PpRbTPDwJi+euwCY0maqv/pAadQ4YNQBtPfL
 Zz4it2OMKn4PD3KVGQI6eYtylb9XJfGWCS9q6yzrWQtcvurIx8wHC09zkfC62y1Zs81cFazKlxs
 AUb9Q2f3nr4KcZEywFYuybQMgSh1s8EzsKO/GxrDWrvGrpI9V/96WV2HAeSmVv2+0ID19JLs=
X-Gm-Gg: ASbGncsPP/iksyak0XRTUgIv76FBq4p2pWkRVsdF26ePkrLpyuV0MIfxmXN5ywIEic+
 tHCZnt6e1iWHNEQKOWpCOM94ZgjmLRAv9ji29zXQ84XeGSnhvF1Uz7MHsz3/2cDXceRWHilQHK7
 1nS6bmuzm4ke9WutYHUrYIJCNBdLisxlAlmS2F2tXcZduRUNCP3BOyr+JOLQ4+AdZRvI+lWM/P1
 Pe1BruDschuuVY3ZIsFA2olgUwIRhmyLjdKj3Mxi2CvewWy47hFR9tZs3N+JgZBleNFwWTww3P3
 AhhUIwOF7rgUNj+yZzgR7vljJ7IMMo/y3RyRmmiXSQ8ggnYe+QSwbH+nD78PIDEwCAXDFLMSIB7
 lQFTD9poqmtnVu+vJQhp90gg=
X-Received: by 2002:a17:90b:3b52:b0:340:25f0:a9b with SMTP id
 98e67ed59e1d1-3436cbc74d5mr10535202a91.33.1762792778285; 
 Mon, 10 Nov 2025 08:39:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKuivtP5bPOxg4eqYPpqCiRonwpKyitk9efo7oMRmT6OqAejXcK+KdVc51LUlDkH4mfwy14w==
X-Received: by 2002:a17:90b:3b52:b0:340:25f0:a9b with SMTP id
 98e67ed59e1d1-3436cbc74d5mr10535152a91.33.1762792777713; 
 Mon, 10 Nov 2025 08:39:37 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:39:37 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:17 +0530
Subject: [PATCH v2 11/21] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-11-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=2950;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=LWOc612J9bhiyGK31kvlUfk/uc8PZDAIZt+/ViUR8y4=;
 b=Dyz4d2Rpgtz4n2FITe1odQAEtosB0h0Bg9zoRd3AwbZUYYMJMDaf74l7QdElyyEqfnmryp4KJ
 0My+qrkFhbTAtvi+hF5ODj3d82ls447n7pfXlXg7IJLPvV878p2Eal8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX2h59v1conRby
 ZXJpn6fY/cVgkIdQyfzKn9C24yfXvtPPEA6DWnVjuqwUvUvmsJCITnmY5TzWOdoeOoUC7lQ/okm
 KKLgm+18EFIf3PpIWAbMNUSbFeoACWJbt4t/q3Q9lJyw57gfVhInv0+4CmqNsEUcgXc0kltDqiQ
 DcC2n+BzVE6x8PsWlVDqRId/guK+sdVyZy8HqO3JTHIzy3nL6Dp7zJGU7Srnj2gOMoV8L9INJUa
 hi4yTBfL606Brm5EBs+4M0sIxRUDqoxBsqfFoWdRtmyO51Fz+QUb/abTgGADEvhUQDF4TNHI16e
 P+IJSaN/NcZfcaMyhuxGtMyxZQwAbTAIh1ikZg3LvZPecR2xLwgo3T6qh2CRXpM5sQ3dGf41aCl
 2jKq0JBsUY/Zbfg4T9FyE/VJ4wM2xw==
X-Authority-Analysis: v=2.4 cv=br5BxUai c=1 sm=1 tr=0 ts=6912154b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=feIks7WodE12ze-Om1wA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: DNMUEyVTd9agYkXyV1EkwKQkeOs22bML
X-Proofpoint-ORIG-GUID: DNMUEyVTd9agYkXyV1EkwKQkeOs22bML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
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

Current logic assumes that the voltage corners in both MxG and MxA are
always same. This is not true for recent targets. So, rework the rpmh init
sequence to probe and calculate the votes with the respective rails, ie,
GX rails should use MxG as secondary rail and Cx rail should use MxA as
the secondary rail.

Fixes: d6225e0cd096 ("drm/msm/adreno: Add support for X185 GPU")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 112ef7ea320f..8597d7adf2f7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1519,13 +1519,14 @@ static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
 }
 
 static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
-		unsigned long *freqs, int freqs_count, const char *id)
+		unsigned long *freqs, int freqs_count,
+		const char *pri_id, const char *sec_id)
 {
 	int i, j;
 	const u16 *pri, *sec;
 	size_t pri_count, sec_count;
 
-	pri = cmd_db_read_aux_data(id, &pri_count);
+	pri = cmd_db_read_aux_data(pri_id, &pri_count);
 	if (IS_ERR(pri))
 		return PTR_ERR(pri);
 	/*
@@ -1536,13 +1537,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	if (!pri_count)
 		return -EINVAL;
 
-	/*
-	 * Some targets have a separate gfx mxc rail. So try to read that first and then fall back
-	 * to regular mx rail if it is missing
-	 */
-	sec = cmd_db_read_aux_data("gmxc.lvl", &sec_count);
-	if (IS_ERR(sec) && sec != ERR_PTR(-EPROBE_DEFER))
-		sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
+	sec = cmd_db_read_aux_data(sec_id, &sec_count);
 	if (IS_ERR(sec))
 		return PTR_ERR(sec);
 
@@ -1610,15 +1605,24 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	const char *sec_id;
+	const u16 *gmxc;
 	int ret;
 
+	gmxc = cmd_db_read_aux_data("gmxc.lvl", NULL);
+	if (gmxc == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+
+	/* If GMxC is present, prefer that as secondary rail for GX votes */
+	sec_id = IS_ERR_OR_NULL(gmxc) ? "mx.lvl" : "gmxc.lvl";
+
 	/* Build the GX votes */
 	ret = a6xx_gmu_rpmh_arc_votes_init(&gpu->pdev->dev, gmu->gx_arc_votes,
-		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl");
+		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl", sec_id);
 
 	/* Build the CX votes */
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
-		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
+		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)

-- 
2.51.0

