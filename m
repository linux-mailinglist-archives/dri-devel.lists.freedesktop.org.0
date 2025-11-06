Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8BEC3D673
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 21:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED9410E9CE;
	Thu,  6 Nov 2025 20:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtOdaP1z";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SuSWlP14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D220A10E9D1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 20:50:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A6HUbsK643003
 for <dri-devel@lists.freedesktop.org>; Thu, 6 Nov 2025 20:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kDesZG6/CED7jpvXL9qrzM0XoMxGJBuAq541n0vQcxU=; b=XtOdaP1ze6xKX7i0
 eBD5QWTU9T3sjzWofXLkxcJ+ApO0ZPmgQ0PGELA4dS+vYNfTqMX5OjinCX8JqUAq
 mRXuD+eEqs043Qbq3hBLlIJGpu4NYoxJB9Mhz3nbQyTEpBWoGg60aBBIdLCzkzHy
 IDHHzV1wh2n3g4faKIR/RsohZQLZD8wjeKD23Gq85mIdObkaTibXu19wN2N7ezSY
 7d8mreGji8iJe54hzB2Y7XI9qNJUgr8Hfq1xHmSWyucWYytERjyW+rZ1/cZbix4A
 1IoaxaSHcyQLwLyScyaPiv/G3K6gI0xjIuavXd7gaBCzDQHKzS6BkQu8ZxKlKZdX
 LBMBqg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a904v0j6u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 20:50:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2953deecdaeso953785ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 12:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762462240; x=1763067040;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kDesZG6/CED7jpvXL9qrzM0XoMxGJBuAq541n0vQcxU=;
 b=SuSWlP14oScmcvN0t6eQRRnksec7jfKZe2oxOJnChcpZifV2qbj906jcMqHpPw/y/s
 ZmFIaPiD9fPDXbIBu/ko1n9ja/FwQCYPNKuY4Lx7nmVUrbgucBMpjCFxui7IX8gy1Urk
 ab8mmMSQ8xgFNpu9wS+rLfY7Mro/ktYXcUU0tDNfJpKXwkFPDRHPtxN8oQQC/6RI7//K
 iqiCinSMaGUWUPkoqg2GVO2RcVDNl+rWmnuioW8F/L9ssOXt3Y6HhgfC+ToCO9clEjQq
 Ti8w3Qtj3BUrELbQP5FoV9PqVMCfMfNt0Wz5CpK7l/g6xPT/EsMYvLN2EfIpRR8QlPot
 D/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762462240; x=1763067040;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kDesZG6/CED7jpvXL9qrzM0XoMxGJBuAq541n0vQcxU=;
 b=LB4NZdj5Y5Sq/tktHoJ5dvzW0dyEnPIlwRTCU4D952fGG2XYaSlZci4QEyjWjLKPEH
 O0qPT4n6E2E5BUth/0FbGjzM+Qk1M3ei7RCw8HsBR0CmOvkWl/7ZXk7XGEnwP1qOp4LN
 gY0iNVIfcYqkIQEfUYeS/wIJ2tF7O7d15kpertSTZWe95c8eKUI1PkL8o5cIeJk/Dawz
 EMTipjresoh6NGF+J1vE4yWdEKZgtsHP72r8yNxGmITx9ZR/5/+/2l+RAEyucjgfOHtr
 YqBHoHkVMJhqBTBpA7SSvgEsCWPjrJiAX4t87xZPJqLtUhLiWXlP2bnCsqzuIK8tFxjN
 GJDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+VOTV2JlKyhBOK+nD8yow3tN0FEQqo/VmW0OvOVjdqgbYNBZxQjAPO5y2x3kJOyFmb+gS2uHEh/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoG9Y+eIFh1uPHCMfdaMhqUIepHpJXqPZmi56a28iHhUiFfp0P
 fdVUllKTMAnX8KHOwmd3I6eSU/sZLjIsnzyzxWEnxwf4UcYiQFSNDRGZAg63CqNI4PzGTRvJmss
 mXx3mpnZuAOMetm7cOJOGkKctcRoLmCRHYxyP46UYLw1+JAOFyVpovK0ylbPSSXG1NtIELjA=
