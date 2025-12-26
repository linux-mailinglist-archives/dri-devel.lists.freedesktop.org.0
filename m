Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A223CDEE5D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 19:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8391138D0;
	Fri, 26 Dec 2025 18:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDhoFWLr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RWt8l88D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7653B1138D0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:39 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BQ8baOe1280903
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iLMqK35C+dR60AHIbug7CKPTuNzYpTZ2FzC8crW1180=; b=eDhoFWLrvnuMW3w9
 sPfZEdSHS1rcznKAK6XZs4XlJr7l3y84E4TKul05KiZGZfLZ+gRVdYWdibV5iRzU
 /qHsJ209Wcmvb8RFsg6+95CwvputmH9QHjvuDlSGk19aHAkXYHq6udx1ouR2XkA1
 c3sVbZ9XibdyeR8NH0afoLLoUjjGWW3va/QtkR8Wr4LIBOAz+Q6kuKX61BArDva+
 3ez0YtH/EEMpdqK/1c6KKwJ46oizO59jtmTjM7NpH4EA5k+s6i8pxeKUoCaW7lUV
 AfkSYDXcW7Vrm6Qe/b6uz0VbmgtdA6uK7HFt4ZAghuO8HPKWquYejHp2IvQAVzpA
 hAKA/Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8p4946us-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-34cc88eca7eso13443323a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 10:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766773837; x=1767378637;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iLMqK35C+dR60AHIbug7CKPTuNzYpTZ2FzC8crW1180=;
 b=RWt8l88DB+pHIlTI9ZkbJ9CE4ZaaG2lbLCq+RC9ZP/yJzEOTzIK6lk9LTUZU9myI3Q
 tU+7gVkzna6a2I4zVdLjEqHHjpELhtT/MauZijNS2fQU7CzwtsT6dD7C33ikwpOWpNWX
 +PzJjzMYbD4Y/M+1VO7QRLnBN0OKJm3xstfVDY8GPMWMy7ibkTQ7OD2n1ECq9uy7tUD9
 dXnJUqblCxMrdG0RSQQZ0Yr5iaMwc6Wc4KKdLj/59wilwuVhhrsj8AyqAkR+Jb6sEVaH
 at7DgQ+HIxAFqs4mMAnd7DNzzVuJi48XsCVKoj3ooD/8h5elG9hWIgO56C7jiXFCQH6q
 7vVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766773837; x=1767378637;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iLMqK35C+dR60AHIbug7CKPTuNzYpTZ2FzC8crW1180=;
 b=Q7EcMSxxYmdEffihycbkQkaLZw7R1xROrqU4ugCbhJJHit6k6doWU2fBjOhc2DYRbE
 DhY6lgMLfLo5xC0Truu/Js2QwecTtP8YzQHscQdVE1TzL7G85ADgEULD8OnYWEYDSigJ
 3PeKGey3eRUqcRFFQLde5gtlFyN6Vqco6qBI3AF/TNqjKKeEZWOItV6VrC6Rj0vaMkJ6
 K+pi9PeOihKx3VjzTxXBEJLVqQHW5itb/8SnEFwvmH76tmT1NFauyP6/pHntycJKbBWR
 YYhpTLNR8OFwpK8XZBYxwo6AnEwJ0rZtjkt4q6R/FFl5X+EeZXt1Tp4JAuNmJdWCAzop
 F8yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmHV6GT/e31ciculKej/FbeqBafc/GkGNnSk/cO1Bdy1hzBdFY3W9TaNgSo7jipSRoYmOf5fqM2Gk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFRvvOPAcWTFqo7eo4g0xGBNHpfeyU0BKKsSARL7cN8Rjv7AVU
 N8S8QGIMVCrBQxevA7rsZYDdEW22dqS+ctdbQVtVLFu3lsvRYQC0PFTEcqe7jzW19s3/SDRezDW
 PF5uEntOu4q0Dn3F7v++PcdnJMinqRMK8qI81RTp1eVrawXK5JgowI5KsxGEWtn5dLWkLHzU=
