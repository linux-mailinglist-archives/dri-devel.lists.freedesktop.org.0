Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C90B282D4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 17:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6527710E2D4;
	Fri, 15 Aug 2025 15:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oV4s99cy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0071410E2D4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 15:21:20 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEKDc9024029
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 15:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=g+Idl0Z9XcKWlohwID/DKU
 sWWH1aq7wh7EFh9rQ7yq0=; b=oV4s99cyHZFy+UzRK2yKPGbi2pdeRcgpF6KfRJ
 IbYlJ6+pIbCL3T8GF/cSh6BFuZ6SRYJy+L4+bfty0wY9fACy+us2zJkxp3qPtnyy
 coL80LQVG1/4nl9BAR1dUe3Vjj+dP7Fj69labWb7WU/DeNJA02L3GfvKfO/qcXLC
 mbRKDw4JFxDAcdNAGtSjJBg1WtjOt/nHQQFzxXAZULCxYPpXoQx9CRaUbLkBUQQA
 Z+jQ+rQKU6I5a0ieKaheN+UiQzIhhPag8vEmrvSiYBc3WVtz/9UI51gPEZvDxO14
 IrmaSWJEjCWqq8S76izbtKdNKI2d+fpjsItz5oAqXaX1AjJQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmkbm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 15:21:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a88dbf013so44759836d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 08:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755271279; x=1755876079;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g+Idl0Z9XcKWlohwID/DKUsWWH1aq7wh7EFh9rQ7yq0=;
 b=YNeFFtIHWCfryTh4cX1BRsPdB5ofWVRmjJcW5ST/ioZbzFKmUc1KMl+nr3q0m/w70O
 BJLlOzlbfVW6BhTd5v1Y4VPVxHW1/AOD5UGIYYbXooBSIArtuV68A5YFUMgx/EK9D8cS
 3UD6Lty3M+gY6wnzuVmoqpEh0n2kE4uhr76/3P57IWHzjVifNeCM+2WuJbqdu1BHzQEz
 8p8e6LCXcrwFDszzWV71WZATJE6h8KztJzQZZDP0cX0VmO9tAqBlqBE2TSST/7qvWFhM
 LCCpE0rq/4MWJIJC3hChY2puwlLBWfHdQxFQU2ZOm/S7yai7oXIYiOnQDKVE2M40iSK5
 +0UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEu2kCktHLPT+LsZZfxMeueI1jCAx5gaGnZhedO2efG0LZL1watT7Glr4AczbVhr1ObwB4Yn8iIeg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7NPDO0GGdh0zvbSiAl4J1Ir9psbwwhfWdn/pMX6wY7BlgZDdw
 AGddgALxlKa892aEHT8Bo9sXeJoalziAGQdC+HCeqiBSS5czkNFDxg9wqe46tX/Us6dthakukvo
 Soy9etLrS7rAKaip6tImz2/eNiONnoU34jcqouHl9XHtOc7Fzm1M7Tw7Qt9Hzvr9ZDXmBCqY=
X-Gm-Gg: ASbGncuiVLbuyXUnJxbfDmCtQa5w3mbR9RMdkQpPN7lduKI8+PuE9N3qb8XhhINNYzD
 XEKuXOIQHCWMcnRPzQinUauYDkaRUGRyv6JLhZqTcVmAExcXq0Q9PqvoqnjDS2GXhJvOt5JWWz0
 3O61yyNQj2MLai01Cyal0ysluAeq/MdeRFIYXSWBDm9NniaAwjZdkx56adDrfv1xMik8+F93G+1
 +lEqweN7ZQF5TnbRGw+kQvao5LO5qiP7HsoAfwWf/3kLs3dv/TvBA9R87HInS0SN3H21MJEwTjZ
 G4cUqG0uJw7khqTZeimpvkg06LRgMf+bN9MOynksGmTjXHDWo/5NX47k6w+VPhyxbFkd6i59wEx
 DT1OwBD10blA0jiQgv4c3ZUWfxI2trlGW1+jxflaqbH6vCEVKBdGx
X-Received: by 2002:ad4:5fce:0:b0:709:31f8:fd96 with SMTP id
 6a1803df08f44-70ba7b17e4cmr26400676d6.20.1755271278927; 
 Fri, 15 Aug 2025 08:21:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaBrfvvSpMdjiKGCL6kd8iXm7swFbZQ5AFnvhsfAn56VpGfW3GepZvAUU+AsC5CJ0jSSN4rQ==
X-Received: by 2002:ad4:5fce:0:b0:709:31f8:fd96 with SMTP id
 6a1803df08f44-70ba7b17e4cmr26400036d6.20.1755271278298; 
 Fri, 15 Aug 2025 08:21:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a43b992sm3921361fa.25.2025.08.15.08.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 08:21:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 18:21:15 +0300
