Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1846B6D2715
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 19:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92AC10E334;
	Fri, 31 Mar 2023 17:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2D910E334;
 Fri, 31 Mar 2023 17:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680285177; x=1711821177;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0EatCPNgNT1OHL0vD/bFoCVY34zovIIsS1cMYa0WF9s=;
 b=FBtIS82a+SGQnKCqh5pvKjA/dGFMlQgakfn8/y/+ru4f//QGFR6k4p2z
 suiVPYS0+bwaRcLvxbH7lYy+2X1UjxjR/Dch6QdXUYrgBXRvVORN8o10j
 hVe+UI4g0akByUhsU5Uwl9Jdgt0lad/qaxzomrPcs19fuXf+f2gQ5Eyaw
 Djub9uwB4VJbYTowcxxs9zgdIY77Nf3ndK90o9lOrVDB+xgHYIkmQ0u9B
 R3xiEFbo9JqiQiViFxw66e9pYucRhKrbPlO5MzmiScgLUSF/zSumv4Y4e
 c77aKB0iVUVKZ0JvdC4puM0NGqONbbcFXbKG2BOrbTALTmxAGtuaxhBBl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="343189596"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="343189596"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 10:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="796204783"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="796204783"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 31 Mar 2023 10:52:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1piIvg-000M1B-1k;
 Fri, 31 Mar 2023 17:52:48 +0000
Date: Sat, 1 Apr 2023 01:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 14/19] drm/i915/i915_gem: Provide function names to
 complete the expected kerneldoc format
Message-ID: <202304010108.zHCEYcJV-lkp@intel.com>
References: <20230331092607.700644-15-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331092607.700644-15-lee@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-misc/drm-misc-next next-20230331]
[cannot apply to drm-intel/for-linux-next-fixes lee-leds/for-leds-next linus/master v6.3-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lee-Jones/drm-i915-i915_scatterlist-Fix-kerneldoc-formatting-issue-missing/20230331-173046
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20230331092607.700644-15-lee%40kernel.org
patch subject: [PATCH 14/19] drm/i915/i915_gem: Provide function names to complete the expected kerneldoc format
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230401/202304010108.zHCEYcJV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/6fa884d5ec2846c7d9b54c4895c7114b363c4389
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lee-Jones/drm-i915-i915_scatterlist-Fix-kerneldoc-formatting-issue-missing/20230331-173046
        git checkout 6fa884d5ec2846c7d9b54c4895c7114b363c4389
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304010108.zHCEYcJV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_gem.c:819: warning: expecting prototype for i915_gem_sw_finish_ioct(). Prototype was for i915_gem_sw_finish_ioctl() instead


vim +819 drivers/gpu/drm/i915/i915_gem.c

673a394b1e3b69 Eric Anholt    2008-07-30  809  
673a394b1e3b69 Eric Anholt    2008-07-30  810  /**
6fa884d5ec2846 Lee Jones      2023-03-31  811   * i915_gem_sw_finish_ioct - Called when user space has done writes to this buffer
14bb2c11796d70 Tvrtko Ursulin 2016-06-03  812   * @dev: drm device
14bb2c11796d70 Tvrtko Ursulin 2016-06-03  813   * @data: ioctl data blob
14bb2c11796d70 Tvrtko Ursulin 2016-06-03  814   * @file: drm file
673a394b1e3b69 Eric Anholt    2008-07-30  815   */
673a394b1e3b69 Eric Anholt    2008-07-30  816  int
673a394b1e3b69 Eric Anholt    2008-07-30  817  i915_gem_sw_finish_ioctl(struct drm_device *dev, void *data,
05394f3975dceb Chris Wilson   2010-11-08  818  			 struct drm_file *file)
673a394b1e3b69 Eric Anholt    2008-07-30 @819  {
673a394b1e3b69 Eric Anholt    2008-07-30  820  	struct drm_i915_gem_sw_finish *args = data;
05394f3975dceb Chris Wilson   2010-11-08  821  	struct drm_i915_gem_object *obj;
1d7cfea152cae6 Chris Wilson   2010-10-17  822  
03ac0642f67a3a Chris Wilson   2016-07-20  823  	obj = i915_gem_object_lookup(file, args->handle);
c21724cc4d3d5c Chris Wilson   2016-08-05  824  	if (!obj)
c21724cc4d3d5c Chris Wilson   2016-08-05  825  		return -ENOENT;
673a394b1e3b69 Eric Anholt    2008-07-30  826  
a03f395ad78f88 Tina Zhang     2017-11-14  827  	/*
a03f395ad78f88 Tina Zhang     2017-11-14  828  	 * Proxy objects are barred from CPU access, so there is no
a03f395ad78f88 Tina Zhang     2017-11-14  829  	 * need to ban sw_finish as it is a nop.
a03f395ad78f88 Tina Zhang     2017-11-14  830  	 */
a03f395ad78f88 Tina Zhang     2017-11-14  831  
673a394b1e3b69 Eric Anholt    2008-07-30  832  	/* Pinned buffers may be scanout, so flush the cache */
5a97bcc69cc02d Chris Wilson   2017-02-22  833  	i915_gem_object_flush_if_display(obj);
f0cd518206e1a4 Chris Wilson   2016-10-28  834  	i915_gem_object_put(obj);
5a97bcc69cc02d Chris Wilson   2017-02-22  835  
5a97bcc69cc02d Chris Wilson   2017-02-22  836  	return 0;
673a394b1e3b69 Eric Anholt    2008-07-30  837  }
673a394b1e3b69 Eric Anholt    2008-07-30  838  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
