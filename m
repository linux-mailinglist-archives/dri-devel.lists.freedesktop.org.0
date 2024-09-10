Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEACB9730C3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 12:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2B510E6BF;
	Tue, 10 Sep 2024 10:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MH/f/RyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CBA10E639;
 Tue, 10 Sep 2024 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725962650; x=1757498650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l6mk3WjpbaZWLQPJxdvGSv41/yFxzyk1ceAmeKkLT3w=;
 b=MH/f/RyYMRY/uuKSEfmIA03ShKyyBYZFyDck8KQu9kGMWfFqgpMOyv0w
 CM4gEXeeKIMxFxq0TCIp9TdF93EhZbxawUSlzhEp0V7xnrO/lBerISwgd
 9PzUIE58y2Eb7iXN8wCMdjetoqkrLWcmCzjZEOQ+Jj6em618iI5KHRrrU
 qPt0nCKCoi4PiEdgGtxejPw1aR/W6T5zJ6/AkvJigQsXTQ1/jqy7BDh+P
 sHCszWjx3zuPhtvgE3QnuzXvdDHvwZksRjvGqZFvLXTaNQ/Smyophhzgm
 oXG+Ha0q5qiGesDk2UmMkkRQ2iiJjozDTH1goYFoRJS005zuH4Liu/pSz A==;
X-CSE-ConnectionGUID: sFuOqIJpQrOmztQitx7ajg==
X-CSE-MsgGUID: H9iwIb2fSr+A4UQya9dhNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28479097"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="28479097"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:04:09 -0700
X-CSE-ConnectionGUID: 7wGdo6aESZuaVsV1ybq/CQ==
X-CSE-MsgGUID: /yB22BwiRWuLWVGtCJqG1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="71382016"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:04:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Nathan Chancellor <nathan@kernel.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>
Subject: [PATCH 3/8] drm/kmb: annotate set_test_mode_src_osc_freq_target_{low,
 hi}_bits() with __maybe_unused
Date: Tue, 10 Sep 2024 13:03:39 +0300
Message-Id: <29a83771edd9b85032095ed3ecc1e91a77229b90.1725962479.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725962479.git.jani.nikula@intel.com>
References: <cover.1725962479.git.jani.nikula@intel.com>
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

Building with clang and and W=1 leads to warning about unused
set_test_mode_src_osc_freq_target_low_bits() and
set_test_mode_src_osc_freq_target_hi_bits(). Fix by annotating them with
__maybe_unused.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: Edmund Dea <edmund.j.dea@intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index cf7cf0b07541..faf38ca9e44c 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -818,7 +818,7 @@ static void test_mode_send(struct kmb_dsi *kmb_dsi, u32 dphy_no,
 	}
 }
 
-static inline void
+static inline __maybe_unused void
 	set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_dsi,
 						   u32 dphy_no,
 						   u32 freq)
@@ -830,7 +830,7 @@ static inline void
 		       (freq & 0x7f));
 }
 
-static inline void
+static inline __maybe_unused void
 	set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi,
 						  u32 dphy_no,
 						  u32 freq)
-- 
2.39.2

