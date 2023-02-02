Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CC0687E49
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 14:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590EC10E50C;
	Thu,  2 Feb 2023 13:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2D610E50E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675343316; x=1706879316;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=E7KEmjqkA0ZeZr3bz8rnRGZaOvQ7/getmN/0QWoPgd8=;
 b=HG9VAqKRLW57lfPWPrRuz3OCeW6nLerWWfPOeBPoVTTvJkOK+9IRqh/f
 8hV0qqnxwNmN9T50JI+o7SY6ffnp5akuXItdnZGQOPN10DX2sWOdhWCqv
 +3fjNAC5nngMo7CiaRfXQvOnO8NblXwp1yN67IkTcpZU5k20AIluD6p6+
 KIKVyxJB0UdU9PGHhny84CA9PCSR7PV7lyQWqWTUd2YJtpQaQLZsS94wM
 pJ7jqa22QENNgxHlGzr0+R0HlYukyZ4nHEki49ZSWOEdJdR6IIktL4FzA
 U3w1r7mw2+O0jlwcTPsRfhKw0dnkzGr5tHj87lS3U01TFfBCAKq3nIY4/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327090869"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="327090869"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 05:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728855726"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="728855726"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 05:08:31 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pNZKJ-0006WZ-0f;
 Thu, 02 Feb 2023 13:08:31 +0000
Date: Thu, 2 Feb 2023 21:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/client: Convert to VISIBLE_IF_KUNIT
Message-ID: <202302022027.LWmJQ4lL-lkp@intel.com>
References: <20230202110312.808607-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202110312.808607-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2-rc6 next-20230202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-client-Convert-to-VISIBLE_IF_KUNIT/20230202-190453
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230202110312.808607-1-maxime%40cerno.tech
patch subject: [PATCH] drm/client: Convert to VISIBLE_IF_KUNIT
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230202/202302022027.LWmJQ4lL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/dd1e4c34178f4049f33e639350a6ef66ae9b5fd3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-client-Convert-to-VISIBLE_IF_KUNIT/20230202-190453
        git checkout dd1e4c34178f4049f33e639350a6ef66ae9b5fd3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_client_modeset.c:166:1: warning: no previous prototype for 'drm_connector_pick_cmdline_mode' [-Wmissing-prototypes]
     166 | drm_connector_pick_cmdline_mode(struct drm_connector *connector)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_connector_pick_cmdline_mode +166 drivers/gpu/drm/drm_client_modeset.c

   164	
   165	VISIBLE_IF_KUNIT struct drm_display_mode *
 > 166	drm_connector_pick_cmdline_mode(struct drm_connector *connector)
   167	{
   168		struct drm_cmdline_mode *cmdline_mode;
   169		struct drm_display_mode *mode;
   170		bool prefer_non_interlace;
   171	
   172		/*
   173		 * Find a user-defined mode. If the user gave us a valid
   174		 * mode on the kernel command line, it will show up in this
   175		 * list.
   176		 */
   177	
   178		list_for_each_entry(mode, &connector->modes, head) {
   179			if (mode->type & DRM_MODE_TYPE_USERDEF)
   180				return mode;
   181		}
   182	
   183		cmdline_mode = &connector->cmdline_mode;
   184		if (cmdline_mode->specified == false)
   185			return NULL;
   186	
   187		/*
   188		 * Attempt to find a matching mode in the list of modes we
   189		 * have gotten so far.
   190		 */
   191	
   192		prefer_non_interlace = !cmdline_mode->interlace;
   193	again:
   194		list_for_each_entry(mode, &connector->modes, head) {
   195			/* check width/height */
   196			if (mode->hdisplay != cmdline_mode->xres ||
   197			    mode->vdisplay != cmdline_mode->yres)
   198				continue;
   199	
   200			if (cmdline_mode->refresh_specified) {
   201				if (drm_mode_vrefresh(mode) != cmdline_mode->refresh)
   202					continue;
   203			}
   204	
   205			if (cmdline_mode->interlace) {
   206				if (!(mode->flags & DRM_MODE_FLAG_INTERLACE))
   207					continue;
   208			} else if (prefer_non_interlace) {
   209				if (mode->flags & DRM_MODE_FLAG_INTERLACE)
   210					continue;
   211			}
   212			return mode;
   213		}
   214	
   215		if (prefer_non_interlace) {
   216			prefer_non_interlace = false;
   217			goto again;
   218		}
   219	
   220		return NULL;
   221	}
   222	EXPORT_SYMBOL_IF_KUNIT(drm_connector_pick_cmdline_mode);
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
