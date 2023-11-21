Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD997F26D2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 08:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320EB10E24C;
	Tue, 21 Nov 2023 07:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D07A10E24C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 07:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700553557; x=1732089557;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LDIc82kYebRFXXXKJLCrCsib1czP4FuMykMyYp82uag=;
 b=cQvV3hkuy50Y3rELaAWTQDtmiZn6Rk+UmeG4Vvqjs8Vc4TNURTPnbI5T
 lAkao/kxLGOyWDy2/wA6E+WMsaFsj4dqgVgP7EnJ7AzpnsAlIM8K0kDCA
 1yh9+egXISHeIRhi+4mVF/vJoD84vjk/psprGIOnmvp5RA4j59G39mCY6
 BHitmoDHdauvp0SrPgR5UZzwgd46OrYtayuB/ULibL9/4h9PidTsIxR3Z
 1pyS1BnKYYT/7Geo8INrR/SN9AwiCk3RkQYHqajQhbBuaqKl1wMxP22hw
 V1P7Ai45bTeZG1JXlJgr38IlYa/w6Wdvvqspr3mfbI6V2/J2OKQPEnyEq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="477992238"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="477992238"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 23:59:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="890174892"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="890174892"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 20 Nov 2023 23:59:12 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r5Lez-0007X6-2K;
 Tue, 21 Nov 2023 07:59:07 +0000
Date: Tue, 21 Nov 2023 15:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Pagani <marpagan@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH v3] drm/test: add a test suite for GEM objects backed by
 shmem
Message-ID: <202311211542.3ZrZO6J2-lkp@intel.com>
References: <20231120150339.104257-1-marpagan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120150339.104257-1-marpagan@redhat.com>
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
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 Marco Pagani <marpagan@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 oe-kbuild-all@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c79b972eb88b077d2765e7790d0902b3dc94d55c]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Pagani/drm-test-add-a-test-suite-for-GEM-objects-backed-by-shmem/20231120-230829
base:   c79b972eb88b077d2765e7790d0902b3dc94d55c
patch link:    https://lore.kernel.org/r/20231120150339.104257-1-marpagan%40redhat.com
patch subject: [PATCH v3] drm/test: add a test suite for GEM objects backed by shmem
config: arm-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_DRM_KUNIT_TEST-0-0 (https://download.01.org/0day-ci/archive/20231121/202311211542.3ZrZO6J2-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311211542.3ZrZO6J2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211542.3ZrZO6J2-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_KUNIT_TEST
   
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
