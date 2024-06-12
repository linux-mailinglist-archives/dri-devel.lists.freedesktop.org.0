Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E5905767
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 17:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8507F10E8A1;
	Wed, 12 Jun 2024 15:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kMzwwb79";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D8510E8A1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 15:50:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CAbPGg002327;
 Wed, 12 Jun 2024 15:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=qfTgjrU+c9t402lfc6kXmQ
 ihmKH9vn1aemt575x7eyM=; b=kMzwwb79xvjTbt5rROi+QsOVKszqW8CiNPVotT
 an6WOXjjhmbazPTgeDIceny2KDKakbt+s29E+of2VB0kuM5mUUk2ehX8HLWdV7xG
 B6+QRITkQgVjky3yF8mx6qgVGTxZT/kBISCzY5ymct/LNPgFaOg+vVfY/ev2pIwr
 JmVov8lQ8+tkTIGumGh5d8N2f4d3s9lK/k5xXC7qckemgRyMOn76GMh8bUtXzpTw
 qnnUdCyMC0WqgJYHVo76iZVsvpCl1bi6sGQbtb2nkI+ePec1mCIJxogdJW9iteYj
 Kk5cveK5DSnsV7yL5lkqSwiwCaC79Q6EFHUhq8PKqZjxUlug==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq4s8htvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jun 2024 15:50:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45CFosb7021482
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jun 2024 15:50:54 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 08:50:54 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 12 Jun 2024 08:50:53 -0700
Subject: [PATCH] fbdev: viafb: add missing MODULE_DESCRIPTION() macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-md-drivers-video-fbdev-via-v1-1-651f7cd699c4@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAN3DaWYC/x3MQQ6CMBBG4auQWTsJBZXEqxgXLfNXJpFiptiQE
 O5udfe+zdspwxSZbs1OhqJZl1ThTg2Nk09PsEo1dW13bq+u41lYTAssc1HBwjEISm3PvQwSe3c
 BMFAdvA1Rt//8/qgOPoOD+TROv+VL02fj2ecVRsfxBckNVLyLAAAA
To: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>, Helge Deller
 <deller@gmx.de>
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
X-Proofpoint-GUID: Kfn7gG-BakFs6dOAKfuK3YBjxTsIjesn
X-Proofpoint-ORIG-GUID: Kfn7gG-BakFs6dOAKfuK3YBjxTsIjesn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_08,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=931 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120114
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
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/via/viafb.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Description derived from the Kconfig entry
---
 drivers/video/fbdev/via/viafbdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/via/viafbdev.c b/drivers/video/fbdev/via/viafbdev.c
index a52b1ba43a48..6da5ae7d229a 100644
--- a/drivers/video/fbdev/via/viafbdev.c
+++ b/drivers/video/fbdev/via/viafbdev.c
@@ -2144,5 +2144,6 @@ MODULE_PARM_DESC(viafb_lcd_port, "Specify LCD output port.");
 module_param(viafb_dvi_port, charp, S_IRUSR);
 MODULE_PARM_DESC(viafb_dvi_port, "Specify DVI output port.");
 
+MODULE_DESCRIPTION("VIA UniChrome (Pro) and Chrome9 display driver");
 MODULE_LICENSE("GPL");
 #endif

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240612-md-drivers-video-fbdev-via-3d7df315eee7

