Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4C7242821
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 12:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09026E8D0;
	Wed, 12 Aug 2020 10:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BE16E8D0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 10:17:15 +0000 (UTC)
IronPort-SDR: D5cEy98S7xTk3nn78KZj7hK+N4eMV7cABTVpf7uH6s2LKicL4qGgkuSyWmvdfgNPSZ4xRhRmOV
 ESYVrOIcJRgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="141541734"
X-IronPort-AV: E=Sophos;i="5.76,303,1592895600"; 
 d="gz'50?scan'50,208,50";a="141541734"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 03:17:14 -0700
IronPort-SDR: eZ9s0hjGGVO2X0YoTW/J6x9U5BwPB++o+WsrvSvYKOPgiUAdSd56cm/x7oeLl63pblRA5wJsHz
 InkbpgAtsMvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,303,1592895600"; 
 d="gz'50?scan'50,208,50";a="290987924"
Received: from lkp-server01.sh.intel.com (HELO 7f1ebb311643) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 12 Aug 2020 03:17:11 -0700
Received: from kbuild by 7f1ebb311643 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k5nok-00001r-JG; Wed, 12 Aug 2020 10:17:10 +0000
Date: Wed, 12 Aug 2020 18:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: Algea Cao <algea.cao@rock-chips.com>, a.hajda@samsung.com,
 kuankuan.y@gmail.com, hjc@rock-chips.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org, airlied@linux.ie,
 heiko@sntech.de, jernej.skrabec@siol.net
Subject: Re: [PATCH 1/6] drm: Add connector atomic_begin/atomic_flush
Message-ID: <202008121808.Ih4IysU9%lkp@intel.com>
References: <20200812083407.856-1-algea.cao@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <20200812083407.856-1-algea.cao@rock-chips.com>
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
Cc: kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Algea,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master drm-exynos/exynos-drm-next v5.8 next-20200812]
[cannot apply to rockchip/for-next drm-intel/for-linux-next tegra-drm/drm/tegra/for-next drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Algea-Cao/Support-change-dw-hdmi-output-color/20200812-164647
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: m68k-randconfig-s032-20200812 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-168-g9554805c-dirty
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=m68k 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/err.h:5,
                    from include/linux/dma-fence.h:16,
                    from drivers/gpu/drm/drm_atomic_helper.c:28:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/m68k/include/asm/page_mm.h:169:49: warning: ordered comparison of pointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr) ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
         |                                                 ^~
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
      78 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/linux/scatterlist.h:143:2: note: in expansion of macro 'BUG_ON'
     143 |  BUG_ON(!virt_addr_valid(buf));
         |  ^~~~~~
   include/linux/scatterlist.h:143:10: note: in expansion of macro 'virt_addr_valid'
     143 |  BUG_ON(!virt_addr_valid(buf));
         |          ^~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_helper.c: In function 'drm_atomic_helper_commit_planes':
>> drivers/gpu/drm/drm_atomic_helper.c:2475:52: warning: variable 'new_connector_state' set but not used [-Wunused-but-set-variable]
    2475 |  struct drm_connector_state *old_connector_state, *new_connector_state;
         |                                                    ^~~~~~~~~~~~~~~~~~~

