Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD4F581CF8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 03:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A42314B6A2;
	Wed, 27 Jul 2022 01:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B9D14B3CF
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 01:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658884544; x=1690420544;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gAW844fxHQKZhndpBrouqcse1HO0ff+ghZLcjXanb1A=;
 b=ER/hROOWYwEz71J/0DpdrcaAW67ANZLP9aeCnIc54J37jYJ1TOGXBKBc
 4oLGcNXj7eRf2p5fl/1tyQ2YF2Boueh7h32Smnlwouf4jY7gV21mpW4sT
 2zbBKOmzulp8rsdM77MuI6jRJ3pVY4yo1drGDp6VyDxv44wGQoZe4BT3G
 arBLkaY1gJP0wuo2N0wUR4edsMHjnLfhNCIwix4i5sye9sBgYO06402l/
 nR96IFgd8iuhkSN0I2tBGUvNlZCsPI5Om/tpiOdpnE6Y8c/H45VjVCMAg
 Z4J+DVq9wmOltfrDN4a3eXCf75H30MVH6F4jrK3inWf5ynVWG8eeitMZn A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="286870218"
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; d="scan'208";a="286870218"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 18:15:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; d="scan'208";a="689674705"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2022 18:15:33 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oGVe8-00088q-1r;
 Wed, 27 Jul 2022 01:15:32 +0000
Date: Wed, 27 Jul 2022 09:14:56 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 02/10] drm: rcar-du: Add encoder lib support
Message-ID: <202207270934.Cq65wqcE-lkp@intel.com>
References: <20220726164208.1048444-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726164208.1048444-3-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>, kbuild-all@lists.01.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20220726]
[cannot apply to drm-intel/for-linux-next pinchartl-media/drm/du/next linus/master v5.19-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/Add-RCar-DU-lib-support/20220727-004502
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: arm-randconfig-r035-20220724 (https://download.01.org/0day-ci/archive/20220727/202207270934.Cq65wqcE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a703859b5858b11c89202731a2eba345dcbe1057
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Biju-Das/Add-RCar-DU-lib-support/20220727-004502
        git checkout a703859b5858b11c89202731a2eba345dcbe1057
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/rcar-du/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/rcar-du/rcar_du_encoder.c:20:5: warning: no previous prototype for 'rcar_du_encoder_init' [-Wmissing-prototypes]
      20 | int rcar_du_encoder_init(struct rcar_du_device *rcdu,
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/rcar_du_encoder_init +20 drivers/gpu/drm/rcar-du/rcar_du_encoder.c

4bf8e1962f91eed drivers/gpu/drm/rcar-du/rcar_du_lvds.c    Laurent Pinchart 2013-06-19  15  
6978f123776594b drivers/gpu/drm/rcar-du/rcar_du_encoder.c Laurent Pinchart 2013-06-15  16  /* -----------------------------------------------------------------------------
6978f123776594b drivers/gpu/drm/rcar-du/rcar_du_encoder.c Laurent Pinchart 2013-06-15  17   * Encoder
6978f123776594b drivers/gpu/drm/rcar-du/rcar_du_encoder.c Laurent Pinchart 2013-06-15  18   */
6978f123776594b drivers/gpu/drm/rcar-du/rcar_du_encoder.c Laurent Pinchart 2013-06-15  19  
6978f123776594b drivers/gpu/drm/rcar-du/rcar_du_encoder.c Laurent Pinchart 2013-06-15 @20  int rcar_du_encoder_init(struct rcar_du_device *rcdu,

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
