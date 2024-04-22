Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74248ACC88
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 14:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6050112A4B;
	Mon, 22 Apr 2024 12:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YenH/uBS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCA8112A49
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713787835; x=1745323835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sJstH1EVtu9SN2moTiBPLLJE3xrhQ8E/lZa10BKtP6I=;
 b=YenH/uBSh4fylzlDiqATZGx5+97m3l7938Kx/Hr1RuCj/QaJGayukKl0
 Z4yDiA/r69leFtRFLa7K2a69KwMfPqhrz8qO8Xf5MmYhVQNW5bPFETrUn
 zrBg/h8lBTnJ6xifM1Ok63NAT5/ARnZc4flqROxw/REPiB2Ao/9g8ylYD
 V234nCdWB9kk494xb2MpCywjHEarL9FHRR6i8kbsVm70JtsJB3q5dyhAY
 z7ZbsGbG8K4rImKBDnEN/EgutRsLaL4kdcqviEqfe7Bn6/Vk3xaKUK8hH
 xFhHKAF9gtW414+S5zdaDtkkgwWNIaEXKQMmvK3+IOpB3v55AaMGPa9FC w==;
X-CSE-ConnectionGUID: CUI/aQJsRoq+6BwIATPxpQ==
X-CSE-MsgGUID: O/NgNljrQAGt+2BFQa1YjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="26771571"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="26771571"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 05:10:35 -0700
X-CSE-ConnectionGUID: LPzIGxovQK+75BskRfgUXQ==
X-CSE-MsgGUID: uN+rH20jQCqmq20JEvX4cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="24035080"
Received: from ralbanes-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.128])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 05:10:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 2/2] drm/print: drop include seq_file.h
Date: Mon, 22 Apr 2024 15:10:11 +0300
Message-Id: <20240422121011.4133236-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240422121011.4133236-1-jani.nikula@intel.com>
References: <20240422121011.4133236-1-jani.nikula@intel.com>
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

