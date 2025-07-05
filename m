Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F97AFA090
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 16:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1414110E22A;
	Sat,  5 Jul 2025 14:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMwVlEF3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF7210E220
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 14:52:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565EVT94030409
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 14:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Nk90VOiEFug
 0vYkjADFImbzNB5RgGN7Xu9yxpfyqjMo=; b=EMwVlEF3LV1v+XqxGnc0prQi2ce
 POIJRSVXse1eRxSZLHLYXK4uhri57YWRiws8HBkYAgd/otBUdtDpq975Qs5VnOT/
 22aWWmtroGWckkzEUr9q9AS05TrBHqJSiuqwbOUDxcVDfHaLsCZTJDwUIORNXBwO
 wqrBt5BAYEf/IzKlQsPcsZUiNJwNh/qF+Gpav1WT+T0WUIBi99bH1EOn+5da9zHO
 ntWFIGsIxMauQVN7I/L1zLIXjimxjFHQfJddcYFvXM/IqwurSbUI8mEie+IS8kIV
 JCFAoYXcH7L6SYK5PddG9ue5MMUt4eZS4nTZ3RlIGR9FsSSQmHevh+L47Pw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q1574-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 14:52:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-23494a515e3so13032565ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 07:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751727168; x=1752331968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nk90VOiEFug0vYkjADFImbzNB5RgGN7Xu9yxpfyqjMo=;
 b=B6UQU8S1joWh3zulPE5FPZiNU7lqoctHkZattXYMLwkHppWt1KkhMsVDC2DG92gQkS
 CpmyB0HEXbtocacWH/nfjGA+TBit03zh10JmGdHmB1NVakdyzWBaYtEtYQiJwUOrPcYv
 EfghfT1GoZVsuNkB3iisIIHkUHu67j/tzg61NdObRFx95IIxCqfQe29T6Cp7KHQ6vL8l
 WHLZp9HtJWD1MFmLvnjLmKUngPQ52wjv8S8VZk+oO37RwIqQ1idi4wwp8/U0Fy+bHMi8
 LSLVFsGuLD6MZKCNl/ZWgPXS4rF3y3KGN0wDCgsqtfL81cHUp4m6zMXRPFGKjxo3/R/S
 dgWw==
X-Gm-Message-State: AOJu0YwwfzLn9Va0fsKTezikzzHFx++XaG6xyoV3BCHFD/tfYiUfgPNH
 M001hp1KNAAZHKn/t+uzCeox2GM7NRPbGAPY4S+8eTByGMa3taoglt05hCP64Klu3/O77MLhlsK
 lydTM07D8Ic0tsyfW+J6PjCmVU97pzRpGlKv5TjTnORgXEv40yKH7pr2xOmRt2rXtsSWdMyLIPf
 BBpHY=
X-Gm-Gg: ASbGnctP1KxaySktBsGx4g+9xiRfGTmoj4p+WRzKV9yVTkrtGeZhtEi4qvsmoqPCELU
 WFcr89/IFZnBdIybMo/jMfyuugjOoehAZCfzdmvI7IpwLA6bf17vIOhwjMOmkYoH5O5ohAyACOB
 IZ0jIjyuSQr5rcKvxF3OLeWpil26jbhfOaJiOVV/wmSCH0afX1AZZQ0jA36RBFGnE/hn6sM13Bz
 +Zu6cVn+vHEoWqoQ133gF2RTs7/axDMWEvXJJrOUZ7xPdOQmKujs0t7VRu7+LT8jYDtkOS9v3P4
 pGSqXAhQh6ARe2CyEDjLEEJeEj1GxdNNsw==
X-Received: by 2002:a17:903:41c1:b0:235:f51f:c9e4 with SMTP id
 d9443c01a7336-23c90fcbe60mr34277815ad.12.1751727168485; 
 Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGecKCCmRq5wXE4HczwKGdy/aWs+wh50ypGWsS+hlioJO5FRxk3SoGiY7wXQgs9u1NiDjqw0w==
