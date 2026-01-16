Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60069D333BC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 16:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9CB10E8CA;
	Fri, 16 Jan 2026 15:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPS1xTZq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6166110E8C8;
 Fri, 16 Jan 2026 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768577889; x=1800113889;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8Dcv71JrcWpR8h6y57WNkmYCQbL1GhtCY+1kUVFVza8=;
 b=RPS1xTZq5y9tZ3WLA40fXQNCYWFQSgfq+fuAroC2IuByLoDbsM6oePvM
 O91uQZENOTK08lOtjQr7qYS6n7mTaITk8wq2tgllM3wzpycwmAc/RjzD/
 mULQMuahMSB51P9ESnAJWIDEidxD0j/rsw7WbIqmDCFYyNiVwTrTeRgIe
 OBbdE/NDzS/x2IP+cc27icg7V7EXo2Wf+8m61j9oZXMwzSGtsPfsIS9ny
 CAQ03aZ5H9cPGUuUV5K0JwaFwNtg4oDplNpBuEHlulGOMp5u3NJ2KRBJu
 /EhhJmP43mUetAPgJ1a9OHp32pyXfAZztp1Wy2Q/f5p05dDXGEjbtXHKP g==;
X-CSE-ConnectionGUID: H7jszoxZRlmJUp/1uCLRVg==
X-CSE-MsgGUID: 6plTtieEShekdAlWTrxTow==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="87468017"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="87468017"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 07:38:09 -0800
X-CSE-ConnectionGUID: yOUtbHC+S9OQxPPAQKFmSA==
X-CSE-MsgGUID: jmP+gCkXQd6ztsxwNqKCCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="235962770"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2026 07:38:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vgltj-00000000Kyy-2Su2;
 Fri, 16 Jan 2026 15:38:03 +0000
Date: Fri, 16 Jan 2026 23:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Harry.Wentland@amd.com, simona@ffwll.ch, airlied@gmail.com,
 jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 Leo Li <sunpeng.li@amd.com>
Subject: Re: [PATCH v3 2/2] drm/amd/display: Implement prepare_vblank_enable
 callback
