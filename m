Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E70B14FC4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 16:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D286810E65B;
	Tue, 29 Jul 2025 14:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iiZYV5jr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7221F10E653
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9f3xf032140
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=mD0NBZ6SOPW
 kY6KB67p+Vrn86xtl4nZV3W1LSsEOfPE=; b=iiZYV5jriManv4CDr58TLuNr65y
 F3hzRYwPt2s67ATn13QZ/6gDeuUYU3uD4URo+ta7htvq+r3eETOy1VvFOiJmxgNy
 cRNHjFJ36qq1/ybOdfYDP7dhA0VOPouoN9z1JvBnHvvpJxjv4EnYs64poNCsCEdx
 VgrPyzVEKhxkLtQ8fgXW8mTpWiG9LDKRjpHwwleAN4Q5NjWkhF3KueR9P9qRUm5o
 qVvXNYGLurukCT/96AxEfqVQCsb0qFAGw8/lbX91E9MLAQgfO/O9ddLDjg2PCbTZ
 fdGT773F9GA4kc4spG72TylUKJpoWSjFNNaLhad06NCoC10dT3MAgAkOVOw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1aggbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3139c0001b5so5342595a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 07:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753801065; x=1754405865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mD0NBZ6SOPWkY6KB67p+Vrn86xtl4nZV3W1LSsEOfPE=;
 b=qrZsZY6BZ1HT5Xycn7Czci/r02sW9TWfQ1jQmDBh8rJtzHzQ+h6pzdcMdoyNOTxbnj
 oWoPK9rTdkm84U14y6wCePF6WKlI9DJTOx9fzsbvLkbEl6vwRZJ8EA1rm+1dhSU+F02E
 NXOpzNXzSyuTDeDiSBrPIgkrh7HXYzv7emW0lUGXf4Sw4UpMKOyvQTwMgyGXJRmOQwUy
 EZf5PDBk+iERR0a0fE/DBdjqlrk3tPNjmUboQ5T4eCdH+I9ugaRpUv58I+EBB8ChF1AE
 BjM/hM1qm7vVAnoLMOTDgUcgrCmhDeiPHrHmtP8wMUuQsxVYW0jfyrEdZugHe6FFUHxK
 eaFA==
X-Gm-Message-State: AOJu0Yw3T9pomju7JLazLIu2+JIAtS7TrjuUJ/VioAeopqap02ZpxRGS
 uBTZ6T59OSDLwrmfsTOIPZuc6u2oTK0afXZF2EPn1iaLZXFCM/KxMHDJYxom3W2/mfpizZy7rMI
 46POLL7tsprrXyk2uoVL5HADniIPQqykUEHRvC4JZAX2RPcXvEc7XwSgeQ/Cg/3dXPpV+lxrWd4
 ecrxQ=
X-Gm-Gg: ASbGnctK/XSAHxPfu0Aj71p4VurZqzuJ8AGDV6lezYM0rI56HfuGWSDoISuPU7TUBXN
 FDJ9hl6C1A6iby6k/Ts314uyvfYHFL1RgzrePq43+0LkHfdiDyGL9Jy8a59WK3EoM6h1mscdK2b
 STOJt85l0O/xOxgjgPhNT/7t7En0mWhn44GkOn5lI/0+7a0qf87uedqOnp22Zh7DgYIy5UyQU0q
 mqF6plfzKWVbQEmrbyAGUrEaP5+3kM/mat3TQ6qECDloSDsd6Odk9GvhFc8IpnvcMO6QriwrtGW
 h7Rhlh5veTlI5C8gcDBrdI8NBT7SnvfwqxdPktwynpMlwx8BOi8=
X-Received: by 2002:a17:90b:4d8f:b0:315:fefe:bebf with SMTP id
 98e67ed59e1d1-31e7785f8bbmr20455316a91.13.1753801064892; 
 Tue, 29 Jul 2025 07:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEiMpmUR+bY4vgJDJrIuyQ52pRlkgEThbWo2keOzuYnD0mITzM0Bk5ZrIUFuV4Dy4dKAex9g==
X-Received: by 2002:a17:90b:4d8f:b0:315:fefe:bebf with SMTP id
 98e67ed59e1d1-31e7785f8bbmr20455279a91.13.1753801064338; 
 Tue, 29 Jul 2025 07:57:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e66eabf0esm12322972a91.11.2025.07.29.07.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 07:57:44 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 5/7] drm/msm: Fix a7xx debugbus read
Date: Tue, 29 Jul 2025 07:57:22 -0700
Message-ID: <20250729145729.10905-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
References: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mj5XJY1AizHnAp-cETHQwHu-VQrmhTbb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExNCBTYWx0ZWRfX0yHHEG9raLo9
 +z8V1d2dbi+GPhV2vim24z8y1yx2v4g9Kc1e3p5nF+9TG/25f9dNre3GGfZIEDb0bFCKzIySCfB
 pgAyQzgDX2+otPnGArUExejNt2XvvghizEbys1WIDDTIs9KFsvl1A3H0iLQzG8mObwQd/UglT5f
 eH9eIqqL2PxC+HnNzCT7CM88X34xuGD0P4QZPBwz2AL2LCL4wEQ9em4suw+BWAWCDbAYMpscjdr
 EB3JKW9A5b0vndCaBkOFzDUJExVS7FOa1xgv8Ug0YOwUpEBtnJ0m3aG0GIyDR9bogcASRYl7KWW
 +zC3L8sPEgZX6csu6VJ6FwdMg3F9aTHilVpK57l6juCxN/BV2Rjwg7NzaBJb85FDyxjvMufUn5/
 66PVVQSKzsj5cphw1CjZN9RFnZDS3WSHDK+F0kZ9aZC0/HoEVNcqqqBxZl89gnqx2ehz0xL+
X-Proofpoint-GUID: mj5XJY1AizHnAp-cETHQwHu-VQrmhTbb
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6888e16a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=IkVRe3mbPPK2UihE07gA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290114
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

v2: Don't open-code the bitfield building

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   | 11 +++++++++--
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  6 +++++-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 173c14f215a7..8317e1107389 100644
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
+		reg = A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	} else {
+		reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	}
 
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index d860fd94feae..7a32f6715752 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -594,10 +594,14 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0600" name="DBGC_CFG_DBGBUS_SEL_A"/>
 	<reg32 offset="0x0601" name="DBGC_CFG_DBGBUS_SEL_B"/>
 	<reg32 offset="0x0602" name="DBGC_CFG_DBGBUS_SEL_C"/>
-	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D">
+	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D" variants="A6XX">
 		<bitfield high="7" low="0" name="PING_INDEX"/>
 		<bitfield high="15" low="8" name="PING_BLK_SEL"/>
 	</reg32>
+	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D" variants="A7XX-">
+		<bitfield high="7" low="0" name="PING_INDEX"/>
+		<bitfield high="24" low="16" name="PING_BLK_SEL"/>
+	</reg32>
 	<reg32 offset="0x0604" name="DBGC_CFG_DBGBUS_CNTLT">
 		<bitfield high="5" low="0" name="TRACEEN"/>
 		<bitfield high="14" low="12" name="GRANU"/>
-- 
2.50.1

