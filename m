Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B69FD3B81E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 21:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3D710E509;
	Mon, 19 Jan 2026 20:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maTSCRPA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5AB10E1BC;
 Mon, 19 Jan 2026 20:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768854017; x=1800390017;
 h=date:from:to:cc:subject:message-id;
 bh=1vQg/T5ZuzuhxcFSSx1m4hlg1qsZLbyt3u418N/l8YE=;
 b=maTSCRPAgBBlo4JkeEP07D/ig/hQMo8m2UwR1TfYOCXJbBaN7kCG6bvi
 cvnEGLXs3yqgDybIaUGSbK1HCjAJmcgNhtab2jYb12uG1159q+692SvND
 Gwihs5Xk26l3VQyCyBNsQCGagmn86v1fIi1IJd9zy78o4D2AxHZa92nNq
 x/6HxT/Q7wUCTP4nu6ZilOIznxKNpNSH8kRuigJxF5x0wjM4q/ztnM0xZ
 HcmsR6pcNwi7UUmEsyLupiIAHEd3PnFKcCSpC923B8FM/QIUFGV0a+bm0
 gkeW0JL0xOTZf4IBsRNs98ez+ZTkac7+l8iz/FAtft2lYVY/ahivsl4Qn g==;
X-CSE-ConnectionGUID: 52zBgXZEQde7TQQdYaooeQ==
X-CSE-MsgGUID: Z/p7gk+0Q1O8Sm0QTlZ8TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73694254"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="73694254"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 12:20:17 -0800
X-CSE-ConnectionGUID: 3GfOwatjSPiOYcDIiG1Lcw==
X-CSE-MsgGUID: oeuaV/PBSHmpRqw+Ia9ZSA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 19 Jan 2026 12:20:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vhvjQ-00000000OH1-2aWp;
 Mon, 19 Jan 2026 20:20:12 +0000
Date: Tue, 20 Jan 2026 04:19:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [drm-tip:drm-tip 1415/1442]
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2744:49: warning: passing
 argument 6 of 'drm_property_replace_blob_from_id' makes integer from pointer
 without a cast
Message-ID: <202601200452.irMHod6V-lkp@intel.com>
User-Agent: s-nail v14.9.25
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

