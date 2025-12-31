Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C2BCEB949
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 09:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8251410E99B;
	Wed, 31 Dec 2025 08:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pF+YKv56";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/bT/7bs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D973810E99E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:21 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BUMcW411701189
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z9uVV8hUF4H/djwv9vyhMlIx9KwoZJhi1N9BMP7GhX8=; b=pF+YKv56ovktUjvj
 PlUNGOK64hhPbgzgKXiF5urL0QklA8wFFLw9Y5pRN75aa+nRIafbKlYoObaDjWaI
 57tpbOZCuLL7nrYY5PYj0m/wANvLrxFX21s9kEGEsYAqz2WvlCVw5PgRR3RRksGx
 TIs9biLwcCKlwln5PM1mHatDuNq27QHSrBG2H6IdGKfUiODyegqcPHvUlypeHEln
 whYfvZlFKU7yzn5hpRDSv8DhmUqcdcRLmiTAdC8X2flHeXFOgJSzzBnCwMDW6jsI
 QmbWrvchACityEqTAAyG/9+uVDbJ4C/0YVpAIrYmJxDsX4116waHUd3LekiNn20W
 AHqc6w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0vdky1w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7dd05696910so15889231b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 00:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767170780; x=1767775580;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z9uVV8hUF4H/djwv9vyhMlIx9KwoZJhi1N9BMP7GhX8=;
 b=Z/bT/7bs1nvouXmTvyEgvq2+PgaG0+PlMWpFsxgd3O2Jhxjg9KslI8SRfpBzlUbNEJ
 KUaFHJncjfZPW/bI4wZTGq+N7xqSm3nJu/9CN1u06gze1RwVPIzIA0xcW1uof5+dYF55
 a6z8SqSgQyDhhin6GMVkA1kNlETsYTarpmOWud3r+/AGo7FjDRTMINcQhAynio5stun0
 cHGltE8swQVhAMXkZbn8HMZ4SzWJ59AloUVFW9BhAoo7XFLpETueLF3ZbVHvdgnIOKGV
 XnATa0117WHNNlsXacrEERF+Y0p7uIswsO0JkOJ+PF/49jq5+t2zXJ6dCrswxf/Gyhdv
 0pTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767170780; x=1767775580;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z9uVV8hUF4H/djwv9vyhMlIx9KwoZJhi1N9BMP7GhX8=;
 b=CX/YeOguTOU9ejUjiDUjEI0yUIvoGcUFfOKPsdtAmaj4I1KsJHec4IQ70tOL7KHbyk
 rxdIN40Ex2UOPwfjx6uNlfrUi0bSqhhTxcK3sTg6q5rGaA3t2afWYm4FCT/B+TkxQaLn
 iFZCYsvRAhpLWLGrqtigro1GqSn2uPNw0JR7rPGY5M447E+C7BjLxzC092Gs41TQTFJY
 EeLHS57ntEVRD7tPqA3DF4Scxxf++nPzpUW0NyDIMjf49jNBkjKJEoKWj+v+hDpchWT1
 p27vyvTJtddmIyxTJ3tb+z0Y+IfijR/Zj4y9gwBxkl4dEfdjVZh/B0flj5nNloymjKEl
 AVJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMpYPR1HDjdv5g84JSTJJsyEm87w9/gm9FS18f06Yyr5hX6EqH9g/Q/RAqcAB4iMIp/VjWs1KXPT4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRBu5sfuLL6aS7jRh1sZ14872KhG7YlYLXJEGmuiw1qQI4lKT/
 oBfWCmJiPaAQTUVoqNn/ig+uGmbiP72J0k6MRiPkmANfMVvWEnYkuyKfMFUsWoiMbpUOsIa8gs6
 QDu1HKrsC/CGDC3i3szlKuawbmKWIIZKHiZAdVt0A66rHM5zwABj2F952+OwLsXUAllKEPyo=
