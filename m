Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB056C2822
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 03:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AE110E04B;
	Tue, 21 Mar 2023 02:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BCF10E04B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 02:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679365691; x=1710901691;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RgVBx0IQ1NmjcIvWGy7+21SNw7xhhYNDNR5oOZ1yjIc=;
 b=VUyUIrEANtEw2g/EFrsn9D+ccEen2qyUbbZeZxFKghDyVOeIPiIaS6qt
 rotL3Xs79MoVB1bCEigwsb4NvRzKcRIaTCdhCfB7RHJJOXHHifQrAvQ5X
 Uas/5MZax1SkW2NHXTwo7qgnkqyM1amKtjol7AWLKU1jp+kKXNM0FHEiF
 4zEOBUuMiCbAm/FjPvqujfxSXNEZMbBU6JN6LEYdWS+a2T/mLV2S/mX3g
 TokfIUEhYIPJe/+z/3ALuubL2fSNpaX4GNpsRdwR9rwx/o7ollEppNKeC
 T7jS6ExF5u/Z+54vxJ/sT4ndX+g2QlvMdhYvKycgU0pL4eJPMIb3EJBPg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="401404358"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="401404358"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 19:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="631377103"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="631377103"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 20 Mar 2023 19:28:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1peRjL-000BVZ-12;
 Tue, 21 Mar 2023 02:28:07 +0000
Date: Tue, 21 Mar 2023 10:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, ogabbay@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, jacek.lawrynowicz@linux.intel.com,
 stanislaw.gruszka@linux.intel.com
Subject: Re: [PATCH v4 7/8] accel/qaic: Add qaic driver to the build system
Message-ID: <202303211031.l0DpLTGp-lkp@intel.com>
References: <1679325074-5494-8-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679325074-5494-8-git-send-email-quic_jhugo@quicinc.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, dafna@fastmail.com,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jeffrey,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on lwn/docs-next]
[cannot apply to linus/master v6.3-rc3 next-20230320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeffrey-Hugo/accel-qaic-Add-documentation-for-AIC100-accelerator-driver/20230320-231611
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/1679325074-5494-8-git-send-email-quic_jhugo%40quicinc.com
patch subject: [PATCH v4 7/8] accel/qaic: Add qaic driver to the build system
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230321/202303211031.l0DpLTGp-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/bffc487514275054bebfe9e732bf2d36da14a31f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jeffrey-Hugo/accel-qaic-Add-documentation-for-AIC100-accelerator-driver/20230320-231611
        git checkout bffc487514275054bebfe9e732bf2d36da14a31f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211031.l0DpLTGp-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/accel/qaic/qaic.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
