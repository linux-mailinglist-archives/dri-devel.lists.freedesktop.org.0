Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE6A8763D1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0D111388D;
	Fri,  8 Mar 2024 11:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CebGMTwz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC5B11388D;
 Fri,  8 Mar 2024 11:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709899050; x=1741435050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=elOtPKkOr4UKttRzpakNREhjj46j10Np7/4B9ThmkmE=;
 b=CebGMTwzt/vEbCkr7cKUDVhBnBq9kN7JMyiRBzE4tMa1jSu1Asdz7Dhy
 T8csmQEVrU8h+9liW6vwgjyKouMJCs2PVukvb/wf6+R1n/sI6ygaYZDyE
 FJ+d5kQN0ou/m56S0nUd/TtSq3J5V6XXx+WACZMHnQnzdJq4XlS60GxoX
 rcNBykGn5VE6guEHXRU5+rei/oClpnuFFRMuNO3+3Ejw1WW4JTjuyTJOQ
 PRuIywR9vV3+wrYt415Bj9jFBgIeXK1XAD9HO6VO9pnYLTFfaJQyNQ3F0
 RtUXcxlXtGsJiRxo+WZIuVugQ4IKuDqMSRHKOzFyDiCoKHkAuPaaZuJ5j A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4794577"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4794577"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:57:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10378619"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:57:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH v2 12/16] drm/ttm: fix ttm_kmap_iter.h kernel-doc warnings
Date: Fri,  8 Mar 2024 13:55:50 +0200
Message-Id: <e80e74ac4b6c5f1df3bc2dd98651ba289aae8e83.1709898638.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709898638.git.jani.nikula@intel.com>
References: <cover.1709898638.git.jani.nikula@intel.com>
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

There's no proper way to document function pointer members, but at least
silence the warnings.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/ttm/ttm_kmap_iter.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/ttm/ttm_kmap_iter.h b/include/drm/ttm/ttm_kmap_iter.h
index cc5c09a211b4..fe72631a6e93 100644
--- a/include/drm/ttm/ttm_kmap_iter.h
+++ b/include/drm/ttm/ttm_kmap_iter.h
@@ -20,7 +20,7 @@ struct iosys_map;
  */
 struct ttm_kmap_iter_ops {
 	/**
-	 * kmap_local() - Map a PAGE_SIZE part of the resource using
+	 * @map_local: Map a PAGE_SIZE part of the resource using
 	 * kmap_local semantics.
 	 * @res_iter: Pointer to the struct ttm_kmap_iter representing
 	 * the resource.
@@ -31,7 +31,7 @@ struct ttm_kmap_iter_ops {
 	void (*map_local)(struct ttm_kmap_iter *res_iter,
 			  struct iosys_map *dmap, pgoff_t i);
 	/**
-	 * unmap_local() - Unmap a PAGE_SIZE part of the resource previously
+	 * @unmap_local: Unmap a PAGE_SIZE part of the resource previously
 	 * mapped using kmap_local.
 	 * @res_iter: Pointer to the struct ttm_kmap_iter representing
 	 * the resource.
-- 
2.39.2

