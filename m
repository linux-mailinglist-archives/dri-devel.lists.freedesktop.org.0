Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB3F4FBBDE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 14:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A2A10E07C;
	Mon, 11 Apr 2022 12:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7AF10E05E;
 Mon, 11 Apr 2022 12:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649679300; x=1681215300;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tdrqEUjkjtyZJixAdSQaVyuOJBEwrEFX1i2jBgmQrg0=;
 b=JECeyWIHRK6g3x+3qTpo3Brjt1NG+tBaYGVQKH5CnHuMbG3pq0Wsh7Or
 0ftE1aE7tx3Jo8KjvxQ4kPKVZxrwYqyq/MnnprKzfD3HwDlQngMcTS8t/
 l8dNx1kIVnnc14kbT+8ZdAxP2Yc03bO6qRianD1wyat/w/C/GH4h7uhSc
 GvMiZXZt7H1nzDz21EfuonVYqCv37flIDv3pG67jZdm3oRjyaKwg19RYe
 zYg3BuJjoR7h0Zv9xSRV6pOcRGvDLvjD8n4NjKRytOk4rREqpJr5KaEsW
 N/x26dvUT0e6s9JhE4X3cnD/9PyF9+0UzfvwVTQOn96U0r65RMzB52GjC Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="260947057"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="260947057"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 05:15:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="525954234"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 11 Apr 2022 05:14:58 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ndswc-0001pn-4G;
 Mon, 11 Apr 2022 12:14:58 +0000
Date: Mon, 11 Apr 2022 20:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [CI v2 12/12] drm/edid: add EDID block count and
 size helpers
Message-ID: <202204112055.cUmakJdJ-lkp@intel.com>
References: <44265d5a3f64e9d7ad9984fee766f68d0b8bd473.1649670305.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44265d5a3f64e9d7ad9984fee766f68d0b8bd473.1649670305.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20220411]
[cannot apply to drm/drm-next drm-intel/for-linux-next v5.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-edid-low-level-EDID-block-read-refactoring-etc/20220411-175027
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220411/202204112055.cUmakJdJ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ba74d3cc8cc1b6ba4c34a039e797994ddbc77567
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jani-Nikula/drm-edid-low-level-EDID-block-read-refactoring-etc/20220411-175027
        git checkout ba74d3cc8cc1b6ba4c34a039e797994ddbc77567
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_edid.c: In function 'drm_do_get_edid':
>> drivers/gpu/drm/drm_edid.c:1664:21: warning: array subscript [128, 32640] is outside array bounds of 'struct edid[1]' [-Warray-bounds]
    1664 |         return block[0];
         |                ~~~~~^~~
   drivers/gpu/drm/drm_edid.c:2173:15: note: referencing an object of size 128 allocated by 'krealloc'
    2173 |         new = krealloc(edid, edid_size(edid), GFP_KERNEL);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1664 drivers/gpu/drm/drm_edid.c

c465bbc87ce372 Stefan Brüns 2014-11-30  1659  
4ba0f53ce685b0 Jani Nikula  2022-03-31  1660  static int edid_block_tag(const void *_block)
4ba0f53ce685b0 Jani Nikula  2022-03-31  1661  {
4ba0f53ce685b0 Jani Nikula  2022-03-31  1662  	const u8 *block = _block;
4ba0f53ce685b0 Jani Nikula  2022-03-31  1663  
4ba0f53ce685b0 Jani Nikula  2022-03-31 @1664  	return block[0];
4ba0f53ce685b0 Jani Nikula  2022-03-31  1665  }
4ba0f53ce685b0 Jani Nikula  2022-03-31  1666  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
