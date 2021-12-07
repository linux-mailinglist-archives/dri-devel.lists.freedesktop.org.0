Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BC646C429
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9888988B6C;
	Tue,  7 Dec 2021 20:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4524688B6C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 20:06:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="261745921"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="261745921"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 12:06:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="542936151"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 07 Dec 2021 12:06:12 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mugj6-000Mv7-1p; Tue, 07 Dec 2021 20:06:12 +0000
Date: Wed, 8 Dec 2021 04:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: Tommy Haung <tommy_huang@aspeedtech.com>, joel@jms.id.au,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 andrew@aj.id.au, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arm:boot:dts:aspeed-g6 Add more gfx reset control
Message-ID: <202112080327.zlIz9vRq-lkp@intel.com>
References: <20211207102749.18118-8-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211207102749.18118-8-tommy_huang@aspeedtech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tommy,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.16-rc4]
[also build test ERROR on next-20211207]
[cannot apply to joel-aspeed/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tommy-Haung/Add-Aspeed-AST2600-soc-display-support/20211207-183100
base:    0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1
config: arm-defconfig (https://download.01.org/0day-ci/archive/20211208/202112080327.zlIz9vRq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/1f021d3aa80957f6bd0434bf4b5d66898b8d2e9c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tommy-Haung/Add-Aspeed-AST2600-soc-display-support/20211207-183100
        git checkout 1f021d3aa80957f6bd0434bf4b5d66898b8d2e9c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/aspeed-g6.dtsi:359.23-24 syntax error
   FATAL ERROR: Unable to parse input tree

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
