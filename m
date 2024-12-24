Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A446D9FBCE3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 12:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D6210E0AB;
	Tue, 24 Dec 2024 11:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ykbq/HtH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C198B10E0AB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 11:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735039010; x=1766575010;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2HOtRseGtjMgLatc222DdK/RSeKWMNOgUbwMHw26haI=;
 b=Ykbq/HtH49qieSOvGaDNEwumUOtfmBAbGAnWir/gsFPI5H+r9XsQKEe7
 69O5KDCpC1th/W65ApTnupxKuDUz9mXlnpb8ycbowgL7CUtEEgbTrr6J7
 cvEssXTTjQe6f5R30TTKxpOXjc3LBu84ejMmEX9v4x1ogzrwoutCHKqAe
 R2ErZEogrPEGD5FNfD5RDa+gGPXkL7JpsY3HCKg1wejUtNPUqfxLisKpS
 oChKIP9G+s0UPaH1vU7QEDDHNWxVz4prCA9xRbMBd0329aYw+1/HdCjtt
 7AzzyDxCslCBEr5QD7ZLk84K4zOByB9kBQhhsn9+7KGLEFaBAqtH1Rq/4 w==;
X-CSE-ConnectionGUID: 4MBYMRb+R6axcy4YiIo4DQ==
X-CSE-MsgGUID: 1TGP8RqURtaiML/npTbjcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46884795"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; d="scan'208";a="46884795"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2024 03:16:50 -0800
X-CSE-ConnectionGUID: xKlOAgGST+GcPYTapvhgSw==
X-CSE-MsgGUID: XtiGmS6TTqm0rSpiKdWyIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100292714"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 24 Dec 2024 03:16:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tQ2u3-000131-2j;
 Tue, 24 Dec 2024 11:16:43 +0000
Date: Tue, 24 Dec 2024 19:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>, tzimmermann@suse.de,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/ast: Support timings, 1280x720/1280x960/1600x900
Message-ID: <202412241827.pakDEV5a-lkp@intel.com>
References: <20241224025430.3773224-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224025430.3773224-1-jammy_huang@aspeedtech.com>
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

Hi Jammy,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4bbf9020becbfd8fc2c3da790855b7042fad455b]

