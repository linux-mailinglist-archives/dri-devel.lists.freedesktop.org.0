Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A4AB3DF2E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 11:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FC310E3F3;
	Mon,  1 Sep 2025 09:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="faIWkcy1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A9A10E3F6
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 09:58:05 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819eVrq004547
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Sep 2025 09:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9GVW1gIOHT36zGHHStOfqVFIcMi+JiFxcWbVSTpf52g=; b=faIWkcy1HtyDoZDL
 Q+EnDMusWVAaJfPBS/QRBb2VqGA5BVVd0WcOzUKKWC27bte2bt3aEc1opygywiHx
 BtnfEZRV1r6O4TXysWRIMcXbf0EtG9ZzYkUKk7psVcHFx0aE7Vug75YaFXudx/Pz
 wizoUE5HzJgyHzhJsnBnFlXfNONZXCDfUB7XMfVUEqVMEOfPzfeaGntt8EARPUR9
 GSSo1dCBJMT8v6el16fwtWSO8CCoXlI1J4lrRznu2uZ69HpOib3NUITQs1OrVMZU
 WPTOOAu8cdFhTRk+iiNipAHxaCGFnr9oBRDlmKbbBoroFDpQYUibvnnR5rQzm3Am
 bH4bbQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fc7mn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 09:58:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e395107e2so4139071b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 02:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756720684; x=1757325484;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9GVW1gIOHT36zGHHStOfqVFIcMi+JiFxcWbVSTpf52g=;
 b=U1RJ9dZxZi4ByNhvrGrioUYnVaseQyUzjNycFDFpkqus0kskhIdHX3fhTBur5CKOUD
 nhpctKQKW+7a7L1ZfY95EGnOFgLbEoHp36lPA391NUbJclkIOlMK3bzatpgf2TKenmVW
 tu+GzV2dxHNsUMJBo6hOyX1pyEplkR5YGmeZtUK7XdO1/jneIR58Cn2wzaFUq+Y7k84v
 orQVWpEG8JWguosraz5ke0sxkhu6XISo11Wkfet3gHiAC3HLdMAzIAR3Gp2TSJ01FfUf
 JxfaUN8uVUCmOk5RrYvABLQrq6v99saQ/ynT2A0XMVWMZRq4c/vboVLn3NjMx5WOD+sI
 UzXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9TDBFPuawW5j5OWADzFj0L39q6jtmSqoP4uY5OSKVAUYrraN4PRNmgMCxK21yBr9G2AxPQDCxFlk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yygb+pLurHw1hQVzFmkxvHkdc2iy0vbM2LZALSlEO9RycN63Sh6
 1tojiyDNhxgrKZ6+/kLrtA9fNgDB6dE/RNpYur3Oo0x1vO7ueByjdDb0tdjYe1MrnzbHqyRdPDT
 rGcN0qQb1rUJVniGdkee0vw2q3K6+VV88zFL7zaw8hmzvmShQ1yc6GNKyuBbRKcDZ2Nv78jA=
X-Gm-Gg: ASbGncsHw+j4rRVMzk/28FTpLqm9+4c52i+TO+dSOSCor99Sk2hzmVz3noLHoY0fZeL
 Ac1nwk1XaCCwh5J83c5PL2ZFQIMI/wRwv/oDSvegwMsMyS9lOa6TXNVQqXLO/bUkG7Qj1/1WtiT
 uqqsMIzOFAy+NZPJZY5hKGDjApE16unaw12OlIIB8EDwaGtcGZ1DQKMu90EzKleKZ7s22v5rHxc
 YGcEyJOp2IsL0VeOBXNq/0R6NJjUdCZlVAaakcDFcQdINFHk1mvDCOxEeSAofpwXKIqav6d1BQy
 YaTqdBErK64iDDtKtMUhUe4MhASpolOYydUEzWHJtD5PDmJTj5IreDeeciNkB46ca7TkjgI=
X-Received: by 2002:a05:6a00:114b:b0:771:d7b0:6944 with SMTP id
 d2e1a72fcca58-7723e21ed20mr7659603b3a.3.1756720684340; 
 Mon, 01 Sep 2025 02:58:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ4t0f/6dn3YuGE5Wx0MO+C+CC91j1Fu+2H7Lm7vL9NLa+L4y4wVquOSVTbCTnxjl+phdOyg==
X-Received: by 2002:a05:6a00:114b:b0:771:d7b0:6944 with SMTP id
 d2e1a72fcca58-7723e21ed20mr7659552b3a.3.1756720683837; 
 Mon, 01 Sep 2025 02:58:03 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bfe2sm10305656b3a.14.2025.09.01.02.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:58:03 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 17:57:29 +0800
Subject: [PATCH v10 1/6] dt-bindings: display/msm: Document the DPU for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcs8300_mdss-v10-1-87cab7e48479@oss.qualcomm.com>
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
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756720667; l=1298;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=gB7HmGiD8GjEmuy7612J5648tP6/6MkBhyVIM4ydbsE=;
 b=QZLcbjlZXSWETLypy0qkDZdYxYFXq1VwXGtpQNUqWZ6Rqjs7x+mz2AEfwgjCQAvWn+9sXu9j8
 kU7/WR51wGCBNNK6QPhPdB2/aQBCRXrjH8W/5Tz2m80nZ2bzYCP+3sT
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX2qHkEkQ8w05J
 vvNyqfJNMv/j/FdP/zbmvy3/RfA+WP9kKg7awcsWzQr/g0Dhes9tXpZ+9jZVJUPdBd7Yumirhv4
 eQbZ3ZBOyS4dS+9qBkecgTAqec7qnE7O3oKdDeDCQZPrJCGCBlljqmHWMqY3CR6ti9YvD81LDPI
 kL1Uk4k5RRJTIZIuAxF0JKeYf7GyDmrNwnkR6d+sWNDIkj5idsZwKFS5GinFQXQqBuEPU8CIHcr
 yErGkMWEFKx3GRrQaKe9J+Zje3SGRsTLZnBmpVPlAItkEg1n6QhAYYfmVPxYFcS1UY9IKh9z4Ud
 UyjeHhAifqr4j1fZWHX5HqYER5YLrkv3wHoT3I3oJAS8tOuLDBPyTc58tjz9nWkZb6EP28rSej9
 zlInoCHV
X-Proofpoint-ORIG-GUID: C0TAN6g7WdTsYQci8p1ovNIVHIuHf6_-
X-Proofpoint-GUID: C0TAN6g7WdTsYQci8p1ovNIVHIuHf6_-
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b56e2d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=5ixSZjX4nqodb9qzXsEA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