Message-ID: <202601162358.Uv6IL5Jo-lkp@intel.com>
References: <20260109192027.116325-2-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109192027.116325-2-sunpeng.li@amd.com>
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-tip/drm-tip next-20260115]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sunpeng-li-amd-com/drm-amd-display-Implement-prepare_vblank_enable-callback/20260110-032355
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260109192027.116325-2-sunpeng.li%40amd.com
patch subject: [PATCH v3 2/2] drm/amd/display: Implement prepare_vblank_enable callback
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260116/202601162358.Uv6IL5Jo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601162358.Uv6IL5Jo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601162358.Uv6IL5Jo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:659:24: error: use of undeclared identifier 'dm'
     659 |                 scoped_guard(mutex, &dm->dc_lock) {
         |                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:660:30: error: use of undeclared identifier 'dm'
     660 |                         dc_exit_ips_for_hw_access(dm->dc);
         |                                                   ^
   2 errors generated.


vim +/dm +659 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c

   542	
   543	int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
   544	{
   545		enum amdgpu_dm_pipe_crc_source source = dm_parse_crc_source(src_name);
   546		enum amdgpu_dm_pipe_crc_source cur_crc_src;
   547		struct drm_crtc_commit *commit;
   548		struct dm_crtc_state *crtc_state;
   549		struct drm_device *drm_dev = crtc->dev;
   550	#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
   551		struct amdgpu_device *adev = drm_to_adev(drm_dev);
   552		struct amdgpu_display_manager *dm = &adev->dm;
   553	#endif
   554		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
   555		struct drm_dp_aux *aux = NULL;
   556		bool enable = false;
   557		bool enabled = false;
   558		int ret = 0;
   559	
   560		if (source < 0) {
   561			DRM_DEBUG_DRIVER("Unknown CRC source %s for CRTC%d\n",
   562					 src_name, crtc->index);
   563			return -EINVAL;
   564		}
   565	
   566		ret = drm_modeset_lock(&crtc->mutex, NULL);
   567		if (ret)
   568			return ret;
   569	
   570		spin_lock(&crtc->commit_lock);
   571		commit = list_first_entry_or_null(&crtc->commit_list,
   572						  struct drm_crtc_commit, commit_entry);
   573		if (commit)
   574			drm_crtc_commit_get(commit);
   575		spin_unlock(&crtc->commit_lock);
   576	
   577		if (commit) {
   578			/*
   579			 * Need to wait for all outstanding programming to complete
   580			 * in commit tail since it can modify CRC related fields and
   581			 * hardware state. Since we're holding the CRTC lock we're
   582			 * guaranteed that no other commit work can be queued off
   583			 * before we modify the state below.
   584			 */
   585			ret = wait_for_completion_interruptible_timeout(
   586				&commit->hw_done, 10 * HZ);
   587			if (ret)
   588				goto cleanup;
   589		}
   590	
   591		enable = amdgpu_dm_is_valid_crc_source(source);
   592		crtc_state = to_dm_crtc_state(crtc->state);
   593		spin_lock_irq(&drm_dev->event_lock);
   594		cur_crc_src = acrtc->dm_irq_params.crc_src;
   595		spin_unlock_irq(&drm_dev->event_lock);
   596	
   597		/*
   598		 * USER REQ SRC | CURRENT SRC | BEHAVIOR
   599		 * -----------------------------
   600		 * None         | None        | Do nothing
   601		 * None         | CRTC        | Disable CRTC CRC, set default to dither
   602		 * None         | DPRX        | Disable DPRX CRC, need 'aux', set default to dither
   603		 * None         | CRTC DITHER | Disable CRTC CRC
   604		 * None         | DPRX DITHER | Disable DPRX CRC, need 'aux'
   605		 * CRTC         | XXXX        | Enable CRTC CRC, no dither
   606		 * DPRX         | XXXX        | Enable DPRX CRC, need 'aux', no dither
   607		 * CRTC DITHER  | XXXX        | Enable CRTC CRC, set dither
   608		 * DPRX DITHER  | XXXX        | Enable DPRX CRC, need 'aux', set dither
   609		 */
   610		if (dm_is_crc_source_dprx(source) ||
   611		    (source == AMDGPU_DM_PIPE_CRC_SOURCE_NONE &&
   612		     dm_is_crc_source_dprx(cur_crc_src))) {
   613			struct amdgpu_dm_connector *aconn = NULL;
   614			struct drm_connector *connector;
   615			struct drm_connector_list_iter conn_iter;
   616	
   617			drm_connector_list_iter_begin(crtc->dev, &conn_iter);
   618			drm_for_each_connector_iter(connector, &conn_iter) {
   619				if (!connector->state || connector->state->crtc != crtc)
   620					continue;
   621	
   622				if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
   623					continue;
   624	
   625				aconn = to_amdgpu_dm_connector(connector);
   626				break;
   627			}
   628			drm_connector_list_iter_end(&conn_iter);
   629	
   630			if (!aconn) {
   631				DRM_DEBUG_DRIVER("No amd connector matching CRTC-%d\n", crtc->index);
   632				ret = -EINVAL;
   633				goto cleanup;
   634			}
   635	
   636			aux = (aconn->mst_output_port) ? &aconn->mst_output_port->aux : &aconn->dm_dp_aux.aux;
   637	
   638			if (!aux) {
   639				DRM_DEBUG_DRIVER("No dp aux for amd connector\n");
   640				ret = -EINVAL;
   641				goto cleanup;
   642			}
   643	
   644			if ((aconn->base.connector_type != DRM_MODE_CONNECTOR_DisplayPort) &&
   645					(aconn->base.connector_type != DRM_MODE_CONNECTOR_eDP)) {
   646				DRM_DEBUG_DRIVER("No DP connector available for CRC source\n");
   647				ret = -EINVAL;
   648				goto cleanup;
   649			}
   650	
   651		}
   652	
   653		/*
   654		 * Reading the CRC requires the vblank interrupt handler to be
   655		 * enabled. Keep a reference until CRC capture stops.
   656		 */
   657		enabled = amdgpu_dm_is_valid_crc_source(cur_crc_src);
   658		if (!enabled && enable) {
 > 659			scoped_guard(mutex, &dm->dc_lock) {
   660				dc_exit_ips_for_hw_access(dm->dc);
   661				ret = drm_crtc_vblank_get(crtc);
   662			}
   663	
   664			if (ret)
   665				goto cleanup;
   666		}
   667	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
