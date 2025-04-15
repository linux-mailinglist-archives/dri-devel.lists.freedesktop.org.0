Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2218FA8983A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9B210E6C6;
	Tue, 15 Apr 2025 09:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNigE9nw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D881810E6B5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:53 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tc6B012895
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XZFldRXNlH8KDu+WC2sgkeRrWTmxXWr9px7jq0yAmCk=; b=dNigE9nwGZFwViS2
 a5PF8fqzQQ01yz2+aaC5LlQQpKSOlliG7r7MX3ioTC6X8Utc0SslzkhCGGU9PuX1
 r6T635CkS/R8FTSdmLTDQYi3tGQDOH6KRj7U7oxX6GbR49pj6qVL7XQYvhppJWTQ
 TBy8KDDHG/Q3VZPeBHHjpyfxoZFrCiY+eufX2BW4ZMALcmsoqOMquMJzgF4tlfW7
 wY48ipUZ3dQyIfRd4NCCZ+e0tRefArFxtanEIoQLXhHoN+xs7wUDl3jSVbz7VWUt
 IyyC3QHFBh9zTmHxTuv/rE6YizrE8zsmyZZsbCpqupkuLexE1Aeks/oCcy2qKVJk
 9R9tOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq7rxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5b9333642so607394485a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744709992; x=1745314792;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XZFldRXNlH8KDu+WC2sgkeRrWTmxXWr9px7jq0yAmCk=;
 b=Q1aSLY6nvGf247XWCoz7Xm4WGUjV/PyejTre2N2iAY1n1fSp7rp7PxLQID7URvPo7v
 y1B2+Sde0NO5s4KFPqKsN6IuuQxz7v9SFbOAU6bHqKqq6VB8tSD4jL1kCIDumQgOUuK1
 MDhnlLRKk4vfQUJMjRSKDrwW5NhcqMYr3h9olHkQdoYAIOnK7jsJAHs9uEXqeWvJXcw4
 6VijC18jeOrRfD7gx8LySoguMO/0/yujOY6Naq7+P7PB6sg3jMvjpmz3EwFKewWbVWQn
 kQL9oc5MFTW+oLMdv+Jy3PQ8u8ajVSgIh4E1SOO+RtGFjSoBLOiTxF5gpw5lxP3xoEPh
 HTrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLs1/mH9DaBi44SN1qdpd6uxwuyvxemzI0y59ID03YRORxB6rEY0TfQiX1PNpG6ih+1rlmwmzLVzs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6oI0npkcUoiD+XkbeM0ElCveqv+JeJvnKMAr3ZyDi4RuC+dPZ
 n2JhZhWnQM7n/qex8ru5+WLJODCKFQQrW/Wtio0murUD/F8F/fT0iIP1WlQ865SGWLuETeJGxS4
 c5jkFb5RHUhTGBga+EYBcHuljYnGmRCp3gU2GFmNssEPgWKAjV8hpkd5DQcDIHMv1WEM=
X-Gm-Gg: ASbGncvdeaB/KWg1mOPRUD5unByZRZX/XAQoJbm+D8Zor5owHvM1jBkRFLp+R8AM09U
 eY7Jw19VvohzOADAoHwXo8Nnw4VGESU2M9d/+FoUfjwFtn2L0JgS9N9+oEo0sJr4YEWlLy2qWRE
 OusTQuFxjyEG+3es5TN88EZ0qUqYuGDCsZGEIvcBS5NjNUdkBlt0OW8TFBAjjygZNTw48gI6WAH
 Z9lYFaR9jEHR0CL5LUrI6Onhwox3Fk07PSCyuB0c066OWJxRPliWOp4y/vFb6RXYGxO2THfPkTc
 qH5D59gOK9RPqVTAwxxH9NKm0CyK9BLe9sbOSNtFiYH2G+LatlOE2RHxZKjbItVcKUv2LopUGmX
 /7uyPblyhleDniOAFBjziKC9L
X-Received: by 2002:a05:620a:462a:b0:7c5:5670:bd77 with SMTP id
 af79cd13be357-7c7af1238b2mr2775899485a.55.1744709992262; 
 Tue, 15 Apr 2025 02:39:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH60ouhfu37ZbUCCdaM4Wu6LIXI6BjqbTNDAqrORBs8MMR78mEaAc58RFd2noqZlts0YKJvpQ==
X-Received: by 2002:a05:620a:462a:b0:7c5:5670:bd77 with SMTP id
 af79cd13be357-7c7af1238b2mr2775894585a.55.1744709991825; 
 Tue, 15 Apr 2025 02:39:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 02:39:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:37 +0300
Subject: [PATCH v3 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-9-62314b1c9023@oss.qualcomm.com>
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
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
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=944;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j/LGXpgnuRffqJSRqVOkk/ZdY8s1uzD2F9Jjdwztl/s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilXhJKvBRqpk7CsNPZqkpAehg4pITVdiFpes
 BoRKdFHXJ+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVwAKCRCLPIo+Aiko
 1YP/B/48+nZbO6Et4YDrFWvGyDoqZpKmhOtKcHu0rNlck5OXzpwD7f7PaaYn0iNa4VhranUrM05
 BA9wH1/Bhcadows98Uc/YJBciKXZzDXfGPzPX1NlE4svSULFT6UXGKCnKbJ3k7tzysLk4VokMuD
 pyUm5fuw71OpydRmXg63Rr0cj91Kf5zroL6qfw1mxGCTv+r6R0V/YT6Z1NhK3wT0XKYnBpKEGOO
 IIlTK9qGbb/8lgNiHyyKt39Jk8f7iuhRdI9s/6awWqwdJx45NMB5RoIZX2omEfj6b/kW4MYjAs4
 5Lsn7TNDh9esapdQGOlGifx4ljoLqB/ocUsddivk1Pger+N5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: FXWG-fK4FAwtsoPIImu50OQnds4Bg-ey
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fe2968 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=VUTEsYOwyNIbN2ghz4EA:9
 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FXWG-fK4FAwtsoPIImu50OQnds4Bg-ey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
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

