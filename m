Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B97727516
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 04:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF49B10E004;
	Thu,  8 Jun 2023 02:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF9C210E004
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 02:42:10 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxyOkAQIFko1QAAA--.1118S3;
 Thu, 08 Jun 2023 10:42:08 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxVeT_P4FkcEsGAA--.20555S2; 
 Thu, 08 Jun 2023 10:42:07 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/logicvc: Kconfig: select REGMAP and REGMAP_MMIO
Date: Thu,  8 Jun 2023 10:42:07 +0800
Message-Id: <20230608024207.581401-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxVeT_P4FkcEsGAA--.20555S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xry8AF4DJryDAw45Zr1kJFc_yoWDCrc_Gw
 4vvrnrGF43uryDKFy7AFWrZryYya18uFs7ZFnrt3s5K347Ar13Xaya9ry5Xr13W3WUuF4D
 AaykZFyjyrs7WosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
 s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
 cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
 vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
 w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
 Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
 14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
 04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
 CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jnUUUUUUUU=
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
index fa7a88368809..1df22a852a23 100644
--- a/drivers/gpu/drm/logicvc/Kconfig
+++ b/drivers/gpu/drm/logicvc/Kconfig
@@ -5,5 +5,7 @@ config DRM_LOGICVC
 	select DRM_KMS_HELPER
 	select DRM_KMS_DMA_HELPER
 	select DRM_GEM_DMA_HELPER
+	select REGMAP
+	select REGMAP_MMIO
 	help
 	  DRM display driver for the logiCVC programmable logic block from Xylon
-- 
2.25.1

