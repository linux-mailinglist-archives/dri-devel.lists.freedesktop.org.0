Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E31046B5C5A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 14:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B8710E0BB;
	Sat, 11 Mar 2023 13:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3C410E0AC
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678542175; x=1710078175;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x+ZRr0pj7ADlwQU5k8M99g/tAgS3JVQU+0XabB88Cew=;
 b=ifixLZ3iyI3mSRH1UqDpTh08bhiEFl8bpf7aov3H36sAz8C2A8wV2AeK
 aNB6XOoT94hdLnPaiiBeyWvG1OuhmG2v36XdlOh4E6azYa+7m9vjtARY7
 gkTk6w39pCVr6ylWgPXuJdZY5d/XA3Y6mnh8ufxFmB2upLTi/vwRiBhPq
 0Em/1jYttHh9QHDN3n31tlIFK+LkrZwd+zrJdAPwgdpOaY2v0BdEOzQqy
 jfC7D5TNZwunjvfXvYMtXSIuyybK6p+dhjm60yURMkU0pekCfRRWvrQ2B
 BHeWqK5h4rUMnVeST/Zp2g+2VREl5VyQ1AA4BCgdsnvvOGKguC+CB9CI7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="325260777"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; d="scan'208";a="325260777"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2023 05:42:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="678156174"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; d="scan'208";a="678156174"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 11 Mar 2023 05:42:52 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pazUq-0004bR-0O;
 Sat, 11 Mar 2023 13:42:52 +0000
Date: Sat, 11 Mar 2023 21:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev: Use of_property_present() for testing DT property
 presence
Message-ID: <202303112153.uPbFjEUI-lkp@intel.com>
References: <20230310144729.1545943-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310144729.1545943-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring/fbdev-Use-of_property_present-for-testing-DT-property-presence/20230310-225754
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230310144729.1545943-1-robh%40kernel.org
patch subject: [PATCH] fbdev: Use of_property_present() for testing DT property presence
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230311/202303112153.uPbFjEUI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c013f4111f36b0b4327e7fbf46c0dd93399e9209
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Herring/fbdev-Use-of_property_present-for-testing-DT-property-presence/20230310-225754
        git checkout c013f4111f36b0b4327e7fbf46c0dd93399e9209
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303112153.uPbFjEUI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/amba-clcd.c: In function 'clcdfb_of_get_board':
>> drivers/video/fbdev/amba-clcd.c:857:13: error: implicit declaration of function 'of_property_present'; did you mean 'fwnode_property_present'? [-Werror=implicit-function-declaration]
     857 |         if (of_property_present(node, "memory-region")) {
         |             ^~~~~~~~~~~~~~~~~~~
         |             fwnode_property_present
   cc1: some warnings being treated as errors


vim +857 drivers/video/fbdev/amba-clcd.c

   843	
   844	static struct clcd_board *clcdfb_of_get_board(struct amba_device *dev)
   845	{
   846		struct clcd_board *board = devm_kzalloc(&dev->dev, sizeof(*board),
   847				GFP_KERNEL);
   848		struct device_node *node = dev->dev.of_node;
   849	
   850		if (!board)
   851			return NULL;
   852	
   853		board->name = of_node_full_name(node);
   854		board->caps = CLCD_CAP_ALL;
   855		board->check = clcdfb_check;
   856		board->decode = clcdfb_decode;
 > 857		if (of_property_present(node, "memory-region")) {
   858			board->setup = clcdfb_of_vram_setup;
   859			board->mmap = clcdfb_of_vram_mmap;
   860			board->remove = clcdfb_of_vram_remove;
   861		} else {
   862			board->setup = clcdfb_of_dma_setup;
   863			board->mmap = clcdfb_of_dma_mmap;
   864			board->remove = clcdfb_of_dma_remove;
   865		}
   866	
   867		return board;
   868	}
   869	#else
   870	static struct clcd_board *clcdfb_of_get_board(struct amba_device *dev)
   871	{
   872		return NULL;
   873	}
   874	#endif
   875	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
