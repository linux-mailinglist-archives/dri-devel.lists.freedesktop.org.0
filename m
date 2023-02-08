Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D1168E80D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 07:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF59B10E6DC;
	Wed,  8 Feb 2023 06:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AFA10E6DC;
 Wed,  8 Feb 2023 06:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675836612; x=1707372612;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aeLYwzLraI8r2oku1mvNMnBULelU+l0Dg2COYX7f5Qw=;
 b=i5PUKm827Ot6MNS1a1Gy+rzIWJ2DzCrzxVh46yYyjkwdTMFafVchD57F
 rwNKarVqt9SF1IKbMe1geoqdTUEOoCLjgzDvgxXBs3u1Pu+reAgRr+mI+
 h79ALf5z5CcJP5qOKXJXAR1NUElzCW0+krsEk6kVZwGnqkzH14xbbDK3s
 /n8jeo9V7bN1BJNJkzbo3+UnBotNQw7iJhMMrS/A5MMY4fQRaM9A2EGPz
 Kye2xqRpOV+ueNKYeBhXS5njIAnwZ7IobSH/gjgI8bMTwY20+ZIjiSbDV
 F7Nz7E0B61xuYXjhKhq/EVVFkSZ4I5Z4e6aZbCwlW0N6UWRDxkwn68rWR Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="394312694"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; d="scan'208";a="394312694"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 22:10:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="699521849"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; d="scan'208";a="699521849"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 07 Feb 2023 22:09:53 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pPdeS-0004F0-1I;
 Wed, 08 Feb 2023 06:09:52 +0000
Date: Wed, 8 Feb 2023 14:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <202302081339.rLZ6hx1B-lkp@intel.com>
References: <20230208040911.12590-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208040911.12590-2-ville.syrjala@linux.intel.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 intel-gfx@lists.freedesktop.org,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-Introduce-plane-SIZE_HINTS-property/20230208-121141
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230208040911.12590-2-ville.syrjala%40linux.intel.com
patch subject: [Intel-gfx] [PATCH 1/2] drm: Introduce plane SIZE_HINTS property
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230208/202302081339.rLZ6hx1B-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/419642b423bdc6e337b5daabecb51173dd206cb5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ville-Syrjala/drm-Introduce-plane-SIZE_HINTS-property/20230208-121141
        git checkout 419642b423bdc6e337b5daabecb51173dd206cb5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_plane.c:1601: warning: expecting prototype for drm_plane_add_size_hint_property(). Prototype was for drm_plane_add_size_hints_property() instead


vim +1601 drivers/gpu/drm/drm_plane.c

  1585	
  1586	/**
  1587	 * drm_plane_add_size_hint_property - create a size hint property
  1588	 *
  1589	 * @plane: drm plane
  1590	 * @hints: size hints
  1591	 * @num_hints: number of size hints
  1592	 *
  1593	 * Create a size hints property for the plane.
  1594	 *
  1595	 * RETURNS:
  1596	 * Zero for success or -errno
  1597	 */
  1598	int drm_plane_add_size_hints_property(struct drm_plane *plane,
  1599					      const struct drm_plane_size_hint *hints,
  1600					      int num_hints)
> 1601	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
