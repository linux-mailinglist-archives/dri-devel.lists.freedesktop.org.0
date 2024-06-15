Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53778909649
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 08:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D009010E2B8;
	Sat, 15 Jun 2024 06:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CMdxIfNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8AF10E2C3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 06:25:07 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45F4tiNJ003425;
 Sat, 15 Jun 2024 06:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=54/pi1I6kA1yluGezlXCaJ
 ZDaE3jYglkDAh2PuWXhZE=; b=CMdxIfNiEz4OWWeaIF/8dt3Y5WF450NuIlrWzp
 5upRngDaqpxG9wvjLOKdaDKiyk6d843LvLHW7LZso7mlk5aFDVXBnXiZgsGXuHXn
 /YzOetMrXngcZLRvpKoVguIHCVTMqx0seo5DFXY/kzUGn2ZQDBSBYwzGIMnC5U+t
 NV58QG34e6AGpjgX9hDphg8HvsQjjWZL1iSA+/wBIwFxTIM4zPgYPunLTELGdaxi
 0KmNYZT+6HJukqkLPv+4ZA7vv2LwrTyulqi1srLICzNbGV1wNOCgDTNGP4T/zmFN
 ujuJxSoU69wAEDLOclzuorxRwZ5W3SpIBp/dU16ynPe9p9+Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys36385r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Jun 2024 06:25:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45F6P2g1009381
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Jun 2024 06:25:02 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Jun
 2024 23:25:02 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Fri, 14 Jun 2024 23:25:00 -0700
Subject: [PATCH] fbdev: offb: add missing MODULE_DESCRIPTION() macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240614-md-powerpc-drivers-video-fbdev-v1-1-5803b38dba18@quicinc.com>
X-B4-Tracking: v=1; b=H4sIALszbWYC/x3NQQrCMBBA0auUWTvQ1FrUq4iLJDOxAzYJE42F0
 rsbXb7N/xsUVuEC124D5SpFUmwwhw78bOODUagZhn4Y+8mMuBDm9GHNHkmlshasQpwwOOKKJvD
 RDyea6HyBFsnKQdb/4HZvdrYwOrXRz7/sU+J7xcWWFyvs+xcv350xjwAAAA==
To: Helge Deller <deller@gmx.de>
CC: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>, "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5dlPrCBJIeJnN-zF3RN_EYQwZzw1Xpo2
X-Proofpoint-ORIG-GUID: 5dlPrCBJIeJnN-zF3RN_EYQwZzw1Xpo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-15_03,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406150046
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

With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/offb.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/video/fbdev/offb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index ea38a260774b..e8ff33894603 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -717,4 +717,5 @@ static void __exit offb_exit(void)
 }
 module_exit(offb_exit);
 
+MODULE_DESCRIPTION("Open Firmware frame buffer device driver");
 MODULE_LICENSE("GPL");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240614-md-powerpc-drivers-video-fbdev-1fe3c25d6d89

