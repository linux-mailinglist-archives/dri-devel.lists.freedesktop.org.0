Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14808C5A8F1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFFC10E964;
	Thu, 13 Nov 2025 23:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="meHSHRFk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcwWGNt6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741BC10E968
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:08 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMbAJ01595897
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jGGfQ+tgLcU0SwBwQco9Wli6+1VrBRCLwj6tuxnqYmQ=; b=meHSHRFkwINJu9p2
 ci1j8tDXOJnxz328kucGEK7PVSr+WtvS3Ls1Y2H3KmMsWr7+W3zpw1QIz2N0OTdr
 +z7yxCX/wL+2k62V9hwW/bCAHDn+vKNWjKgxmYsAvWEhLEHGgxNl+vQcO6f2sciL
 Nh/DZWJtBIgU5BwhFEo9wil/v4Wiy6o4Dm6VqptQHBml6gGMtIItlShm7z8hlJQ3
 WWYdQfDEMKGRvqkMv2Fu0C3oEULwKVxT9qmeyueuYRWOwPDfU5ci+6uydHqoM+ej
 vCuBEpqBYyjJVW2wMPwv015i1ROtDlAzmgCDd46qgtEvHu3SE/x+JQ5cjc7fc6P1
 rpBc6A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9fr43p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7b82c2c2ca2so1542981b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076607; x=1763681407;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jGGfQ+tgLcU0SwBwQco9Wli6+1VrBRCLwj6tuxnqYmQ=;
 b=NcwWGNt6B3a4Xaw8rXcZO1yIGg5+29CT0JWJ77f4ZTlNdtTc2Tlel1tBLwGLpkiBRd
 8P15o1/WoDf/GS/wKmqM4PePnbHnBgOb66KVK8ZB5Je/2HL2RAdcGORH5KOHZuBDb6rO
 Dn+hIO2HKXmwDZxwIhA/lIDcQqtD5bKeOPaltv3ynX2lHuAPkLnDybyU+7WZ34O38EAK
 VnuGikZtXybEtxF0SJIF1i8l41ADQSl4zw2QmjNCXBS6repAlJWqVd8YkP/GRHYWmodo
 NwfDNSIPhzGpWU4vwBuE9gFmJYSfHX4g4qV4QXGGlJnfdr7CDNQmyNAgeTTQ1QaSyngQ
 a4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076607; x=1763681407;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jGGfQ+tgLcU0SwBwQco9Wli6+1VrBRCLwj6tuxnqYmQ=;
 b=Su46ikIn9JqEhYE9RFSxnFtrDCeno8fpZUFeuWHd4QKzBJ0XEEeNLD/3mM3rlR1aRx
 3KgWp12a7oFD6X1DpWojpDBP9+C+ZswG5tDgHFabM6AlUtv4mSyzHdUGLOcgZ71491aB
 5/BbTHyhQzl0D1Ei+kkbscdv8DZhZAfYrbCctmKhcEOciGRGgAxiTYJl0fN7ZeEqyxnT
 YDQ+0oFn9Zkirk2QHw37so0GnHSzsU8O4bbnFOTM3KAs4PL0KjE7s5INlt5BCz2iDlER
 czAYMthXqwrDnOQgCN6jvSiYnmLtURrGxD5qzOTE6Qdc0vW1gfUvgjGK20Hcq6RphRVW
 v21g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsgKUkQc+FhBUQI6Ron/aZEtXc+yraXDFyatJqoxfHtO+f5FNDKlJNdtv7elZTZrjqB5NWKtDjjA8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzjon6SFH7V1aZ7pP2I5r9DzAZMswm5cSZZDzqy42vgKGZ9L/wo
 07Npf4fAd0TTJ9xd6wJefeXyQ+vAmjMCUSJmj7lU+s2+9+g7XmA49xQVRa9zZRntkMqIT1SYOyv
 KvL1JWvKaJR/xNEWd/yOle+IgCBF5obGdHdlT8ShnERdwExLXnH0WcpbFdZcjAsLgYn1VujA=
