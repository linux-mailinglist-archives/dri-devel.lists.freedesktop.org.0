Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028F7AA93A6
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 14:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104A110E0E2;
	Mon,  5 May 2025 12:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E87ZQ87h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D5810E0E2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 12:56:30 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545C9AAj012766
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 12:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Yx8I7F3zA+c4m8GPgjqvko
 /AJSMyut0JZ3vjW9UhZwM=; b=E87ZQ87hv7xX6OPSgRUfPO6yIJ4E5kxlqLT4Sn
 6ujigKnYo+sVDlqOTW3IvOCfW4m9z/souJWwRQjLuaXHG/fO/l2G1zAzhbMlVSv6
 TpEOFPJX7F+GXxXvVWA/1WUCILJzyry0HP0j8wMUVCRMxsMp1/45eV8u+kyjDidK
 7RVV5W6+Bj9BbzQEIQ441QAe9Un60i2vlxcylx65nZDLKa+u0CCPuTGtWxhrBBTa
 zT/2sMyjd/qMBMx1oHuK9/OQmkc4Vb2a6n3XvilqDD7ZAWt7D6D4WpKi7lrqrTBL
 3vZMuZpJdvD7NPFZyW3OONzyLS/kDRc1mXiI+OhxWTmoDsww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc5c4j6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 12:56:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7caef20a528so12276485a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 05:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746449788; x=1747054588;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yx8I7F3zA+c4m8GPgjqvko/AJSMyut0JZ3vjW9UhZwM=;
 b=WeE3EABhsxRs8GXZmnOR2YaD+JjPkdDZ+VKXwIHgdCLs76hNyjXPNW6i7dRNnHuVXa
 tRoBfIi8F0n6pSyfjKL1F08x2x3rpDS8/ENiycVtN5NomFZxQ8LqvxWKkT9CNqAWsEEA
 ih14yqLN0BSaAD9e3SIEwEsfi0TSSkNmy04QC9zSyUuuy80HTBEy7i9nTlM7uj7FDa0U
 082qrKyhMe4XvJEf1WvqIHZGoTayguHPfE6jaRVzhzm7NJINxX7zKZ/d/xgd9qACCogI
 SbsdndDh7DT0SH98d5C+J0KLMHAz6pHe9zrlpj+WBOSC8hl2Czve4bm7NZpIOiBQQiEA
 elxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgag64sNocIR5hJMHN2yas6K+FV1JPpouL5gzsb3VylMHXRgdCDMDSk+VlkMpJ/XA3lJ+EvDiSGl8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3Im+8rJy1DgpTD4CrsY9q5CG2MeUO5MyN86T5rmoHRBbnToOW
 L2PkBauycFvyYcWf1HL3dDmH89eHvLS5qyGBhCJAnH5kfNp19YozDcfsbBsSK1uQ346XjCVGoT0
 X+324wd2UL0QBH/1rgm3ZrZEW0dT5Rddm+sNGeMtCmKPIr2GU6fhwR+8phe6cpIsLMmQ=
X-Gm-Gg: ASbGncsY0NDv3Lfm3l+HHZCBpqkcdzDvyVvYJo6f0+hAXHuHMN1fV3d9u0SscRXmGST
 Psylg6eQwmdn5GZRWne89o/js+6p1BghZGatkAmTeD7Y2+thwlhaKlog8pJApTDuCVrKFNNrnlu
 YRL7xil5pUstLKjTC+96wQGXiSfBlOiRpJnhZx+gtjTojgGRcJohbE0hJbh7q1ul90e457A5Lsk
 bZgcuCHAu0IknshfYyqNh9pf4KKxzNZjxbgUUFwUEyjZIpIAvGZLQ91/F+8yZFDlUph/wHybIvP
 CxepIIcAVj6SyEXNAURRvM5CXghR+zvmSyfKBZciYghb6zKsSPwojn8+p+W6fT4+KM8NQObuR4P
 Tufb12gf/cia5LO9AL1imhRUh
X-Received: by 2002:a05:620a:1b88:b0:7c7:a591:4f9b with SMTP id
 af79cd13be357-7cae3aa5a5bmr1019367185a.28.1746449788371; 
 Mon, 05 May 2025 05:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVnz0VSsChWmtLFd0TbCjT26/PuhzQw8bWC7FJekrb1rVivPVLn7kfFNV6k6QoTcFkEIEWxA==
X-Received: by 2002:a05:620a:1b88:b0:7c7:a591:4f9b with SMTP id
 af79cd13be357-7cae3aa5a5bmr1019364485a.28.1746449788060; 
 Mon, 05 May 2025 05:56:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f67besm1703548e87.216.2025.05.05.05.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 05:56:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 15:56:26 +0300
