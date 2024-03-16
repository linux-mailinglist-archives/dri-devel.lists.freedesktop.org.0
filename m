Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B652F87D952
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 09:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784C710E3F4;
	Sat, 16 Mar 2024 08:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vf30+wbH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F031710E3F4;
 Sat, 16 Mar 2024 08:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710578325; x=1742114325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sJRKQDEF/mYELqYtfcMtuHA2PeZPlAzaD9jEf0e7JP0=;
 b=Vf30+wbH1k5m19sxzDCeIzqlTwYRnedAL3qJkgSHxVB4Z1U1jcECw+jT
 75i5Uq34pvAKJlyR9uBQpOreK4pCwtdh1LWoL9rnOdGj60BEYbWTxIE2o
 leRKTz9KGvnyQzSCuaO8ZGMl2BhEYV+BQKXZf3d+0nPq4sPaYcaqYR4Tj
 7GxjlolL1O/pAYaLiTATkgHkD6IIYMwz/xYCAVsij6pBgwvT/kRvg0lUi
 h1Yc1Kl2Hi0ILI8bCf5SDgOeNZmZYZw3XnyyFq4cpZvM65fKxr+cUjxeU
 aCVVzhFlfTUCCzzVmT84tj60AGhJsRj3HKtdZ3rCZs+KcPPmjMke51gIt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5310435"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5310435"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2024 01:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="17525738"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 16 Mar 2024 01:38:40 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rlPYr-000FEP-2e;
 Sat, 16 Mar 2024 08:38:37 +0000
Date: Sat, 16 Mar 2024 16:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: sunpeng.li@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Joshua Ashton <joshua@froggi.es>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Chao Guo <chao.guo@nxp.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Vikas Korjani <Vikas.Korjani@amd.com>,
 Robert Mader <robert.mader@posteo.de>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sean Paul <sean@poorly.run>, Simon Ser <contact@emersion.fr>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Leo Li <sunpeng.li@amd.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Introduce overlay cursor mode
Message-ID: <202403161600.6KspdesJ-lkp@intel.com>
References: <20240315170959.165505-2-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315170959.165505-2-sunpeng.li@amd.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.8 next-20240315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sunpeng-li-amd-com/drm-amd-display-Introduce-overlay-cursor-mode/20240316-011404
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240315170959.165505-2-sunpeng.li%40amd.com
patch subject: [PATCH 1/2] drm/amd/display: Introduce overlay cursor mode
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240316/202403161600.6KspdesJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161600.6KspdesJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161600.6KspdesJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10639: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Set whether the cursor should be enabled in native mode, or overlay mode, on


vim +10639 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

 10637	
 10638	/**
 10639	 * Set whether the cursor should be enabled in native mode, or overlay mode, on
 10640	 * the dm_crtc_state.
 10641	 *
 10642	 * The cursor should be enabled in overlay mode if the immediate underlying
 10643	 * plane contains a video format.
 10644	 *
 10645	 * Since zpos info is required, drm_atomic_normalize_zpos must be called before
 10646	 * calling this function.
 10647	*/
 10648	static int dm_crtc_set_cursor_mode(struct drm_atomic_state *state,
 10649					    struct dm_crtc_state *dm_crtc_state)
 10650	{
 10651		struct drm_plane_state *plane_state, *old_plane_state, *target_plane_state;
 10652		struct drm_crtc_state *crtc_state = &dm_crtc_state->base;
 10653		struct drm_plane *plane;
 10654		bool consider_mode_change = false;
 10655		bool cursor_changed = false;
 10656		unsigned int target_zpos;
 10657		unsigned int cursor_zpos;
 10658		int i;
 10659	
 10660		/*
 10661		 * Cursor mode can change if a plane's format changes, is
 10662		 * enabled/disabled, or z-order changes.
 10663		 */
 10664		for_each_oldnew_plane_in_state(state, plane, old_plane_state, plane_state, i) {
 10665	
 10666			/* Only care about planes on this CRTC */
 10667			if ((drm_plane_mask(plane) & crtc_state->plane_mask) == 0)
 10668				continue;
 10669	
 10670			if (plane->type == DRM_PLANE_TYPE_CURSOR)
 10671				cursor_changed = true;
 10672	
 10673			if (drm_atomic_plane_enabling(old_plane_state, plane_state) ||
 10674			    drm_atomic_plane_disabling(old_plane_state, plane_state) ||
 10675			    old_plane_state->fb->format != plane_state->fb->format) {
 10676				consider_mode_change = true;
 10677				break;
 10678			}
 10679		}
 10680	
 10681		if (!consider_mode_change && !crtc_state->zpos_changed) {
 10682			return 0;
 10683		}
 10684	
 10685		/*
 10686		 * If no cursor change on this CRTC, and not enabled on this CRTC, then
 10687		 * no need to set cursor mode. This avoids needlessly locking the cursor
 10688		 * state.
 10689		 */
 10690		if (!cursor_changed &&
 10691		    !(drm_plane_mask(crtc_state->crtc->cursor) & crtc_state->plane_mask)) {
 10692			return 0;
 10693		}
 10694	
 10695		plane_state = drm_atomic_get_plane_state(state,
 10696							 crtc_state->crtc->cursor);
 10697		if (IS_ERR(plane_state))
 10698			return PTR_ERR(plane_state);
 10699	
 10700		/* Cursor is disabled */
 10701		if (!plane_state->fb)
 10702			return 0;
 10703	
 10704		cursor_zpos = plane_state->normalized_zpos;
 10705	
 10706		/* Get enabled plane immediately below cursor. */
 10707		target_plane_state = NULL;
 10708		target_zpos = 0;
 10709		drm_for_each_plane_mask(plane, state->dev, crtc_state->plane_mask) {
 10710			if (plane->type == DRM_PLANE_TYPE_CURSOR)
 10711				continue;
 10712	
 10713			plane_state = drm_atomic_get_plane_state(state, plane);
 10714			if (IS_ERR(plane_state))
 10715				return PTR_ERR(plane_state);
 10716	
 10717			if (!plane_state->fb ||
 10718			    plane_state->normalized_zpos >= cursor_zpos)
 10719				continue;
 10720	
 10721			if (plane_state->normalized_zpos >= target_zpos) {
 10722				target_zpos = plane_state->normalized_zpos;
 10723				target_plane_state = plane_state;
 10724			}
 10725		}
 10726	
 10727		/* Nothing below cursor - use overlay mode */
 10728		if (target_plane_state == NULL) {
 10729			dm_crtc_state->cursor_mode = DM_CURSOR_OVERLAY_MODE;
 10730			return 0;
 10731		}
 10732	
 10733		if (amdgpu_dm_plane_is_video_format(target_plane_state->fb->format->format)) {
 10734			dm_crtc_state->cursor_mode = DM_CURSOR_OVERLAY_MODE;
 10735		} else {
 10736			dm_crtc_state->cursor_mode = DM_CURSOR_NATIVE_MODE;
 10737		}
 10738	
 10739		return 0;
 10740	}
 10741	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
