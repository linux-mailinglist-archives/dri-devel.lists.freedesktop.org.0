Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD14D8CD7B0
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 17:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C728710E8A1;
	Thu, 23 May 2024 15:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PuHSclrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37C110E7B0;
 Thu, 23 May 2024 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716479475; x=1748015475;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MLcJyGKBQhPZDL6wKgOceQVS3NoUzz+ipqtM9LhBHuE=;
 b=PuHSclrFe9VfTwB6lo4EDrTGJi7mwPmJtoaanlPn5OFlWAVOLnR16CdN
 KvFRFqJvN7tPZIYa3Hnc1NSJcyIVcljkba2byYgfVmCeCzTvI0m0LP7yb
 WGIlzBB5XRToFuA7+OaZl6nvcKo80gQu1/2eKfEx6SKfwE/JJAqOop+u6
 CpKTFrT7cUY0bkQ+GOqkyNLVvUBPnfFoO2udj5UpynoRe03biKNxRDT9R
 u2Y+vpLXCe+QKpV9qbtvoR1giMbAI56ANcpPXWCIvgUTqjKZqrof7GeRC
 qLhQMtyKGtPfS94yNsGP2uV/sVWYsIJDS4HGeaP2BFrRip9k3EpstqFe6 w==;
X-CSE-ConnectionGUID: mNflUd43Q2eUD5V5Ma0hAw==
X-CSE-MsgGUID: 0baExm9JTl2s8ONwwl8UOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16644234"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="16644234"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:51:14 -0700
X-CSE-ConnectionGUID: UbujlJOOTdunzCRUwcWlNA==
X-CSE-MsgGUID: Z2dtz4gLQiyahF37x9OuOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="34324832"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:51:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/4] drm: enable -Wformat-truncation
Date: Thu, 23 May 2024 18:51:05 +0300
Message-Id: <cover.1716479340.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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

Jani Nikula (4):
  drm/amdgpu: fix -Wformat-truncation warning in
    amdgpu_gfx_kiq_init_ring()
  drm/nouveau: fix -Wformat-truncation warning in
    nouveau_backlight_init()
  drm/imx: fix -Wformat-truncation warning in imx_ldb_probe()
  drm: enable -Wformat-truncation across the subsystem

 drivers/gpu/drm/Makefile                    | 3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c     | 6 ++++--
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c         | 6 +++++-
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 9 +++++++--
 4 files changed, 17 insertions(+), 7 deletions(-)

-- 
2.39.2

