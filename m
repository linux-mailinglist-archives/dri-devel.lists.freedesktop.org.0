Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1E070C4A5
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 19:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562A110E063;
	Mon, 22 May 2023 17:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CBE10E063;
 Mon, 22 May 2023 17:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684777797; x=1716313797;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=9aj5d8YshLRN49LQIbdHq+0co56CTQCROEIBvpVm97Q=;
 b=HQFsaQiAr62H0s3M7bjmWsuhpoOwBhHLVYqNyO28sen6X+gcVuWvNz8t
 OlLvrCuNFfxNvaM930T8TIeSWNC/GYUDRmYBx8v+MXL6H/RG5N7egI0nv
 xdtDxPJgCjQxzBMJfJQ6EkkOB6C/Ef94wj9WKF63HyzWNhsKsEsyftdiD
 qk6RyYBsUzbw1OVFMNWqqLzGJzO/MGbqAhLJHbpjHq84QBoUCkQBK+TLz
 X7LUmgQ8LBx0CKOcjxAE6N3x6bEWHu5BeDSrIf2t9Algzf9HbC1j+5Vjs
 OEZStApX/yLH3k/aPo9ImKvG1D18dKjSDr5NPuUhezR9H0SyVeJzOOlfs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="337580496"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="337580496"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 10:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="706636827"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="706636827"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 22 May 2023 10:49:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q19fM-000D2J-0g;
 Mon, 22 May 2023 17:49:52 +0000
Date: Tue, 23 May 2023 01:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [drm-intel:for-linux-next 1/1]
 drivers/gpu/drm/i915/display/intel_display.c:6012:3: warning: unannotated
 fall-through between switch labels
