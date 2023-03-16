Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6AB6BCB81
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3819D10E0F2;
	Thu, 16 Mar 2023 09:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E323B10E0F2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678960412; x=1710496412;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YrRk+kQWpdZ+wI3PSipWf7W+koCn9M7Bp4aMjsiW2GY=;
 b=X8rWUTau7irW5my9qutjtyWjagcnX4KfbV5c/xvPqJUwoROUdl1Yq+Pb
 XlIbhe5wMmvhH24ShOBfragLYNQrZYaYSDp5UNaR1pTappVbHTPamv7Wr
 l0n/+PFHGzmk5n4CaHbGHBqYTg8+NeEkgks2Muz9oxea2klxN1NIdErpm
 FGhwHcPPIo5d3XejHr4KP9oh5qlT7WxosGUYNIERgB7hJFDxBpPwRLHNp
 +b7NyZmrYPU7k55Xr9ysGvdlgXGpjn5vzvylL/2UMK9YKtQDcrXb/nOWH
 YcSKDUFyinhTlo+0SywLFbUUXQb4/MFwmGQu3r6ubvNvnpKjgiTavNu1x w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="335425494"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="335425494"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 02:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="1009162153"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="1009162153"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 16 Mar 2023 02:53:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pckIZ-0008Sc-0S;
 Thu, 16 Mar 2023 09:53:27 +0000
Date: Thu, 16 Mar 2023 17:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 suijingfeng <suijingfeng@loongson.cn>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH v7 2/2] drm: add kms driver for loongson display controller
Message-ID: <202303161727.8HnBf6cW-lkp@intel.com>
References: <20230315211550.2620818-3-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315211550.2620818-3-15330273260@189.cn>
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
Cc: Li Yi <liyi@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.3-rc2 next-20230316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230316-051724
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230315211550.2620818-3-15330273260%40189.cn
patch subject: [PATCH v7 2/2] drm: add kms driver for loongson display controller
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230316/202303161727.8HnBf6cW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ba899dba3475b9612f212e3b1daedc3d9a299458
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sui-Jingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230316-051724
        git checkout ba899dba3475b9612f212e3b1daedc3d9a299458
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/loongson/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161727.8HnBf6cW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/loongson/lsdc_gem.c: In function 'lsdc_show_buffer_object':
>> drivers/gpu/drm/loongson/lsdc_gem.c:280:51: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     280 |                 seq_printf(m, "bo[%04u]: size: %8lukB %s\n",
         |                                                ~~~^
         |                                                   |
         |                                                   long unsigned int
         |                                                %8u
     281 |                            i,
     282 |                            lsdc_bo_size(tbo) >> 10,
         |                            ~~~~~~~~~~~~~~~~~~~~~~~ 
         |                                              |
         |                                              size_t {aka unsigned int}


vim +280 drivers/gpu/drm/loongson/lsdc_gem.c

   264	
   265	int lsdc_show_buffer_object(struct seq_file *m, void *arg)
   266	{
   267	#ifdef CONFIG_DEBUG_FS
   268		struct drm_info_node *node = (struct drm_info_node *)m->private;
   269		struct drm_device *ddev = node->minor->dev;
   270		struct lsdc_device *ldev = to_lsdc(ddev);
   271		struct lsdc_bo *lbo;
   272		unsigned int i = 0;
   273	
   274		mutex_lock(&ldev->gem.mutex);
   275	
   276		list_for_each_entry(lbo, &ldev->gem.objects, list) {
   277			struct ttm_buffer_object *tbo = &lbo->tbo;
   278			struct ttm_resource *resource = tbo->resource;
   279	
 > 280			seq_printf(m, "bo[%04u]: size: %8lukB %s\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
