Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB31AFA117
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 19:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562BE10E050;
	Sat,  5 Jul 2025 17:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ML1ZvgWs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2189710E050;
 Sat,  5 Jul 2025 17:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751738067; x=1783274067;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rICWKtoMH+zyndlY0ZXbsoGpXVyzFl9DyaZBL8qQaao=;
 b=ML1ZvgWsRhwVmeh2sUwnowU3t4R6HJej3rL0PaYoix3gGH6wLCejFYpZ
 F3durz7P7GEkgEeWjoRZBXlrVfqgnl34/FCCsUSRcqOL6oGEGxhxw4hg6
 8/fS9OP9DSDt25YlkuYrclvi8BMUf40fQ5KKZHN1Tw5wyIOqiFHObYBFy
 oTbDzqD4+ze9dsIlANSSAcDMdxFWf5TenD1TtI8JnVXOy3vKfkeIR7KXM
 +8i4JH0Vmkzv9OKDpmglTy51IUBIfhYvuHC3UieRwUPcSVg9It8l3A0I2
 l2Y7sJeEHfIrlnbLVcF0FLIjnDc2biIlsFWjV+yjqv3CJnWttNCo7eWIC w==;
X-CSE-ConnectionGUID: 0+nfF6PpSxOC0eaypAIeYQ==
X-CSE-MsgGUID: q8438uoxR3+uyri30FmBOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="64711302"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; d="scan'208";a="64711302"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2025 10:54:27 -0700
X-CSE-ConnectionGUID: TZ/utm6MSFeQswsdWm9GjQ==
X-CSE-MsgGUID: XN4Gx1F1S2GKMc4NbGXj8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; d="scan'208";a="159128439"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 05 Jul 2025 10:54:23 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uY75h-0004ed-0i;
 Sat, 05 Jul 2025 17:54:21 +0000
Date: Sun, 6 Jul 2025 01:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/12] drm/msm/dpu: rewrite
 _dpu_format_populate_plane_sizes_ubwc()
