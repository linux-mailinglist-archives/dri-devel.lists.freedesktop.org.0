Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF1FC3D688
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 21:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B6C10E9D1;
	Thu,  6 Nov 2025 20:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5afhiqQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNc3DZ18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7C310E9D1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 20:50:53 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A6GsICw583748
 for <dri-devel@lists.freedesktop.org>; Thu, 6 Nov 2025 20:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JklyLBd5/oUcZvJnNYponAzGu3rNKVXLQXM2TLGaevg=; b=a5afhiqQiCsQ8dfr
 Mp8Y0fH7NKI8RRysFaLS8x1IMAJ/DnP1PJsuxRxk8Z8vFcpHyO66aMkD8zpv1I+g
 cywA51ht9ioWKBeetftcVui+txV9onEwFoNmLIqJzaRv5JyFoOo9OqNK1EYd90Gd
 xo39Mlp2XObBhp1aaBOAHexJ6mt8acpMnHnAG3kQClRZsrag45v9lX9YRC23MPFd
 15RCEUgMbSpoQoNhMB+/bwREyH7b4RrkuXbFOvJ3qYhFeV0CD0LgrYeNVs/QWIgm
 TdU65WFV+H51ibt31fCPjGw8IrTxxpXToHa9OBq2ALClv4iDE4Vt69CIgdHC5gTn
 Cqxnbw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yktgp3y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 20:50:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2956510d04cso563595ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 12:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762462252; x=1763067052;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JklyLBd5/oUcZvJnNYponAzGu3rNKVXLQXM2TLGaevg=;
 b=HNc3DZ18l/u2R209HyKkYBgRcBxnULao9uJVBdOBdNu3w7kOG538Hq31moGpVosIq7
 IEfdVNy58QZzt+xxlHQi6hEsLsMlnguSgmOcPhgkoPnCdOZXrZ1AUvJ5eVf5UWd2z+NR
 MdZvFQtZqlOpSlXV3AXCfqH1JYKC8WLVY56GHXfFhs3vqjPOSFMfNVUmfuFfR3tDhLpb
 8CdyKW9LXhQOEvbcPD6ILenr+uhzL9GzV2XAAn5Xj9Fi4ohQCDasAyHDBNOc6c9eUOBK
 V90efxMrN4fqDqlIRWCZLfCnpv/iGYcpO7VANu3OuIaA356qFXVi2t0NITyvIGPSs7KU
 XGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762462252; x=1763067052;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JklyLBd5/oUcZvJnNYponAzGu3rNKVXLQXM2TLGaevg=;
 b=dDjgkfJMKF7fLsDddDGldoaZZzi557d5CbCMWW/2VSIEn4XGIGiwD0j9buC2EwjtkU
 4V8ogzzyM8ClyYKDgHNfwrCtGciTWxVfAO2j+5cudW1ezf/RzmVwBS4PbGw2CwUjaiLw
 5LzoxY+1higETGwhIQH8dQ6cgL3C4WXCR4XgKEz6FqazGAAlGQwfzWJ1Az9pSIEJYtnB
 8/UNIaXv9U9lW8FLfe/6egxxstHGPzxYeNC41ENFCf3aRodpWP/Hq0vNQX6Lnp/ocI+L
 DrTN6AqoImYJeWsgeehWOMvyznwJ0RtmdAA2dTEnHIid66NjEVsOZjq1Br8TN6UDLxgb
 Mrcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEeOasvzqJQ/QtRKVe89eeHHkLeB975CzARVguVKVdXCv5p8NA2p1X085btE85o2nu4bMUonFt3F4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywxw8rKvvIjRLNEeMGFQErrT6n3aJ7PUpO7w9eYr8HuBK2e+6T3
 YgLcgitT/ZlfsIml5/yKYQzv+8vt2l2CsMeLfAvLZuiBYRdsJ7WyEbKGt8k9FAsf/cen/yU2zBB
 /pEusC9huPFBqKxz05F9ceK7ceSC6g7TidG3nMkEe0wwRGOsOZLP1rKm1AvP1+HJJSb4pmOc=
