Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7264EB473
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 22:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F1110E1BE;
	Tue, 29 Mar 2022 20:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB6910E1BE;
 Tue, 29 Mar 2022 20:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648584611; x=1680120611;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=IzMCGLK6jHUhsp6aQtOGYKKqsuds6cV8PSA6r+9dfEY=;
 b=GqmLjnE21i8mM2x/XDHVs0MkloHzI5GgJPqbFRMSRrsPbRRbiWJb04+a
 s7BARd4IWSC3wNxzf2UICi9Pl0oImkX+aM+LtanRc3IdNRL2QXXaFVRsG
 KeJRqCmpe7nRsg1+49OCKxZ5zn34KKnHbKACYf8+Bxz2gk7e8qNvuzN8C
 LoUr1VMHP1gYlqG6u3zy6To5E6QXPqcUoLqzYkRVe29sfH3GG7N3FzuJ+
 AFN4595WDPc213e18uB0LjGMNh7t5IgMFO4fmhFrUA3DKqCAW8jbqy64Y
 cKW3BwCBKd3EAgndXXxcIDxvEOcQQqrpqk/fztYvpgRgS9TGIehislVXG g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259549391"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="259549391"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 13:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="546546261"
Received: from lkp-server01.sh.intel.com (HELO 3965e2759b93) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 29 Mar 2022 13:10:09 -0700
Received: from kbuild by 3965e2759b93 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nZIAK-0000cy-CD; Tue, 29 Mar 2022 20:10:08 +0000
Date: Wed, 30 Mar 2022 04:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: [drm-tip:drm-tip 4/8]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:200:45: error: 'struct
 ttm_range_mgr_node' has no member named 'tbo'
Message-ID: <202203300408.sl8G1bQn-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   a8459e73b79b7c55405331f36fe8a48e1bad5c33
commit: 752f483905202334e91d2d5b87a3904df72aa147 [4/8] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: parisc-randconfig-r003-20220327 (https://download.01.org/0day-ci/archive/20220330/202203300408.sl8G1bQn-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch --no-tags drm-tip drm-tip
        git checkout 752f483905202334e91d2d5b87a3904df72aa147
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=parisc SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c: In function 'amdgpu_gtt_mgr_recover':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:200:45: error: 'struct ttm_range_mgr_node' has no member named 'tbo'
     200 |                 amdgpu_ttm_recover_gart(node->tbo);
         |                                             ^~


vim +200 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c

bb990bb09235a3 Christian König 2016-09-09  182  
a614b336f1c16d Christian König 2021-02-11  183  /**
a614b336f1c16d Christian König 2021-02-11  184   * amdgpu_gtt_mgr_recover - re-init gart
a614b336f1c16d Christian König 2021-02-11  185   *
1dd8b1b987fad9 Nirmoy Das      2022-01-07  186   * @mgr: amdgpu_gtt_mgr pointer
a614b336f1c16d Christian König 2021-02-11  187   *
a614b336f1c16d Christian König 2021-02-11  188   * Re-init the gart for each known BO in the GTT.
a614b336f1c16d Christian König 2021-02-11  189   */
1b08dfb889b2c5 Christian König 2022-01-18  190  void amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
c1c7ce8f5687bb Christian König 2017-10-16  191  {
77ef271faee9c3 Christian König 2021-07-16  192  	struct ttm_range_mgr_node *node;
c1c7ce8f5687bb Christian König 2017-10-16  193  	struct drm_mm_node *mm_node;
1dd8b1b987fad9 Nirmoy Das      2022-01-07  194  	struct amdgpu_device *adev;
c1c7ce8f5687bb Christian König 2017-10-16  195  
19a1d9350be632 Nirmoy Das      2021-05-28  196  	adev = container_of(mgr, typeof(*adev), mman.gtt_mgr);
c1c7ce8f5687bb Christian König 2017-10-16  197  	spin_lock(&mgr->lock);
c1c7ce8f5687bb Christian König 2017-10-16  198  	drm_mm_for_each_node(mm_node, &mgr->mm) {
77ef271faee9c3 Christian König 2021-07-16  199  		node = container_of(mm_node, typeof(*node), mm_nodes[0]);
1b08dfb889b2c5 Christian König 2022-01-18 @200  		amdgpu_ttm_recover_gart(node->tbo);
c1c7ce8f5687bb Christian König 2017-10-16  201  	}
c1c7ce8f5687bb Christian König 2017-10-16  202  	spin_unlock(&mgr->lock);
c1c7ce8f5687bb Christian König 2017-10-16  203  
19a1d9350be632 Nirmoy Das      2021-05-28  204  	amdgpu_gart_invalidate_tlb(adev);
c1c7ce8f5687bb Christian König 2017-10-16  205  }
c1c7ce8f5687bb Christian König 2017-10-16  206  

:::::: The code at line 200 was first introduced by commit
:::::: 1b08dfb889b2c584b444538c9500af24ba0a6dc7 drm/amdgpu: remove gart.ready flag

:::::: TO: Christian König <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
