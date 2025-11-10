Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BDBC480B5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D7810E49C;
	Mon, 10 Nov 2025 16:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgXgnG+V";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7Hn+W+h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA79210E498
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:59 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AACMvlg3306807
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EKz5Fgcl8FFI+imxbIKOoJpuYhVpSnaRPpvrLUXLF5M=; b=FgXgnG+VzrNfD9Uu
 xxzWXTo+ysFP0KjKvm6Xc6apvKNGStrOzzMefelUuFcVtLxfr9PvT2dWIMPgxqaQ
 U4WcLBlhpmt68iEvng1m3nv7vfD4oz5HDLg9+cpyQATHFvM0ajH2IO8+pwYiBU8x
 shlQcv95904PwuvG5m441HI0euahNHLueZfwxhCgqrQF419Z4gS44D+GqEJ/kTNQ
 5ytx/8zFy3+4p+u/DseLySE5IHJuWqivxKA5QZFSEAD1WzDwBCshHpkd635YbuV1
 XW0a8phzd6Qtmims2BEq0F08BhNRXIY4f1kznhbGaHXewKtIcl32Rcm7sD6cASrW
 +qu/4Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abg0q8s1m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34385d7c4a7so1499288a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792859; x=1763397659;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EKz5Fgcl8FFI+imxbIKOoJpuYhVpSnaRPpvrLUXLF5M=;
 b=c7Hn+W+h+p1hXdjdaFwx3uUOAaFxLPQQjG+wRJPEKmRuyFC75PDuMgy7I2iM6nY1FK
 3bvCcsg/pvcmBPtmXTDm14m+S68cDGuunoiGhVAXrx4XX6QMFBauiCs63bBwIwnRS1Ku
 5gxvrfijBYXBA0hVpCKA++UiQYSMZKnI19U80VSmDGbwISEb7dKcWmc80dk6ldix+ZE7
 xs8wj1C9bIEADuO2QL/UF7zAvTPEXRwuwuK16YzGUx9+2lEnAKhrYSnjV3CbUTnRkcX/
 V4wb6/2zWNCflziXQBxmg2ieuQjwo0eM88X89bplISqWQ9TMxj9wL8Qa/C1b7443OBSW
 Tc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792859; x=1763397659;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EKz5Fgcl8FFI+imxbIKOoJpuYhVpSnaRPpvrLUXLF5M=;
 b=YcKUHl5sXGM2t053wu0j0Ti1d9vF58QCD5GfPT4rOyNQlCJ8c95ZWY76H9HN3uK0iL
 A5eMO77PrWwFsiO4ipCueMznDuloGvx5q+ay2wbL3A5+Nu81raCUt6owlDzL1C8ndKXU
 7HEQHR3Yr/2lm0Hk+AiPJubxaNaNu9Qnv7ukZBfit/XlFeyvAq9vW3NXq2N5UWM2dHg9
 9EqmSoqtjPPgfva6u1YADEcZG+EYl0tb+qtUeTylgftCykzhrhYOT36Ms+QSdlxozy3R
 yzORZk2G9g7c6iEVsfWyduuxcgIKp7Wjw0o94QdNOnMRc4ngkqKT1QOAyfbErd5nYgI4
 rCjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8I416T2+fSWgWmH3VmazxxkqhNG3JvFmlh7nGNb/HC8nQpYQBfsrHvAy+ps4Codq5nZmlDsWK4HM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHzVQBOcT4BB+MYb544nn6u3+aYkypEhIF0NqsyfPIjTQOCKtx
 fhuhoWfKtcwMBOtnDZJOit7Y8ShqNSM+d+oRkzOFjy6yBDCL2sXoLqeviq0BaFMs7EF9xboBwFW
 orxNIz+hkaq3PcBN9jYAUyE21PP5Oal38jbF/Zi1fQMnSKLYAFUJKezeYqRodv4ctk4Ic83I=
