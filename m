Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A94F10C612
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 10:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEFD6E219;
	Thu, 28 Nov 2019 09:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1946E02A;
 Thu, 28 Nov 2019 09:37:19 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 01:37:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,253,1571727600"; 
 d="gz'50?scan'50,208,50";a="410638511"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 28 Nov 2019 01:37:17 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iaGEf-0008yw-2Z; Thu, 28 Nov 2019 17:37:17 +0800
Date: Thu, 28 Nov 2019 17:36:31 +0800
From: kbuild test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 08/13] video: fbdev: make fbops member of struct fb_info
 a const pointer
Message-ID: <201911281711.rSum4Zgz%lkp@intel.com>
References: <b0ff7235e8c941d6b9fcc28d5e49ceeb92d56828.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="6tpfpefskvxcmd4n"
Content-Disposition: inline
In-Reply-To: <b0ff7235e8c941d6b9fcc28d5e49ceeb92d56828.1574871797.git.jani.nikula@intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: jani.nikula@intel.com, linux-fbdev@vger.kernel.org, kbuild-all@lists.01.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6tpfpefskvxcmd4n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jani,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on v5.4 next-20191127]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Jani-Nikula/video-drm-constify-fbops-in-struct-fb_info/20191128-022047
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-s1-20191128 (attached as .config)
compiler: gcc-7 (Debian 7.4.0-14) 7.4.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/video/fbdev/uvesafb.c: In function 'uvesafb_init_info':
>> drivers/video/fbdev/uvesafb.c:1443:25: error: assignment of member 'fb_blank' in read-only object
      info->fbops->fb_blank = NULL;
                            ^
>> drivers/video/fbdev/uvesafb.c:1513:31: error: assignment of member 'fb_pan_display' in read-only object
      info->fbops->fb_pan_display = NULL;
                                  ^
--
   drivers/video/fbdev/mb862xx/mb862xxfb_accel.c: In function 'mb862xxfb_init_accel':
>> drivers/video/fbdev/mb862xx/mb862xxfb_accel.c:311:28: error: assignment of member 'fb_fillrect' in read-only object
      info->fbops->fb_fillrect = cfb_fillrect;
                               ^
>> drivers/video/fbdev/mb862xx/mb862xxfb_accel.c:312:28: error: assignment of member 'fb_copyarea' in read-only object
      info->fbops->fb_copyarea = cfb_copyarea;
                               ^
>> drivers/video/fbdev/mb862xx/mb862xxfb_accel.c:313:29: error: assignment of member 'fb_imageblit' in read-only object
      info->fbops->fb_imageblit = cfb_imageblit;
                                ^
   drivers/video/fbdev/mb862xx/mb862xxfb_accel.c:316:28: error: assignment of member 'fb_fillrect' in read-only object
      info->fbops->fb_fillrect = mb86290fb_fillrect;
                               ^
   drivers/video/fbdev/mb862xx/mb862xxfb_accel.c:317:28: error: assignment of member 'fb_copyarea' in read-only object
      info->fbops->fb_copyarea = mb86290fb_copyarea;
                               ^
   drivers/video/fbdev/mb862xx/mb862xxfb_accel.c:318:29: error: assignment of member 'fb_imageblit' in read-only object
      info->fbops->fb_imageblit = mb86290fb_imageblit;
                                ^
--
   drivers/video/fbdev/nvidia/nvidia.c: In function 'nvidiafb_set_par':
>> drivers/video/fbdev/nvidia/nvidia.c:663:29: error: assignment of member 'fb_imageblit' in read-only object
      info->fbops->fb_imageblit = nvidiafb_imageblit;
                                ^
>> drivers/video/fbdev/nvidia/nvidia.c:664:28: error: assignment of member 'fb_fillrect' in read-only object
      info->fbops->fb_fillrect = nvidiafb_fillrect;
                               ^
>> drivers/video/fbdev/nvidia/nvidia.c:665:28: error: assignment of member 'fb_copyarea' in read-only object
      info->fbops->fb_copyarea = nvidiafb_copyarea;
                               ^
>> drivers/video/fbdev/nvidia/nvidia.c:666:24: error: assignment of member 'fb_sync' in read-only object
      info->fbops->fb_sync = nvidiafb_sync;
                           ^
   drivers/video/fbdev/nvidia/nvidia.c:672:29: error: assignment of member 'fb_imageblit' in read-only object
      info->fbops->fb_imageblit = cfb_imageblit;
                                ^
   drivers/video/fbdev/nvidia/nvidia.c:673:28: error: assignment of member 'fb_fillrect' in read-only object
      info->fbops->fb_fillrect = cfb_fillrect;
                               ^
   drivers/video/fbdev/nvidia/nvidia.c:674:28: error: assignment of member 'fb_copyarea' in read-only object
      info->fbops->fb_copyarea = cfb_copyarea;
                               ^
   drivers/video/fbdev/nvidia/nvidia.c:675:24: error: assignment of member 'fb_sync' in read-only object
      info->fbops->fb_sync = NULL;
                           ^
   drivers/video/fbdev/nvidia/nvidia.c: In function 'nvidia_set_fbinfo':
