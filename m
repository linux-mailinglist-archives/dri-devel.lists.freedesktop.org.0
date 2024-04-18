Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE878A9710
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 12:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955BF10FBA2;
	Thu, 18 Apr 2024 10:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifyWc60h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0143210FBA6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713435212; x=1744971212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sJstH1EVtu9SN2moTiBPLLJE3xrhQ8E/lZa10BKtP6I=;
 b=ifyWc60h49EUydfCMjG3FCDJai6ikPXH5VCvwThAoVGRvJ6TSRkJOkgQ
 tjpXx1UPK3+zXkMvT3V/SVP6kpVLsjgodBycEB31TWwtckJcmALMong2l
 KoKWlF3rmPxb0fxReeK5eChFQYuKv+sxsK2BtIfZ6iWjB+bLlUlaX3tYG
 Lqh7PkpR8uP5ZOi5fdD3V7R8G8XnkDh9KdgA5zt869vwdguzPLBKOiYbt
 SGgY4J+20AmO0Wk2w/wVef4NhbighBB6Q4uRCEZ/wEQb23tsnuV3uM+/S
 +ILW1giFs++KJnhU/RxXHRx+x3DVCjj6xaK4p98PhUDawfg6doAfWZJfi Q==;
X-CSE-ConnectionGUID: vtYx+RVVSEuAk6FIXaP8ow==
X-CSE-MsgGUID: 3S0xkcs9SeuxVvfbFWSDPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31454376"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="31454376"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 03:13:26 -0700
X-CSE-ConnectionGUID: 6pBMOFwUTe6Jp4yyFofPQw==
X-CSE-MsgGUID: dIY8O74hQ+We2JZJwAlC4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="46221631"
Received: from oelagadx-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.45.188])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 03:13:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 2/2] drm/print: drop include seq_file.h
Date: Thu, 18 Apr 2024 13:12:47 +0300
Message-Id: <20240418101247.2642864-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240418101247.2642864-1-jani.nikula@intel.com>
References: <20240418101247.2642864-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Never include where a forward declaration will suffice.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20240410141434.157908-2-jani.nikula@intel.com
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_print.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 561c3b96b6fd..089950ad8681 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -28,7 +28,6 @@
 
 #include <linux/compiler.h>
 #include <linux/printk.h>
-#include <linux/seq_file.h>
 #include <linux/device.h>
 #include <linux/dynamic_debug.h>
 
@@ -36,6 +35,7 @@
 
 struct debugfs_regset32;
 struct drm_device;
+struct seq_file;
 
 /* Do *not* use outside of drm_print.[ch]! */
 extern unsigned long __drm_debug;
-- 
2.39.2

