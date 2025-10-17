Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E76CBEB004
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 19:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A806010ECAD;
	Fri, 17 Oct 2025 17:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwzT3dgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4596810ECAD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:24 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HGjnjk001722
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 63hqcsOArDpXHsB1zZ0JWMY/vZLAfDdRjASdl3K+gzE=; b=OwzT3dgMYIBGJkgP
 ryQIdBp+caDt5nzx3XIkgHp1hCfFQwl1kfS3JAr3L3XlVOhkjZStgvJ9I4WFTLq3
 MrUzDzYx5q0Sf26VCE02q+ed5hNPIWeX2nx0XX6lLfLOtbwpK/qRSWxVgmtBfDUF
 rHdLZUxXeqYv2ecVyaMs3WVzaekwkaPc385sL4JLHTUsam8raUD53oF3jCiDjWK1
 hDRlJvSmOUDNyC+ApOgFn36kAODfgt4ZwXIHEhLGUUekGV+Cs4KUSl9KaDSbPWGk
 juAleLdbXDSqd/5mUVJwpxyr46+lwjynr0qcMCODXG4yj5Wl8LTJlJ+1id8oP7ZO
 7Xi4gA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd9d5jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2909daa65f2so25529275ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 10:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760720963; x=1761325763;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=63hqcsOArDpXHsB1zZ0JWMY/vZLAfDdRjASdl3K+gzE=;
 b=WcSP73/JBFxtfgRc4bHAk/bo+MmA2kibMguvCVqd/JcouxgX+O7ml7A6+lNJDhxSRF
 Hbb6zLwLXkgNd++I0DjgTUb+kweT0zupBa0DLwxzxXdU/zEzH6zfSgLX3K4h1o4P+uVd
 Wvxp7xoytWtb2Xfg1L+Wzn/ebt0s2sjb8quJtbKYksXfhMfTYybMZmUAngda88pVMIAY
 HYA/flz8oXTOWn8yFZJ/RD4xx63vnMUgb7/pVQKnnamnwUEt8/5aw9Ex2VKTT2H68u2F
 F4cN3Jk9N5gd+3NLG8lrTvyuJ2xPir92zv+0fSaD2ocOtaJnT/9yNif+H228RgaWqVts
 +dkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq8jPv411yZVmFsmo2eGezR7fqSXyDnJyS1q9/f66vW5gx3OUghdtsA3ma6BJgiiWcoa6RurWal9k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXwvU12ieZaOUmqTVhlVp1/rzndJL51vB2oCIsItZmH9evXkwm
 l+Lx+7aCb+mCAECkup28NzpworadKWbLoDBhTKcUfFnWoucItg7A+EwA1gKNd6sThYa1WO1SiFw
 cZcKU4J7bOiak1zM/s7xI2i2aU2qmZHhZZU+VkiKdJLJ47yarlxNe+BFnwsC0GLD6tS4DY0E=
X-Gm-Gg: ASbGncs/fkmJ0uAUlSi1zl/ADBNg9yiuGQ3dSS3X6vTH4MP3wDgw2Le4o/Cnn1MLC+K
 puCALtiAGjVsgE32LlWTHnUWaxmT4VaffDKlNjMLwH0Av/89qtvtRSRX04MND4R7fPkE2SFUi3s
 ZqtYlLbHPlafx6SHR/nxV+UHhxOR5XL7rQBLQARU1poVBnp7jEHV5KdHyOLTNJKntnuQWjgGkUH
 jN7wMJGbsleOV2C+FETX2ipwYsIuwag5qEJjV+tz8E3Kpbs2fZRfwo6okrs4uSsUC73b7ZDZGPW
 Xj5fiyHMiwh8fqNuru4EZPb+K0806oepRXtKalqJL13ukN/Fr7XtJ9vK7En3w9+PWMpam1L8Bz+
 ypc4F3m3su6i7OI3FgQThJQ0=
X-Received: by 2002:a17:903:18a:b0:271:fa2d:534c with SMTP id
 d9443c01a7336-290c73ffa25mr53353595ad.22.1760720962664; 
 Fri, 17 Oct 2025 10:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB96UCLwEK3jUShTQzV0gUnk3hW5K3A/BrffKQ/0gKgmFt7/wcKFMWQ893/dLgxL2buboOqw==
X-Received: by 2002:a17:903:18a:b0:271:fa2d:534c with SMTP id
 d9443c01a7336-290c73ffa25mr53352965ad.22.1760720962044; 
 Fri, 17 Oct 2025 10:09:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471febc6sm173625ad.86.2025.10.17.10.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 10:09:21 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 22:38:32 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: qcs615: add the GPU SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-qcs615-spin-2-v1-4-0baa44f80905@oss.qualcomm.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>, Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760720932; l=1765;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=5mbhq+gWS8F7DvY1Msh9SObG+ekXua8QpbuDfASaubg=;
 b=yY3kyUZ+SDP38eprTVxszruPd/GBMnCdvG3qN4R2sdzMWA96T4wUw4IkFr/sYy0WJkwQXVthq
 NP4NVlnlLygBIS75BYf5huDjqCUnykEwnPihfxWH0sC9BJg17NyTa70
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: N5L3fusSzXMofyJ66A7QSdXEm_ufqJ3y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX2DC5sVdv51Am
 swMIl/30tvsBTNDUh6csVU09t40mgopDZDM1ZXLQ/UgYyYdf6wm5dSiyPdA6PJqPlUQuH32WUVA
 D0/LsHEgkttajGzrwBe1Ufb2w/329tHm0+rdJ56wp7WoPjApIN+i+ody4IPJSv2SiP/AvSJxgdm
 UvkFICaZ/N90TISZu2LGAqL3W4ByjAbWHv4pNpGdKxuEjAGgdbIuf1MjPMWacbhZGdaY2jOVFvo
 2w1Y80yzTs0pT3oSztPG2C7vjWncFhB/FUlcPIsmOytsz3gSO7x0AkE9yGEHzyFEJzFP3or7AA6
 d8wLLxQa4GAXAa09gzE3NUrBt6gIhEJNGbGYD6wZL6hhN7gtIQ9CKKKuB/rWTy10mwkLmysSYm/
 WNctpCho1ELL8DU5MXoJXyEH0Ic5vg==
X-Proofpoint-GUID: N5L3fusSzXMofyJ66A7QSdXEm_ufqJ3y
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68f27843 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Qd8OTwLUrmNk7h6opE0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Add the Adreno GPU SMMU node for QCS615 platform.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index 3d2a1cb02b628a5db7ca14bea784429be5a020f9..e62b062c543657b6fd8f9aba7ad595855d8134d6 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -1700,6 +1700,33 @@ gpucc: clock-controller@5090000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@50a0000 {
+			compatible = "qcom,qcs615-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x50a0000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			dma-coherent;
+
+			power-domains = <&gpucc CX_GDSC>;
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+			clock-names = "mem",
+				      "hlos",
+				      "iface";
+
+			interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x06002000 0x0 0x1000>,

-- 
2.51.0

