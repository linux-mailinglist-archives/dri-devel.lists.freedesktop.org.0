Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8819B1F32
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 17:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0BB10E164;
	Sun, 27 Oct 2024 16:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9jtf+x5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3264E10E164
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730046503; x=1761582503;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0aXubYe1FaQcPNmFvMSSBox/SiArxW12jDOhwAJzfAs=;
 b=d9jtf+x5Bi3BovHDd1coi0+D/coVqBMlC+HhzTztfNv4+MbG8HR9viHx
 4GJQemCR/LIBTkEppLIHb0bKF/Uylq8s83AwAmYdr7MYOPqVU6C1/56yf
 nZyBTn1QPGPUEY6jbSOscuaAhVdVKNolt665VRP2NJlEic3oTsDPG/7aR
 t6yG/JK91nWQxnd6XLASHNpCli+nEvd1R7TKEtUcm8Ey94899I83hXFsb
 HTUkS14yX0SC8pe6c0MlIVoGwnDUgSG/k5JcZBf6GivxSZM3+CDdCcdHG
 sfMD1qL5gErFAnCtnvdDO1BeU/WqR/eDq8M2pvAzZ81VSfAU9sYh58bYs w==;
X-CSE-ConnectionGUID: p1KO0tq/Sre4O0Qj/cPpbw==
X-CSE-MsgGUID: Y5Z7TSgfToSwvZCvTjrY+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="40272148"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; d="scan'208";a="40272148"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2024 09:28:18 -0700
X-CSE-ConnectionGUID: DMeHiUY6T3uuJrfiO+OCNw==
X-CSE-MsgGUID: hnu4janpSDmEEbxsVAn8bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; d="scan'208";a="112221800"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 27 Oct 2024 09:28:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t567h-000ape-20;
 Sun, 27 Oct 2024 16:28:13 +0000
Date: Mon, 28 Oct 2024 00:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 thomas.zimmermann@suse.de,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
Subject: Re: [PATCH] fbdev: udl: Make CONFIG_FB_DEVICE optional
Message-ID: <202410280002.AXteAJwc-lkp@intel.com>
References: <20241025092538.38339-1-gonzalo.silvalde@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025092538.38339-1-gonzalo.silvalde@gmail.com>
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

Hi Gonzalo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gonzalo-Silvalde-Blanco/fbdev-udl-Make-CONFIG_FB_DEVICE-optional/20241025-172653
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241025092538.38339-1-gonzalo.silvalde%40gmail.com
patch subject: [PATCH] fbdev: udl: Make CONFIG_FB_DEVICE optional
config: i386-randconfig-r121-20241027 (https://download.01.org/0day-ci/archive/20241028/202410280002.AXteAJwc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280002.AXteAJwc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280002.AXteAJwc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/udlfb.c:1493:38: warning: 'fb_device_attrs' defined but not used [-Wunused-const-variable=]
    1493 | static const struct device_attribute fb_device_attrs[] = {
         |                                      ^~~~~~~~~~~~~~~
>> drivers/video/fbdev/udlfb.c:1485:35: warning: 'edid_attr' defined but not used [-Wunused-const-variable=]
    1485 | static const struct bin_attribute edid_attr = {
         |                                   ^~~~~~~~~


vim +/fb_device_attrs +1493 drivers/video/fbdev/udlfb.c

7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1484  
598b2eedfc3fbe drivers/video/fbdev/udlfb.c   Bhumika Goyal      2017-08-18 @1485  static const struct bin_attribute edid_attr = {
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1486  	.attr.name = "edid",
8ef8cc4fca4a92 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1487  	.attr.mode = 0666,
b9f03a3cd06c6f drivers/video/udlfb.c         Paul Mundt         2011-01-06  1488  	.size = EDID_LENGTH,
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1489  	.read = edid_show,
8ef8cc4fca4a92 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1490  	.write = edid_store
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1491  };
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1492  
fa738a5c4b2a6b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16 @1493  static const struct device_attribute fb_device_attrs[] = {
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1494  	__ATTR_RO(metrics_bytes_rendered),
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1495  	__ATTR_RO(metrics_bytes_identical),
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1496  	__ATTR_RO(metrics_bytes_sent),
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1497  	__ATTR_RO(metrics_cpu_kcycles_used),
926c11151e3b82 drivers/staging/udlfb/udlfb.c Greg Kroah-Hartman 2010-11-18  1498  	__ATTR(metrics_reset, S_IWUSR, NULL, metrics_reset_store),
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1499  };
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1500  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
