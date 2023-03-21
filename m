Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C362E6C276D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 02:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D1910E58E;
	Tue, 21 Mar 2023 01:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE3E10E6A9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 01:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679361969; x=1710897969;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JN7P6/84ciM0tfW9IPxK1ZgqeLHaWe1UJr7VG9engOc=;
 b=n0fOkG1LBiot3OdSMcVl/RTZDA25i1IVnHe6Im1xFFNfUA7r3nTKzU/y
 j75ZDG29C1G/JEMNHTy1dftxc0HfFM+O3X0g5Oit3nl1ujO0zfiRPmLVx
 +NC7vmty5q47gAf0uYInNeXJzwWTi6n6MKbnZtHRysE6Zw7ezHxKfy5U/
 2fAq8A95+CVuVHhXNIi7sGN01F3ptoaMj3FfwHxKEQrRF70zVPmOf3T8Q
 eaZHx0bEoD1KgitbbjwHGUmGjWtXOZx1OxbfHtv574BYXcu8eeScH2SKB
 BT0sWoOsbm6kCufEwtfa2gelVmqnNpAd9FirWRs+lMm5p0CItUKDPr3St w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="336325524"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="336325524"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 18:26:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="791863757"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="791863757"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2023 18:26:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1peQlJ-000BTF-1u;
 Tue, 21 Mar 2023 01:26:05 +0000
Date: Tue, 21 Mar 2023 09:25:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, ogabbay@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, jacek.lawrynowicz@linux.intel.com,
 stanislaw.gruszka@linux.intel.com
Subject: Re: [PATCH v4 7/8] accel/qaic: Add qaic driver to the build system
Message-ID: <202303210930.FzkLKCic-lkp@intel.com>
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
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230321/202303210930.FzkLKCic-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/bffc487514275054bebfe9e732bf2d36da14a31f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jeffrey-Hugo/accel-qaic-Add-documentation-for-AIC100-accelerator-driver/20230320-231611
        git checkout bffc487514275054bebfe9e732bf2d36da14a31f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210930.FzkLKCic-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [drivers/accel/qaic/qaic.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
