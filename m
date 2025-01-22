Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E5DA1942A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 15:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F344710E2E7;
	Wed, 22 Jan 2025 14:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIorQ213";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D0D10E254;
 Wed, 22 Jan 2025 14:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737556901; x=1769092901;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/vVryjwKFZlwqb2RtOk0HmrR1kugwyp8+HriSHiskz8=;
 b=TIorQ213sOTAc6JhjN6/mqzY4gZyAnX9Q8inc1t8hbSnIYR9vXZB8qjJ
 zu+nZaGepE2q0pFoaY8Tn4rilGCLixKIBQAQDvI8CaYljNWrEdxJO6ohx
 /kuVJIC6K743XlTw9jk02Kdgl9M36YQxy+Et0lWRLTCOCvkB1oUnIKFsN
 otVVNhK0hCrlxjO6yibOYSSUmWXbjXcvyJGfLO3uSND/AZXPrlEzvT1RO
 fulYdeF5TsydCven3RiSNy6GnHHD47cXbPlopQtqOivxKgWK52WV5akgg
 STpE5UP4hWc/OrBifsexqCpDNkgi89pub+GRCzVZFS5fVkGqyj+4WjfiJ g==;
X-CSE-ConnectionGUID: C8kDXC73RZSSuIOCQFTy9w==
X-CSE-MsgGUID: RcfH6I3WScaqzC5LInCf5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="60484642"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="60484642"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:41:41 -0800
X-CSE-ConnectionGUID: c04bCOSbSVCQSFoObprAmQ==
X-CSE-MsgGUID: DiJumddVQj+WPzL0/aJAZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="107087705"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:41:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 simona.vetter@ffwll.ch, jani.nikula@intel.com
Subject: [PATCH 0/2] drm: add header tests
Date: Wed, 22 Jan 2025 16:41:32 +0200
Message-Id: <cover.1737556766.git.jani.nikula@intel.com>
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

Add CONFIG_DRM_HEADER_TEST to ensure drm headers are self-contained and
pass kernel-doc. And for starters, fix one header that this catches.

Jani Nikula (2):
  drm/client: include types.h to make drm_client_event.h self-contained
  drm: ensure drm headers are self-contained and pass kernel-doc

 Kbuild                         |  1 +
 drivers/gpu/drm/Kconfig        | 11 +++++++++++
 drivers/gpu/drm/Makefile       | 18 ++++++++++++++++++
 include/Kbuild                 |  1 +
 include/drm/Makefile           | 18 ++++++++++++++++++
 include/drm/drm_client_event.h |  2 ++
 6 files changed, 51 insertions(+)
 create mode 100644 include/Kbuild
 create mode 100644 include/drm/Makefile

-- 
2.39.5

