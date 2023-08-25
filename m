Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F56F788596
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 13:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C85E10E653;
	Fri, 25 Aug 2023 11:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EB210E652;
 Fri, 25 Aug 2023 11:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692962780; x=1724498780;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Zgw4sLWDGWUm5qL+PZd4iP2mM4yO+1bqfsU+W9QJHiw=;
 b=PSQLhI6ETCWIWC1cVukw6JkVPHPBvGMaYSS7LDS6x8PRg3aex0LaVR6k
 Ay96UbD1UHFY7N75a974hdhxLVyhLiteDHxJwEcamsteb8/RaT08PKv0Q
 wNAoc6evdU92/fRDaJeuHM23I5aKpSusGPByy5WgATE1j9j3TmUyODmto
 7XkSIsg6pBWxkz4j9jVBOapVySduHR5W+tpvcYXKgDuLmhGGtzulQNHi/
 GlZnD9/Cnkx/QypUiSwbTd+gG/7Vzbt5hzb3FSAAXxCOP6BCCyVJv6ZX0
 pk+S37Fq/ovg9XV90iaLhs61MvJF5BwhEZxs6H6/oOU5+IRX+pZ2L6DSt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359690994"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="359690994"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="731036214"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="731036214"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 25 Aug 2023 04:26:15 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qZUwp-0003Va-1w;
 Fri, 25 Aug 2023 11:26:00 +0000
Date: Fri, 25 Aug 2023 19:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/cec: add drm_dp_cec_attach() as the
 non-edid version of set edid
Message-ID: <202308251944.9tpk0wma-lkp@intel.com>
References: <f8ed9b38fd2ebcd8344a1889a6c0f288969454ea.1692884619.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8ed9b38fd2ebcd8344a1889a6c0f288969454ea.1692884619.git.jani.nikula@intel.com>
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm/drm-next next-20230825]
[cannot apply to drm-intel/for-linux-next-fixes drm-misc/drm-misc-next linus/master v6.5-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-edid-add-drm_edid_is_digital/20230824-220926
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/f8ed9b38fd2ebcd8344a1889a6c0f288969454ea.1692884619.git.jani.nikula%40intel.com
patch subject: [Intel-gfx] [PATCH 4/6] drm/cec: add drm_dp_cec_attach() as the non-edid version of set edid
config: i386-buildonly-randconfig-001-20230824 (https://download.01.org/0day-ci/archive/20230825/202308251944.9tpk0wma-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251944.9tpk0wma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251944.9tpk0wma-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/display/drm_dp_cec.c: In function 'drm_dp_cec_attach':
   drivers/gpu/drm/display/drm_dp_cec.c:342:20: error: 'adap' undeclared (first use in this function)
     342 |    cec_s_phys_addr(adap, source_physical_address, false);
         |                    ^~~~
   drivers/gpu/drm/display/drm_dp_cec.c:342:20: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/display/drm_dp_cec.c: In function 'drm_dp_cec_set_edid':
>> drivers/gpu/drm/display/drm_dp_cec.c:388:18: error: dereferencing pointer to incomplete type 'const struct edid'
     388 |  if (edid && edid->extensions)
         |                  ^~
   drivers/gpu/drm/display/drm_dp_cec.c:389:3: error: 'pa' undeclared (first use in this function)
     389 |   pa = cec_get_edid_phys_addr((const u8 *)edid,
         |   ^~
   drivers/gpu/drm/display/drm_dp_cec.c:390:10: error: 'EDID_LENGTH' undeclared (first use in this function)
     390 |          EDID_LENGTH * (edid->extensions + 1), NULL);
         |          ^~~~~~~~~~~


vim +388 drivers/gpu/drm/display/drm_dp_cec.c

   379	
   380	/*
   381	 * Note: Prefer calling drm_dp_cec_attach() with
   382	 * connector->display_info.source_physical_address if possible.
   383	 */
   384	void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
   385	{
   386		u16 source_physical_address = CEC_PHYS_ADDR_INVALID;
   387	
 > 388		if (edid && edid->extensions)
   389			pa = cec_get_edid_phys_addr((const u8 *)edid,
   390						    EDID_LENGTH * (edid->extensions + 1), NULL);
   391	
   392		drm_dp_cec_attach(aux, source_physical_address);
   393	}
   394	EXPORT_SYMBOL(drm_dp_cec_set_edid);
   395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
