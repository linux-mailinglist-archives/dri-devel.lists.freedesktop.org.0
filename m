Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616CA72494C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 18:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5768310E036;
	Tue,  6 Jun 2023 16:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9647C10E036
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 16:38:00 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxHuvdYH9ksUMAAA--.1017S3;
 Wed, 07 Jun 2023 00:37:49 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Ax6OTdYH9kkb0CAA--.11157S2; 
 Wed, 07 Jun 2023 00:37:49 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/logicvc: Kconfig: select REGMAP and REGMAP_MMIO
Date: Wed,  7 Jun 2023 00:37:49 +0800
Message-Id: <20230606163749.291348-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Ax6OTdYH9kkb0CAA--.11157S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xry8AF4DJryDAw45Zr1kJFc_yoWDAFb_Ww
 4qvrnrGF43uryDtFy7AFWrZ34Yyayj9Fs7Z3Zrt3sag347ArnxXa4a9Fy5XF13W3WUZFyq
 yaykZryYyr1kKosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
 s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
 cSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
 vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
 w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVWU
 JVW8JwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
 0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_
 Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
 8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
 wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
 v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
 Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUUU
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm/logicvc driver is depend on REGMAP and REGMAP_MMIO, should select this
two kconfig option, otherwise the driver failed to compile on platform
without REGMAP_MMIO selected:

ERROR: modpost: "__devm_regmap_init_mmio_clk" [drivers/gpu/drm/logicvc/logicvc-drm.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
make: *** [Makefile:1978: modpost] Error 2

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/logicvc/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/logicvc/Kconfig b/drivers/gpu/drm/logicvc/Kconfig
index fa7a88368809..25325f4c0a9d 100644
--- a/drivers/gpu/drm/logicvc/Kconfig
+++ b/drivers/gpu/drm/logicvc/Kconfig
@@ -2,6 +2,8 @@ config DRM_LOGICVC
 	tristate "LogiCVC DRM"
 	depends on DRM
 	depends on OF || COMPILE_TEST
+	select REGMAP
+	select REGMAP_MMIO
 	select DRM_KMS_HELPER
 	select DRM_KMS_DMA_HELPER
 	select DRM_GEM_DMA_HELPER
-- 
2.25.1

