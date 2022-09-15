Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4065B9FAB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 18:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236D110EB70;
	Thu, 15 Sep 2022 16:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A49510EB77
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 16:32:19 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.143])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4MT2Nm3Lv8zKFS7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 00:15:20 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.102.38])
 by APP2 (Coremail) with SMTP id Syh0CgD3SXMJUCNjZ9+RAw--.21521S4;
 Fri, 16 Sep 2022 00:17:14 +0800 (CST)
From: Wei Yongjun <weiyongjun@huaweicloud.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panel: ws2401: Silent no spi_device_id warning
Date: Thu, 15 Sep 2022 16:34:37 +0000
Message-Id: <20220915163437.2519754-1-weiyongjun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgD3SXMJUCNjZ9+RAw--.21521S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw4kCryrtF17JF45Kr1fCrg_yoWkJrg_Cw
 43ZF17Xr45CryxWFy3ua1fZ3Za9w4a9r1kZ3Wrta4fuF47Xrn8Zas7ur1UX34UXa42yFn8
 A3WkXF43Cr1xtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbrkYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
 Y4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
 A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
 67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAq
 x4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6x
 CaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCa
 FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
 Wlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I
 6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r
 1I6r4UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
 YxBIdaVFxhVjvjDU0xZFpf9x07UAManUUUUU=
X-CM-SenderInfo: 5zhl50pqjm3046kxt4xhlfz01xgou0bp/
X-CFilter-Loop: Reflected
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
Cc: Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

Add spi_device_id entries to silent following SPI warning:

SPI driver ws2401-panel has no spi_device_id for samsung,lms380kf01

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/panel/panel-widechips-ws2401.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-widechips-ws2401.c b/drivers/gpu/drm/panel/panel-widechips-ws2401.c
index 236f3cb2b594..368570776ccd 100644
--- a/drivers/gpu/drm/panel/panel-widechips-ws2401.c
+++ b/drivers/gpu/drm/panel/panel-widechips-ws2401.c
@@ -425,9 +425,16 @@ static const struct of_device_id ws2401_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ws2401_match);
 
+static const struct spi_device_id ws2401_ids[] = {
+	{ "lms380kf01" },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, ws2401_ids);
+
 static struct spi_driver ws2401_driver = {
 	.probe		= ws2401_probe,
 	.remove		= ws2401_remove,
+	.id_table	= ws2401_ids,
 	.driver		= {
 		.name	= "ws2401-panel",
 		.of_match_table = ws2401_match,
-- 
2.34.1