>> drivers/video/fbdev/nvidia/nvidia.c:1168:29: error: assignment of member 'fb_cursor' in read-only object
         info->fbops->fb_cursor = NULL;
                                ^

vim +/fb_blank +1443 drivers/video/fbdev/uvesafb.c

8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1427  
48c68c4f1b5424 drivers/video/uvesafb.c       Greg Kroah-Hartman 2012-12-21  1428  static void uvesafb_init_info(struct fb_info *info, struct vbe_mode_ib *mode)
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1429  {
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1430  	unsigned int size_vmode;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1431  	unsigned int size_remap;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1432  	unsigned int size_total;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1433  	struct uvesafb_par *par = info->par;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1434  	int i, h;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1435  
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1436  	info->pseudo_palette = ((u8 *)info->par + sizeof(struct uvesafb_par));
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1437  	info->fix = uvesafb_fix;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1438  	info->fix.ypanstep = par->ypan ? 1 : 0;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1439  	info->fix.ywrapstep = (par->ypan > 1) ? 1 : 0;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1440  
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1441  	/* Disable blanking if the user requested so. */
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1442  	if (!blank)
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16 @1443  		info->fbops->fb_blank = NULL;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1444  
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1445  	/*
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1446  	 * Find out how much IO memory is required for the mode with
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1447  	 * the highest resolution.
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1448  	 */
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1449  	size_remap = 0;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1450  	for (i = 0; i < par->vbe_modes_cnt; i++) {
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1451  		h = par->vbe_modes[i].bytes_per_scan_line *
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1452  					par->vbe_modes[i].y_res;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1453  		if (h > size_remap)
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1454  			size_remap = h;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1455  	}
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1456  	size_remap *= 2;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1457  
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1458  	/*
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1459  	 *   size_vmode -- that is the amount of memory needed for the
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1460  	 *                 used video mode, i.e. the minimum amount of
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1461  	 *                 memory we need.
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1462  	 */
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1463  	size_vmode = info->var.yres * mode->bytes_per_scan_line;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1464  
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1465  	/*
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1466  	 *   size_total -- all video memory we have. Used for mtrr
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1467  	 *                 entries, resource allocation and bounds
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1468  	 *                 checking.
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1469  	 */
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1470  	size_total = par->vbe_ib.total_memory * 65536;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1471  	if (vram_total)
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1472  		size_total = vram_total * 1024 * 1024;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1473  	if (size_total < size_vmode)
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1474  		size_total = size_vmode;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1475  
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1476  	/*
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1477  	 *   size_remap -- the amount of video memory we are going to
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1478  	 *                 use for vesafb.  With modern cards it is no
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1479  	 *                 option to simply use size_total as th
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1480  	 *                 wastes plenty of kernel address space.
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1481  	 */
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1482  	if (vram_remap)
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1483  		size_remap = vram_remap * 1024 * 1024;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1484  	if (size_remap < size_vmode)
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1485  		size_remap = size_vmode;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1486  	if (size_remap > size_total)
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1487  		size_remap = size_total;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1488  
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1489  	info->fix.smem_len = size_remap;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1490  	info->fix.smem_start = mode->phys_base_ptr;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1491  
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1492  	/*
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1493  	 * We have to set yres_virtual here because when setup_var() was
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1494  	 * called, smem_len wasn't defined yet.
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1495  	 */
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1496  	info->var.yres_virtual = info->fix.smem_len /
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1497  				 mode->bytes_per_scan_line;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1498  
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1499  	if (par->ypan && info->var.yres_virtual > info->var.yres) {
a8feae09110675 drivers/video/fbdev/uvesafb.c Joe Perches        2017-06-14  1500  		pr_info("scrolling: %s using protected mode interface, yres_virtual=%d\n",
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1501  			(par->ypan > 1) ? "ywrap" : "ypan",
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1502  			info->var.yres_virtual);
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1503  	} else {
a8feae09110675 drivers/video/fbdev/uvesafb.c Joe Perches        2017-06-14  1504  		pr_info("scrolling: redraw\n");
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1505  		info->var.yres_virtual = info->var.yres;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1506  		par->ypan = 0;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1507  	}
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1508  
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1509  	info->flags = FBINFO_FLAG_DEFAULT |
1cc9fb6dbf915e drivers/video/uvesafb.c       Roel Kluin         2009-03-31  1510  			(par->ypan ? FBINFO_HWACCEL_YPAN : 0);
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1511  
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1512  	if (!par->ypan)
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16 @1513  		info->fbops->fb_pan_display = NULL;
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1514  }
8bdb3a2d7df48b drivers/video/uvesafb.c       Michal Januszewski 2007-10-16  1515  

:::::: The code at line 1443 was first introduced by commit
:::::: 8bdb3a2d7df48b861972c4bfb58490853a228f51 uvesafb: the driver core

:::::: TO: Michal Januszewski <spock@gentoo.org>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--6tpfpefskvxcmd4n
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
vo5/xSgeu4jsAQA=

--6tpfpefskvxcmd4n
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--6tpfpefskvxcmd4n--
