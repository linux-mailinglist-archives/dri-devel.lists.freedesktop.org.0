Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530FBA69F30
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 06:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB02C10E38D;
	Thu, 20 Mar 2025 05:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Zm2s+/o8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E7210E38D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 05:17:14 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JJ5nNP023374;
 Thu, 20 Mar 2025 05:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=gErWp/wF1Wj0f+V3oiP/9N
 AkZLnvUOMTTEDGf3DxA9o=; b=Zm2s+/o8nFtKLRagldLndzuYZn+Hx+K62+H2ZE
 TDfsOYcgfXIy+rMeN8tXhcts59l17apmZOwcD7Bjbh/5soADofKP9udpb4/q72s9
 cxGj80vK8D6KrhJhTooTME2OHEyt3bC+YwJx7TnND+aIe8FBI6sJna2aunAT0CZt
 SdGQMEzyK/43BbcIk9pN8QxLmcICmxGa5cXwAnzKB7zxzRxlUP7z76oCg0zV5E6P
 b6XK8/ephpNUCzFeSlf6rQWJs6DZFSs9svPonW2dW1j+yFzasiOI5H2AKjJdXAmS
 oX5Azt3M2wpAPR2ozM851REkDfVIsjo/cd6+63wnms2l4CRw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g3sf16gn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Mar 2025 05:17:08 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52K5H78n011934
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Mar 2025 05:17:07 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Mar 2025 22:17:03 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <amahesh@qti.qualcomm.com>,
 <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, Ling Xu
 <quic_lxu5@quicinc.com>
Subject: [PATCH 0/2] Add support for gpdsp remoteproc on sa8775p
Date: Thu, 20 Mar 2025 10:46:43 +0530
Message-ID: <20250320051645.2254904-1-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: kYPLtpP1ZG_GsT6jSpwn_KIeNfFwmk_N
X-Proofpoint-ORIG-GUID: kYPLtpP1ZG_GsT6jSpwn_KIeNfFwmk_N
X-Authority-Analysis: v=2.4 cv=R9IDGcRX c=1 sm=1 tr=0 ts=67dba4d4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=mVQdYIaDE-e1hwXU0PQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=734 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200030
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

The fastrpc driver has support for 5 types of remoteprocs. There are
some products which support GPDSP remoteprocs. GPDSPs are General
Purpose DSPs where tasks can be offloaded. Add changes to support GPDSP
remoteprocs and also add GPDSP fastrpc nodes.

Ling Xu (2):
  arm64: dts: qcom: sa8775p: add GPDSP fastrpc-compute-cb nodes
  misc: fastrpc: add support for gpdsp remoteproc

 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 58 +++++++++++++++++++++++++++
 drivers/misc/fastrpc.c                | 10 ++++-
 2 files changed, 66 insertions(+), 2 deletions(-)

-- 
2.34.1

