Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC3FBA524D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 22:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDCB10E138;
	Fri, 26 Sep 2025 20:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3TuC0Ma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A0B10E138
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 20:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758920388; x=1790456388;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sNCodXqEmQFaYCfsxt0ELHUv+m60xMT+PRGqW9XnCL4=;
 b=N3TuC0MaF21enBUbnNfi3OrBWIddaQpeMpm2LOSl28Os3C0Fn/K6pQTM
 sD7PibwEOCUuqLGxvse99mjWg3SxObpujDYICQj0KmW4/BLANZf+ce0lq
 l4MUCEvhiM029njs0ajDneTHaNRY2aigynuDCaqHPEOZ6fdIzmBJa/RS4
 QbfBVNp1k7f7WtuI1nZrPxPno8mX8J0yl8Kt+9ORsrYtzczRS9Gg+aF54
 ji+VIMZgFkQzJobcb1jXmoV5l16IYA9jBi98RMiuax9NwpZ7al9Oc+UaB
 8ZRQjP4WDjE+YN7i5Z5gzu9f/KGltgc30bLMsj8mpee8VSR51Lf2Qd36M g==;
X-CSE-ConnectionGUID: w6QBi4B4SxCOeDyunnzkJg==
X-CSE-MsgGUID: urwFYiH7Tdi5j7Z/43136A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61172330"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61172330"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 13:59:47 -0700
X-CSE-ConnectionGUID: 4heqwK6GSqCBM7+GNuJ6Kg==
X-CSE-MsgGUID: EpWZWgcdQoW4g7rQqNphGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177641642"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 26 Sep 2025 13:59:42 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v2FXY-0006bD-0V;
 Fri, 26 Sep 2025 20:59:40 +0000
