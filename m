Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0574AEDD6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2A810E684;
	Wed,  9 Feb 2022 09:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9329A10E684;
 Wed,  9 Feb 2022 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644398381; x=1675934381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+5ngPWnPIFLyTDOF/8itLf4N7yGPGRVVum2BWpz4u8c=;
 b=ZI1BkQRw0Pr2R6mCxgvPNSbVgmrDaP/HmAqJZGf295+fNI+lFpAGyHGl
 y/XwmKaq4YyBydfmOPMcxd0nhIrrpN2ewnRPuG1oTQad3HmKWUhBqtq5U
 CT3P3Mb85+6GmTMPfl1QOszYG6soJS2Ddzb5Uk7NfPxoFepznSudPksVe
 yvcTYbbqF3nHi9/pnHaTktf7B7c2xR2lhczkqoBzagMx9BssIB+YY95ah
 18+EV5dMvKWTVEpvEzUeiqS8eC1bZ99HOgrMk0eICQTNV6GK/Fg5vahNh
 ZWGoTP3yGC6inDqEJAT7LVlgRnKBdqWkqSbGcSLCv+y/hBtznqCk3lm1x Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="247997431"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="247997431"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 01:19:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="525919899"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga007.jf.intel.com with SMTP; 09 Feb 2022 01:19:32 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 09 Feb 2022 11:19:31 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/modes: Fix drm_mode_copy() docs
Date: Wed,  9 Feb 2022 11:19:28 +0200
Message-Id: <20220209091928.14766-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209091928.14766-1-ville.syrjala@linux.intel.com>
References: <20220209091928.14766-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

There is no object id in drm_display_mode anymore.
Remove stale comments to the contrary.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_modes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 1c72208d8133..1f4d9cd188cc 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -880,7 +880,7 @@ EXPORT_SYMBOL(drm_mode_set_crtcinfo);
  * @dst: mode to overwrite
  * @src: mode to copy
  *
- * Copy an existing mode into another mode, preserving the object id and
+ * Copy an existing mode into another mode, preserving
  * list head of the destination mode.
  */
 void drm_mode_copy(struct drm_display_mode *dst, const struct drm_display_mode *src)
-- 
2.34.1

