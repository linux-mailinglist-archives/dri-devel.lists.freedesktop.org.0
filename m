Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5743B9B399D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 19:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A3710E242;
	Mon, 28 Oct 2024 18:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dx9Td8fN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CF110E242;
 Mon, 28 Oct 2024 18:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730141511; x=1761677511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uBlUnvzp1AbBOJrFVlJAunOvF7oh9ITKUSDVP8d4eOo=;
 b=dx9Td8fNHeo3eC0E45vH9eReGr4SB9zTmiu3zaUYLBwGTr/EJrvC074x
 2d4pHUY9Nx1AbClU3pAWoaHH/NAej4pzUt6qBY6nvwRJ0QKGhImHujfTf
 AudBks1ubK9zX2oZ/OV51ks0UsUKgZK5P90OlgTQJlaYCwb5JhxvIn2qr
 AdTjpeZ8QrPku6hVyML9qtSedGOof3Bjudfp62N7f+rf9g++FOHu3g3lN
 l5NkN+swIcJhunW2uDXJFE4sMz7NwbTXi8w7qwDUc5TsRlE1THW2tWmTL
 7+YZtfL7u5nliP3BIm46tB21biX9tR4Ky3sLo0U8KKA+fsofiMDL2PEQ7 A==;
X-CSE-ConnectionGUID: gdvULlvSTkil+O/dV2V3oQ==
X-CSE-MsgGUID: xrjeQtIgRvGG5wvZloWyww==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29210276"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="29210276"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 11:51:51 -0700
X-CSE-ConnectionGUID: Pw7BRuqqTJ6hPkUw+Im0hw==
X-CSE-MsgGUID: ESEBidY/Seqiyd2S7ijMYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="86497284"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.21])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 11:51:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/3] drm/xen: remove redundant initialization info print
Date: Mon, 28 Oct 2024 20:51:39 +0200
Message-Id: <20241028185141.3756176-1-jani.nikula@intel.com>
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

