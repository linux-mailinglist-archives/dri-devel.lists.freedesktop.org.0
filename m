Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A42ABAF86
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 12:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C2310E2C2;
	Sun, 18 May 2025 10:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwIE9sUb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D8E10E2B8
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I9uokh021149
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PidCDaupyEMEwIHIG1xvK2j20VbRhsyPW2bIrlAsTDc=; b=GwIE9sUbD6PCS+UP
 WvZNYcKd+uxUaPQsBsvy9qSGyyUjx4jdlF2UFfO0y5hT3jaUmHSFJWLmanF8rJ85
 6fDw+wG1z3aObMkR6k93rF/t/swJcGcdZnPCm20gEuX76ho9ajGThVRWHOvNR7rY
 e2aPmRikdXGzdwIzHK+gTnSGcey14VcmrWc3hNWZink/98c+fcEGf0qrp7b15zog
 Rygz4NxZSajiD+bgZfJ7XwlnYDhfHqUra63TanTUU1u9pc/HEla/uPLyyNGheJ/f
 nf1JrbfRUfPmaLdOOzMlEKJbtkEjH6qBxZUXO2hULhy/GkHGE+Y20d8OgeEsSzkT
 GA4u1Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkmm9t0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f6e5d2f612so81229666d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 03:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747565741; x=1748170541;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PidCDaupyEMEwIHIG1xvK2j20VbRhsyPW2bIrlAsTDc=;
 b=mz5lrvA5KJVvF04SDpt5GGrmZUtVyy1ALKd0ff4HMvAxL/Uw7oQ7/91CXTQ1YPPVRL
 OBdYVI8XwxEf3bk+Lb0N3aji+3gjjxlbYnjkaMdYV8+uVx493lR+2sxKZB4aYI7n8/p7
 XGJsVw5YVrbRQW3NQy6o3TyEv50mDYHXfejVHnYhLqBEGGMuWy0YF01VD+HOsM0Xmdv/
 CEtYo/EQ3dCOZfTQiEZweU+PuuR1iXMI2QsfiMWlkeYQpy81H6SFgFfseN7N51iCKAnP
 PXDacZrWwlxwEDv/vFoAKYvbvfgDh/CWp/vTU4evCwgBkE72kpGURomdiBYOgMURUF8t
 Rgig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUonzFU7awfoBQfnDwXkWC2fNCMDGw/we/Sf9tBqEfUuPUuJJNju4CP5ivyvOBZU0VN9RlBVONKoIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yygqi+9X03pdssIkB5EiSV2wLdPNUs830CeHVJtUotZXltp1aHn
 w7HYN9nd1aE+w4pSWouXGJzHfFVT+nfG2QDbZrnngWU+qa5Qwyfir61Z7bVLO8A+WhUTwaN7SNY
 HegefGdNWukGoRhdnpBE63/asnuTcqLp4uj0zUs4TPpzBqi47+g/BaLlK+uFKo2cp7pQ/mbg=
X-Gm-Gg: ASbGncthgh0FWIz7vxiZ/lWo3i4YrklkOrz8RSM5cTfhtNtFyVRgSlPeZSbEz2taP2R
 yJze+XZqlRiNOKNvFf78K/S6bFqlKup2am/9ULMpP+5DCe+2NgXTToSCjN/8esM6WLo8e5Q8bxQ
 AtQDFEbcp/FhbkqER+/nIpyEgj+4b7a3kEm/9pw284+lWcQ+6AXvviGrYrpdTCDagWyG7buC84N
 LgWIkmVkNP82PneCUJEFFjyfkzcr5ZzkmrxYX0f2MLCB5+dVBoP8Rp1A9iFrZqbAQRUOZRthPLp
 oj1gwJNwvJdg2/zgAGXmSUkjLwwc24s09JLlsnUzTs5IwLFKML9F5Cfos0x/oy/yTzDusdnysEU
 iQtfx62vXUEs22ufeBvbq1d3g
X-Received: by 2002:ad4:5941:0:b0:6f5:f6e:832a with SMTP id
 6a1803df08f44-6f8b0870f8dmr165087986d6.19.1747565741031; 
 Sun, 18 May 2025 03:55:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXPRsgkQ5tj9rTK0IrAjGcywRW1fhh0muvVsDDNPPD2vIhT22UIKWmH4LZ5iw0W13ESp3Geg==