url:    https://github.com/intel-lab-lkp/linux/commits/Jammy-Huang/drm-ast-Support-timings-1280x720-1280x960-1600x900/20241224-105552
base:   4bbf9020becbfd8fc2c3da790855b7042fad455b
patch link:    https://lore.kernel.org/r/20241224025430.3773224-1-jammy_huang%40aspeedtech.com
patch subject: [PATCH v2] drm/ast: Support timings, 1280x720/1280x960/1600x900
config: powerpc-randconfig-001-20241224 (https://download.01.org/0day-ci/archive/20241224/202412241827.pakDEV5a-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412241827.pakDEV5a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412241827.pakDEV5a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/ast/ast_mode.c:150:12: error: use of undeclared identifier 'crtc'
                   else if (crtc->mode.crtc_vdisplay == 720)
                            ^
   drivers/gpu/drm/ast/ast_mode.c:152:12: error: use of undeclared identifier 'crtc'
                   else if (crtc->mode.crtc_vdisplay == 960)
                            ^
   2 errors generated.


vim +/crtc +150 drivers/gpu/drm/ast/ast_mode.c

   108	
   109	static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
   110					    const struct drm_display_mode *mode,
   111					    struct drm_display_mode *adjusted_mode,
   112					    struct ast_vbios_mode_info *vbios_mode)
   113	{
   114		u32 refresh_rate_index = 0, refresh_rate;
   115		const struct ast_vbios_enhtable *best = NULL;
   116		u32 hborder, vborder;
   117		bool check_sync;
   118	
   119		switch (format->cpp[0] * 8) {
   120		case 8:
   121			vbios_mode->std_table = &vbios_stdtable[VGAModeIndex];
   122			break;
   123		case 16:
   124			vbios_mode->std_table = &vbios_stdtable[HiCModeIndex];
   125			break;
   126		case 24:
   127		case 32:
   128			vbios_mode->std_table = &vbios_stdtable[TrueCModeIndex];
   129			break;
   130		default:
   131			return false;
   132		}
   133	
   134		switch (mode->crtc_hdisplay) {
   135		case 640:
   136			vbios_mode->enh_table = &res_640x480[refresh_rate_index];
   137			break;
   138		case 800:
   139			vbios_mode->enh_table = &res_800x600[refresh_rate_index];
   140			break;
   141		case 1024:
   142			vbios_mode->enh_table = &res_1024x768[refresh_rate_index];
   143			break;
   144		case 1152:
   145			vbios_mode->enh_table = &res_1152x864[refresh_rate_index];
   146			break;
   147		case 1280:
   148			if (mode->crtc_vdisplay == 800)
   149				vbios_mode->enh_table = &res_1280x800[refresh_rate_index];
 > 150			else if (crtc->mode.crtc_vdisplay == 720)
   151				vbios_mode->enh_table = &res_1280x720[refresh_rate_index];
   152			else if (crtc->mode.crtc_vdisplay == 960)
   153				vbios_mode->enh_table = &res_1280x960[refresh_rate_index];
   154			else
   155				vbios_mode->enh_table = &res_1280x1024[refresh_rate_index];
   156			break;
   157		case 1360:
   158			vbios_mode->enh_table = &res_1360x768[refresh_rate_index];
   159			break;
   160		case 1440:
   161			vbios_mode->enh_table = &res_1440x900[refresh_rate_index];
   162			break;
   163		case 1600:
   164			if (mode->crtc_vdisplay == 900)
   165				vbios_mode->enh_table = &res_1600x900[refresh_rate_index];
   166			else
   167				vbios_mode->enh_table = &res_1600x1200[refresh_rate_index];
   168			break;
   169		case 1680:
   170			vbios_mode->enh_table = &res_1680x1050[refresh_rate_index];
   171			break;
   172		case 1920:
   173			if (mode->crtc_vdisplay == 1080)
   174				vbios_mode->enh_table = &res_1920x1080[refresh_rate_index];
   175			else
   176				vbios_mode->enh_table = &res_1920x1200[refresh_rate_index];
   177			break;
   178		default:
   179			return false;
   180		}
   181	
   182		refresh_rate = drm_mode_vrefresh(mode);
   183		check_sync = vbios_mode->enh_table->flags & WideScreenMode;
   184	
   185		while (1) {
   186			const struct ast_vbios_enhtable *loop = vbios_mode->enh_table;
   187	
   188			while (loop->refresh_rate != 0xff) {
   189				if ((check_sync) &&
   190				    (((mode->flags & DRM_MODE_FLAG_NVSYNC)  &&
   191				      (loop->flags & PVSync))  ||
   192				     ((mode->flags & DRM_MODE_FLAG_PVSYNC)  &&
   193				      (loop->flags & NVSync))  ||
   194				     ((mode->flags & DRM_MODE_FLAG_NHSYNC)  &&
   195				      (loop->flags & PHSync))  ||
   196				     ((mode->flags & DRM_MODE_FLAG_PHSYNC)  &&
   197				      (loop->flags & NHSync)))) {
   198					loop++;
   199					continue;
   200				}
   201				if (loop->refresh_rate <= refresh_rate
   202				    && (!best || loop->refresh_rate > best->refresh_rate))
   203					best = loop;
   204				loop++;
   205			}
   206			if (best || !check_sync)
   207				break;
   208			check_sync = 0;
   209		}
   210	
   211		if (best)
   212			vbios_mode->enh_table = best;
   213	
   214		hborder = (vbios_mode->enh_table->flags & HBorder) ? 8 : 0;
   215		vborder = (vbios_mode->enh_table->flags & VBorder) ? 8 : 0;
   216	
   217		adjusted_mode->crtc_htotal = vbios_mode->enh_table->ht;
   218		adjusted_mode->crtc_hblank_start = vbios_mode->enh_table->hde + hborder;
   219		adjusted_mode->crtc_hblank_end = vbios_mode->enh_table->ht - hborder;
   220		adjusted_mode->crtc_hsync_start = vbios_mode->enh_table->hde + hborder +
   221			vbios_mode->enh_table->hfp;
   222		adjusted_mode->crtc_hsync_end = (vbios_mode->enh_table->hde + hborder +
   223						 vbios_mode->enh_table->hfp +
   224						 vbios_mode->enh_table->hsync);
   225	
   226		adjusted_mode->crtc_vtotal = vbios_mode->enh_table->vt;
   227		adjusted_mode->crtc_vblank_start = vbios_mode->enh_table->vde + vborder;
   228		adjusted_mode->crtc_vblank_end = vbios_mode->enh_table->vt - vborder;
   229		adjusted_mode->crtc_vsync_start = vbios_mode->enh_table->vde + vborder +
   230			vbios_mode->enh_table->vfp;
   231		adjusted_mode->crtc_vsync_end = (vbios_mode->enh_table->vde + vborder +
   232						 vbios_mode->enh_table->vfp +
   233						 vbios_mode->enh_table->vsync);
   234	
   235		return true;
   236	}
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
