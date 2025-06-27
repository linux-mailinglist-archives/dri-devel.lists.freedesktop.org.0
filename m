Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D171AEB4EB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 12:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E60510E9C4;
	Fri, 27 Jun 2025 10:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="aq+W9Xnq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FBC10E9C4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 10:33:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DBiY014502;
 Fri, 27 Jun 2025 10:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lQnHw0H3V+R4slZhE/pwB4PzpL5RqMlwlF0P1XlfEJc=; b=aq+W9XnqtPa8Kj9c
 kR5s2DKbEjRXwGwacmEVlkQiVKz3UeE5eSbSJ4RJWvvNnBVAkZij7KWt5OXGKidR
 eVXOsJDgqNwaJ2swwoJ6gxNtozh2dpK35ixMKYIifcOkJYKLuih4sxQMSCdNL7YP
 f/BPmBwWJ2KJCHMIhL9J6uWOnaN/jkl6E3sWKL817D1eu4eGqGzqIs0cZhA/etOs
 LFHwWaCeU79l0yPv+Eh/vpiwrjTTdSYAnZZ2NnB0m50vIVlld5PpRr2Yl+wanN8V
 EbLZE9TKzc4Mx4RoYlfuGul9+niNc+q6WFv2o8L9tUMXMpp78xoct0H5+WbFfqOA
 UHGieQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm253pk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jun 2025 10:33:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RAXnHN031945
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jun 2025 10:33:49 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 27 Jun 2025 03:33:46 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Ling Xu
 <quic_lxu5@quicinc.com>
Subject: [PATCH v4 1/4] dt-bindings: misc: qcom,fastrpc: Add GDSP label
Date: Fri, 27 Jun 2025 16:03:16 +0530
Message-ID: <20250627103319.2883613-2-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685e738e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=GRIQVaEDZ677QwRh498A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dMiO9sBSuVS8av-mWGzNfBx5eTQ__Kgl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA4NiBTYWx0ZWRfX2kRB8sP1+D37
 o60lWLiV8K9o0bOlbR/0m7bQ0Tav2RhFp/QdcTdcNqOZbaoWwVcMey+Xkj9AqqlXngC66pfL2Wh
 1T5B5s1zwQ26xKY2pKOfdofbLDFDWXXKhQ60YfnxxsXHMCnUVB+sEZCqgEp2QbG40ca/Y7Cpx++
 ol8sbI0AkimszZdo4g1rFV4GVT+GF1AFYupP4gnyziArr5pKw4YLsJAmUljuiRnf6HMP/+z3voB
 EiE5AEgu1ldjoJ0CHxnS52bIqWPFfCHM1l5H3ttKmuSI33R20OJr+ps5FH3ATYAKbfZoWefRf7t
 aslANNfJQp58wpePmDzSsDBvCVEJRdV5g9QpExYTxUT3zwlhkP0YfET/NCSLkATVJWSVEirsPGq
 p7myTeRNVlxqYosI4d8AjoWrah/fhbpH8cIeQ8jRPOS45C9YS8BfAzer+ZUfqXVt2qhQPSew
X-Proofpoint-ORIG-GUID: dMiO9sBSuVS8av-mWGzNfBx5eTQ__Kgl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270086
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

Add "gdsp" as the new supported label for GDSP fastrpc domain.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 0840a3d92513..3f6199fc9ae6 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -27,6 +27,8 @@ properties:
       - sdsp
       - cdsp
       - cdsp1
+      - gdsp0
+      - gdsp1
 
   memory-region:
     maxItems: 1
-- 
2.34.1

