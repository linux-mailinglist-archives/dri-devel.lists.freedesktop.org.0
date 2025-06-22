Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEECAE3021
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jun 2025 15:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E12710E326;
	Sun, 22 Jun 2025 13:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NYWC5rcz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC9910E326
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jun 2025 13:41:02 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M8kJeb029245;
 Sun, 22 Jun 2025 13:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lQnHw0H3V+R4slZhE/pwB4PzpL5RqMlwlF0P1XlfEJc=; b=NYWC5rcziIN2WAw4
 DDBkrCiB6XLzTMARPEneu9wM3wYACzfKkgcn/nZIzu7GTcNQj6yuAd0/fgJJYQB4
 HfGC2ATkdMUGcAx1GOYiX2WDLFjnZKd7Y2EkD8DuXbOcce8RYVCtOGjStOhNgbG7
 WctcSyBKf/jznLU4rieK1D8ESRuyeQroV5wi4RnWH/0lyUY0BFWGCsixC+DO1m9s
 8vY+prK9y7yboufhqQCWqpV6/CVYOOoHG9ReKYhdzZY/MgHiVQc3PkMSt86C2ywy
 B1HmjugokzfPSgPMlz+8j889BKPC/0A6mxZpCtj3FTCbSLEgPRGKwk9z+qIwvXgG
 XdWphw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47e3xggww7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 Jun 2025 13:40:51 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55MDeowS010481
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 Jun 2025 13:40:51 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 22 Jun 2025 06:40:47 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Ling Xu
 <quic_lxu5@quicinc.com>
Subject: [PATCH v3 1/3] dt-bindings: misc: qcom,fastrpc: Add GDSP label
Date: Sun, 22 Jun 2025 19:08:18 +0530
Message-ID: <20250622133820.18369-2-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250622133820.18369-1-quic_lxu5@quicinc.com>
References: <20250622133820.18369-1-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA4NSBTYWx0ZWRfX8fxo46NUdb59
 uTBRQW9lcmxfZabNg5/Y/t7wbN7Y1kUUOJLqjlZcYARDtXZMfBN+8mwBx8CjTy+xPj94PiFM5zS
 oLcdpgNMsIYch5vSN8VhSfm6oPkOGNXIoaJckLtnc7zWNdk1fR8MGTS1QUlMgC5DWx9G/VdWGlK
 aVlamleY7HRa35yRl/ZfOjF2z/VcsBgW2BvEXEDE6wgkairYGQFHKBHgrdkpMnftuwIU4yIoH6i
 B/JVp5c0KtPD7DGTDdGvLv43H1uDPv4jezMKeGalH33xA3ZcsHYUryJbN5Mikvv9HomSNGG49KV
 /ESjscn/c9AjfdmTI8+8w7Y32Fn2tclpML/o79y1Iw2wHgzwbjKSq3VZHjPZXpRJoGcLYPysIFh
 0FK88NO9r/YJzyDUuK9n7ay1zrbww9NOe6ZeovI7iG+ecp9TDoE+3STPlXd53tvgUSAe0lY6
X-Authority-Analysis: v=2.4 cv=e8UGSbp/ c=1 sm=1 tr=0 ts=685807e3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=GRIQVaEDZ677QwRh498A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: g5WljSr0m5M_G_rMufNPgaOvsUWGFGw6
X-Proofpoint-GUID: g5WljSr0m5M_G_rMufNPgaOvsUWGFGw6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_04,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506220085
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

