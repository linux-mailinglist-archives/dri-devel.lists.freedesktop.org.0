Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74359716879
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 18:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB5810E3D9;
	Tue, 30 May 2023 16:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 534BE10E3C9;
 Tue, 30 May 2023 16:01:29 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxQ_DWHXZkkKUCAA--.5945S3;
 Wed, 31 May 2023 00:01:26 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxn7PWHXZkp92AAA--.14122S2; 
 Wed, 31 May 2023 00:01:26 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Li Yi <liyi@loongson.cn>
Subject: [PATCH v6 0/6] drm/etnaviv: add pci device driver support
Date: Wed, 31 May 2023 00:01:20 +0800
Message-Id: <20230530160126.2344425-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxn7PWHXZkp92AAA--.14122S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uFyUur4xWryxGF1DtFy3CFg_yoW8Xry5pF
 47JFyYyry0vrW7Kw17AFn8XFy3G3WxWF9Yk3srt3sI9w45Ar1jvryDKa15Jr9xJr1fJr42
 qrnIkry3WF17ArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVWUJVW8JwAS0I0E
 0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzV
 Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
 6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s026x
 CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
 JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
 1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_
 Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8Jb
 IYCTnIWIevJa73UjIFyTuYvjxU25EfUUUUU
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a Vivante GC1000 (v5037) in LS2K1000 and LS7A1000, this GPU is a
PCI device, and it has 2D and 3D cores in the same core. Thus, this patch
set is trying to add PCI device driver support to etnaviv.

v6:
	* Fix build issue on system without CONFIG_PCI enabled

Sui Jingfeng (6):
  drm/etnaviv: add a dedicated function to register an irq handler
  drm/etnaviv: add a dedicated function to get various clocks
  drm/etnaviv: add dedicated functions to create and destroy platform
    devices
  drm/etnaviv: add helpers for private data construction and destruction
  drm/etnaviv: add driver support for the PCI devices
  drm/etnaviv: allow usperspace create cached coherent bo

 drivers/gpu/drm/etnaviv/Kconfig             |   9 +
 drivers/gpu/drm/etnaviv/Makefile            |   2 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 190 ++++++++++++++------
 drivers/gpu/drm/etnaviv/etnaviv_drv.h       |   7 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  22 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |   9 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c       | 185 +++++++++++++------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h       |  13 ++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c   |  87 +++++++++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h   |  12 ++
 include/uapi/drm/etnaviv_drm.h              |  11 +-
 11 files changed, 433 insertions(+), 114 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h

-- 
2.25.1

