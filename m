Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FC9C5C089
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 09:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F05710EA04;
	Fri, 14 Nov 2025 08:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJXdfbb4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B02F10EA08
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 08:41:57 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8VgmB1488265; Fri, 14 Nov 2025 08:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=6lCovysLRBG
 s6M0LZGZMBEnAPfoDxSOQOodmHgPUmlA=; b=GJXdfbb4u34F2Uq06pmFAlxo5Jk
 piIcjC0j3UjJnPUHprhSQRfraDSfJ7v/PTEEDp75GxEJXVheQI1NHkw+IBpSi02j
 GVm7R9n4ttG9VNTepHgLLBQO/XZ+xJgC/pFLWsR76UBoYeZL44z9Z8XHXO9CwD90
 K9lHnskhjQ2sz8J14XRVys1bDDpir1UTarxIVNMmG0rbVIxJkjhO2pc5sOqncqT2
 C2EiMhstrxdxoMeNk0y3JT8nADoklAKnw7acPc/q8FcsYkbwLHRBoWA8sFV5s+Dz
 DGe2nJPmdj06xBZDBmeb1C+/jIO+nzaRTPp8MunjfU8N8UQonVUN6QRMj4Q==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hsejq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 08:41:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AE8fmeO001452; 
 Fri, 14 Nov 2025 08:41:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a9xxn3dkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 08:41:48 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AE8flTJ001446;
 Fri, 14 Nov 2025 08:41:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com
 [10.147.243.7])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AE8fl9l001443
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 08:41:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
 id 563D3534; Fri, 14 Nov 2025 14:11:46 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com, 
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: [PATCH v3 1/4] dt-bindings: misc: qcom,
 fastrpc: Add compatible for Kaanapali
Date: Fri, 14 Nov 2025 14:11:39 +0530
Message-Id: <20251114084142.3386682-2-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: i-tCi5JyHv_C8uccPXBYjw0ToBAWsq_O
X-Proofpoint-ORIG-GUID: i-tCi5JyHv_C8uccPXBYjw0ToBAWsq_O
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=6916eb4e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Nm9LIuUv2BkR6wWcX_kA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2OCBTYWx0ZWRfXzPL2yEKoFCk8
 P26L86OuFgfi9TdarUNVmeMe+tBubZ1hmWxoSnDMjZL/2WJAOPUSvDPYF/zG0pn3MCMkM4JslSH
 X3nOpP81I9Ki2I9PdtMf8+fz0ODHQpLK8LddGYQjNRFDLdZEXWySIufHjmWQf2XBAWrMl7G2mJN
 8NGbBNSkFAX8c+1mQL3I2Pxp6ytlNLYseYqEmOjDL1bt5zkRhWUCZotkil8ns68zRPBqEhkVdgM
 rtN0xldtKR1uijCFYsRcuYMMhYIEF0stngQjZjsu/UfCZuGU75mub6588r/SMB/jUKy4BcRa5L6
 8IOP97shkGOj5k85MdKrc1I0uJFqznphYVWGAMEiJbRQ/M2Tl8c9QUTA+4WB6e6zizTSBxQq6eB
 JFCKUykNEf1V3m0mqvaiZGK/yLNJNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140068
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
index 3f6199fc9ae6..13ba91fe1176 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -18,7 +18,10 @@ description: |
 
 properties:
   compatible:
-    const: qcom,fastrpc
+    items:
+    - enum:
+       - qcom,kaanapali-fastrpc
+       - qcom,fastrpc
 
   label:
     enum:
-- 
2.34.1

