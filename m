Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E060C68486
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B4810E440;
	Tue, 18 Nov 2025 08:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZbQn/brj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UDWGo9Vi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FF610E444
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI6FmJU385449
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H4vCyzBAng103Oq0fMyz/UmnE+wwp6D/i+dL9/t/Pjo=; b=ZbQn/brjBhwoMCd/
 IXPswd+gdSg8ZixoZa5dJWsmP1Ku/zoA5LoC7BMJCRfwM0dL2cACyBXx/hP0dJNR
 w3gez8M0G3VQDwe0y9GX1ECUUhLBj43GfqOMriaOfD29Dgm4c5J3BEn+N1MYNSEe
 UmeJ9/fe9tXuwUhAJH3Vn9wGezXaxEMd2K96b+GZFFVPKpbBKdSVGFGDRkK2qIws
 c5F5qEGOddVkXdolc5LYbL+VBl7jBDAyAqRHr7vmCs68RP3IpaOevwTt4kEqlAMd
 2jQ3eF/DOGkCp4Rad4w59Y2nec+cy8oeqtvjQE8V7wkr26V4/+NJgzSuPy15ADCD
 8DBFMw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8hsvy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-297f587dc2eso95577415ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 00:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763455885; x=1764060685;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H4vCyzBAng103Oq0fMyz/UmnE+wwp6D/i+dL9/t/Pjo=;
 b=UDWGo9VismXoCk8N81osVBdvXZuJs56Ho3KJ6WoxBtDquGNiX1ESWn5bR/Nk8nB/Z5
 bY5Q6MLGe/qrjryykyoBSSXcqecMrBYatAOx+cUgjURdlSIU2g71ns84rXqUlTGDFIE5
 6guOCtbSx8Ls2bCBr04PG1QPVlFjFNYyXtUBpev7x/+qv6BlgvVtu9zneBkAyTOI5hVm
 cqk5axL52mKBIEAyphjCo369d2teFmLLKsxYkmikI2kN09ALfsZ/eWcKk+XJehwJ70OU
 kfHQ3i1qFViZC3thvVenrWtlVp9vIuvyL3Rj7lwTjtRsrqEcregl7zZaSdNshZkQITSa
 A6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455885; x=1764060685;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=H4vCyzBAng103Oq0fMyz/UmnE+wwp6D/i+dL9/t/Pjo=;
 b=sHUzuCagijS2pzJritj9xsUfKr3wj+e3hiyiMFT+e9M8I4hrV0DzvQiQfGZ0dNtY/+
 vDnKX0Wa/cGU8kDRjC/pSxT6Ph5zwGl8cpi7eAF8VtzL9pRjFsH+Cudo2et6b6oVGYdf
 6s5Uo1e8aRTh+WgPuQ2geVafPgUkeILaFPSO2n+4+qYOgTsNIK22nYEL5ZeVkz9tDP+B
 MT/HXhqLPzScXCoYYPXn5r40QVXb/fELeI+1UEa5iSb3L7rHNDRpzxmWuUgK+nHnE2wv
 jmMYMTeFrVQSlhU9qfJIG6tLleNM8hqvOdwWeX81FMAj+rT3++ZWyRxkhyLfsw5nSRC1
 pd0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7vSq6JiDgbq/Q6lzPigFk+Xq3J3HGkBfBmUUnzqk4PupyWoNicYglu8stvSI7nL6t+zEfAEuwWzo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwL3ZAGVCmUQdAFjXavC8Ns3Yb0KT0R9WsKmm5sP0psmUAB13Ul
 ews8getJF/W9MNBgf97H5Gl8k4NX6+xjZRBI4Cbto13ShLT6v533XG86N7tR6Biks05CPY0s5Hd
 Yx98Mzuv1yEsHvmVRNJU5lUZJqeo+7PGeLuHd8T/S9HQU5uUs4mc4mFJYGZ2uRl4Nj2Q4c5k=
