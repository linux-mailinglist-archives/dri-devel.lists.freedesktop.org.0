Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33C0D32222
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 14:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649E310E8A0;
	Fri, 16 Jan 2026 13:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JraaNnca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5EAD10E89F;
 Fri, 16 Jan 2026 13:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768571589; x=1800107589;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DT/E4BgkqYQY28FJUE+qldgJ4WbSC4j4l/OQFFrGl4o=;
 b=JraaNncalAmbF4+rBmkXcmvU6TUvvnrY4jAfXUcUff5PCqjhyIJTBQ2m
 tLkCAfeblinDjWoyfOQz8Kx6tCnufF0loEB9/EFjjz0WYzOqpVkx+PTYJ
 13jegGlpO08dkBn+VuVqAKc10GvmJmaT3zfCCWW24OhUIlkM+iBJqp3bA
 9P6j3RqHJ64jemmGTNVBKjQK9HWvOzZHl9XWsCNrz6eJYaHHnZC/Eb4Ft
 5fokDqvJRfAccRuby0WhOzk8Mg0SAtC7jzjFhfmHh3sv1GbNREwtyYp1g
 iy20lEQJwnxwwd5tbteiCF522rzpduVU3nElsPk9egx6NKH64FgRXVWWM g==;
X-CSE-ConnectionGUID: lgcVh5eURh6m07DP2AxI4g==
X-CSE-MsgGUID: SI7Avt+dTXuFSzr2jKaCFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69780858"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="69780858"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 05:53:05 -0800
X-CSE-ConnectionGUID: 0vHhAGUDQYS0P5v64xPltA==
X-CSE-MsgGUID: ZigddSHuT9inTQ1M30X5ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="205527646"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 16 Jan 2026 05:53:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vgkG3-00000000Kts-0g2Q;
 Fri, 16 Jan 2026 13:52:59 +0000
Date: Fri, 16 Jan 2026 21:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Harry.Wentland@amd.com, simona@ffwll.ch,
 airlied@gmail.com, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, Leo Li <sunpeng.li@amd.com>
Subject: Re: [PATCH v3 2/2] drm/amd/display: Implement prepare_vblank_enable
 callback
Message-ID: <202601162111.x5OKj7WN-lkp@intel.com>
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
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260116/202601162111.x5OKj7WN-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601162111.x5OKj7WN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601162111.x5OKj7WN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/drm/drm_crtc.h:28,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:27:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c: In function 'amdgpu_dm_crtc_set_crc_source':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:659:38: error: 'dm' undeclared (first use in this function); did you mean 'dc'?
     659 |                 scoped_guard(mutex, &dm->dc_lock) {
         |                                      ^~
   include/linux/cleanup.h:433:34: note: in definition of macro '__scoped_guard'
     433 |         for (CLASS(_name, scope)(args);                                 \
         |                                  ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:659:17: note: in expansion of macro 'scoped_guard'
     659 |                 scoped_guard(mutex, &dm->dc_lock) {
         |                 ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:659:38: note: each undeclared identifier is reported only once for each function it appears in
     659 |                 scoped_guard(mutex, &dm->dc_lock) {
         |                                      ^~
   include/linux/cleanup.h:433:34: note: in definition of macro '__scoped_guard'
     433 |         for (CLASS(_name, scope)(args);                                 \
         |                                  ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:659:17: note: in expansion of macro 'scoped_guard'
     659 |                 scoped_guard(mutex, &dm->dc_lock) {
         |                 ^~~~~~~~~~~~


vim +659 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c

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