Subject: [PATCH] dt-bindings: display: msm: correct example in SM8350 MDSS
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-sm8350-fix-example-v1-1-36d5d9ccba66@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHm1GGgC/x2MUQqAIBAFrxL73YJpQnWV6MN0q4WsUAghuntLz
 NcwvPdApsSUYageSHRz5vMQaeoK/OaOlZCDOGilrRIwx85YhQsXpOLitRPaPrRBh5l8Z0CGVyL
 J/+k4ve8HS5NoJWQAAAA=
X-Change-ID: 20250505-sm8350-fix-example-59d4d2dbec83
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2133;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+k0XtWiufKi+HAuE72FtHRSUamE0fY4Yy0h5tdy9BA8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGLV6TPK3nlTt22KAyPNsNoOsKLryrYDkJC/yX
 Rfhwg1E9wqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBi1egAKCRCLPIo+Aiko
 1fILB/48klaKFAKUl+9nxSAJSO7grQUrLslNCHvvYped85r/HERNOKp1ug7kLWcRLEqf8d3jfWw
 OoGFHc/JtdzwjCJzyIiq56pHhi1wl/Lb6gS2GH7YZJ7BUCKtacR65z+jzC2jBOQb7evISnRwEwT
 AxifcNlE9NKXmMWPChUiwFY34+i5NqeK8NM4X1VUqzwTyqimsqb2Qa4UK1NoBbxWJB3sDPeZm7O
 pIjILi8sRri6UN1ehdfahrxZTYoSqoh+NfHaQ8nyhMfq/8Vtl+7fvHlchZ5GBGPZQbnJpiVCKjt
 nWZtnR2I5jEbd8OWSiOv+AQDKs7CVfWn59Nbv6pi6l+M+yno
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: RsJ7lozkdJpPafHHX7IimCqY4e6jKOuk
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=6818b57d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=l3D6BZmRyASzocT8P0oA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: RsJ7lozkdJpPafHHX7IimCqY4e6jKOuk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEyNCBTYWx0ZWRfX7308HD6UvLoE
 qYsEoHI50G/EOYKe36wKaoZSxJBql4RHt2GjYNhAathxu6FMsTTaRjdJBTOXnxEdv0qO1sJ95Z5
 hksvzj3jNZ4Eqw3dYH2CYb1QpG39tAI8syDkxBfE3GRfH4HKptwbmWRKmawQChetswb2jSUo4nz
 vBRXbEGIiQgSTy0f78esUGrqn97lpQLrhIcdZA6VAg5wc8qIwJy2FTx6x9Fs6g/6foilCY7ppSY
 ZPSVq1SHl9ju3G+uwHe9UHnOsa7yyp+slP68Idxk4TjaT58NewkDSmqYAdtA55UL5mWTXDPnCg1
 sc1uVhpZgPGXVfH08u2003w1mZhdwWpUjU0ur5Oiy/xKUsUuxjWv5/HrDcOW+mLUMT5EqpG6qwf
 0zdb0fIlZmsggtqPKQaOms9pPxBJiynIFwq6J3+sZ716IiQtC5hctIvhnM/ZVsDPVp1YOZ1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050124
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

Fix the interconnects in the example to follow the schema changes.

Fixes: 60b8d3a2365a ("dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc path")
Reported-by: Rob Herring <robh@kernel.org>
Closes: http://lore.kernel.org/r/CAL_JsqKr8Xd8uxFzE0YJTyD+V6N++VV8SX-GB5Xt0_BKkeoGUQ@mail.gmail.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml          | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 3733d8cd2ae07597952ebdc1d74edda330173ef6..68176de854b36b9d5e31bce2753c468b569989b3 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -92,6 +92,7 @@ examples:
     #include <dt-bindings/clock/qcom,gcc-sm8350.h>
     #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interconnect/qcom,sm8350.h>
     #include <dt-bindings/power/qcom,rpmhpd.h>
 
@@ -101,8 +102,10 @@ examples:
         reg-names = "mdss";
 
         interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
-                        <&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>;
-        interconnect-names = "mdp0-mem", "mdp1-mem";
+                        <&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>,
+                        <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+        interconnect-names = "mdp0-mem", "mdp1-mem", "cpu-cfg";
 
         power-domains = <&dispcc MDSS_GDSC>;
         resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;

---
base-commit: db76003ade5953d4a83c2bdc6e15c2d1c33e7350
change-id: 20250505-sm8350-fix-example-59d4d2dbec83

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

