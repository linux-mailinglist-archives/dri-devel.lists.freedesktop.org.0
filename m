Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E89A9D240
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F416110E9BA;
	Fri, 25 Apr 2025 19:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYZXhBcP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EA110E9C0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:22 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJurG024719
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5a4Tu/1E9y/AMugtDgzJWORXKDUHZrIzgXNk4yTd8xA=; b=KYZXhBcPqgXRzCMH
 lTbOySjfrUBCxuiIu808dMdXl1Df4L6Tg/aNdpNJ39n0Ig0bnbdTFaG0qLrppN9a
 zQnAtGG0zn5qdu1LTpMxBFzyAjd7K8tZzf/n6LjXDVgOnqjyGMb8e65rlb7MBgCV
 6r9e+ZtAxfni51DhEKPe5GGCrkMkfIG9x1k/EzVxIx1+0z4YkHo3JQjhcLyE8xLX
 3pphdawxnWiNa5QRGryTX70cnnjka9tiORSk0QhA8PDugDHBa2QK5Pa0v38yzLqv
 /cpnRVbMmXjuA48gU6BaLi2JNPI0JOI26bx8KYf75edmoTA5XAUn+iVfNJZUJ+Sz
 BWWAKg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0t0x7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5c77aff78so741920585a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745610561; x=1746215361;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5a4Tu/1E9y/AMugtDgzJWORXKDUHZrIzgXNk4yTd8xA=;
 b=Z8gWzilOxQZbx3h+jV+K+aSuy7zUs9a3DF6TMDt+ezD+Mew017EtD8TfMapEv9YCWD
 tQszrjtFuilWKT9yViHg6Hx+nmIHT7K5FZp4Kcp/pXStSko1qEY/w1p84ANxU0RU68lb
 Q/ugukeP6bHvrUl0EXYKQF1cS6EYCkrFWTAq/3pdVZcnkSntz8HG2jE1EhcK998H+3A5
 x64iZjnHci/C5SiWzJLfsfQG8Ke8hNtsQYjLfw5zsG0GjRZ+ULm8R27OLsx+8slG1fyS
 7sDgkPfhe0ZwX8QidZoQgrQCfAr00REYgifdnfxKpeaX4c4f5FXOYG2k6kRSMvjXS1l4
 AfVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt/7IQ+q+VHOh0OuhluHHEsw/EYPDocYzcesjhwPpeQ0fRMj51bE/yu/l+3DW3Trfy+OA4DtrAFR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHK9BtO3ZQjZIRJUG5x0sq7TZ26ctieeSLTPIAfptiGFU6sNW0
 DV/mGRhhsGms3DH6AZIztKP/WLs8GOa7EecJP+FWlKIJ4vl54xDt2GfPKbYMf/beyUiPxlGEprX
 56/Zuu7oEWoNohwuWrvyq0Vpt70Z8wQhZZCvTcB5/SGPbSIbgJvXCou5RqLjo6vgVbHQ=
X-Gm-Gg: ASbGnctayGBLPbSdghLRwPmcSPKYUh/hIuwATINqFoSLiqa94Z8U+Ec7ip55BOs4iBs
 v8g9+uBF0Oz0qOZn5AVTaVz4bt/wtUQLZ4RnCNzD37rMcdxDFILZnvQ7QFLIsrWbXLj2FXhRtqR
 nq45q2rw02L9zFNwJjytILnIaWyintL40S3BOSgsjJpImVx+84KP3ka4xgrlRYoxI1baWb5PS0L
 FgOO6EUaOvqf77Q82UhWplAnIyZpJcPlgI5x7vFMhCV+aZbUucEnKKZ2ZfbcXEy5VILir/S/fTh
 TwWyLhumE759ZCc7HfVXmCe6ocQUoP42Fvy6g09O8MOfPUFdeWytd6xVn/2MDwqMIlM4feXGTez
 0rNmchf+REPCOUZkTkbiSiMWT
X-Received: by 2002:a05:620a:25c8:b0:7c5:4c6d:7fa5 with SMTP id
 af79cd13be357-7c9668cd867mr122694685a.48.1745610560927; 
 Fri, 25 Apr 2025 12:49:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg49BORTw1YQtPiSWF9NWVVu6nzuLs4mUwjo+GPlaRuPFDmc9+JjXZEsEP3ZQTI6hbyUQGyQ==
X-Received: by 2002:a05:620a:25c8:b0:7c5:4c6d:7fa5 with SMTP id
 af79cd13be357-7c9668cd867mr122691885a.48.1745610560546; 
 Fri, 25 Apr 2025 12:49:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:49:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:49:12 +0300