X-Gm-Gg: ASbGncu9XU1d/omJ49pp1hJTNT9PMtC2VWENAB7lMq1JA5GfcvzJpTMTurgLX8qDpmd
 lfJJLQuGawPxboxtxBx52rGlT283kwK6hZ4XL/THxxA1tgqHQGvU/m0RetK7YkKHaupNhhw5FTT
 pRW+HXOCzJ2C8UwemtJEWKxxo+YOBvlC6osNDQ2tjPQeq/UX0EnglfGUfyVWI+5fJxeCc/pqULf
 FciCrzxs5sR2GOnh9Ml+CSl3fzeFGOIkOHF4uultYTrjGena+ya073i1avka8pCRhfvSgQ7YZQK
 CEXaYq5B4VAXQNdn/iw9w8wzG+mbp830B8ahUPjRd4eoMK307koKUe0eQJYTbRCC1QIaSCCLtxE
 K7iZecRr8nGjIAi1JdjrSQA0=
X-Received: by 2002:a17:903:388c:b0:269:b30c:c9b8 with SMTP id
 d9443c01a7336-297c048bd5dmr11177065ad.56.1762462239688; 
 Thu, 06 Nov 2025 12:50:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyqMq8oXPm8KMRuVdssx8T94PXld7l7/+iih8jTurPLCDECgsDxR6DM0VmHaPkbu7+iLvRXA==
X-Received: by 2002:a17:903:388c:b0:269:b30c:c9b8 with SMTP id
 d9443c01a7336-297c048bd5dmr11176685ad.56.1762462239212; 
 Thu, 06 Nov 2025 12:50:39 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651042c24sm37408815ad.50.2025.11.06.12.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 12:50:38 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 02:20:07 +0530
Subject: [PATCH v2 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcs615-spin-2-v2-2-a2d7c4fbf6e6@oss.qualcomm.com>
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762462219; l=1701;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=b0JC/QgVlb4XEDG4RFGS7AL+H2pQv9eCGoSbRQd2CRY=;
 b=IKm+r3bn2wtvdU7Ru1WSakT8tsBkihaAlI1fqDLfI5tHULp8KMfKJydUyzPZSO1P/88hnE2Kw
 n3DkKJtDyIrD8yP8C6E86emtqqvf092kuBf5b9O/wH4WNLv5DoyJMho
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=RMK+3oi+ c=1 sm=1 tr=0 ts=690d0a20 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SkoZtctDx9gcCqASqUMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: mdSt0TOf4hGPBPwrcwQvel7gkHrFkIgT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE2OSBTYWx0ZWRfX8N+v+Cp4mO1V
 cN5eSjl75EuQHK6FBE1E27+jizuDOuXwGxSwamqAB99EJgSAV7P0ZdLnocS8WsJRJKavdHhEqfO
 oOn3YWauIfalo6XriUXCx+RWDXuBqlOAc4Xna/tLh82btK1MznuibljX473NXFmb2xGill/v+b+
 nfzGXY1t9oE7pcOKghtcgkFM1iDxJAObSdmGLu+68OgE+ynjKIzdFUCK81CSSlxjSsMvLXKmdp9
 hXhbxWcCQezq3kSCpki/cgF1TbSodw8CUisYTXh79w95t8gXIBqkGyttP3EnjAv6zin3veFA9UO
 LASduwa/MTrKWc8FUyXWgugs9fdbpGYTt5IzUDv0qnOFHETnWBwKbeoYDEtj3OIm21A3Fm5Ckin
 DMVvzZ/buqGP1+5fNzzJv0QKZjny+w==
X-Proofpoint-GUID: mdSt0TOf4hGPBPwrcwQvel7gkHrFkIgT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
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

A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
which replaces GMU. But it doesn't do clock or voltage scaling. So we
need the gpu core clock in the GPU node along with the power domain to
do clock and voltage scaling from the kernel. Update the bindings to
describe this GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 32 ++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 826aafdcc20b..a6bbc88e6a24 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -45,11 +45,11 @@ properties:
           - const: amd,imageon
 
   clocks:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   reg:
@@ -387,6 +387,34 @@ allOf:
       required:
         - clocks
         - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-612.0
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GPU Core clock
+
+        clock-names:
+          items:
+            - const: core
+
+        reg:
+          items:
+            - description: GPU Reg memory
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+
+      required:
+        - clocks
+        - clock-names
+
     else:
       if:
         properties:

-- 
2.51.0

