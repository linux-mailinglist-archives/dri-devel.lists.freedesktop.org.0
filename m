Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7947A725CAA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 13:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3A289CD3;
	Wed,  7 Jun 2023 11:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id D7C7989CD3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 11:06:52 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxzOrLZIBkFx0AAA--.466S3;
 Wed, 07 Jun 2023 19:06:51 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxGOXKZIBkUW0EAA--.16030S2; 
 Wed, 07 Jun 2023 19:06:50 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/ingenic: Kconfig: select REGMAP and REGMAP_MMIO
Date: Wed,  7 Jun 2023 19:06:50 +0800
Message-Id: <20230607110650.569522-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxGOXKZIBkUW0EAA--.16030S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJr1UJr13Gw45JF1xWrWUKFX_yoW8Gr1Upr
 s8tw18uFZ7ZFW0kFW7AF1xWFy5X3WDXFWSkr93twn09rn8AFWjyr9IyFW5GFyUAry7WrWU
 Xas3KFy7JFy8A3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
 wI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
 04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6x
 kF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU1oGQDUUUUU==
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
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise its failed to pass basic compile test on platform without
REGMAP_MMIO selected by defconfig

make -j$(nproc) ARCH=mips CROSS_COMPILE=mips64el-linux-gnuabi64-

  SYNC    include/config/auto.conf.cmd
  Checking missing-syscalls for N32
  CALL    scripts/checksyscalls.sh
  Checking missing-syscalls for O32
  CALL    scripts/checksyscalls.sh
  CALL    scripts/checksyscalls.sh
  MODPOST Module.symvers
ERROR: modpost: "__devm_regmap_init_mmio_clk" [drivers/gpu/drm/ingenic/ingenic-drm.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
make: *** [Makefile:1978: modpost] Error 2

V2: Order alphabetically

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/ingenic/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index a53f475d33df..b440e0cdc057 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -9,6 +9,8 @@ config DRM_INGENIC
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
+	select REGMAP
+	select REGMAP_MMIO
 	select VT_HW_CONSOLE_BINDING if FRAMEBUFFER_CONSOLE
 	help
 	  Choose this option for DRM support for the Ingenic SoCs.
-- 
2.25.1