X-Gm-Gg: ASbGnctncuSH/T+P6lUzWDpWyBNdl7pia9mXSjLl52u7jP/A9xVOEk4kQtOxcoX0bsA
 O2XtDRZkLks2V8X1cW7azdW6Glh4rw8HN8FOzV7DU9wqsgspw9fQ4zw/5ky/1h0TTsZ8d5EKd3n
 xyI68E5SLVELFYcSfqY6OGOw34f64BUYLE0vIzyPHkDUNlb+NWlLyVWyzwFSapeBJZxlq5qIxbD
 UwWOPvMtMEad7IhYW2zL7Qm4Q0z01FIBNt/3OiOSDY5J4e05z/h+NfHonBou5DmIwfsv/I3PI5K
 Kphm7nM05k5b/UX72e0HYhHV1t9n2L2zh1cs3yr2OPevHZI6xu+/mEYoIgy+ROl5CShHeyPx2mm
 9P/5CCB3yQxc+CFH8svqFrZI=
X-Received: by 2002:a17:902:e786:b0:295:24ab:fb06 with SMTP id
 d9443c01a7336-297c0403118mr9270925ad.22.1762462252566; 
 Thu, 06 Nov 2025 12:50:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/5GGH8BRhaWtLEiTr4/i8IAaR0hxcNwnqgPpCZlj8O61OUi6laH3I2DVn0q8vR+8Qikezhw==
X-Received: by 2002:a17:902:e786:b0:295:24ab:fb06 with SMTP id
 d9443c01a7336-297c0403118mr9270625ad.22.1762462252069; 
 Thu, 06 Nov 2025 12:50:52 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651042c24sm37408815ad.50.2025.11.06.12.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 12:50:51 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 02:20:09 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: sm6150: add the GPU SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcs615-spin-2-v2-4-a2d7c4fbf6e6@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762462219; l=1700;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=jCpex1VaC1U4tzmGxxXkz708+oeE3vay/zj95FdtjfY=;
 b=zZhrunbbfOSaWlJXSQ/bRKMJIZYhHCqaCsTuyaWawpGpxSEo06tbWbI22J7d+o5CvfmfGlLZM
 MgBazqbn/JrA5e/9cbSm2KfOwLUJI57ISZbbPw+jn+9T6JZ1PGou7bf
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=bOgb4f+Z c=1 sm=1 tr=0 ts=690d0a2d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Qd8OTwLUrmNk7h6opE0A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: C5tOLxpoG0ZjLqXtxrgrSdi7nHto_TFl
X-Proofpoint-GUID: C5tOLxpoG0ZjLqXtxrgrSdi7nHto_TFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE2OSBTYWx0ZWRfX0FIdxjA1ZUa+
 LNn7AJ4ttS2rRwV0+PNXr6IegdYFTQ6xaHyJ6KEjUOSCA0zfJBiG4B8xhIJCGs8IwUWmE/i4ml6
 XJiXnzJvw5Rp0nHSexYnyeET0ksco5Gw1684Kwnbwaxp/Kqc14tF4e763HFhuofD5Gd2K5/Zs95
 NqUimRGFUEF2eXqZagWRj/vcw7khL/GRJqbU5EgmQfuw7ajCaUaurZtQuoK7TV1e9fk9Bir+kOS
 qeZnXaakyiI4+QiuMHutOTi9hPlE4tZyX7aidJbCwM+/HNWGlWLEbvTgKe2n5fP0TRSsIsvpFAR
 cIQx2x+TwNqVPXY4ojcPs9Z+tvGpKQ04KOR9uHN2X4xsmJrwRhU8J3oOck4gGbn5NteZUo4FMN8
 d25c17lc+zLxqy876Mf4fUUhybZf4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060169
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
index d1dbfa3bd81c..efb753ba1747 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1839,6 +1839,31 @@ gpucc: clock-controller@5090000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@50a0000 {
+			compatible = "qcom,qcs615-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x50a0000 0x0 0x10000>;
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

