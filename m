Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591957A4403
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 10:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B4910E203;
	Mon, 18 Sep 2023 08:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD85010E203
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 08:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695024660; x=1726560660;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=bMaJFzdoHE251RPoOCQQLiNWqIMAearCyzsonP9+vmg=;
 b=dZu+o9d0xzJ0wMzJnhjDFsqHGqYaqg91dS2QeOjJySznH+HDDuXpt8ZB
 83JPMpHgNhINkRS4TIYhigRtKBSiuVss6BGimDHYL4aDMpWAHtGvwN8KI
 FIebT0EBCnHPmrlKLM4N+S3eWzFi110x1vkqkbIGLmQHsKaZ98LNczV1I
 Tu1HhM0FA/XC3I5iak//VVUMY6tnZfL9dxgNMdUfdNuMId4B0G/N/REgl
 UkjO0nYoghuIagKRxfMavDtbMC8/s2ulnchpY3YxZmBCizeEED52Uvdpb
 O1tJ5OwFRd68Dpw/sjjPP1AYFsxXtkKxX2nov9MSDBBMoMHwLBmfFSI/1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="410551116"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="410551116"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 01:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695442632"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="695442632"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
 by orsmga003.jf.intel.com with ESMTP; 18 Sep 2023 01:10:54 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz,
 Jonathan.Cameron@huawei.com, paul@crapouillou.net,
 andriy.shevchenko@linux.intel.com, lars@metafoo.de, rmfrfs@gmail.com,
 jean-baptiste.maneyrol@tdk.com, lee@kernel.org,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com
Subject: [PATCH for-next v2 06/10] iio: imu: inv_mpu: convert to
 EXPORT_NS_GPL_RUNTIME_PM_OPS()
Date: Mon, 18 Sep 2023 13:39:47 +0530
Message-Id: <20230918080951.3615-7-raag.jadav@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230918080951.3615-1-raag.jadav@intel.com>
References: <20230918080951.3615-1-raag.jadav@intel.com>
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
Cc: linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 patches@opensource.cirrus.com, mallikarjunappa.sangannavar@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bala.senthil@intel.com, Raag Jadav <raag.jadav@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With original macro being renamed to EXPORT_NS_GPL_RUNTIME_PM_OPS(),
use the new macro.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
index 29f906c884bd..3872514538b7 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
@@ -1795,7 +1795,7 @@ static int inv_mpu_runtime_resume(struct device *dev)
 	return inv_mpu6050_set_power_itg(st, true);
 }
 
-EXPORT_NS_GPL_DEV_PM_OPS(inv_mpu_pmops, IIO_MPU6050) = {
+EXPORT_NS_GPL_RUNTIME_PM_OPS(inv_mpu_pmops, IIO_MPU6050) = {
 	SYSTEM_SLEEP_PM_OPS(inv_mpu_suspend, inv_mpu_resume)
 	RUNTIME_PM_OPS(inv_mpu_runtime_suspend, inv_mpu_runtime_resume, NULL)
 };
-- 
2.17.1

