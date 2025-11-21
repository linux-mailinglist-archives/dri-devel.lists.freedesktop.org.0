Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6ABC7BCC9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 22:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29E910E911;
	Fri, 21 Nov 2025 21:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMkboF2t";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JALwJjbU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49EB10E90D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:53:14 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALKGgIl2841291
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C++Ck3QiPhN+92mnBp3XqzRipz5mKGMRJKWvsp0grh4=; b=UMkboF2tU3ETn8lN
 nPMtlUUtQ3CPiD++oyx5WNmHcZ7iziouB3aEygZg1sIoNjhFx0RZ+7lfk8kWWxZb
 HKps+MjbkmUcX9BKM7DhygghHy6mBjDEjAytCB858ziDEFXxQ78zXhaGNJauOLTf
 yK3PXWgDO7JRBN2NJ9CzealL0nx0CBlxnexiqDI/7/22RIn8eslp6xeU851sugpk
 Fx1Cv+VMlW61y8nf6EN91XADBFKiIbIZInhvXJjKOzYcDjSZtHzukOlfMv4jCi/p
 dQaXBvuFRRB0AjcEY2OZpM/ZL0u7p6qgDRQyXCERA8/Ueg75fW/32qAARkoimi3F
 q1D5uQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkvk27m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:53:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7ba9c366057so7624087b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763761993; x=1764366793;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=C++Ck3QiPhN+92mnBp3XqzRipz5mKGMRJKWvsp0grh4=;
 b=JALwJjbUPWqoCMR6sKD1kW9WpvZdnkAvUNZ5ZHWfhqC5228TKHYES43+LlX+kONIJD
 7Y5/aeiL2uttsli78W62+3WQNwtvqTRb4+qfAn1+4FJLCigeZ2XtTzJbEyg04WhxFxfs
 1dudj1kT/+swdhuqpG/RNua8E+42S6JXkBP3oBPlsM1d5AA/EZAqejsz2GsZOjKqTh5s
 ABZI1cEKoeWRGv/djJ08YQnUc8O7TghK66dLVr5JF2dNM7/rXySUOap/LwqNzjUQpXGK
 fleUhotpmFxOOEu2UOeMK56ZuAMxx5vpG2PYDLtn/u7d0jQy6FlRDvQ4FF4H1s4UzmHy
 EI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763761993; x=1764366793;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=C++Ck3QiPhN+92mnBp3XqzRipz5mKGMRJKWvsp0grh4=;
 b=c/mS+M2kqdPctDtWhy70cjMZExdsA6O69F80RiCI9IcqmYNUL6zGNUqNyWtdAuwSIJ
 jOwmuLUGM+JodjdBq3Nm/3Z759dFwoWIdWH74zCgQvmS1r20jwN0wf8DcywgrGh+oa5r
 ebuRq7Lb6cVwi6r126dQWC8XxELBQAAWOOaAk2Kk4WohZhyb7hZ/Cnb2wi7K88fF91cO
 zWQX69dGdD3/wrg7bQkRJoqff4OKwst84o5SH016uHB/wR+R+bxwju//mTR2R4b0ZQ2g
 0ue1PGaRddrs0NuErw5qjHYCITzyplgh6PW+yLyiYIaTUCx+awd+IkxQW/dl41VQ6FFJ
 QBnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhjJu3iH+PVGEtEJXS+KfY9MPJcHb+N9DQ1Ri4D3JSl7x4jFzJSnaow8xY04r0ZbNH0Y4MJXZJuQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3Rb+dSaE73bd9NLyL6B6lhnmWWHU1bEYo1xeWm4Z3ufc/5dJP
 fnWyql8vh4rTIP0sSLcAqS5kHbfgWa3qj3BcWSSqrSqKWuwD87DOsP1vufYDBoZK9jic8jqf3yC
 aarMmiQCEsuTbUFh5IZ9zw+x7LScHR6qzYzlec1E1KAGz7zduDS/rGd3Dib24mELk563cUOw=
