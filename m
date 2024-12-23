Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE869FAE54
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 13:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D546110E071;
	Mon, 23 Dec 2024 12:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGJlDQHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854BF10E071
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734957695; x=1766493695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=L+YxQcEOgXNHxMddVjNfSi3hx+4G5NNjAUaqSfVyCpQ=;
 b=MGJlDQHlyXZwdhr1uosmHyLEwdg265gzJGqesMqTaYcNTeIWMCnTI8nx
 dfoiwv2WQYXXW/Bs0XHBiXLH8OQTTZ/ioxm3EhsqC4/W9eagG8PmViX5p
 obD94vs93A82tPiRnVh/m/SXBbpXQDmxLOCfMbW8U3yYv5+cirguDDRoh
 eBl3YOsunbUg85QzRgeS0gduyKs9feTFNSN+tMWGCTMMHGLBwifDT6fgN
 3J5gaFCy/SB1wVEgzur0ZbUTqVPWMxoj8nrL2uKYtAE5xC9HADAW4m3q6
 HNuSF6glkE1PnmK+SMJ8CpHplA405c+ZZ6Jfh32GHUaC7S+7jkw2a1WMY g==;
X-CSE-ConnectionGUID: D4QnCXcITkeEfPj65tgoPQ==
X-CSE-MsgGUID: lzwTh1sDTU+APlT3J+9FrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="23008530"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; d="scan'208";a="23008530"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 04:41:35 -0800
X-CSE-ConnectionGUID: 7uffrvwjQtefBERyCCjFhg==
X-CSE-MsgGUID: 02RzGsxqQJi2m11SdTmWlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; d="scan'208";a="99716687"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 23 Dec 2024 04:41:32 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tPhkY-0003ad-0K;
 Mon, 23 Dec 2024 12:41:30 +0000
Date: Mon, 23 Dec 2024 20:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>, tzimmermann@suse.de,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ast: Support timings, 1280x720/1280x960/1600x900
Message-ID: <202412232014.2tGzY28v-lkp@intel.com>
References: <20241223081044.4139167-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223081044.4139167-1-jammy_huang@aspeedtech.com>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Jammy-Huang/drm-ast-Support-timings-1280x720-1280x960-1600x900/20241223-161735
base:   4bbf9020becbfd8fc2c3da790855b7042fad455b
patch link:    https://lore.kernel.org/r/20241223081044.4139167-1-jammy_huang%40aspeedtech.com
patch subject: [PATCH] drm/ast: Support timings, 1280x720/1280x960/1600x900
config: i386-buildonly-randconfig-002-20241223 (https://download.01.org/0day-ci/archive/20241223/202412232014.2tGzY28v-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412232014.2tGzY28v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412232014.2tGzY28v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/ast/ast_mode.c:481:31: error: use of undeclared identifier 'AST_IO_SEQ_PORT'
     481 |                 ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xff, 0x08);
         |                                             ^
   drivers/gpu/drm/ast/ast_mode.c:483:31: error: use of undeclared identifier 'AST_IO_SEQ_PORT'
     483 |                 ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xf7, 0x00);
         |                                             ^
   2 errors generated.


vim +/AST_IO_SEQ_PORT +481 drivers/gpu/drm/ast/ast_mode.c

   461	
   462	static void ast_set_dclk_reg(struct ast_device *ast,
   463				     struct drm_display_mode *mode,
   464				     struct ast_vbios_mode_info *vbios_mode)
   465	{
   466		const struct ast_vbios_dclk_info *clk_info;
   467	
   468		if (IS_AST_GEN6(ast) || IS_AST_GEN7(ast))
   469			clk_info = &dclk_table_ast2500[vbios_mode->enh_table->dclk_index];
   470		else
   471			clk_info = &dclk_table[vbios_mode->enh_table->dclk_index];
   472	
   473		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc0, 0x00, clk_info->param1);
   474		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc1, 0x00, clk_info->param2);
   475		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xbb, 0x0f,
   476				       (clk_info->param3 & 0xc0) |
   477				       ((clk_info->param3 & 0x3) << 4));
   478	
   479		/* Set SEQ; Half dclk for this timing */
   480		if (vbios_mode->enh_table->flags & HalfDCLK)
 > 481			ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xff, 0x08);
   482		else
   483			ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xf7, 0x00);
   484	}
   485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