vim +/new_connector_state +2475 drivers/gpu/drm/drm_atomic_helper.c

  2428	
  2429	/**
  2430	 * drm_atomic_helper_commit_planes - commit plane state
  2431	 * @dev: DRM device
  2432	 * @old_state: atomic state object with old state structures
  2433	 * @flags: flags for committing plane state
  2434	 *
  2435	 * This function commits the new plane state using the plane and atomic helper
  2436	 * functions for planes and CRTCs. It assumes that the atomic state has already
  2437	 * been pushed into the relevant object state pointers, since this step can no
  2438	 * longer fail.
  2439	 *
  2440	 * It still requires the global state object @old_state to know which planes and
  2441	 * crtcs need to be updated though.
  2442	 *
  2443	 * Note that this function does all plane updates across all CRTCs in one step.
  2444	 * If the hardware can't support this approach look at
  2445	 * drm_atomic_helper_commit_planes_on_crtc() instead.
  2446	 *
  2447	 * Plane parameters can be updated by applications while the associated CRTC is
  2448	 * disabled. The DRM/KMS core will store the parameters in the plane state,
  2449	 * which will be available to the driver when the CRTC is turned on. As a result
  2450	 * most drivers don't need to be immediately notified of plane updates for a
  2451	 * disabled CRTC.
  2452	 *
  2453	 * Unless otherwise needed, drivers are advised to set the ACTIVE_ONLY flag in
  2454	 * @flags in order not to receive plane update notifications related to a
  2455	 * disabled CRTC. This avoids the need to manually ignore plane updates in
  2456	 * driver code when the driver and/or hardware can't or just don't need to deal
  2457	 * with updates on disabled CRTCs, for example when supporting runtime PM.
  2458	 *
  2459	 * Drivers may set the NO_DISABLE_AFTER_MODESET flag in @flags if the relevant
  2460	 * display controllers require to disable a CRTC's planes when the CRTC is
  2461	 * disabled. This function would skip the &drm_plane_helper_funcs.atomic_disable
  2462	 * call for a plane if the CRTC of the old plane state needs a modesetting
  2463	 * operation. Of course, the drivers need to disable the planes in their CRTC
  2464	 * disable callbacks since no one else would do that.
  2465	 *
  2466	 * The drm_atomic_helper_commit() default implementation doesn't set the
  2467	 * ACTIVE_ONLY flag to most closely match the behaviour of the legacy helpers.
  2468	 * This should not be copied blindly by drivers.
  2469	 */
  2470	void drm_atomic_helper_commit_planes(struct drm_device *dev,
  2471					     struct drm_atomic_state *old_state,
  2472					     uint32_t flags)
  2473	{
  2474		struct drm_connector *connector;
> 2475		struct drm_connector_state *old_connector_state, *new_connector_state;
  2476		struct drm_crtc *crtc;
  2477		struct drm_crtc_state *old_crtc_state, *new_crtc_state;
  2478		struct drm_plane *plane;
  2479		struct drm_plane_state *old_plane_state, *new_plane_state;
  2480		int i;
  2481		bool active_only = flags & DRM_PLANE_COMMIT_ACTIVE_ONLY;
  2482		bool no_disable = flags & DRM_PLANE_COMMIT_NO_DISABLE_AFTER_MODESET;
  2483	
  2484		for_each_oldnew_connector_in_state(old_state, connector,
  2485						   old_connector_state,
  2486						   new_connector_state, i) {
  2487			const struct drm_connector_helper_funcs *funcs;
  2488	
  2489			if (!connector->state->crtc)
  2490				continue;
  2491	
  2492			if (!connector->state->crtc->state->active)
  2493				continue;
  2494	
  2495			funcs = connector->helper_private;
  2496	
  2497			if (!funcs || !funcs->atomic_begin)
  2498				continue;
  2499	
  2500			DRM_DEBUG_ATOMIC("flush beginning [CONNECTOR:%d:%s]\n",
  2501					 connector->base.id, connector->name);
  2502	
  2503			funcs->atomic_begin(connector, old_connector_state);
  2504		}
  2505	
  2506		for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
  2507			const struct drm_crtc_helper_funcs *funcs;
  2508	
  2509			funcs = crtc->helper_private;
  2510	
  2511			if (!funcs || !funcs->atomic_begin)
  2512				continue;
  2513	
  2514			if (active_only && !new_crtc_state->active)
  2515				continue;
  2516	
  2517			funcs->atomic_begin(crtc, old_crtc_state);
  2518		}
  2519	
  2520		for_each_oldnew_plane_in_state(old_state, plane, old_plane_state, new_plane_state, i) {
  2521			const struct drm_plane_helper_funcs *funcs;
  2522			bool disabling;
  2523	
  2524			funcs = plane->helper_private;
  2525	
  2526			if (!funcs)
  2527				continue;
  2528	
  2529			disabling = drm_atomic_plane_disabling(old_plane_state,
  2530							       new_plane_state);
  2531	
  2532			if (active_only) {
  2533				/*
  2534				 * Skip planes related to inactive CRTCs. If the plane
  2535				 * is enabled use the state of the current CRTC. If the
  2536				 * plane is being disabled use the state of the old
  2537				 * CRTC to avoid skipping planes being disabled on an
  2538				 * active CRTC.
  2539				 */
  2540				if (!disabling && !plane_crtc_active(new_plane_state))
  2541					continue;
  2542				if (disabling && !plane_crtc_active(old_plane_state))
  2543					continue;
  2544			}
  2545	
  2546			/*
  2547			 * Special-case disabling the plane if drivers support it.
  2548			 */
  2549			if (disabling && funcs->atomic_disable) {
  2550				struct drm_crtc_state *crtc_state;
  2551	
  2552				crtc_state = old_plane_state->crtc->state;
  2553	
  2554				if (drm_atomic_crtc_needs_modeset(crtc_state) &&
  2555				    no_disable)
  2556					continue;
  2557	
  2558				funcs->atomic_disable(plane, old_plane_state);
  2559			} else if (new_plane_state->crtc || disabling) {
  2560				funcs->atomic_update(plane, old_plane_state);
  2561			}
  2562		}
  2563	
  2564		for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
  2565			const struct drm_crtc_helper_funcs *funcs;
  2566	
  2567			funcs = crtc->helper_private;
  2568	
  2569			if (!funcs || !funcs->atomic_flush)
  2570				continue;
  2571	
  2572			if (active_only && !new_crtc_state->active)
  2573				continue;
  2574	
  2575			funcs->atomic_flush(crtc, old_crtc_state);
  2576		}
  2577	
  2578		for_each_oldnew_connector_in_state(old_state, connector,
  2579						   old_connector_state,
  2580						   new_connector_state, i) {
  2581			const struct drm_connector_helper_funcs *funcs;
  2582	
  2583			if (!connector->state->crtc)
  2584				continue;
  2585	
  2586			if (!connector->state->crtc->state->active)
  2587				continue;
  2588	
  2589			funcs = connector->helper_private;
  2590	
  2591			if (!funcs || !funcs->atomic_flush)
  2592				continue;
  2593	
  2594			DRM_DEBUG_ATOMIC("flushing [CONNECTOR:%d:%s]\n",
  2595					 connector->base.id, connector->name);
  2596	
  2597			funcs->atomic_flush(connector, old_connector_state);
  2598		}
  2599	}
  2600	EXPORT_SYMBOL(drm_atomic_helper_commit_planes);
  2601	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--pWyiEgJYm5f9v55/
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--pWyiEgJYm5f9v55/--
