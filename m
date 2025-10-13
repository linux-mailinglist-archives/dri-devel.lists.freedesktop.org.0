Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B88BD180D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 07:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F2910E032;
	Mon, 13 Oct 2025 05:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZjwZ2WTX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC42610E032
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 05:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760334511; x=1791870511;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=1CbkESsOV9wfYLzbIF/AdVP0kpVZargSZR3O7xR55a8=;
 b=ZjwZ2WTXXFRaCPHGBc6JkpAexMwUfbmSYR2eEXnulMBgaY+3sdVGpny3
 Rdf6jKZYY2DmY/Yi06N+9pcrI+n/IJGMQwkSUglHXPXH+mFnp4/9O13oo
 lWZv8j48T6nXw4l40olL/3eXQfb8gyUOBLBB0LBEYdG9pDfXiBSDEnh0z
 kd5JPUEhY3GuTqz7h2h2VZxre2VGNKxeEUn77kHyuiSK7qBNw5mmu4xbL
 P048nkdkxjsuVd9hwFdQ70cvUyYTtP1xZlxh1lEPo6jlXt4cWCkRqc6rX
 GoPEyh3ZuEYKCMX9a2B/7eDHiBY/CtyHLrKsR37keMMw2RlKwYYKQKIGD g==;
X-CSE-ConnectionGUID: uZOxu02lTtOjK/5MGgwqJQ==
X-CSE-MsgGUID: GnhNM5OcRZ2qaioJjv/zCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="80107044"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="80107044"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 22:48:31 -0700
X-CSE-ConnectionGUID: 2tthKyD4STmYNJLs6Ilmgg==
X-CSE-MsgGUID: jKd+E5yDQxy154Hqf4YzPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="181935498"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa009.fm.intel.com with ESMTP; 12 Oct 2025 22:48:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v8BPS-0000BV-0X;
 Mon, 13 Oct 2025 05:48:07 +0000
Date: Mon, 13 Oct 2025 13:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: [drm-misc:drm-misc-next 135/212] ld.lld: error: undefined symbol:
 devm_backlight_device_register
Message-ID: <202510131347.mbEv1p8p-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   5385871282e5c2831c226d32cf2ce26b45a7b164
commit: 7911d8cab55453b6bf59cd1f806503c3dbf0e990 [135/212] drm/panel: visionox-rm69299: Add backlight support
config: x86_64-buildonly-randconfig-003-20251013 (https://download.01.org/0day-ci/archive/20251013/202510131347.mbEv1p8p-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510131347.mbEv1p8p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510131347.mbEv1p8p-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_backlight_device_register
   >>> referenced by panel-visionox-rm69299.c:343 (drivers/gpu/drm/panel/panel-visionox-rm69299.c:343)
   >>>               vmlinux.o:(visionox_rm69299_probe)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
