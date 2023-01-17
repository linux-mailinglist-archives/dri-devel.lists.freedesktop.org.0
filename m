Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A8766E5A3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4799A10E59F;
	Tue, 17 Jan 2023 18:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B305B10E59F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:10:16 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30HHueDE005859; Tue, 17 Jan 2023 18:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=NcDDCrkTX4wtMuBqKMPjNce21bQxjTwahbcsqHHhL24=;
 b=CwK6sKDbIaIvzp/WUQ0hASkJWX4NdqZXKQeBp14DaRhQEUf1AMC6xvo17W3Em+PUYIqR
 mJUb0OusNnv5wMBuZ2YKh52NujYhsCYpXfBVpDWRHIoLtCO6z0BOxgu/+cPyZQRvU2uN
 DfsFQQlRI8fqCk4Wk2WaPlSCJlR5JsJG2R+l7C+u42j0xV5UvotmmHNt6tIrYsYyijth
 6UwJhR3l92LbAzqtUvKlRtlrYmSrWbh3XJIFQz3KwnSfEgQpWo7S5AJyH4D6nGaReNqQ
 VCLyAn8izIpCXIaVNSFyxJCfvSIrIoiieLOpsIk/nVsobGTS3bzzfDpmDBWNgtUR9qWk cg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n5t4j90kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 18:10:11 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30HIAAat008993
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 18:10:10 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 17 Jan 2023 10:04:52 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <ogabbay@kernel.org>
Subject: [PATCH] MAINTAINERS/ACCEL: Add include/drm/drm_accel.h to the accel
 entry
Date: Tue, 17 Jan 2023 11:04:30 -0700
Message-ID: <1673978670-10110-1-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vsXpI4nrplNA7WmZ6Izmp3Yo9vTxIDNX
X-Proofpoint-ORIG-GUID: vsXpI4nrplNA7WmZ6Izmp3Yo9vTxIDNX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_09,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 mlxscore=0 spamscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=948
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301170144
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

get_maintainer.pl does not suggest Oded Gabbay, the DRM COMPUTE
ACCELERATORS DRIVERS AND FRAMEWORK maintainer for changes that touch
the Accel Subsystem header - drm_accel.h.  This is because that file is
missing from the Accel Subsystem entry.  Fix this.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 31ffd4b..7995ec7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6754,6 +6754,7 @@ C:	irc://irc.oftc.net/dri-devel
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git
 F:	Documentation/accel/
 F:	drivers/accel/
+F:	include/drm/drm_accel.h
 
 DRM DRIVERS FOR ALLWINNER A10
 M:	Maxime Ripard <mripard@kernel.org>
-- 
2.7.4

