Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6BDB3349C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 05:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A125310E053;
	Mon, 25 Aug 2025 03:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWMhVuWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6865A10E10B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 03:35:43 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OMPhWF006172
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 03:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0Yg/2s8cwpHYy/pmAzzHeffOyyjabiwQv6sxOo7TaLA=; b=oWMhVuWhjhnFFmWa
 IytyVZT/fw80q/BUz73knjb9dRlJg5o2SMT4JQ8pSna+mR0iD3NluzvDM2FZev4K
 /nhwHfy+9u1LtCdHWGXMJRp5YdZchJ6t0Q5vuhleK+0nQqFtbFjUBm3JwGIH+WPR
 tV0XNzWTcgSqymWYelNUcPGGRG8sjDLX3oF3MlBNna11BRDAbwsqs44ZISZDlu9+
 0oARbe10VKwp3odp92ymxbwCBDUxLrc+7q3ofeb7n2SaLeO5+zpnD1AB5iM5FruU
 D3V55hZED4YmEc4kI/vbAbtEyFYjnc1AbI3MlGqd+qR/fJIXDS0EUbDuDxoHH3u2
 Dzq0DQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thufw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 03:35:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3259ff53c31so497170a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 20:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756092942; x=1756697742;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Yg/2s8cwpHYy/pmAzzHeffOyyjabiwQv6sxOo7TaLA=;
 b=Qv+eQvtRqgMUroO2Eq+yvQMbd60dvqeYRxXv/uZJ2W9rCHT6H+X6/3wzVjH1ml9+nc
 G8K3MGd0v7dqrLYchmq0hzA0QrHGWQiWfoNOYgnb1XOYGHWuhZWodfoJ3D2NXIJyjoWS
 BX4jZelnqLQp5AAh3OYAswmFL5d8e0BO0qn6YudWpQf7Pkyvy02I/NLVpM3mF881OdE7
 MsBn1IU7fYEOgMKudZ8/3DDTExsPksT4SzyEIHh6tv7eO1IDCFOSvAvvmVvPzKUOCawD
 XcfWX4aE53l5FpG3m5SXuj1lFIeYRORf5i0AGJm4Jo1zphY7gnqiInOv68AYwyBjsF9m
 hCHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqBwNsS2sjjr/Kg61C8n/ieN68VIB9xMcI7Oq5ozwQxbOmMdghDXiVcGf7qNpO8DSfjlp6/aAxgP4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5yyKUf/C0e/SjSZ32J5cmof0vlWf2JycyfCzz+8ERobPJoJa/
 fhuDRZHmERNdfjuZs08wpIAqRc+fJe5z8xlbu4iIGFlFBdHfkmrpFCXvaeg0OnZB5uDOL0jU+6Z
 m/d5gNSSC8j+UXYw6LAIDDlsNzIOeBUaOuACzPMPqBC4g6+drmNkxWrtr2BC7y9c/PA3ikaM=
X-Gm-Gg: ASbGncvC+LXZNO5RWVdamNrjX4TvQBUTWsQT8eaVp/yzYjbIil44yZK9piNjevCL9kw
 iWngbzf2+zruxULnt/WybrPDAdeWiRb/uJ4i5ph+KDna01hUmggZpf9C5JohLRDkllVLaJN2K/8
 ciH1cAxuN8ZP2sBx7OgwfVwv6zBH4jBJmOdtO2mZGSQQmEJ8jgVhJFgZtX8TxwudJG1uYf6SgbS
 O1Zl93kytiTOVVM6kJ5KE9Pv1XBBLXw5I5LucCjfdiAR0IUUa0jrFjYqFhaehP7xftufHnUPU6u
 xzX3daHbmHK5zDBpYrZoYjrJOxLQAqgI9yGQEHaVwXTJR/ujEoTnfIRDoYQSdqseTNplduw=
X-Received: by 2002:a17:903:1b4c:b0:240:11cd:8502 with SMTP id
 d9443c01a7336-2462ee1a94emr104486235ad.13.1756092941960; 
 Sun, 24 Aug 2025 20:35:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIayiCQhykERtgqE3/QyLN5qc4N5nnERNIq6sat/ZgQrYqvJ5iGLOZQo1u9v0cQun56yecKw==
X-Received: by 2002:a17:903:1b4c:b0:240:11cd:8502 with SMTP id
 d9443c01a7336-2462ee1a94emr104486015ad.13.1756092941456; 
 Sun, 24 Aug 2025 20:35:41 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466877c707sm54859565ad.22.2025.08.24.20.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 20:35:41 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:34:20 +0800
Subject: [PATCH v9 1/6] dt-bindings: display/msm: Document the DPU for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qcs8300_mdss-v9-1-ebda1de80ca0@oss.qualcomm.com>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
In-Reply-To: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756092925; l=1231;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=Vcbndb0BitXQXBCCDy5phydPWg7MwP6Brhlf2YVSZNE=;
 b=VmGPf/kXtbdgJwEU9kmGm6raoxahnIcjLJYE7n6dbhH3xq8vaqonHtFHsWtTtSk0hFei8lH5P
 7PoCFRw4vYDCsAG0a+3nKVXf687bS17my0UjT/NianR1QTFbn9va466
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX+/+3vT5FO0Uy
 CaVutpqM3RGBzke3kgvKLXhmaujahZZyWHOsOKJYZNqH6oI6YQ29ZGygwRXjIPy45bg6L6pu8tt
 7XhcyeddLr7IykmzP/v7b4nL5WOyZu0dcttkOUxoDdPzTNTcB4+b/nkXFpQgpOfku0acbEH6Rbp
 eQz2lpS5POGc+wYWO2ytqpgissPYddDC/im5Rdgtxxvm635GF36+KL+ZYkq/KnlcEgRI5ZO36Eg
 N4mjf3oxwEqH/G8KxCDIBLGzjU+dK4irX7quQ/NdyzJDRXeyN4nqRf3l/ubDMNFWwbfoDoaPafG
 D6FwDFyE8q8yl6qcLpxcgru4bx7k0ruf1dVP5JyOkHCckoLuy5IsIwjPNfkpCrFNbS1wg+DEPEj
 L5IU4gm+
X-Proofpoint-ORIG-GUID: UiUwG6_qqoKk7Y2VYoJ3Ww4K1OzG9GIY
X-Proofpoint-GUID: UiUwG6_qqoKk7Y2VYoJ3Ww4K1OzG9GIY
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68abda0f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=5ixSZjX4nqodb9qzXsEA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043
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

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..d9b980a897229860dae76f25bd947405e3910925 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,11 +13,16 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-dpu
-      - qcom,sm8650-dpu
-      - qcom,sm8750-dpu
-      - qcom,x1e80100-dpu
+    oneOf:
+      - enum:
+          - qcom,sa8775p-dpu
+          - qcom,sm8650-dpu
+          - qcom,sm8750-dpu
+          - qcom,x1e80100-dpu
+      - items:
+          - enum:
+              - qcom,qcs8300-dpu
+          - const: qcom,sa8775p-dpu
 
   reg:
     items:

-- 
2.34.1

