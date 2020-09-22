Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3F227529E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45EE89DB7;
	Wed, 23 Sep 2020 07:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C296E127
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 12:47:05 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7C254AA28BC1671FAC51;
 Tue, 22 Sep 2020 20:47:03 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Tue, 22 Sep 2020 20:46:56 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm/hisilicon v3 0/2] support reading resolutions from EDID 
Date: Tue, 22 Sep 2020 20:44:28 +0800
Message-ID: <1600778670-60370-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:19 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

patch #1 add a new file to implements i2c adapters, #2 read the
resolution from the edid, if that fails, set the resolution to fixed.
and update the destroy callback function to release the i2c adapters

Changes since v1:
-merge patch #3 into patch #2.
-add new function to_hibmc_drm_private, modify three functions in
hibmc_drm_i2c.c with the newly added function.
-deleting the member variable dev from the structure hibmc_connector.
-modify print log incorrectly.
-Modify hibmc_connector_get_modes.

Changes since v2:
-rewrite the function to_hibmc_drm_private, and rename GPIO_SCL_MASK
to I2C_SCL_MASK

Tian Tao (2):
  drm/hisilicon: Support i2c driver algorithms for bit-shift adapters
  drm/hisilicon: Features to support reading resolutions from EDID

 drivers/gpu/drm/hisilicon/hibmc/Makefile         |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h  | 25 +++++-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c  | 99 ++++++++++++++++++++++++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 38 ++++++++-
 4 files changed, 158 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
