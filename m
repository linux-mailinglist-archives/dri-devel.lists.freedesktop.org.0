Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC0C90C237
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 05:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA8010E558;
	Tue, 18 Jun 2024 03:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nQvCLbRA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA5710E558
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 03:05:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I2JK0Y002594;
 Tue, 18 Jun 2024 03:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=RXbcKcpqHxI08Uyn5ghejP
 JXsd+NYiyRlWEwV68XMNY=; b=nQvCLbRA0fXoMsobVD06narvkjbr9iyevPbpcG
 A9kBdj+14z5SSSslSJ334r0a80+ubAOedYOFF6V9F8OjiH6zwejVyco9X3re0q5I
 Ifr8Zr7tDuPGrWcErAFTuElcuLHrzttuOl2B+Ke4BN/R2bnQpgnc6Ynfd+r2XEYV
 m9DXkAGELiwvL3Tm+xWGw4dF6xwsOQtQRfi0D8tyfm6nDM+d0Y440+Oe3HFmg7qF
 Zd/BZfug3kbH4DjwpKsMIxKiKdqw2xKusn9vXDbfBnSo9/I8k71/VWwJByy54mSK
 8miHVRT9ClvVr7d5VyNp/zmWErQfqaNoVWfElAaC3z9L4VtQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu1b0r2m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jun 2024 03:05:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45I35ajf026477
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jun 2024 03:05:36 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 20:05:35 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 17 Jun 2024 20:05:34 -0700
Subject: [PATCH] fbdev: c2p_planar: add missing MODULE_DESCRIPTION() macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240617-md-m68k-drivers-video-fbdev-c2p_planar-v1-1-8262753bb4e8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAH35cGYC/x3NQQ6CMBBA0auQWTtJqYLEqxhipu0gE6GQqTYkh
 LtbXb7N/zskVuEEt2oH5SxJllhQnyrwI8Uno4RisMZeTFtfcQ44t90Lg0pmTZgl8IKDC5zR2/W
 xThRJsanPxpBvms5YKLFVeZDtP7r3xY4So1OKfvzlJ4mfDWdKb1Y4ji/aO+g5lwAAAA==
To: Helge Deller <deller@gmx.de>
CC: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>, "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.14.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BMXs7cZC25eQtLHx2qOpvk9rRR2Q7ech
X-Proofpoint-ORIG-GUID: BMXs7cZC25eQtLHx2qOpvk9rRR2Q7ech
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=997 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180023
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

With ARCH=m68k, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/c2p_planar.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/video/fbdev/c2p_planar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/c2p_planar.c b/drivers/video/fbdev/c2p_planar.c
index ec7ac8526f06..22c8c1b6db60 100644
--- a/drivers/video/fbdev/c2p_planar.c
+++ b/drivers/video/fbdev/c2p_planar.c
@@ -153,4 +153,5 @@ void c2p_planar(void *dst, const void *src, u32 dx, u32 dy, u32 width,
 }
 EXPORT_SYMBOL_GPL(c2p_planar);
 
+MODULE_DESCRIPTION("Fast C2P (Chunky-to-Planar) Conversion");
 MODULE_LICENSE("GPL");

---
base-commit: 6ba59ff4227927d3a8530fc2973b80e94b54d58f
change-id: 20240617-md-m68k-drivers-video-fbdev-c2p_planar-51300ac55802

