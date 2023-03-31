Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB96D23DB
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 17:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5B110F29E;
	Fri, 31 Mar 2023 15:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F8610F29E;
 Fri, 31 Mar 2023 15:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680275986; x=1711811986;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6DYU9YNmKUr0TE/DUc3vf67LbYHXMXPhNj+QtfqCNPI=;
 b=ScqPLaj/4ogiH7FLZB+nXZt8Sm0Hlmc7be/kv4OVokPFNIbRK3dCCk5I
 3KSUWUh1YH2JrSeCAw0PqJlUhQEGgJw5ehmXRFiHQfYRAUk1/4rolxFhQ
 qBv7TDyuO8XkUcSi+y15xZS+p7LNbR403prjEgc+MEkyN8oSAEQm4m4V8
 7sYJFkfDn7b1fER9XhLhXT7OPxHdgLLUH2i9yBf8Q4Oiw4ZiRHZn8OI2F
 95yyuO+HKjD+8bfQuA2InUCfRJ6Pr4a5++b4wunbvrD/1jnnxaDNCNg3a
 nQHlSzbkdG6sN76z15GTsIGAhuavFKclcl9m8HWd3iQNfgbPJum3DWKXM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="340201927"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="340201927"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 08:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="796160263"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="796160263"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 31 Mar 2023 08:19:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1piGXX-000Lu3-03;
 Fri, 31 Mar 2023 15:19:43 +0000
Date: Fri, 31 Mar 2023 23:18:53 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 07/19] drm/i915/gem/i915_gem_create: Provide the function
 names for proper kerneldoc headers
Message-ID: <202303312304.LMo1KsTB-lkp@intel.com>
References: <20230331092607.700644-8-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331092607.700644-8-lee@kernel.org>
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
 Matthew Auld <matthew.auld@intel.com>, oe-kbuild-all@lists.linux.dev
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
patch link:    https://lore.kernel.org/r/20230331092607.700644-8-lee%40kernel.org
patch subject: [PATCH 07/19] drm/i915/gem/i915_gem_create: Provide the function names for proper kerneldoc headers
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230331/202303312304.LMo1KsTB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/7c87f97c7f11c1a2b3931d46ae1382c5ee0c14f7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lee-Jones/drm-i915-i915_scatterlist-Fix-kerneldoc-formatting-issue-missing/20230331-173046
        git checkout 7c87f97c7f11c1a2b3931d46ae1382c5ee0c14f7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303312304.LMo1KsTB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gem/i915_gem_create.c:411: warning: expecting prototype for i915_gem_create_ext_ioct(). Prototype was for i915_gem_create_ext_ioctl() instead


vim +411 drivers/gpu/drm/i915/gem/i915_gem_create.c

ebcb40298947bdb Matthew Auld 2021-04-29  401  
ebcb40298947bdb Matthew Auld 2021-04-29  402  /**
7c87f97c7f11c1a Lee Jones    2023-03-31  403   * i915_gem_create_ext_ioct - Creates a new mm object and returns a handle to it.
ebcb40298947bdb Matthew Auld 2021-04-29  404   * @dev: drm device pointer
ebcb40298947bdb Matthew Auld 2021-04-29  405   * @data: ioctl data blob
ebcb40298947bdb Matthew Auld 2021-04-29  406   * @file: drm file pointer
ebcb40298947bdb Matthew Auld 2021-04-29  407   */
ebcb40298947bdb Matthew Auld 2021-04-29  408  int
ebcb40298947bdb Matthew Auld 2021-04-29  409  i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
ebcb40298947bdb Matthew Auld 2021-04-29  410  			  struct drm_file *file)
ebcb40298947bdb Matthew Auld 2021-04-29 @411  {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
