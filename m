Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9633D59B721
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 03:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEC09569E;
	Mon, 22 Aug 2022 01:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C6995682
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 01:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661130086; x=1692666086;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rcLAfYveKjekrN3OoWwxfGGPDMgntbBUAmloRI7H7o4=;
 b=lacygnuNFs9NOFkIXkmoYAZtlcL1JG/pk1LB/m+P8uqi1AQ2ZNR5aTzm
 /c55JONtMzW45Ui8e+H1nR+cdPuBqhg+cUlFJMf45hpf5dYNZtvkeGda5
 oMR1SVPs+e5By5ig4FRytWsay3B8G5RYgIFTL9upMh2pwwRyX1yF41yyG
 GL2EbFkNs3i+J6BYdPoCh9wXIrTwBFHN9v/taih8DXCkWkcucmPPMlZnZ
 wzumeGteVaoQ9V51uBwbFx6Vz1aYRg5lxjpIgN8UC5/2yZHnlbEc/rAOe
 Z3GAt3Sn/oBcQFYwq6CvFpsgeBiTHB48ByUBYl+Nf2Q6WsIO72iEnBSs2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="273683028"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; d="scan'208";a="273683028"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2022 18:01:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; d="scan'208";a="854308334"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 21 Aug 2022 18:01:22 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oPvof-0004kp-36;
 Mon, 22 Aug 2022 01:01:21 +0000
Date: Mon, 22 Aug 2022 09:00:43 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 sam@ravnborg.org, noralf@tronnes.org, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, emma@anholt.net,
 kamlesh.gurudasani@gmail.com, david@lechnology.com
Subject: Re: [PATCH v2 3/4] drm/modes: Add initializer macro DRM_MODE_INIT()
Message-ID: <202208220805.cedg9zzu-lkp@intel.com>
References: <20220816134853.12468-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816134853.12468-4-tzimmermann@suse.de>
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
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20220819]
[cannot apply to linus/master v6.0-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-probe-helper-modes-Helpers-for-single-mode-displays/20220816-215250
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/25770aac56aeff6f55419ea4316406ddbb29385f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-probe-helper-modes-Helpers-for-single-mode-displays/20220816-215250
        git checkout 25770aac56aeff6f55419ea4316406ddbb29385f
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> ./include/drm/drm_modes.h:168: warning: expecting prototype for DRM_SIMPLE_MODE_INIT(). Prototype was for DRM_MODE_INIT() instead

vim +168 ./include/drm/drm_modes.h

   133	
   134	#define DRM_MODE(nm, t, c, hd, hss, hse, ht, hsk, vd, vss, vse, vt, vs, f) \
   135		.name = nm, .status = 0, .type = (t), .clock = (c), \
   136		.hdisplay = (hd), .hsync_start = (hss), .hsync_end = (hse), \
   137		.htotal = (ht), .hskew = (hsk), .vdisplay = (vd), \
   138		.vsync_start = (vss), .vsync_end = (vse), .vtotal = (vt), \
   139		.vscan = (vs), .flags = (f)
   140	
   141	/**
   142	 * DRM_MODE_RES_MM - Calculates the display size from resolution and DPI
   143	 * @res: The resolution in pixel
   144	 * @dpi: The number of dots per inch
   145	 */
   146	#define DRM_MODE_RES_MM(res, dpi)	\
   147		(((res) * 254ul) / ((dpi) * 10ul))
   148	
   149	#define __DRM_MODE_INIT(pix, hd, vd, hd_mm, vd_mm) \
   150		.type = DRM_MODE_TYPE_DRIVER, .clock = (pix), \
   151		.hdisplay = (hd), .hsync_start = (hd), .hsync_end = (hd), \
   152		.htotal = (hd), .vdisplay = (vd), .vsync_start = (vd), \
   153		.vsync_end = (vd), .vtotal = (vd), .width_mm = (hd_mm), \
   154		.height_mm = (vd_mm)
   155	
   156	/**
   157	 * DRM_SIMPLE_MODE_INIT - Initialize display mode
   158	 * @hz: Vertical refresh rate in Hertz
   159	 * @hd: Horizontal resolution, width
   160	 * @vd: Vertical resolution, height
   161	 * @hd_mm: Display width in millimeters
   162	 * @vd_mm: Display height in millimeters
   163	 *
   164	 * This macro initializes a &drm_display_mode that contains information about
   165	 * refresh rate, resolution and physical size.
   166	 */
   167	#define DRM_MODE_INIT(hz, hd, vd, hd_mm, vd_mm) \
 > 168		__DRM_MODE_INIT((hd) * (vd) * (hz) / 1000 /* kHz */, hd, vd, hd_mm, vd_mm)
   169	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
