Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A62D659070A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 21:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC71A112A3D;
	Thu, 11 Aug 2022 19:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F99411B9F4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 19:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660246807; x=1691782807;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JrHMpkoBZh27P11JevwdKfsKx3Z7Su64n/hfX/1tiQI=;
 b=YE4joN+PbsuEfwSkbNsxx4RUFeO9Vuqh7TIWdnPZdTDYkX/08gkjlaiT
 RWS7NNDMcouoZaZQobmVq94AC7qLRavgKnWWOseyqTZCndoUHpLCOAkzQ
 bUTn7mtwiZu9Dq+FMPt9/dWM7K/ansDdXA0smgmWN1hYpwZAoPynlXeaw
 kz1VEqlAGUruqwBQExiJ1jBayTlvaZfLzj4XjZwHlnNq873FLtTDG2o9u
 W6KDarUlQQkfw/KKRbbBeJIIguKFgdcJ9yHXi/jmME/AXazstRlEcvhyL
 b4SG6N4R3lkK2+qiPtnesDagJftIrBoQyr5mxULb7aLyqeXb1HOsl7QEL g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="377737466"
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; d="scan'208";a="377737466"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 12:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; d="scan'208";a="556265575"
Received: from lkp-server02.sh.intel.com (HELO cfab306db114) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 11 Aug 2022 12:40:04 -0700
Received: from kbuild by cfab306db114 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oME2F-0000ap-1G;
 Thu, 11 Aug 2022 19:40:03 +0000
Date: Fri, 12 Aug 2022 03:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: oushixiong <oushixiong@kylinos.cn>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH] drm/ast: radeon amdgpu for ast add prime
Message-ID: <202208120345.REoTpw1K-lkp@intel.com>
References: <20220809114439.2063863-1-oushixiong@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809114439.2063863-1-oushixiong@kylinos.cn>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi oushixiong,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next linus/master v5.19 next-20220811]
[cannot apply to drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/oushixiong/drm-ast-radeon-amdgpu-for-ast-add-prime/20220811-115710
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20220812/202208120345.REoTpw1K-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/1b9b79a00132f2917ca66bea714a6f21fc939b0f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review oushixiong/drm-ast-radeon-amdgpu-for-ast-add-prime/20220811-115710
        git checkout 1b9b79a00132f2917ca66bea714a6f21fc939b0f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/ast/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/ast/ast_drv.c:43:5: sparse: sparse: symbol 'ast_modeset' was not declared. Should it be static?
>> drivers/gpu/drm/ast/ast_drv.c:54:23: sparse: sparse: symbol 'ast_gem_prime_import_sg_table' was not declared. Should it be static?
--
   drivers/gpu/drm/ast/ast_mode.c:681:19: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/ast/ast_mode.c:681:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *dstxor @@     got unsigned char [usertype] * @@
   drivers/gpu/drm/ast/ast_mode.c:681:16: sparse:     expected unsigned char [noderef] [usertype] __iomem *dstxor
   drivers/gpu/drm/ast/ast_mode.c:681:16: sparse:     got unsigned char [usertype] *
>> drivers/gpu/drm/ast/ast_mode.c:1759:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void * @@
   drivers/gpu/drm/ast/ast_mode.c:1759:33: sparse:     expected void volatile [noderef] __iomem *
   drivers/gpu/drm/ast/ast_mode.c:1759:33: sparse:     got void *
>> drivers/gpu/drm/ast/ast_mode.c:1713:5: sparse: sparse: symbol 'ast_handle_damage' was not declared. Should it be static?
>> drivers/gpu/drm/ast/ast_mode.c:1814:24: sparse: sparse: symbol 'ast_gem_fb_create_with_dirty' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
