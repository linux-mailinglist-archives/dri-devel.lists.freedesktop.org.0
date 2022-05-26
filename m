Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E8D5348FA
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 04:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3AD10E0CB;
	Thu, 26 May 2022 02:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C50410E050;
 Thu, 26 May 2022 02:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653533131; x=1685069131;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=V3I3Mo4WnhlEtggKBEvlYv7zdXObrMO0N575oCC00w4=;
 b=f+PxKQcVsOvxRdqXHz/GT12DXOGS8CIC5YWsirZ0r6QougSj1HjzY4RG
 IVh50TnvK2fQ2sWttZvMplp3MxkQUcYzDzBx+MOO7YRSWOBpzVWmajkRg
 WZ1UlnjC64lFiI3NzRJEdEzY22XaLWTpUv8rJ6rz0IYwHS4Raf4vkBVZv
 Mg8DifL9Qp2dpX+j+zbIlWb4ptQnXmPRDLRUFdcuX02W9vf8NmAxlpWMZ
 w7G8uzxYNnTljBA85WnAUteJnwLupIqovsZSXPWkPcp2Sn489WEIG1KtJ
 DwrhFJQoTJURJCALPayqy5sG64TbuiXbN03ceguKVeYnbrZo9XNdfXJV3 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="360394894"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="360394894"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 19:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="609474535"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 25 May 2022 19:45:28 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nu3VA-0003WU-1f;
 Thu, 26 May 2022 02:45:28 +0000
Date: Thu, 26 May 2022 10:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 03/10] drm/i915/uapi: expose the avail tracking
Message-ID: <202205261034.CoXEwzSb-lkp@intel.com>
References: <20220525184337.491763-4-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525184337.491763-4-matthew.auld@intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthew,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on v5.18 next-20220525]
[cannot apply to drm-intel/for-linux-next drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Auld/small-BAR-uapi-bits/20220526-024641
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20220526/202205261034.CoXEwzSb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/614521eb68cc1e72a489c1c796827329c98bf031
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Auld/small-BAR-uapi-bits/20220526-024641
        git checkout 614521eb68cc1e72a489c1c796827329c98bf031
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:379: warning: expecting prototype for i915_ttm_buddy_man_visible_size(). Prototype was for i915_ttm_buddy_man_avail() instead


vim +379 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c

   367	
   368	/**
   369	 * i915_ttm_buddy_man_visible_size - Query the avail tracking for the manager.
   370	 *
   371	 * @man: The buddy allocator ttm manager
   372	 * @avail: The total available memory in pages for the entire manager.
   373	 * @visible_avail: The total available memory in pages for the CPU visible
   374	 * portion. Note that this will always give the same value as @avail on
   375	 * configurations that don't have a small BAR.
   376	 */
   377	void i915_ttm_buddy_man_avail(struct ttm_resource_manager *man,
   378				     u64 *avail, u64 *visible_avail)
 > 379	{
   380		struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
   381	
   382		mutex_lock(&bman->lock);
   383		*avail = bman->mm.avail >> PAGE_SHIFT;
   384		*visible_avail = bman->visible_avail;
   385		mutex_unlock(&bman->lock);
   386	}
   387	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
