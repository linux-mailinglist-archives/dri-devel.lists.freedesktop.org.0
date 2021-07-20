Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2651C3CF443
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 08:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377F96E255;
	Tue, 20 Jul 2021 06:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485146E255
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 06:12:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="198455189"
X-IronPort-AV: E=Sophos;i="5.84,254,1620716400"; d="scan'208";a="198455189"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 23:12:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,254,1620716400"; d="scan'208";a="414569029"
Received: from lkp-server02.sh.intel.com (HELO 1b5a72ed9419) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 19 Jul 2021 23:12:30 -0700
Received: from kbuild by 1b5a72ed9419 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1m5izV-00004j-Ln; Tue, 20 Jul 2021 06:12:29 +0000
Date: Tue, 20 Jul 2021 13:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: dillon.minfei@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 linus.walleij@linaro.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add ilitek ili9341
 panel bindings
Message-ID: <202107201305.FPUQWvWk-lkp@intel.com>
References: <1626430843-23823-2-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626430843-23823-2-git-send-email-dillon.minfei@gmail.com>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v5.14-rc2 next-20210719]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/dillon-minfei-gmail-com/Add-ilitek-ili9341-panel-driver/20210718-103113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
compiler: arm-linux-gnueabi-gcc (GCC) 10.3.0
reproduce: make ARCH=arm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /interrupt-controller@e000e100: failed to match any schema with compatible: ['arm,armv7m-nvic']
   arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /timer@e000e010: failed to match any schema with compatible: ['arm,armv7m-systick']
   arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /soc/i2c@40005c00/stmpe811@41: failed to match any schema with compatible: ['st,stmpe811']
   arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /soc/i2c@40005c00/stmpe811@41/stmpe_touchscreen: failed to match any schema with compatible: ['st,stmpe-ts']
   arch/arm/boot/dts/stm32f429-disco.dt.yaml: l3gd20@0: 'spi-max-frequency' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/st,st-sensors.yaml
>> arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible: ['st,sf-tc240t-9370-t'] is too short
   	From schema: Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
   arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /soc/crc@40023000: failed to match any schema with compatible: ['st,stm32f4-crc']
   arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /soc/rcc@40023800: failed to match any schema with compatible: ['st,stm32f42xx-rcc', 'st,stm32-rcc']
   arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /soc/rcc@40023800: failed to match any schema with compatible: ['st,stm32f42xx-rcc', 'st,stm32-rcc']

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
