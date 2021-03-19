Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E96034205A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 15:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7696EA53;
	Fri, 19 Mar 2021 14:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E6989F55
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 14:59:13 +0000 (UTC)
IronPort-SDR: D1Xj2PtP7Kh79VAGXZGhUYqEwmI2d9XnyaQ03RGLYqQolFR/Ywa52PIl7yPQcBFUPr0mwC2gdw
 JSKzUkXzo42w==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="274978158"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
 d="gz'50?scan'50,208,50";a="274978158"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 07:59:13 -0700
IronPort-SDR: nwoPB2HSj8qIPX5RKt8gkn7+sM9x+hDFnRmwl2cvBShtI0FeAQa9MCQcCkeCu/98wCE6P1Rqty
 +r44+9ItOrag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
 d="gz'50?scan'50,208,50";a="523661971"
Received: from lkp-server02.sh.intel.com (HELO 1c294c63cb86) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 19 Mar 2021 07:59:09 -0700
Received: from kbuild by 1c294c63cb86 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lNGai-0001tf-Sj; Fri, 19 Mar 2021 14:59:08 +0000
Date: Fri, 19 Mar 2021 22:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/3] drm/connector: Add helper to compare HDR metadata
Message-ID: <202103192256.XHCS949m-lkp@intel.com>
References: <20210319124922.144726-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <20210319124922.144726-2-maxime@cerno.tech>
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
Cc: Phil Elwell <phil@raspberrypi.com>, kbuild-all@lists.01.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Maxime,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip linus/master v5.12-rc3 next-20210319]
[cannot apply to anholt/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maxime-Ripard/drm-connector-Create-a-helper-to-attach-the-hdr_output_metadata-property/20210319-205157
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: sparc64-randconfig-r035-20210318 (attached as .config)
compiler: sparc64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e12a697958cd6235d678394450f4cb7dbf958ed5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-connector-Create-a-helper-to-attach-the-hdr_output_metadata-property/20210319-205157
        git checkout e12a697958cd6235d678394450f4cb7dbf958ed5
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=sparc64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_commit_cursors':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7678:44: warning: variable 'new_plane_state' set but not used [-Wunused-but-set-variable]
    7678 |  struct drm_plane_state *old_plane_state, *new_plane_state;
         |                                            ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_atomic_commit_tail':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8327:4: error: implicit declaration of function 'is_hdr_metadata_different' [-Werror=implicit-function-declaration]
    8327 |    is_hdr_metadata_different(old_con_state, new_con_state);
         |    ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FRAME_POINTER
   Depends on DEBUG_KERNEL && (M68K || UML || SUPERH) || ARCH_WANT_FRAME_POINTERS || MCOUNT
   Selected by
   - LATENCYTOP && DEBUG_KERNEL && STACKTRACE_SUPPORT && PROC_FS && !MIPS && !PPC && !S390 && !MICROBLAZE && !ARM && !ARC && !X86
   - LOCKDEP && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT && !MIPS && !PPC && !ARM && !S390 && !MICROBLAZE && !ARC && !X86


vim +/is_hdr_metadata_different +8327 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

e7b07ceef2a650 Harry Wentland      2017-08-10  8293  
02d6a6fcdf68c4 David Francis       2018-12-18  8294  	/* Handle connector state changes */
c2cea7063b85fc Leo (Sunpeng  Li    2017-10-12  8295) 	for_each_oldnew_connector_in_state(state, connector, old_con_state, new_con_state, i) {
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8296) 		struct dm_connector_state *dm_new_con_state = to_dm_connector_state(new_con_state);
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8297) 		struct dm_connector_state *dm_old_con_state = to_dm_connector_state(old_con_state);
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8298) 		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(dm_new_con_state->base.crtc);
efc8278eecfd5e Anson Jacob         2021-02-18  8299  		struct dc_surface_update dummy_updates[MAX_SURFACES];
19afd79951e630 Nathan Chancellor   2019-02-01  8300  		struct dc_stream_update stream_update;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8301  		struct dc_info_packet hdr_packet;
e7b07ceef2a650 Harry Wentland      2017-08-10  8302  		struct dc_stream_status *status = NULL;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8303  		bool abm_changed, hdr_changed, scaling_changed;
e7b07ceef2a650 Harry Wentland      2017-08-10  8304  
efc8278eecfd5e Anson Jacob         2021-02-18  8305  		memset(&dummy_updates, 0, sizeof(dummy_updates));
19afd79951e630 Nathan Chancellor   2019-02-01  8306  		memset(&stream_update, 0, sizeof(stream_update));
19afd79951e630 Nathan Chancellor   2019-02-01  8307  
44d09c6a577c8e Harry Wentland      2018-03-15  8308  		if (acrtc) {
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8309) 			new_crtc_state = drm_atomic_get_new_crtc_state(state, &acrtc->base);
44d09c6a577c8e Harry Wentland      2018-03-15  8310  			old_crtc_state = drm_atomic_get_old_crtc_state(state, &acrtc->base);
44d09c6a577c8e Harry Wentland      2018-03-15  8311  		}
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8312) 
e7b07ceef2a650 Harry Wentland      2017-08-10  8313  		/* Skip any modesets/resets */
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8314) 		if (!acrtc || drm_atomic_crtc_needs_modeset(new_crtc_state))
e7b07ceef2a650 Harry Wentland      2017-08-10  8315  			continue;
e7b07ceef2a650 Harry Wentland      2017-08-10  8316  
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8317) 		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
c1ee92f94ce3b9 David Francis       2018-11-26  8318  		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
c1ee92f94ce3b9 David Francis       2018-11-26  8319  
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8320  		scaling_changed = is_scaling_state_different(dm_new_con_state,
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8321  							     dm_old_con_state);
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8322  
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8323  		abm_changed = dm_new_crtc_state->abm_level !=
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8324  			      dm_old_crtc_state->abm_level;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8325  
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8326  		hdr_changed =
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28 @8327  			is_hdr_metadata_different(old_con_state, new_con_state);
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8328  
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8329  		if (!scaling_changed && !abm_changed && !hdr_changed)
c1ee92f94ce3b9 David Francis       2018-11-26  8330  			continue;
e7b07ceef2a650 Harry Wentland      2017-08-10  8331  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  8332  		stream_update.stream = dm_new_crtc_state->stream;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8333  		if (scaling_changed) {
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8334) 			update_stream_scaling_settings(&dm_new_con_state->base.crtc->mode,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  8335  					dm_new_con_state, dm_new_crtc_state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8336  
02d6a6fcdf68c4 David Francis       2018-12-18  8337  			stream_update.src = dm_new_crtc_state->stream->src;
02d6a6fcdf68c4 David Francis       2018-12-18  8338  			stream_update.dst = dm_new_crtc_state->stream->dst;
02d6a6fcdf68c4 David Francis       2018-12-18  8339  		}
02d6a6fcdf68c4 David Francis       2018-12-18  8340  
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8341  		if (abm_changed) {
02d6a6fcdf68c4 David Francis       2018-12-18  8342  			dm_new_crtc_state->stream->abm_level = dm_new_crtc_state->abm_level;
02d6a6fcdf68c4 David Francis       2018-12-18  8343  
02d6a6fcdf68c4 David Francis       2018-12-18  8344  			stream_update.abm_level = &dm_new_crtc_state->abm_level;
02d6a6fcdf68c4 David Francis       2018-12-18  8345  		}
70e8ffc55b98f3 Harry Wentland      2017-11-10  8346  
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8347  		if (hdr_changed) {
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8348  			fill_hdr_info_packet(new_con_state, &hdr_packet);
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8349  			stream_update.hdr_static_metadata = &hdr_packet;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8350  		}
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8351  
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8352) 		status = dc_stream_get_status(dm_new_crtc_state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8353  		WARN_ON(!status);
3be5262e353b8a Harry Wentland      2017-07-27  8354  		WARN_ON(!status->plane_count);
e7b07ceef2a650 Harry Wentland      2017-08-10  8355  
02d6a6fcdf68c4 David Francis       2018-12-18  8356  		/*
02d6a6fcdf68c4 David Francis       2018-12-18  8357  		 * TODO: DC refuses to perform stream updates without a dc_surface_update.
02d6a6fcdf68c4 David Francis       2018-12-18  8358  		 * Here we create an empty update on each plane.
02d6a6fcdf68c4 David Francis       2018-12-18  8359  		 * To fix this, DC should permit updating only stream properties.
02d6a6fcdf68c4 David Francis       2018-12-18  8360  		 */
02d6a6fcdf68c4 David Francis       2018-12-18  8361  		for (j = 0; j < status->plane_count; j++)
efc8278eecfd5e Anson Jacob         2021-02-18  8362  			dummy_updates[j].surface = status->plane_states[0];
98e6436d3af5fe Anthony Koo         2018-08-21  8363  
02d6a6fcdf68c4 David Francis       2018-12-18  8364  
02d6a6fcdf68c4 David Francis       2018-12-18  8365  		mutex_lock(&dm->dc_lock);
02d6a6fcdf68c4 David Francis       2018-12-18  8366  		dc_commit_updates_for_stream(dm->dc,
efc8278eecfd5e Anson Jacob         2021-02-18  8367  						     dummy_updates,
3be5262e353b8a Harry Wentland      2017-07-27  8368  						     status->plane_count,
02d6a6fcdf68c4 David Francis       2018-12-18  8369  						     dm_new_crtc_state->stream,
efc8278eecfd5e Anson Jacob         2021-02-18  8370  						     &stream_update,
efc8278eecfd5e Anson Jacob         2021-02-18  8371  						     dc_state);
02d6a6fcdf68c4 David Francis       2018-12-18  8372  		mutex_unlock(&dm->dc_lock);
e7b07ceef2a650 Harry Wentland      2017-08-10  8373  	}
e7b07ceef2a650 Harry Wentland      2017-08-10  8374  
b5e83f6fe1f003 Nicholas Kazlauskas 2019-04-08  8375  	/* Count number of newly disabled CRTCs for dropping PM refs later. */
e1fc2dca1295c4 Leo (Sunpeng  Li    2017-10-18  8376) 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
e1fc2dca1295c4 Leo (Sunpeng  Li    2017-10-18  8377) 				      new_crtc_state, i) {
fe2a19652918a5 Lyude Paul          2018-06-21  8378  		if (old_crtc_state->active && !new_crtc_state->active)
fe2a19652918a5 Lyude Paul          2018-06-21  8379  			crtc_disable_count++;
fe2a19652918a5 Lyude Paul          2018-06-21  8380  
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8381) 		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
e1fc2dca1295c4 Leo (Sunpeng  Li    2017-10-18  8382) 		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
66b0c973d7f74e Mario Kleiner       2019-03-29  8383  
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8384  		/* For freesync config update on crtc state and params for irq */
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8385  		update_stream_irq_parameters(dm, dm_new_crtc_state);
057be086603feb Nicholas Kazlauskas 2019-04-15  8386  
66b0c973d7f74e Mario Kleiner       2019-03-29  8387  		/* Handle vrr on->off / off->on transitions */
66b0c973d7f74e Mario Kleiner       2019-03-29  8388  		amdgpu_dm_handle_vrr_transition(dm_old_crtc_state,
66b0c973d7f74e Mario Kleiner       2019-03-29  8389  						dm_new_crtc_state);
e7b07ceef2a650 Harry Wentland      2017-08-10  8390  	}
e7b07ceef2a650 Harry Wentland      2017-08-10  8391  
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8392  	/**
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8393  	 * Enable interrupts for CRTCs that are newly enabled or went through
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8394  	 * a modeset. It was intentionally deferred until after the front end
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8395  	 * state was modified to wait until the OTG was on and so the IRQ
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8396  	 * handlers didn't access stale or invalid state.
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8397  	 */
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8398  	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8399  		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8400  
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8401  		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8402  
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8403  		if (new_crtc_state->active &&
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8404  		    (!old_crtc_state->active ||
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8405  		     drm_atomic_crtc_needs_modeset(new_crtc_state))) {
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8406  			dc_stream_retain(dm_new_crtc_state->stream);
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8407  			acrtc->dm_irq_params.stream = dm_new_crtc_state->stream;
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8408  			manage_dm_interrupts(adev, acrtc, true);
e2881d6d0a2653 Rodrigo Siqueira    2021-01-07  8409  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--KsGdsel6WgEHnImy
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
Vi8y0yC63hiv/wVkHXD7tpoBAA==

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--KsGdsel6WgEHnImy--