Subject: [PATCH v2] drm/msm/dpu: add support for 4:2:2 planar YCbCr plane
 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-fd-dpu-yv16-yv24-v2-1-eb08531814c3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGpQn2gC/32NTQrCMBCFr1Jm7UgziVFceQ/pIuanHZCmJBosJ
 Xc39gBuHnwP3vc2yD6xz3DtNki+cOY4N6BDB3Yy8+iRXWOgnlRPRBgcuuWNaxG6BSnUjyBO5II
 5BwlttiQf+LMr70PjifMrpnV/KOLX/pEVgQKVMRcprbNaiduTZ5PiMaYRhlrrFwgwHmSxAAAA
X-Change-ID: 20240222-fd-dpu-yv16-yv24-6bf152dfa7f3
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2078;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wv5uC4RQRHmvAs68qHKZxljKlLnfQU03RWVOByU+dqE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBon1BtPrZfCPEi08HCWelXcb92WnzvWD7NeIXIC
 DAY2rNGwtaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ9QbQAKCRCLPIo+Aiko
 1WX0B/9tQ9mYZTbCeyyqT9wRFTYQjxrMwO1bTF8D9mi08bKz8+l+VN8NN4oggS9Ta5LHF/+Bz3o
 iaUvJvIaipbxZYV9wldCEbl/vPMtA0G3gHI1/dKxsOZBQiXoikBfrdLeSnKBQYzWkdfrQA39oNx
 JeWw2YNPHY8LU0GmYUwUITlVsauVBMn/IKchzhrph3h8a6DCLO6FNe6+9sHomN0QCqdbypAh8TQ
 JR/etZTpEAxAnG515wq9a/cVcXiW+7kQJfZraeQVo5yR0S5aGhF1woyfqmKtJgH0EM37nUaTJcW
 5zQh1099swC3C/70Ej0BIqxszU9lC4h8K8fn/scZ+bRF2SWc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfXwynqICGMrzYg
 Titxs5W08HpAe3CRT27KVn+hHQJRyP5jOprFZxANtbZF82OClFvZxnj7B2NxXwtpBFIgc8+ElFG
 79SqY53/aSN6pP/EAahAF9CWDkwG8sdYlKDCWPJRZ/xRzy9ejrwuu6Y35Bz/bSbLT290DxQTFYL
 tEm175hxEJ0dqdwR5UlvNpQH8WyE65bg/cxIEjSeFVbbZsLpl1tvW63vQK0miDYoOZpWmpnHSGQ
 XRdT+BtGqZRPWE9W+tBfSw5eIe0c9XXMm7KGJoIaOpZdBFBjijYPGgSe2t3abO4iizuVYW8Da6J
 yd1DrSnon95Idj7uHkOn1XfoRgFeP6FNUtsROw1rczDFJ7WcLvUAzXAA9WXD16UJgDBvvr8eJmW
 kwKxwVC6
X-Proofpoint-GUID: Z7Skfl_cpbO8BtFLWuyV8RAxwjFaZX2d
X-Proofpoint-ORIG-GUID: Z7Skfl_cpbO8BtFLWuyV8RAxwjFaZX2d
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689f506f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ZlibHMbJTRG0YE4QOoMA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119
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

The DPU driver provides support for 4:2:0 planar YCbCr plane formats.
Extend it to also support 4:2:2 planar formats.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Dropped 4:4:4 formats, they require higher clocks.
- Link to v1: https://lore.kernel.org/r/20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  2 ++
 drivers/gpu/drm/msm/disp/mdp_format.c          | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e824cd64fd3fdf2ab0db92794a0aaa57c109decb..b1ec781ffd23065edba76ab9fdf8b377c8dce6ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -183,6 +183,8 @@ static const uint32_t plane_formats_yuv[] = {
 	DRM_FORMAT_YVYU,
 	DRM_FORMAT_YUV420,
 	DRM_FORMAT_YVU420,
+	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YVU422,
 };
 
 static const u32 rotation_v2_formats[] = {
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 426782d50cb49d57a0db0cff3a4bb50c5a0b3d1a..481c04cb085827175003d9944258420d56021704 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -511,6 +511,18 @@ static const struct msm_format mdp_formats[] = {
 		C1_B_Cb, C2_R_Cr, C0_G_Y,
 		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
 		MDP_FETCH_LINEAR, 3),
+
+	PLANAR_YUV_FMT(YUV422,
+		0, BPC8, BPC8, BPC8,
+		C2_R_Cr, C1_B_Cb, C0_G_Y,
+		false, CHROMA_H2V1, 1, MSM_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 3),
+
+	PLANAR_YUV_FMT(YVU422,
+		0, BPC8, BPC8, BPC8,
+		C1_B_Cb, C2_R_Cr, C0_G_Y,
+		false, CHROMA_H2V1, 1, MSM_FORMAT_FLAG_YUV,
+		MDP_FETCH_LINEAR, 3),
 };
 
 /*

---
base-commit: c8b9adc58cd171fb13e3554ef91db95c066ffc19
change-id: 20240222-fd-dpu-yv16-yv24-6bf152dfa7f3

Best regards,
-- 
With best wishes
Dmitry

