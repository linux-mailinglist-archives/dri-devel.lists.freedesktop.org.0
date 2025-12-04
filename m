Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35172CA3C9C
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A19C10E97C;
	Thu,  4 Dec 2025 13:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IC+W9tsQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KM+KFCJD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4E610E97E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:22:52 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4AErQG1358023
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 13:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iLMqK35C+dR60AHIbug7CKPTuNzYpTZ2FzC8crW1180=; b=IC+W9tsQVLKJgbMC
 U+K/x8m2GZJKWHjprGsSosgz5U+M5Tdenyu4KZoi3OFLidGAqG8uKaTab2vc/JX7
 BPPKBcksmiY1pnTNkckkGZljv1L4Z1F8rsAIJR9XvJ7cbhmdIVSzPeRPdF+45pWS
 qQppMLQ8zdDy2zxT/UORj8c9BplqZkmDbLmrKD+96t8U4eUK25DuUbBKljQMn/7H
 ts4yUwG6alCxxdtJGk6TN/4bV9Hn69gI6EtCbMDn9axn1dT1o/n8fis63h8Ae+hF
 V1oAj3oATG3Td/eFyKXVKJh0oZwIaFME8X6Ch1DxUWM7+x/paeOgBSpq3G+2IVZq
 FgSc6Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au5yc1233-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 13:22:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3436d81a532so1737494a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 05:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764854570; x=1765459370;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iLMqK35C+dR60AHIbug7CKPTuNzYpTZ2FzC8crW1180=;
 b=KM+KFCJDN+WtUfZGbZuyJ5ihOkQlGdyY+fF07AEw1PvpkojdPOrEJ21Pw+5QBLHK4e
 hFxXIwTKwvN9gC5xOdF9pAHi6VmQdIanuWNG5pNo038c/egOx6cmWp65mgbfIMHXfemT
 EaYtwHkSS8xcdnX/74rnVySz7Oj/jHNnw3j2olDG7DtJvg3GYWL+4dncTn/iNLsfkYlC
 hrKi3MgPbFm3Eo+ltV6igsi5l49h48kp9LoqnHgtMkoFvSBxooXgts+Jr9A/MCWEtJeQ
 1HWjRfZ4sG8dECq08tuQOcojvAMn0woffxt44Fp0a0UUteaO4ukGponyJJEuE8J+R2lH
 2Acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764854570; x=1765459370;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iLMqK35C+dR60AHIbug7CKPTuNzYpTZ2FzC8crW1180=;
 b=S9dVk1OntKYxWSZeePl0N6jYGFpNAviiBqGDBHGRjRRFbl0poCdQyVuVmFfBd76TAT
 vHdCGqSg31jU7110zTnbmmTlSQ51lDfREKmPuyUCAJPJuUevNAyxTtKgpaRDGtbNXDh0
 zjiRmHyAqldSxwZPxAsGOaOHZwGAoxQGrc+0EVodwu2nWFzcTh8KegPBy5aBdDWOzuCI
 CugrnhHsHMv4wU0OjocOBZUZq899clvdYTa5GjPAzVLIKrji8ew2IHtlsPjETt6oJsJp
 GGhnVZuuSivlIlywmc1jd9Z4nKHnd1fGMNGRJ26zpHOs9EKCPdSAnF8HFDpgzvYo/Y0o
 jK/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3Kc0qsG9oJyWoT4Q5KFuSM00AQBxnHjSqLtu/W2GobCgfM+DRFNKx56Sg94jQoUj0emn2ci7kbQI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqowE7cz1DK+9hwRRY9YcU87NGIEWw3//KWNSlK1PQ5WoJnorS
 cXNEDDuBa63lp8Fhf1eJMg+2rspQ3TO+vw3hnDPZcH1CB/2mdlA3ONP6Jao5AoUYoTfwRrvALen
 evLCtiqIfRuB8278jn4MwoJM+7S0LC5CzqqmxQAjltG0HgZo8HDziSUjUtuOdRnp1zoLRP+8=
X-Gm-Gg: ASbGncvqe3FaKIWk3zIhX0OYrdU2MHfuw+f8Iy54pYvMjYwLbszRVj36mNtY+PX+UOx
 qXX27VthY6IQx8AlJIKlVgd3JiRzV/DgWZ+isf3+iDAgJf3Is0m3RYC9SoVx0GmSZg5tA4S4b6T
 FZN0JIusDbhnZ4mm5isqZUMmtH8ucy6qtsIrEfRTPuGkvAxOJyn3M5aFoGSaNYAyyL1nNeALxdY
 p8bX1hCy8N2XdNHK21khdquX7l3uaoIhSzIiM5e+qIo69dH1VixcWtuJ8M158ZZCFa4l18zTjzq
 mf6pPazuTl8kysBqsLsKDmzXrymddEQ5vA6gv/hC57edDEUtt95MMW14lvshEyPu0g9JI/x96Ga
 gqPoCImeKbPiR8BTzzY5WYyPQQfZpwtUFWw==
X-Received: by 2002:a17:90b:3cd0:b0:341:c964:126c with SMTP id
 98e67ed59e1d1-34912700bc4mr6077380a91.34.1764854570444; 
 Thu, 04 Dec 2025 05:22:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEh01/zQdZWO0c0uGJ0YnHgcKVlHn+84iAf4aVPFwPeP63O1lsuk3YdL878RrKAHZMnIUBSA==
X-Received: by 2002:a17:90b:3cd0:b0:341:c964:126c with SMTP id
 98e67ed59e1d1-34912700bc4mr6077340a91.34.1764854569965; 
 Thu, 04 Dec 2025 05:22:49 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:22:49 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:51:57 +0530
Subject: [PATCH v4 5/8] arm64: dts: qcom: talos: add the GPU SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcs615-spin-2-v4-5-f5a00c5b663f@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=1883;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2e4aIsMrv8wEM6ceXRSjS3zZllPcce04PIqo558zTus=;
 b=8nQzJmd2UyI3dys6WU9XU8ch+rIY78MAySAwC8LPXSKeSa2YjquKSRMeuTCz99ZCv3OrHNhbR
 UZQpFOUUK/gBqx57swD5k+9UVzxWkYE4JhAiMfQ8BqVjPtp9Fp+Scen
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=QstTHFyd c=1 sm=1 tr=0 ts=69318b2b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Qd8OTwLUrmNk7h6opE0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EzxjtZfTnpPB7VZbKidjBOLGCOLXeR7c
X-Proofpoint-GUID: EzxjtZfTnpPB7VZbKidjBOLGCOLXeR7c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX7MzY8Nj0wj0z
 b1V/HwxQF6FkagIhvhb0KYm/oKYskXrVGdEDjG6mZM14XV8Z72b8ilV9jzS1CEWffVd3nEAbiX0
 hurSgIis7YX6QdQX6FxzjOfRxWH7pIANlSy//nULu4pONDDSFM31YvMIIqyybNPuev2ApXYoLaQ
 qVrKs1fIDgov3yYLmlWZSV2YzQtZX+HSVSD8WtBKlB0uf/9+qvPqURTdefxrtHyatQhCwSoLIMp
 NLCdWrMkahfYFhHfyjLtnYGHyb8hhASjjxvv6q9scqrV+YLluDb3bzFbsbkq479HcUA/xl30gsr
 fNv5eTC3yyjexiTbc+t3EcVebCXHRmT3nsyEIswdAdrtfXCaAK9RhdDPKqNDxio1RdZa/rf1oi5
 bnldcQ+6PzI757jibTOGZB0unLBChQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040108
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

