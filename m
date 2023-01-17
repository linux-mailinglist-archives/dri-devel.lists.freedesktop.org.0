Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE8366E591
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F61310E31D;
	Tue, 17 Jan 2023 18:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA69510E30F;
 Tue, 17 Jan 2023 18:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673978691; x=1705514691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mjFAk5Yl7unq5VwkxZCfHQDMadAmpn9x0q8TYzUqatY=;
 b=nYDJxU04MG1WQcToHNVch9rDj/DCC2+xxGLhHxCqJ5v6OBqEVbYbAJwT
 jZoiRN1rNjbX253tdbSsTF5KkbwM98d7bhSByyXZtzKsFMGA6nxjP9lPW
 6gBhkSPaGBF6TdeKIpL4+QLp/M6/cJy9H+6Wg6KnnsnksapVBtTf+Sez9
 UUVxchCT1VOWLAS/5eBWnA+QKyuWgWi3FUqhGOCL6puPVLvBjmCc2NkLq
 gyKUHmrpG3hemMn3GFrwsvnHJNu0LxFtmWOJ5Ki4PqGYQRxX7GWIo3jQj
 tUvTuN6w0FaF9k6v2R1bXdLLTT6MElgv3J9plywwQMt2c35DY+pjg1usz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="387116378"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="387116378"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 10:04:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="659467390"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="659467390"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 10:04:49 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm_print: Remove deprecated DRM_DEBUG_KMS_RATELIMITED()
Date: Tue, 17 Jan 2023 19:04:17 +0100
Message-Id: <20230117180417.21066-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117180417.21066-1-nirmoy.das@intel.com>
References: <20230117180417.21066-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Sam Ravnborg <sam@ravnborg.org>, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are no current users of DRM_DEBUG_KMS_RATELIMITED()
so remove it.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 include/drm/drm_print.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a44fb7ef257f..c3753da97c4e 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -605,9 +605,6 @@ void __drm_err(const char *format, ...);
 #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
 	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
 
-/* NOTE: this is deprecated in favor of drm_dbg_kms_ratelimited(NULL, ...). */
-#define DRM_DEBUG_KMS_RATELIMITED(fmt, ...) drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
-
 /*
  * struct drm_device based WARNs
  *
-- 
2.39.0

