Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F717A4401
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 10:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C1B10E200;
	Mon, 18 Sep 2023 08:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9B010E200
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 08:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695024647; x=1726560647;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=r1CpW7kgq3if3Jc00gzYCuqJwiMxcedcZb4XZfdjY5A=;
 b=YNF2BEJnTC7FB/D9rDKLl+f9Ld+ag9epgwtUYRN8ebzvz0KBrMPx7Xp0
 w8kVPZeBsFD+bIQlONXpQWd5+TcOJrCIL3/TA2wh5tuQ0TXc7uTN3/tfQ
 YmvVKB7u2vx5TgEpMGkwUkP0aFtRgxH40Djb4o8nd6WxDnglp7bWaWdVL
 8Nns+39o2VfxW0JVy6iUClk9IliYp+pimaU+vLzj8sVfsJ6BdY45cJal0
 D1dkrZjS5AZTOQGZuIbBdqN+w6Z0+C5R9CWX/KLUpgaOudLDfhVYk27mV
 8Xf8x/idOtZvvtyq6EVsLPMefc6SYZJ2CEAJk31yboL0Ko+bvB3N9Iz9p Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="410551024"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="410551024"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 01:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695442515"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="695442515"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
 by orsmga003.jf.intel.com with ESMTP; 18 Sep 2023 01:10:40 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz,
 Jonathan.Cameron@huawei.com, paul@crapouillou.net,
 andriy.shevchenko@linux.intel.com, lars@metafoo.de, rmfrfs@gmail.com,
 jean-baptiste.maneyrol@tdk.com, lee@kernel.org,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com
Subject: [PATCH for-next v2 04/10] iio: gyro: fxas21002c: convert to
 EXPORT_NS_GPL_RUNTIME_PM_OPS()
Date: Mon, 18 Sep 2023 13:39:45 +0530
Message-Id: <20230918080951.3615-5-raag.jadav@intel.com>
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
 drivers/iio/gyro/fxas21002c_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/gyro/fxas21002c_core.c b/drivers/iio/gyro/fxas21002c_core.c
index c28d17ca6f5e..ccea3dd7be28 100644
--- a/drivers/iio/gyro/fxas21002c_core.c
+++ b/drivers/iio/gyro/fxas21002c_core.c
@@ -1047,7 +1047,7 @@ static int fxas21002c_runtime_resume(struct device *dev)
 	return fxas21002c_mode_set(data, FXAS21002C_MODE_ACTIVE);
 }
 
-EXPORT_NS_GPL_DEV_PM_OPS(fxas21002c_pm_ops, IIO_FXAS21002C) = {
+EXPORT_NS_GPL_RUNTIME_PM_OPS(fxas21002c_pm_ops, IIO_FXAS21002C) = {
 	SYSTEM_SLEEP_PM_OPS(fxas21002c_suspend, fxas21002c_resume)
 	RUNTIME_PM_OPS(fxas21002c_runtime_suspend, fxas21002c_runtime_resume,
 		       NULL)
-- 
2.17.1

