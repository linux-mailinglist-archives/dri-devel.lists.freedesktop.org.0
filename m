Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5F24A4510
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 12:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26B810E3A3;
	Mon, 31 Jan 2022 11:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229F610E3A0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 11:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643629055; x=1675165055;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YH9mnECyA607HZu3Pb+ZC9SZcUp5u25AqmDHnTVCQu8=;
 b=GjPJzutesN1K14oKmLl3tt12QzffHfdaPjHaQ7ZENCp2JbQEDsm8rmul
 8/6cuwuIl9QxDXaZ8NT4cIfU7Nywu0hitd4v61kWBVsojRO7GRtS+5vjG
 22Q2oSKjWrU0YRq1+dIbAxp6pQUOwVd7JxNLfS7nmBSDIrsR/FBY2BKpX
 ZlAKBKPAnRH19FC5d/aEsAWD2nEY24loMBh1K+nLaepRdEflUO3YoZwNL
 qX/qEQ6FJYIYPG+z7ul7hgfz9g1CsNcrU7VsTx2OKjqUAnXyJqhRArX53
 J9ZmBX07cLMkEBHR3STuyslNR2XAeg+OUBWhZnBk0S12HjM8dpjKyDGRu Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="310753786"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="310753786"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 03:37:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="564953337"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 31 Jan 2022 03:37:22 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nEUzq-000Rr1-3I; Mon, 31 Jan 2022 11:37:22 +0000
Date: Mon, 31 Jan 2022 19:36:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yizhuo Zhai <yzhai003@ucr.edu>
Subject: Re: [PATCH] fbdev: fbmem: Fix the implicit type casting
Message-ID: <202201311936.5edxEvQY-lkp@intel.com>
References: <20220131065719.1552958-1-yzhai003@ucr.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131065719.1552958-1-yzhai003@ucr.edu>
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
Cc: linux-fbdev@vger.kernel.org, kbuild-all@lists.01.org,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Yizhuo Zhai <yzhai003@ucr.edu>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yizhuo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.17-rc2 next-20220131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yizhuo-Zhai/fbdev-fbmem-Fix-the-implicit-type-casting/20220131-150528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 26291c54e111ff6ba87a164d85d4a4e134b7315c
config: riscv-randconfig-r042-20220130 (https://download.01.org/0day-ci/archive/20220131/202201311936.5edxEvQY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b8f540468e70290c8278fc2611adc2f9b38f821f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Yizhuo-Zhai/fbdev-fbmem-Fix-the-implicit-type-casting/20220131-150528
        git checkout b8f540468e70290c8278fc2611adc2f9b38f821f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash drivers/video/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/core/fbmem.c:1067:1: error: conflicting types for 'fb_blank'; have 'int(struct fb_info *, long unsigned int)'
    1067 | fb_blank(struct fb_info *info, unsigned long blank)
         | ^~~~~~~~
   In file included from drivers/video/fbdev/core/fbmem.c:34:
   include/linux/fb.h:591:12: note: previous declaration of 'fb_blank' with type 'int(struct fb_info *, int)'
     591 | extern int fb_blank(struct fb_info *info, int blank);
         |            ^~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:17,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from arch/riscv/include/asm/mmiowb.h:12,
                    from arch/riscv/include/asm/mmio.h:15,
                    from arch/riscv/include/asm/clint.h:10,
                    from arch/riscv/include/asm/timex.h:15,
                    from include/linux/timex.h:65,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/video/fbdev/core/fbmem.c:14:
   drivers/video/fbdev/core/fbmem.c:1086:15: error: conflicting types for 'fb_blank'; have 'int(struct fb_info *, long unsigned int)'
    1086 | EXPORT_SYMBOL(fb_blank);
         |               ^~~~~~~~
   include/linux/export.h:98:28: note: in definition of macro '___EXPORT_SYMBOL'
      98 |         extern typeof(sym) sym;                                                 \
         |                            ^~~
   include/linux/export.h:160:41: note: in expansion of macro '__EXPORT_SYMBOL'
     160 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:163:41: note: in expansion of macro '_EXPORT_SYMBOL'
     163 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbmem.c:1086:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1086 | EXPORT_SYMBOL(fb_blank);
         | ^~~~~~~~~~~~~
   In file included from drivers/video/fbdev/core/fbmem.c:34:
   include/linux/fb.h:591:12: note: previous declaration of 'fb_blank' with type 'int(struct fb_info *, int)'
     591 | extern int fb_blank(struct fb_info *info, int blank);
         |            ^~~~~~~~


vim +1067 drivers/video/fbdev/core/fbmem.c

  1065	
  1066	int
> 1067	fb_blank(struct fb_info *info, unsigned long blank)
  1068	{
  1069		struct fb_event event;
  1070		int ret = -EINVAL;
  1071	
  1072		if (blank > FB_BLANK_POWERDOWN)
  1073			blank = FB_BLANK_POWERDOWN;
  1074	
  1075		event.info = info;
  1076		event.data = &blank;
  1077	
  1078		if (info->fbops->fb_blank)
  1079			ret = info->fbops->fb_blank(blank, info);
  1080	
  1081		if (!ret)
  1082			fb_notifier_call_chain(FB_EVENT_BLANK, &event);
  1083	
  1084		return ret;
  1085	}
  1086	EXPORT_SYMBOL(fb_blank);
  1087	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
