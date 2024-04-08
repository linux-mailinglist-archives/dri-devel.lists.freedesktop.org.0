Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF60B89BD72
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 12:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63D810F45F;
	Mon,  8 Apr 2024 10:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJIYKpc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBF610F45F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 10:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712572958; x=1744108958;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OU+UZGi1PyA5JjiB1etB2Smvad04FCCAFO2yw6CFAOg=;
 b=IJIYKpc6gxdsApwVtOfVkejZYRK0JwYOK2QDVAB5getflQR4EA4L2iOt
 XWbuC0bGbhDNEbYFWsrtesfceXnlAOiBUFQ4aWhk6ZGI1Hg4c7rPw1Oq0
 x/mBZa/P15d3ExZDeDytou8Hh5LzF41uSk7ior6BTVESf6w8EUJYAAAOi
 r8ezV0fz0CUi47RUQXlimWymwT7IgI/U4IuxFAPIHbV2JDjhY7FqhD/pl
 Ci7IpxRcx4ZwB+ZTtiD6VSrCEXRAYzH+PwHCwXJdYsakYMPgxp20j9cWV
 zT+bWA/gtDkXu/ZTWmf4Ukr70sl7dB1f4ohg/5MMuxhmKyH7ALp+NxA6J w==;
X-CSE-ConnectionGUID: 2oigdd2JQxC1X7LTnEl+sQ==
X-CSE-MsgGUID: 5807E/jpR4KRNsd4nO04ZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="33240592"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="33240592"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 03:42:36 -0700
X-CSE-ConnectionGUID: rHubO+q+T4OFLxEIqLkszQ==
X-CSE-MsgGUID: 3wseCqnFQuyJoAxkxWwSmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="24624471"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 03:42:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH] drm: remove unused header gma_drm.h
Date: Mon,  8 Apr 2024 13:42:30 +0300
Message-Id: <20240408104230.3191827-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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

gma_drm.h has become an empty, unused header. Remove.

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/gma_drm.h | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 include/drm/gma_drm.h

diff --git a/include/drm/gma_drm.h b/include/drm/gma_drm.h
deleted file mode 100644
index 228f43e8df89..000000000000
--- a/include/drm/gma_drm.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/**************************************************************************
- * Copyright (c) 2007-2011, Intel Corporation.
- * All Rights Reserved.
- * Copyright (c) 2008, Tungsten Graphics Inc.  Cedar Park, TX., USA.
- * All Rights Reserved.
- *
- **************************************************************************/
-
-#ifndef _GMA_DRM_H_
-#define _GMA_DRM_H_
-
-#endif
-- 
2.39.2

