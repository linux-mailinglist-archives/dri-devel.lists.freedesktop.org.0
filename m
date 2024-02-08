Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A3C84E057
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 13:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AB110E21B;
	Thu,  8 Feb 2024 12:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJ5zilL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EB410E21B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 12:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707394004; x=1738930004;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X3RpNgRFWg4hYHY+7/7QHHs4Uc4xM4YTy5Dg8CxGXPc=;
 b=nJ5zilL2SuLm+zZ8f+yqhDtuYOY6OwzAMmiGbDN+kBz62YQnn74ESRUS
 EdyLx828u5MuBCAFVVCvANAQhrUkESMjeZl+LIl0eYN7R0UetOFzEwnEL
 vvJhLGN6QysNi6oe7KpJwAZRzNtmggMcCrtHxAW4Rgg7SLkJpZLLbRuGg
 tgw9ZKLoorNMA5xhMs0lOuHZbtvo6cNJ6cjwiri53nVgXCwzcx9w4IYkp
 OEopou7wmpBUr9shKhZDaLqWeN692+Xi41LTnsseg9KtMOY1tqOMBlo/1
 wonk3h8foF00wDFDvbNijbh3s6I9V1OApruw4PQ6PXcmZDXFj9XQUlK/g A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="4185572"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="4185572"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 04:06:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; d="scan'208";a="32449826"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 08 Feb 2024 04:06:40 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rY3Ar-0003iu-2n;
 Thu, 08 Feb 2024 12:06:37 +0000
Date: Thu, 8 Feb 2024 20:06:26 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 sui.jingfeng@linux.dev, pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 3/8] firmware/sysfb: Set firmware-framebuffer parent
 device
Message-ID: <202402081952.wLKLCXmW-lkp@intel.com>
References: <20240207134932.7321-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207134932.7321-4-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip linus/master v6.8-rc3 next-20240208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/video-Add-helpers-for-decoding-screen_info/20240207-215100
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240207134932.7321-4-tzimmermann%40suse.de
patch subject: [PATCH v3 3/8] firmware/sysfb: Set firmware-framebuffer parent device
config: i386-randconfig-141-20240208 (https://download.01.org/0day-ci/archive/20240208/202402081952.wLKLCXmW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081952.wLKLCXmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081952.wLKLCXmW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/sysfb.c:36:
   include/linux/sysfb.h:108:1: error: expected identifier or '(' before '{' token
     108 | {
         | ^
>> include/linux/sysfb.h:105:39: warning: 'sysfb_create_simplefb' used but never defined
     105 | static inline struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
         |                                       ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/video/aperture.c:10:
   include/linux/sysfb.h:108:1: error: expected identifier or '(' before '{' token
     108 | {
         | ^
>> include/linux/sysfb.h:105:39: warning: 'sysfb_create_simplefb' declared 'static' but never defined [-Wunused-function]
     105 | static inline struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
         |                                       ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/firmware/efi/sysfb_efi.c:26:
   include/linux/sysfb.h:108:1: error: expected identifier or '(' before '{' token
     108 | {
         | ^
>> include/linux/sysfb.h:105:39: warning: 'sysfb_create_simplefb' declared 'static' but never defined [-Wunused-function]
     105 | static inline struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
         |                                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/efi/sysfb_efi.c:345:39: warning: 'efifb_fwnode_ops' defined but not used [-Wunused-const-variable=]
     345 | static const struct fwnode_operations efifb_fwnode_ops = {
         |                                       ^~~~~~~~~~~~~~~~
   drivers/firmware/efi/sysfb_efi.c:238:35: warning: 'efifb_dmi_swap_width_height' defined but not used [-Wunused-const-variable=]
     238 | static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/efi/sysfb_efi.c:188:35: warning: 'efifb_dmi_system_table' defined but not used [-Wunused-const-variable=]
     188 | static const struct dmi_system_id efifb_dmi_system_table[] __initconst = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~


vim +/sysfb_create_simplefb +105 include/linux/sysfb.h

e3263ab389a7bc arch/x86/include/asm/sysfb.h David Rheinsberg         2013-08-02  104  
9e121040e54abe include/linux/sysfb.h        Javier Martinez Canillas 2022-06-07 @105  static inline struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
c0a4e7e120d3e9 include/linux/sysfb.h        Thomas Zimmermann        2024-02-07  106  							    const struct simplefb_platform_data *mode,
c0a4e7e120d3e9 include/linux/sysfb.h        Thomas Zimmermann        2024-02-07  107  							    struct device *parent);
e3263ab389a7bc arch/x86/include/asm/sysfb.h David Rheinsberg         2013-08-02 @108  {
9e121040e54abe include/linux/sysfb.h        Javier Martinez Canillas 2022-06-07  109  	return ERR_PTR(-EINVAL);
e3263ab389a7bc arch/x86/include/asm/sysfb.h David Rheinsberg         2013-08-02  110  }
e3263ab389a7bc arch/x86/include/asm/sysfb.h David Rheinsberg         2013-08-02  111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
