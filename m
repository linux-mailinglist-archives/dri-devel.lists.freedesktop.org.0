Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 305A17B3EB3
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 08:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC9A10E0AD;
	Sat, 30 Sep 2023 06:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4040B10E0AD
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 06:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696056909; x=1727592909;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Er6kX/bTXC9VVyFrZm9L0oiXqmRdHvt1nCQhC2rSbxU=;
 b=RtP+sph8ImJMuHCTLxk3OCyd0s3EXo7I0vLL4Ja7LbxHXHmTL8NGqzsJ
 O25YHfvUIXu8sXBW5LJDrMDTWv3bTaNFWQdIje95QaRTMwlHlPRmxOkot
 gbJMIio3RbMCzePWMOEnUPJlQ1cwW0pCb6Cf2MPwoQNITKduMZdb0lzH0
 DWj95ytznfJ66q6FqK7ZWvRP34vkTBSFTg+/GpbF3kqJ8Tpho2mmmizw+
 PpI8juG6QdNqbfTcYnxyoJ207+Ko1jhb/W9SjEGI6FDDTN9wCY30/3V9x
 PEZqktMUdU4UngVJP5uNt16ndan5f8xWyzgWufu0yrfq/iDrTYC5rt9gZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="4000757"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="4000757"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 23:55:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="1043767"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 29 Sep 2023 23:54:28 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qmTsU-0003oJ-0W;
 Sat, 30 Sep 2023 06:55:02 +0000
Date: Sat, 30 Sep 2023 14:54:45 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandra Diupina <adiupina@astralinux.ru>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] drm: rcar-du: turn rcar_du_group_get() into void and
 remove its return value check
Message-ID: <202309301402.uR7IRQVj-lkp@intel.com>
References: <20230927104438.30628-1-adiupina@astralinux.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927104438.30628-1-adiupina@astralinux.ru>
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
Cc: Alexandra Diupina <adiupina@astralinux.ru>, oe-kbuild-all@lists.linux.dev,
 Wolfram Sang <wsa-dev@sang-engineering.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, lvc-project@linuxtesting.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexandra,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc3 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandra-Diupina/drm-rcar-du-turn-rcar_du_group_get-into-void-and-remove-its-return-value-check/20230927-184651
base:   linus/master
patch link:    https://lore.kernel.org/r/20230927104438.30628-1-adiupina%40astralinux.ru
patch subject: [PATCH v2] drm: rcar-du: turn rcar_du_group_get() into void and remove its return value check
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230930/202309301402.uR7IRQVj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301402.uR7IRQVj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301402.uR7IRQVj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c:203:6: error: conflicting types for 'rcar_du_group_get'; have 'void(struct rcar_du_group *)'
     203 | void rcar_du_group_get(struct rcar_du_group *rgrp)
         |      ^~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h:20,
                    from drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c:29:
   drivers/gpu/drm/renesas/rcar-du/rcar_du_group.h:57:5: note: previous declaration of 'rcar_du_group_get' with type 'int(struct rcar_du_group *)'
      57 | int rcar_du_group_get(struct rcar_du_group *rgrp);
         |     ^~~~~~~~~~~~~~~~~


vim +203 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c

   194	
   195	/*
   196	 * rcar_du_group_get - Acquire a reference to the DU channels group
   197	 *
   198	 * Acquiring the first reference setups core registers. A reference must be held
   199	 * before accessing any hardware registers.
   200	 *
   201	 * This function must be called with the DRM mode_config lock held.
   202	 */
 > 203	void rcar_du_group_get(struct rcar_du_group *rgrp)
   204	{
   205		if (rgrp->use_count)
   206			goto done;
   207	
   208		rcar_du_group_setup(rgrp);
   209	
   210	done:
   211		rgrp->use_count++;
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
