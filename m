Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13BECDDE42
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 16:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEBC12A3D4;
	Thu, 25 Dec 2025 15:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="P1tIeKM5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D839F10F833;
 Thu, 25 Dec 2025 15:21:50 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BPESI5K2605151; Thu, 25 Dec 2025 15:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Kg6zyGnE3pivVAplaTc8Vjcv4OR8ixk9drT47fjJb7w=; b=P1tIeKM5BtiyRBCI
 C4LTJwf04Y6Ufyn0my41tZrCiJYRo24zC44gDT80B++ijTGEenuBWm7D9kR6zo9g
 FDSm+OIYQN2ocJyBU3fg6hdgzwg95j985Yf3WpcjRq/k0LB7D4BAq2hYoAAeECOV
 cobHZTShkpwkQDxIfYKWgsl9ABk5nhDDeo0jzLy41gibTTQCrirR+2LUoPQlVdU4
 PRa6IzCM8ZtWqwIHjWBYKEX0LGBlXvVDCK3iUiwDNRzNxrhzYka4qJmEc8OX+Zxg
 R7yPaHavp6ez9e/jhh4zk7pWJp9txW+WN+lVfPAcuf0sVFfsx4t2A8lcrzyiM5sO
 rRIMgQ==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8v9f12tg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Dec 2025 15:21:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BPFLbuH006281; 
 Thu, 25 Dec 2025 15:21:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4b5mvn0fw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Dec 2025 15:21:37 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BPFLaAO006257;
 Thu, 25 Dec 2025 15:21:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BPFLaYW006248
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Dec 2025 15:21:36 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id 87D1F5A1; Thu, 25 Dec 2025 20:51:35 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: [PATCH v4 2/5] dt-bindings: msm: dsi-controller-main: document the
 QCS8300 DSI CTRL
Date: Thu, 25 Dec 2025 20:51:31 +0530
Message-Id: <20251225152134.2577701-3-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
References: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0M8FeMFDfYNQdeX7ZPlR_J2_rFXKogf-
X-Proofpoint-ORIG-GUID: 0M8FeMFDfYNQdeX7ZPlR_J2_rFXKogf-
X-Authority-Analysis: v=2.4 cv=O8U0fR9W c=1 sm=1 tr=0 ts=694d5685 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=kQsN5YHy2Fcxj8m6r_kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDE0NyBTYWx0ZWRfX8EDN6atGoCq3
 YI/bi2x8sJpfS0xfXPEhGozZEq1tUzQg6BKJcskuKVqGIt2c5OyMisyXX/ENkc3NuQPnTEecZXz
 y3sd1ikQOAtRJjcNcPtE+soHhv1NhQ/xpll/NKrA+jkXAiddOOfGnPtchy6C/tqfYIDnWAAiYhU
 WO+d+B+Z6Ua/CrPkm2FvMUIlcAYo0omLj3n2xUvO0+zokc5//lcN3MVH5AEpyjB1UDK1IFcibji
 WaR/s9dV4xwXLe/lfFBdDnhXeydmTGCmtTdfX6b8m3/+N3LosS3XL/vW7Xj8iNNa6ZTThP/VtBy
 AnduAqZ3YqIdhmjP8lkszr+kCq20sPCZDaS5BeulFrimL0ww+R2IbAwaHM7/EbgPDDck0xsXDFV
 hDoDwIh3fuQOF/gNNHlxAnOvkiAxYeUyCegue7gGiZV8IkMeIiB/XVVgmyEPirnBWM4B0EZw6fB
 HtUTKymF/gcB7ylAUWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-25_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512250147
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

The QCS8300 MDSS DSI controller reuses the same IP as SA8775P, with
identical register layout and programming model. Describe it with a
QCS8300‑specific compatible, followed by qcom,sa8775p-dsi-ctrl and
the generic qcom,mdss-dsi-ctrl, and update the schema to enforce this
compatible sequence.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4400d4cce072..6276350e582f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -45,6 +45,11 @@ properties:
               - qcom,sm8650-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
+      - items:
+          - enum:
+              - qcom,qcs8300-dsi-ctrl
+          - const: qcom,sa8775p-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
-- 
2.34.1

