Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBF37A4404
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 10:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2AE10E205;
	Mon, 18 Sep 2023 08:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E58810E204
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 08:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695024677; x=1726560677;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=It2kqe+kTCquWeEQ9viRQTyzWE81890eZANk3eir1zY=;
 b=XCShpkjAQ0gMHn8etX7HvdOOO8s6CCTBA61mqeMrm3RpEi9GcoYJc6ix
 bC0SeMqdLbocR62FAujuTUvNv5AHMc9yIuJaDSbuyqJPa8fQ0Szq4S3k2
 gt8fyttkzQIluxPJQMhY3+szT2q2hxPWbIKoaZXROnrcmPER2yXELZvLX
 UxdoxWRDJddkyCk8p0NqwHstSMXRNbSNErjj0F6WkE/y2QlRJDocDFFAN
 25wSnLBiuFBj4ePUQ4QceMGaBEpE+we3I2xSrebbpi2nrxlSpjGL6k0VH
 m+mtzRgE//GwUqPoF6x04uizRdAIz3NA/LgIG4aDjxJpT9mNEgrnkBteV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="410551220"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="410551220"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 01:11:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695442689"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="695442689"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
 by orsmga003.jf.intel.com with ESMTP; 18 Sep 2023 01:11:00 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz,
 Jonathan.Cameron@huawei.com, paul@crapouillou.net,
 andriy.shevchenko@linux.intel.com, lars@metafoo.de, rmfrfs@gmail.com,
 jean-baptiste.maneyrol@tdk.com, lee@kernel.org,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com
Subject: [PATCH for-next v2 07/10] drm/imx/dcss: convert to
 EXPORT_GPL_RUNTIME_PM_OPS()
Date: Mon, 18 Sep 2023 13:39:48 +0530
Message-Id: <20230918080951.3615-8-raag.jadav@intel.com>
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
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 4f3af0dfb344..8544c2db4187 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -318,7 +318,7 @@ static int dcss_dev_runtime_resume(struct device *dev)
 	return 0;
 }
 
-EXPORT_GPL_DEV_PM_OPS(dcss_dev_pm_ops) = {
+EXPORT_GPL_RUNTIME_PM_OPS(dcss_dev_pm_ops) = {
 	RUNTIME_PM_OPS(dcss_dev_runtime_suspend, dcss_dev_runtime_resume, NULL)
 	SYSTEM_SLEEP_PM_OPS(dcss_dev_suspend, dcss_dev_resume)
 };
-- 
2.17.1

