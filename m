Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2457F78D73D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 17:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5679710E554;
	Wed, 30 Aug 2023 15:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3AB9B10E555
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 15:45:50 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Dxg_AqZO9kkyEdAA--.59881S3;
 Wed, 30 Aug 2023 23:45:46 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxviMqZO9kjVRnAA--.12491S2; 
 Wed, 30 Aug 2023 23:45:46 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/3] drm/gma500: Fix the failure to map the stolen memory
Date: Wed, 30 Aug 2023 23:45:43 +0800
Message-Id: <20230830154546.499987-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxviMqZO9kjVRnAA--.12491S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kry3XF1DCr1rtFW7tryfXwc_yoW8Kr4rpF
 Zaqa1agr4kJFWIyr4UWr1UW3Wak3Z7Ca48Xr13Cryxu3WakFWvqr1Dtay3XFW5Xr1DJr4I
 q39rt34S9w48CagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
 wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
 w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
 0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUUU
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

When another discrete video card(SM750 or AST1400) is mounted into the mini
PCIe slot of my ASRock AD2550B-ITX board, the gma500 drivers fails to work.
It probably because the UEFI firmware of that board forget to initialize
the PSB_PGETBL_CTL reg, therefore the value of dev_priv->pge_ctl is 0, then
the value of gtt_phys_start is also 0.

On normal case, the value of the dev_priv->stolen_base is 0xbf800000 for
this board, so the value of the vram_stolen_size will be negative in this
case, the calculation of the stolen vram size of drm/gma500 is pasted at
below:

vram_stolen_size = pg->gtt_phys_start - dev_priv->stolen_base - PAGE_SIZE;
                 = 0 - 0xbf800000 - 4096 = 1056764 KiB

Which is so large, so this cause the ioremap_wc() fail, see below dmesg for
more information.

 gma500 0000:00:02.0: enabling device (0000 -> 0003)
 gma500 0000:00:02.0: GPU: power management timed out.
 gma500 0000:00:02.0: [drm] Phys start of GTT: 0x0
 gma500 0000:00:02.0: [drm] Stolen memory base 0xbf800000, size 1056764KiB
 x86/PAT: systemd-udevd:386 conflicting memory types bf800000-fffff000 write-combining<->uncached-minus
 x86/PAT: memtype_reserve failed [mem 0xbf800000-0xffffefff], track write-combining, req write-combining
 ioremap memtype_reserve failed -16
 gma500 0000:00:02.0: Failure to map stolen base.
 gma500: probe of 0000:00:02.0 failed with error -12

Regardless, we want this driver works even there have another video card
mounted. This patch solve this problem by given 8M stolen memory if the
value of pg->gtt_phys_start is zero. And after apply this patch, it works
fine.

$ dmesg | grep drm

 gma500 0000:00:02.0: [drm] Phys start of GTT: 0x0
 gma500 0000:00:02.0: [drm] Stolen memory base 0xbf800000, size 8192KiB
 [drm] Initialized gma500 1.0.0 20140314 for 0000:00:02.0 on minor 0
 gma500 0000:00:02.0: [drm] fb1: gma500drmfb frame buffer device

Sui Jingfeng (3):
  drm/gma500: Print the stolen memory base and size with drm_info()
  drm/gma500: Print the start address of the GTT
  drm/gma500: Fix the failure to map the stolen memory

 drivers/gpu/drm/gma500/gem.c | 10 +++++++---
 drivers/gpu/drm/gma500/gtt.c |  2 ++
 2 files changed, 9 insertions(+), 3 deletions(-)


base-commit: bb585492db95d4cc7fe3797523ed2bbf5c621d37
-- 
2.34.1