Date: Sat, 27 Sep 2025 04:58:56 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
Message-ID: <202509270454.lBuADO4l-lkp@intel.com>
References: <20250924175743.6790-1-hsukrut3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.17-rc7 next-20250926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sukrut-Heroorkar/fbdev-udlfb-make-CONFIG_FB_DEVICE-optional/20250925-015939
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250924175743.6790-1-hsukrut3%40gmail.com
patch subject: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
config: x86_64-randconfig-075-20250927 (https://download.01.org/0day-ci/archive/20250927/202509270454.lBuADO4l-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509270454.lBuADO4l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509270454.lBuADO4l-lkp@intel.com/

All warnings (new ones prefixed by >>):

     933 |         dev_dbg(info->dev, "open, user=%d fb_info=%p count=%d\n",
         |                     ^~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/video/fbdev/udlfb.c:933:9: note: in expansion of macro 'dev_dbg'
     933 |         dev_dbg(info->dev, "open, user=%d fb_info=%p count=%d\n",
         |         ^~~~~~~
   drivers/video/fbdev/udlfb.c: In function 'dlfb_ops_release':
   drivers/video/fbdev/udlfb.c:986:21: error: 'struct fb_info' has no member named 'dev'
     986 |         dev_dbg(info->dev, "release, user=%d count=%d\n", user, dlfb->fb_count);
         |                     ^~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/video/fbdev/udlfb.c:986:9: note: in expansion of macro 'dev_dbg'
     986 |         dev_dbg(info->dev, "release, user=%d count=%d\n", user, dlfb->fb_count);
         |         ^~~~~~~
   drivers/video/fbdev/udlfb.c: In function 'dlfb_ops_blank':
   drivers/video/fbdev/udlfb.c:1099:21: error: 'struct fb_info' has no member named 'dev'
    1099 |         dev_dbg(info->dev, "blank, mode %d --> %d\n",
         |                     ^~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/video/fbdev/udlfb.c:1099:9: note: in expansion of macro 'dev_dbg'
    1099 |         dev_dbg(info->dev, "blank, mode %d --> %d\n",
         |         ^~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/usb.h:19,
                    from drivers/video/fbdev/udlfb.c:19:
   drivers/video/fbdev/udlfb.c: In function 'dlfb_realloc_framebuffer':
   drivers/video/fbdev/udlfb.c:1193:37: error: 'struct fb_info' has no member named 'dev'
    1193 |                         dev_err(info->dev, "Virtual framebuffer alloc failed\n");
         |                                     ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/video/fbdev/udlfb.c:1193:25: note: in expansion of macro 'dev_err'
    1193 |                         dev_err(info->dev, "Virtual framebuffer alloc failed\n");
         |                         ^~~~~~~
   drivers/video/fbdev/udlfb.c:1217:38: error: 'struct fb_info' has no member named 'dev'
    1217 |                         dev_info(info->dev,
         |                                      ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/video/fbdev/udlfb.c:1217:25: note: in expansion of macro 'dev_info'
    1217 |                         dev_info(info->dev,
         |                         ^~~~~~~~
   drivers/video/fbdev/udlfb.c: In function 'dlfb_setup_modes':
   drivers/video/fbdev/udlfb.c:1251:17: error: 'struct fb_info' has no member named 'dev'
    1251 |         if (info->dev) {
         |                 ^~
   drivers/video/fbdev/udlfb.c:1255:27: error: 'struct fb_info' has no member named 'dev'
    1255 |                 dev = info->dev;
         |                           ^~
   drivers/video/fbdev/udlfb.c:1379:17: error: 'struct fb_info' has no member named 'dev'
    1379 |         if (info->dev)
         |                 ^~
   drivers/video/fbdev/udlfb.c: In function 'dlfb_usb_probe':
   drivers/video/fbdev/udlfb.c:1720:45: error: 'struct fb_info' has no member named 'dev'
    1720 |         retval = device_create_bin_file(info->dev, &edid_attr);
         |                                             ^~
   drivers/video/fbdev/udlfb.c:1727:31: error: 'struct fb_info' has no member named 'dev'
    1727 |                  dev_name(info->dev), info->var.xres, info->var.yres,
         |                               ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/video/fbdev/udlfb.c:1725:9: note: in expansion of macro 'dev_info'
    1725 |         dev_info(info->device,
         |         ^~~~~~~~
>> drivers/video/fbdev/udlfb.c:1605:40: warning: unused variable 'attr' [-Wunused-variable]
    1605 |         const struct device_attribute *attr;
         |                                        ^~~~
>> drivers/video/fbdev/udlfb.c:1604:13: warning: unused variable 'i' [-Wunused-variable]
    1604 |         int i;
         |             ^
   drivers/video/fbdev/udlfb.c: In function 'dlfb_usb_disconnect':
   drivers/video/fbdev/udlfb.c:1767:36: error: 'struct fb_info' has no member named 'dev'
    1767 |         device_remove_bin_file(info->dev, &edid_attr);
         |                                    ^~
   drivers/video/fbdev/udlfb.c:1746:13: warning: unused variable 'i' [-Wunused-variable]
    1746 |         int i;
         |             ^
   drivers/video/fbdev/udlfb.c: At top level:
>> drivers/video/fbdev/udlfb.c:1468:16: warning: 'metrics_reset_store' defined but not used [-Wunused-function]
    1468 | static ssize_t metrics_reset_store(struct device *fbdev,
         |                ^~~~~~~~~~~~~~~~~~~


vim +/attr +1605 drivers/video/fbdev/udlfb.c

7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1467  
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15 @1468  static ssize_t metrics_reset_store(struct device *fbdev,
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1469  			   struct device_attribute *attr,
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1470  			   const char *buf, size_t count)
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1471  {
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1472  	struct fb_info *fb_info = dev_get_drvdata(fbdev);
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1473  	struct dlfb_data *dlfb = fb_info->par;
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1474  
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1475  	atomic_set(&dlfb->bytes_rendered, 0);
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1476  	atomic_set(&dlfb->bytes_identical, 0);
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1477  	atomic_set(&dlfb->bytes_sent, 0);
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1478  	atomic_set(&dlfb->cpu_kcycles_used, 0);
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1479  
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1480  	return count;
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1481  }
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1482  
598b2eedfc3fbe drivers/video/fbdev/udlfb.c   Bhumika Goyal      2017-08-18  1483  static const struct bin_attribute edid_attr = {
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1484  	.attr.name = "edid",
8ef8cc4fca4a92 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1485  	.attr.mode = 0666,
b9f03a3cd06c6f drivers/video/udlfb.c         Paul Mundt         2011-01-06  1486  	.size = EDID_LENGTH,
2fbe82037ab251 drivers/video/fbdev/udlfb.c   Thomas Weißschuh   2025-05-30  1487  	.read = edid_show,
2fbe82037ab251 drivers/video/fbdev/udlfb.c   Thomas Weißschuh   2025-05-30  1488  	.write = edid_store
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1489  };
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1490  
00bab805c21a22 drivers/video/fbdev/udlfb.c   Sukrut Heroorkar   2025-09-24  1491  #ifdef CONFIG_FB_DEVICE
fa738a5c4b2a6b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1492  static const struct device_attribute fb_device_attrs[] = {
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1493  	__ATTR_RO(metrics_bytes_rendered),
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1494  	__ATTR_RO(metrics_bytes_identical),
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1495  	__ATTR_RO(metrics_bytes_sent),
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1496  	__ATTR_RO(metrics_cpu_kcycles_used),
926c11151e3b82 drivers/staging/udlfb/udlfb.c Greg Kroah-Hartman 2010-11-18  1497  	__ATTR(metrics_reset, S_IWUSR, NULL, metrics_reset_store),
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1498  };
00bab805c21a22 drivers/video/fbdev/udlfb.c   Sukrut Heroorkar   2025-09-24  1499  #endif
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1500  
cc403dc67d10b8 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1501  /*
cc403dc67d10b8 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1502   * This is necessary before we can communicate with the display controller.
cc403dc67d10b8 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1503   */
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1504  static int dlfb_select_std_channel(struct dlfb_data *dlfb)
cc403dc67d10b8 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1505  {
cc403dc67d10b8 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1506  	int ret;
45f580c42e5c12 drivers/video/fbdev/udlfb.c   Maksim Salau       2017-05-02  1507  	static const u8 set_def_chn[] = {
45f580c42e5c12 drivers/video/fbdev/udlfb.c   Maksim Salau       2017-05-02  1508  				0x57, 0xCD, 0xDC, 0xA7,
cc403dc67d10b8 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1509  				0x1C, 0x88, 0x5E, 0x15,
cc403dc67d10b8 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1510  				0x60, 0xFE, 0xC6, 0x97,
cc403dc67d10b8 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1511  				0x16, 0x3D, 0x47, 0xF2  };
cc403dc67d10b8 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1512  
537adba4083ed8 drivers/video/fbdev/udlfb.c   Helge Deller       2023-05-19  1513  	ret = usb_control_msg_send(dlfb->udev, 0, NR_USB_REQUEST_CHANNEL,
cc403dc67d10b8 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1514  			(USB_DIR_OUT | USB_TYPE_VENDOR), 0, 0,
537adba4083ed8 drivers/video/fbdev/udlfb.c   Helge Deller       2023-05-19  1515  			&set_def_chn, sizeof(set_def_chn), USB_CTRL_SET_TIMEOUT,
537adba4083ed8 drivers/video/fbdev/udlfb.c   Helge Deller       2023-05-19  1516  			GFP_KERNEL);
45f580c42e5c12 drivers/video/fbdev/udlfb.c   Maksim Salau       2017-05-02  1517  
cc403dc67d10b8 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1518  	return ret;
cc403dc67d10b8 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1519  }
cc403dc67d10b8 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1520  
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1521  static int dlfb_parse_vendor_descriptor(struct dlfb_data *dlfb,
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1522  					struct usb_interface *intf)
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1523  {
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1524  	char *desc;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1525  	char *buf;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1526  	char *desc_end;
f63cb8d7aa31e7 drivers/video/fbdev/udlfb.c   Alexey Klimov      2015-06-08  1527  	int total_len;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1528  
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1529  	buf = kzalloc(MAX_VENDOR_DESCRIPTOR_SIZE, GFP_KERNEL);
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1530  	if (!buf)
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1531  		return false;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1532  	desc = buf;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1533  
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1534  	total_len = usb_get_descriptor(interface_to_usbdev(intf),
f2e1fc9d5d12fb drivers/video/udlfb.c         Andrew Kephart     2011-08-21  1535  					0x5f, /* vendor specific */
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1536  					0, desc, MAX_VENDOR_DESCRIPTOR_SIZE);
f2e1fc9d5d12fb drivers/video/udlfb.c         Andrew Kephart     2011-08-21  1537  
f2e1fc9d5d12fb drivers/video/udlfb.c         Andrew Kephart     2011-08-21  1538  	/* if not found, look in configuration descriptor */
f2e1fc9d5d12fb drivers/video/udlfb.c         Andrew Kephart     2011-08-21  1539  	if (total_len < 0) {
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1540  		if (0 == usb_get_extra_descriptor(intf->cur_altsetting,
f2e1fc9d5d12fb drivers/video/udlfb.c         Andrew Kephart     2011-08-21  1541  			0x5f, &desc))
f2e1fc9d5d12fb drivers/video/udlfb.c         Andrew Kephart     2011-08-21  1542  			total_len = (int) desc[0];
f2e1fc9d5d12fb drivers/video/udlfb.c         Andrew Kephart     2011-08-21  1543  	}
f2e1fc9d5d12fb drivers/video/udlfb.c         Andrew Kephart     2011-08-21  1544  
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1545  	if (total_len > 5) {
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1546  		dev_info(&intf->dev,
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1547  			 "vendor descriptor length: %d data: %11ph\n",
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1548  			 total_len, desc);
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1549  
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1550  		if ((desc[0] != total_len) || /* descriptor length */
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1551  		    (desc[1] != 0x5f) ||   /* vendor descriptor type */
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1552  		    (desc[2] != 0x01) ||   /* version (2 bytes) */
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1553  		    (desc[3] != 0x00) ||
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1554  		    (desc[4] != total_len - 2)) /* length after type */
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1555  			goto unrecognized;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1556  
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1557  		desc_end = desc + total_len;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1558  		desc += 5; /* the fixed header we've already parsed */
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1559  
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1560  		while (desc < desc_end) {
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1561  			u8 length;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1562  			u16 key;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1563  
115e77597efcc9 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-03-12  1564  			key = *desc++;
115e77597efcc9 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-03-12  1565  			key |= (u16)*desc++ << 8;
115e77597efcc9 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-03-12  1566  			length = *desc++;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1567  
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1568  			switch (key) {
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1569  			case 0x0200: { /* max_area */
115e77597efcc9 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-03-12  1570  				u32 max_area = *desc++;
115e77597efcc9 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-03-12  1571  				max_area |= (u32)*desc++ << 8;
115e77597efcc9 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-03-12  1572  				max_area |= (u32)*desc++ << 16;
115e77597efcc9 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-03-12  1573  				max_area |= (u32)*desc++ << 24;
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1574  				dev_warn(&intf->dev,
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1575  					 "DL chip limited to %d pixel modes\n",
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1576  					 max_area);
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1577  				dlfb->sku_pixel_limit = max_area;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1578  				break;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1579  			}
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1580  			default:
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1581  				break;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1582  			}
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1583  			desc += length;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1584  		}
f2e1fc9d5d12fb drivers/video/udlfb.c         Andrew Kephart     2011-08-21  1585  	} else {
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1586  		dev_info(&intf->dev, "vendor descriptor not available (%d)\n",
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1587  			 total_len);
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1588  	}
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1589  
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1590  	goto success;
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1591  
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1592  unrecognized:
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1593  	/* allow udlfb to load for now even if firmware unrecognized */
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1594  	dev_err(&intf->dev, "Unrecognized vendor firmware descriptor\n");
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1595  
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1596  success:
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1597  	kfree(buf);
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1598  	return true;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1599  }
8d21547d3c9c3b drivers/video/udlfb.c         Bernie Thompson    2012-03-01  1600  
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1601  static int dlfb_usb_probe(struct usb_interface *intf,
59277b679f8b5c drivers/staging/udlfb/udlfb.c Bernie Thompson    2009-11-24  1602  			  const struct usb_device_id *id)
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1603  {
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08 @1604  	int i;
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08 @1605  	const struct device_attribute *attr;
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1606  	struct dlfb_data *dlfb;
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1607  	struct fb_info *info;
aaf7dbe07385e0 drivers/video/fbdev/udlfb.c   Pavel Skripkin     2022-03-22  1608  	int retval;
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1609  	struct usb_device *usbdev = interface_to_usbdev(intf);
ed9de4ed398757 drivers/video/fbdev/udlfb.c   Alan Stern         2023-05-19  1610  	static u8 out_ep[] = {OUT_EP_NUM + USB_DIR_OUT, 0};
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1611  
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1612  	/* usb initialization */
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1613  	dlfb = kzalloc(sizeof(*dlfb), GFP_KERNEL);
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1614  	if (!dlfb) {
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1615  		dev_err(&intf->dev, "%s: failed to allocate dlfb\n", __func__);
c143a559b073ae drivers/video/fbdev/udlfb.c   Dan Carpenter      2018-12-20  1616  		return -ENOMEM;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1617  	}
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1618  
7433914efd584b drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-07-25  1619  	INIT_LIST_HEAD(&dlfb->deferred_free);
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1620  
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1621  	dlfb->udev = usb_get_dev(usbdev);
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1622  	usb_set_intfdata(intf, dlfb);
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1623  
ed9de4ed398757 drivers/video/fbdev/udlfb.c   Alan Stern         2023-05-19  1624  	if (!usb_check_bulk_endpoints(intf, out_ep)) {
ed9de4ed398757 drivers/video/fbdev/udlfb.c   Alan Stern         2023-05-19  1625  		dev_err(&intf->dev, "Invalid DisplayLink device!\n");
ed9de4ed398757 drivers/video/fbdev/udlfb.c   Alan Stern         2023-05-19  1626  		retval = -EINVAL;
aaf7dbe07385e0 drivers/video/fbdev/udlfb.c   Pavel Skripkin     2022-03-22  1627  		goto error;
aaf7dbe07385e0 drivers/video/fbdev/udlfb.c   Pavel Skripkin     2022-03-22  1628  	}
aaf7dbe07385e0 drivers/video/fbdev/udlfb.c   Pavel Skripkin     2022-03-22  1629  
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1630  	dev_dbg(&intf->dev, "console enable=%d\n", console);
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1631  	dev_dbg(&intf->dev, "fb_defio enable=%d\n", fb_defio);
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1632  	dev_dbg(&intf->dev, "shadow enable=%d\n", shadow);
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1633  
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1634  	dlfb->sku_pixel_limit = 2048 * 1152; /* default to maximum */
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1635  
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1636  	if (!dlfb_parse_vendor_descriptor(dlfb, intf)) {
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1637  		dev_err(&intf->dev,
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1638  			"firmware not recognized, incompatible device?\n");
aaf7dbe07385e0 drivers/video/fbdev/udlfb.c   Pavel Skripkin     2022-03-22  1639  		retval = -ENODEV;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1640  		goto error;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1641  	}
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1642  
664c5f18490f25 drivers/video/udlfb.c         Ben Collins        2012-03-03  1643  	if (pixel_limit) {
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1644  		dev_warn(&intf->dev,
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1645  			 "DL chip limit of %d overridden to %d\n",
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1646  			 dlfb->sku_pixel_limit, pixel_limit);
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1647  		dlfb->sku_pixel_limit = pixel_limit;
664c5f18490f25 drivers/video/udlfb.c         Ben Collins        2012-03-03  1648  	}
664c5f18490f25 drivers/video/udlfb.c         Ben Collins        2012-03-03  1649  
664c5f18490f25 drivers/video/udlfb.c         Ben Collins        2012-03-03  1650  
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1651  	/* allocates framebuffer driver structure, not framebuffer memory */
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1652  	info = framebuffer_alloc(0, &dlfb->udev->dev);
aaf7dbe07385e0 drivers/video/fbdev/udlfb.c   Pavel Skripkin     2022-03-22  1653  	if (!info) {
aaf7dbe07385e0 drivers/video/fbdev/udlfb.c   Pavel Skripkin     2022-03-22  1654  		retval = -ENOMEM;
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1655  		goto error;
aaf7dbe07385e0 drivers/video/fbdev/udlfb.c   Pavel Skripkin     2022-03-22  1656  	}
33077b8d3042e0 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1657  
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1658  	dlfb->info = info;
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1659  	info->par = dlfb;
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1660  	info->pseudo_palette = dlfb->pseudo_palette;
2c29cfc3eaf117 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-07-25  1661  	dlfb->ops = dlfb_ops;
2c29cfc3eaf117 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-07-25  1662  	info->fbops = &dlfb->ops;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1663  
babc250e278eac drivers/video/fbdev/udlfb.c   Mikulas Patocka    2019-04-01  1664  	mutex_init(&dlfb->render_mutex);
6b11f9d8433b47 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2019-04-01  1665  	dlfb_init_damage(dlfb);
6b11f9d8433b47 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2019-04-01  1666  	spin_lock_init(&dlfb->damage_lock);
6b11f9d8433b47 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2019-04-01  1667  	INIT_WORK(&dlfb->damage_work, dlfb_damage_work);
6b11f9d8433b47 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2019-04-01  1668  
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1669  	INIT_LIST_HEAD(&info->modelist);
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1670  
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1671  	if (!dlfb_alloc_urb_list(dlfb, WRITES_IN_FLIGHT, MAX_TRANSFER)) {
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1672  		retval = -ENOMEM;
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1673  		dev_err(&intf->dev, "unable to allocate urb list\n");
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1674  		goto error;
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1675  	}
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1676  
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1677  	/* We don't register a new USB class. Our client interface is dlfbev */
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1678  
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1679  	retval = fb_alloc_cmap(&info->cmap, 256, 0);
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1680  	if (retval < 0) {
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1681  		dev_err(info->device, "cmap allocation failed: %d\n", retval);
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1682  		goto error;
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1683  	}
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1684  
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1685  	retval = dlfb_setup_modes(dlfb, info, NULL, 0);
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1686  	if (retval != 0) {
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1687  		dev_err(info->device,
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1688  			"unable to find common mode for display and adapter\n");
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1689  		goto error;
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1690  	}
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1691  
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1692  	/* ready to begin using device */
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1693  
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1694  	atomic_set(&dlfb->usb_active, 1);
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1695  	dlfb_select_std_channel(dlfb);
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1696  
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1697  	dlfb_ops_check_var(&info->var, info);
7433914efd584b drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-07-25  1698  	retval = dlfb_ops_set_par(info);
7433914efd584b drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-07-25  1699  	if (retval)
7433914efd584b drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-07-25  1700  		goto error;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1701  
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1702  	retval = register_framebuffer(info);
59277b679f8b5c drivers/staging/udlfb/udlfb.c Bernie Thompson    2009-11-24  1703  	if (retval < 0) {
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1704  		dev_err(info->device, "unable to register framebuffer: %d\n",
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1705  			retval);
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1706  		goto error;
7316bc55ed20c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-10  1707  	}
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1708  
00bab805c21a22 drivers/video/fbdev/udlfb.c   Sukrut Heroorkar   2025-09-24  1709  #ifdef CONFIG_FB_DEVICE
94cd1ae2fd251f drivers/video/udlfb.c         Liu Yuan           2011-04-18  1710  	for (i = 0; i < ARRAY_SIZE(fb_device_attrs); i++) {
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1711  		attr = &fb_device_attrs[i];
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1712  		retval = device_create_file(info->dev, attr);
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1713  		if (retval)
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1714  			dev_warn(info->device,
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1715  				 "failed to create '%s' attribute: %d\n",
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1716  				 attr->attr.name, retval);
94cd1ae2fd251f drivers/video/udlfb.c         Liu Yuan           2011-04-18  1717  	}
00bab805c21a22 drivers/video/fbdev/udlfb.c   Sukrut Heroorkar   2025-09-24  1718  #endif
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1719  
94cd1ae2fd251f drivers/video/udlfb.c         Liu Yuan           2011-04-18  1720  	retval = device_create_bin_file(info->dev, &edid_attr);
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1721  	if (retval)
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1722  		dev_warn(info->device, "failed to create '%s' attribute: %d\n",
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1723  			 edid_attr.attr.name, retval);
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1724  
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16 @1725  	dev_info(info->device,
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1726  		 "%s is DisplayLink USB device (%dx%d, %dK framebuffer memory)\n",
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16 @1727  		 dev_name(info->dev), info->var.xres, info->var.yres,
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1728  		 ((dlfb->backing_buffer) ?
18dffdf8913ab9 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1729  		 info->fix.smem_len * 2 : info->fix.smem_len) >> 10);
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1730  	return 0;
94cd1ae2fd251f drivers/video/udlfb.c         Liu Yuan           2011-04-18  1731  
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1732  error:
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1733  	if (dlfb->info) {
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1734  		dlfb_ops_destroy(dlfb->info);
c143a559b073ae drivers/video/fbdev/udlfb.c   Dan Carpenter      2018-12-20  1735  	} else {
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1736  		usb_put_dev(dlfb->udev);
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1737  		kfree(dlfb);
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1738  	}
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1739  	return retval;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1740  }
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1741  
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1742  static void dlfb_usb_disconnect(struct usb_interface *intf)
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1743  {
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1744  	struct dlfb_data *dlfb;
59277b679f8b5c drivers/staging/udlfb/udlfb.c Bernie Thompson    2009-11-24  1745  	struct fb_info *info;
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1746  	int i;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1747  
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1748  	dlfb = usb_get_intfdata(intf);
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1749  	info = dlfb->info;
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1750  
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  1751  	dev_dbg(&intf->dev, "USB disconnect starting\n");
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1752  
33077b8d3042e0 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1753  	/* we virtualize until all fb clients release. Then we free */
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1754  	dlfb->virtualized = true;
33077b8d3042e0 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1755  
33077b8d3042e0 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1756  	/* When non-active we'll update virtual framebuffer, but no new urbs */
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1757  	atomic_set(&dlfb->usb_active, 0);
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1758  
8d21547d3c9c3b drivers/video/udlfb.c         Bernie Thompson    2012-03-01  1759  	/* this function will wait for all in-flight urbs to complete */
7ea46206d1706b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-15  1760  	dlfb_free_urb_list(dlfb);
8d21547d3c9c3b drivers/video/udlfb.c         Bernie Thompson    2012-03-01  1761  
00bab805c21a22 drivers/video/fbdev/udlfb.c   Sukrut Heroorkar   2025-09-24  1762  #ifdef CONFIG_FB_DEVICE
33077b8d3042e0 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1763  	/* remove udlfb's sysfs interfaces */
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1764  	for (i = 0; i < ARRAY_SIZE(fb_device_attrs); i++)
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1765  		device_remove_file(info->dev, &fb_device_attrs[i]);
00bab805c21a22 drivers/video/fbdev/udlfb.c   Sukrut Heroorkar   2025-09-24  1766  #endif
2469d5dbcafe06 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15 @1767  	device_remove_bin_file(info->dev, &edid_attr);
8d21547d3c9c3b drivers/video/udlfb.c         Bernie Thompson    2012-03-01  1768  
68a958a915ca91 drivers/video/fbdev/udlfb.c   Mikulas Patocka    2018-10-08  1769  	unregister_framebuffer(info);
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1770  }
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  1771  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
