Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B66B09BD6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747A810E8E7;
	Fri, 18 Jul 2025 07:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7583310E8E7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 07:01:25 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bk0yW6FPRz2RVFY;
 Fri, 18 Jul 2025 14:59:15 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
 by mail.maildlp.com (Postfix) with ESMTPS id 9A4021400FD;
 Fri, 18 Jul 2025 15:01:22 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Jul 2025 15:01:22 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Jul 2025 15:01:21 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <dmitry.baryshkov@oss.qualcomm.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <fengsheng5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 drm-dp 00/11] Fix hibmc driver bugs
Date: Fri, 18 Jul 2025 14:51:14 +0800
Message-ID: <20250718065125.2892404-1-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq100007.china.huawei.com (7.202.195.175)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Baihan Li <libaihan@huawei.com>

There are some bugfix for hibmc-drm driver.
---
ChangeLog:
v2 -> v3:
  - fix hibmc_connector_get_modes() and hibmc_vdac_detect() to realize BMC KVM, suggested by Dmitry Baryshkov.
  - fix the issue commit ID, suggested by Dmitry Baryshkov.
  - split into 2 commits, suggested by Dmitry Baryshkov.
  - add more comments in commit log, suggested by Dmitry Baryshkov.
---

Baihan Li (11):
  drm/hisilicon/hibmc: fix the i2c device resource leak when vdac init
    failed
  drm/hisilicon/hibmc: fix dp probabilistical detect errors after HPD
    irq
  drm/hisilicon/hibmc: fix irq_request()'s irq name variable is local
  drm/hisilicon/hibmc: fix the hibmc loaded failed bug
  drm/hisilicon/hibmc: fix rare monitors cannot display problem
  drm/hisilicon/hibmc: add dp mode valid check
  drm/hisilicon/hibmc: fix dp and vga cannot show together
  drm/hisilicon/hibmc: fix no showing when no connectors connected
  drm/hisilicon/hibmc: fix no showing problem with loading hibmc
    manually
  drm/hisilicon/hibmc: adapting modification for the former commit
  drm/hisilicon/hibmc: modification for the former commit

 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 51 ++++++++++----
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  8 +++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 +++++++---
 .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 12 ----
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 64 ++++++++++++++++--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 22 ++++---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  5 ++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |  5 ++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  | 66 +++++++++++++------
 10 files changed, 201 insertions(+), 69 deletions(-)

-- 
2.33.0

