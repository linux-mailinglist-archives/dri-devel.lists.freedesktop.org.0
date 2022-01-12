Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE4C48CA8E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 19:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A921710E71E;
	Wed, 12 Jan 2022 18:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B40A10E313
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 18:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642010530; x=1673546530;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=peCOLHBM3+E7NaIzL8oRlL1xCDcIV08L04w1ldsTMcY=;
 b=Xfol8b7OV6fudnOe+MmLlZVHlPX0QNGhP/DFLmEL+MdVpvOT6BAdO3i8
 QC628OMjbSsCHuDnlFKgLAKl1+UYrihoKhRWL+Pa9b4F0HmHbvGg1h6ie
 gZ8U0r/n/vd/9it+92uvdSVvcRvthwUY2jTmwpWSBWAT5YnCtFbkqthz9
 Xyt2XCmgqCrN8B3hNILOxF1fO1HHyoZGZ92OpkxLmXY896upJqbcHTkws
 mg0V9rGJoKpJUnbAVFN0fuCX7pu4fLZcxNgT0sjop++jxIbanThbtk7HP
 nfVak7fobQXW4eWI3SnTtBroqtg+JUpe0X26fGTJrt1PNU21ikaFLcuMY A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="241354110"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="241354110"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 10:02:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="613650646"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Jan 2022 10:02:06 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n7hwk-0006CT-02; Wed, 12 Jan 2022 18:02:06 +0000
