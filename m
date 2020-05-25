Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 928851E07DB
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FA989F43;
	Mon, 25 May 2020 07:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 436 seconds by postgrey-1.36 at gabe;
 Mon, 25 May 2020 07:19:09 UTC
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7D31089C16
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 07:19:09 +0000 (UTC)
Received: from linux.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr2uyb8teEdE4AA--.1329S2;
 Mon, 25 May 2020 15:11:46 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: pxafb: Use correct return value for
 pxafb_probe()
Date: Mon, 25 May 2020 15:11:45 +0800
Message-Id: <1590390705-22898-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxr2uyb8teEdE4AA--.1329S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw18Zw1xXFykWFyrtFyxZrb_yoW3AFb_Cw
 48ur93XryUtr1vg3Wqya15Ary2yF97Wr4fXanrK3yYy347uryfuryUZr1v9FW8Xw4jyFn8
 ZF4qgr1avr4fCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbckFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4x
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
 W8JwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
 0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUIApnUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, linux-fbdev@vger.kernel.org,
 Xuefeng Li <lixuefeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When call function devm_platform_ioremap_resource(), we should use IS_ERR()
to check the return value and return PTR_ERR() if failed.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/video/fbdev/pxafb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index 00b96a7..423331c 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2305,7 +2305,7 @@ static int pxafb_probe(struct platform_device *dev)
 	fbi->mmio_base = devm_platform_ioremap_resource(dev, 0);
 	if (IS_ERR(fbi->mmio_base)) {
 		dev_err(&dev->dev, "failed to get I/O memory\n");
-		ret = -EBUSY;
+		ret = PTR_ERR(fbi->mmio_base);
 		goto failed;
 	}
 
-- 
2.1.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
