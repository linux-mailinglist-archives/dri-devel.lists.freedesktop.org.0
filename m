Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05095A77A99
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 14:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6525F10E322;
	Tue,  1 Apr 2025 12:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5fZgBTO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5116510E2DE;
 Tue,  1 Apr 2025 12:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743509927; x=1775045927;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HaiOBqHuFiJ6ixd05DvNz+WuwX4gzteShKVoCBENbV8=;
 b=X5fZgBTOn6oQO2GM8w5QxphREPEFus4w/rfGmGuF1pEAmppTbMSh0RqM
 bXGSIysp1lHFlr+6ShOQhLoHkXDURRReG65x8tvf1RldqOQzn1oS0Bnml
 PEIOMLNIGC4ltx0gAib789Va5apGnVhuL4M4WXNtJIoFDBL81/zrHbVSQ
 4xhU0LnIyjstM5bRGgGIn2Vhr1kEfQ/YHUOCQmWzE90SNFNbgRwcK+0mv
 H5w22/2/DRCQbZ5WwY//U381VC1R8344slQ/cGbQdGMyIPzzWtjtbGy4H
 nV5YSNyK22IyN4j4BDaKoDNeoxQPkjsurcSagOwL3gG6GnPXSmog0Gd3E A==;
X-CSE-ConnectionGUID: 8WPp4vjyTeW4C1t5fLRhFQ==
X-CSE-MsgGUID: PgCd6YAwSKSCJeySadj4JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="70186930"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="70186930"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 05:18:46 -0700
X-CSE-ConnectionGUID: ivyA8vynRjex5Iyoi33rAg==
X-CSE-MsgGUID: KAbHE6hJTWmHsvsLvmC7BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131373404"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 05:18:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Cc: jani.nikula@intel.com, linux-kbuild@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Masahiro Yamada <masahiroy@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/5] hdrtest: hide the disgusting turds
Date: Tue,  1 Apr 2025 15:18:25 +0300
Message-Id: <20250401121830.21696-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
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

Hide all the disgusting turds in .hdrtest subdirectories in the build
tree, and put the extra drm build-time checks behind a kconfig option.


BR,
Jani.


Cc: linux-kbuild@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Jani Nikula (5):
  drm: place header test files in .hdrtest subdirectories
  drm/xe: place header test files in .hdrtest subdirectories
  drm/i915: place header test files in .hdrtest subdirectories
  kbuild: hdrtest: place header test files in .hdrtest subdirectories
  drm: add config option for extra build-time checks

 drivers/gpu/drm/Kconfig       | 21 +++++++++++++++++++--
 drivers/gpu/drm/Makefile      |  6 +++---
 drivers/gpu/drm/i915/Makefile |  6 +++---
 drivers/gpu/drm/xe/Makefile   |  6 +++---
 include/drm/Makefile          |  6 +++---
 usr/include/Makefile          |  4 ++--
 6 files changed, 33 insertions(+), 16 deletions(-)

-- 
2.39.5