X-Gm-Gg: AY/fxX7MLeZNI8EBQqiVcTwj70qxkzs7RcchDpSbftOHh2o4oQlvzQIruJlahahXeyH
 56Z9X2YfvfHyHImfRGc9WbWTWiXk1THSxv9bCYtpQQ9goadglX1ZgaEaXdzagnVTWukrL/pdrtv
 P0o8OJfI+Mq/HggyJ/sfx6F/UQh32RzfJAKDKMG8+sYJ1P6HndyIg77vJ51/UeGUChHfazUYgDd
 v0se9/ssjqgAaEVtzqcjG2TAZY04PMUtaxpA/zeRdbmPyAJiBxb/FsazqPUweYdWNLJucjb6Kqv
 /k0G7NsJ7dTD34shDvR4kqNa0qv62YHU0RPlo3Z2ZlLIUpDIINig9yP++8zH66AuTUhRSWdSTNH
 +g/aOdHrj5+tINPDAtdw4MrsqBWGgFgh6mA==
X-Received: by 2002:a05:6a20:6a06:b0:366:19c9:b6b6 with SMTP id
 adf61e73a8af0-376a7eed348mr34371660637.11.1767170779925; 
 Wed, 31 Dec 2025 00:46:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4+U2IkeBbX1/HcdXdKHMw6H4Izq1KXCINrxp8/XdIyrK9NSakGnoGoG6MHo680vuefgtD9A==
X-Received: by 2002:a05:6a20:6a06:b0:366:19c9:b6b6 with SMTP id
 adf61e73a8af0-376a7eed348mr34371636637.11.1767170779449; 
 Wed, 31 Dec 2025 00:46:19 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 00:46:19 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:26 +0530
Subject: [PATCH v6 5/8] arm64: dts: qcom: talos: add the GPU SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-5-da87debf6883@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=1827;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=yR8XbebGeiFEFUR19ke6y8GDTrPRoDL3ArbsouLBA+c=;
 b=gVetoMqRIqng8C/NpS/bZq3/41+ll+ihCsglRNgtftrruiHgsQEU8Ud2tMG8XCMpraLa4gaQp
 j/6cnOmAKzLCZ0aEKk/XzX6/CpW0DEzrPav/DrV8M3Lif69rf1ryTy/
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=6954e2dc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Qd8OTwLUrmNk7h6opE0A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NSBTYWx0ZWRfX2Ak4sAChPcyi
 otPIQ31KE2KqIkoFQF2LxDXSIODqCqaG83UxIadk+1qIVkXojIpUatXSadjwVU/3Uh94T+5Kc+M
 JtRtQGNSzhhGqz9yjlaua8Eolyq/yTwHPuuHS+NNAuG1tciaidf03eo0XmYP1Y2vD3sjEADHVtL
 jW/DKx1q+7PMqP2g06kaBZ1Qx8/JUgih0LePSP+DmTvOJNd232a2s8SM5MJA7tmVE8es91xNQsb
 ORFv10IlgctVPwAC2Z5+nRh762VEuuHrxuLqpS3DTyy5FWjbbGVvaPELHYrTP4Os7fXqA2d0jIh
 wIajwe/7N6u1KMb6hJSMUCP3GtnWbbm/3ci5wvto03nkWda0DtC7903j8XXMTrjYSw7q2S98LMw
 QJSVt1iD2fFVAvQIbinbQTGYPSasLB6H/Jz/hX/LEQPzfhMO1JFa6C1sAod70kPR2j/ohw2QCwd
 +TiPi6c8Y55s2S/bmsg==
X-Proofpoint-GUID: vIyJk9Krtzd1fgN-D3_2U3-_FbUHD0g-
X-Proofpoint-ORIG-GUID: vIyJk9Krtzd1fgN-D3_2U3-_FbUHD0g-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310075
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
index d1dbfa3bd81c..743c840e496d 100644
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

