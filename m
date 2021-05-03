Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FCF371E64
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 19:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B716E9E4;
	Mon,  3 May 2021 17:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5490D6E9E8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 17:21:40 +0000 (UTC)
IronPort-SDR: uK5QSjR1VyWoZMmmpQcfq+mlW9KWqd0kslLqt2uFdtyTmKdMfKKiOvRIeBOs/HerJICBDniOvY
 XqJ7oOk99HLw==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="283192195"
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; d="scan'208";a="283192195"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 10:21:05 -0700
IronPort-SDR: QFj6XrTZZjjDNCdv/d0EwzzJ5NTva9iC54/5d99ziVuUUgvD9NKjBQ0WKD4PO6ZyQXZceOlnDY
 tntO1a87N82A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; d="scan'208";a="606706383"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga005.jf.intel.com with ESMTP; 03 May 2021 10:21:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 00C9129A; Mon,  3 May 2021 20:21:19 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Phil Reid <preid@electromag.com.au>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] staging: fbtft: Update TODO
Date: Mon,  3 May 2021 20:21:14 +0300
Message-Id: <20210503172114.27891-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503172114.27891-1-andriy.shevchenko@linux.intel.com>
References: <20210503172114.27891-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now, after a few fixes we may consider the conversion to
the GPIO descriptor API is done.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/fbtft/TODO | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/fbtft/TODO b/drivers/staging/fbtft/TODO
index a9f4802bb6be..e72a08bf221c 100644
--- a/drivers/staging/fbtft/TODO
+++ b/drivers/staging/fbtft/TODO
@@ -1,8 +1,3 @@
-* convert all uses of the old GPIO API from <linux/gpio.h> to the
-  GPIO descriptor API in <linux/gpio/consumer.h> and look up GPIO
-  lines from device tree, ACPI or board files, board files should
-  use <linux/gpio/machine.h>
-
 * convert all these over to drm_simple_display_pipe and submit for inclusion
   into the DRM subsystem under drivers/gpu/drm - fbdev doesn't take any new
   drivers anymore.
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
