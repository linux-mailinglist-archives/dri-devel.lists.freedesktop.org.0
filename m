Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF4E8B2E10
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 02:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7385B10F861;
	Fri, 26 Apr 2024 00:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhDF83FO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CBA10F861
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 00:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714091606; x=1745627606;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Nf+U2Bz83MNqocDchiJl1OjjxkiS7h47yk61UeFnBl8=;
 b=IhDF83FO4h9c/vuEXgjyMz12evdF9YxtxKBKkYfzyqRwPEp/efELPaNs
 dI6I5UzZ7xHDaIfM9Alr/7kGwD+uXZNCalqd3YAWsHHaL8uO7aF7v/1+B
 KoKgF1ecEyDAgi35sinpICMde1tJmlXHC5zM76N+WTm17ThnHsfKroIy6
 fcl+1VN5M2H+Yi9Y4dbEiq+rie8tqc9sGQeDijwVG5g37MSF7h3H4RcBz
 iZq1s8P2CbQEqwlXX0NpdlsV7FRp4d6nJLc6S8KpyAXmZxTh3B9kc77Ff
 9/Uquq0NsjPTrPf7AOQsAln55OZnzth3D6INSkvhSVNDyF3UFo/F6rE6M g==;
X-CSE-ConnectionGUID: ttHMq2BURCK7ue6My6r2uA==
X-CSE-MsgGUID: nHNZ3LeAQFG/6mZYChUXNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="27270906"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="27270906"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 17:33:26 -0700
X-CSE-ConnectionGUID: WEGGWKYmQ0KvzmlT10ekOA==
X-CSE-MsgGUID: 3zTKaR2kReCPY5gGTqbRWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="25893760"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 25 Apr 2024 17:33:23 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s09Wj-00033w-0A;
 Fri, 26 Apr 2024 00:33:21 +0000
Date: Fri, 26 Apr 2024 08:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [drm-misc:for-linux-next 4/6]
 drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: warning: logical not is only
 applied to the left hand side of this comparison
Message-ID: <202404260800.7UEcBP6c-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   2bdb481bf7a93c22b9fea8daefa2834aab23a70f
commit: b0f0469ab662159f182f5af292b71cc5d42468a8 [4/6] drm: xlnx: zynqmp_dpsub: Anounce supported input formats
config: i386-buildonly-randconfig-006-20240426 (https://download.01.org/0day-ci/archive/20240426/202404260800.7UEcBP6c-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404260800.7UEcBP6c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260800.7UEcBP6c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: warning: logical not is only applied to the left hand side of this comparison [-Wlogical-not-parentheses]
     949 |         if (WARN_ON(!layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE)) {
         |                     ^            ~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: note: add parentheses after the '!' to evaluate the comparison first
   drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: note: add parentheses around left hand side expression to silence this warning
   1 warning generated.


vim +949 drivers/gpu/drm/xlnx/zynqmp_disp.c

   928	
   929	/**
   930	 * zynqmp_disp_layer_drm_formats - Return the DRM formats supported by the layer
   931	 * @layer: The layer
   932	 * @num_formats: Pointer to the returned number of formats
   933	 *
   934	 * NOTE: This function doesn't make sense for live video layers and will
   935	 * always return an empty list in such cases. zynqmp_disp_live_layer_formats()
   936	 * should be used to query a list of media bus formats supported by the live
   937	 * video input layer.
   938	 *
   939	 * Return: A newly allocated u32 array that stores all the DRM formats
   940	 * supported by the layer. The number of formats in the array is returned
   941	 * through the num_formats argument.
   942	 */
   943	u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
   944					   unsigned int *num_formats)
   945	{
   946		unsigned int i;
   947		u32 *formats;
   948	
 > 949		if (WARN_ON(!layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE)) {
   950			*num_formats = 0;
   951			return NULL;
   952		}
   953	
   954		formats = kcalloc(layer->info->num_formats, sizeof(*formats),
   955				  GFP_KERNEL);
   956		if (!formats) {
   957			*num_formats = 0;
   958			return NULL;
   959		}
   960	
   961		for (i = 0; i < layer->info->num_formats; ++i)
   962			formats[i] = layer->info->formats[i].drm_fmt;
   963	
   964		*num_formats = layer->info->num_formats;
   965		return formats;
   966	}
   967	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
