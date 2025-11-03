Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8561DC2AB64
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 10:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C3B10E0F8;
	Mon,  3 Nov 2025 09:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nWUtIKLQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDF910E38F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 09:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762161775; x=1793697775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/5rG5FJULrQ72kx1VOZRoHI6We3zqE0nWIkrVwgFI68=;
 b=nWUtIKLQqdoTRhmdEvWDeYyk6rS9tMOAFXaCQBQ2nS5XGgEtD6q2emnG
 BN4oNReZ9EIBT3gMv5WbvRRuZtVreNLihbPZ8Qfv60tojdIZ7Rnir/S3S
 lEO5X0mxX/7lIdcT/aYhl5AApYoee8VL3dArMz4EQBr2KVAxsoQKBtBbV
 xNbkjvhBPSRlwAGO3WLy9Zu+THrEoVkI7prtHxBYQRNM17r2nqdKyzZwF
 bXjztaATUgWUyrulpz5D/tSgUeZHsZxwM9OXt1KSGnXaXNWfuzLYaQwEF
 20i0b/uug0vix+zdy0i6kseQSSwlrTkBlsQ887n1qAg1wKsID0I+Z03cq A==;
X-CSE-ConnectionGUID: GV5UMPNzSTepyFzY5fsZig==
X-CSE-MsgGUID: ECgk/KUHQ/+484Ds8XAgbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64265177"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="64265177"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 01:22:55 -0800
X-CSE-ConnectionGUID: DuttucIiST2vBzNoAb27HQ==
X-CSE-MsgGUID: pZyU7ZE5RA+5xKjLf1EQ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="191159820"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.127])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 01:22:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: jani.nikula@intel.com
Subject: [PATCH 2/2] drm/rockchip: include drm_print.h where needed
Date: Mon,  3 Nov 2025 11:22:39 +0200
Message-ID: <59277a2dd7939ef5fe6e8fc61311873775141ef8.1762161597.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762161597.git.jani.nikula@intel.com>
References: <cover.1762161597.git.jani.nikula@intel.com>
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

rockchip_drm_vop2.c depends on drm_print.h being indirectly included via
drm_buddy.h, drm_mm.h, or ttm/ttm_resource.h. Include drm_print.h
explicitly.

Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
Closes: https://lore.kernel.org/r/9c67c29b-06e9-469b-9273-eaac368632d6@suse.de
Fixes: f6e8dc9edf96 ("drm: include drm_print.h where needed")
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 284c8a048034..e979d5e02ff4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -29,6 +29,7 @@
 #include <drm/drm_flip_work.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
-- 
2.47.3

