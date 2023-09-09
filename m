Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF1F7996AA
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 09:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8411210E261;
	Sat,  9 Sep 2023 07:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F390F10E261
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 07:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694243330; x=1725779330;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=KrKhDuWr6UX9MAg3f7uKu0qBifumK7xGup2UZw3Ljfg=;
 b=gMvgAA7j60w/zklRlDtO5egI7Fav/v7D3Ot7WQJ3dljY/rTfFrRhfCdX
 9rBghGuaVGBkfZWdShEmrI86rVvwPSchd5FAzcSAsWTQO9MbUf3YHl0jp
 S21TAJcjAPkN5Pi928YsquPV2HVKdwD6sOWBEa7+Vs+F1MWaKwH4MJcfT
 UL7/W5RD4tW52g7TPEeyB57+JAkExjU6jqkjpkEdnw7Sn2opBvDQbFSMw
 aV6izDVo56wCX2jCosBmf5THSCwOhsbEblpttCAAhjUoDXZ/1K/O5mwhx
 f22aGkwQzcXIfZ/MjaTxoaEOJxz6XXKg5sn/Xnbb/Bj9thDR/+eVt7DtK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="444231720"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; d="scan'208";a="444231720"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2023 00:08:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="777827615"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; d="scan'208";a="777827615"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 09 Sep 2023 00:08:48 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qes5G-00032d-0n;
 Sat, 09 Sep 2023 07:08:46 +0000
Date: Sat, 9 Sep 2023 15:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>
Subject: [drm-misc:drm-misc-next 2/2]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:368:21:
 warning: variable 'old_payload' is uninitialized when used here
Message-ID: <202309091509.IBo0CGxg-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   5aa1dfcdf0a429e4941e2eef75b006a8c7a8ac49
commit: 5aa1dfcdf0a429e4941e2eef75b006a8c7a8ac49 [2/2] drm/mst: Refactor the flow for payload allocation/removement
config: arm64-randconfig-r034-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091509.IBo0CGxg-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091509.IBo0CGxg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091509.IBo0CGxg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:368:21: warning: variable 'old_payload' is uninitialized when used here [-Wuninitialized]
     368 |                                                  new_payload, old_payload);
         |                                                               ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:344:61: note: initialize the variable 'old_payload' to silence this warning
     344 |         struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
         |                                                                    ^
         |                                                                     = NULL
   1 warning generated.


vim +/old_payload +368 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c

   335	
   336	bool dm_helpers_dp_mst_send_payload_allocation(
   337			struct dc_context *ctx,
   338			const struct dc_stream_state *stream,
   339			bool enable)
   340	{
   341		struct amdgpu_dm_connector *aconnector;
   342		struct drm_dp_mst_topology_state *mst_state;
   343		struct drm_dp_mst_topology_mgr *mst_mgr;
   344		struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
   345		enum mst_progress_status set_flag = MST_ALLOCATE_NEW_PAYLOAD;
   346		enum mst_progress_status clr_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
   347		int ret = 0;
   348	
   349		aconnector = (struct amdgpu_dm_connector *)stream->dm_stream_context;
   350	
   351		if (!aconnector || !aconnector->mst_root)
   352			return false;
   353	
   354		mst_mgr = &aconnector->mst_root->mst_mgr;
   355		mst_state = to_drm_dp_mst_topology_state(mst_mgr->base.state);
   356	
   357		new_payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->mst_output_port);
   358	
   359		if (!enable) {
   360			set_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
   361			clr_flag = MST_ALLOCATE_NEW_PAYLOAD;
   362		}
   363	
   364		if (enable) {
   365			ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, new_payload);
   366		} else {
   367			dm_helpers_construct_old_payload(stream->link, mst_state->pbn_div,
 > 368							 new_payload, old_payload);
   369			drm_dp_remove_payload_part2(mst_mgr, mst_state, old_payload, new_payload);
   370		}
   371	
   372		if (ret) {
   373			amdgpu_dm_set_mst_status(&aconnector->mst_status,
   374				set_flag, false);
   375		} else {
   376			amdgpu_dm_set_mst_status(&aconnector->mst_status,
   377				set_flag, true);
   378			amdgpu_dm_set_mst_status(&aconnector->mst_status,
   379				clr_flag, false);
   380		}
   381	
   382		return true;
   383	}
   384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
