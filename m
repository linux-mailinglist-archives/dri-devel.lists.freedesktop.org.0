Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0040D24B003
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3236E90E;
	Thu, 20 Aug 2020 07:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FD689E8C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 09:25:50 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 022F5165376BB3DC0107;
 Wed, 19 Aug 2020 17:25:48 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Wed, 19 Aug 2020 17:25:39 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm/hisilicon v2 0/4] Use drm_err instead of DRM_ERROR in
 hibmc driver
Date: Wed, 19 Aug 2020 17:23:30 +0800
Message-ID: <1597829014-39942-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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

patch #1 is using the drm_err instead of DRM_ERROR in hibmc_ttm.c
patch #2 is using the drm_err instead of DRM_ERROR in hibmc_drm_vdac.c
patch #3 is using the drm_err and drm_dbg_atomic instead of DRM_ERROR
and DRM_DEBUG_ATOMIC in hibmc_drm_de.c
patch #4 is using the drm_err and drm_warn instead of DRM_ERROR and
DRM_WARN in hibmc_drm_drv.c

Changes since v1:
-Fixed spelling errors in patch name.

Tian Tao (4):
  drm/hisilicon: Use drm_err instead of DRM_ERROR in hibmc_ttm
  drm/hisilicon: Use drm_err instead of DRM_ERROR in hibmc_drm_vdac
  drm/hisilicon: Use drm_err instead of DRM_ERROR in hibmc_drm_de
  drm/hisilicon: Use drm_err instead of DRM_ERROR in hibmc_drm_drv

 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   | 14 +++++++-------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  | 24 ++++++++++++------------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c |  4 ++--
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c      |  2 +-
 4 files changed, 22 insertions(+), 22 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
