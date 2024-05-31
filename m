Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590AE8D67B0
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 19:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8E910E05D;
	Fri, 31 May 2024 17:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BTYVxCUi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3F510E673
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 17:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717175334; x=1748711334;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9mMdk1jEo+cYqxnq/VHuXt+Kvb7Vs6u4w3HGCp0rzwE=;
 b=BTYVxCUiK/Mj1KLsQKKFWRWYejkeY7X+fqJY9YzaGhdVe6ngFG2zu1+j
 ioDItp/OCrS3SdIzuFbt1/pypX2SVmKpJ1Kj3X6VtCZ82zRFFhpCZ/sIh
 +NM/+VHZaj/N77xsyKFNHsDZXLlCmqZ3wDR5UA0U7QOBjYqbu45KFsVhX
 FMb1L/H3IM7jnQ9O031iRkh2EZsd7PEwr9haK53R+i8I98WG/jwPpCBsK
 POkjJkWSbyyWfYe71O1JkTY9AvvgCgBCrHFZ1s9Moip9mET72ittxWFnH
 MUST2Rl8dbRBMFiI2xfO1MjQbeA6s/5kvFGNZ6SRvi2sHkwqHIYFSE2TB Q==;
X-CSE-ConnectionGUID: 8VpeXu04RsKqvMn9rfTenw==
X-CSE-MsgGUID: 4bByixc7T9etuI774HU5tA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="25131929"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25131929"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:08:52 -0700
X-CSE-ConnectionGUID: k3q6XVXASyyTwoSwZ8TqMQ==
X-CSE-MsgGUID: Jpe2YRQZT92NRTtY+XEJTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36147847"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP; 31 May 2024 10:08:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 6E01B228; Fri, 31 May 2024 20:08:46 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Pavel Machek <pavel@ucw.cz>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Johan Hovold <jhovold@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 0/4] lm3533: Remove the outdated drivers
Date: Fri, 31 May 2024 19:56:12 +0300
Message-ID: <20240531170844.1595468-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Driver is quite outdated from the Linux kernel internal APIs
perspective. In particular GPIO code is using legacy calls,
that started being replaced by a new API ca. 2014, i.e. ten
years ago.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>

Andy Shevchenko (4):
  backlight: lm3533_bl: Remove the driver
  iio: light: lm3533-als: Remove the driver
  leds: lm3533: Remove the driver
  mfd: lm3533: Remove the driver

 drivers/iio/light/Kconfig           |  17 -
 drivers/iio/light/Makefile          |   1 -
 drivers/iio/light/lm3533-als.c      | 922 ----------------------------
 drivers/leds/Kconfig                |  13 -
 drivers/leds/Makefile               |   1 -
 drivers/leds/leds-lm3533.c          | 755 -----------------------
 drivers/mfd/lm3533-core.c           | 645 -------------------
 drivers/video/backlight/Kconfig     |  11 -
 drivers/video/backlight/Makefile    |   1 -
 drivers/video/backlight/lm3533_bl.c | 399 ------------
 include/linux/mfd/lm3533.h          | 100 ---
 11 files changed, 2865 deletions(-)
 delete mode 100644 drivers/iio/light/lm3533-als.c
 delete mode 100644 drivers/leds/leds-lm3533.c
 delete mode 100644 drivers/mfd/lm3533-core.c
 delete mode 100644 drivers/video/backlight/lm3533_bl.c
 delete mode 100644 include/linux/mfd/lm3533.h

-- 
2.43.0.rc1.1336.g36b5255a03ac

