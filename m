Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC141CE50DD
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 14:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46A410E04A;
	Sun, 28 Dec 2025 13:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFhwVz5Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDF910E04A
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 13:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766930100; x=1798466100;
 h=date:from:to:cc:subject:message-id;
 bh=1aIeLn0NqWjvQsnzMr6H2H+VV3QWGju4iydj8qCuDs4=;
 b=KFhwVz5QJKTopTPF+6WZEHd8tMr/5VFhzDk5NEmZcjqsuAaEuQ3Dvpyv
 U85S+s4OO1m1zI+t/ezbs2nfKEeZefsaIql6CxSOz9RtjSmohO7WkjxfC
 XP0MrKdoi5+w1aCHwSdGoqcx1gVpeYzeBdQ+C8X6V0RjduGlDMolf4CLu
 UXbqHo4MmLZZJHOdPbbdWuWlz/gRDUxgNLYRKd6tpCtIWkZoQ3kxiDJxZ
 HL3wB/vvPJNOCrzlFRAxEvUI+6AVL1pviAXuqboMiNoF4lv+olmPpm+IV
 fgbcBg72+e0XgfkKYFlfcvkgDHdc9efIMA/0q2RNh5HbPxy83re1BkbXs A==;
X-CSE-ConnectionGUID: UajO6yy/T6Wf6/fudE+6HQ==
X-CSE-MsgGUID: BWU0PUZVQEWbxecf7QxX6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="72428498"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; d="scan'208";a="72428498"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2025 05:54:59 -0800
X-CSE-ConnectionGUID: vJ+aBdz+RWSTPwD13ATejg==
X-CSE-MsgGUID: z5Fg6G/qROSTvHmdJb3ZpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; d="scan'208";a="238142039"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 28 Dec 2025 05:54:58 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vZrEV-000000006VN-49xc;
 Sun, 28 Dec 2025 13:54:55 +0000
Date: Sun, 28 Dec 2025 21:54:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [drm-misc:for-linux-next 2/4] ERROR: modpost:
 "drm_connector_hdmi_audio_plugged_notify"
 [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!
Message-ID: <202512282143.ftK5h4OP-lkp@intel.com>
User-Agent: s-nail v14.9.25
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

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git for-linux-next
head:   130343ee6bca9895c47d314467db7dd3dcc8bc35
commit: c08c123d4cd6ec3ee482d607e29388d0db2d3f1d [2/4] drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
config: riscv-randconfig-r062-20251228 (https://download.01.org/0day-ci/archive/20251228/202512282143.ftK5h4OP-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512282143.ftK5h4OP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512282143.ftK5h4OP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_connector_hdmi_audio_plugged_notify" [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