X-Gm-Gg: AY/fxX4yUFM3uHASD/9Hp4M4qMsVLAvBuXSXr9E6Yu4iUP3a3wmcosBMq+vugQ9npwd
 A6PvwGw0cqOaE+koUk5zG5fNDdR8WKs7xp1N4anRMjGOnqRDjPCrJhUf2/LpyV5enfCTOOTNUjt
 w1rxKgvL4aU+tJf29ltsQW09jS9bA9hzy78BTf7opdPelSwjk2O5GI/Nxvp4okPTo7MzRsbFK4c
 KEWeeAog0BWkLq9zBdVnnUgI9qGh3jJV83Pc5uIRY5hCAnChxP4XUILsMEmxKnXXKcXjMswDAY9
 L2Ik/uGnXB+T+MHIsjvQr82PPw1H/wAuOHTt8RLt6hc4lheGZ54DA4b8N5/AbTr5eMMQI07jh0b
 AjIP4EJ29dN21w6BEIk9av6yp0GK4a+QgHw==
X-Received: by 2002:a17:90b:1f8c:b0:349:2936:7f4 with SMTP id
 98e67ed59e1d1-34e921bc5c1mr16998339a91.32.1766773837501; 
 Fri, 26 Dec 2025 10:30:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFCeBec7usnCBPRH+O6WbKp3l1RV/SJThZBsXXh8hbrcv30ZbUEuCs40uGVVH5XrP2GCRLxw==
X-Received: by 2002:a17:90b:1f8c:b0:349:2936:7f4 with SMTP id
 98e67ed59e1d1-34e921bc5c1mr16998309a91.32.1766773837002; 
 Fri, 26 Dec 2025 10:30:37 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 10:30:36 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:38 +0530
Subject: [PATCH v5 5/8] arm64: dts: qcom: talos: add the GPU SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-5-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=1883;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2e4aIsMrv8wEM6ceXRSjS3zZllPcce04PIqo558zTus=;
 b=Ok6YZ0IgC3WjZySGRqilNB03bycUfgsjJt6Fp+1a2TMg6htzSYrvw+pfuahwFYPVnAqmgvaIL
 j7KuWIZZ8vLBtFX4eFRYJ8ekUIdi5mbSwUsT5L1Y7tNNYATh0X99Bbb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: HbCtEO7AetMPsc2SmEobMK9plbH-iPuT
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=694ed44e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Qd8OTwLUrmNk7h6opE0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX615Fo3TGH2vB
 OOQstaX7zF1C9kjPFyqPt98Ho+zVM4oyXLzf1W1T6NP9NcTct8DL34x1sCAf5I0eO/GaMaufJay
 SJpsEqb/n5dtY10UFG5xT6NNTahkRwLBQOE01qdtRsXED0CPLpzLiHBug1ylQ6g5YmHa3klqGps
 XLKKxhCfQsJai/TUEFgh5jDIQ+sgsEXjTWJ3KlRa1LrHSuK/sbf4ncNHB1wjusPX2Kjn3JYOCES
 V/GEYthQlEFKNPupsgsYmBvVw93ArqPgFAE8P3i0VL047dKDIrbvTARhEgAmmJKyA/f40dLyXSX
 mTbfm/OVJ9Zz/2l02MpdHcWFBPoPXQ5hEcUKhWqGesDgqtFE1sSPlezP3dEL4tH2dh0MjZWM+Sa
 zZBHhvmF3Jk7PomKfkI8wg8M1Bu/qpYkg/qoc5w5qR5Wf3iY+yZZFEuV2NwgWCHpU+Hrhkymcky
 NLk1DjLelBTOocNIRnw==
X-Proofpoint-GUID: HbCtEO7AetMPsc2SmEobMK9plbH-iPuT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260173
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

Add the Adreno GPU SMMU node for Talos chipset.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index d1dbfa3bd81c3d999bd79fc92ad85312c2f83087..743c840e496d70133bf82928e9e0c3da9653a5ee 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1839,6 +1839,31 @@ gpucc: clock-controller@5090000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@50a0000 {
+			compatible = "qcom,qcs615-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x050a0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+			clock-names = "mem",
+				      "hlos",
+				      "iface";
+			power-domains = <&gpucc CX_GDSC>;
+			dma-coherent;
+		};
+
 		stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x06002000 0x0 0x1000>,

-- 
2.51.0