Date: Thu, 13 Jan 2022 02:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: cgel.zte@gmail.com, linux-graphics-maintainer@vmware.com
Subject: Re: [PATCH] drm/vmwgfx: remove redundant ret variable
Message-ID: <202201130145.eexFh3na-lkp@intel.com>
References: <20220112082422.667488-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112082422.667488-1-chi.minghao@zte.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, airlied@linux.ie, CGEL ZTE <cgel.zte@gmail.com>,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on next-20220112]
[cannot apply to v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/cgel-zte-gmail-com/drm-vmwgfx-remove-redundant-ret-variable/20220112-162527
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220113/202201130145.eexFh3na-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/3542ac844ea28aaa8528f5deb3ee52d1690f1f8a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review cgel-zte-gmail-com/drm-vmwgfx-remove-redundant-ret-variable/20220112-162527
        git checkout 3542ac844ea28aaa8528f5deb3ee52d1690f1f8a
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/vmwgfx/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c: In function 'vmw_dumb_create':
>> drivers/gpu/drm/vmwgfx/vmwgfx_bo.c:794:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     794 | void vmw_bo_swap_notify(struct ttm_buffer_object *bo)
         | ^~~~
   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c:860:1: error: expected declaration or statement at end of input
     860 | }
         | ^
   At top level:
   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c:853:6: warning: 'vmw_bo_is_vmw_bo' defined but not used [-Wunused-function]
     853 | bool vmw_bo_is_vmw_bo(struct ttm_buffer_object *bo)
         |      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c:815:6: warning: 'vmw_bo_move_notify' defined but not used [-Wunused-function]
     815 | void vmw_bo_move_notify(struct ttm_buffer_object *bo,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c:794:6: warning: 'vmw_bo_swap_notify' defined but not used [-Wunused-function]
     794 | void vmw_bo_swap_notify(struct ttm_buffer_object *bo)
         |      ^~~~~~~~~~~~~~~~~~


vim +794 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c

e9431ea5076a91 Thomas Hellstrom 2018-06-19  761  
e9431ea5076a91 Thomas Hellstrom 2018-06-19  762  
e9431ea5076a91 Thomas Hellstrom 2018-06-19  763  /**
e9431ea5076a91 Thomas Hellstrom 2018-06-19  764   * vmw_dumb_create - Create a dumb kms buffer
e9431ea5076a91 Thomas Hellstrom 2018-06-19  765   *
e9431ea5076a91 Thomas Hellstrom 2018-06-19  766   * @file_priv: Pointer to a struct drm_file identifying the caller.
e9431ea5076a91 Thomas Hellstrom 2018-06-19  767   * @dev: Pointer to the drm device.
e9431ea5076a91 Thomas Hellstrom 2018-06-19  768   * @args: Pointer to a struct drm_mode_create_dumb structure
e9431ea5076a91 Thomas Hellstrom 2018-06-19  769   * Return: Zero on success, negative error code on failure.
e9431ea5076a91 Thomas Hellstrom 2018-06-19  770   *
e9431ea5076a91 Thomas Hellstrom 2018-06-19  771   * This is a driver callback for the core drm create_dumb functionality.
e9431ea5076a91 Thomas Hellstrom 2018-06-19  772   * Note that this is very similar to the vmw_bo_alloc ioctl, except
e9431ea5076a91 Thomas Hellstrom 2018-06-19  773   * that the arguments have a different format.
e9431ea5076a91 Thomas Hellstrom 2018-06-19  774   */
e9431ea5076a91 Thomas Hellstrom 2018-06-19  775  int vmw_dumb_create(struct drm_file *file_priv,
e9431ea5076a91 Thomas Hellstrom 2018-06-19  776  		    struct drm_device *dev,
e9431ea5076a91 Thomas Hellstrom 2018-06-19  777  		    struct drm_mode_create_dumb *args)
e9431ea5076a91 Thomas Hellstrom 2018-06-19  778  {
e9431ea5076a91 Thomas Hellstrom 2018-06-19  779  	struct vmw_private *dev_priv = vmw_priv(dev);
e9431ea5076a91 Thomas Hellstrom 2018-06-19  780  	struct vmw_buffer_object *vbo;
e9431ea5076a91 Thomas Hellstrom 2018-06-19  781  
e9431ea5076a91 Thomas Hellstrom 2018-06-19  782  	args->pitch = args->width * ((args->bpp + 7) / 8);
8afa13a0583f94 Zack Rusin       2021-12-06  783  	args->size = ALIGN(args->pitch * args->height, PAGE_SIZE);
e9431ea5076a91 Thomas Hellstrom 2018-06-19  784  
3542ac844ea28a Minghao Chi      2022-01-12  785  	return vmw_gem_object_create_with_handle(dev_priv, file_priv,
8afa13a0583f94 Zack Rusin       2021-12-06  786  						args->size, &args->handle,
8afa13a0583f94 Zack Rusin       2021-12-06  787  						&vbo);
e9431ea5076a91 Thomas Hellstrom 2018-06-19  788  
e9431ea5076a91 Thomas Hellstrom 2018-06-19  789  /**
e9431ea5076a91 Thomas Hellstrom 2018-06-19  790   * vmw_bo_swap_notify - swapout notify callback.
e9431ea5076a91 Thomas Hellstrom 2018-06-19  791   *
e9431ea5076a91 Thomas Hellstrom 2018-06-19  792   * @bo: The buffer object to be swapped out.
e9431ea5076a91 Thomas Hellstrom 2018-06-19  793   */
e9431ea5076a91 Thomas Hellstrom 2018-06-19 @794  void vmw_bo_swap_notify(struct ttm_buffer_object *bo)
e9431ea5076a91 Thomas Hellstrom 2018-06-19  795  {
e9431ea5076a91 Thomas Hellstrom 2018-06-19  796  	/* Is @bo embedded in a struct vmw_buffer_object? */
8afa13a0583f94 Zack Rusin       2021-12-06  797  	if (vmw_bo_is_vmw_bo(bo))
e9431ea5076a91 Thomas Hellstrom 2018-06-19  798  		return;
e9431ea5076a91 Thomas Hellstrom 2018-06-19  799  
e9431ea5076a91 Thomas Hellstrom 2018-06-19  800  	/* Kill any cached kernel maps before swapout */
e9431ea5076a91 Thomas Hellstrom 2018-06-19  801  	vmw_bo_unmap(vmw_buffer_object(bo));
e9431ea5076a91 Thomas Hellstrom 2018-06-19  802  }
e9431ea5076a91 Thomas Hellstrom 2018-06-19  803  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
