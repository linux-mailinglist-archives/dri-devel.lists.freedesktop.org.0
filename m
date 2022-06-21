Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B520552A53
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 06:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB8A10F832;
	Tue, 21 Jun 2022 04:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C4510F81E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 04:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655786316; x=1687322316;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w52u60xyH32SPDjtHdPrjV/3isxQYl4S8lnKBTVLceM=;
 b=GJ1vouHoHB9bogifpDsb2/rQ4W5jdxqGqMLV+xX+TRERK9jWILSGB9Lb
 U+9Rz2kBk5MpowK/2ck5yLZG/rjZA35hyfXVvfA/URrUKhnPGGRXphsjg
 sv/IejfPKJQyC60fwojMq19bq2do4lc6hhPzwfH/OIp7EERFsqM7XBsc8
 HiTflJ9YFuJpKRTNQSKuZxbCikLvkTh8XB+0DIz5EvY6xD/zTMtfXmj3F
 TarOUJDMiapGaS8RYDedRVhN6U6BpFYy5SqhUkhlhII+a5gdPgI0qLAad
 BJ2wNsf7ilI3Nr7TI5a8kMRMmahrHe9x23Mq1jC/V4KnPqKC+8iLMRIPo w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="259846554"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="259846554"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 21:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="689756979"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2022 21:38:33 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o3Veq-000YII-Ss;
 Tue, 21 Jun 2022 04:38:32 +0000
Date: Tue, 21 Jun 2022 12:37:52 +0800
From: kernel test robot <lkp@intel.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH] drm: Make drm_buddy a part of drm module
Message-ID: <202206211209.5H0Eh2ff-lkp@intel.com>
References: <20220621015151.11129-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621015151.11129-1-cai.huoqing@linux.dev>
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
Cc: kbuild-all@lists.01.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Cai,

I love your patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on linus/master v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cai-Huoqing/drm-Make-drm_buddy-a-part-of-drm-module/20220621-095417
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20220621/202206211209.5H0Eh2ff-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/517d5f44c861a5173eaa9a06efebe2ce2a6601a1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cai-Huoqing/drm-Make-drm_buddy-a-part-of-drm-module/20220621-095417
        git checkout 517d5f44c861a5173eaa9a06efebe2ce2a6601a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/drm_buddy.o: in function `drm_buddy_print':
>> drivers/gpu/drm/drm_buddy.c:745: undefined reference to `drm_printf'
>> ld: drivers/gpu/drm/drm_buddy.c:757: undefined reference to `drm_printf'
   ld: drivers/gpu/drm/drm_buddy.c:763: undefined reference to `drm_printf'
   ld: drivers/gpu/drm/drm_buddy.c:765: undefined reference to `drm_printf'
   ld: drivers/gpu/drm/drm_buddy.c:761: undefined reference to `drm_printf'
   ld: drivers/gpu/drm/drm_buddy.o:drivers/gpu/drm/drm_buddy.c:757: more undefined references to `drm_printf' follow


vim +745 drivers/gpu/drm/drm_buddy.c

6387a3c4b0c45a Arunpravin 2022-01-18  734  
6387a3c4b0c45a Arunpravin 2022-01-18  735  /**
6387a3c4b0c45a Arunpravin 2022-01-18  736   * drm_buddy_print - print allocator state
6387a3c4b0c45a Arunpravin 2022-01-18  737   *
6387a3c4b0c45a Arunpravin 2022-01-18  738   * @mm: DRM buddy manager
6387a3c4b0c45a Arunpravin 2022-01-18  739   * @p: DRM printer to use
6387a3c4b0c45a Arunpravin 2022-01-18  740   */
6387a3c4b0c45a Arunpravin 2022-01-18  741  void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
6387a3c4b0c45a Arunpravin 2022-01-18  742  {
6387a3c4b0c45a Arunpravin 2022-01-18  743  	int order;
6387a3c4b0c45a Arunpravin 2022-01-18  744  
6387a3c4b0c45a Arunpravin 2022-01-18 @745  	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB\n",
6387a3c4b0c45a Arunpravin 2022-01-18  746  		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
6387a3c4b0c45a Arunpravin 2022-01-18  747  
6387a3c4b0c45a Arunpravin 2022-01-18  748  	for (order = mm->max_order; order >= 0; order--) {
6387a3c4b0c45a Arunpravin 2022-01-18  749  		struct drm_buddy_block *block;
6387a3c4b0c45a Arunpravin 2022-01-18  750  		u64 count = 0, free;
6387a3c4b0c45a Arunpravin 2022-01-18  751  
6387a3c4b0c45a Arunpravin 2022-01-18  752  		list_for_each_entry(block, &mm->free_list[order], link) {
6387a3c4b0c45a Arunpravin 2022-01-18  753  			BUG_ON(!drm_buddy_block_is_free(block));
6387a3c4b0c45a Arunpravin 2022-01-18  754  			count++;
6387a3c4b0c45a Arunpravin 2022-01-18  755  		}
6387a3c4b0c45a Arunpravin 2022-01-18  756  
6387a3c4b0c45a Arunpravin 2022-01-18 @757  		drm_printf(p, "order-%d ", order);
6387a3c4b0c45a Arunpravin 2022-01-18  758  
6387a3c4b0c45a Arunpravin 2022-01-18  759  		free = count * (mm->chunk_size << order);
6387a3c4b0c45a Arunpravin 2022-01-18  760  		if (free < SZ_1M)
6387a3c4b0c45a Arunpravin 2022-01-18  761  			drm_printf(p, "free: %lluKiB", free >> 10);
6387a3c4b0c45a Arunpravin 2022-01-18  762  		else
6387a3c4b0c45a Arunpravin 2022-01-18  763  			drm_printf(p, "free: %lluMiB", free >> 20);
6387a3c4b0c45a Arunpravin 2022-01-18  764  
6387a3c4b0c45a Arunpravin 2022-01-18  765  		drm_printf(p, ", pages: %llu\n", count);
6387a3c4b0c45a Arunpravin 2022-01-18  766  	}
6387a3c4b0c45a Arunpravin 2022-01-18  767  }
6387a3c4b0c45a Arunpravin 2022-01-18  768  EXPORT_SYMBOL(drm_buddy_print);
6387a3c4b0c45a Arunpravin 2022-01-18  769  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
