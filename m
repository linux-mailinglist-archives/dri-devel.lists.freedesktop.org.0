Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 802D45BA377
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 02:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164D410EC37;
	Fri, 16 Sep 2022 00:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D6410EC37;
 Fri, 16 Sep 2022 00:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663287781; x=1694823781;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DsplFUFECkFFHGJgLVl4kYJYra7mGZGyjzGrKuIfWyU=;
 b=CCFCI/ttglbAA8Nqeii6Z5PHz4PM5cfoX2cnTHUkCEHtv2VbMgtHqrZY
 PtpQzG3/t++rHeA6slBoW8AvbgPRDB9j9fu15loeZfJPPr0bbSFA3xh51
 EpEo2Qi1UWPGsMBNQoUJaOVWJNbqwH1NdpJ1ryHQSlWDv4oznA5Xd8Esl
 Mu9g1/mQKi9gXT6QDRMqloPV20kW4Ukk8KQFkNGgQAghyDGa2tSYBSW+F
 ai+LPhEgKCePltIoSjEKT/jynnPl8wspwmY2jMVWp37IU+CPB1IZe6glB
 67rH368emkD+eeqoWjxv0LUwPxm1WICb/jURMh+ZAVQKdjf7t78H4/HWV A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="298868505"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="298868505"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 17:23:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="685937009"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 15 Sep 2022 17:22:58 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oYz8E-0001DH-01;
 Fri, 16 Sep 2022 00:22:58 +0000
Date: Fri, 16 Sep 2022 08:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Subject: Re: [PATCH] drm/etnaviv: don't truncate physical page address
Message-ID: <202209160813.srwkRhUH-lkp@intel.com>
References: <20220915141941.3408991-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915141941.3408991-1-l.stach@pengutronix.de>
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.0-rc5 next-20220915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Stach/drm-etnaviv-don-t-truncate-physical-page-address/20220915-222156
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20220916/202209160813.srwkRhUH-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/941356fb766e7f49216d44f0df7614c2e4610a11
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lucas-Stach/drm-etnaviv-don-t-truncate-physical-page-address/20220915-222156
        git checkout 941356fb766e7f49216d44f0df7614c2e4610a11
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:40,
                    from drivers/gpu/drm/etnaviv/etnaviv_drv.h:16,
                    from drivers/gpu/drm/etnaviv/etnaviv_mmu.c:11:
   drivers/gpu/drm/etnaviv/etnaviv_mmu.c: In function 'etnaviv_iommu_map':
>> drivers/gpu/drm/etnaviv/etnaviv_mmu.c:86:22: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'phys_addr_t' {aka 'long long unsigned int'} [-Wformat=]
      86 |                 VERB("map[%d]: %08x %08x(%zx)", i, iova, pa, bytes);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~           ~~
         |                                                          |
         |                                                          phys_addr_t {aka long long unsigned int}
   include/drm/drm_print.h:526:32: note: in definition of macro 'DRM_DEBUG'
     526 |         __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
         |                                ^~~
   drivers/gpu/drm/etnaviv/etnaviv_mmu.c:86:17: note: in expansion of macro 'VERB'
      86 |                 VERB("map[%d]: %08x %08x(%zx)", i, iova, pa, bytes);
         |                 ^~~~
   drivers/gpu/drm/etnaviv/etnaviv_mmu.c:86:40: note: format string is defined here
      86 |                 VERB("map[%d]: %08x %08x(%zx)", i, iova, pa, bytes);
         |                                     ~~~^
         |                                        |
         |                                        unsigned int
         |                                     %08llx
   {standard input}: Assembler messages:
   {standard input}:2347: Error: Register number out of range 0..3
   {standard input}:2347: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 40
   {standard input}:2347: Warning: Only the first path encountering the conflict is reported
   {standard input}:2342: Warning: This is the location of the conflicting usage
   {standard input}:2348: Error: Register number out of range 0..3
   {standard input}:2348: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 40
   {standard input}:2348: Warning: Only the first path encountering the conflict is reported
   {standard input}:2342: Warning: This is the location of the conflicting usage
   {standard input}:2348: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 40
   {standard input}:2348: Warning: Only the first path encountering the conflict is reported
   {standard input}:2347: Warning: This is the location of the conflicting usage
   {standard input}:2351: Error: Register number out of range 0..3
   {standard input}:2352: Error: Register number out of range 0..3
   {standard input}:2352: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 40
   {standard input}:2352: Warning: Only the first path encountering the conflict is reported
   {standard input}:2351: Warning: This is the location of the conflicting usage
   {standard input}:2532: Error: Register number out of range 0..2
   {standard input}:2532: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:2532: Warning: Only the first path encountering the conflict is reported
   {standard input}:2528: Warning: This is the location of the conflicting usage
   {standard input}:2533: Error: Register number out of range 0..2
   {standard input}:2533: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:2533: Warning: Only the first path encountering the conflict is reported
   {standard input}:2528: Warning: This is the location of the conflicting usage
   {standard input}:2533: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:2533: Warning: Only the first path encountering the conflict is reported
   {standard input}:2532: Warning: This is the location of the conflicting usage
   {standard input}:2534: Error: Register number out of range 0..2
   {standard input}:2534: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:2534: Warning: Only the first path encountering the conflict is reported
   {standard input}:2528: Warning: This is the location of the conflicting usage
   {standard input}:2534: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:2534: Warning: Only the first path encountering the conflict is reported
   {standard input}:2532: Warning: This is the location of the conflicting usage
   {standard input}:2534: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:2534: Warning: Only the first path encountering the conflict is reported
   {standard input}:2533: Warning: This is the location of the conflicting usage
   {standard input}:2537: Error: Register number out of range 0..2
   {standard input}:2538: Error: Register number out of range 0..2
   {standard input}:2538: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:2538: Warning: Only the first path encountering the conflict is reported
   {standard input}:2537: Warning: This is the location of the conflicting usage
   {standard input}:3788: Error: Register number out of range 0..4
   {standard input}:3788: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 38
   {standard input}:3788: Warning: Only the first path encountering the conflict is reported
   {standard input}:3782: Warning: This is the location of the conflicting usage
   {standard input}:3791: Error: Register number out of range 0..4
   {standard input}:3792: Error: Register number out of range 0..4
   {standard input}:3792: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 38
   {standard input}:3792: Warning: Only the first path encountering the conflict is reported
   {standard input}:3791: Warning: This is the location of the conflicting usage


