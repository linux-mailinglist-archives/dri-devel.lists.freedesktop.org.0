Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4FDC5A9A5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD9210E97F;
	Thu, 13 Nov 2025 23:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThXyaQTD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TZL41TXo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E8510E97D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:32:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMacK41484502
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=; b=ThXyaQTDJPqOcpAb
 1tEkPU6On/laF1l3L7aoaFM6DzJ0yGYot74k9fRZpKoFQ9jOpKf+ce9rvXeL8nXC
 Jl3z7rn14ut8dTx0fKahmsGm6xSazPsfYpmZCsw/J8CqgPizB6jlxTNGOVbwtv3o
 GpgA6+7Id2RZ10O6s9GbGLpPE0IYh/f5F/T79qhql/yUkYl92xyAd9nVpvw/FT/W
 kq9Kw/rN6m0YqrkxiYBGdnddkNctuWrY0WmfZwbamQYVuhOHo867Iil/qJOhs6hG
 fHGf7RKjzmdeHDHtO5h9yooAHvlEGBi/rXyRpnYtuQlKvtbVtmVhBITOsp9ImlN1
 Ww9ijQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9cg4d3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:32:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29846a9efa5so34550375ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076736; x=1763681536;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=;
 b=TZL41TXom5/ymdkD03+6YM+eChUrRdNdX8NfWZ3MyEY3b60VzwQLZd9dtvgzDA9qtY
 AFGmPdfa/+Zu6ckW25nrW0Ts4ptG92h5tUtFsMA3BCML2jg5poEJGD0j5kqc14diDq16
 2sjCQXU0vYk0e5s+mOhwZusDaSFuw6cvG7zgtioT4OtDvhDPfPAXMN/0WieYY8K/dKJg
 TGh/69QLm0OfjyCJYwZMoOrWUxpm2Y8954M++qboC/FKVrbo0L7O5GvFVYV848EEL6bm
 cGsMtZnnY7wrZXu2ZRZzakXB1eTJ5F3qa2NSyV57P4J5CSAwkcyfOBWs1mk6TpiMfU78
 Ctpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076736; x=1763681536;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=;
 b=JmZpMnGFo0WW1jFLZQ3tnVC6QN/gjXNTPSm4tXsiAqoszZNPy2JEES2i3NXVogYdjz
 1rjm4x6Ibrs4xz4qEWqUgwz4DCjg/m0DObtcXw4Q0mYSQ47hIUCtg4vYvq8/FHxrrJj4
 4HLSn3msoCzuQEVMsrI5UmJBpxQr5RD1lasXyb9hfdFg9p+ZDdpi+v4TIhU9sjTvj5oe
 zuEYVUKPYtSkr5HvsO79MR3A9Xdf5GcNlmGyZwdhY/NGDUlj1YEbZ1en40TwjnYSSjk5
 4J995TsmXQxrC4oiq6r1a+TKuXNLNPiSHWCzS9wurRPVvosNUg4RTu/mPKggNodPt0V+
 sa+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFq/6CVMX1GVcBDIT7H86/0B7oyCRJyGKLmiEfpc8G6fRVqRksaKHdwpXzzPIHTmLlbIYvNGdDPe4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxY7ejvqj/Ombayk4IEr5eh+VeG4ILyxtxZ/zUT35Y7WMyAtWH
 8cW1opQB8YuCWhU2JlLpIyNBh7rECgl0liyzmO/TXKVR55VQZPaGdbjcREVP1OHRfIiG6c0MMyx
 173kecYsTQOEsdkNx3dpsE3bAJFeK00cO2yYwBisalEixOJ5SlCBzHK+nYmRUHstn8X5DEhM=
X-Gm-Gg: ASbGncuNO792G2TLK1Vm1JxlRCs+L5lqgXNhcGZMZVnj1ijHm3IVgcLWDMmoDhckzWu
 5TRf0fYL8HSAF72DctEvpAAGHw7mx6yE2+EINhiCDI9vK2fz+UVKdtIFFn9vDjn9IWR9Bv/Ewsn
 NiAxAdE+QfEj5GBjsD0RJnJr/YrwWCF4Y3y75iNiLLFJan1y3McOHkiIyyWuMJMs7MIcfzrEjmR
 R3I0ctfpUO0AdGlaFp7SY4QHgOpKES+OCdhlGZNUNFZbL0ukCB18VTSWyjmJdz0+0bq2DxSImS7
 sMHdepzKCBgrS8OkJuzrHyjQo1DuhC7kdl1pdjhG47m6s0OWrpdKviCAL2gP2g7Jl4H4BDgLReC
 t5EpLNFxEoztUIj+9mkJmD2s=
X-Received: by 2002:a17:903:90d:b0:297:d951:b4bb with SMTP id
 d9443c01a7336-2986a7435ecmr7356195ad.47.1763076735711; 
 Thu, 13 Nov 2025 15:32:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEodQqYgRJkYLIy60kg92PboSbyAXwzBxQKHsvJ7k9auT4mdj7T3WB7cWTBc3Q78iQHPbKACg==
X-Received: by 2002:a17:903:90d:b0:297:d951:b4bb with SMTP id
 d9443c01a7336-2986a7435ecmr7355695ad.47.1763076735212; 
 Thu, 13 Nov 2025 15:32:15 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:32:14 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:17 +0530
Subject: [PATCH v3 20/20] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-20-92300c7ec8ff@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=1677;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=DBrZfc4GPezP/e0loWuAe+68GknA5/X9CxqWpGUm6+w=;
 b=VcSmbJTK+AwALI8XC93AXkctqWpbKLucIhitRFtg+TnNd7qWT/+mcPon0M8DxlJ+BMR8C3A3A
 P4jrORXACVYDIs9gVsH1RAPyI2NIJ+HFj6zCe6e8XrFttR2KeLzGgOY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: KJuJKk0A5ONJO-EAq97HlReMKuIZhtnf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX/Jf4Bq0gCh0B
 maiqnLgt5RWx5yTIrPcyU5YnqiZFXslJLcP8rjIPvCi2GjoSsoKduLPPzGdn9se5/9SLIlSqnih
 Fjp4/xfzAkj4oTF2Hf7i/ArI+rY7z4tIUFnopzo3fncfi1WlTExfHW5VKkmDx/1C7ajdNlW2loM
 sCJ2eJ8jwlZkIo9c6gcj5/VZ6KQVigo6Wg4PMx8QCj4WoHq+RcdpaLyz/fmxzjZSuy5n/l86rMN
 J+xGAjU5S66Zjx9k/mlUkT7EuNjT55048SWyJj5V5Vql2DZx3GNEdOfrWiojADoA73mjG7sD3xR
 4v0C1RXhqAsz6ukG0MAJu4X6hoE44UBVnWMLoySuPGTbmCEzv7TbmNJzRhDq9iOIvsD9phi40h/
 FDw2IkF/j8h38D6y1AY0UCMhHyfH/w==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=69166a80 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_Uo5JhhLEGw40-SN2AoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KJuJKk0A5ONJO-EAq97HlReMKuIZhtnf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
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

Document Adreno X2-85 GMU found in Glymur chipsets in the
dt-binding specification. It is very similar to Adreno 840
GMU with the additional requirement of RSCC HUB clock.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 2ef8fd7e9f52..e32056ae0f5d 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -327,6 +327,36 @@ allOf:
             - const: memnoc
             - const: hub
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-x285.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+            - description: GMU RSCC HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: hub
+            - const: rscc
+
   - if:
       properties:
         compatible:

-- 
2.51.0

