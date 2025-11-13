Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D92C5A993
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF5710E97A;
	Thu, 13 Nov 2025 23:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fufrg+A/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCMwPps5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FDC10E213
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:32:02 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMaxrp1427916
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Sx+7duOt8Mg6zZHNtc4wd93FWjeo32qOP0acS5OMuFQ=; b=fufrg+A/xvLPXJTR
 4goiQlZWmQiZLlyKIyzu7A0PvvDEGbY5TrNXy5RWDaW7zCoGqbpArXEUNNDCn3U6
 QIuxR/9S3N83lS0SF4YCS0rFr7xVW4TNZjYVh0Ex9CyD5c+gPEuQvrYwOoGb3PMV
 BoSm46RZq6QHmWCBlwhUJpG4XgjBlfwXf/8RKMIhrzQ3mPEd41Lko8PUMpQTbgvH
 Yrhsdng5FjRaP0AY25++McgRwtTm0n+avl5/HMgqJ/pjZgSGFnYBrSHLos779594
 OQcPnKid5h4OHFznwLit4FekPz4EwG3ow9sRY9HrgWbVqGKeeqtvyW1MCXJ0q+MX
 nN+6UA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g046u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:32:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7b9321b9312so3058207b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076721; x=1763681521;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Sx+7duOt8Mg6zZHNtc4wd93FWjeo32qOP0acS5OMuFQ=;
 b=fCMwPps54K+TnTzzOt71udv4jii5Co6g77tPCsmycx9duKA4kDNd895c6wMf8WG6qq
 DlH4WAh+X/3vRi2XNIqeR5zFPWrvybDSfZB1GXQDdOfk3X4bZsWO0nB0MRgxwXMBz9eR
 B7wmvt7pYWPCfP2jXl0HROiLz1DQj5i7UvglBcNIM/ucKS1nufNzGvBGweJ6mWp/hTzb
 UpPyVC3MRCc93u6WrUFfDkSS3hJBSj5ePZvS7/xu0STZfFC7N/8f8eC5XyGqpSPPqWSe
 Fmizn0ueijl5c0UVTcqq1uYeDjD2/QnmOftsySKx5KcA9/TCtnYw7fsAQeBcww6uZOgP
 1sNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076721; x=1763681521;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Sx+7duOt8Mg6zZHNtc4wd93FWjeo32qOP0acS5OMuFQ=;
 b=WsjvGo9QpHlMVxx6WNZOLg8hdJKOORUFLKZU4jchSOHlme9nfXpinVuO+bRxWnYUO9
 QxkJdYvVz/BqEmrXpr9mt6vrXkexns+FYTSz3FdwYtRDT7IW/sWjkTrWzToEGraFY0p1
 GlmAGmACM5XZdn2d8LsfdrFFz/JhKM03JEPzjpA0VukvpBa6xSS+FTHXX87l9GTbo9aP
 JRQ5hlLUTkq6C/VzzqgxF8yhPhn4Z7sE/uhSjCdi4xKSR4I9d0U/vsxvJf7qIALjKYYI
 PALFtMizt/sBLDIZoMIz8X6h25Dk668244Uicf/bZCcDDLlGygm67cISRK8sksw4ZlT7
 a8tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzxf+05B7I9aup57tH+6R5m5dZ5RWtkzJQo3uS2Tli9IRHWQ5ZA5Jowgu3dUgRwIPJwpdp1G+aV/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdE0MesSVoJr2YzZgMEYD2huyXfDeiqJ/pGGzhMXAu8rHldgPH
 MDWXXBLZVjfV+Igje+Tmw91pj2XULV2zCSEZoQB4iCtB1h+ycyjJGEiBBNkfJ9LNC1JOOdza1/7
 ZgYr0E22gvGKaGR5ARGkEKwxAKFWnniMV+eN2VgCwG1xSpx12l+0OP61VK+oA9stp55NQCHQ=