X-Gm-Gg: ASbGncsvn6hb8Drn4jLBw67FOD+0DrP6FaMc9SaIv1DCf0Xm4nD7Nlu2IblhUB7x+mj
 O0daPY9Fddig9khEQhsgfJgQzqBCB2wllgUxViEqg5sNCqfs/8ts1INaGAjZwm6VzPJFD4xReBS
 l9r0oQ6uq8fKLoD7rTBUkf6Yhz/P3nQDMAFN57VJZGK0AvoDrO05Lo8o8LwiRH+5E6JyQkos0JS
 cKabLkqok4E36uJtVot+MTAXLvWYXEdUpAI8/6N5nf4nhpVf7F4phVT+T8H+6HjDVZU9bhS/ZxH
 XV7OvJWGF+OXSLDF36ILTcNh5cFRfjQhwN3bNFGS4yuMEdXuhI5upbvV/uCayc2Kc8Fs0UQDEBC
 RmQYKrMHCZ0y2+gdNj4t3i7aQiWS8IJ7F0Q==
X-Received: by 2002:a05:6a20:1596:b0:35b:e098:42fe with SMTP id
 adf61e73a8af0-3614eb3a120mr4909379637.6.1763761992746; 
 Fri, 21 Nov 2025 13:53:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHel9VjK0hlrCsYwX71G6pPYZS3DsaIQ1B0GJFJuMZYDTwoTJ7IdYj5PwGX5bxa+GpGp3Y9Uw==
X-Received: by 2002:a05:6a20:1596:b0:35b:e098:42fe with SMTP id
 adf61e73a8af0-3614eb3a120mr4909352637.6.1763761992281; 
 Fri, 21 Nov 2025 13:53:12 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bd75def6314sm6399270a12.7.2025.11.21.13.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 13:53:11 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 03:22:18 +0530
Subject: [PATCH v3 4/6] arm64: dts: qcom: sm6150: add the GPU SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-qcs615-spin-2-v3-4-9f4d4c87f51d@oss.qualcomm.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
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
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763761959; l=1701;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=UIWXJaF/I2TkjJEvJvGJBMliE84S4GBBvxZcEnNxOE8=;
 b=i3qwYLnnDbCE4CPscGGlllWiMbV0OEHy5QtOFPTMkPdydEJgJ7y54nJjKH6eNGhV6JMR/XULS
 DI2Ovv2xulbAhmTfzj9SvHD2soxY8gUi3yH0Xe1xdLMGQR/yH9c0BK1
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: D0kdkXSlFc9diRuhqAXqb9-kUByU-_DA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE2NyBTYWx0ZWRfX0fzw3LzsxFoz
 1Dqbb7QE0Pg7pzyWnFD74h/pXasP5mlD5e89Ts36wKXFSHF0e545g1lyrm7NZq3+mDbdWqCsVjd
 0WIPv4icFeyN6IdQ/GcWqTkYwWunExeowE3IJ/Zc+OTM78nNsumgOEIdHOQUpbmuISqsHMdqgg4
 kTa7h58tzo+2oQbEhrvo0MFDxbIJpeVhj2xDgvRM1SFxCAiif/BB7dkdqzjn0CLIjp2P6z0AVtX
 GuuvWrXtVNgGtqbZVqbD7Z/J2UAlPU3+p4I3lFAmq8hVcMvCp3F4TBDkcsizplBNWe+vA1epnPm
 7/8PHc5s/Iw8xN3FZxb8TBNiobC+CMK2DP5TKPwIqknfc+scfAOZ6oWr1gBLaQiUjsuVKxo5J33
 ohjbwkyjNo7NJ8z0OnGaZNOBJv3cUQ==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=6920df49 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Qd8OTwLUrmNk7h6opE0A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: D0kdkXSlFc9diRuhqAXqb9-kUByU-_DA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210167
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
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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

