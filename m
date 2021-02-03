Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6773C30D5DC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 10:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87626EA27;
	Wed,  3 Feb 2021 09:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB686EA27;
 Wed,  3 Feb 2021 09:09:17 +0000 (UTC)
IronPort-SDR: p81RXsLLt0TfAtQ9iewoiMhI4wxCtYRMGP7Dy0EhWmdizXqAod31ndJMZSIqhAUB1TnJbBJEEe
 dhwWPXMoevpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="181086012"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="181086012"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 01:09:16 -0800
IronPort-SDR: iBUxEd65Y1Bmv38cbCxVhzippc/Vipg9M4cOgIQTCg43ApvuJ47hqTdSrzWSmNnYRRnw8nxedQ
 QcyQiqxux6KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="406488887"
Received: from anand-nuc8i7beh.iind.intel.com ([10.145.162.17])
 by fmsmga004.fm.intel.com with ESMTP; 03 Feb 2021 01:09:12 -0800
From: Anand Moon <anandx.ram.moon@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i915/adl_s: ADL-S platform Update PCI ids for Mobile BGA
Date: Wed,  3 Feb 2021 14:40:29 +0530
Message-Id: <20210203091029.2089-1-anandx.ram.moon@intel.com>
X-Mailer: git-send-email 2.30.0
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
Cc: Anand Moon <anandx.ram.moon@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per Bspec: 53655 Update PCI ids for Mobile BGA.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Anand Moon <anandx.ram.moon@intel.com>

diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
index ebd0dd1c35b3..3be25768321d 100644
--- a/include/drm/i915_pciids.h
+++ b/include/drm/i915_pciids.h
@@ -640,6 +640,8 @@
 	INTEL_VGA_DEVICE(0x4681, info), \
 	INTEL_VGA_DEVICE(0x4682, info), \
 	INTEL_VGA_DEVICE(0x4683, info), \
+	INTEL_VGA_DEVICE(0x4688, info), \
+	INTEL_VGA_DEVICE(0x4689, info), \
 	INTEL_VGA_DEVICE(0x4690, info), \
 	INTEL_VGA_DEVICE(0x4691, info), \
 	INTEL_VGA_DEVICE(0x4692, info), \
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
