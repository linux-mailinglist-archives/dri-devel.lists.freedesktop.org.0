Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A29B351A0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 04:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D289A10E2BD;
	Tue, 26 Aug 2025 02:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B29510E2BC
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 02:28:27 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c9s5t14H1z14Mgc;
 Tue, 26 Aug 2025 10:28:18 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
 by mail.maildlp.com (Postfix) with ESMTPS id 7C08B180B6A;
 Tue, 26 Aug 2025 10:28:24 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 26 Aug 2025 10:28:24 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 26 Aug 2025 10:28:23 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <dmitry.baryshkov@oss.qualcomm.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <fengsheng5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 drm-dp 0/4] Fix hibmc driver bugs
Date: Tue, 26 Aug 2025 10:17:40 +0800
Message-ID: <20250826021744.3237574-1-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
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
v4 -> v5:
  - Because some of patches are applied, this series only contains the rest of them.
  - fix the commit and DP detect_ctx(), suggested by Dmitry Baryshkov.
  - fix bugfix commit ID, suggested by Dmitry Baryshkov.
  - remove the 08/11 patch, I'll add in next series.
  - combined 9 and 11 patch together, suggested by Dmitry Baryshkov.
v3 -> v4:
  - remove link training process in hibmc_dp_detect(), suggested by Dmitry Baryshkov.
  - remove if (dev->registered), suggested by Dmitry Baryshkov.
  - remove non-related changes, suggested by Dmitry Baryshkov.
  - Remove the clock check, suggested by Dmitry Baryshkov.
  - ( I'll add them in next series after redesigning this part)
  - add KVM edid in commit message, suggested by Dmitry Baryshkov.
  - fix magic values, suggested by Dmitry Baryshkov.
  - fix the commit subjects, suggested by Dmitry Baryshkov.
v2 -> v3:
  - fix hibmc_connector_get_modes() and hibmc_vdac_detect() to realize BMC KVM, suggested by Dmitry Baryshkov.
  - fix the issue commit ID, suggested by Dmitry Baryshkov.
  - split into 2 commits, suggested by Dmitry Baryshkov.
  - add more comments in commit log, suggested by Dmitry Baryshkov.
---

Baihan Li (4):
  drm/hisilicon/hibmc: fix dp probabilistical detect errors after HPD
    irq
  drm/hisilicon/hibmc: add dp mode valid check
  drm/hisilicon/hibmc: fix no showing problem with loading hibmc
    manually
  drm/hisilicon/hibmc: Adding reset colorbar cfg in dp init.

 .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  2 ++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 19 ++++++++++--
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  2 ++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 31 ++++++++++++++++++-
 4 files changed, 51 insertions(+), 3 deletions(-)

-- 
2.33.0