vim +86 drivers/gpu/drm/etnaviv/etnaviv_mmu.c

50073cf98d1635 Lucas Stach         2017-09-07   71  
27b67278e007b5 Lucas Stach         2019-07-05   72  static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
a8c21a5451d831 The etnaviv authors 2015-12-03   73  			     struct sg_table *sgt, unsigned len, int prot)
27b67278e007b5 Lucas Stach         2019-07-05   74  {	struct scatterlist *sg;
a8c21a5451d831 The etnaviv authors 2015-12-03   75  	unsigned int da = iova;
182354a526a054 Marek Szyprowski    2020-04-28   76  	unsigned int i;
a8c21a5451d831 The etnaviv authors 2015-12-03   77  	int ret;
a8c21a5451d831 The etnaviv authors 2015-12-03   78  
27b67278e007b5 Lucas Stach         2019-07-05   79  	if (!context || !sgt)
a8c21a5451d831 The etnaviv authors 2015-12-03   80  		return -EINVAL;
a8c21a5451d831 The etnaviv authors 2015-12-03   81  
182354a526a054 Marek Szyprowski    2020-04-28   82  	for_each_sgtable_dma_sg(sgt, sg, i) {
941356fb766e7f Lucas Stach         2022-09-15   83  		phys_addr_t pa = sg_dma_address(sg) - sg->offset;
a8c21a5451d831 The etnaviv authors 2015-12-03   84  		size_t bytes = sg_dma_len(sg) + sg->offset;
a8c21a5451d831 The etnaviv authors 2015-12-03   85  
a8c21a5451d831 The etnaviv authors 2015-12-03  @86  		VERB("map[%d]: %08x %08x(%zx)", i, iova, pa, bytes);
a8c21a5451d831 The etnaviv authors 2015-12-03   87  
27b67278e007b5 Lucas Stach         2019-07-05   88  		ret = etnaviv_context_map(context, da, pa, bytes, prot);
a8c21a5451d831 The etnaviv authors 2015-12-03   89  		if (ret)
a8c21a5451d831 The etnaviv authors 2015-12-03   90  			goto fail;
a8c21a5451d831 The etnaviv authors 2015-12-03   91  
a8c21a5451d831 The etnaviv authors 2015-12-03   92  		da += bytes;
a8c21a5451d831 The etnaviv authors 2015-12-03   93  	}
a8c21a5451d831 The etnaviv authors 2015-12-03   94  
9247fcca3982a2 Lucas Stach         2022-03-23   95  	context->flush_seq++;
9247fcca3982a2 Lucas Stach         2022-03-23   96  
a8c21a5451d831 The etnaviv authors 2015-12-03   97  	return 0;
a8c21a5451d831 The etnaviv authors 2015-12-03   98  
a8c21a5451d831 The etnaviv authors 2015-12-03   99  fail:
182354a526a054 Marek Szyprowski    2020-04-28  100  	etnaviv_context_unmap(context, iova, da - iova);
a8c21a5451d831 The etnaviv authors 2015-12-03  101  	return ret;
a8c21a5451d831 The etnaviv authors 2015-12-03  102  }
a8c21a5451d831 The etnaviv authors 2015-12-03  103  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
