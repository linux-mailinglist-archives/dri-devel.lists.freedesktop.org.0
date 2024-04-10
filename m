Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 679CD89F9A9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 16:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BFB1133B8;
	Wed, 10 Apr 2024 14:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjslAFtA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48D11133B8;
 Wed, 10 Apr 2024 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712758493; x=1744294493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fCunjrKyZnlYQISyasl24JBXuoE2HwtVW3HgvM5T3Hs=;
 b=WjslAFtAACL0vqFLAhrzzLq9BF7pzVxgdKS7Ajn7z3fUoc+45+WP8M8r
 3bsqnC+MHVutbsb7Aj4MlDJ/mEhItplHteJuZEd8mgDnLxUj5nm7CRCy9
 J3AM8p1b+UFH9my1TK74to7GQ1fRDYm7a0zb9hZVftW9PXk68P6SfOP+C
 tI5WOyIkOVkx5boSQSs6zpxggYgNuiVC9pj/Wn5/EWxBvwRMm/pHuV7iv
 fwe3t0bCwGXQVyXkBdpfBS/45v061nDOAlomNjWyagwvWQj7vHhLRsCIt
 ONcOBXP+gqhZZVSFooq3n5vdyRj8czZS6EWIs7d99Y9NHOjJDsa89dzAH w==;
X-CSE-ConnectionGUID: TUhQHcBlT4mfkdtn3Ykopg==
X-CSE-MsgGUID: KRvQmGGoR0+lY6f0Dr2pCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19548984"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="19548984"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:14:52 -0700
X-CSE-ConnectionGUID: vIs5wjMrRfqvHCkNRcUpFw==
X-CSE-MsgGUID: gRexgIVuQ3Kh9i5iCX1vKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20647588"
Received: from oakasatk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.54])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:14:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 2/2] drm/print: drop include seq_file.h
Date: Wed, 10 Apr 2024 17:14:34 +0300
Message-Id: <20240410141434.157908-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410141434.157908-1-jani.nikula@intel.com>
References: <20240410141434.157908-1-jani.nikula@intel.com>
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