X-Received: by 2002:ad4:5941:0:b0:6f5:f6e:832a with SMTP id
 6a1803df08f44-6f8b0870f8dmr165087866d6.19.1747565740747; 
 Sun, 18 May 2025 03:55:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:55:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:26 +0300
Subject: [PATCH v3 08/11] drm/msm: rearrange symbol selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-8-0e91e8e77023@oss.qualcomm.com>
References: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
In-Reply-To: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1CGQPf555qFJU/R7NQ3znd/IF9NZR/aTxcJ4mydnTq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyay+Pq88fpo0dRqmFzoV26PlTC9TQnpNLYR
 5PDNYGJeNCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mgAKCRCLPIo+Aiko
 1c58CACfs88NPVsFXzwZNkPLlFX15tdciASdOlLfSQwLHX1zdi9ZhkvLBdU+c7rG27ZPuO9lECA
 WT6uVv5MwGc5jWMOzItU+Irm3L1GXyUuq/XQnE9LV8StycXsG4rbeAlo8K1vJeIHXUOW/XQ7LGs
 +oQr0E6l4R+YERDUKKVjG4s0Q2lDg0syUEyFtFy2Bn+EB/w9KbGRde5v4byWRQRMWtwCwNuZ+dv
 Ahg8Wp9DDrpAkKOnd6yiNp+REb8OAVr8PJOx4bD4cIEIIyqg4FoGhfq9S8J0j/zCfHqkLoZKSqQ
 mFKlUDz3sQLIphcnyldS5gEUvOcQ9eSaKVidN1XfYcOwig5I
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX2auDJYGs4FY5
 4D/bk5Gz12FBWf80P8RXqQEHpSwr1ZD4zARWXOVLBf5ywxke2pLDTdifhNJHypk4T7nNhLcRfpa
 4Pe0asXLQUkcikOHW1DeShtUO42kd1AmO2zAVpAK9sthf+BNDylMLosM7igjrdiQqvkdOYXu0a4
 HdA9WN29jQ9PBPxzNXI7LDpYNtc2f4Bm28V6B47BpsmOBX30oclpKc+Ivtxv4mW/h8GwhKhp6t8
 FAxoax0WUp9iZMmppQfMSDLmuTNPHc2MrBooavD3BhW6znBdQnp08z1KCk3tBKMfBQkV2iBDedm
 whacaB4LP5SqUS968pWWiI3eCOZDlYY0gzMDewvfAi1wi7+etJH2QOF3fVmSk8lSmoaCeWb446/
 Pw6iBBNuL0K3nthCgQyXFN3+46K8o6nRMIjN+D41kYvHowoNGfb+EvSS3WueBjjz2rSUXX/6
X-Proofpoint-ORIG-GUID: 1oNrzAozAcGztUZXgdhbBb0zK4LovFwh
X-Authority-Analysis: v=2.4 cv=PpyTbxM3 c=1 sm=1 tr=0 ts=6829bcae cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Dibrpul-hQ8xFFu5PoYA:9
 a=0W9TD_AsGAYKDBPL:21 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 1oNrzAozAcGztUZXgdhbBb0zK4LovFwh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180104
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

Move symbol selection to be more fine grained: select DP helpers only if
DP driver is also enabled, move KMS and display helpers to the newly
introduced DRM_MSM_KMS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index cada5832db3e894c9bae4c6b0c6d935dbf5d933f..f6360931ae55a2923264f0e6cc33c6af0d50c706 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -15,18 +15,8 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_CLIENT_SELECTION
-	select DRM_DISPLAY_DP_AUX_BUS
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
-	select DRM_KMS_HELPER
-	select DRM_PANEL
-	select DRM_BRIDGE
-	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
-	select FB_SYSMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
@@ -69,10 +59,18 @@ config DRM_MSM_VALIDATE_XML
 config DRM_MSM_KMS
 	def_bool n
 	depends on DRM_MSM
+	select DRM_BRIDGE
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
+	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 
 config DRM_MSM_KMS_FBDEV
 	def_bool DRM_FBDEV_EMULATION
 	depends on DRM_MSM_KMS
+	select FB_SYSMEM_HELPERS
 
 config DRM_MSM_MDSS
 	bool
@@ -118,6 +116,8 @@ config DRM_MSM_DP
 	depends on DRM_MSM_KMS
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
+	select DRM_DISPLAY_DP_AUX_BUS
+	select DRM_DISPLAY_DP_HELPER
 	default y
 	help
 	  Compile in support for DP driver in MSM DRM driver. DP external

-- 
2.39.5

