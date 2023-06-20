Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD63737363
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 20:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1A910E31F;
	Tue, 20 Jun 2023 18:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027FB10E30E;
 Tue, 20 Jun 2023 18:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687284037; x=1718820037;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+7jzJ1ReF/NIBA8mwG7FWSzFhInFBgl1juSzfSpnXrY=;
 b=jhY1vGE70tCj+YaWFrN85g/uESoRHTJJx3dcMoE4AtxNIA4Hq/ohfA/r
 eDOnffhwKwfKbyZctch5mzpr3ukoWQxH1rZEPrYAUV4MtpoLgUTwVDuSs
 wjbY53hD0HxhB526t2D5jWO8k4F7mlE4TQHnzpfyuYT+5dYxRZsCgJo9G
 mH3wFOvndrf0JssFPAyYm6qzwhhcCAtg3Euj1C9Cf0bLR5gz1VK2R6RBO
 eWqppU8En1X4/ZJytXlPNh3AHlIVcXz0kD7rkO+lAq2B4r7ueHQG7sfDd
 UtanLc3afqJUU8XkKVeDYyfDon/nu4qCeSELFocL16kgN+3Nv3bnQLGdX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="359952511"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="359952511"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 11:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="804036825"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="804036825"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jun 2023 11:00:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qBfeY-00066q-3D;
 Tue, 20 Jun 2023 18:00:31 +0000
Date: Wed, 21 Jun 2023 02:00:10 +0800
From: kernel test robot <lkp@intel.com>
To: Su Hui <suhui@nfschina.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: Re: [PATCH] drm/amd/amdgpu: =?utf-8?Q?Use_?=
 =?utf-8?B?4oCcX19wYWNrZWTigJw=?= instead of "pragma pack()"
