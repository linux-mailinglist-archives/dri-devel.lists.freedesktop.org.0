Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA219A4764E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 08:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD3F10E152;
	Thu, 27 Feb 2025 07:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzZObun0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D1B10E152
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 07:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740640110; x=1772176110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CYn+J+RYo7NjqKP9XZZaessz4aXZwAjvRg6hXxx+oDw=;
 b=mzZObun053KIG9s0tnX2VZp2u7BNStIuYrAQmzxCCGfXDV9pABlngzJZ
 w7DuT0VJUfjL0FufZHVRf4zHNCuKvbwHsaU4fZknUEdTaVep0/xWrc+Ti
 T0AtAP569dibp58FgeRv0bIMzp6AMV42rwgK3yzS02TVhlHDte5SzYuD/
 aMG3Sr7Q5hyOMRF3YbWoIV3aVA3EdIULOfmm67418En+ZeTr4dub+N3Zw
 /fbJeKAi9dXQwUIh80z42SapmkPczoQzcuy6pCXq9sr9cw3qgP0RR4EHE
 t8KG9yxKmfwVDY2TF6xIew8MeVJvCll8CU/+J47Zr0VBF3IfmbWevXhba w==;
X-CSE-ConnectionGUID: p5MqQOHOR+GmKYNxyKkj+g==
X-CSE-MsgGUID: RwL3uaJfQtG+WWZVRQmkdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52505382"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="52505382"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 23:08:30 -0800
X-CSE-ConnectionGUID: BBjjK3xdQieAwBI/cIRqzA==
X-CSE-MsgGUID: Yb/h9RU0TWykJkybZ04AeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="154125504"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 26 Feb 2025 23:08:28 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: arnd@arndb.de, gregkh@linuxfoundation.org,
 andriy.shevchenko@linux.intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 2/2] io.h: drop unused headers
Date: Thu, 27 Feb 2025 12:37:47 +0530
Message-Id: <20250227070747.3105451-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227070747.3105451-1-raag.jadav@intel.com>
References: <20250227070747.3105451-1-raag.jadav@intel.com>
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

Drop unused headers and type declaration from io.h.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/io.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/io.h b/include/linux/io.h
index 40cb2de73f5e..6a6bc4d46d0a 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -9,13 +9,10 @@
 #include <linux/sizes.h>
 #include <linux/types.h>
 #include <linux/init.h>
-#include <linux/bug.h>
-#include <linux/err.h>
 #include <asm/io.h>
 #include <asm/page.h>
 
 struct device;
-struct resource;
 
 #ifndef __iowrite32_copy
 void __iowrite32_copy(void __iomem *to, const void *from, size_t count);
-- 
2.34.1

