Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC69F8B240D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 16:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0666011A4A7;
	Thu, 25 Apr 2024 14:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQiMU3lN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3639511A4A7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714055232; x=1745591232;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AMj8GBIK2qx9hLs4ADXwTtXqaHbEx9/BpDAwkFfqL8g=;
 b=DQiMU3lNzR6tyeK2a1n8jckkq/mVuOelC4mMUO3w/mYra+vsiMIgtY4F
 yqbxmoGW5A0JduTJohumL+pxeYqOYX0ZGt8DAQoRg6wHmXmEaDh93QKmg
 GzcAxBpcvhTxR/9VMmyLBBvE1dn+3cDg6UnKRcjOSryrR9wnqPK/dGBhc
 YTxn/luCv0kxIDEcSBUqTKFzkMnTsZc2TK9rM6iR+G6wjTsp60KAq4ocl
 I33rEcfhWAiJ7jg3kL+beOVCCbTA60DWPgLncBy64rnm0QuhgSaRQFLkj
 HUpMcFUv95O/S73pIztwtdT+VepSZhcNbeo4fUqff7fn4xmnT3Ow8k4yv Q==;
X-CSE-ConnectionGUID: /9uI5z6JSEOMEk+EOqMzAg==
X-CSE-MsgGUID: r3FMg2yGScaqVo0uMRb3TA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10281372"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="10281372"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:27:11 -0700
X-CSE-ConnectionGUID: mk5t2bsNSIyut26pxbla8g==
X-CSE-MsgGUID: dm/FMWDlS7KOCXXTemblqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="56027432"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa002.jf.intel.com with ESMTP; 25 Apr 2024 07:27:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id EAD35557; Thu, 25 Apr 2024 17:27:06 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 0/3] drm/panel: ili9341: Obvious fixes
Date: Thu, 25 Apr 2024 17:26:16 +0300
Message-ID: <20240425142706.2440113-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
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

A few obvious fixes to the driver.

Andy Shevchenko (3):
  drm/panel: ili9341: Correct use of device property APIs
  drm/panel: ili9341: Respect deferred probe
  drm/panel: ili9341: Use predefined error codes

 drivers/gpu/drm/panel/Kconfig                |  2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac

