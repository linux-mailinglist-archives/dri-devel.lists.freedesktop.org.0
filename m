Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F7693D670
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 17:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8874B10E148;
	Fri, 26 Jul 2024 15:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dNnbEwV4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E2310E148
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 15:53:30 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QBA21a021948
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 15:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=3pwMPD4vKFrH2S0d1j0WGE
 B29+mN3TVnBQryTzNlfEc=; b=dNnbEwV4QhLebUAZxqJzIJ0mtW9BZkZqfjwoE/
 MwpUnY9ILP2pn1AM7EYaE8o2t+8w5vZIDiq+B8Xicvuf0bc4yjuEwCPkxUO3/QMl
 E5lHGspqID5mV/rEDmlw1Gw5TAeNs8Bgbj/K85gOZOQPIVutprHyMshOs3h2hAnu
 9CvSvgJcQfczXXnXAbmR26b+5aOoRQv2ypyjBdRdZ4Kx6a/qsyzxbHoc0PRriKTr
 +ey/k5eBI84zkI7DTv2Nii55Wq0yHIA1WOofiVPTJAapkGMj+PuQGmUtIc9dPm/3
 cDHio5C5i24hVPUdXCLjyw9IHLnoNGZ7QuG/kAciwZbbtwxA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40m1sv1v1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 15:53:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46QFrSI7006406
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 15:53:28 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 26 Jul 2024 08:53:27 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <quic_carlv@quicinc.com>
CC: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] MAINTAINERS: qaic: Drop Pranjal as reviewer
Date: Fri, 26 Jul 2024 09:53:10 -0600
Message-ID: <20240726155310.765164-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hTrW-LVUHI3t2ULCwCW-khvQNYZdNiDY
X-Proofpoint-GUID: hTrW-LVUHI3t2ULCwCW-khvQNYZdNiDY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=794 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407260107
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

Pranjal's email address is bouncing.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 71b739b40921..258f6236ac1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18461,7 +18461,6 @@ F:	include/dt-bindings/clock/qcom,*
 QUALCOMM CLOUD AI (QAIC) DRIVER
 M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
 R:	Carl Vanderlip <quic_carlv@quicinc.com>
-R:	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-- 
2.34.1