X-Gm-Gg: ASbGncvnHYvRHFmnucAUYY0/T2htCwAn8ukK2Pw5deA1Zkg+gy1bGhju78uDB2Dx2Yt
 iJB69BtCh4EZ/KqQ0acBUyQfiRojfqVm0KFVoc+oTYzik7YS7RzPNCm78QqoFvIx/AOAKLyi3cU
 QzdzqOqch/xVW1Qmb8FXKfoTqRJPzbaKZGOdRvRlAbrSKrZbbpVmL0J+WkYh7M0lNL5Topcebow
 nQ2DMgQDur0uwdiO3w3GLTplLEuyxprhbjthN4XIkocTzdJyhgaftXv7wTnHYuvmqh3FL/uqV2x
 +CyvHJphWmrO++y82l6FPSGFZkAyhyIrUXYGEuj7kp+Pl6k2+hiKO0SaADNcvIQ5y7BSUWiAR2G
 RrpWHbKxpf83jAmcYSMIzzAQ=
X-Received: by 2002:a05:6a21:6da1:b0:34e:a1b2:a35f with SMTP id
 adf61e73a8af0-35ba2692da8mr1640180637.53.1763076720931; 
 Thu, 13 Nov 2025 15:32:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEX/aqiHfq+KfDFbcwSzPve/zFmwha2Yv2xlolDdxZkmw42sGuTr2PqLnQdgxCC3lptWEZ10w==
X-Received: by 2002:a05:6a21:6da1:b0:34e:a1b2:a35f with SMTP id
 adf61e73a8af0-35ba2692da8mr1640150637.53.1763076720415; 
 Thu, 13 Nov 2025 15:32:00 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:32:00 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:15 +0530
Subject: [PATCH v3 18/20] dt-bindings: arm-smmu: Add Kaanapali and Glymur
 GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-18-92300c7ec8ff@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=920;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+yhNHPe0JhwA+eOy4wzvzgK3jwdDA7lGVXF9GN6vVCw=;
 b=EVrIxsWJTSe1QIoktPi4f9hvpt+misNrn2q21fLyuIb1hcisO++zvNfpv7RIWnOz7RLMMksXA
 uKfR/4rWGFlBNoAJWn6V4gbbQ5DHcW/ZW+YYGwoh/JaM3aQxtDxxox5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=69166a72 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nx9Ee08JJy_q_36Bb04A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX2blTILwpQlHX
 mS+6yV9WVxXPIUyI2lphR70jolOmbzOYHSTTN9Ly0pxkXcNs3ZYzNuJXmbzb739WRx0XWuf0uj8
 BhCu0fJwYk8r97faJbnxUODNkMD1I2/Z8jEvChsSzW3U6SpDdSWXJOgHI5G9o13KeaXweyGIcEz
 cwbvtltrEjnvmEFVXFkck0EE0iLDBLgwcg7Zjs8veBQ7zkI6gcbrHlKsPL1aSpq8K4oaJEZN9ux
 T9NYcsAVVCNVIwuFY8/AamLcuzFoLqxsVayNmDz8xKOj5ALH8pE/9qVr9EK3JFCxfD9Vn49kG3a
 zhZ1bbFs0F13xjMWFZWAgxka66VsCMCqn431zE2ujNUez/51AoptBcHmTlhKexF1rkqq9OkmZYW
 iuo/zz3GySjPZ37PE4Ych9ksQP4aJw==
X-Proofpoint-ORIG-GUID: njVEnCiYC9L8v9BS0D5015bnr20P3npf
X-Proofpoint-GUID: njVEnCiYC9L8v9BS0D5015bnr20P3npf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
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

Update the devicetree bindings to document the GPU SMMUs present in
Kaanapali and Glymur chipsets.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 59bbd20992c9..cdbd23b5c08c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -91,6 +91,8 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,glymur-smmu-500
+              - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500

-- 
2.51.0

