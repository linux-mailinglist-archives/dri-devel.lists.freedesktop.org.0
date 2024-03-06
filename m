Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDF9873F3F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98202113437;
	Wed,  6 Mar 2024 18:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTHgwW3L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8370611342F;
 Wed,  6 Mar 2024 18:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749948; x=1741285948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cqFSp9L8zTwSfSvZpP/DEjDVq7JCV14o6k0myHr1lLs=;
 b=MTHgwW3LsZjS2PoGL2J/7nXcmDANMju9mksmm+TQRXRXlv40N7HG5k8u
 +zyY8kizt9qNhY61TJUQrnlUM5/3iwCfKoWC5lRQnTMCN/JqLRnzk+EAN
 bbj93Tt+wpqb11qLCoZoppiVpgjJI7NcdekPCys1FykdjIH9g5pzDJuVi
 uyIzJ3PwoR/EBxn+7tIIh71NsKggkcFVhWHHllvTTLVZOT3I/y+giA9xN
 jW8gYJpO8kval6idTqnDy4EPrjicB69sNc9SnhmjpCfPEqJfWm7U8CHsB
 MTrKhR116uYzS7Gi539rh3hC6jB0X8hmLJReFNq8OGtW1k5BiBVrP4v6g Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8195737"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8195737"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14496609"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 11/22] drm: fix drm_gem_vram_helper.h kernel-doc
Date: Wed,  6 Mar 2024 20:31:16 +0200
Message-Id: <02000be3455de639f32bde88f632ae8744142083.1709749576.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
References: <cover.1709749576.git.jani.nikula@intel.com>
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

Remove excess funcs kernel-doc.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_gem_vram_helper.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index e18429f09e53..c89c9bafeb44 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -170,7 +170,6 @@ void drm_gem_vram_simple_display_pipe_cleanup_fb(
  * @vram_base:	Base address of the managed video memory
  * @vram_size:	Size of the managed video memory in bytes
  * @bdev:	The TTM BO device.
- * @funcs:	TTM BO functions
  *
  * The fields &struct drm_vram_mm.vram_base and
  * &struct drm_vram_mm.vrm_size are managed by VRAM MM, but are
-- 
2.39.2

