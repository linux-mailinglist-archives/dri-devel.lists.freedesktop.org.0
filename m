Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9D4A65B2F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 18:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D1310E43F;
	Mon, 17 Mar 2025 17:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfmNeVzL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7330E10E43B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HH0Yw7019140
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GFn8jUQoU8QET0Q7Y2/H3zZJ8p6JHV7h1jOFwob8Aj4=; b=SfmNeVzLG4UDcuTC
 nRUsPCZJizAmFUG4D3puygisgNUP7p+B0pUrfLWbbfX8W9FdMbKA/cCciKm3WBle
 CJuqXf1wIP3+WLN5/lnAUVIih/QlCi99dXi05yceVM5waPktSUMfHQkNK/0CFdJR
 pshSteSDeh2HKpulRqtO15hcVejDj8+XwjEbRNZP/4pMEYcteOFrCTugS374Dd4h
 F/oHVMROom/3bqv72e1DzLwSZ69yFNRcFfJ6GLxhbnXEodRw76Y+N8CrLgiSGwGU
 VvA/49d1rumsOqdw+wdgIenthSV4T6rnXjRB8FW8WT5zAkaXoeKpXwxEUZ+AEHtr
 1B3S+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2u9wjgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-47693206f16so97741851cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742233494; x=1742838294;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFn8jUQoU8QET0Q7Y2/H3zZJ8p6JHV7h1jOFwob8Aj4=;
 b=Xx/BVjH6XjIcz2syNiuVTfn+vQokKvMIPWRYmaF15V3E+3f1yDAh5pue5aoCNZPUn8
 B6BrA4HAx2xWrv06YBnTPnITy4ul0oglZ/zJ0cxwfWkw/Rgyp68Ni5BANBzImOgL87Rj
 OJkf4ABQ4VnoZs1D+lEo+FjgRLdJ/LpDLcyrfjCmfOQZ9Et2B6mEPEZoQvlNyoZp95nS
 4X2+IfSns/8udaQe2hxdMoj/5iCUyuT8No2gawI9GTFcpIEo62zpEXViX0Q0kwM9N2xN
 Ee8Ed8jKqc4cFQKNHxnwzbNcBF4cpAI9/9mKqEq82XnkaYM2Z6CmdqhNcNlSANaEWIzA
 eJ7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5KwHxEvBJRH5ADYbDJvruGuXhldurRNCtUD44hwLgZ22+F5IGZLJxkNiXZoM0Q+vCMH0y2u0qx+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/Qta5bQc5jg14ReevJP88Qn66OiDY3sJColOQlFumQ1jGV6Q0
 FWS2Rhg87CsULQyh9OyxS/W1j9MYh+98zttHUCNkv8WYVczkpW2FjQGIJw9LvJGq8Gu2Rp1pOor
 73YiIGSJvVprr8aM1HYEGz4+7/DO7tqRhLp/BWFoqaFsaHnKxhsf3DObwkvfFB//+gO4=
X-Gm-Gg: ASbGncthlkROZYpE4z1GIO1HPkv/zjgTYPDzeSkDhiFbs7wJF+BFts6CsKd74LoNfsG
 Rkx9F93gPPO45TO7KDpopuyq/tb6tV0CSRpoi0ayq/IP2Tx6wWbZWivVB51f8h+IUG1yKRChaYK
 trB2UQmvNRCOGOaDt21l9KWx4wabcQeUeyl76nDrYPqbKYf8P+g7wYrDHbcMuJm9le87q4bll9j
 urkyUI2apvmbPw06v0bJO93/WaySjnLyTb3bvZKvGFaEwFif2g+phdnEX+IQohda/Zf+xcMHai5
 95ruylxuF8nwqB8hdvHlcCJhsstONhp4ewodHFDmDcj7V+3QNGyrb9OJi5SstRJyhpViIlwq9k9
 z6DdlLuzCHKzU0tW660y4F2ejC/0D
X-Received: by 2002:a05:622a:114b:b0:476:6215:eafc with SMTP id
 d75a77b69052e-476fc99009fmr8243241cf.22.1742233494504; 
 Mon, 17 Mar 2025 10:44:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx2iqeGGhoECD06EGgynljrm1UFU3tlDa0Y7tDDJEaoK3LeQgEoilub/oM8WSkmjHqhW0GDg==
X-Received: by 2002:a05:622a:114b:b0:476:6215:eafc with SMTP id
 d75a77b69052e-476fc99009fmr8242831cf.22.1742233494160; 
 Mon, 17 Mar 2025 10:44:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:44:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:38 +0200
Subject: [PATCH 3/9] dt-bindings: soc: qcom: add Smart Peripheral System
 Interrupt Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-3-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GGq/9ihy3yPuzqQSqDIFv8MiEa9/Oun5e7X6iSFdWZM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+GFIxO2iAYR/ha0nJwD2Eg1yX3HfVf70gE9
 iv5i7HiwYyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhgAKCRCLPIo+Aiko
 1S3ZCACUOskqPOEvLD+01HgOWPYEMTBKeOD3R8D5mw/V1g4VsuJsnarn4H9Wn4AS5RFONL1lwek
 ArrfaM0aKFgphWcaMu0v+84IJxdrqpynpdcxZDrDeUletCeEgDgh3Jqw/IHoqKqTzcksEsnwlgQ
 Kl5BGF4KL5oypxeoqSomLu+wfO+5Bihbdp5YygDCa6keiQ8FQr8sep9fQRASPw2SGtM9cMbUDV/
 3rRhy+mv6Lp0znl4g6MlbyFhDy0YcCxyCVXD4dqumtoX7Ck5anXlMjCnyNQRCa3nqltK16L3GHg
 2sUeDfKK1geSSi38zzbQA3vQseK4c9ri/3i6FkMudcyxOdvx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=JsfxrN4C c=1 sm=1 tr=0 ts=67d85f97 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=pxxQaWppw0d4f0HdsPoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: Y6ybOnlJYv6eEVLHg3cj-WRw2qfAuf4W
X-Proofpoint-ORIG-GUID: Y6ybOnlJYv6eEVLHg3cj-WRw2qfAuf4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503170128
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

Add schema to properly describe the SPS SIC block present on APQ8064 and
several similar platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,sps-sic.yaml | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,sps-sic.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,sps-sic.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ccacf6f45955177dd9302107e09897bfa2f1fd78
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sps-sic.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,sps-sic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Smart Peripheral System Interrupt Controller
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+  - Bjorn Andersson <andersson@kernel.org>
+
+description:
+  Smart Peripheral System (SPS) Interrupt Controller (SIC)
+
+properties:
+  compatible:
+    items:
+      - const: qcom,apq8064-sps-sic
+      - const: syscon
+
+  reg:
+    items:
+      - description: SPS SIC register block
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    interrupt-controller@12100000 {
+        compatible = "qcom,apq8064-sps-sic", "syscon";
+        reg = <0x12100000 0x10000>;
+    };
+...

-- 
2.39.5