Message-ID: <202306210140.tAwPw0SG-lkp@intel.com>
References: <20230620085543.576733-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230620085543.576733-1-suhui@nfschina.com>
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
Cc: Su Hui <suhui@nfschina.com>, Jane.Jian@amd.com, David.Francis@amd.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, Likun.Gao@amd.com, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Su,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.4-rc7 next-20230620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Su-Hui/drm-amd-amdgpu-Use-__packed-instead-of-pragma-pack/20230620-165739
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230620085543.576733-1-suhui%40nfschina.com
patch subject: [PATCH] drm/amd/amdgpu: Use “__packed“ instead of "pragma pack()"
config: openrisc-randconfig-s051-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210140.tAwPw0SG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210140.tAwPw0SG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210140.tAwPw0SG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__pu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse:     expected unsigned int [noderef] __user *__pu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__pu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse:     expected unsigned int [noderef] __user *__pu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__pu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse:     expected unsigned int [noderef] __user *__pu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:579:42: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__gu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse:     expected unsigned int const [noderef] __user *__gu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__pu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse:     expected unsigned int [noderef] __user *__pu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__gu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse:     expected unsigned int const [noderef] __user *__gu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__pu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse:     expected unsigned int [noderef] __user *__pu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__gu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse:     expected unsigned int const [noderef] __user *__gu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:330:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct amdgpu_debugfs_regs2_iocdata_v2 * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:330:46: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:330:46: sparse:     got struct amdgpu_debugfs_regs2_iocdata_v2 *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:336:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct amdgpu_debugfs_regs2_iocdata * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:336:47: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:336:47: sparse:     got struct amdgpu_debugfs_regs2_iocdata *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__pu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse:     expected unsigned int [noderef] __user *__pu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:488:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct amdgpu_debugfs_gprwave_iocdata * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:488:37: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:488:37: sparse:     got struct amdgpu_debugfs_gprwave_iocdata *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__pu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse:     expected unsigned int [noderef] __user *__pu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__gu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse:     expected unsigned int const [noderef] __user *__gu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__pu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse:     expected unsigned int [noderef] __user *__pu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:711:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:711:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:711:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__gu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:711:21: sparse:     expected unsigned int const [noderef] __user *__gu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:711:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:711:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:711:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:711:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__pu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse:     expected unsigned int [noderef] __user *__pu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:824:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:824:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:824:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__gu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:824:21: sparse:     expected unsigned int const [noderef] __user *__gu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:824:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:824:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:824:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:824:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__pu_addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse:     expected unsigned int [noderef] __user *__pu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1003:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1003:29: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1003:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected signed int [noderef] __user *__pu_addr @@     got signed int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1003:29: sparse:     expected signed int [noderef] __user *__pu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1003:29: sparse:     got signed int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1003:29: sparse: sparse: too many warnings
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1808:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1808:25: sparse:    struct dma_fence [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1808:25: sparse:    struct dma_fence *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1809:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1809:17: sparse:    struct dma_fence [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1809:17: sparse:    struct dma_fence *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1868:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1868:17: sparse:    struct dma_fence [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1868:17: sparse:    struct dma_fence *
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:171:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:171:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:171:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:171:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:171:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:171:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:309:18: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:309:18: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:309:18: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:309:18: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:309:18: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:309:18: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:312:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[addressable] cpu_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:312:29: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:312:29: sparse:     got void *[addressable] cpu_addr
--
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:574:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *ptr @@
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:574:59: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:574:59: sparse:     got void *ptr
>> drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:623:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *ptr @@
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:623:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:623:37: sparse:     got void *ptr
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:1081:27: sparse: sparse: symbol 'vce_v4_0_ip_funcs' was not declared. Should it be static?
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:275:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:275:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:275:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:275:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:275:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:275:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:280:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:280:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:280:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:280:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:280:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:280:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:281:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:281:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:281:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:281:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:281:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:281:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:306:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:306:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:306:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:306:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:306:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:306:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:307:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:307:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:307:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:307:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:307:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:307:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:308:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:308:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:308:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:308:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:308:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:308:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:314:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:314:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:314:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:314:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:314:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:314:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:320:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:320:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:320:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:320:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:320:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:320:28: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:458:75: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:458:75: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:458:75: sparse:     got void *[assigned] ptr
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:487:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:487:45: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:487:45: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:42: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:500:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *cpu_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:500:70: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:500:70: sparse:     got void *cpu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:501:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:501:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:501:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:501:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:501:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:501:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:504:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:504:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:504:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:504:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:504:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:504:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:505:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:505:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:505:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:505:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:505:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:505:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:507:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:507:35: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:507:35: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:769:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:769:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:769:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:769:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:769:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:769:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1204:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1204:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1204:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1205:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1205:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1205:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1206:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1206:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1206:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1207:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1207:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1207:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1208:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1208:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1208:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1209:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1209:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1209:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1210:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1210:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1210:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1211:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1211:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1211:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1212:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1212:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1212:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1213:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1213:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1213:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1214:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1214:17: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1214:17: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1216:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1216:24: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1216:24: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1240:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1240:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1240:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1241:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1241:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1241:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1242:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1242:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1242:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1243:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1243:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1243:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1245:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1245:24: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1245:24: sparse:     got restricted __le32 [usertype]
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:139:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:139:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:139:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:139:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:139:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:139:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:147:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:147:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:147:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:147:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:147:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:147:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:151:26: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:151:26: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:151:26: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:151:26: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:151:26: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:151:26: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:152:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:152:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:152:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:152:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:152:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:152:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:154:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:154:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:154:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:154:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:154:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:154:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:155:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:155:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:155:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:155:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:155:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:155:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:161:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:161:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:161:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:161:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:161:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:161:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:162:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:162:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:162:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:162:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:162:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:162:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:163:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:163:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:163:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:163:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:163:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:163:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:170:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:170:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:170:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:170:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:170:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:170:28: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:311:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:311:67: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:311:67: sparse:     got void *[assigned] ptr
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:335:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:335:45: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:335:45: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:346:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:346:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:346:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:346:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:346:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:346:42: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:348:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *cpu_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:348:70: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:348:70: sparse:     got void *cpu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:349:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:349:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:349:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:349:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:349:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:349:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:352:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:352:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:352:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:352:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:352:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:352:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:353:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:353:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:353:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:353:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:353:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:353:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:355:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:355:35: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:355:35: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:583:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:583:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:583:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:584:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:584:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:584:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:585:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:585:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:585:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:586:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:586:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:586:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:587:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:587:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:587:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:588:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:588:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:588:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:589:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:589:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:589:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:590:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:590:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:590:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:591:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:591:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:591:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:592:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:592:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:592:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:593:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:593:17: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:593:17: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:594:17: sparse: sparse: too many warnings
--
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:65:25: sparse: sparse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:74:26: sparse: sparse: cast to restricted __be32
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:411:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *kaddr @@
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:411:44: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:411:44: sparse:     got void *kaddr
--
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2343:60: sparse: sparse: cast to restricted __be32
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1455:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] fps_high_t @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1455:32: sparse:     expected unsigned short [usertype] fps_high_t
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1455:32: sparse:     got restricted __be16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1463:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] fps_low_t @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1463:31: sparse:     expected unsigned char [usertype] fps_low_t
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1463:31: sparse:     got restricted __be16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:675:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] SclkFrequency @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:675:49: sparse:     expected unsigned int [usertype] SclkFrequency
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:675:49: sparse:     got restricted __be32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:703:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] MinVddNb @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:703:44: sparse:     expected unsigned int [usertype] MinVddNb
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:703:44: sparse:     got restricted __be32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:713:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] AT @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:713:38: sparse:     expected unsigned short [usertype] AT
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:713:38: sparse:     got restricted __be16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:788:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] low_sclk_interrupt_t @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:788:38: sparse:     expected unsigned int [usertype] low_sclk_interrupt_t
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:788:38: sparse:     got restricted __be32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:920:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] VclkFrequency @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:920:48: sparse:     expected unsigned int [usertype] VclkFrequency
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:920:48: sparse:     got restricted __be32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:921:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] DclkFrequency @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:921:48: sparse:     expected unsigned int [usertype] DclkFrequency
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:921:48: sparse:     got restricted __be32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:922:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] MinVddNb @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:922:43: sparse:     expected unsigned short [usertype] MinVddNb
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:922:43: sparse:     got restricted __be16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:991:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] Frequency @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:991:44: sparse:     expected unsigned int [usertype] Frequency
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:991:44: sparse:     got restricted __be32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:992:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] MinVoltage @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:992:45: sparse:     expected unsigned short [usertype] MinVoltage
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:992:45: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1054:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] Frequency @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1054:45: sparse:     expected unsigned int [usertype] Frequency
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1054:45: sparse:     got restricted __be32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1055:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] MinVoltage @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1055:46: sparse:     expected unsigned short [usertype] MinVoltage
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1055:46: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1116:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] Frequency @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1116:44: sparse:     expected unsigned int [usertype] Frequency
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1116:44: sparse:     got restricted __be32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1117:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] MinVoltage @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1117:45: sparse:     expected unsigned short [usertype] MinVoltage
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1117:45: sparse:     got restricted __be16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2580:44: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2580:44: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2580:44: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2580:44: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2580:44: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2580:44: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2581:47: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2581:47: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2581:47: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2581:47: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2581:47: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2581:47: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2583:25: sparse: sparse: cast to restricted __le16
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2583:25: sparse: sparse: cast to restricted __le16
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2583:25: sparse: sparse: cast to restricted __le16
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2583:25: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2596:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2596:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2596:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2596:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2596:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2596:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2603:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2603:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2603:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2603:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2603:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2603:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2605:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2605:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2605:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2605:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2605:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2605:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2607:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2607:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2607:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2607:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2607:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2607:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2662:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2662:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2662:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2662:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2662:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2662:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2663:22: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2663:22: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2663:22: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2663:22: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2664:23: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2664:23: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2664:23: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2664:23: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2667:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2667:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2667:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2667:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2667:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2667:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2668:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2668:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2668:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2668:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2668:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2668:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2691:16: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2691:16: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2691:16: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2691:16: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2730:18: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2730:18: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2730:18: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2730:18: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2733:18: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2733:18: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2733:18: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2733:18: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2736:18: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2736:18: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2736:18: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2736:18: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2785:24: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2785:24: sparse: sparse: too many warnings

