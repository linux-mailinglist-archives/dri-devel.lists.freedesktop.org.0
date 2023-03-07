Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9783B6AD358
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 01:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6849E10E02A;
	Tue,  7 Mar 2023 00:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45CB10E02A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 00:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678148866; x=1709684866;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qU7r/0l12H9VC3ijVZNrTHRPP+flag7/E09IYJm8+eY=;
 b=Z3m+YfWWgQmfoQPBGZ6CwBRD5lPnKp/7+Nv7S2rZGAwCo3HQf3niiVU1
 FrPJ+hKyv9zgyLgbRRTSlJ0vTKEUT8yMkIvToLrHADv38ldX+7O9l5yW9
 hIFUuRm7NxwuB3WApm6xdvZoWxQX/UvC7R9yFkmWIoFJpgZZlfMgO2maQ
 f1QZlpLVExxa5n8sCxv3JSxQzg31Af5dwYAuavlhixmD1EQtleQX1Hnn3
 DH2ajgGOKnisnvtNt1zhjv322GoX8BKaaFu1jZYRk7NmY3BhPg7aHOUnk
 GW9ax7aikDv/1kF/i0Fu9Xyg0ZZKPSOCH/cMKsoZpWllrzaPjHLOsk1nZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="319548321"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="319548321"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 16:27:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="706619626"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="706619626"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 06 Mar 2023 16:27:41 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pZLB6-0000lb-0A;
 Tue, 07 Mar 2023 00:27:40 +0000
Date: Tue, 7 Mar 2023 08:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 paulus@samba.org, benh@kernel.crashing.org, linux@armlinux.org.uk,
 pjones@redhat.com, timur@kernel.org, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@hansenpartnership.com,
 spock@gentoo.org, sudipm.mukherjee@gmail.com,
 teddy.wang@siliconmotion.com, geert+renesas@glider.be, corbet@lwn.net
Subject: Re: [PATCH 97/99] fbdev/vt8623fb: Duplicate video-mode option string
Message-ID: <202303070859.8Y5URjpT-lkp@intel.com>
References: <20230306160016.4459-98-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306160016.4459-98-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[cannot apply to deller-parisc/for-next staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.3-rc1 next-20230306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/lib-Add-option-iterator/20230307-000524
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230306160016.4459-98-tzimmermann%40suse.de
patch subject: [PATCH 97/99] fbdev/vt8623fb: Duplicate video-mode option string
config: x86_64-randconfig-a016-20230306 (https://download.01.org/0day-ci/archive/20230307/202303070859.8Y5URjpT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/819a7fd9e1404efc4f2140bcb4c7e39643b7e4ab
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/lib-Add-option-iterator/20230307-000524
        git checkout 819a7fd9e1404efc4f2140bcb4c7e39643b7e4ab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070859.8Y5URjpT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/vt8623fb.c:938:4: error: 'break' statement not in loop or switch statement
                           break;
                           ^
   drivers/video/fbdev/vt8623fb.c:940:4: error: 'break' statement not in loop or switch statement
                           break;
                           ^
   2 errors generated.


vim +/break +938 drivers/video/fbdev/vt8623fb.c

   924	
   925		if (fb_modesetting_disabled("vt8623fb"))
   926			return -ENODEV;
   927	
   928	#ifndef MODULE
   929		if (fb_get_options("vt8623fb", &option))
   930			return -ENODEV;
   931	
   932		if (option && *option) {
   933			static char mode_option_buf[256];
   934			int ret;
   935	
   936			ret = snprintf(mode_option_buf, sizeof(mode_option_buf), "%s", option);
   937			if (WARN(ret < 0, "vt8623fb: ignoring invalid option, ret=%d\n", ret))
 > 938				break;
   939			if (WARN(ret >= sizeof(mode_option_buf), "vt8623fb: option too long\n"))
   940				break;
   941			mode_option = mode_option_buf;
   942		}
   943	#endif
   944	
   945		pr_debug("vt8623fb: initializing\n");
   946		return pci_register_driver(&vt8623fb_pci_driver);
   947	}
   948	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
