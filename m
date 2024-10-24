Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56479AEBCA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 18:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D24C10E190;
	Thu, 24 Oct 2024 16:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZDF0Euv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5400210E190
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729786967; x=1761322967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uBlUnvzp1AbBOJrFVlJAunOvF7oh9ITKUSDVP8d4eOo=;
 b=RZDF0EuvjoLh3Kvy2u2hL+7+SS+5Q2cOp7HWXfSC6q5ZH7ZEgvfJUDK7
 6aylTxlm9JtT4c7Ojw5DTtd9fDqUEyDid2P35mdppSfZfN169IFgnX6df
 4iO5VXmGFCXW5YdzFBWfdfr+SEKawnvyERloSRblQPnYVuaxFXIOyFrW/
 xc3N0LgHZR27Du0PjosHnTvpNr2SpaKm420E8Pzb2G30vXKiXtQx9n27T
 0AAHrQEpvUnzsu7Q1/m+Hk2ve/T+UyWFumRjy3vPOhP8DS3wZvGVl8qW0
 IPVVZdoh4dNBxG4J4jmdR2EVmjGY9mWkm1C7R4I1f8rCsqPt2Pqo713Od w==;
X-CSE-ConnectionGUID: sBmdTPNgR0yntd3vUTXmxQ==
X-CSE-MsgGUID: +BUHLUKqQd+mk93jjXDQeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33232059"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="33232059"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 09:22:47 -0700
X-CSE-ConnectionGUID: s8OL97kCQLuUn7GPZIxirw==
X-CSE-MsgGUID: tIMidi+FRlWuj/N1Wqaq+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="84615714"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 09:22:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] drm/xen: remove redundant initialization info print
Date: Thu, 24 Oct 2024 19:22:39 +0300
Message-Id: <20241024162240.2398664-1-jani.nikula@intel.com>
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

drm_dev_register() already prints the same information on successful
init. Remove the redundant prints.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Note: I prefer to merge this together with the next patch via
drm-misc-next.

Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: xen-devel@lists.xenproject.org
---
 drivers/gpu/drm/xen/xen_drm_front.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index aab79c5e34c2..931d855bfbe8 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -525,11 +525,6 @@ static int xen_drm_drv_init(struct xen_drm_front_info *front_info)
 	if (ret)
 		goto fail_register;
 
-	DRM_INFO("Initialized %s %d.%d.%d %s on minor %d\n",
-		 xen_drm_driver.name, xen_drm_driver.major,
-		 xen_drm_driver.minor, xen_drm_driver.patchlevel,
-		 xen_drm_driver.date, drm_dev->primary->index);
-
 	return 0;
 
 fail_register:
-- 
2.39.5