Message-ID: <202305230153.lce5jQM9-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 oe-kbuild-all@lists.linux.dev, Animesh Manna <animesh.manna@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel for-linux-next
head:   937859485aefed1d9df72feb6ea74a84ff5cfa46
commit: 937859485aefed1d9df72feb6ea74a84ff5cfa46 [1/1] drm/i915: Support Async Flip on Linear buffers
config: x86_64-randconfig-a012-20230522 (https://download.01.org/0day-ci/archive/20230523/202305230153.lce5jQM9-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-intel git://anongit.freedesktop.org/drm-intel
        git fetch --no-tags drm-intel for-linux-next
        git checkout 937859485aefed1d9df72feb6ea74a84ff5cfa46
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305230153.lce5jQM9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_display.c:6012:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
                   case I915_FORMAT_MOD_X_TILED:
                   ^
   drivers/gpu/drm/i915/display/intel_display.c:6012:3: note: insert 'break;' to avoid fall-through
                   case I915_FORMAT_MOD_X_TILED:
                   ^
                   break; 
   1 warning generated.


vim +6012 drivers/gpu/drm/i915/display/intel_display.c

b0b2bed2a1305c Ville Syrjälä         2022-02-14  5931  
b0b2bed2a1305c Ville Syrjälä         2022-02-14  5932  static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct intel_crtc *crtc)
30ff93af9e19db Karthik B S           2020-09-21  5933  {
30ff93af9e19db Karthik B S           2020-09-21  5934  	struct drm_i915_private *i915 = to_i915(state->base.dev);
30ff93af9e19db Karthik B S           2020-09-21  5935  	const struct intel_crtc_state *old_crtc_state, *new_crtc_state;
30ff93af9e19db Karthik B S           2020-09-21  5936  	const struct intel_plane_state *new_plane_state, *old_plane_state;
30ff93af9e19db Karthik B S           2020-09-21  5937  	struct intel_plane *plane;
30ff93af9e19db Karthik B S           2020-09-21  5938  	int i;
30ff93af9e19db Karthik B S           2020-09-21  5939  
0826edb6a5e5b3 José Roberto de Souza 2021-10-29  5940  	old_crtc_state = intel_atomic_get_old_crtc_state(state, crtc);
0826edb6a5e5b3 José Roberto de Souza 2021-10-29  5941  	new_crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
0826edb6a5e5b3 José Roberto de Souza 2021-10-29  5942  
b0b2bed2a1305c Ville Syrjälä         2022-02-14  5943  	if (!new_crtc_state->uapi.async_flip)
b0b2bed2a1305c Ville Syrjälä         2022-02-14  5944  		return 0;
b0b2bed2a1305c Ville Syrjälä         2022-02-14  5945  
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  5946  	if (!new_crtc_state->hw.active) {
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  5947  		drm_dbg_kms(&i915->drm,
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  5948  			    "[CRTC:%d:%s] not active\n",
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  5949  			    crtc->base.base.id, crtc->base.name);
30ff93af9e19db Karthik B S           2020-09-21  5950  		return -EINVAL;
30ff93af9e19db Karthik B S           2020-09-21  5951  	}
30ff93af9e19db Karthik B S           2020-09-21  5952  
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  5953  	if (intel_crtc_needs_modeset(new_crtc_state)) {
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  5954  		drm_dbg_kms(&i915->drm,
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  5955  			    "[CRTC:%d:%s] modeset required\n",
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  5956  			    crtc->base.base.id, crtc->base.name);
30ff93af9e19db Karthik B S           2020-09-21  5957  		return -EINVAL;
30ff93af9e19db Karthik B S           2020-09-21  5958  	}
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  5959  
30ff93af9e19db Karthik B S           2020-09-21  5960  	if (old_crtc_state->active_planes != new_crtc_state->active_planes) {
30ff93af9e19db Karthik B S           2020-09-21  5961  		drm_dbg_kms(&i915->drm,
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  5962  			    "[CRTC:%d:%s] Active planes cannot be in async flip\n",
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  5963  			    crtc->base.base.id, crtc->base.name);
30ff93af9e19db Karthik B S           2020-09-21  5964  		return -EINVAL;
30ff93af9e19db Karthik B S           2020-09-21  5965  	}
30ff93af9e19db Karthik B S           2020-09-21  5966  
30ff93af9e19db Karthik B S           2020-09-21  5967  	for_each_oldnew_intel_plane_in_state(state, plane, old_plane_state,
30ff93af9e19db Karthik B S           2020-09-21  5968  					     new_plane_state, i) {
0826edb6a5e5b3 José Roberto de Souza 2021-10-29  5969  		if (plane->pipe != crtc->pipe)
0826edb6a5e5b3 José Roberto de Souza 2021-10-29  5970  			continue;
0826edb6a5e5b3 José Roberto de Souza 2021-10-29  5971  
30ff93af9e19db Karthik B S           2020-09-21  5972  		/*
2e08437160d1e8 Ville Syrjälä         2022-02-14  5973  		 * Only async flip capable planes should be in the state
2e08437160d1e8 Ville Syrjälä         2022-02-14  5974  		 * if we're really about to ask the hardware to perform
2e08437160d1e8 Ville Syrjälä         2022-02-14  5975  		 * an async flip. We should never get this far otherwise.
30ff93af9e19db Karthik B S           2020-09-21  5976  		 */
2e08437160d1e8 Ville Syrjälä         2022-02-14  5977  		if (drm_WARN_ON(&i915->drm,
2e08437160d1e8 Ville Syrjälä         2022-02-14  5978  				new_crtc_state->do_async_flip && !plane->async_flip))
30ff93af9e19db Karthik B S           2020-09-21  5979  			return -EINVAL;
30ff93af9e19db Karthik B S           2020-09-21  5980  
2e08437160d1e8 Ville Syrjälä         2022-02-14  5981  		/*
2e08437160d1e8 Ville Syrjälä         2022-02-14  5982  		 * Only check async flip capable planes other planes
2e08437160d1e8 Ville Syrjälä         2022-02-14  5983  		 * may be involved in the initial commit due to
2e08437160d1e8 Ville Syrjälä         2022-02-14  5984  		 * the wm0/ddb optimization.
2e08437160d1e8 Ville Syrjälä         2022-02-14  5985  		 *
2e08437160d1e8 Ville Syrjälä         2022-02-14  5986  		 * TODO maybe should track which planes actually
2e08437160d1e8 Ville Syrjälä         2022-02-14  5987  		 * were requested to do the async flip...
2e08437160d1e8 Ville Syrjälä         2022-02-14  5988  		 */
2e08437160d1e8 Ville Syrjälä         2022-02-14  5989  		if (!plane->async_flip)
2e08437160d1e8 Ville Syrjälä         2022-02-14  5990  			continue;
2e08437160d1e8 Ville Syrjälä         2022-02-14  5991  
30ff93af9e19db Karthik B S           2020-09-21  5992  		/*
30ff93af9e19db Karthik B S           2020-09-21  5993  		 * FIXME: This check is kept generic for all platforms.
244dba4cb59637 Lucas De Marchi       2021-07-28  5994  		 * Need to verify this for all gen9 platforms to enable
30ff93af9e19db Karthik B S           2020-09-21  5995  		 * this selectively if required.
30ff93af9e19db Karthik B S           2020-09-21  5996  		 */
30ff93af9e19db Karthik B S           2020-09-21  5997  		switch (new_plane_state->hw.fb->modifier) {
937859485aefed Arun R Murthy         2022-09-06  5998  		case DRM_FORMAT_MOD_LINEAR:
937859485aefed Arun R Murthy         2022-09-06  5999  			/*
937859485aefed Arun R Murthy         2022-09-06  6000  			 * FIXME: Async on Linear buffer is supported on ICL as
937859485aefed Arun R Murthy         2022-09-06  6001  			 * but with additional alignment and fbc restrictions
937859485aefed Arun R Murthy         2022-09-06  6002  			 * need to be taken care of. These aren't applicable for
937859485aefed Arun R Murthy         2022-09-06  6003  			 * gen12+.
937859485aefed Arun R Murthy         2022-09-06  6004  			 */
937859485aefed Arun R Murthy         2022-09-06  6005  			if (DISPLAY_VER(i915) < 12) {
937859485aefed Arun R Murthy         2022-09-06  6006  				drm_dbg_kms(&i915->drm,
937859485aefed Arun R Murthy         2022-09-06  6007  					    "[PLANE:%d:%s] Modifier does not support async flips\n",
937859485aefed Arun R Murthy         2022-09-06  6008  					    plane->base.base.id, plane->base.name);
937859485aefed Arun R Murthy         2022-09-06  6009  				return -EINVAL;
937859485aefed Arun R Murthy         2022-09-06  6010  			}
937859485aefed Arun R Murthy         2022-09-06  6011  
30ff93af9e19db Karthik B S           2020-09-21 @6012  		case I915_FORMAT_MOD_X_TILED:
30ff93af9e19db Karthik B S           2020-09-21  6013  		case I915_FORMAT_MOD_Y_TILED:
30ff93af9e19db Karthik B S           2020-09-21  6014  		case I915_FORMAT_MOD_Yf_TILED:
072ce4164f973b Stanislav Lisovskiy   2022-01-18  6015  		case I915_FORMAT_MOD_4_TILED:
30ff93af9e19db Karthik B S           2020-09-21  6016  			break;
30ff93af9e19db Karthik B S           2020-09-21  6017  		default:
30ff93af9e19db Karthik B S           2020-09-21  6018  			drm_dbg_kms(&i915->drm,
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6019  				    "[PLANE:%d:%s] Modifier does not support async flips\n",
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6020  				    plane->base.base.id, plane->base.name);
30ff93af9e19db Karthik B S           2020-09-21  6021  			return -EINVAL;
30ff93af9e19db Karthik B S           2020-09-21  6022  		}
30ff93af9e19db Karthik B S           2020-09-21  6023  
aaec72ee90bccc Ville Syrjälä         2021-10-18  6024  		if (new_plane_state->hw.fb->format->num_planes > 1) {
aaec72ee90bccc Ville Syrjälä         2021-10-18  6025  			drm_dbg_kms(&i915->drm,
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6026  				    "[PLANE:%d:%s] Planar formats do not support async flips\n",
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6027  				    plane->base.base.id, plane->base.name);
aaec72ee90bccc Ville Syrjälä         2021-10-18  6028  			return -EINVAL;
aaec72ee90bccc Ville Syrjälä         2021-10-18  6029  		}
aaec72ee90bccc Ville Syrjälä         2021-10-18  6030  
be6c1dd5ac074d Imre Deak             2021-10-27  6031  		if (old_plane_state->view.color_plane[0].mapping_stride !=
be6c1dd5ac074d Imre Deak             2021-10-27  6032  		    new_plane_state->view.color_plane[0].mapping_stride) {
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6033  			drm_dbg_kms(&i915->drm,
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6034  				    "[PLANE:%d:%s] Stride cannot be changed in async flip\n",
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6035  				    plane->base.base.id, plane->base.name);
30ff93af9e19db Karthik B S           2020-09-21  6036  			return -EINVAL;
30ff93af9e19db Karthik B S           2020-09-21  6037  		}
30ff93af9e19db Karthik B S           2020-09-21  6038  
30ff93af9e19db Karthik B S           2020-09-21  6039  		if (old_plane_state->hw.fb->modifier !=
30ff93af9e19db Karthik B S           2020-09-21  6040  		    new_plane_state->hw.fb->modifier) {
30ff93af9e19db Karthik B S           2020-09-21  6041  			drm_dbg_kms(&i915->drm,
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6042  				    "[PLANE:%d:%s] Modifier cannot be changed in async flip\n",
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6043  				    plane->base.base.id, plane->base.name);
30ff93af9e19db Karthik B S           2020-09-21  6044  			return -EINVAL;
30ff93af9e19db Karthik B S           2020-09-21  6045  		}
30ff93af9e19db Karthik B S           2020-09-21  6046  
30ff93af9e19db Karthik B S           2020-09-21  6047  		if (old_plane_state->hw.fb->format !=
30ff93af9e19db Karthik B S           2020-09-21  6048  		    new_plane_state->hw.fb->format) {
30ff93af9e19db Karthik B S           2020-09-21  6049  			drm_dbg_kms(&i915->drm,
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6050  				    "[PLANE:%d:%s] Pixel format cannot be changed in async flip\n",
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6051  				    plane->base.base.id, plane->base.name);
30ff93af9e19db Karthik B S           2020-09-21  6052  			return -EINVAL;
30ff93af9e19db Karthik B S           2020-09-21  6053  		}
30ff93af9e19db Karthik B S           2020-09-21  6054  
30ff93af9e19db Karthik B S           2020-09-21  6055  		if (old_plane_state->hw.rotation !=
30ff93af9e19db Karthik B S           2020-09-21  6056  		    new_plane_state->hw.rotation) {
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6057  			drm_dbg_kms(&i915->drm,
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6058  				    "[PLANE:%d:%s] Rotation cannot be changed in async flip\n",
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6059  				    plane->base.base.id, plane->base.name);
30ff93af9e19db Karthik B S           2020-09-21  6060  			return -EINVAL;
30ff93af9e19db Karthik B S           2020-09-21  6061  		}
30ff93af9e19db Karthik B S           2020-09-21  6062  
30ff93af9e19db Karthik B S           2020-09-21  6063  		if (!drm_rect_equals(&old_plane_state->uapi.src, &new_plane_state->uapi.src) ||
30ff93af9e19db Karthik B S           2020-09-21  6064  		    !drm_rect_equals(&old_plane_state->uapi.dst, &new_plane_state->uapi.dst)) {
30ff93af9e19db Karthik B S           2020-09-21  6065  			drm_dbg_kms(&i915->drm,
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6066  				    "[PLANE:%d:%s] Size/co-ordinates cannot be changed in async flip\n",
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6067  				    plane->base.base.id, plane->base.name);
30ff93af9e19db Karthik B S           2020-09-21  6068  			return -EINVAL;
30ff93af9e19db Karthik B S           2020-09-21  6069  		}
30ff93af9e19db Karthik B S           2020-09-21  6070  
30ff93af9e19db Karthik B S           2020-09-21  6071  		if (old_plane_state->hw.alpha != new_plane_state->hw.alpha) {
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6072  			drm_dbg_kms(&i915->drm,
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6073  				    "[PLANES:%d:%s] Alpha value cannot be changed in async flip\n",
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6074  				    plane->base.base.id, plane->base.name);
30ff93af9e19db Karthik B S           2020-09-21  6075  			return -EINVAL;
30ff93af9e19db Karthik B S           2020-09-21  6076  		}
30ff93af9e19db Karthik B S           2020-09-21  6077  
30ff93af9e19db Karthik B S           2020-09-21  6078  		if (old_plane_state->hw.pixel_blend_mode !=
30ff93af9e19db Karthik B S           2020-09-21  6079  		    new_plane_state->hw.pixel_blend_mode) {
30ff93af9e19db Karthik B S           2020-09-21  6080  			drm_dbg_kms(&i915->drm,
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6081  				    "[PLANE:%d:%s] Pixel blend mode cannot be changed in async flip\n",
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6082  				    plane->base.base.id, plane->base.name);
30ff93af9e19db Karthik B S           2020-09-21  6083  			return -EINVAL;
30ff93af9e19db Karthik B S           2020-09-21  6084  		}
30ff93af9e19db Karthik B S           2020-09-21  6085  
30ff93af9e19db Karthik B S           2020-09-21  6086  		if (old_plane_state->hw.color_encoding != new_plane_state->hw.color_encoding) {
30ff93af9e19db Karthik B S           2020-09-21  6087  			drm_dbg_kms(&i915->drm,
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6088  				    "[PLANE:%d:%s] Color encoding cannot be changed in async flip\n",
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6089  				    plane->base.base.id, plane->base.name);
30ff93af9e19db Karthik B S           2020-09-21  6090  			return -EINVAL;
30ff93af9e19db Karthik B S           2020-09-21  6091  		}
30ff93af9e19db Karthik B S           2020-09-21  6092  
30ff93af9e19db Karthik B S           2020-09-21  6093  		if (old_plane_state->hw.color_range != new_plane_state->hw.color_range) {
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6094  			drm_dbg_kms(&i915->drm,
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6095  				    "[PLANE:%d:%s] Color range cannot be changed in async flip\n",
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6096  				    plane->base.base.id, plane->base.name);
30ff93af9e19db Karthik B S           2020-09-21  6097  			return -EINVAL;
30ff93af9e19db Karthik B S           2020-09-21  6098  		}
ef6ba31dd38405 Anshuman Gupta        2021-09-24  6099  
ef6ba31dd38405 Anshuman Gupta        2021-09-24  6100  		/* plane decryption is allow to change only in synchronous flips */
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6101  		if (old_plane_state->decrypt != new_plane_state->decrypt) {
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6102  			drm_dbg_kms(&i915->drm,
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6103  				    "[PLANE:%d:%s] Decryption cannot be changed in async flip\n",
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6104  				    plane->base.base.id, plane->base.name);
ef6ba31dd38405 Anshuman Gupta        2021-09-24  6105  			return -EINVAL;
30ff93af9e19db Karthik B S           2020-09-21  6106  		}
6b4e414ce8dab7 Ville Syrjälä         2022-02-14  6107  	}
30ff93af9e19db Karthik B S           2020-09-21  6108  
30ff93af9e19db Karthik B S           2020-09-21  6109  	return 0;
30ff93af9e19db Karthik B S           2020-09-21  6110  }
30ff93af9e19db Karthik B S           2020-09-21  6111  

:::::: The code at line 6012 was first introduced by commit
:::::: 30ff93af9e19dbe88ff8b5e711e05b26b991eec0 drm/i915: Add checks specific to async flips

:::::: TO: Karthik B S <karthik.b.s@intel.com>
:::::: CC: Ville Syrjälä <ville.syrjala@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