X-Gm-Gg: ASbGnct6SG5mqBKMoTLJ0jrDqtNc8AJh+s8m7O+ZDOKByvfqDRlu0qZs+M0aTJdMKiG
 H8E2Ks0Zn0OWtdz3JZv2BGXlDTYOGXom7bEJJu+JEexbqn1F04jmDUxLUau+CFFMUQmeR0mAtof
 HXhTO62u6/5dqiRh7NIHuxY/CowLisRkyyhrf5j6O9e18/eg0Vcu8Xga+Eihd3tacvJlCIkR96J
 gKXCNTkGW3z7DI7mdBEnndUWtcQi5tI6hfxvyms/GMR8Z5UJDVElrsBbawH7GsgUhB8cVnpf/vP
 y7Bw3nRfgfTGUrSwqg17Afcx6In3idp/ZbPmMv5dJlU35xTozzeeqdAJ2t3UBM0KTKlA/RhazGK
 Pr/SsYntTMQVcAGGpIsI4+pE=
X-Received: by 2002:a17:90b:584f:b0:32e:23c9:6f41 with SMTP id
 98e67ed59e1d1-343bf0dd563mr21179a91.5.1762792858797; 
 Mon, 10 Nov 2025 08:40:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsAhzrL6dTTOmOA8ktM0ipxOyHiZ+nRx48w6MNOFL+Ma4SpEDRNwXEivWpIkv/T67KRQIZmQ==
X-Received: by 2002:a17:90b:584f:b0:32e:23c9:6f41 with SMTP id
 98e67ed59e1d1-343bf0dd563mr21137a91.5.1762792858269; 
 Mon, 10 Nov 2025 08:40:58 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:40:57 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:27 +0530
Subject: [PATCH v2 21/21] dt-bindings: arm-smmu: Add Glymur GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-21-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=866;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NgXP4H+ytjNcrx+o8ALLRhAZOLvOHraz88+cU8xEoFc=;
 b=P3JYEELDaQNqYHCNPT773ZPurLRY8irSH7D1ka8EbWy70v55a6s41XQrylNdFsIAiMGUQAHcM
 5oLMZZUY5xHBkdCRkIlYhXjOp0JiK+QgZQn+OMA4B0khnaxj4bei+c3
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=D6JK6/Rj c=1 sm=1 tr=0 ts=6912159b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-Mh53b5kj-Vf1dIxLVYA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX3eAYS+j8C35n
 I/ct973MeG/RuCrhJEzVBWcZn9O6zduM3EhQU1K8nfXgLZkhEBuPkS2S80xojErkYIh2fCOxFzN
 MzqtthGaF+EQVDgITbD2hHuZu4cJqCJpSR9T5Bunt7LtizMsbAwiMhdJeekhRS7+ZAWhYLbZL9b
 l/hXKcUbLxxUxLIYMpnVyFvWpS07JKoSr19rW3aabtJR9qHuzhxOr4GnlM/d1pJ3TJYas8J+3E3
 hPXMEbtT356U1bMRyZITYh0TiUue2TDWF32arZoVxgjuqbiUNb6nKKeiCpAk+0TCHMUP34ijz0T
 /rO4vIZWQ+OX8K6of/wbZYjbobwNE1L2KatXKR4rk7eWFCbyUpCyq4OxonorJ/dIm9yEPLgYZvb
 pOszAvIVO3uGrNrhrEY6Sk3LXrVxaw==
X-Proofpoint-GUID: tGlhaGluHj7xYiGhEuR8WhaYzCP9XtkB
X-Proofpoint-ORIG-GUID: tGlhaGluHj7xYiGhEuR8WhaYzCP9XtkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
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

Update the devicetree bindings to support the gpu smmu present in
the Glymur chipset.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 14a9624e3819..cdbd23b5c08c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -91,6 +91,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,glymur-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500

-- 
2.51.0

