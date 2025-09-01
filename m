Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9F9B3DF2F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 11:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1C410E3F6;
	Mon,  1 Sep 2025 09:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjdbIv+n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C5710E3F6
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 09:58:13 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819eq6W010931
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Sep 2025 09:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PC0P0KeW8pKD9FQHWaVlmS86Em46YGeoi5IHSPfP7vk=; b=gjdbIv+nHm6u86Jh
 RNuWwgpHEJgkJSts8g/ySpsmyfzr5gFYe4uVsF8TrcVVxKiMgKV9WKPa4bVGBDdo
 CIsdF/bD7WsUB/XThT69KAnhHQPTqpH+f10B27KLs+pn+Xhat4JhIdmbOjOndKeb
 NRmse2w7ibWg28qiamem08e91QBi6p0tSA8EChyPcSNHan90xIagDHWmfeuS6Cvu
 hVFYZFnu5+midXHStNMsKYPlqsQfZJcxjRNE50O3jVHvngSN4dT36U4ZlJOpCzeX
 WJB6XauNkERmQ5fht4RhOm5eG7ueXP1KSy9y1qKHmkSwWRfrJY2i8MUAVvXbr4do
 C9oo8Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8rvcug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 09:58:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b471737c5efso3204493a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 02:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756720692; x=1757325492;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PC0P0KeW8pKD9FQHWaVlmS86Em46YGeoi5IHSPfP7vk=;
 b=vVU0UYRKDcjLtthZ61bF4/YM4mvxw7C5OcQefv0rztQXgeNFrkv7cIGFn3r/JTsE5L
 qm4vdfYmLvylUCX1qPTH5dI1UKIKG8ICXb++wZl5hm4N0NObZDaaZ/E/8ALcO4pP6Re2
 CxA3ILE3JUHJIxD8iEReo/bo3dLP8Iw2yJp5Uj0zFI1PRH7bPl1u1n6HA378rbAZKG4O
 13o0vk9cGo6ZDj4TrLIxDJnfgs8iypzoDpNnmgbq2HCHR7MCm8kxjd80VVxf7JtiK4xj
 AAxbcy82ZJxCduLliykUW4t0zOxAzNnxDBKzL2OFFwPmsvEPTRLHnyydi0RrqQBxNeQL
 5Ukg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP9xCodRMK3qGbwM5PBIGdHqda56hvlZi6e/3KvB+OHyM5eL6zrn3xZhxHlhqabHh7DURKnRPGXR0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOirFxmpIm519583CG1eNyiw9FRYNpLqMw+UWgK6aEpIbX8GkQ
 H0gUrpJBtsBdTUES4x6HafHnYNsfsTVJS7RUndUzpMbgx73BHeupZzD4/HizJB6qKw6OD2Ofi0S
 Zq+lZObZUZXOZTnJB5nvCcqnXeM/xYrPBgROC0XPG74ndUCBzReeXqKESYr9dEsKj/Pl91hc=
X-Gm-Gg: ASbGncv4brtmaHqP697mMd77tl77KMqOPKbgQZuai5VnWPYjKUPFtSTdztxsAfG7t1G
 a7FpclVCjPD4wn5krF8TZcK9MRmqSfuuZlycZ+wWdd66oqFOQBNUVGPKZ9NF6v2yHnj3lP7hdAh
 reqrlzQuTmZ48Mqk0tLmYCRm4F+mD/S9i19gGoIMNkqIaBVRC2VsUkZltX3TizMgDq0YXyPrvlI
 mGU7ikzfTVbCLT0gCBVIT4JExleAmKHuNuCmaCMdzkveMOTN1ovLnzgKAnAPjiU8bv/T4VfT7d+
 e5RzFBWLbhEB6jpP1O4AonOQr/kRAw255Ngb3QAuNi5h7hV+xpTDkNeNrE2ywoAIHUK9Wrg=
X-Received: by 2002:a05:6a20:1584:b0:243:b35f:58ea with SMTP id
 adf61e73a8af0-243d6e01092mr9275684637.22.1756720691878; 
 Mon, 01 Sep 2025 02:58:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE4FEkbxc8zJAVFcBNKH3By/scmpc66RdOPEWIriSFDM5liAVdwxSS2dSJZSUUOeU2APdJKw==
X-Received: by 2002:a05:6a20:1584:b0:243:b35f:58ea with SMTP id
 adf61e73a8af0-243d6e01092mr9275648637.22.1756720691417; 
 Mon, 01 Sep 2025 02:58:11 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bfe2sm10305656b3a.14.2025.09.01.02.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:58:11 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 17:57:30 +0800
Subject: [PATCH v10 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcs8300_mdss-v10-2-87cab7e48479@oss.qualcomm.com>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
In-Reply-To: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756720667; l=1711;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=3rkFDkEG8LVsFjeJ4SQMC5Gt/HRXtaQnkmz4irxbEPk=;
 b=x43dftNhgBfQgNOncIm3bxVBcJJxIETiS2CaQI7RYpFOenwd9rA2BLYjRxTAV3W+Ex42mMN2C
 yk/G2r32mMhB/S1lJzSLq2PRcaVDRtilS7PPRLPBisLMj9OqdzU6Y3Y
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX/O2MLFsW3QTm
 +gbcEQ+0i/c2Dz8lbCZXbDKz72LaR0UYy/iCQ8BLmeifA5urjUFSKb7ZancrLalOJxz13epRMbP
 PxiBbwL8CHXGKEUBbyuK/3jd+D/bzhWV/LeVjruTUDkeriFnyKsESjWdOE6tn7CfDqzoP4q5C7I
 2hcRnQXiRuOfYqYAKOfiK2rSifxADTnVS/GKb4orES9S+1KbE/fZWwbOMyO5p3nAbGyWQ2Zn6SG
 YltylOOblN3okORwYcNjdtQmt9HUWhsXXu0pZM0q5rNS6+YgLvMv9qEt8Jhk49roKZDd0onMNfv
 TxwYpfngRgSXL1yfmJGhKnDsm95lWZ2MdgWqDhIr4dazUZ4D+Yxsr7wPyxmGdgJei5GdR+sKS/D
 pAdpeOnc
X-Proofpoint-GUID: GBbqDd-snDRLDI3xDbZIs-RgZmRsXVj6
X-Proofpoint-ORIG-GUID: GBbqDd-snDRLDI3xDbZIs-RgZmRsXVj6
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b56e34 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=cUk4fDKarN54sxZTNDcA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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

Add compatible string for the DisplayPort controller found on the
Qualcomm QCS8300 SoC.

The Qualcomm QCS8300 platform comes with one DisplayPort controller
that supports 4 MST streams.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 8282f3ca45c8b18f159670a7d8c4d9515cdb62ca..4f0dd80aebd1958327a06d31664dd68e02e5ba94 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,qcs8300-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -195,6 +196,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,qcs8300-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -283,6 +285,23 @@ allOf:
           minItems: 6
           maxItems: 8
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # QCS8300 only has one DP controller that supports 4
+              # streams MST.
+              - qcom,qcs8300-dp
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+        clocks:
+          minItems: 8
+          maxItems: 8
+
 additionalProperties: false
 
 examples:

-- 
2.34.1

