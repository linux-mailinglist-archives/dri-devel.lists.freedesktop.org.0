Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D35149BCE8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 21:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E832810E468;
	Tue, 25 Jan 2022 20:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F6E10E451
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 20:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643142075; x=1674678075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=irQ3/6gwBL9yizU5uUBclawuANglylnqeXDX3dUW+3M=;
 b=lXEVjBdNPciqZC71KzLhKVHcTvsdPTDlfi9k5JbcUdi4nn5ushVCEzuA
 YMdFqrZ2WHH7Ooqvyg8Y/FCBXjS9NWJQjCvv51JhIwJIlJrCA9ek0nzNu
 TNSYy+ROWTmOXyiPbTg+cJ2ecl/+Zyrwg0tHL0mfQbt/Cti3cq1A/vh0x
 wlPLyCs2eygwYiZnX5tYMLGwCazSXjFvU02FQxizpHLalyHtk6Qv9F1fy
 qaQgv8hGD9h77a03ln7JseVU46IU687A04VxVuSFTNYXjqumzuPF5HueW
 gjt5qa5lEJQOUUElAZ2Zf8i8aHL+pT0H0nowdx91CjtmBTMr4l4jdX13q Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="307125508"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="307125508"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 12:21:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="477249112"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 25 Jan 2022 12:21:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 7A8921F1; Tue, 25 Jan 2022 22:21:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Carlis <zhangxuezhi1@yulong.com>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 3/4] fbtft: Kill outdated documentation
Date: Tue, 25 Jan 2022 22:21:16 +0200
Message-Id: <20220125202118.63362-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
 Michael Hennerich <michael.hennerich@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver is in maintenance mode, i.e. no new drivers will be accepted,
and for a long time it is part of the kernel, means no need to clone any
separate sources.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/video/fbtft/README | 32 --------------------------------
 drivers/video/fbtft/TODO   |  3 ---
 2 files changed, 35 deletions(-)
 delete mode 100644 drivers/video/fbtft/README
 delete mode 100644 drivers/video/fbtft/TODO

diff --git a/drivers/video/fbtft/README b/drivers/video/fbtft/README
deleted file mode 100644
index ba4c74c92e4c..000000000000
--- a/drivers/video/fbtft/README
+++ /dev/null
@@ -1,32 +0,0 @@
-  FBTFT
-=========
-
-Linux Framebuffer drivers for small TFT LCD display modules.
-The module 'fbtft' makes writing drivers for some of these displays very easy.
-
-Development is done on a Raspberry Pi running the Raspbian "wheezy" distribution.
-
-INSTALLATION
-  Download kernel sources
-
-  From Linux 3.15
-    cd drivers/video/fbdev/fbtft
-    git clone https://github.com/notro/fbtft.git
-
-    Add to drivers/video/fbdev/Kconfig:   source "drivers/video/fbdev/fbtft/Kconfig"
-    Add to drivers/video/fbdev/Makefile:  obj-y += fbtft/
-
-  Before Linux 3.15
-    cd drivers/video
-    git clone https://github.com/notro/fbtft.git
-
-    Add to drivers/video/Kconfig:   source "drivers/video/fbtft/Kconfig"
-    Add to drivers/video/Makefile:  obj-y += fbtft/
-
-  Enable driver(s) in menuconfig and build the kernel
-
-
-See wiki for more information: https://github.com/notro/fbtft/wiki
-
-
-Source: https://github.com/notro/fbtft/
diff --git a/drivers/video/fbtft/TODO b/drivers/video/fbtft/TODO
deleted file mode 100644
index e72a08bf221c..000000000000
--- a/drivers/video/fbtft/TODO
+++ /dev/null
@@ -1,3 +0,0 @@
-* convert all these over to drm_simple_display_pipe and submit for inclusion
-  into the DRM subsystem under drivers/gpu/drm - fbdev doesn't take any new
-  drivers anymore.
-- 
2.34.1

