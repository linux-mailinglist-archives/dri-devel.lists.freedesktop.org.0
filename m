Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA0CB2EC12
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 05:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DB110E863;
	Thu, 21 Aug 2025 03:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g40H/CvO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748DF10E868
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:07 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KFCuFS021477
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 omxJk/QLsF/URL1wqzZF1tJVGEmzz/NZQDpAN9aE9UI=; b=g40H/CvOOCILTvzW
 r34h3dH2d4Nat9Ooj/MarxfAu1lXA1k+u/LSObm63lEoXZa392SrJpeXn1trGBTF
 sWgIrqu1CFen3h0rQAQ/VGf7I3iKdWohDlDq2+cN2lYy/ZPpazaerH0RO6HwCsHm
 iniPnoiyQLP6cK5b6U+qQ17L5Bdh2OesPJKG7Vlai/1pcC8HRKIDsZJlJiy04tJB
 zgprs5zCFV0WfUhUWwV7jamrmDJTxNXFM968Ybegz44JV613ncjXhPMk5U3FzJsr
 nqK5r9BVMyA4yE/nfBsYbxOx7h/iP4OurXA0fMXAXVuEOKfi/o8CS5E0gmVMdPDe
 wRD9Dw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdhq1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3232669f95eso574329a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 20:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755747426; x=1756352226;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=omxJk/QLsF/URL1wqzZF1tJVGEmzz/NZQDpAN9aE9UI=;
 b=SfF//XAJ6heDj5jAi3risggZYamCOMJw7PDeQAH83slxH6KfzRIAJ8hdzGb3TpeS/p
 snVxC7u8st1LbjHcrWUIgnfmvfFNd3KSkGon5Y0q2ez5y6IIy0jF+X8AEmPzvZnIN10I
 Uy5wfLrWHvUCJtO0EOown09VZWz2qrQ4kBYL/nO9A7XvUHQraVpUe3LLowTvYB2xeq87
 ZrKuTGdnY/UXPc3ObjtdEYMzh2U/AfZvzkSB0fXEE2Cacc5UAxnYyVE2zMfEHJ0d7sw4
 XOX7bJuBjOcWz/DUlYWNOwr8LG1Z2qocUEtoKggo77DMBTZOm8E64J7wToJBMGBeZF0I
 6MLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfnd4v9l78rVot/D8OjIiU4QxWykeHbIeaXeOLs6WGP3QfnhuU8REdDZxjE2kCLr5tlbhfxAedaRs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4ZkU7erzRr/US1GuzFEi0Fla7bs0wIDNoDpNML3LDu63+YBm9
 17NjxESgiPqqOtb44Hp2U0KeLmPziZPdKVmQ6uB+NFmET6BvDZHWiLTRtZgZmijb5JwG1W3Rte3
 7DGtXM/A4Pj2xE87W/PJz5EwypQjJ3OGm6ibYiCO5tGN9qrlUuaf9nQ6jnY6uW3fxoiOyxgk=
X-Gm-Gg: ASbGncvCBRXZTZ6S5cc/Ur3ou6AmdxmDUxSsIOLIuwBYYbVcLctj+e86GgOCuJgycTT
 QwKvCG8MieWX/PkBXfz4dtfUbqIwqVNIco5ueZJXjK8OKIhplTNYEq/6jlawpOMjD7B3QSTEYp2
 65tg4VuTqX4e8HcRjcHWDM9mi2p9cNOWGTk6X4bXwU+LJ4TprucMLq1+q8AgdTDf1Ne3ceXCCIz
 9Hf5TzOndqXy3d86NbaRFx2ompbU44jigya9E22NSTH3d/zZbUkD0hyLQVSrOTWMUppp5aerGiT
 8hfgpHzQ56EwqqUDiPvtwItZ+wfynwJssvbRjmHjbsg8LQWjGr/b43OtEz09Ht8C4Sr/m60=
X-Received: by 2002:a17:90b:56ce:b0:324:dfd8:3426 with SMTP id
 98e67ed59e1d1-324ed1ee38dmr1418820a91.35.1755747425989; 
 Wed, 20 Aug 2025 20:37:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx46auU6qYMPp4XzqLucpZxQ1bH+beazXC5BTM1j4dL8s7ED+RKFNuTGpweOJALF5bCoQX4w==
X-Received: by 2002:a17:90b:56ce:b0:324:dfd8:3426 with SMTP id
 98e67ed59e1d1-324ed1ee38dmr1418779a91.35.1755747425484; 
 Wed, 20 Aug 2025 20:37:05 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b47640b6554sm3497780a12.48.2025.08.20.20.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 20:37:05 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 11:35:57 +0800
Subject: [PATCH v8 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-qcs8300_mdss-v8-2-e9be853938f9@oss.qualcomm.com>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
In-Reply-To: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755747401; l=1857;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=6f9cmGYtufnRAs378RwA99paFx3sFDMfAVWoP1M7ZBc=;
 b=NrBvr4xND8skJH2gNVxfDY9yR0QY6Akwxx2oDzy+7X8VxbfC/fSaDpa6GKxdLLGqouLEv5nL6
 kEf/Ot5ZrEsCayuZSFYD+vgSexudxliUd8WDYMh5A5fDG6s7ygdb5dL
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a69463 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NNzdlKEZjN14YBeL9RkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: N1niQnHDivwHq7-CVXwHv2W5fAgUL8yP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfXznpK+5GPTnhT
 P18Inhca3+8GyFRQ6pFx8+RrWSK7Espqsa2o/jbd4zlwLc5RT2LKoTbEoFBHRQD62wOfYI/Dr5o
 PvdV38VUMHBvLAjcxT8YVoPfMHxB8vTNrDwKKtUl2SS6p8d5zmbC5OlxZl0mPYl/qxA/VA0rfe3
 SxvmDuSoml+ityHRNskMGZ1hMg+BhGAixRHAGQ9ArD/C5Ifkgok/8Hxk0CdWjKytrHFZr3vk82B
 t/exc0B0YN26ft6qacYSvgqbaKGqvcl6TQf4GGsD6UjZXecQa8wt/kAGWWpzaKLW7qDduiHsVKB
 dGkhf3+G+NvkQjUmv+X+HZ5Ha08HeuuqzfK/9UwxQJc2JPClj1wr3YkKPStGZV0Hyca2TfNHVmV
 SWwG6eDaldew8C18cBniLP8FDcVX1Q==
X-Proofpoint-ORIG-GUID: N1niQnHDivwHq7-CVXwHv2W5fAgUL8yP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135
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
with same base offset as SM8650. It requires new compatible string
because QCS8300 controller supports 4 MST streams. And 4 MST streams
support will be enabled as part of MST feature support. Currently, using
SM8650 data structure to enable SST on QCS8300 in the driver.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
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
@@ -179,6 +180,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,qcs8300-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -217,8 +219,9 @@ allOf:
           compatible:
             contains:
               enum:
-                # some of SA8775P DP controllers support 4 streams MST,
+                # SA8775P DP0 and QCS8300 DP controllers support 4 streams MST,
                 # others just 2 streams MST
+                - qcom,qcs8300-dp
                 - qcom,sa8775p-dp
       then:
         properties:

-- 
2.34.1

