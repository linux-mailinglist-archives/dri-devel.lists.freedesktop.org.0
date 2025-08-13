Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD3EB23EBE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 05:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1578110E19D;
	Wed, 13 Aug 2025 03:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VbnrGmPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C021E10E19D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 03:07:15 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CJTB38012901;
 Wed, 13 Aug 2025 03:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XaMEShqIo7D+kvQKbClFP1RffU0iExWhMWyy693Ho5w=; b=VbnrGmPeJzI+Zn2E
 UhPZAiKQFnKNfn1pwwSyOoV1qj8gt9+YDs1CbpevawvY3NYyj+HpcMwi/TZZKg4C
 +B72lyerWgzmv9b7zgH5CzCmpJ4TIqUY7e//O7oLgbWm4IMM/n8KDdtQMeM172B6
 CZLoT6syjf3+VXskX6dgFHyuln6GiK859u5xFI/4anvGmamd2dnxU1UGA0vdqRQw
 H6gRufhUOAb/tNt47KPSGx6MqnEZGitBWyCi9Ckce9XJ72paRCuNR18oBpLStZFR
 4JV/4c8k+tRVkOBtUOtp1XnWPJaQt/IACno42r3sNH9VUNDHKhmeInBBEJJSkb46
 fxMB+Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbddgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Aug 2025 03:07:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D378bp027907
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Aug 2025 03:07:08 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 20:07:05 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Ling Xu
 <quic_lxu5@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 1/5] dt-bindings: misc: qcom,fastrpc: Add GDSP label
Date: Wed, 13 Aug 2025 08:36:34 +0530
Message-ID: <20250813030638.1075-2-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813030638.1075-1-quic_lxu5@quicinc.com>
References: <20250813030638.1075-1-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689c015d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=y9j2seIhk4up1NT0-iEA:9 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX1VPkQhMXgJVk
 pgKYcTUFn32l5thbbIDZejCjeb8yBpzC7gWs5SyMPWuahWqZZcFtwssFw0WecApuNgcuqxKJ4fN
 hfQbO9KNi9znp3+imuWAPTtaneKBWTAGQ1WlAwIjEGEAyktK5QFLw0DDpF1BM8JkDL5TLiw7Pix
 bx1vGcpnxH/N9OHYeHGAZHaZJw7re+Tv7+HXNjQQL4Vygd5Xa7SeDKTEsH+MqHC4PuP+6yDsG3c
 0vuBwSqbkDfN+73/KWKbSEyT24JrdszRrXDgr3GJKiGQFF5kwiU1dm6h33WvTLacT/aHS1DpD14
 9bMd09jE+cNY8p5gZmLb6Ww+1ed+0anq/ojJpc+cZggeI7CzeIv9BNRdP16eJyShNKQsY8jxWZN
 AVJyKtUK
X-Proofpoint-ORIG-GUID: EHs3ddc_jtNsomHPfZUEkko0jU6u5aNF
X-Proofpoint-GUID: EHs3ddc_jtNsomHPfZUEkko0jU6u5aNF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097
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

There are some products which support GDSP remoteprocs. GDSP is General
Purpose DSP where tasks can be offloaded. There are 2 GDSPs named gdsp0
and gdsp1. Add "gdsp0" and "gdsp1" as the new supported labels for GDSP
fastrpc domains.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
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

