Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75797996D20
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE0C10E72E;
	Wed,  9 Oct 2024 14:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdqdBHd5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F297E10E738
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 14:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728482589; x=1760018589;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uqh+wUltopw1q9AQTVbazDF7LLYCYOzFlotSJz2jWUY=;
 b=bdqdBHd5/7QCQfaE7Xsn46yB+XgTogix9P9z/AsFZ3St7qF1oZk6YT53
 SHcObUE60tmC3oqqE9ybSO/awrmWDCSLAmksoRDSKjQ1S3gTo/gDt4Ge4
 7mrciCZACDYVjTVk0g2t3SLjgOEkWFDeeoxmINSLRM10ZRFbzq+NXto+C
 3eoMJ9Nedcso50EbYV6FwQwLqtNudCe4Ggq6rDXomxa/GGRKjaqOuWASl
 qDQNrqeC/+EA3RemdTc5n/sRRgMb/f3AM8GfaE/bgqxVVzDZiND3a1Q0t
 6D26SOeMXqUZ62GEIEN1xKM65iHod9+jrzNUdPCvfNfoZM10OwQCIQ67j g==;
X-CSE-ConnectionGUID: 63czyIeKSiKdL9LxlHZJag==
X-CSE-MsgGUID: j26PxoPeQGOD/4OL6+7hQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27941655"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="27941655"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 07:03:08 -0700
X-CSE-ConnectionGUID: URsD9vnQTEemgG+Afjk8aw==
X-CSE-MsgGUID: GfEMH94tQ/+k6+3hPajtEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="107085432"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.80])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 07:03:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/file: fix client_name_lock kernel-doc warning
Date: Wed,  9 Oct 2024 17:03:00 +0300
Message-Id: <20241009140300.1980746-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

It's client_name_lock, not name_lock. Also unify style while at it.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20241009172650.29169e6f@canb.auug.org.au
Fixes: 56c594d8df64 ("drm: add DRM_SET_CLIENT_NAME ioctl")
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_file.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index d4f1c115ea0f..f0ef32e9fa5e 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -395,7 +395,10 @@ struct drm_file {
 	 * Userspace-provided name; useful for accounting and debugging.
 	 */
 	const char *client_name;
-	/** @name_lock: Protects @client_name. */
+
+	/**
+	 * @client_name_lock: Protects @client_name.
+	 */
 	struct mutex client_name_lock;
 };
 
-- 
2.39.5

