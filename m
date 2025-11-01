Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5287FC27520
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 02:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC27B10E058;
	Sat,  1 Nov 2025 01:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awrheF5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E123310E058
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Nov 2025 01:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761959181; x=1793495181;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qbDcVQmBw7W4/baBODucnA0isMkDnlPY0e6magXcTiU=;
 b=awrheF5LbGDTmgHGb7kW3EUR2p3eMYxoij+46uIIQBXvmtsIzb9l+gVN
 LY0+cF06P3wiTyM0DdKyMOZV5rYphq0PKQHSAbG+HjR8swEHsRyAtarSv
 s/hSGSXeVoeh/QEj/tQ/F74a3Y087ZjkcIUzzEzn6qknMsipaS6922eJZ
 AM6V6b7XjxSv5pTWPrr1jUDU8yir7hwNQ8TK9mArjKwGGzdv1Fh30ktuv
 QDq5cVLuuRkEnSYAfhhmvEO7NO5DqwiqOlixlmyiOszNAR9fF1Sl7g0+i
 4bFCRFqzVqtL7P3X0lAThPUQ5In8wOTb0t8PGGTnLdOo7sfivxUVuOuaY g==;
X-CSE-ConnectionGUID: 4kVfd9LVT3+tah5xPtiZ7Q==
X-CSE-MsgGUID: jMJuPDlKSjCcAyOizmiiSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75475995"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="75475995"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:06:21 -0700
X-CSE-ConnectionGUID: Ppo9VfFdQYusMhwJ6EdM4w==
X-CSE-MsgGUID: gyd+mZGZSHGIFO0vShtCwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190713103"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 31 Oct 2025 18:06:19 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vF03p-000NmG-0a;
 Sat, 01 Nov 2025 01:05:54 +0000
Date: Sat, 1 Nov 2025 09:04:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com,
 zack.rusin@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: Re: [PATCH v2] drm/vmwgfx: Restore Guest-Backed only cursor plane
 support
Message-ID: <202511010812.B8o5v9vq-lkp@intel.com>
References: <20251030143910.134767-1-ian.forbes@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030143910.134767-1-ian.forbes@broadcom.com>
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

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Forbes/drm-vmwgfx-Restore-Guest-Backed-only-cursor-plane-support/20251030-224831
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20251030143910.134767-1-ian.forbes%40broadcom.com
patch subject: [PATCH v2] drm/vmwgfx: Restore Guest-Backed only cursor plane support
config: arm64-randconfig-001-20251101 (https://download.01.org/0day-ci/archive/20251101/202511010812.B8o5v9vq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010812.B8o5v9vq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010812.B8o5v9vq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c: In function 'vmw_cursor_plane_atomic_update':
>> drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c:770:3: error: a label can only be part of a statement and a declaration is not a statement
      struct vmw_bo *bo = vmw_user_object_buffer(&vps->uo);
      ^~~~~~


vim +770 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c

   739	
   740	void
   741	vmw_cursor_plane_atomic_update(struct drm_plane *plane,
   742				       struct drm_atomic_state *state)
   743	{
   744		struct drm_plane_state *new_state =
   745			drm_atomic_get_new_plane_state(state, plane);
   746		struct drm_plane_state *old_state =
   747			drm_atomic_get_old_plane_state(state, plane);
   748		struct drm_crtc *crtc = new_state->crtc ?: old_state->crtc;
   749		struct vmw_private *dev_priv = vmw_priv(plane->dev);
   750		struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
   751		struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
   752		s32 hotspot_x, hotspot_y, cursor_x, cursor_y;
   753	
   754		/*
   755		 * Hide the cursor if the new bo is null
   756		 */
   757		if (vmw_user_object_is_null(&vps->uo)) {
   758			vmw_cursor_update_position(dev_priv, false, 0, 0);
   759			return;
   760		}
   761	
   762		switch (vps->cursor.update_type) {
   763		case VMW_CURSOR_UPDATE_LEGACY:
   764			vmw_cursor_plane_update_legacy(dev_priv, vps);
   765			break;
   766		case VMW_CURSOR_UPDATE_MOB:
   767			vmw_cursor_update_mob(dev_priv, vps);
   768			break;
   769		case VMW_CURSOR_UPDATE_GB_ONLY:
 > 770			struct vmw_bo *bo = vmw_user_object_buffer(&vps->uo);
   771	
   772			if (bo)
   773				vmw_send_define_cursor_cmd(dev_priv, bo->map.virtual,
   774							   vps->base.crtc_w,
   775							   vps->base.crtc_h,
   776							   vps->base.hotspot_x,
   777							   vps->base.hotspot_y);
   778			break;
   779		case VMW_CURSOR_UPDATE_NONE:
   780			/* do nothing */
   781			break;
   782		}
   783	
   784		/*
   785		 * For all update types update the cursor position
   786		 */
   787		cursor_x = new_state->crtc_x + du->set_gui_x;
   788		cursor_y = new_state->crtc_y + du->set_gui_y;
   789	
   790		hotspot_x = vps->cursor.legacy.hotspot_x + new_state->hotspot_x;
   791		hotspot_y = vps->cursor.legacy.hotspot_y + new_state->hotspot_y;
   792	
   793		vmw_cursor_update_position(dev_priv, true, cursor_x + hotspot_x,
   794					   cursor_y + hotspot_y);
   795	}
   796	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
