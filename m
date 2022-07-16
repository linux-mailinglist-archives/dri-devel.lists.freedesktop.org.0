Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EB25771FA
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 00:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E82E11389F;
	Sat, 16 Jul 2022 22:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4062B112FA4
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 22:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658011206; x=1689547206;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2YQkD4BjvM1cGTkcL0PNufQPGS4qHR99g7AC9E6LZjc=;
 b=JHJcQox60pe7AGSf4fKlOTAhoIsy2fuYgSYM/KaAwwIeiLmjGbiECyxI
 xYEw24KPNKRv1mN80Smb6Izj8UGxTQjQ4RQlEJ3d7TsNizUGJp7RYoPab
 +74FvTjejxIUZ8U2GZ1MDDiEuZfPyi0FcIYoTrayOYSEsVTQvkqzu2ToS
 a5ovCni3l1s8pgpoZl/oFVvxMfLWeeQHv2xm6xC5iORUgbJp/KZveZZLd
 nUoy8uM9XxvyT1yzes5PLHvJKB6frMIDin/RizegyI4zdZeJ0PtuNGjCG
 UILUzIKv8Qk+nCvjV2/kJMLdyBtgNN0DAgMaetLiDqTZ864HgnFqHTiu6 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="286032881"
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; d="scan'208";a="286032881"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2022 15:40:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; d="scan'208";a="773338284"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 16 Jul 2022 15:40:02 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oCqS4-0002Ft-Um;
 Sat, 16 Jul 2022 22:39:56 +0000
Date: Sun, 17 Jul 2022 06:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: Matthieu CHARETTE <matthieu.charette@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 andrealmeid@igalia.com
Subject: Re: [PATCH] drm: Fix EDID firmware load on resume
Message-ID: <202207170636.Yv3aXya1-lkp@intel.com>
References: <20220715092253.17529-1-matthieu.charette@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715092253.17529-1-matthieu.charette@gmail.com>
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
Cc: Matthieu CHARETTE <matthieu.charette@gmail.com>, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthieu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.19-rc6]
[also build test ERROR on linus/master]
[cannot apply to drm-misc/drm-misc-next next-20220715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthieu-CHARETTE/drm-Fix-EDID-firmware-load-on-resume/20220716-214028
base:    32346491ddf24599decca06190ebca03ff9de7f8
config: parisc-randconfig-r023-20220717 (https://download.01.org/0day-ci/archive/20220717/202207170636.Yv3aXya1-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e583aaf4f6464add35f2350c728d80a3fe790638
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthieu-CHARETTE/drm-Fix-EDID-firmware-load-on-resume/20220716-214028
        git checkout e583aaf4f6464add35f2350c728d80a3fe790638
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/gpu/drm/drm_connector.o: in function `.LC507':
>> drm_connector.c:(.rodata.cst4+0x1f8): undefined reference to `drm_cache_edid_firmware'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
