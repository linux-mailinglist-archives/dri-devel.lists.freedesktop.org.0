Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482FEA3EC17
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 06:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087D510EA1D;
	Fri, 21 Feb 2025 05:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ev9OEKh7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CD910EA1D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 05:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740114507; x=1771650507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=etDWG/V65kok/FyIGXhRuyZcDtjdD116XRDUX+qd1YY=;
 b=ev9OEKh7BrfZ6MVnuxiC4z4o3jJldavlRcYuvdLG/3OmOcT1n6mGK8GN
 /+cFR/LqNPfWGTQUlxoWvmtXdkb8WpAh2huR1YneSXh068VHDJDRNlshg
 nwvS/0RGZ7TRVIos1FzX5ELqSLuRWpFNxVIVclIU1U42DO5yFnxgpjR86
 4AntaGY+5R09xiEBYzICNGBUA7Xjyd/SHYXxZMleSB5kSqdcfY8YDgam2
 b6v6Or0WQ6cz04Ne8hhVgBPGwdkyBx5YPBBxHYQsqffk7jkZlgkvOzKp0
 FQRh+TPz4EXowIcIIFGdZMLDSCrpdp3wX9J8nX3GileYeY1jWoJB0uxFk g==;
X-CSE-ConnectionGUID: 50wVekfFQUeSozCGOND6xA==
X-CSE-MsgGUID: DqEw0J+zRbOqjtA3UeLCpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="28518724"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="28518724"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 21:08:27 -0800
X-CSE-ConnectionGUID: Wg8Byb+5Tm+FjcUkCWp+bw==
X-CSE-MsgGUID: pCEOxuG7QQyLg+ZtG6i1Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="115459300"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 20 Feb 2025 21:08:24 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: arnd@arndb.de, gregkh@linuxfoundation.org,
 andriy.shevchenko@linux.intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 1/2] io.h: drop unused headers
Date: Fri, 21 Feb 2025 10:38:03 +0530
Message-Id: <20250221050804.2764553-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221050804.2764553-1-raag.jadav@intel.com>
References: <20250221050804.2764553-1-raag.jadav@intel.com>
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

