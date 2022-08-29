Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C12B5A417F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 05:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C848A10E5FA;
	Mon, 29 Aug 2022 03:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFE510E5FA
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 03:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661743939; x=1693279939;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZNxOoPeAHhN/1dtqMR/zUEqKl0gYFGInH11MuO8ZPZw=;
 b=IMf4nPST4vRVS9x2lN9siwPlUoeI0r431TXhID+vGKeeqSTlLrP4K+cz
 n3MclI3NhGeW3QOe4tKz2ksgrEK3jhO90vPLChF2R5mKxOZzSGl1BVxYh
 NbgOr443CFuUZK8A5brf0NHWEkXhPnsju4Gbxql2FASZzfXS7hTqs+gfg
 3+1QY0nOutXzTlUKqtK2wjPhI+5xHfmgLo9Xaomocy10d7dloHHmH06Ur
 DsWegjQN3tMKbPdvrMN9wSdKuHSWCRPZMiL8A3fd9rSL9nqwudTJ2LTpj
 y7z+UbKOwFniGtNyQSymHaMjBqoWd6VqD51adflhKuUhlYQhKs9VRnwEO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="293543463"
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; d="scan'208";a="293543463"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2022 20:32:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; d="scan'208";a="737196036"
Received: from lkp-server01.sh.intel.com (HELO b2bbdd52f619) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 28 Aug 2022 20:32:15 -0700
Received: from kbuild by b2bbdd52f619 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oSVVW-00008N-1w;
 Mon, 29 Aug 2022 03:32:14 +0000
Date: Mon, 29 Aug 2022 11:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: oushixiong <oushixiong@kylinos.cn>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PTACH v3] drm/ast: add dmabuf/prime buffer sharing support
Message-ID: <202208291132.RQqpjzO1-lkp@intel.com>
References: <20220827091030.496671-1-oushixiong@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220827091030.496671-1-oushixiong@kylinos.cn>
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
Cc: oushixiong <oushixiong@kylinos.cn>, kbuild-all@lists.01.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi oushixiong,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-intel/for-linux-next drm-tip/drm-tip linus/master v6.0-rc3 next-20220826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/oushixiong/drm-ast-add-dmabuf-prime-buffer-sharing-support/20220829-084713
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220829/202208291132.RQqpjzO1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/da31884b8b7e33af5cd8aa750dea30fde59d52aa
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review oushixiong/drm-ast-add-dmabuf-prime-buffer-sharing-support/20220829-084713
        git checkout da31884b8b7e33af5cd8aa750dea30fde59d52aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/ast/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ast/ast_drv.c:54:24: warning: no previous prototype for function 'ast_gem_prime_import' [-Wmissing-prototypes]
   struct drm_gem_object *ast_gem_prime_import(struct drm_device *dev,
                          ^
   drivers/gpu/drm/ast/ast_drv.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct drm_gem_object *ast_gem_prime_import(struct drm_device *dev,
   ^
   static 
   1 warning generated.


vim +/ast_gem_prime_import +54 drivers/gpu/drm/ast/ast_drv.c

    53	
  > 54	struct drm_gem_object *ast_gem_prime_import(struct drm_device *dev,
    55							struct dma_buf *dma_buf)
    56	{
    57		struct drm_gem_vram_object *gbo;
    58	
    59		gbo = drm_gem_vram_of_gem(dma_buf->priv);
    60		if (gbo->bo.base.dev == dev) {
    61			/*
    62			* Importing dmabuf exported from out own gem increases
    63			* refcount on gem itself instead of f_count of dmabuf.
    64			*/
    65			drm_gem_object_get(&gbo->bo.base);
    66			return &gbo->bo.base;
    67		}
    68	
    69		gbo = drm_gem_vram_create(dev, dma_buf->size, 0);
    70		if (IS_ERR(gbo))
    71			return NULL;
    72	
    73		get_dma_buf(dma_buf);
    74		return &gbo->bo.base;
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
