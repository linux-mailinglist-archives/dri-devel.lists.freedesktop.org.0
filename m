Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3061B4A6FC3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 12:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8213D10E88F;
	Wed,  2 Feb 2022 11:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996D710E88F;
 Wed,  2 Feb 2022 11:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643800676; x=1675336676;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vvXAkb3ysmeoOWuq9046kSjfQmk9RzSQkb5/OkkpTbU=;
 b=G2gsPaGdAUQGYLwY6a6flQCHzEbG0EIOOAEBUVTiHNZlUB89GM3ICztg
 vMoaR3HtZAoX3I5LWX/z0tEoEGSSIS0SJZfIBxcss0C40AE8NDqIfY+Uu
 u00gpkE9314NjHwIz/w0vhsmoFokhQ/yLAq1Wz15gyyjqiWewxfw+dhMN
 FfncebIHrxPB6gtcsoewVHUst2vbZvkh814+OVYPzNcfGzdFSajdJKxXS
 BmVV2IA+py1JMOhH+aIDEsrTk0K7uBhqJFjgdQ3kfqsZwYWjJyKHIH1ih
 u7ojIW43Nvv857NzLi4TABbOb0PYIML78Aa0dSX/JawQ/1Sxy28jvpyuq Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="245489905"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="245489905"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 03:17:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="599522967"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2022 03:17:53 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nFDe5-000UVB-3Z; Wed, 02 Feb 2022 11:17:53 +0000
Date: Wed, 2 Feb 2022 19:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kandpal Suraj <suraj.kandpal@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/6] drm: add writeback pointers to
 drm_connector
Message-ID: <202202021914.BKeUA6Fh-lkp@intel.com>
References: <20220202085429.22261-2-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220202085429.22261-2-suraj.kandpal@intel.com>
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
Cc: kbuild-all@lists.01.org, carsten.haitzler@arm.com, jani.nikula@intel.com,
 quic_abhinavk@quicinc.com, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kandpal,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-tip/drm-tip v5.17-rc2 next-20220202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kandpal-Suraj/drm-writeback-connector-changes/20220202-164832
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20220202/202202021914.BKeUA6Fh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/57ad56d769873f62f87fe432243030ceb1678f87
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kandpal-Suraj/drm-writeback-connector-changes/20220202-164832
        git checkout 57ad56d769873f62f87fe432243030ceb1678f87
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash drivers/gpu/drm/arm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-review/Kandpal-Suraj/drm-writeback-connector-changes/20220202-164832 HEAD 75bbd0a8b1fb58f702279bfbc2fe2d74db8f7028 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/arm/malidp_crtc.c: In function 'malidp_crtc_atomic_check':
>> drivers/gpu/drm/arm/malidp_crtc.c:427:47: error: passing argument 1 of 'drm_connector_index' from incompatible pointer type [-Werror=incompatible-pointer-types]
     427 |                     (1 << drm_connector_index(&malidp->mw_connector.base)))
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                               |
         |                                               struct drm_connector **
   In file included from include/drm/drm_modes.h:33,
                    from include/drm/drm_crtc.h:40,
                    from include/drm/drm_atomic.h:31,
                    from drivers/gpu/drm/arm/malidp_crtc.c:14:
   include/drm/drm_connector.h:1679:76: note: expected 'const struct drm_connector *' but argument is of type 'struct drm_connector **'
    1679 | static inline unsigned int drm_connector_index(const struct drm_connector *connector)
         |                                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/arm/malidp_mw.c: In function 'malidp_mw_connector_init':
>> drivers/gpu/drm/arm/malidp_mw.c:215:37: error: 'malidp->mw_connector.encoder' is a pointer; did you mean to use '->'?
     215 |         malidp->mw_connector.encoder.possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
         |                                     ^
         |                                     ->
