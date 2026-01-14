Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C4AD2184A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 23:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA8A10E26D;
	Wed, 14 Jan 2026 22:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kCocuh3L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BE110E69A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 22:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768428809; x=1799964809;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mNmuOjx6q/Cryn9pY8n4bZQdzwXbQVjuQJum73s9y/k=;
 b=kCocuh3LhsjRpz8Nw63L6WSRidXa09ywHNTzBFzQVTfCG0H/u4sHIt5S
 kyELzlXzLVxqmJXltZ5Vbu7tSY085ZU4lyCbFatKyyrk2WXhgTcUUqnbR
 WEU4swbyEsYITY4g5zaCAONwrQEwOBdfO8mFqaCfiPDjHBKOYieFEGxyM
 YBa6eenqgtRflyrIzh3mnSVPsAsidfkblrcHL6k6ci5QkCAKspakj4hmo
 cQcXK21pjKic4it7Ib7NBCYnx7dJbgZt7oJ/cHuOcXGWrWTYIFESE2m9B
 U5DLhr1fFPT9vxNhmcVes2/ICA/5elYIbgSJHXf9i3Vu6zDsKA8/UB9l1 Q==;
X-CSE-ConnectionGUID: MJqthxo7RF+B8fTuxe+fNg==
X-CSE-MsgGUID: PmObvN7xTtyOdxnWPyxHiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="95216283"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="95216283"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 14:13:29 -0800
X-CSE-ConnectionGUID: /mS1GwKTTjqS9jX2YLBFzQ==
X-CSE-MsgGUID: nuwN31E+RX67z5jUmg/pAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="236042826"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 14 Jan 2026 14:13:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vg97D-00000000H7E-29VX;
 Wed, 14 Jan 2026 22:13:23 +0000
Date: Thu, 15 Jan 2026 06:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 8/8] drm/sysfb: corebootdrm: Add DRM driver for coreboot
 framebuffers