X-Gm-Gg: ASbGncv9HKe4Y/N0uKw4EawtA1+WYvmKPG4DBe35TJFMAa4lQWmDQVL+0S2ESZp9qCx
 7awSD8wXuEJ5BJKE8zM+XYlYAZRJTRoifzIakjdR/aPXY9zLEFnPaDICR0gtad89WNZHVRM2pHG
 KKOhED5DBZYNemQ0+mVN5vdNoYBEoPXRFrUpjhG/uRVE4FcjZXxyk7z0IdirtCvLSFiS7cG912c
 W28Y+uFUyF4yO8rE3sOLFtGhLm/JFKpTTO5/wdw1U2Si2OpJTLZSkaUf6/UbwdwlXDfpffYi3dp
 VRWFnHdLQxRoZemvty9z5KflBKd+BTtbjlVDHbN50noOwIvNinM7Z3GkWYL6bU28m73R/DdITgj
 pMIJwku6VLp26XW3iC3HY78g=
X-Received: by 2002:a17:902:f603:b0:295:5b68:9967 with SMTP id
 d9443c01a7336-2986a752d17mr194312965ad.49.1763455885233; 
 Tue, 18 Nov 2025 00:51:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbC51hO2dOCARJAyGl+8Koi6W7aP2bRmpLcyj3T7XMY2HEbsh68c6kf4TSJcXeGL2xke4r6g==
X-Received: by 2002:a17:902:f603:b0:295:5b68:9967 with SMTP id
 d9443c01a7336-2986a752d17mr194312525ad.49.1763455884759; 
 Tue, 18 Nov 2025 00:51:24 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:51:24 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:28 +0530
Subject: [PATCH v4 01/22] drm/msm/a6xx: Fix out of bound IO access in
 a6xx_get_gmu_registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-1-86eeb8e93fb6@oss.qualcomm.com>
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
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1041;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=75w/DSS2hsmQuGew0+oPiaGMUNyIZyrF4qSNr7xCjPw=;
 b=jLipoeUTateSBD+g7vKKvS2yUCM4T7jj8HbWbcE3idzdOQIu0EPirauUiY3Is2Tzh/Nibkr/K
 97kGQ3WCvoMAzjLIS/xjcAXB0eXKO6+mlb+Pc7iuP/yIi+AHnbe11mu
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: lfgjZ9tkfHmrocVI1ox3uU3rBbSuBdXP
X-Proofpoint-ORIG-GUID: lfgjZ9tkfHmrocVI1ox3uU3rBbSuBdXP
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c338d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=PiXygW76SPkGC_ia2qEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX2ykNr7BCHHRL
 J/tGIHjEptF14TixdGH/ckRfqWW5J2Lisz/qaN1cIIXn88SwDq5nFfn1PSM7Q7hDIyviE7xJf3Q
 0xuV7UUxjkvMw4aizWqjY4OZyWkgM/YOD3GiMMcad2nLo78mv1sFsoorf2VvM4uukcjfKhIMlHV
 w10IagT/wXXVeJlDpiQxWXXmJ/XbKmzArqxDkXb8Iq7NhBkLYDKONzfhBqXxdvURTN4svnD+Vfs
 QxW2X2kqCerjNCA4n76eIOfbWC/24zbzkQqMN9PgHgH675hND36gi5c5+ZLSIndzcR5sqhaeykb
 ItFs/AtK3p/NT9wekiM21IgxbAhbHtrxoVCUvBpW2IeKT/dcbRaNhFf+oqgvAj9An41ztirZcur
 7Ru4q3Lt0MIOKkr1pGh0ISSSu8nJEA==
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

REG_A6XX_GMU_AO_AHB_FENCE_CTRL register falls under GMU's register
range. So, use gmu_write() routines to write to this register.

Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
Cc: stable@vger.kernel.org
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 838150ff49ab..d2d6b2fd3cba 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1255,7 +1255,7 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 		return;
 
 	/* Set the fence to ALLOW mode so we can access the registers */
-	gpu_write(gpu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
 
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[2],
 		&a6xx_state->gmu_registers[3], false);

-- 
2.51.0

