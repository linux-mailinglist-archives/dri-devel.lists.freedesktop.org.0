Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6700F7A441B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 10:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D9410E20B;
	Mon, 18 Sep 2023 08:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10AA10E20B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695024692; x=1726560692;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=PvPLU7tYzqTQFRYSuGXPiWtDWsYveBtmtg1ewX9HYz8=;
 b=VBo2ik19edKI75FER7PkB+zsL9nYjjAqi9v/jZOZnlVmd8w+7+9wgrIr
 b5CML4taf01y0kzT65o5S9XfT9TuOw+MVl7yKiO5MN4GTNeaFJuyiEmCk
 V4/i7Ua9hVQff763VLe8GSlOJvPQIr6+3SE78m3HSxDh5fhg79lqsEk0e
 4JBI8u05QV48m+zacd9nvEDoCQqXa5aMiB+09sC6tVOmFPWo0uC9tGNWk
 ePidSPamhOLAt1sieqtr7LLmhDDabH6AesB5gMdD9tetssrDdWl7NRvR5
 GaZeCeKmzIFayWBUtS/MbVcz1LPUJCPaDhwCXnfBHi29/XrXp6bwNkWDI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="410551286"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="410551286"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 01:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695442804"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="695442804"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
 by orsmga003.jf.intel.com with ESMTP; 18 Sep 2023 01:11:14 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz,
 Jonathan.Cameron@huawei.com, paul@crapouillou.net,
 andriy.shevchenko@linux.intel.com, lars@metafoo.de, rmfrfs@gmail.com,
 jean-baptiste.maneyrol@tdk.com, lee@kernel.org,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com
Subject: [PATCH for-next v2 09/10] mfd: cs42l43: convert to
 EXPORT_NS_GPL_RUNTIME_PM_OPS()
Date: Mon, 18 Sep 2023 13:39:50 +0530
Message-Id: <20230918080951.3615-10-raag.jadav@intel.com>
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
 drivers/mfd/cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 37b23e9bae82..b84adde9f89e 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -1177,7 +1177,7 @@ static int cs42l43_runtime_resume(struct device *dev)
 	return ret;
 }
 
-EXPORT_NS_GPL_DEV_PM_OPS(cs42l43_pm_ops, MFD_CS42L43) = {
+EXPORT_NS_GPL_RUNTIME_PM_OPS(cs42l43_pm_ops, MFD_CS42L43) = {
 	SET_SYSTEM_SLEEP_PM_OPS(cs42l43_suspend, cs42l43_resume)
 	SET_RUNTIME_PM_OPS(cs42l43_runtime_suspend, cs42l43_runtime_resume, NULL)
 };
-- 
2.17.1

