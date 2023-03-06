Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 683056ACFF4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 22:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0719910E477;
	Mon,  6 Mar 2023 21:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4771B10E249
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 21:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678137221; x=1709673221;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W+pwkRjL2XU/wrlakyvjwEDMpoQqOshgjsZ9AhZ+GLE=;
 b=g2mQZcBWSeddtWICKUIqFDyx7ielFT+haAHo3TyfYHXWXmzaoraMo6tP
 Iex3njjViLXjUAseZ/dSj+eqytnKrwbn/bapN9ytZsewAZy7JUw6LJrig
 wlegQH6HsDb171LpT0Odk3P36DYauIvQb6lAqxuP0WrwOxuPaNeesWY16
 B++ojBhPWsVSqKQEAcaYiyFlnfrCzSGvP1biyPyYTE902Fu6uBLeYnL7Q
 9ka6msERDEFRzU6CZtxJQHBuVAiF3NAq9oriaS3t7TzM8cTa8cGFWiv+e
 FCh/JUmbFqbs5nl/3zzCn428lzquYLvbZMhxLXRVLb/dPAZ87csT+exn+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="421952433"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="421952433"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 13:13:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="740471266"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="740471266"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 06 Mar 2023 13:13:35 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pZI9G-0000df-21;
 Mon, 06 Mar 2023 21:13:34 +0000
Date: Tue, 7 Mar 2023 05:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 paulus@samba.org, benh@kernel.crashing.org, linux@armlinux.org.uk,
 pjones@redhat.com, timur@kernel.org, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@hansenpartnership.com,
 spock@gentoo.org, sudipm.mukherjee@gmail.com,
 teddy.wang@siliconmotion.com, geert+renesas@glider.be, corbet@lwn.net
Subject: Re: [PATCH 08/99] fbdev/arkfb: Duplicate video-mode option string
Message-ID: <202303070537.699fZDEm-lkp@intel.com>
References: <20230306160016.4459-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306160016.4459-9-tzimmermann@suse.de>
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
[also build test ERROR on linus/master v6.3-rc1 next-20230306]
[cannot apply to deller-parisc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/lib-Add-option-iterator/20230307-000524
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230306160016.4459-9-tzimmermann%40suse.de
patch subject: [PATCH 08/99] fbdev/arkfb: Duplicate video-mode option string
config: x86_64-randconfig-a016-20230306 (https://download.01.org/0day-ci/archive/20230307/202303070537.699fZDEm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f8a56fb51ff846d7daca02280ac0355e1a82264e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/lib-Add-option-iterator/20230307-000524
        git checkout f8a56fb51ff846d7daca02280ac0355e1a82264e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070537.699fZDEm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/arkfb.c:1205:4: error: 'continue' statement not in loop statement
                           continue;
                           ^
   drivers/video/fbdev/arkfb.c:1207:4: error: 'continue' statement not in loop statement
                           continue;
                           ^
   2 errors generated.


vim +/continue +1205 drivers/video/fbdev/arkfb.c

  1191	
  1192		if (fb_modesetting_disabled("arkfb"))
  1193			return -ENODEV;
  1194	
  1195	#ifndef MODULE
  1196		if (fb_get_options("arkfb", &option))
  1197			return -ENODEV;
  1198	
  1199		if (option && *option) {
  1200			static char mode_option_buf[256];
  1201			int ret;
  1202	
  1203			ret = snprintf(mode_option_buf, sizeof(mode_option_buf), "%s", option);
  1204			if (WARN(ret < 0, "arkfb: ignoring invalid option, ret=%d\n", ret))
> 1205				continue;
  1206			if (WARN(ret >= sizeof(mode_option_buf), "arkfb: option too long\n"))
  1207				continue;
  1208			mode_option = mode_option_buf;
  1209		}
  1210	#endif
  1211	
  1212		pr_debug("arkfb: initializing\n");
  1213		return pci_register_driver(&arkfb_pci_driver);
  1214	}
  1215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