tree:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
head:   1629d3f34f235cd5e43cfd0386a152d65584ccd4
commit: 7436a87db99d57196c49d10de35f41531993d5f1 [1415/1442] drm/tests: hdmi: check the infoframes behaviour
config: x86_64-randconfig-005-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200452.irMHod6V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200452.irMHod6V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200452.irMHod6V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c: In function 'drm_test_check_reject_hdr_infoframe_bpc_10':
>> drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2744:49: warning: passing argument 6 of 'drm_property_replace_blob_from_id' makes integer from pointer without a cast [-Wint-conversion]
    2744 |                                                 &replaced);
         |                                                 ^~~~~~~~~
         |                                                 |
         |                                                 bool * {aka _Bool *}
   In file included from include/drm/drm_connector.h:33,
                    from include/drm/drm_modes.h:33,
                    from include/drm/drm_crtc.h:32,
                    from include/drm/drm_atomic.h:31,
                    from drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:7:
   include/drm/drm_property.h:287:47: note: expected 'ssize_t' {aka 'long int'} but argument is of type 'bool *' {aka '_Bool *'}
     287 |                                       ssize_t max_size,
         |                                       ~~~~~~~~^~~~~~~~
   drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2740:15: error: too few arguments to function 'drm_property_replace_blob_from_id'
    2740 |         ret = drm_property_replace_blob_from_id(drm,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_property.h:282:5: note: declared here
     282 | int drm_property_replace_blob_from_id(struct drm_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_property_replace_blob_from_id +2744 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c

  2658	
  2659	/*
  2660	 * Test that the rejection of HDR InfoFrame results in the failure of
  2661	 * drm_atomic_helper_connector_hdmi_update_infoframes() in the high bpc is
  2662	 * supported.
  2663	 */
  2664	static void drm_test_check_reject_hdr_infoframe_bpc_10(struct kunit *test)
  2665	{
  2666		struct drm_atomic_helper_connector_hdmi_priv *priv;
  2667		struct drm_modeset_acquire_ctx ctx;
  2668		struct drm_atomic_state *state;
  2669		struct drm_connector_state *new_conn_state;
  2670		struct drm_crtc_state *crtc_state;
  2671		struct drm_display_mode *preferred;
  2672		struct drm_connector *conn;
  2673		struct drm_device *drm;
  2674		struct drm_crtc *crtc;
  2675		int old_hdmi_update_failures;
  2676		struct hdr_output_metadata hdr_data;
  2677		struct drm_property_blob *hdr_blob;
  2678		bool replaced;
  2679		int ret;
  2680	
  2681		priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
  2682					BIT(HDMI_COLORSPACE_RGB),
  2683					10,
  2684					&reject_hdr_infoframe_hdmi_funcs,
  2685					test_edid_hdmi_1080p_rgb_max_200mhz_hdr);
  2686		KUNIT_ASSERT_NOT_NULL(test, priv);
  2687	
  2688		drm = &priv->drm;
  2689		crtc = priv->crtc;
  2690		conn = &priv->connector;
  2691	
  2692		preferred = find_preferred_mode(conn);
  2693		KUNIT_ASSERT_NOT_NULL(test, preferred);
  2694	
  2695		drm_modeset_acquire_init(&ctx, 0);
  2696	
  2697	retry_conn_enable:
  2698		ret = drm_kunit_helper_enable_crtc_connector(test, drm,
  2699							     crtc, conn,
  2700							     preferred,
  2701							     &ctx);
  2702		if (ret == -EDEADLK) {
  2703			ret = drm_modeset_backoff(&ctx);
  2704			if (!ret)
  2705				goto retry_conn_enable;
  2706		}
  2707		KUNIT_ASSERT_EQ(test, ret, 0);
  2708	
  2709		drm_encoder_helper_add(&priv->encoder, &test_encoder_helper_funcs);
  2710	
  2711		state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
  2712		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
  2713	
  2714	retry_conn_state:
  2715		new_conn_state = drm_atomic_get_connector_state(state, conn);
  2716		if (PTR_ERR(new_conn_state) == -EDEADLK) {
  2717			drm_atomic_state_clear(state);
  2718			ret = drm_modeset_backoff(&ctx);
  2719			if (!ret)
  2720				goto retry_conn_state;
  2721		}
  2722		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
  2723	
  2724		crtc_state = drm_atomic_get_crtc_state(state, crtc);
  2725		if (PTR_ERR(crtc_state) == -EDEADLK) {
  2726			drm_atomic_state_clear(state);
  2727			ret = drm_modeset_backoff(&ctx);
  2728			if (!ret)
  2729				goto retry_conn_state;
  2730		}
  2731		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
  2732	
  2733		hdr_data.metadata_type = HDMI_STATIC_METADATA_TYPE1;
  2734		hdr_data.hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
  2735		hdr_data.hdmi_metadata_type1.metadata_type = HDMI_STATIC_METADATA_TYPE1;
  2736	
  2737		hdr_blob = drm_property_create_blob(drm, sizeof(hdr_data), &hdr_data);
  2738		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hdr_blob);
  2739	
  2740		ret = drm_property_replace_blob_from_id(drm,
  2741							&new_conn_state->hdr_output_metadata,
  2742							hdr_blob->base.id,
  2743							sizeof(struct hdr_output_metadata), -1,
> 2744							&replaced);
  2745		KUNIT_ASSERT_EQ(test, ret, 0);
  2746		KUNIT_ASSERT_EQ(test, replaced, true);
  2747	
  2748		crtc_state->mode_changed = true;
  2749	
  2750		old_hdmi_update_failures = priv->hdmi_update_failures;
  2751	
  2752		ret = drm_atomic_check_only(state);
  2753		if (ret == -EDEADLK) {
  2754			drm_atomic_state_clear(state);
  2755			ret = drm_modeset_backoff(&ctx);
  2756			if (!ret)
  2757				goto retry_conn_state;
  2758		}
  2759		KUNIT_ASSERT_EQ(test, ret, 0);
  2760	
  2761		ret = drm_atomic_commit(state);
  2762		if (ret == -EDEADLK) {
  2763			drm_atomic_state_clear(state);
  2764			ret = drm_modeset_backoff(&ctx);
  2765			if (!ret)
  2766				goto retry_conn_state;
  2767		}
  2768		KUNIT_ASSERT_EQ(test, ret, 0);
  2769	
  2770		KUNIT_EXPECT_LE(test, old_hdmi_update_failures, priv->hdmi_update_failures);
  2771	
  2772		new_conn_state = conn->state;
  2773		KUNIT_ASSERT_NOT_NULL(test, new_conn_state);
  2774	
  2775		KUNIT_ASSERT_EQ(test, new_conn_state->hdmi.output_bpc, 10);
  2776		KUNIT_ASSERT_EQ(test, new_conn_state->hdmi.infoframes.hdr_drm.set, true);
  2777	
  2778		drm_modeset_drop_locks(&ctx);
  2779		drm_modeset_acquire_fini(&ctx);
  2780	}
  2781	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
