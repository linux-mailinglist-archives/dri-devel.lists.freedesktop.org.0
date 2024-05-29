Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31F08D314B
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B669510ED1D;
	Wed, 29 May 2024 08:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="krMEPuIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651A010E668
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716971391; x=1748507391;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=IP3UyWLF4jjHC9iHoxDS696+aMxwixBXhwROVHFpi4Q=;
 b=krMEPuIiV3QJFoG5wKl1W83CK8gOY5iQUm68v2nyAOVIiKBEPhSdOMTc
 QchmEVF0AoQZwXarg5TtTQjSsaEKRMi07y1D7wz3Twz6/1ITygJjLGHUT
 XM9Fqz9a4GhcH3WmoI/YacUD+9JkDP7lx9Whk+1bfwY2TSikI2EGkPv92
 gl3UE1dKeDTtpwTkINb/QbA0O6jUr8cYnf2JP1PKizovOUQLnisu490Lp
 W+++mqa1K22zhSJxo7KEpW9tEO92yer8ABV7kwLZNUtwqLGblHVJsurZY
 F9NPCb2mn2iHGGjk9Hj77yj94sfXXsEzpXlx0XRytHanIzdXQlOqMsyIp Q==;
X-CSE-ConnectionGUID: AKBreTN4RdiIrb5an1w1Ew==
X-CSE-MsgGUID: PlgEllOAShqI6xJXXcYrvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24492387"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="24492387"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 01:29:50 -0700
X-CSE-ConnectionGUID: AwVVNuV2TpSBI+fBig12bw==
X-CSE-MsgGUID: 97q1MpXERiGDZiQkVbGjJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35440455"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by fmviesa009.fm.intel.com with ESMTP; 29 May 2024 01:29:48 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sCEgr-000DKi-23;
 Wed, 29 May 2024 08:29:45 +0000
Date: Wed, 29 May 2024 16:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [drm-misc:drm-misc-next 6/29] kismet: WARNING: unmet direct
 dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER when selected by
 DRM_KUNIT_TEST
Message-ID: <202405291636.8GgBtK8u-lkp@intel.com>
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
head:   336dca397dcefc5d7436be1fee3c814ed6512996
commit: eb66d34d793ed48494820ce908c8c821b8e6cae5 [6/29] drm/tests: Add output bpc tests
config: x86_64-kismet-CONFIG_DRM_DISPLAY_HDMI_STATE_HELPER-CONFIG_DRM_KUNIT_TEST-0-0 (https://download.01.org/0day-ci/archive/20240529/202405291636.8GgBtK8u-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240529/202405291636.8GgBtK8u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405291636.8GgBtK8u-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER when selected by DRM_KUNIT_TEST
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=y] && DRM_DISPLAY_HDMI_HELPER [=n]
     Selected by [y]:
     - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y] && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
