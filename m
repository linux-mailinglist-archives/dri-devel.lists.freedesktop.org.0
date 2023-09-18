Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE757A441C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 10:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216B510E20C;
	Mon, 18 Sep 2023 08:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DEA10E20B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 08:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695024693; x=1726560693;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=SKBpwvJ+2z+sXH/P1raKgMvPz1M4b8A8fYC4yoa4lwM=;
 b=HaNvGj7TlDwAwn+7H/Aq3JiyArMxCN9lXZx2DSkrq0JMtzuTmdSyB4V+
 wZYyv6l8oJ5e8H4pPJfoZyIzaOx5kQSnzIZaaTe5PylH5/dvrZnK1mfhi
 psF5YEMKxYatEfkeuLXOvlnc7mVax4p7BcwxrgqDCPZ2tPaAQnlICZAcw
 Lt52oOiYT7x5d2jgfKdXf5RPEfuHijI/Kx3zgJMFLpHpUbni4AJOfnK1R
 W//Zbx2AUocAmzX4KCOOC4gjVWJNM7h73pBu2+WMhEY0mbOU91Kw3TOz9
 DhNKR7jnrMQkOo2NR1fBY/4s2OTuSxyjgOnssm3FQSRc77RyoAHGOJUHL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="410551299"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="410551299"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 01:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695442857"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="695442857"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
 by orsmga003.jf.intel.com with ESMTP; 18 Sep 2023 01:11:23 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz,
 Jonathan.Cameron@huawei.com, paul@crapouillou.net,
 andriy.shevchenko@linux.intel.com, lars@metafoo.de, rmfrfs@gmail.com,
 jean-baptiste.maneyrol@tdk.com, lee@kernel.org,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com
Subject: [PATCH for-next v2 10/10] ASoC: cs35l41: convert to
 EXPORT_GPL_RUNTIME_PM_OPS()
Date: Mon, 18 Sep 2023 13:39:51 +0530
Message-Id: <20230918080951.3615-11-raag.jadav@intel.com>
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

With original macro being renamed to EXPORT_GPL_RUNTIME_PM_OPS(),
use the new macro.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 sound/soc/codecs/cs35l41.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 4bc64ba71cd6..651aeaa6a5c4 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1454,7 +1454,7 @@ static int cs35l41_sys_resume(struct device *dev)
 	return 0;
 }
 
-EXPORT_GPL_DEV_PM_OPS(cs35l41_pm_ops) = {
+EXPORT_GPL_RUNTIME_PM_OPS(cs35l41_pm_ops) = {
 	RUNTIME_PM_OPS(cs35l41_runtime_suspend, cs35l41_runtime_resume, NULL)
 
 	SYSTEM_SLEEP_PM_OPS(cs35l41_sys_suspend, cs35l41_sys_resume)
-- 
2.17.1

