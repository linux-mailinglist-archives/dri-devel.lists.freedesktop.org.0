Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE28E9099EF
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 23:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F93F10E0C9;
	Sat, 15 Jun 2024 21:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ToglYsRd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0D310E0C9
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 21:01:17 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45FL12ea018306;
 Sat, 15 Jun 2024 21:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=3rdlMPl/UjGJyNmiFVwR3A
 A09994lksilMqKf7ZyvhY=; b=ToglYsRd1sQgJmo/VLw8LbyGn/qRDzUHQNPYBN
 BpT8W7ELi4BwQEadnenOiI1E65LgymJ7W6ZZ+DeagoZGaCrbG+g/hdv4DQGYgQcx
 M8F9kT12rUR2cHIoca8C+Np5bbNoT3BhD0MIoYXmPXHDZEaxTw4wqNQeC+8iNk3x
 W3/y7YTWvHdJcsnSKB6oJlEYM2FU56a3kJMb+VFa9/kpDONcZQ0VtXN6wIhhSU4W
 YOreqGJtJWZZaZ2t0XTF0TyAYDxmfwyekvsbVhuwcjIqFyuwdgNqgcDCWC/83NMH
 s1tHc2Tjd2SfZgROcrm5FainOKKw8xmieIAs31N2yFildhtg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys31u1282-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Jun 2024 21:01:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45FL1F6v000770
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Jun 2024 21:01:15 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 15 Jun
 2024 14:01:13 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sat, 15 Jun 2024 14:01:12 -0700
Subject: [PATCH] agp: uninorth: add missing MODULE_DESCRIPTION() macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240615-md-powerpc-drivers-char-agp-v1-1-b79bfd07da42@quicinc.com>
X-B4-Tracking: v=1; b=H4sIABcBbmYC/x3M0QqDMAxA0V+RPC+gpcrYr4w9pG2mgVlLMp0g/
 vu6PR643AOMVdjg1hygvInJkiu6SwNxojwySqoG1zrfDl2Pc8KyfFhLxKSysRrWUJHGgikM3qf
 QX6PzUA9F+Sn7/35/VAcyxqCU4/R7viSvO85kb1Y4zy/65ajgjAAAAA==
To: David Airlie <airlied@redhat.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: GuiBh1OeaLRH8GLIw1ZG47TC9WIt75-3
X-Proofpoint-ORIG-GUID: GuiBh1OeaLRH8GLIw1ZG47TC9WIt75-3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-15_14,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406150160
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
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/uninorth-agp.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/char/agp/uninorth-agp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/char/agp/uninorth-agp.c b/drivers/char/agp/uninorth-agp.c
index 84411b13c49f..b8d7115b8c9e 100644
--- a/drivers/char/agp/uninorth-agp.c
+++ b/drivers/char/agp/uninorth-agp.c
@@ -726,4 +726,5 @@ MODULE_PARM_DESC(aperture,
 		 "\t\tDefault: " DEFAULT_APERTURE_STRING "M");
 
 MODULE_AUTHOR("Ben Herrenschmidt & Paul Mackerras");
+MODULE_DESCRIPTION("Apple UniNorth & U3 AGP support");
 MODULE_LICENSE("GPL");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240615-md-powerpc-drivers-char-agp-db644db58c24