Message-ID: <202601150622.i0pTAj9w-lkp@intel.com>
References: <20260108145058.56943-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108145058.56943-9-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on chrome-platform/for-next]
[also build test ERROR on drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master chrome-platform/for-firmware-next v6.19-rc5 next-20260114]
[cannot apply to drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/firmware-google-Do-sysfb-test-before-creating-coreboot-framebuffer/20260108-225542
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
patch link:    https://lore.kernel.org/r/20260108145058.56943-9-tzimmermann%40suse.de
patch subject: [PATCH 8/8] drm/sysfb: corebootdrm: Add DRM driver for coreboot framebuffers
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260115/202601150622.i0pTAj9w-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150622.i0pTAj9w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150622.i0pTAj9w-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/sysfb/corebootdrm.c:225:8: error: call to undeclared function 'devm_aperture_acquire_for_coreboot_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     225 |         ret = devm_aperture_acquire_for_coreboot_device(cbdev, fb_pgbase, fb_pgsize);
         |               ^
   drivers/gpu/drm/sysfb/corebootdrm.c:225:8: note: did you mean 'devm_aperture_acquire_for_platform_device'?
   include/linux/aperture.h:19:5: note: 'devm_aperture_acquire_for_platform_device' declared here
      19 | int devm_aperture_acquire_for_platform_device(struct platform_device *pdev,
         |     ^
   1 error generated.


vim +/devm_aperture_acquire_for_coreboot_device +225 drivers/gpu/drm/sysfb/corebootdrm.c

   162	
   163	/*
   164	 * Init / Cleanup
   165	 */
   166	
   167	static int corebootdrm_device_init(struct corebootdrm_device *cdev, struct coreboot_device *cbdev)
   168	{
   169		const struct lb_framebuffer *fb = &cbdev->framebuffer;
   170		struct drm_sysfb_device *sysfb = &cdev->sysfb;
   171		struct drm_device *dev = &sysfb->dev;
   172		const struct drm_format_info *format;
   173		int width, height, pitch;
   174		u64 address;
   175		int width_mm = 0, height_mm = 0;
   176		resource_size_t fb_size, fb_base, fb_pgbase, fb_pgsize;
   177		struct resource *res, *mem = NULL;
   178		void __iomem *screen_base;
   179		struct drm_plane *primary_plane;
   180		struct drm_crtc *crtc;
   181		struct drm_encoder *encoder;
   182		struct drm_connector *connector;
   183		unsigned long max_width, max_height;
   184		size_t nformats;
   185		int ret;
   186	
   187		/*
   188		 * Hardware settings
   189		 */
   190	
   191		format = corebootdrm_get_format_fb(dev, fb);
   192		if (!format)
   193			return -EINVAL;
   194		width = corebootdrm_get_width_fb(dev, fb);
   195		if (width < 0)
   196			return width;
   197		height = corebootdrm_get_height_fb(dev, fb);
   198		if (height < 0)
   199			return height;
   200		pitch = corebootdrm_get_pitch_fb(dev, format, width, fb);
   201		if (pitch < 0)
   202			return pitch;
   203		address = corebootdrm_get_address_fb(dev, height, pitch, fb);
   204		if (!address)
   205			return -EINVAL;
   206	
   207		sysfb->fb_mode = drm_sysfb_mode(width, height, width_mm, height_mm);
   208		sysfb->fb_format = format;
   209		sysfb->fb_pitch = pitch;
   210	
   211		drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sysfb->fb_mode));
   212		drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, pitch=%d byte\n",
   213			&format->format, width, height, pitch);
   214	
   215		/*
   216		 * Memory management
   217		 */
   218	
   219		fb_base = address;
   220		fb_size = pitch * height;
   221	
   222		fb_pgbase = round_down(fb_base, PAGE_SIZE);
   223		fb_pgsize = fb_base - fb_pgbase + round_up(fb_size, PAGE_SIZE);
   224	
 > 225		ret = devm_aperture_acquire_for_coreboot_device(cbdev, fb_pgbase, fb_pgsize);
   226		if (ret) {
   227			drm_err(dev, "could not acquire memory range %pr: %d\n", res, ret);
   228			return ret;
   229		}
   230	
   231		drm_dbg(dev, "using I/O memory framebuffer at %pr\n", res);
   232	
   233		mem = devm_request_mem_region(&cbdev->dev, fb_pgbase, fb_pgsize, dev_name(&cbdev->dev));
   234		if (!mem) {
   235			/*
   236			 * We cannot make this fatal. Sometimes this comes from magic
   237			 * spaces our resource handlers simply don't know about. Use
   238			 * the I/O-memory resource as-is and try to map that instead.
   239			 */
   240			drm_warn(dev, "could not acquire memory region %pr\n", res);
   241			mem = res;
   242		}
   243	
   244		screen_base = devm_ioremap_wc(&cbdev->dev, fb_pgbase, fb_pgsize);
   245		if (!screen_base)
   246			return -ENOMEM;
   247	
   248		iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
   249	
   250		/*
   251		 * Modesetting
   252		 */
   253	
   254		ret = drmm_mode_config_init(dev);
   255		if (ret)
   256			return ret;
   257	
   258		max_width = max_t(unsigned long, width, DRM_SHADOW_PLANE_MAX_WIDTH);
   259		max_height = max_t(unsigned long, height, DRM_SHADOW_PLANE_MAX_HEIGHT);
   260	
   261		dev->mode_config.min_width = width;
   262		dev->mode_config.max_width = max_width;
   263		dev->mode_config.min_height = height;
   264		dev->mode_config.max_height = max_height;
   265		dev->mode_config.preferred_depth = format->depth;
   266		dev->mode_config.funcs = &corebootdrm_mode_config_funcs;
   267	
   268		/* Primary plane */
   269	
   270		nformats = drm_sysfb_build_fourcc_list(dev, &format->format, 1,
   271						       cdev->formats, ARRAY_SIZE(cdev->formats));
   272	
   273		primary_plane = &cdev->primary_plane;
   274		ret = drm_universal_plane_init(dev, primary_plane, 0, &corebootdrm_primary_plane_funcs,
   275					       cdev->formats, nformats,
   276					       corebootdrm_primary_plane_format_modifiers,
   277					       DRM_PLANE_TYPE_PRIMARY, NULL);
   278		if (ret)
   279			return ret;
   280		drm_plane_helper_add(primary_plane, &corebootdrm_primary_plane_helper_funcs);
   281		drm_plane_enable_fb_damage_clips(primary_plane);
   282	
   283		/* CRTC */
   284	
   285		crtc = &cdev->crtc;
   286		ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
   287						&corebootdrm_crtc_funcs, NULL);
   288		if (ret)
   289			return ret;
   290		drm_crtc_helper_add(crtc, &corebootdrm_crtc_helper_funcs);
   291	
   292		/* Encoder */
   293	
   294		encoder = &cdev->encoder;
   295		ret = drm_encoder_init(dev, encoder, &corebootdrm_encoder_funcs,
   296				       DRM_MODE_ENCODER_NONE, NULL);
   297		if (ret)
   298			return ret;
   299		encoder->possible_crtcs = drm_crtc_mask(crtc);
   300	
   301		/* Connector */
   302	
   303		connector = &cdev->connector;
   304		ret = drm_connector_init(dev, connector, &corebootdrm_connector_funcs,
   305					 DRM_MODE_CONNECTOR_Unknown);
   306		if (ret)
   307			return ret;
   308		drm_connector_helper_add(connector, &corebootdrm_connector_helper_funcs);
   309		drm_connector_set_panel_orientation_with_quirk(connector,
   310							       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
   311							       width, height);
   312	
   313		ret = drm_connector_attach_encoder(connector, encoder);
   314		if (ret)
   315			return ret;
   316	
   317		drm_mode_config_reset(dev);
   318	
   319		return 0;
   320	}
   321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
