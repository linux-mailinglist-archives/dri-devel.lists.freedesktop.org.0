Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90964A7DD1F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 14:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9326110E0F5;
	Mon,  7 Apr 2025 12:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="anymPyWj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 594 seconds by postgrey-1.36 at gabe;
 Mon, 07 Apr 2025 12:05:33 UTC
Received: from pv50p00im-ztdg10021801.me.com (pv50p00im-ztdg10021801.me.com
 [17.58.6.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3624810E0F5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 12:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; bh=Z75kDtTMKquraVShLM7bPPJB66WvUMJ0QtUbJjFQFJk=;
 h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
 b=anymPyWjrQHKXWLbTzp5qhjeZc2WbjdqfQgYHsxP3SmB7oAoFj7RauAT55mdnYQR7
 w0unR/JlTIpMBC24xy0XXDAAPFtIRMu4uOkRsFL2SSnkPk/jNH13/dFZOR7PFQLA2m
 gliT4Ukkmd1dcAdSSsULfYzSbkG5wwiM4tbVlL3l+p1Lm9cc5T81eOZ34VZt2n3o3A
 pyYLv8NXk+wuPEC4xAuNO41DDZMu0Xr6FNV5F9yTxFdlIOH+m76ivGFDzCR2gEsUsJ
 HU6ZBYzzLE5DfD7Bg6STnOASObUNAJnw1x5ULuZgWAg2/0rId3A2aE221RvNTpLWZi
 Lf16WFvaI+aiw==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-ztdg10021801.me.com (Postfix) with ESMTPSA id A20402010176;
 Mon,  7 Apr 2025 11:55:34 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Mon, 07 Apr 2025 19:55:20 +0800
Subject: [PATCH] fbdev/nvidiafb: Correct const string length in
 nvidiafb_setup()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-fix_nvidia-v1-1-843f8d031c7d@quicinc.com>
X-B4-Tracking: v=1; b=H4sIACe982cC/x2MQQqAIBAAvyJ7TjAp1L4SEYtutRcLBQnEvycdh
 2GmQqbElGERFRIVznzHDuMgwF8YT5IcOoNWelaTMvLgd4+FA6NEF4z2zqJVFnrwJOr2n61bax/
 BNxyRXAAAAA==
X-Change-ID: 20250407-fix_nvidia-a9d72c98a808
To: Antonino Daplas <adaplas@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: hR7R5pRJtDpg_X92yc7fAbAx09XflHRV
X-Proofpoint-GUID: hR7R5pRJtDpg_X92yc7fAbAx09XflHRV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1011
 malwarescore=0 spamscore=0 mlxlogscore=857 adultscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504070085
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
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

From: Zijun Hu <quic_zijuhu@quicinc.com>

The actual length of const string "noaccel" is 7, but the strncmp()
branch in nvidiafb_setup() wrongly hard codes it as 6.

Fix by using actual length 7 as argument of the strncmp().

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/video/fbdev/nvidia/nvidia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index 8900f181f1952acd2acc16a6ab49a5a42ec056ac..cfaf9454014d8161bedc3598fb68855e04ea9408 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -1484,7 +1484,7 @@ static int nvidiafb_setup(char *options)
 			flatpanel = 1;
 		} else if (!strncmp(this_opt, "hwcur", 5)) {
 			hwcur = 1;
-		} else if (!strncmp(this_opt, "noaccel", 6)) {
+		} else if (!strncmp(this_opt, "noaccel", 7)) {
 			noaccel = 1;
 		} else if (!strncmp(this_opt, "noscale", 7)) {
 			noscale = 1;

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250407-fix_nvidia-a9d72c98a808

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>

