Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBCD875245
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 15:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2B610F47E;
	Thu,  7 Mar 2024 14:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKTiARTW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8634110F1EA;
 Thu,  7 Mar 2024 14:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709823005; x=1741359005;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1uFg9lgmSZDO3+m4zi6sLWaEhSEtqe7jeK4xCy4bEbM=;
 b=oKTiARTWjaA5DMgKb6phq1LfXnVRiVRvfTtk2zTtEZsKgXNxu5cMayBN
 NreLiSQW676ILtj+crPWPo8kQxUlAp2BwgLrhkqJU/99Igs6dmRoYO1UN
 IUI2cSjS3IbsYeV960/aLkaQLCTIVAhY9Ef7y8rOfQ2BrADxADynfyS+K
 9XJCYpl0j7/59FdSmfbrZICI3PdLdc7OCoiQT8YLhH/CbW64Ox37DplK8
 rI37Ig9dx4Qc+z+hNdQ39WLHGz0LWoWhUfV1LAv8yRX0vFArsvPAFa/iD
 1lEgAIHOb558vebIzZC6sFs6JKtO8QYZf3w+Fw82L7+VEuTUd7coiLKf9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15633934"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="15633934"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 06:50:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="10025879"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 07 Mar 2024 06:50:01 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1riF4I-0005HP-2D;
 Thu, 07 Mar 2024 14:49:58 +0000
Date: Thu, 7 Mar 2024 22:49:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 22/22] drm: ensure drm headers are self-contained and
 pass kernel-doc
Message-ID: <202403072259.EEC2Vf1X-lkp@intel.com>
References: <e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula@intel.com>
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

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.8-rc7 next-20240307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-crtc-make-drm_crtc_internal-h-self-contained/20240307-023603
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula%40intel.com
patch subject: [PATCH 22/22] drm: ensure drm headers are self-contained and pass kernel-doc
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240307/202403072259.EEC2Vf1X-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403072259.EEC2Vf1X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403072259.EEC2Vf1X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:4:
>> include/drm/ttm/ttm_pool.h:89:52: warning: declaration of 'struct seq_file' will not be visible outside of this function [-Wvisibility]
      89 | int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
         |                                                    ^
   1 warning generated.


vim +89 include/drm/ttm/ttm_pool.h

d099fc8f540add Christian König 2020-10-22  88  
d099fc8f540add Christian König 2020-10-22 @89  int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
d099fc8f540add Christian König 2020-10-22  90  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
