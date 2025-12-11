Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CFFCB573D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 11:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0481B10E7CE;
	Thu, 11 Dec 2025 10:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEdso+hd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B728510E7CC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 10:09:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BB9ZSwY899044; Thu, 11 Dec 2025 10:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=nIvs4QHsAyk
 QRAEuoCMd2Tx4nAjd0MuCXYMQSBH960A=; b=gEdso+hdXv4Qm0dc8osjXvbpFzJ
 GN8y4wlmgE4SwgFD7jJIrVHJcb/kuBim2/LBYboS+q3xapFFSqfNo4tZGugI8e/O
 jrH6ULSg+MzD8pcdQIyoDqFG/YYMOrCOG/+tIrUA5gfTKlcVLlSi8KUc4FnVbIBp
 fwW5UlmYwq0Jtfx5b7XeN95B6LSjMn+4IveelNhWKddKmOX1ic4PDvKH9+dzkYa+
 lqTFfqsIWy0emqg6FJy/lPdGmZKmNR99cGv9xK7eBXbaMYiu7nJjfaP0hT0cJFmb
 oSGnWKi+u7y4Fo1H/m5TFcD4DhTloQyZrj9vqbgRGUCT2RAzwKdoGs//PhQ==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayrpagpb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 10:09:43 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BBA9e82013854; 
 Thu, 11 Dec 2025 10:09:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4avdjnupny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 10:09:40 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BBA9deK013849;
 Thu, 11 Dec 2025 10:09:40 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com
 [10.147.243.7])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BBA9dbY013846
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 10:09:39 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
 id 87B32578; Thu, 11 Dec 2025 15:39:38 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com, 
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Subject: [PATCH v6 1/4] dt-bindings: misc: qcom,
 fastrpc: Add compatible for Kaanapali
Date: Thu, 11 Dec 2025 15:39:30 +0530
Message-Id: <20251211100933.1285093-2-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211100933.1285093-1-kumari.pallavi@oss.qualcomm.com>
References: <20251211100933.1285093-1-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: WmVSQ1jlPQPSDqSxMbJhVTodnV0FAZs_
X-Proofpoint-GUID: WmVSQ1jlPQPSDqSxMbJhVTodnV0FAZs_
X-Authority-Analysis: v=2.4 cv=G9sR0tk5 c=1 sm=1 tr=0 ts=693a9867 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=URzRxF_-m-AlxXRg6lwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3NyBTYWx0ZWRfXwc/YQvR3WXQp
 gcOdx8k1gQhazXff745gkDYpLx/CSEDecB9yjYxg3WlCCBSk11zl78ddb295ynDkZFYG0/81fdk
 9AAQ17zILbDsJfyVGOw7kP4FvdY8+sBgsPNJhHvaB/Q7MGi+Q6mO3Mh+H3sL/OPR9/1QE6bF2pY
 YL30NxN9ntUAffapXq6jIrFPAb2/jGfPTWBc44iGLCO2udhh4razxfrLVfl0CNy3Gs9SzVq/HsX
 XrnWsuJ9jIkm0AghEN+JGB0lsDbdISVRadYh+UTTbfWQvgTJjeM4RUnSEgL6QiF1SUj2wUJ9G4I
 KmZPMS5h6WGPWCndOPjtVtwf9QGZ/FT4SKcGtv8d9tTcK5ImaJ/sW8ocJv/7XSZupPFYwbXnGgW
 LQGzu2jWvtNq6ng+UbUWV0gK8FRwFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110077
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

Kaanapali introduces changes in DSP IOVA layout and CDSP DMA addressing
that differ from previous SoCs. The SID field moves within the physical
address, and CDSP now supports a wider DMA range, requiring updated
sid_pos and DMA mask handling in the driver.

Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 3f6199fc9ae6..142309e2c656 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -18,7 +18,12 @@ description: |
 
 properties:
   compatible:
-    const: qcom,fastrpc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,kaanapali-fastrpc
+          - const: qcom,fastrpc
+      - const: qcom,fastrpc
 
   label:
     enum:
-- 
2.34.1

