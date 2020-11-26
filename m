Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E172C628F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 11:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2746EB7F;
	Fri, 27 Nov 2020 10:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102B86E8EC
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 12:02:11 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Chbvr1nDwz74D6;
 Thu, 26 Nov 2020 20:01:44 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Thu, 26 Nov 2020 20:01:59 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>
Subject: [PATCH drm/hisilicon 0/3] Add the new api to install irq 
Date: Thu, 26 Nov 2020 20:02:17 +0800
Message-ID: <1606392140-57954-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:11:27 +0000
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

patch #1 is code refactorings to use devm_drm_dev_alloc and
devm_drm_irq_install.
patch #2 add the new api to install irq, patch #3 is hibmc driver uses
the newly added api to register interrupts.

Tian Tao (3):
  drm/hisilicon: Code refactoring for hibmc_drm_drv
  drm/irq: Add the new api to install irq
  drm/hisilicon: Use the new api devm_drm_irq_install

 drivers/gpu/drm/drm_irq.c                        | 34 ++++++++++++++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  | 56 ++++++++++--------------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h  |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c      |  8 ++--
 include/drm/drm_irq.h                            |  2 +-
 7 files changed, 67 insertions(+), 39 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
