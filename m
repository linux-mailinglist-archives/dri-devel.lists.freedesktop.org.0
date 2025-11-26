Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407FAC890B8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF0810E57F;
	Wed, 26 Nov 2025 09:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjnt9siS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E274210E57C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:46:00 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AQ8NiOK3255846; Wed, 26 Nov 2025 09:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=e0A0fs5Kye1
 YOUiW2hC9Caz9yTBWD34IHk27eVjW2YU=; b=cjnt9siSKNnL6j99XuAQp0NLGIt
 bKucdg7CrLtt/S4RGG/aDVM2trT8c/xBS1T5Pwb3ngZRm+8lO+TVmkNdKykhOyNU
 xOQ1x7NaXpD0oXjqmlOI29Zd+lMIb5z+ajEOUvDhXUuRxZMWCtNvrYAkYzbaytpy
 ZEE2DFgjv2YW3Q+RUO/lhFQdKbSUt77XASBVkyNsuO6x6lyWx47QwOB6b7vExB4S
 4lQykOYBl8s/ctggOPMCpRFA2L62nc/GVWgvp7GpJcgp55ojgLQMt+Tary+Lonhk
 hDgG4fhLy1mduxMuHdtwo50rV4uS87cfmo5tUVHOMW72TIvFXm2OuopAwIQ==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anb9c3cb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Nov 2025 09:45:56 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AQ9joYZ010071; 
 Wed, 26 Nov 2025 09:45:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4anw4ssw8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Nov 2025 09:45:53 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AQ9jrYJ010091;
 Wed, 26 Nov 2025 09:45:53 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com
 [10.147.243.7])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AQ9jqrV010085
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Nov 2025 09:45:53 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
 id D2C61515; Wed, 26 Nov 2025 15:15:51 +0530 (+0530)
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
Subject: [PATCH v4 1/4] dt-bindings: misc: qcom,
 fastrpc: Add compatible for Kaanapali
Date: Wed, 26 Nov 2025 15:15:42 +0530
Message-Id: <20251126094545.2139376-2-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126094545.2139376-1-kumari.pallavi@oss.qualcomm.com>
References: <20251126094545.2139376-1-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Edlru1hAkUZ0PSADdVCmoTV1xKVz68nO
X-Proofpoint-ORIG-GUID: Edlru1hAkUZ0PSADdVCmoTV1xKVz68nO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX8GcA59AzHPye
 lEh7Bpjk/b0uU72bcZiiuW4THEFnCQyxpDbIPUuz790igIjOFfgyC/R7QPMjQffqeZMAd/rLHLA
 JkXi2hEQWkHYXOgxCtydF2LluZnVWAdtIEP1LGqrKpND4FpzlqBbJSQ4t5wppjbezjApshQJ3sA
 X9RkXrhTCpG72Yrn2ocqA++5T+a/YnHggegaGRS4GIvplpruIfY5VmsdNIyg/ilPH0N4u/T6cYh
 xR/a5Nb6vdsKeVCsOYFGzUOrlx840NQWR2S6Pia1q9DN5J/c5NDEDIe84bRHwxu7u8KgfTfnJsc
 lYPeGNpQbqlA/qyrv7jqpwhmvLpd1Bs7MF5NHIVG7nOMinBzTRAU5WyOAU8VMl5h+C8iBPROlbz
 oxPOffCH85NuGfWlxaHk+OR1yZd5fw==
X-Authority-Analysis: v=2.4 cv=VKbQXtPX c=1 sm=1 tr=0 ts=6926cc54 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=N3xeVU3HB1sJGbtnMtcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260079
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

Add a new compatible string "qcom,kaanapali-fastrpc" to support
for Kaanapali SoC.

Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 3f6199fc9ae6..6c19217d63a6 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -18,7 +18,10 @@ description: |
 
 properties:
   compatible:
-    const: qcom,fastrpc
+    items:
+      - enum:
+          - qcom,kaanapali-fastrpc
+          - qcom,fastrpc
 
   label:
     enum:
-- 
2.34.1

