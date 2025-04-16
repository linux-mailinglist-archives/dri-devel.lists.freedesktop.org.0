Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB1CA90F52
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 01:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384E910E9FD;
	Wed, 16 Apr 2025 23:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FVyu1n/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5EB10E9FA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:16:54 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLgIQE007820
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NbgR3JgBhEAkRzgKwkufgpKWN8aMxzm7tKt1AN1jroU=; b=FVyu1n/9qG3bAq0I
 rgKJOHEmOxHGMiAHw6p3GEfT7FWbvVyCyUtmpvXJqW5o6zBGnDe6XiDWmfGfingN
 gop5Gx276WqKbbxEx5FBfFndWM6IDEnHc9CESr4MZyRWMOs0qfUM6YEwZafyyQby
 DUABDzJap7GT0paRlCuGpANyUifVjGQ4SVy82CPeqyLV11BSa8Mu+aZwJo2egzk1
 s95EXzJG8pq7gg1PoAj7Y75sl/FdsFYbTiCOdA4Q6qX72I46b5W6t5mRPzhUuB6Y
 sBTUFSw47IyWS0HMs6a+i6X8DGLnEpheb42ix142ikt9tPD+onE7v4s1Pgfvi18x
 h03NMQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6n40d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:16:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e916df0d5dso4458606d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 16:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744845412; x=1745450212;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NbgR3JgBhEAkRzgKwkufgpKWN8aMxzm7tKt1AN1jroU=;
 b=grnDUE05VmzB3RmA3zA9Mf/25lx34n+yWU8ZFy/+g/0vcBK2JMJ/k6g+Dke1islU+b
 lwiZmra8p2Z/ANXmMsUvyF5TxTVvtcwNFigZx5r7c4BXLSk9OKhsTxYnJOJyEEqqpm4q
 6i7H7clQAeQS8pDTc7hcG5dNv+QHd3CI1o64/im2wCtxqo6Qio3t2V0Am2STriWH6zAv
 L2QYgrL7A3lwM+Yjv4v7t8BEYoUKeafBsBURIp0sABi8TcDC2+uQSU3YhwSNt8NXL7vv
 VsAqy8lF/actB9/1+PVJ8GGroNDsgk5uif51hpDJM4zTE5KQsApikU0cFTlXwlhpyU0q
 //sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY7IyL7dQc2fdVwZa0Pt0HUjAFF0iuTxs3uDKNVYKkpJqsnryeawdHNvU8ySWKWKTDvCIvyQkaMfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwffnJ+WqdKHL+mhzUiXAW25412Y5RJTdy+Yo+wPknuWhj8MwVM
 gVAvcoayt4bPh5UMkr9nNswsGuJKHrcNR+A/RHerFmpJ9wNHUaNYccEGoyvfMok95en1JRS4ai2
 vRCdNzpKzJ/ugklZ8haBtZbSF7n9yazw8CTJO5k8AF6L9SEf02qxvESp41YsOzhFokmk=
X-Gm-Gg: ASbGncv9K6sL9mUyBKkCJz6u9c74e2IzbgiYhcyApGhM5tPGkkvicjDo6z7bSzoc5ye
 DcjHMN2NKX2hmugAZS6o6hqrKJ/5eyzdveNz2x6401dxoIJqkbAQ1by5wmtZtrmHvVD+5iJqdN2
 wSTfVg8UNI9y8NaSxQ6vk96FBeuW2qZCXjCXHOAKvO0kMf03kE/Sk67aJPzHRf1cmfeJAllE/qH
 3SWNqZTONVeb/Gz/SnmFeg2xyNWNAJ7KH9FShlUQ3nbQgx8EiwoLp7RI/f2rNTgsZ4EYmRoI48W
 7fZGfChWDifxLqDG1H6gZK/gTeOUfw3YJBt0VGEwC6tGpt90mm4Tf7vqjT1yXWv9n+9UWefA6y1
 +Q/GAqaFMinM5z9HavaTT3Tbl
X-Received: by 2002:ad4:5c48:0:b0:6ec:edf9:4658 with SMTP id
 6a1803df08f44-6f2b2f41eadmr64009836d6.18.1744845412133; 
 Wed, 16 Apr 2025 16:16:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdi/Heb10IV0ebjI/uQFj+TvnCj5AqRX0Qjt6hNOsivt7/zrNZzuLbnO/trLdOyvbT5hnuRg==
X-Received: by 2002:ad4:5c48:0:b0:6ec:edf9:4658 with SMTP id
 6a1803df08f44-6f2b2f41eadmr64009456d6.18.1744845411694; 
 Wed, 16 Apr 2025 16:16:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 16:16:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:16:39 +0300
Subject: [PATCH v4 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-sar2130p-display-v4-9-b91dd8a21b1a@oss.qualcomm.com>
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
In-Reply-To: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NsF5aI5nusL+eHX5Edd+WVqyrIto2M0m5QQZuN1UEGY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADpSKnBU7awkHhZMhjgjHssIKvg9kvxarVper
 lFtR4MryhyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAA6UgAKCRCLPIo+Aiko
 1RGTB/4pE1Ow3LIETtniR4dobV9KAs9aiHQuBL4xDkuFXUvHcqLMPBm43yr/IWRC1Vj1R5NZcto
 d3uwTS7Ec5SGa5NMjQyzh2TsSFE/EKJ7stGggTNPq/CCk9cw0jl4b45lX4M2M8kWznS7t1tijPe
 S+ogjHMwMGRLoyJ5SAbZb40dnlY8pZ1vnizWAQ943AE3HEk4kVl6R/iPbK214SjG4hxgtyNLYCk
 AZmXiPEwlGnWLFcRDijSeD0nsaUcaH3buR13R8islUBME9rnyQK2w0qfvl0juHq9cM387onaP+o
 d1YhMF4TOGDt7ZjO5R150dtVREjHY5iHizzyKbYL3BxdPzBK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qTXig_AAjb7oZoGUgdwRYawM4F08heB0
X-Proofpoint-GUID: qTXig_AAjb7oZoGUgdwRYawM4F08heB0
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=68003a65 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=GY4BWdjpb_dk1TMi0HgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186
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

From: Dmitry Baryshkov <lumag@kernel.org>

Add the SAR2130P compatible to clients compatible list, the device
require identity domain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..ecc4a1bc9477b766f317a58ef8b5dbcfe448afa9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -356,6 +356,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,sar2130p-mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
 	{ .compatible = "qcom,sc7180-mss-pil" },
 	{ .compatible = "qcom,sc7280-mdss" },

-- 
2.39.5