Message-ID: <202507060149.j2XwjHut-lkp@intel.com>
References: <20250705-dpu-formats-v1-11-40f0bb31b8c8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705-dpu-formats-v1-11-40f0bb31b8c8@oss.qualcomm.com>
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

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-msm-disp-set-num_planes-to-1-for-interleaved-YUV-formats/20250705-104933
base:   26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
patch link:    https://lore.kernel.org/r/20250705-dpu-formats-v1-11-40f0bb31b8c8%40oss.qualcomm.com
patch subject: [PATCH 11/12] drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
config: powerpc64-randconfig-003-20250705 (https://download.01.org/0day-ci/archive/20250706/202507060149.j2XwjHut-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060149.j2XwjHut-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060149.j2XwjHut-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:79:7: warning: variable 'sclines' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      79 |                 if (fmt->pixel_format == DRM_FORMAT_NV12 ||
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      80 |                     fmt->pixel_format == DRM_FORMAT_P010) {
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:104:4: note: uninitialized use occurs here
     104 |                         sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
         |                         ^~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:79:3: note: remove the 'if' if its condition is always true
      79 |                 if (fmt->pixel_format == DRM_FORMAT_NV12 ||
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      80 |                     fmt->pixel_format == DRM_FORMAT_P010) {
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:74:31: note: initialize the variable 'sclines' to silence this warning
      74 |                 unsigned int stride, sclines;
         |                                             ^
         |                                              = 0
>> drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:79:7: warning: variable 'stride' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      79 |                 if (fmt->pixel_format == DRM_FORMAT_NV12 ||
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      80 |                     fmt->pixel_format == DRM_FORMAT_P010) {
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:102:28: note: uninitialized use occurs here
     102 |                 layout->plane_pitch[0] = stride;
         |                                          ^~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:79:3: note: remove the 'if' if its condition is always true
      79 |                 if (fmt->pixel_format == DRM_FORMAT_NV12 ||
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      80 |                     fmt->pixel_format == DRM_FORMAT_P010) {
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:74:22: note: initialize the variable 'stride' to silence this warning
      74 |                 unsigned int stride, sclines;
         |                                    ^
         |                                     = 0
   2 warnings generated.


vim +79 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c

    65	
    66	static int _dpu_format_populate_plane_sizes_ubwc(
    67			const struct msm_format *fmt,
    68			struct drm_framebuffer *fb,
    69			struct dpu_hw_fmt_layout *layout)
    70	{
    71		bool meta = MSM_FORMAT_IS_UBWC(fmt);
    72	
    73		if (MSM_FORMAT_IS_YUV(fmt)) {
    74			unsigned int stride, sclines;
    75			unsigned int y_tile_width, y_tile_height;
    76			unsigned int y_meta_stride, y_meta_scanlines;
    77			unsigned int uv_meta_stride, uv_meta_scanlines;
    78	
  > 79			if (fmt->pixel_format == DRM_FORMAT_NV12 ||
    80			    fmt->pixel_format == DRM_FORMAT_P010) {
    81				if (MSM_FORMAT_IS_DX(fmt)) {
    82					if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
    83						stride = MSM_MEDIA_ALIGN(fb->width, 192);
    84						stride = MSM_MEDIA_ALIGN(stride * 4 / 3, 256);
    85						y_tile_width = 48;
    86					} else {
    87						stride = MSM_MEDIA_ALIGN(fb->width * 2, 256);
    88						y_tile_width = 32;
    89					}
    90	
    91					sclines = MSM_MEDIA_ALIGN(fb->height, 16);
    92					y_tile_height = 4;
    93				} else {
    94					stride = MSM_MEDIA_ALIGN(fb->width, 128);
    95					y_tile_width = 32;
    96	
    97					sclines = MSM_MEDIA_ALIGN(fb->height, 32);
    98					y_tile_height = 8;
    99				}
   100			}
   101	
   102			layout->plane_pitch[0] = stride;
   103			layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
   104				sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
   105	
   106			layout->plane_pitch[1] = stride;
   107			layout->plane_size[1] = MSM_MEDIA_ALIGN(layout->plane_pitch[1] *
   108				sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
   109	
   110			if (!meta)
   111				return 0;
   112	
   113			y_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, y_tile_width);
   114			layout->plane_pitch[2] = MSM_MEDIA_ALIGN(y_meta_stride, 64);
   115	
   116			y_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, y_tile_height);
   117			y_meta_scanlines = MSM_MEDIA_ALIGN(y_meta_scanlines, 16);
   118			layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
   119				y_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
   120	
   121			uv_meta_stride = MSM_MEDIA_ROUNDUP((fb->width+1)>>1, y_tile_width / 2);
   122			layout->plane_pitch[3] = MSM_MEDIA_ALIGN(uv_meta_stride, 64);
   123	
   124			uv_meta_scanlines = MSM_MEDIA_ROUNDUP((fb->height+1)>>1, y_tile_height);
   125			uv_meta_scanlines = MSM_MEDIA_ALIGN(uv_meta_scanlines, 16);
   126			layout->plane_size[3] = MSM_MEDIA_ALIGN(layout->plane_pitch[3] *
   127				uv_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
   128		} else {
   129			unsigned int rgb_scanlines, rgb_meta_scanlines, rgb_meta_stride;
   130	
   131			layout->plane_pitch[0] = MSM_MEDIA_ALIGN(fb->width * fmt->bpp, 256);
   132			rgb_scanlines = MSM_MEDIA_ALIGN(fb->height, 16);
   133			layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
   134				rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
   135	
   136			if (!meta)
   137				return 0;
   138	
   139			/* uAPI leaves plane[1] empty and plane[2] as meta */
   140			layout->num_planes += 1;
   141	
   142			rgb_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, 16);
   143			layout->plane_pitch[2] = MSM_MEDIA_ALIGN(rgb_meta_stride, 64);
   144	
   145			rgb_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, 4);
   146			rgb_meta_scanlines = MSM_MEDIA_ALIGN(rgb_meta_scanlines, 16);
   147	
   148			layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
   149				rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
   150		}
   151	
   152		return 0;
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