Subject: [PATCH v2 5/5] drm/msm/dpu: rename non-SmartDMA feature masks to
 be more explicit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dpu-rework-vig-masks-v2-5-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11698;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XRKi7EgQ00ItUBDoE7NN0/mscfyycbJkF95BVyCbUY4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC+c23+YZAWFYcxsNyRRupsFgfhvnpHKZ3LWVF
 PcxzyPdchOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvnNgAKCRCLPIo+Aiko
 1QfEB/9AwqMgymHujrhYs7naYVouGOqaMUQlAZIE2NnknohMUA/eD44VNxQUWVVFtZ/rfFCj2Wr
 OEXaNeyAJi8ghLIuVufs29OfZyxo4kwi3dMN0QFnJcKI4EuIA+A14melFYLcNDb7N5d12zmm1oQ
 cx5HoX/ahnK8YyBTojD3A+CWVuzMBPQ3O00UpfbgjYhjkPeI+g1fNTnmnL3Tp104UJE7ZrszGEy
 EuxYBi5X+c5o4S/YNUTb4KwYkMLyyD1GRXGyBm+ZMxU1DDDuout79hwA4srYYPLKW4l2eqelYkT
 i62jutuYh2OR6INXGg7rcWtUX/s8EqLsp+t4AwNkBRhkuX4D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: mS3tWI_EjOsNsoNUs5tPFJz9zaKDuqya
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680be741 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=a0m6xc9GvvHJpfDRXh8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mS3tWI_EjOsNsoNUs5tPFJz9zaKDuqya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX3HavINV2ThoP
 wwaXtpMfy4tD2dGCnP+gTMad2UuHVHHDMlGPXvJz5ynssaAc4bHFt7ehw5itPTkE15J0QY5+62v
 eIHI9/68+0/vFU3sKmUBQYUJEOZ7vYApreqCMFQTde81UvOHkGh4bNIxD8qVX9NkG15kAsfMbi9
 kJIkXaYkJHVnqrihrGqO44hxTAEEqgxNqVdQbQFRy+leaSC5Myzm+B4MNkkkWRn9+rRNp6qNXFr
 fFuoUSgej+hIRYoHXR4dChAlRA5yo8+sg2dIAixl8ld1Z+RKfnqlexyP8XVPNqeQONP9hSGDZtv
 vSOTX69k88xQhBFAmW+rZ7pbEaEo1tCiTBC/1BGCill7kU3gFCsQ88Yfa4PLqgQkM5eoBzw7ehv
 0p302Hlf7IvGuGybEOyAu0aRW4PEjbqnpeu60UKhD3AcGpmDgOUBOGkVaN3s+yA4U7Qq3xHs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=684 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

It is easy to skip or ignore the fact that the default SSPP feature
masks for SDM845+ don't include the SmartDMA bit (both during
development and during the review stage). Rename SSPP feature masks to
make it more explicit that using non-SmartDMA masks should not be an
exception rather than the rule.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 10 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 16 ++++++++--------
 8 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 83db11339b29dc6e11010bfc73f112f93cf6f7c6..9e3e0ab8f3ce9d63b00a5f5c590429a53bd36d63 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -72,7 +72,7 @@ static const struct dpu_sspp_cfg sm7150_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_2_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -80,7 +80,7 @@ static const struct dpu_sspp_cfg sm7150_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_2_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -88,7 +88,7 @@ static const struct dpu_sspp_cfg sm7150_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -96,7 +96,7 @@ static const struct dpu_sspp_cfg sm7150_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -104,7 +104,7 @@ static const struct dpu_sspp_cfg sm7150_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index d3d3a34d0b45de08a33436f46a197cc836cf2629..fcfb3774f7a18d8e01546a3ac72aa29f7b750443 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -69,7 +69,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_2_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -85,7 +85,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 040c94c0bb66ef5aaab2808f6f5ee04dd53e2540..842fcc5887fef15789fbc686fe2156b6b509b45c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -51,7 +51,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -59,7 +59,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -67,7 +67,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 43f64a005f5a89e09ee9506a12cfff781530cb80..c5fd89dd7c89046bdbf1b1bf223aac2e3c4c0b26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -38,7 +38,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -46,7 +46,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 397278ba999b24722b116e73b008b2d0aec5fcb5..a234bb289d247d065b336564faea8dc35b00def9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -59,7 +59,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -67,7 +67,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 3cbb2fe8aba24c7b9db6bb61ff4c48f34db48bf4..53f3be28f6f61bb7e3f519b0efa4cb2f68d38810 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -46,7 +46,7 @@ static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index a06c8634d2d7779f7e867fb821f8d332652ba7e9..3a3bc8e429be0ba86185741b6b27d8a62489779f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -39,7 +39,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -47,7 +47,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 64265ca4656a04d8c5a1d9582d7124c7eb897099..323b0db1f32b4057999f5f9ffcc557c68b0e807a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -34,11 +34,11 @@
 #define VIG_MSM8998_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
-#define VIG_SDM845_MASK \
+#define VIG_SDM845_MASK_NO_SDMA \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK_SDMA \
-	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+	(VIG_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
@@ -54,24 +54,24 @@
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define VIG_SC7280_MASK \
-	(VIG_SDM845_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
+	(VIG_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_INLINE_ROTATION))
 
 #define VIG_SC7280_MASK_SDMA \
 	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define DMA_SDM845_MASK \
+#define DMA_SDM845_MASK_NO_SDMA \
 	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
-#define DMA_CURSOR_SDM845_MASK \
-	(DMA_SDM845_MASK | BIT(DPU_SSPP_CURSOR))
+#define DMA_CURSOR_SDM845_MASK_NO_SDMA \
+	(DMA_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_CURSOR))
 
 #define DMA_SDM845_MASK_SDMA \
-	(DMA_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+	(DMA_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define DMA_CURSOR_SDM845_MASK_SDMA \
-	(DMA_CURSOR_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+	(DMA_CURSOR_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define DMA_CURSOR_MSM8996_MASK \
 	(DMA_MSM8996_MASK | BIT(DPU_SSPP_CURSOR))

-- 
2.39.5

