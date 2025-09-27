Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FD5BA616A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 18:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18C110E0CB;
	Sat, 27 Sep 2025 16:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFN1G0sf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8048010E0CB
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 16:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758989584; x=1790525584;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O2se9tcFwdGBniBb7bdIWHL/pjxrbvplf1HxXPO5P8c=;
 b=lFN1G0sfOVG5xq6gN2S0R9TSv+dNLcbAYqlJZbjqKf/NQ+b6HQSYDX95
 BaGrYm/N1KaCh1tei4YYNtexNIBv/LVsMGGpULB6rf7DxTtex0M+ZvMAa
 SKf8fea++JquXc+oOx6uXAluCcOCFXm01p+8Q7k/5uVF+Zs5SqmqKahjZ
 n+oCsbuK89cyq7vFSkDAWa8ACn/VdG9oi2UqdvMO6dpYo9+FbDhztjp/7
 iH0Nh1dNwB/v67+D4vjUtN47H7dM2SN6yMt9DafQDNh26w8dDnTGRsGOO
 /fbi/yPvi7MmKdSCqSYODCm47ddfESpnan6D+A9dEW+kevKQZVZm884fw w==;
X-CSE-ConnectionGUID: FqIT36EqQqWK7DLch/6n8Q==
X-CSE-MsgGUID: 5j0MFleQQlaDDMXupZNcbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="63928302"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208";a="63928302"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 09:13:03 -0700
X-CSE-ConnectionGUID: C/Q8PvakT/+xQLIPmEYxcA==
X-CSE-MsgGUID: ODe5s3/fTvWJl3x7+jf24w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208";a="208591696"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 27 Sep 2025 09:12:59 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v2XXc-0007B1-37;
 Sat, 27 Sep 2025 16:12:56 +0000
Date: Sun, 28 Sep 2025 00:12:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sukrut Heroorkar <hsukrut3@gmail.com>, Helge Deller <deller@gmx.de>,
 Bernie Thompson <bernie@plugable.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
Message-ID: <202509272320.3K8kdDCw-lkp@intel.com>
References: <20250924175743.6790-1-hsukrut3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924175743.6790-1-hsukrut3@gmail.com>
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

