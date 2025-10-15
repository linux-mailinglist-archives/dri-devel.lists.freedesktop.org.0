Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36336BE09B3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 22:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E39010E8DC;
	Wed, 15 Oct 2025 20:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AdYkVMg5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADBB10E8DC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 20:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760559426; x=1792095426;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0v6EnKffs2NEkIH+eVz0aqecvPBLBrK+UWbvYlBHsO4=;
 b=AdYkVMg5pvBhBsr4ONF5nYlQNPbwWAzACpZ3mOk3ZuKimPn1Td/4d9VA
 ac2pshgBrrrpWPYCPZt0y9NNqYMmm3L2pUszLBSmpxknAQdqNV4oMy4cK
 lqMcS5O6YZJNgniaZqX/DsD6RTsAix9tfo7YpQv8EbnghDZrPqaOqbRwy
 MEkOlqwpnPlufvYC/uYs3WSxno23B3ErUhMkmrTZtfaK2iW+yek+ROIAA
 Id/5DxHZEwSPNAwBFykwicz8H74a4yJalF4Oum3MEGO+itCIQSXfX6VVs
 vQPAJOhe1Tixz6/wdVV2ridoehO6zoWjv4QDCSIRR/KfYz8qx0EXQbKpv Q==;
X-CSE-ConnectionGUID: WK7V8g1gSmSnNKoYiYfh1w==
X-CSE-MsgGUID: EZ88u8FBRBm9NhByln+gmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="66396429"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="66396429"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 13:17:05 -0700
X-CSE-ConnectionGUID: RPhexlMERmWcmPSSBcmGhw==
X-CSE-MsgGUID: 6M4kJJQaRH+ciw5Js1Ynag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="219416290"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 15 Oct 2025 13:16:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v97vQ-0004CH-29;
 Wed, 15 Oct 2025 20:16:49 +0000
Date: Thu, 16 Oct 2025 04:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-pm@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 5/5] pmdomain: mediatek: Add support for MFlexGraphics
Message-ID: <202510160419.8PPrVXUl-lkp@intel.com>
References: <20251015-mt8196-gpufreq-v7-5-0a6435da2080@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-mt8196-gpufreq-v7-5-0a6435da2080@collabora.com>
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

Hi Nicolas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 40a3abb0f3e5229996c8ef0498fc8d8a0c2bd64f]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolas-Frattaroli/dt-bindings-gpu-mali-valhall-csf-add-mediatek-mt8196-mali-variant/20251015-165256
base:   40a3abb0f3e5229996c8ef0498fc8d8a0c2bd64f
patch link:    https://lore.kernel.org/r/20251015-mt8196-gpufreq-v7-5-0a6435da2080%40collabora.com
patch subject: [PATCH v7 5/5] pmdomain: mediatek: Add support for MFlexGraphics
config: arm64-randconfig-002-20251016 (https://download.01.org/0day-ci/archive/20251016/202510160419.8PPrVXUl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160419.8PPrVXUl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160419.8PPrVXUl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:8:
   In function '__free_device_node',
       inlined from 'mtk_mfg_probe' at drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:877:22:
>> include/linux/of.h:138:51: warning: 'shmem' is used uninitialized [-Wuninitialized]
     138 | DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
         |                                                   ^
   include/linux/cleanup.h:211:78: note: in definition of macro 'DEFINE_FREE'
     211 |         static inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                                              ^~~~~
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c: In function 'mtk_mfg_probe':
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:877:29: note: 'shmem' was declared here
     877 |         struct device_node *shmem __free(device_node);
         |                             ^~~~~


vim +/shmem +138 include/linux/of.h

0829f6d1f69e4f Pantelis Antoniou 2013-12-13  126  
0f22dd395fc473 Grant Likely      2012-02-15  127  #ifdef CONFIG_OF_DYNAMIC
0f22dd395fc473 Grant Likely      2012-02-15  128  extern struct device_node *of_node_get(struct device_node *node);
0f22dd395fc473 Grant Likely      2012-02-15  129  extern void of_node_put(struct device_node *node);
0f22dd395fc473 Grant Likely      2012-02-15  130  #else /* CONFIG_OF_DYNAMIC */
3ecdd0515287af Rob Herring       2011-12-13  131  /* Dummy ref counting routines - to be implemented later */
3ecdd0515287af Rob Herring       2011-12-13  132  static inline struct device_node *of_node_get(struct device_node *node)
3ecdd0515287af Rob Herring       2011-12-13  133  {
3ecdd0515287af Rob Herring       2011-12-13  134  	return node;
3ecdd0515287af Rob Herring       2011-12-13  135  }
0f22dd395fc473 Grant Likely      2012-02-15  136  static inline void of_node_put(struct device_node *node) { }
0f22dd395fc473 Grant Likely      2012-02-15  137  #endif /* !CONFIG_OF_DYNAMIC */
9448e55d032d99 Jonathan Cameron  2024-02-25 @138  DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
3ecdd0515287af Rob Herring       2011-12-13  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
