Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3409059AC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 19:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6AF10E069;
	Wed, 12 Jun 2024 17:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="In6Mmb+3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4242210E069
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 17:10:45 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CAbPQG002327;
 Wed, 12 Jun 2024 17:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=70WnYq+J0sbTiP8arHwPgW
 TppXauHCU2FCPTt2YNUZw=; b=In6Mmb+3jwtye/8BobEJb1xqqI3gOQ4eQubUVm
 i259OlFDZmv4M/4sh7w8jojfshzkrOm3kP+3AJ9pbi+7bojGVYocs8bOhZTNGK//
 Po+BFDylOxxXC+H0t92iBieGLrCKshyK2HC+YNGK5ZE2oKmVK0efIKqwPeHjLHpN
 sonzpQQEXqTYtLpyXzg5V7DOUMML1jPZYpBBkAJTca8LmQX4T/1dAaf9CymhsC32
 LSSFLr7loVObl/blbIWqNCRv3rIHdu0nTDBWnS8uZ6YWPJx1v48AHDQvrB0uYTnv
 xItnuO8ub2jTpztEnncf0B2OwTgR4QKakDNWepVkt7xX4mzw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq4s8j3mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jun 2024 17:10:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45CHAgcr028105
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jun 2024 17:10:42 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 10:10:41 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 12 Jun 2024 10:10:40 -0700
Subject: [PATCH] fbdev: kyro: add missing MODULE_DESCRIPTION() macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-md-drivers-video-fbdev-kyro-v1-1-978b1245e734@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAI/WaWYC/x3MSwrCMBAA0KuUWTvQhlCDVxEX+UztoE1kRkOl9
 O6mLt/mbaAkTAqXbgOhysolNwynDuLs852QUzOY3th+HAwuCZNwJVGsnKjgFBJVfHyloIvOOWP
 P0doAbXgJTbz+9+utOXglDOJznI/zyfmz4uL1TQL7/gM3FWk8jAAAAA==
To: Helge Deller <deller@gmx.de>
CC: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>, "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hdWszw-4DstoNH4nFMzNSRqcSLeJCNwL
X-Proofpoint-ORIG-GUID: hdWszw-4DstoNH4nFMzNSRqcSLeJCNwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_08,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=885 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120124
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

With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/kyro/kyrofb.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/video/fbdev/kyro/fbdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index af6c0581d3e2..08ee8baa79f8 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -811,4 +811,5 @@ module_exit(kyrofb_exit);
 #endif
 
 MODULE_AUTHOR("STMicroelectronics; Paul Mundt <lethal@linux-sh.org>");
+MODULE_DESCRIPTION("STG4000/Kyro/PowerVR 3 driver");
 MODULE_LICENSE("GPL");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240612-md-drivers-video-fbdev-kyro-8c888247c44b

