Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240ADC307D5
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832B810E258;
	Tue,  4 Nov 2025 10:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pv3hx0jO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E51B10E258
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762251944; x=1793787944;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vp3PAvXgg+Gt5ufmYCtHopD75uMDsWsI+tkss7laAik=;
 b=Pv3hx0jO7PuKTCXcj5nTX1RjXr33zZCcFrZgEUzZIUy2qKvbgLpyhzz0
 WGdzyKCGdZrkVDvO1/ffBy3WMU36xXCnxlKbGyMT3v19hYDG5BsMbIMdW
 hc2nB8fiR07bbYQbJw+RW0bTzpFN1ClF/twMQAPklIHpYseJW5T8RCJ/a
 jALhKCvwAWoK2GgFYhyrte31FcMTyz7tVkNS47rnvegCHoiuJoz4evuae
 qm8I/gtmyLud7RN2522dOVyBuBOkYJ16i3sQCgLWr4dhg3KTYmzota0s8
 xW/PIxNzdFj86+zJh++wIaUkD2LsfwoObpX+aLlaL2d2bUve2wboB57ES g==;
X-CSE-ConnectionGUID: 919I18sBRvSmViX4wKUJsg==
X-CSE-MsgGUID: 0rhV4X03Sr6YeORjaAyjYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64039371"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64039371"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:25:44 -0800
X-CSE-ConnectionGUID: L/qlGMReTpKKMkmv1prdNg==
X-CSE-MsgGUID: 0W/ztqs8TTWrFHBHa17GhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="187853376"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:25:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/4] drm/Kconfig: cleanups
Date: Tue,  4 Nov 2025 12:25:34 +0200
Message-ID: <cover.1762251845.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

Clean up drm/Kconfig a bit.

Jani Nikula (4):
  drm/hyperv: move Kconfig under driver directory
  drm/vgem: move Kconfig under driver directory
  drm/Kconfig: move generic Kconfig options above drivers
  drm/Kconfig: sort driver Kconfig source list

 drivers/gpu/drm/Kconfig        | 199 ++++++++++-----------------------
 drivers/gpu/drm/hyperv/Kconfig |  14 +++
 drivers/gpu/drm/vgem/Kconfig   |   9 ++
 3 files changed, 82 insertions(+), 140 deletions(-)
 create mode 100644 drivers/gpu/drm/hyperv/Kconfig
 create mode 100644 drivers/gpu/drm/vgem/Kconfig

-- 
2.47.3

