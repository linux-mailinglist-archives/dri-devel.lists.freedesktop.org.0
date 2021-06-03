Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590F2399B82
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 09:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9236E0DA;
	Thu,  3 Jun 2021 07:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by gabe.freedesktop.org (Postfix) with ESMTP id 998206E0DA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 07:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Cu7Es
 3G/4F3KvdpCSwvOPH/npsuhFA7k0V+dMtpqY64=; b=Ao5rV/5D9jzHwD8pop+Ds
 10BS9LpGuhm94achYR/vzS+iVkmJkcDNtRV6eHSysul5y9XQqA3aTU2Qfm1Oya86
 DNRC7ZwY/+a3x7Q2oBxNbpt8ajN8QVPnkPibYLtp7Gompm30M2GnpZxbh/pNx91t
 +IlefjpW+LWDDNTzsZmV6c=
Received: from localhost.localdomain (unknown [218.17.89.92])
 by smtp12 (Coremail) with SMTP id EMCowADHz9ekg7hgadPSuw--.2698S2;
 Thu, 03 Jun 2021 15:24:21 +0800 (CST)
From: lijian_8010a29@163.com
To: FlorianSchandinat@gmx.de
Subject: [PATCH] video: fbdev: via: hw.c:  Fix a typo
Date: Thu,  3 Jun 2021 15:23:22 +0800
Message-Id: <20210603072322.19235-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowADHz9ekg7hgadPSuw--.2698S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrykArW5Aw1UGr1fAr1fWFg_yoWxZFc_CF
 yxZ393WrWqyw109w18JFW3C340vay8uF9av3WDtryfAry7u343trykurySg3y7Ww4UXFnr
 WF4qgr10krySkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUexgA7UUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/1tbi3x+lUGB0GZ9+KwABsz
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lijian <lijian@yulong.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: lijian <lijian@yulong.com>

Change 'orignal' to 'original'.

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/video/fbdev/via/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/via/hw.c b/drivers/video/fbdev/via/hw.c
index 66afd7be00cc..e9d0fac8fb17 100644
--- a/drivers/video/fbdev/via/hw.c
+++ b/drivers/video/fbdev/via/hw.c
@@ -1542,7 +1542,7 @@ static void init_gfx_chip_info(int chip_type)
 		else
 			viaparinfo->chip_info->gfx_chip_revision =
 			CLE266_REVISION_CX;
-		/* restore orignal CR4F value */
+		/* restore original CR4F value */
 		viafb_write_reg(CR4F, VIACR, tmp);
 	}
 
-- 
2.25.1


