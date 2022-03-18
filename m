Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554F14DD1FA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 01:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA2E10E0F5;
	Fri, 18 Mar 2022 00:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD4510E0F5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 00:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647563635; x=1679099635;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=12AzeHrTnM6nCMbeOFusXjBmoW1AmV2OlCp6VVtsjWI=;
 b=RkdnODAKQRVpocfjN/QH/xPqJF6nVWSn6I37ZZxjvefT8PgRxBUW24q8
 X7v1QNLEqp3US7fN0PcfRzx3mEzQw9RgaQdrj4Lo5ms3F/XIR0gTT0kkc
 0Nn7LtKcmhNXpuFrllEzE5DpQYGcWodJOkMfs7WCplB1PMo483mlaxKl6
 K/ZhmhX6ESXL8l54YBHDt00k6lFch6RL0DtId9UDDFwzfvYlceff7s9Yz
 bnHrjqTDzuLirRkiLVnvo6zmduuz68PGacyvQm5ZAwNpFx4Ek+UncPe9z
 0jkqF6tPvyzEr1gUklGnNgBIIhU3F9OZs16ZkfWksqRm7AFzVkzgA3FA6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="281816456"
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; d="scan'208";a="281816456"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 17:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; d="scan'208";a="513635355"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 17 Mar 2022 17:33:52 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nV0Yx-000EGr-Vp; Fri, 18 Mar 2022 00:33:51 +0000
Date: Fri, 18 Mar 2022 08:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/gma500: Remove unused declarations and other cruft
Message-ID: <202203180839.vNEFesvz-lkp@intel.com>
References: <20220317092555.17882-1-patrik.r.jakobsson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317092555.17882-1-patrik.r.jakobsson@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, kbuild-all@lists.01.org, tzimmermann@suse.de,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Patrik,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.17-rc8 next-20220317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Patrik-Jakobsson/drm-gma500-Remove-unused-declarations-and-other-cruft/20220317-172741
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20220318/202203180839.vNEFesvz-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/0d50efabcb4ad52bd7a036e2542dbf51bbcf93b4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Patrik-Jakobsson/drm-gma500-Remove-unused-declarations-and-other-cruft/20220317-172741
        git checkout 0d50efabcb4ad52bd7a036e2542dbf51bbcf93b4
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/gma500/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/gma500/psb_drv.c:102:6: sparse: sparse: symbol 'psb_spank' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
