Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9970A87283
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 18:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27D810E23A;
	Sun, 13 Apr 2025 16:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNFxRR1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C734C10E260
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:08 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DCSPPj008486
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=; b=mNFxRR1m3X4F/rfZ
 SzNyS/4UrnRiqZQFXlnmARW3+J7zlyctBx+auILE8jjyTVP0mAszsWi2ue5GAcUH
 T53BKEtsjA+czQUJsGBavS4uTDc/+kyvRFJsKmHvZT2nx7A0vuak56XkoeFm4HkD
 6zjpGGwZh5VqbLmI3ajBp8cBCn2nmdMvGgkmfP86W1jy8xeWfJ79g4CLu6U3IvJ4
 415CxRmDYwTFHnWrUxXILhKaCvyOv6Zc1xBPlphTk8gcf5jy+Rr32zUXJkwcpCcp
 M9Dl5kg2fC8xRQ4OFBTSpb7CBtMkAEAnyNLY+KkAH//fsNRyuDLXYPjYpMYRWNsJ
 Pr/NQQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69jew7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6eb2480028cso60932526d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 09:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744561987; x=1745166787;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=;
 b=DTFd0BhaKu/Ep499/8J5keLlZoTcAvoCI8OvluC1vLkcmn/T+yn2kICnA2bq68u6T5
 x2WJ9WnEmLa3cp5lsfffrrblzRjlJGuM41OAGKCrttYmvPl/RK60Tv2nrz3WuFLssfsW
 EkIMF/dLDYRdsy2W3qcxIqCe+wolDe8RduZXIx0OGiW9zTfHJEawZYoaGJau5SqEbQ4u
 6c7GcTPN6i6sfYEHktWO7ex+Km0tcshzCU8cu75UHHjxY6rUcm6ZuLXVBiYVkO+AECMu
 UrtC77tbke4f1XbolDR/ui/AwvvYU57dcptMqhijfunPLMl79rF8ew4vCGKTG9E8f666
 FbQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHxsTG44S7bGTn8T51mW9qDIzJfoI2qqR4jJiFT1b4YiD0t9DJ+1Fu6gV0+7VJjJ0o1aszGwvWgJ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoGUn7ObPEMLF0RzUDPbzWTR3jjoB9QWCgMGdPZI1Ze9eW/aVP
 AM5B5NrKevnbviFXwGotV35/4iwaMclr/eOfUxflQuA8IXkJcf/Jl80YMBM18miHs4jhnZkvUFV
 kLDtwrYu2PQ2gPmHgqTKJrWt/OkI54zL0N6e8oWcH3mjENsb7duQKd4oiAaNC5aWp2Xw=
X-Gm-Gg: ASbGncsDBGVrC9PeG5+Fs7EF5j2csHRMO3/vqxRVPrQXA1Dt/pb6AWusuFn7stL/1CB
 qK/BP5dCq6IEdg68MdVAC72jdrW4t8NF5M0KUvsZNbRXaCIgTqEfIqnNK/L0EHdwPGKY27sgFt1
 qXRPx64lJrnmKlPfIoqY6ECCeiAO4lhurzk2Jdels5uZ96pTx9neYmPhbP28ydhw4ucW5LO8F1J
 xcM0bUZ16cTcQBHhjL+7/Jj/l3KmwjGXVZT0H4xQKc+PxiZ7Ch1cGftuoiXoJL3reksl02e+yno
 661FOMag4uXC/t6O7jT9mK2cBvDpjVZyCB+bABXZl5w1HRccUx9UZiFg6cTqdvVa5nXyzHIEyFE
 kwwaG/bDWuFmm+vFqZk3J77CG
X-Received: by 2002:ad4:5c6a:0:b0:6e8:9525:2ac3 with SMTP id
 6a1803df08f44-6f23f1188admr152015346d6.34.1744561986925; 
 Sun, 13 Apr 2025 09:33:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGLodl/w6+GHQYPiMmhn35zt6NHmgJcWNBOid2Hlk9AhNDjaBExDvTcFzQwqXWWmtQcU0lIg==
X-Received: by 2002:ad4:5c6a:0:b0:6e8:9525:2ac3 with SMTP id
 6a1803df08f44-6f23f1188admr152014846d6.34.1744561986403; 
 Sun, 13 Apr 2025 09:33:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 09:33:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 13 Apr 2025 19:32:58 +0300
Subject: [PATCH 4/7] drm/msm: bail out late_init_minor() if it is not a GPU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-msm-gpu-split-v1-4-1132f4b616c7@oss.qualcomm.com>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
In-Reply-To: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4jhdmFiEq7O5wiS7dzxOzMOcZAnlZvPI9pm8jbvDrqs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c5I7hkNUFspsI06/XZ8R8h9Li5mG5fqSSyf
 SjGe4M9r5qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOQAKCRCLPIo+Aiko
 1RnMB/9pV6fJTmE9QLlRbc72gU5cp9CDKzI2cO0Ye6XCaZ/bqfpv1aTYAKtPFFa2t/1tB9tY7jK
 70eMELu1I1l95w9Hifvki8tRXsCdT5DNAY7im3qjeYvreuE8Y/WfacKOweJZ2n/pjJIEh2ubl8B
 oRuDMx6SMc08WiOJrAGnj2MmXNRleIRSLrcekS0fpJnXeYjrkRxImZOheaAWwcswwyZapf8F8T/
 kJWigmJ0yWsjDMO2ojx5o0qGf6ssP8tJTVgPTjb/goTnRIJZiZPiSaSxPP3HAR13nDz0BaDcgUi
 TTjK+Ub+RejLZ0huYFCb9ToGBqs2eGcL1lx91btlTqlMQT/g
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 1QEuF3ezhXM5kRCe5j6P33Jc8BfCsHTE
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fbe743 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=blY4ScjC_F2vtqdRJt8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 1QEuF3ezhXM5kRCe5j6P33Jc8BfCsHTE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130126
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

Both perf and hangrd make sense only for GPU devices. Bail out if we are
registering a KMS-only device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 2b12f2851fadbc3c924827e11570352736869614..6e60a74b13d72c47e45cb9dc65ed67b977e900fa 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -296,11 +296,16 @@ static struct drm_info_list msm_debugfs_list[] = {
 
 static int late_init_minor(struct drm_minor *minor)
 {
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
 	if (!minor)
 		return 0;
 
+	if (!priv->gpu_pdev)
+		return 0;
+
 	ret = msm_rd_debugfs_init(minor);
 	if (ret) {
 		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");

-- 
2.39.5

