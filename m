Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9D367FE92
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 12:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB31810E02C;
	Sun, 29 Jan 2023 11:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492E010E02C
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 11:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674991870; x=1706527870;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=941qYSAT8AewHuWw7L2KMhlt7LAztpslaoA8f27sugc=;
 b=W/1l5t97o03hfPKhRqBlUbZLDdVWD93hhSXaJMQ2zgPskwFPxhcYkT74
 xMz7GC472Kc78QxYJIjgNCCHrBl/q5HV1ZXprm4bR+4uguSvbOwVdYnNZ
 SzBNywHq+oT6KmQ5RlfaGA6u9S2Dggnxt+Q5xBr+/tDnsvIPRE6KdCGtE
 FfAXHurnDns1p1M+8o/66QrVcW+kQi9V6OfhcLZ37h/kXb3BPlTz+O6u1
 u4wMFGTtrZ4NflWMktJnEw1JTFxEPMFcH7IY6ucu1vRdQJBcG1PPqoxAd
 sHGiGmGGGJEsJ9ez79tColn9c9koHU5puBxiL145oHv7+CTzJo0LmC3Ud w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="315346486"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; d="scan'208";a="315346486"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2023 03:31:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="909174613"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; d="scan'208";a="909174613"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 29 Jan 2023 03:31:05 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pM5tp-0002lG-0S;
 Sun, 29 Jan 2023 11:31:05 +0000
Date: Sun, 29 Jan 2023 19:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/mediatek: Add support for AR30 and BA30
Message-ID: <202301291906.Az5NHf9w-lkp@intel.com>
References: <20230127230123.941930-1-greenjustin@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127230123.941930-1-greenjustin@google.com>
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
Cc: chunkuang.hu@kernel.org, greenjustin@chromium.org, airlied@linux.ie,
 jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org,
 oe-kbuild-all@lists.linux.dev, matthias.bgg@gmail.com,
 Justin Green <greenjustin@google.com>, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Justin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Justin-Green/drm-mediatek-Add-support-for-AR30-and-BA30/20230128-112134
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230127230123.941930-1-greenjustin%40google.com
patch subject: [PATCH v3] drm/mediatek: Add support for AR30 and BA30
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291906.Az5NHf9w-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c32525cf66e7bbf4e798aef3aafbf88dee5d049c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Justin-Green/drm-mediatek-Add-support-for-AR30-and-BA30/20230128-112134
        git checkout c32525cf66e7bbf4e798aef3aafbf88dee5d049c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/mediatek/ sound/soc/samsung/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_drm_crtc.h:10,
                    from drivers/gpu/drm/mediatek/mtk_disp_aal.c:15:
   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h: In function 'mtk_ddp_comp_supports_10bit':
>> drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h:159:35: warning: returning 'int (*)(struct device *)' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     159 |                 return comp->funcs->supports_10bit;
         |                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~


vim +159 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h

   154	
   155	static inline
   156	int mtk_ddp_comp_supports_10bit(struct mtk_ddp_comp *comp)
   157	{
   158		if (comp->funcs && comp->funcs->supports_10bit)
 > 159			return comp->funcs->supports_10bit;
   160	
   161	        return 0;
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