X-Received: by 2002:a17:903:41c1:b0:235:f51f:c9e4 with SMTP id
 d9443c01a7336-23c90fcbe60mr34277465ad.12.1751727168075; 
 Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8431a38fsm43137835ad.4.2025.07.05.07.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 07:52:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Clean up split driver features
Date: Sat,  5 Jul 2025 07:52:40 -0700
Message-ID: <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA5NyBTYWx0ZWRfX9I8C698lSmJg
 xyVsoErUB9Dih6FmWQ/mIsjQFW2ttX8aJfW//Gy1UtHZbcvOCKM4XRLnrUnukZjUQ/rfEtapiX3
 sHkY/WDU3yTkdaJUWpf7Tg1SKb80ug84KoIV2mCnwvqufFQVNwRr2pZslzUTeg8QLUabyz5e7df
 lLDoYuPSAq5H3K35u1KvBupbeaU/85cbt6NPQsQZQ7vCHNG8rKIQLdnIDhe1rW29Rq5f4WF2dw2
 vx5i9N3wpe/O5WwysfR5dakbEwQ207WqHO8Rmgt052KK8r+x+Hr31/vWDnfSLDJrXxy3OCIA1oI
 nzrvHyfGWo3gBNj1QOjOBoaAHg4etJedCnge8ioZ+IYKIvxX+NuXBL696b5H8hPHk9MhFK5ERNT
 WTEADJsaLyoSrT/dus5AkjulEtlxOu6pkG36LJjwrncikbs6n1TD+COfIlS+Ofxttx5qyloi
X-Proofpoint-GUID: e7xQeon-4cQAeImF1tYdwbFxlX7HT8t7
X-Proofpoint-ORIG-GUID: e7xQeon-4cQAeImF1tYdwbFxlX7HT8t7
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=68693c41 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=udmpUeRRehRK9BJah1YA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050097
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

Avoid the possibility of missing features between the split and unified
drm driver cases by defining DRIVER_FEATURES_GPU / KMS and using those
in the drm_driver initializations.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b6efc5b9933b..5695de1bbae2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -816,14 +816,21 @@ static const struct file_operations fops = {
 	.show_fdinfo = drm_show_fdinfo,
 };
 
+#define DRIVER_FEATURES_GPU ( \
+		DRIVER_GEM | \
+		DRIVER_GEM_GPUVA | \
+		DRIVER_RENDER | \
+		DRIVER_SYNCOBJ_TIMELINE | \
+		0 )
+
+#define DRIVER_FEATURES_KMS ( \
+		DRIVER_GEM | \
+		DRIVER_ATOMIC | \
+		DRIVER_MODESET | \
+		0 )
+
 static const struct drm_driver msm_driver = {
-	.driver_features    = DRIVER_GEM |
-				DRIVER_GEM_GPUVA |
-				DRIVER_RENDER |
-				DRIVER_ATOMIC |
-				DRIVER_MODESET |
-				DRIVER_SYNCOBJ_TIMELINE |
-				DRIVER_SYNCOBJ,
+	.driver_features    = DRIVER_FEATURES_GPU | DRIVER_FEATURES_KMS,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
@@ -846,9 +853,7 @@ static const struct drm_driver msm_driver = {
 };
 
 static const struct drm_driver msm_kms_driver = {
-	.driver_features    = DRIVER_GEM |
-				DRIVER_ATOMIC |
-				DRIVER_MODESET,
+	.driver_features    = DRIVER_FEATURES_KMS,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
@@ -870,11 +875,7 @@ static const struct drm_driver msm_kms_driver = {
 };
 
 static const struct drm_driver msm_gpu_driver = {
-	.driver_features    = DRIVER_GEM |
-				DRIVER_GEM_GPUVA |
-				DRIVER_RENDER |
-				DRIVER_SYNCOBJ_TIMELINE |
-				DRIVER_SYNCOBJ,
+	.driver_features    = DRIVER_FEATURES_GPU,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
-- 
2.50.0