X-Gm-Gg: ASbGncs/3c1eOX/8Vwm1XZVd9X4LIT2fcIHndocRca3cWGKlRSdj4RXHNKlMN2m2gFJ
 eexWyv3QxRH2LFmUAyFk1HVSQAUPsTfC6QRUlaN2dXd/4jPichtXshr2K5o8dwVesflXxRet8tG
 1+Ybv9acs6MMgtrvgc6s2yU5HqNiutsHP2YaNaaVL+TgP9PxJ/2zBEv24J0lIOthHcZjISTXC3h
 vWBlxazb6TMnz9ZjRxo1zrMqs6lsT1K5wbR5PDO6/vIAN8LMevJPaYWY210HlUZM0caQRF4YwyZ
 O+C9eU2NbTJ4Dl6icDePPaCpEd2mpbxCqPyGFbdR+9xwbyRE4Mr1/FkMUBGvWlg2CbSPTHT2lDu
 eARrVCH1iNBtSaEB4iQwM6j0=
X-Received: by 2002:a05:6a20:7d9f:b0:351:d6ff:dd0a with SMTP id
 adf61e73a8af0-35ba259dd93mr1575459637.49.1763076606616; 
 Thu, 13 Nov 2025 15:30:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqb9xTf/1RdUkSb0wiuQ/LducqEzVd/Avvst0tIrciZXoTqPCwdrblFiddRcVRxAW8PRxnIw==
X-Received: by 2002:a05:6a20:7d9f:b0:351:d6ff:dd0a with SMTP id
 adf61e73a8af0-35ba259dd93mr1575387637.49.1763076606061; 
 Thu, 13 Nov 2025 15:30:06 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:30:05 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:00 +0530
Subject: [PATCH v3 03/20] drm/msm/a6xx: Skip dumping SCRATCH registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-3-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076573; l=1280;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dtSwkU/2MTVLwCFlRqqTYMozfSVMz5AGTKvrJ9IlCNw=;
 b=pSCBNHippoLHyPBaZa3ZDzn8ibiYCS5gdO400/t3T9Sn9xouKFOuo4y+vrWWiMmy+E3FJYp4X
 6WqXbKsGI6MDNSnLjrTIELBXTdLWZs4mQyMQrKTDeLZ2O1KboBgdl9V
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=691669ff cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rH6QHmREy2P50qlKy74A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 76TvTQX3mbUeLirzX-YN0choV4MJYqua
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX3L+V449bfJdh
 5yNWIARrm1XhGjAnc8XEHJZF9Od1xeIA9DdAoSapvTaEvHPJxSXVf9JoBnDCxY0HMw41Sf4nd4R
 EQgdQWrDQiDeXZKFaraAIyIEub0Ls6Pga4dtgr6l8juxxJTN4jmBkGD2pAGCg7M3E0lgpsKXKno
 RBJ+swLg44KSYxu4ToRDBkaTgndcys7Xyk3ixHwFJt+PBjP8+4MU7j1nOsKLuSfzbnHmFDJiHrc
 Nug3YTOF+5S/cbCxBGrQhKpv1YGrOl5DvwuDdVDEjTbdm+8SVoMs4m9VUAbCGJfdtjHYHvHcqqH
 FxUza8DE9PmauC2RyMAvuJy3cvn1+z7Ih8k166dwmFS9ZTHKyLD0cZVmS+D/6kofj/XVMdcfXkM
 Qa3wmv4kIr0WYRcTYSoqcXjOqJSBLA==
X-Proofpoint-ORIG-GUID: 76TvTQX3mbUeLirzX-YN0choV4MJYqua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
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
index 6f7ed07670b1..0995aa1f7286 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1546,7 +1546,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	int i, active_submits;
+	int active_submits;
 
 	adreno_dump_info(gpu);
 
@@ -1554,10 +1554,6 @@ static void a6xx_recover(struct msm_gpu *gpu)
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