Hi Sukrut,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.17-rc7 next-20250926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sukrut-Heroorkar/fbdev-udlfb-make-CONFIG_FB_DEVICE-optional/20250925-015939
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250924175743.6790-1-hsukrut3%40gmail.com
patch subject: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
config: x86_64-randconfig-001-20250927 (https://download.01.org/0day-ci/archive/20250927/202509272320.3K8kdDCw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272320.3K8kdDCw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509272320.3K8kdDCw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/udlfb.c:345:16: error: no member named 'dev' in 'struct fb_info'
     345 |         dev_dbg(info->dev, "mmap() framebuffer addr:%lu size:%lu\n",
         |                 ~~~~  ^
   include/linux/dev_printk.h:171:28: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                   ^~~
   include/linux/dev_printk.h:139:23: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                            ^~~
   drivers/video/fbdev/udlfb.c:933:16: error: no member named 'dev' in 'struct fb_info'
     933 |         dev_dbg(info->dev, "open, user=%d fb_info=%p count=%d\n",
         |                 ~~~~  ^
   include/linux/dev_printk.h:171:28: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                   ^~~
   include/linux/dev_printk.h:139:23: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                            ^~~
   drivers/video/fbdev/udlfb.c:986:16: error: no member named 'dev' in 'struct fb_info'
     986 |         dev_dbg(info->dev, "release, user=%d count=%d\n", user, dlfb->fb_count);
         |                 ~~~~  ^
   include/linux/dev_printk.h:171:28: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                   ^~~
   include/linux/dev_printk.h:139:23: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                            ^~~
   drivers/video/fbdev/udlfb.c:1099:16: error: no member named 'dev' in 'struct fb_info'
    1099 |         dev_dbg(info->dev, "blank, mode %d --> %d\n",
         |                 ~~~~  ^
   include/linux/dev_printk.h:171:28: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                   ^~~
   include/linux/dev_printk.h:139:23: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                            ^~~
   drivers/video/fbdev/udlfb.c:1193:18: error: no member named 'dev' in 'struct fb_info'
    1193 |                         dev_err(info->dev, "Virtual framebuffer alloc failed\n");
         |                                 ~~~~  ^
   include/linux/dev_printk.h:154:44: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                   ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/video/fbdev/udlfb.c:1217:19: error: no member named 'dev' in 'struct fb_info'
    1217 |                         dev_info(info->dev,
         |                                  ~~~~  ^
   include/linux/dev_printk.h:160:46: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/video/fbdev/udlfb.c:1251:12: error: no member named 'dev' in 'struct fb_info'
    1251 |         if (info->dev) {
         |             ~~~~  ^
   drivers/video/fbdev/udlfb.c:1255:15: error: no member named 'dev' in 'struct fb_info'
    1255 |                 dev = info->dev;
         |                       ~~~~  ^
   drivers/video/fbdev/udlfb.c:1379:12: error: no member named 'dev' in 'struct fb_info'
    1379 |         if (info->dev)
         |             ~~~~  ^
   drivers/video/fbdev/udlfb.c:1720:40: error: no member named 'dev' in 'struct fb_info'
    1720 |         retval = device_create_bin_file(info->dev, &edid_attr);
         |                                         ~~~~  ^
   drivers/video/fbdev/udlfb.c:1727:19: error: no member named 'dev' in 'struct fb_info'
    1727 |                  dev_name(info->dev), info->var.xres, info->var.yres,
         |                           ~~~~  ^
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/video/fbdev/udlfb.c:1767:31: error: no member named 'dev' in 'struct fb_info'
    1767 |         device_remove_bin_file(info->dev, &edid_attr);
         |                                ~~~~  ^
   12 errors generated.


vim +345 drivers/video/fbdev/udlfb.c

59277b679f8b5c drivers/staging/udlfb/udlfb.c Bernie Thompson    2009-11-24  323  
4574203f45eb26 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  324  static int dlfb_ops_mmap(struct fb_info *info, struct vm_area_struct *vma)
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  325  {
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  326  	unsigned long start = vma->vm_start;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  327  	unsigned long size = vma->vm_end - vma->vm_start;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  328  	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  329  	unsigned long page, pos;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  330  
5905585103276b drivers/video/fbdev/udlfb.c   Thomas Zimmermann  2022-04-29  331  	if (info->fbdefio)
5905585103276b drivers/video/fbdev/udlfb.c   Thomas Zimmermann  2022-04-29  332  		return fb_deferred_io_mmap(info, vma);
5905585103276b drivers/video/fbdev/udlfb.c   Thomas Zimmermann  2022-04-29  333  
76f92201b821dd drivers/video/fbdev/udlfb.c   Thomas Zimmermann  2023-11-27  334  	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
76f92201b821dd drivers/video/fbdev/udlfb.c   Thomas Zimmermann  2023-11-27  335  
04f8afbec37f63 drivers/video/udlfb.c         Tomi Valkeinen     2013-04-18  336  	if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
04f8afbec37f63 drivers/video/udlfb.c         Tomi Valkeinen     2013-04-18  337  		return -EINVAL;
04f8afbec37f63 drivers/video/udlfb.c         Tomi Valkeinen     2013-04-18  338  	if (size > info->fix.smem_len)
04f8afbec37f63 drivers/video/udlfb.c         Tomi Valkeinen     2013-04-18  339  		return -EINVAL;
04f8afbec37f63 drivers/video/udlfb.c         Tomi Valkeinen     2013-04-18  340  	if (offset > info->fix.smem_len - size)
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  341  		return -EINVAL;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  342  
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  343  	pos = (unsigned long)info->fix.smem_start + offset;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  344  
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16 @345  	dev_dbg(info->dev, "mmap() framebuffer addr:%lu size:%lu\n",
2685cffa9e7992 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  346  		pos, size);
2685cffa9e7992 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  347  
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  348  	while (size > 0) {
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  349  		page = vmalloc_to_pfn((void *)pos);
f05e0575ed334a drivers/staging/udlfb/udlfb.c Greg Kroah-Hartman 2009-06-03  350  		if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  351  			return -EAGAIN;
f05e0575ed334a drivers/staging/udlfb/udlfb.c Greg Kroah-Hartman 2009-06-03  352  
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  353  		start += PAGE_SIZE;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  354  		pos += PAGE_SIZE;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  355  		if (size > PAGE_SIZE)
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  356  			size -= PAGE_SIZE;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  357  		else
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  358  			size = 0;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  359  	}
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  360  
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  361  	return 0;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  362  }
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  363  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
