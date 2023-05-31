Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4954717D34
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 12:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFF610E1BD;
	Wed, 31 May 2023 10:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B11310E1BD
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 10:28:01 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxpPAwIXdkEO8CAA--.6401S3;
 Wed, 31 May 2023 18:28:00 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77MtIXdk+juCAA--.15700S2; 
 Wed, 31 May 2023 18:27:57 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Bjorn Helgaas <bhelgaas@google.com>, Matthew Wilcox <willy@infradead.org>,
 Ben Hutchings <bhutchings@solarflare.com>,
 Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: [PATCH v2] PCI: Add dummy implement for pci_clear_master() function
Date: Wed, 31 May 2023 18:27:44 +0800
Message-Id: <20230531102744.2354313-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77MtIXdk+juCAA--.15700S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7CryUGr15Xw4UKr1xurWxZwb_yoW8Aw4rpa
 98AFyrCrW8GFy8Gw4UJFyIvF1ag39xZ34Sy3y7Kwn09a9Fya4rtFnYkF17Arn3JrWvkFy3
 Ww17Ka1DWw4YyFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b2AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8Jr0_Cr1U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2
 IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
 6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
 AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
 s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxV
 W8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jjXdbUUUUU=
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
Cc: kernel test robot <lkp@intel.com>, Li Yi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As some arch(m68k for example) doesn't have config_pci enabled, drivers[1]
call pci_clear_master() without config_pci guard can not pass compile test.

   drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c:
   In function 'etnaviv_gpu_pci_fini':
>> drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c:32:9:
   error: implicit declaration of function 'pci_clear_master';
   did you mean 'pci_set_master'? [-Werror=implicit-function-declaration]
      32 |         pci_clear_master(pdev);
         |         ^~~~~~~~~~~~~~~~
         |         pci_set_master
   cc1: some warnings being treated as errors

[1] https://patchwork.freedesktop.org/patch/539977/?series=118522&rev=1

V2:
	* Adjust commit log style to meet the convention and add Fixes tag

Fixes: 6a479079c072 ("PCI: Add pci_clear_master() as opposite of pci_set_master()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202305301659.4guSLavL-lkp@intel.com/
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 include/linux/pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index d0c19ff0c958..71c85380676c 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1904,6 +1904,7 @@ static inline int pci_dev_present(const struct pci_device_id *ids)
 #define pci_dev_put(dev)	do { } while (0)
 
 static inline void pci_set_master(struct pci_dev *dev) { }
+static inline void pci_clear_master(struct pci_dev *dev) { }
 static inline int pci_enable_device(struct pci_dev *dev) { return -EIO; }
 static inline void pci_disable_device(struct pci_dev *dev) { }
 static inline int pcim_enable_device(struct pci_dev *pdev) { return -EIO; }
-- 
2.25.1