>> drivers/gpu/drm/arm/malidp_mw.c:216:34: error: passing argument 1 of 'drm_connector_helper_add' from incompatible pointer type [-Werror=incompatible-pointer-types]
     216 |         drm_connector_helper_add(&malidp->mw_connector.base,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  |
         |                                  struct drm_connector **
   In file included from include/drm/drm_atomic_helper.h:32,
                    from drivers/gpu/drm/arm/malidp_mw.c:10:
   include/drm/drm_modeset_helper_vtables.h:1153:67: note: expected 'struct drm_connector *' but argument is of type 'struct drm_connector **'
    1153 | static inline void drm_connector_helper_add(struct drm_connector *connector,
         |                                             ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   drivers/gpu/drm/arm/malidp_mw.c: In function 'malidp_mw_atomic_commit':
>> drivers/gpu/drm/arm/malidp_mw.c:239:63: error: 'mw_conn->base' is a pointer; did you mean to use '->'?
     239 |         struct drm_connector_state *conn_state = mw_conn->base.state;
         |                                                               ^
         |                                                               ->
   cc1: some warnings being treated as errors


vim +/drm_connector_index +427 drivers/gpu/drm/arm/malidp_crtc.c

28ce675b74742c Mihail Atanassov 2017-02-13  338  
ad49f8602fe889 Liviu Dudau      2016-03-07  339  static int malidp_crtc_atomic_check(struct drm_crtc *crtc,
29b77ad7b9ca8c Maxime Ripard    2020-10-28  340  				    struct drm_atomic_state *state)
ad49f8602fe889 Liviu Dudau      2016-03-07  341  {
29b77ad7b9ca8c Maxime Ripard    2020-10-28  342  	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
29b77ad7b9ca8c Maxime Ripard    2020-10-28  343  									  crtc);
ad49f8602fe889 Liviu Dudau      2016-03-07  344  	struct malidp_drm *malidp = crtc_to_malidp_device(crtc);
ad49f8602fe889 Liviu Dudau      2016-03-07  345  	struct malidp_hw_device *hwdev = malidp->dev;
ad49f8602fe889 Liviu Dudau      2016-03-07  346  	struct drm_plane *plane;
ad49f8602fe889 Liviu Dudau      2016-03-07  347  	const struct drm_plane_state *pstate;
ad49f8602fe889 Liviu Dudau      2016-03-07  348  	u32 rot_mem_free, rot_mem_usable;
ad49f8602fe889 Liviu Dudau      2016-03-07  349  	int rotated_planes = 0;
6954f24588ebdd Mihail Atanassov 2017-02-13  350  	int ret;
ad49f8602fe889 Liviu Dudau      2016-03-07  351  
ad49f8602fe889 Liviu Dudau      2016-03-07  352  	/*
ad49f8602fe889 Liviu Dudau      2016-03-07  353  	 * check if there is enough rotation memory available for planes
66da13a519b331 Liviu Dudau      2018-10-02  354  	 * that need 90° and 270° rotion or planes that are compressed.
66da13a519b331 Liviu Dudau      2018-10-02  355  	 * Each plane has set its required memory size in the ->plane_check()
66da13a519b331 Liviu Dudau      2018-10-02  356  	 * callback, here we only make sure that the sums are less that the
66da13a519b331 Liviu Dudau      2018-10-02  357  	 * total usable memory.
ad49f8602fe889 Liviu Dudau      2016-03-07  358  	 *
ad49f8602fe889 Liviu Dudau      2016-03-07  359  	 * The rotation memory allocation algorithm (for each plane):
66da13a519b331 Liviu Dudau      2018-10-02  360  	 *  a. If no more rotated or compressed planes exist, all remaining
66da13a519b331 Liviu Dudau      2018-10-02  361  	 *     rotate memory in the bank is available for use by the plane.
66da13a519b331 Liviu Dudau      2018-10-02  362  	 *  b. If other rotated or compressed planes exist, and plane's
66da13a519b331 Liviu Dudau      2018-10-02  363  	 *     layer ID is DE_VIDEO1, it can use all the memory from first bank
66da13a519b331 Liviu Dudau      2018-10-02  364  	 *     if secondary rotation memory bank is available, otherwise it can
ad49f8602fe889 Liviu Dudau      2016-03-07  365  	 *     use up to half the bank's memory.
66da13a519b331 Liviu Dudau      2018-10-02  366  	 *  c. If other rotated or compressed planes exist, and plane's layer ID
66da13a519b331 Liviu Dudau      2018-10-02  367  	 *     is not DE_VIDEO1, it can use half of the available memory.
ad49f8602fe889 Liviu Dudau      2016-03-07  368  	 *
ad49f8602fe889 Liviu Dudau      2016-03-07  369  	 * Note: this algorithm assumes that the order in which the planes are
ad49f8602fe889 Liviu Dudau      2016-03-07  370  	 * checked always has DE_VIDEO1 plane first in the list if it is
ad49f8602fe889 Liviu Dudau      2016-03-07  371  	 * rotated. Because that is how we create the planes in the first
ad49f8602fe889 Liviu Dudau      2016-03-07  372  	 * place, under current DRM version things work, but if ever the order
ad49f8602fe889 Liviu Dudau      2016-03-07  373  	 * in which drm_atomic_crtc_state_for_each_plane() iterates over planes
ad49f8602fe889 Liviu Dudau      2016-03-07  374  	 * changes, we need to pre-sort the planes before validation.
ad49f8602fe889 Liviu Dudau      2016-03-07  375  	 */
ad49f8602fe889 Liviu Dudau      2016-03-07  376  
ad49f8602fe889 Liviu Dudau      2016-03-07  377  	/* first count the number of rotated planes */
29b77ad7b9ca8c Maxime Ripard    2020-10-28  378  	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
66da13a519b331 Liviu Dudau      2018-10-02  379  		struct drm_framebuffer *fb = pstate->fb;
66da13a519b331 Liviu Dudau      2018-10-02  380  
66da13a519b331 Liviu Dudau      2018-10-02  381  		if ((pstate->rotation & MALIDP_ROTATED_MASK) || fb->modifier)
ad49f8602fe889 Liviu Dudau      2016-03-07  382  			rotated_planes++;
ad49f8602fe889 Liviu Dudau      2016-03-07  383  	}
ad49f8602fe889 Liviu Dudau      2016-03-07  384  
ad49f8602fe889 Liviu Dudau      2016-03-07  385  	rot_mem_free = hwdev->rotation_memory[0];
ad49f8602fe889 Liviu Dudau      2016-03-07  386  	/*
ad49f8602fe889 Liviu Dudau      2016-03-07  387  	 * if we have more than 1 plane using rotation memory, use the second
ad49f8602fe889 Liviu Dudau      2016-03-07  388  	 * block of rotation memory as well
ad49f8602fe889 Liviu Dudau      2016-03-07  389  	 */
ad49f8602fe889 Liviu Dudau      2016-03-07  390  	if (rotated_planes > 1)
ad49f8602fe889 Liviu Dudau      2016-03-07  391  		rot_mem_free += hwdev->rotation_memory[1];
ad49f8602fe889 Liviu Dudau      2016-03-07  392  
ad49f8602fe889 Liviu Dudau      2016-03-07  393  	/* now validate the rotation memory requirements */
29b77ad7b9ca8c Maxime Ripard    2020-10-28  394  	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
ad49f8602fe889 Liviu Dudau      2016-03-07  395  		struct malidp_plane *mp = to_malidp_plane(plane);
ad49f8602fe889 Liviu Dudau      2016-03-07  396  		struct malidp_plane_state *ms = to_malidp_plane_state(pstate);
66da13a519b331 Liviu Dudau      2018-10-02  397  		struct drm_framebuffer *fb = pstate->fb;
ad49f8602fe889 Liviu Dudau      2016-03-07  398  
66da13a519b331 Liviu Dudau      2018-10-02  399  		if ((pstate->rotation & MALIDP_ROTATED_MASK) || fb->modifier) {
ad49f8602fe889 Liviu Dudau      2016-03-07  400  			/* process current plane */
ad49f8602fe889 Liviu Dudau      2016-03-07  401  			rotated_planes--;
ad49f8602fe889 Liviu Dudau      2016-03-07  402  
ad49f8602fe889 Liviu Dudau      2016-03-07  403  			if (!rotated_planes) {
ad49f8602fe889 Liviu Dudau      2016-03-07  404  				/* no more rotated planes, we can use what's left */
ad49f8602fe889 Liviu Dudau      2016-03-07  405  				rot_mem_usable = rot_mem_free;
ad49f8602fe889 Liviu Dudau      2016-03-07  406  			} else {
ad49f8602fe889 Liviu Dudau      2016-03-07  407  				if ((mp->layer->id != DE_VIDEO1) ||
ad49f8602fe889 Liviu Dudau      2016-03-07  408  				    (hwdev->rotation_memory[1] == 0))
ad49f8602fe889 Liviu Dudau      2016-03-07  409  					rot_mem_usable = rot_mem_free / 2;
ad49f8602fe889 Liviu Dudau      2016-03-07  410  				else
ad49f8602fe889 Liviu Dudau      2016-03-07  411  					rot_mem_usable = hwdev->rotation_memory[0];
ad49f8602fe889 Liviu Dudau      2016-03-07  412  			}
ad49f8602fe889 Liviu Dudau      2016-03-07  413  
ad49f8602fe889 Liviu Dudau      2016-03-07  414  			rot_mem_free -= rot_mem_usable;
ad49f8602fe889 Liviu Dudau      2016-03-07  415  
ad49f8602fe889 Liviu Dudau      2016-03-07  416  			if (ms->rotmem_size > rot_mem_usable)
ad49f8602fe889 Liviu Dudau      2016-03-07  417  				return -EINVAL;
ad49f8602fe889 Liviu Dudau      2016-03-07  418  		}
ad49f8602fe889 Liviu Dudau      2016-03-07  419  	}
ad49f8602fe889 Liviu Dudau      2016-03-07  420  
8cbc5caf36ef7a Brian Starkey    2017-11-02  421  	/* If only the writeback routing has changed, we don't need a modeset */
29b77ad7b9ca8c Maxime Ripard    2020-10-28  422  	if (crtc_state->connectors_changed) {
8cbc5caf36ef7a Brian Starkey    2017-11-02  423  		u32 old_mask = crtc->state->connector_mask;
29b77ad7b9ca8c Maxime Ripard    2020-10-28  424  		u32 new_mask = crtc_state->connector_mask;
8cbc5caf36ef7a Brian Starkey    2017-11-02  425  
8cbc5caf36ef7a Brian Starkey    2017-11-02  426  		if ((old_mask ^ new_mask) ==
8cbc5caf36ef7a Brian Starkey    2017-11-02 @427  		    (1 << drm_connector_index(&malidp->mw_connector.base)))
29b77ad7b9ca8c Maxime Ripard    2020-10-28  428  			crtc_state->connectors_changed = false;
8cbc5caf36ef7a Brian Starkey    2017-11-02  429  	}
8cbc5caf36ef7a Brian Starkey    2017-11-02  430  
29b77ad7b9ca8c Maxime Ripard    2020-10-28  431  	ret = malidp_crtc_atomic_check_gamma(crtc, crtc_state);
29b77ad7b9ca8c Maxime Ripard    2020-10-28  432  	ret = ret ? ret : malidp_crtc_atomic_check_ctm(crtc, crtc_state);
29b77ad7b9ca8c Maxime Ripard    2020-10-28  433  	ret = ret ? ret : malidp_crtc_atomic_check_scaling(crtc, crtc_state);
6954f24588ebdd Mihail Atanassov 2017-02-13  434  
6954f24588ebdd Mihail Atanassov 2017-02-13  435  	return ret;
ad49f8602fe889 Liviu Dudau      2016-03-07  436  }
ad49f8602fe889 Liviu Dudau      2016-03-07  437  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
