Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 767BB28ED6E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 09:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85BF6EC23;
	Thu, 15 Oct 2020 07:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C09788C11
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 08:49:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.141.241])
 by APP-05 (Coremail) with SMTP id zQCowACHjo6Su4ZfalFxAg--.31249S2;
 Wed, 14 Oct 2020 16:49:24 +0800 (CST)
From: Xu Wang <vulab@iscas.ac.cn>
To: b.zolnierkie@samsung.com,
	pakki001@umn.edu,
	yuehaibing@huawei.com
Subject: [PATCH] omapfb/dss: Remove redundant null check before
 clk_prepare_enable/clk_disable_unprepare
Date: Wed, 14 Oct 2020 08:49:20 +0000
Message-Id: <20201014084920.25813-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowACHjo6Su4ZfalFxAg--.31249S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFy8CFyfJFWDAr15Kry3Jwb_yoWkXrX_C3
 WDurZxGFZ0gw4Ik34ktws8ArZ7tFyvvFWrWr92v3yfKFy7Wry3ZrWDArsxA39rWF40yF4j
 vwnFg3W8Ar1fCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb2xYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GFyl42xK82IY
 c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
 vE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
 87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4DGYDUUUU
X-Originating-IP: [124.16.141.241]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiAxAJA13qZbuZhgAAsv
X-Mailman-Approved-At: Thu, 15 Oct 2020 07:08:24 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because clk_prepare_enable() and clk_disable_unprepare() already checked
NULL clock parameter, so the additional checks are unnecessary, just
remove them.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/video/fbdev/omap2/omapfb/dss/venc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
index 0b0ad20afd63..8895fb8493d8 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
@@ -890,8 +890,7 @@ static int venc_remove(struct platform_device *pdev)
 
 static int venc_runtime_suspend(struct device *dev)
 {
-	if (venc.tv_dac_clk)
-		clk_disable_unprepare(venc.tv_dac_clk);
+	clk_disable_unprepare(venc.tv_dac_clk);
 
 	dispc_runtime_put();
 
@@ -906,8 +905,7 @@ static int venc_runtime_resume(struct device *dev)
 	if (r < 0)
 		return r;
 
-	if (venc.tv_dac_clk)
-		clk_prepare_enable(venc.tv_dac_clk);
+	clk_prepare_enable(venc.tv_dac_clk);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
