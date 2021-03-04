Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175B532E3C2
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 09:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC7A6EB0E;
	Fri,  5 Mar 2021 08:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1056 seconds by postgrey-1.36 at gabe;
 Thu, 04 Mar 2021 09:19:47 UTC
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62736EA17
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=XqR7Y
 MSkZJXyMrPRdGCfI1mzopJWNr2t2Xyn/TQd1K8=; b=CnZPW7rD+VFECVbW1hvAW
 eDYnmPIZx0beEiqe64kTS83tuHwEM+P0O0iJVQTE0T/wSg8jCC2nxGh9upyEIEpl
 qSfwez9mOkkCguHyN4ISV8SaAM/rTW0DNGhMwU5iBJJFBW1S+l6bebOTuqoDwsiT
 zOvbpQSV22IC7Zwu9oSXmA=
Received: from COOL-20201210PM.ccdomain.com (unknown [218.94.48.178])
 by smtp10 (Coremail) with SMTP id DsCowABXZZmyoUBg0zCSng--.12062S2;
 Thu, 04 Mar 2021 17:00:37 +0800 (CST)
From: zuoqilin1@163.com
To: b.zolnierkie@samsung.com, rdunlap@infradead.org, tzimmermann@suse.de,
 vaibhavgupta40@gmail.com, joe@perches.com
Subject: [PATCH] video: Fix typo issue
Date: Thu,  4 Mar 2021 17:00:31 +0800
Message-Id: <20210304090031.2359-1-zuoqilin1@163.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: DsCowABXZZmyoUBg0zCSng--.12062S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFy8AFW7Ww1rCr4DGw4UJwb_yoWfArb_A3
 48WF9rXrW29r1kGr1ktayDZrWay34xXr1UXwnxt34rJFW7Wr9Y934Dur1xWayjgrWUJa43
 Zw1vgFyxXF4fCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUY5HUDUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 52xr1xpolqiqqrwthudrp/xtbBRRVLiVPAKTvT+AAAs4
X-Mailman-Approved-At: Fri, 05 Mar 2021 08:36:53 +0000
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
Cc: zuoqilin <zuoqilin@yulong.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zuoqilin <zuoqilin@yulong.com>

Change 'frequncy' to 'frequency'.

Signed-off-by: zuoqilin <zuoqilin@yulong.com>
---
 drivers/video/fbdev/aty/atyfb_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index e946903a..83b76d3 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -3390,7 +3390,7 @@ static int init_from_bios(struct atyfb_par *par)
 
 		PRINTKI("Mach64 BIOS is located at %x, mapped at %x.\n", rom_addr, bios_base);
 
-		/* check for frequncy table */
+		/* check for frequency table */
 		bios_ptr = (u8*)bios_base;
 		rom_table_offset = (u16)(bios_ptr[0x48] | (bios_ptr[0x49] << 8));
 		freq_table_offset = bios_ptr[rom_table_offset + 16] | (bios_ptr[rom_table_offset + 17] << 8);
-- 
1.9.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
