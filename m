Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FA766E527
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 18:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C6288CE4;
	Tue, 17 Jan 2023 17:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF4010E2F0;
 Tue, 17 Jan 2023 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673977523; x=1705513523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8zU6bxT4r/JWO5cPz6eZBPjLUrBxy5fVwdyiqBMMcK4=;
 b=Tyq/ezuVsbNS1Dk+BmMVOHQvqSL5NAthgg5/8rZKkT5bDFtYS9G5XfXG
 UIupDxiEB/XUBRWGqUIiGugAJD/F3is3UmsRJU320XL4cM1+DebBaJc0M
 NqP6IyNAxReU49S79Ru7YblnX3aFZfq+gf6WXWh4AjJOEaOPYt6DKlUiT
 JZtAi0JwN4XiYKOCj/3WBqmWq9R7JRfAPpMryRSP41/5a4hcG2vKYXWG4
 sRF+nYh8yTTTzs8XLAxzKvUl/MkPaZojDR9Af5ga4lANXpi9WFcWJN7h9
 wT8q9K1ZaSgtO2B9rbBnjUqb5IkdC64laNp13p7PQdKcEwLvyiJL6InHd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="304447951"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="304447951"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 09:45:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="833250900"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="833250900"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 09:45:20 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm_print: Remove deprecated DRM_DEBUG_KMS_RATELIMITED()
Date: Tue, 17 Jan 2023 18:44:47 +0100
Message-Id: <20230117174447.21870-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117174447.21870-1-nirmoy.das@intel.com>
References: <20230117174447.21870-1-nirmoy.das@intel.com>
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