vim +485 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c

d38ceaf99ed015 Alex Deucher    2015-04-20  460  
4f4824b55650fa Tom St Denis    2016-04-27  461  /* Layout of file is 12 bytes consisting of
4f4824b55650fa Tom St Denis    2016-04-27  462   * - rptr
4f4824b55650fa Tom St Denis    2016-04-27  463   * - wptr
4f4824b55650fa Tom St Denis    2016-04-27  464   * - driver's copy of wptr
4f4824b55650fa Tom St Denis    2016-04-27  465   *
4f4824b55650fa Tom St Denis    2016-04-27  466   * followed by n-words of ring data
4f4824b55650fa Tom St Denis    2016-04-27  467   */
4f4824b55650fa Tom St Denis    2016-04-27  468  static ssize_t amdgpu_debugfs_ring_read(struct file *f, char __user *buf,
4f4824b55650fa Tom St Denis    2016-04-27  469  					size_t size, loff_t *pos)
d38ceaf99ed015 Alex Deucher    2015-04-20  470  {
450630975da9e7 Al Viro         2016-12-04  471  	struct amdgpu_ring *ring = file_inode(f)->i_private;
4f4824b55650fa Tom St Denis    2016-04-27  472  	int r, i;
4f4824b55650fa Tom St Denis    2016-04-27  473  	uint32_t value, result, early[3];
d38ceaf99ed015 Alex Deucher    2015-04-20  474  
c71dbd93eb0039 Tom St Denis    2016-05-02  475  	if (*pos & 3 || size & 3)
4f4824b55650fa Tom St Denis    2016-04-27  476  		return -EINVAL;
d38ceaf99ed015 Alex Deucher    2015-04-20  477  
4f4824b55650fa Tom St Denis    2016-04-27  478  	result = 0;
c7e6be2303d0b6 Christian König 2016-01-21  479  
4f4824b55650fa Tom St Denis    2016-04-27  480  	if (*pos < 12) {
9c5c71bbed4132 Tom St Denis    2018-03-01  481  		early[0] = amdgpu_ring_get_rptr(ring) & ring->buf_mask;
ec63982e90a879 Tom St Denis    2017-03-29  482  		early[1] = amdgpu_ring_get_wptr(ring) & ring->buf_mask;
ec63982e90a879 Tom St Denis    2017-03-29  483  		early[2] = ring->wptr & ring->buf_mask;
4f4824b55650fa Tom St Denis    2016-04-27  484  		for (i = *pos / 4; i < 3 && size; i++) {
4f4824b55650fa Tom St Denis    2016-04-27 @485  			r = put_user(early[i], (uint32_t *)buf);
4f4824b55650fa Tom St Denis    2016-04-27  486  			if (r)
4f4824b55650fa Tom St Denis    2016-04-27  487  				return r;
4f4824b55650fa Tom St Denis    2016-04-27  488  			buf += 4;
4f4824b55650fa Tom St Denis    2016-04-27  489  			result += 4;
4f4824b55650fa Tom St Denis    2016-04-27  490  			size -= 4;
4f4824b55650fa Tom St Denis    2016-04-27  491  			*pos += 4;
4f4824b55650fa Tom St Denis    2016-04-27  492  		}
4f4824b55650fa Tom St Denis    2016-04-27  493  	}
d38ceaf99ed015 Alex Deucher    2015-04-20  494  
4f4824b55650fa Tom St Denis    2016-04-27  495  	while (size) {
4f4824b55650fa Tom St Denis    2016-04-27  496  		if (*pos >= (ring->ring_size + 12))
4f4824b55650fa Tom St Denis    2016-04-27  497  			return result;
d38ceaf99ed015 Alex Deucher    2015-04-20  498  
4f4824b55650fa Tom St Denis    2016-04-27  499  		value = ring->ring[(*pos - 12)/4];
4f4824b55650fa Tom St Denis    2016-04-27  500  		r = put_user(value, (uint32_t *)buf);
4f4824b55650fa Tom St Denis    2016-04-27  501  		if (r)
4f4824b55650fa Tom St Denis    2016-04-27  502  			return r;
4f4824b55650fa Tom St Denis    2016-04-27  503  		buf += 4;
4f4824b55650fa Tom St Denis    2016-04-27  504  		result += 4;
4f4824b55650fa Tom St Denis    2016-04-27  505  		size -= 4;
4f4824b55650fa Tom St Denis    2016-04-27  506  		*pos += 4;
d38ceaf99ed015 Alex Deucher    2015-04-20  507  	}
4f4824b55650fa Tom St Denis    2016-04-27  508  
4f4824b55650fa Tom St Denis    2016-04-27  509  	return result;
d38ceaf99ed015 Alex Deucher    2015-04-20  510  }
d38ceaf99ed015 Alex Deucher    2015-04-20  511  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
