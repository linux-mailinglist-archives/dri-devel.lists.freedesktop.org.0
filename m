Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F72830ED2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 22:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FA410E15E;
	Wed, 17 Jan 2024 21:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1033610E15E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 21:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705528404; x=1737064404;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CZFomuzaELJmIoa5gpuAsnH07X7XzQXCFB1I2qrnzNg=;
 b=P7c/aj7oTidBmV5S80KNItWzf54/Xjw95kmnJWWNzjbKpVPm3umvvVFL
 5G2ajBY1BpJ2b7tWAaR2fzWAQFsbSkzQdiP2gk/HldhMQfzPnytR6V+XZ
 vuVzxciiCUYtDNVJqJ93R51iKIId7H4g9BBZWM6EZIARzAtRCO2YIlF/h
 ftv/GGiSUvHUStZVxthCYVCtUg0CW3EOmIsefFE+ueAbC6C11g+uQeecf
 rHZNcKXhyeJX15IWXHbOu+cZbhxI4w+j6O2n0Gd5ipRAkF1zUcvca5Cpp
 WoYbDC2NaBOLC7UB3tRbFzRDEV6SictSbIMBD7xKguh0rWrk89f4KOGuF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="6982465"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="6982465"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 13:53:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="874908487"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="874908487"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Jan 2024 13:53:19 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rQDqX-0002Mk-1L;
 Wed, 17 Jan 2024 21:53:17 +0000
Date: Thu, 18 Jan 2024 05:52:20 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 deller@gmx.de, daniel@ffwll.ch, airlied@gmail.com
Subject: Re: [PATCH 2/3] video/cmdline: Hide __video_get_options() behind
 CONFIG_FB_CORE
Message-ID: <202401180531.K8mdBrAu-lkp@intel.com>
References: <20240115100939.21562-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115100939.21562-3-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 05b317e8457c8e2bd1a797c9440ec07b7f341584]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/video-cmdline-Introduce-CONFIG_VIDEO-for-video-parameter/20240115-181419
base:   05b317e8457c8e2bd1a797c9440ec07b7f341584
patch link:    https://lore.kernel.org/r/20240115100939.21562-3-tzimmermann%40suse.de
patch subject: [PATCH 2/3] video/cmdline: Hide __video_get_options() behind CONFIG_FB_CORE
config: i386-randconfig-011-20240118 (https://download.01.org/0day-ci/archive/20240118/202401180531.K8mdBrAu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180531.K8mdBrAu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180531.K8mdBrAu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/core/fb_cmdline.c: In function 'fb_get_options':
>> drivers/video/fbdev/core/fb_cmdline.c:45:19: error: implicit declaration of function '__video_get_options'; did you mean 'video_get_options'? [-Werror=implicit-function-declaration]
      45 |         enabled = __video_get_options(name, &options, is_of);
         |                   ^~~~~~~~~~~~~~~~~~~
         |                   video_get_options
   cc1: some warnings being treated as errors


vim +45 drivers/video/fbdev/core/fb_cmdline.c

367221793d4796 Thomas Zimmermann 2023-02-09  23  
ea6763c104c93a Daniel Vetter     2014-08-06  24  /**
ea6763c104c93a Daniel Vetter     2014-08-06  25   * fb_get_options - get kernel boot parameters
ea6763c104c93a Daniel Vetter     2014-08-06  26   * @name:   framebuffer name as it would appear in
ea6763c104c93a Daniel Vetter     2014-08-06  27   *          the boot parameter line
ea6763c104c93a Daniel Vetter     2014-08-06  28   *          (video=<name>:<options>)
ea6763c104c93a Daniel Vetter     2014-08-06  29   * @option: the option will be stored here
ea6763c104c93a Daniel Vetter     2014-08-06  30   *
73ce73c30ba9ae Thomas Zimmermann 2023-02-09  31   * The caller owns the string returned in @option and is
73ce73c30ba9ae Thomas Zimmermann 2023-02-09  32   * responsible for releasing the memory.
73ce73c30ba9ae Thomas Zimmermann 2023-02-09  33   *
ea6763c104c93a Daniel Vetter     2014-08-06  34   * NOTE: Needed to maintain backwards compatibility
ea6763c104c93a Daniel Vetter     2014-08-06  35   */
ea6763c104c93a Daniel Vetter     2014-08-06  36  int fb_get_options(const char *name, char **option)
ea6763c104c93a Daniel Vetter     2014-08-06  37  {
93604a5ade3a02 Thomas Zimmermann 2023-02-09  38  	const char *options = NULL;
93604a5ade3a02 Thomas Zimmermann 2023-02-09  39  	bool is_of = false;
93604a5ade3a02 Thomas Zimmermann 2023-02-09  40  	bool enabled;
cedaf7cddd7339 Thomas Zimmermann 2023-02-09  41  
93604a5ade3a02 Thomas Zimmermann 2023-02-09  42  	if (name)
93604a5ade3a02 Thomas Zimmermann 2023-02-09  43  		is_of = strncmp(name, "offb", 4);
ea6763c104c93a Daniel Vetter     2014-08-06  44  
93604a5ade3a02 Thomas Zimmermann 2023-02-09 @45  	enabled = __video_get_options(name, &options, is_of);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
