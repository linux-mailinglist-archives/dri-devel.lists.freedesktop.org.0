Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41CEA65B2D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 18:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D44F10E43A;
	Mon, 17 Mar 2025 17:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PAPAce49";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF3A10E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H9aPTL002276
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gkl6eCmRuyDLWawoZFLZ9C1YgB9c1AFZt2R9KV8uAUk=; b=PAPAce49r6m/dx1o
 gOOuGj4sVr3R7poy0Oh8gllfRrNCw9k0EK0d9O0jPTx6opekgaE9U4n85FLkvWTF
 RFV+lznhDsUjOvelGP1CeyEbiC15GH7FCoqOvyPCbsqrx+hhgK0cbdAVNDFAzDFY
 olaXqNBcuWyFR1TYYEXYsypQhUeXfPebHOuN/UNCzUAy0wyoMFVhe7H756fxfRbk
 A6qi6SLdk9kWqS5qqIeGowTElQPWSZbVd2t1nHVqG9gkzEuA79QgMKOFx13prxqb
 GIyRC1JxIo4h37z8kGxmfTbgPfz8eD7HTY9z8097h1TGoLlPSKalV4BmMfCvxcYy
 HPBoEg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1x7wg96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4768a1420b6so92402141cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742233491; x=1742838291;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkl6eCmRuyDLWawoZFLZ9C1YgB9c1AFZt2R9KV8uAUk=;
 b=uW5Tms/GzyAXnrOkR7nIYPVdDOadyni1v24LswmhXxUGtHIlE7nJAh1zKyzgmmKwt+
 M0gLFl4dul9pCF0xx3lRAclAFXoLhMAsKspLdO1LeG3wDDZ184Ccf2smEgIWKSypJOYL
 rzMKy3DG4c33PnApFK2Dt0kuvSt0Af59K3zUsSd77S1f2EkmK/Oecnu37HJQmS0ilEHm
 Len5oXU1/oM3nRhSSRCLwd0zyY8/+Q4q4SeXCeqVUpUfIj96Yb703MerGcEDi0KdG9z3
 NKbKMBzJhJmi2+mFZlUo4AnmjHubN8vS4+M4BXLwxAZ3bBz1Hz/+AZC5e6Anuu2uFB5G
 Hrkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpCh2LdNFAMh89MfAKDF3N1wOdKKcD8xu23PJN35XUQescu7JBKJLX8V/cTDC9QVDWmItIidui9Ig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFO/C1wjIwQzk2+NfSzAKOw+3SlgwXXACzpNAXte89Czm9mR6T
 anGAs5Q+bU1O4QCJPWCQK+vUs70PEP/NcFZ6WRFJodqf6Np6IjkcGXmmYv2uLSbTFRjmxrc0BZv
 hHDP2yq6ChAqdJxHn7GEyswmyU9hhYblnmdePjahvn4Gb/wseNELz4Nx1GNMYk14MaX8=
X-Gm-Gg: ASbGncvK9G82CRY3Wcuc8rM733VFsn71YdeS97aTSIL9a39lyw5GXHLMVyZ/ThxnGWU
 gmw/fipLwI3xhIfaU8uYIDPOdoak3C1ayA4Iw2HqeBQbiavjmt4nYmx6u3SqIILVIugoOeVEUV7
 ArGs/dUgxmxcU4Z5MOeB4zD0F8pfR9jyWwympU5cuVLx5qDt7jLyUFvINsV0Uk8aKrtAE3Zahhz
 t1gHVtSGps1xjmliA7ClrV+Sfh8u5OZt9XdhQdwuVpxEAuJnL4c9G8FQUTVYnAQJSHwVlyC478H
 1wmwscZYztwM6mniyJo5Zfn7bv4lc+gc6M0oSc60RGYNZ4doWPpLUAjIVS4zJjeIw9pyUf7gKEE
 Taz/0dz8sIrISAVS+m70duixKy+MY
X-Received: by 2002:a05:622a:4085:b0:476:7e6b:d297 with SMTP id
 d75a77b69052e-476fca3d2a2mr8052031cf.41.1742233490836; 
 Mon, 17 Mar 2025 10:44:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtySEefB1iOeyT733dBNs8KEWKeAXOCDLMFnWYda2WB1QcKMY7zPQ3rW2qWeoF354/mVSvgA==
X-Received: by 2002:a05:622a:4085:b0:476:7e6b:d297 with SMTP id
 d75a77b69052e-476fca3d2a2mr8051571cf.41.1742233490507; 
 Mon, 17 Mar 2025 10:44:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:44:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:37 +0200
Subject: [PATCH 2/9] dt-bindings: display/msm: describe SFPB device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-2-655c52e2ad97@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rj/BQJOxWu1x2bPq88z2kFa6I0Eut5zPlFs23aO1bN8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+G9FSkklxSck1lzwxO6ehX+nVPI1iidJgA6
 N2c8I+iNHWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhgAKCRCLPIo+Aiko
 1UOGB/95qSO6E2NvcbCeLrIUgq6EANBxwKNBqmIXmTRZpZnEoOjlOZCYhFXYj1K0XPoozhl/FUR
 lWFwmc8hho8gsrf55Ye3kQvvKHx/3952yP2YjyeFPadbEPIiBHlNI8Bb5jB2w0U+p+U0PRtdR+h
 bn5/r+gCSYhjyNEgqdEirdooWPaKTlOMMJvOVl9DZ31hIYQOwB/XL6UQCUfSE5Wt8ubPOauWj0a
 vwDT9zwYZVym3kPkzCpAkd0TxC2DeL/2MZw1z/oE288vEvM4XR5eRTKpwJa6yPWCupFadzNWVLY
 l3ZUJEHsPJ+kvFImYOeywVGicR92vlMQHhy321qaRklhSjLm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: U1QFeRzxkbRU05sDP4FowSEsbVYaaPyK
X-Proofpoint-ORIG-GUID: U1QFeRzxkbRU05sDP4FowSEsbVYaaPyK
X-Authority-Analysis: v=2.4 cv=Jem8rVKV c=1 sm=1 tr=0 ts=67d85f93 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=zTbJe62L20pqPav009EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
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

Add DT schema for the MultiMedia SubSystem System FPB device, which
provides several registers to control interface between multimedia
devices (primarily display) and system busses.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sfpb.yaml | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7ca105c97edd2f305527c58ae89b9b0cf22d3c8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sfpb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MultiMedia SubSystem System FPB
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  The SFPB provides several registers controlling the multimedia attachment to
+  the system busses.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,apq8064-mmss-sfpb
+      - const: syscon
+
+  reg:
+    items:
+      - description: SFPB register block
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    syscon@5700000 {
+        compatible = "qcom,apq8064-mmss-sfpb", "syscon";
+        reg = <0x5700000 0x70>;
+    };
+...

-- 
2.39.5

