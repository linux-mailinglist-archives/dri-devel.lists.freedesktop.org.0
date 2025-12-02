Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE16C9A305
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C8210E52B;
	Tue,  2 Dec 2025 06:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ofm8lDz5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B5610E529
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 06:06:59 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B1KXM6F1147154; Tue, 2 Dec 2025 06:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=YiLijWhUQ8I
 hJ8Bhmr6Y+iXK1QdEqhjjG792Ob1XDQo=; b=Ofm8lDz5xHyENk9Abcr3Rkw4OPD
 RRfLGa8g+TbPMKe0wMHMFeKYTZIfLl8cBsFvb587oLIklD3pxT+4ScWcXwVFDHAa
 E8oeDzAnyQWzycS3x6SSi6jYmsZnFADQt5E1E0IyRtgbuFhDa1A0voRSANzAl1X9
 Ar0zpC0X51eHLbx5OEqNiHjd+z7WcIye3z7OR4LH0syFTABjOTvWIpTzKvO3g/2M
 IRA7xfzCscEXdjSs6ZjZKKMDxVCBp2KOHxZuYm3k2w7bByke869qtNMumF0E9GBn
 DrlZ4kblGSfhzR1WrpV+wpG4CfI393C4GcWiVN80YQVtKrQwvFmgwvWzk+Q==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asj5e9ejv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Dec 2025 06:06:48 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B266jJ5002065; 
 Tue, 2 Dec 2025 06:06:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4aqswkhqea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Dec 2025 06:06:45 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5B266j6k002054;
 Tue, 2 Dec 2025 06:06:45 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com
 [10.147.243.7])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5B266iep002050
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Dec 2025 06:06:45 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
 id A1A2B570; Tue,  2 Dec 2025 11:36:43 +0530 (+0530)
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
Subject: [PATCH v5 1/4] dt-bindings: misc: qcom,
 fastrpc: Add compatible for Kaanapali
Date: Tue,  2 Dec 2025 11:36:25 +0530
Message-Id: <20251202060628.1869967-2-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: nnrdJZrQNUUCBOEbavh5U3GxyGLV28M5
X-Authority-Analysis: v=2.4 cv=GMsF0+NK c=1 sm=1 tr=0 ts=692e81f9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=URzRxF_-m-AlxXRg6lwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA0NiBTYWx0ZWRfX3JcAjQlu2mh7
 98yXm+eKsgF73zaOdziOktC+50Bg69PJquiWwKrTbYAUQ8TSPN4p/1dvHJDcT6md/uubsXgJPw3
 lydr/q+KByJvbWypO3YpCWFhJE3Li+ZPOJ4L6o0JpOjHtkRBzMGIw5X+GiKsaYvcjvv3GyyRHNT
 /ibltvp3+/8yBZKmu3AzzthNqYqt2QxYMvuONASl/E0e2agK/xE8/Wmnk+iaWdID8Fkp96pJWTo
 s+fmABojhxiUa20UN6B7jgzpk3jUxqC72KsvE90L0em1B0M2fOjiQXtIde78YDu5lC1kIF5EgMP
 auYIZK0yJUarYaVvndhbGsSIA8Wu2E+E7dVRXS30lya3C0+GNjgnLRH5kvN2LDwrnkMRM0ddBve
 MzpZ5vUyqyybYwoJNO7hGNzhgP7o8g==
X-Proofpoint-ORIG-GUID: nnrdJZrQNUUCBOEbavh5U3GxyGLV28M5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020046
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
To apply these changes only on Kaanapali, add a SoC-specific compatible
string "qcom,kaanapali-fastrpc". Older DTs using "qcom,fastrpc" remain
valid.

Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 3f6199fc9ae6..8bf7d4d83c8b 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -18,7 +18,13 @@ description: |
 
 properties:
   compatible:
-    const: qcom,fastrpc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,kaanapali-fastrpc
+          - const: qcom,fastrpc
+      - items:
+          - const: qcom,fastrpc
 
   label:
     enum:
-- 
2.34.1

