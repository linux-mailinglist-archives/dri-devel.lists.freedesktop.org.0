Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B73012A6F4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 10:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBFF89EB1;
	Wed, 25 Dec 2019 09:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5DC89EB1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2019 09:14:37 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Dec 2019 01:14:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,353,1571727600"; d="scan'208";a="212079837"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 25 Dec 2019 01:14:34 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1ik2kU-00020J-8e; Wed, 25 Dec 2019 17:14:34 +0800
Date: Wed, 25 Dec 2019 17:14:15 +0800
From: kbuild test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 3/3] drm/panel: add panel driver for Leadtek
 LTK500HD1829
Message-ID: <201912251756.Sa7kvTwW%lkp@intel.com>
References: <20191217222812.19872-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217222812.19872-3-heiko@sntech.de>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[cannot apply to drm-exynos/exynos-drm-next drm-intel/for-linux-next tegra-drm/drm/tegra/for-next drm-tip/drm-tip linus/master drm/drm-next v5.5-rc3 next-20191220]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Heiko-Stuebner/dt-bindings-Add-vendor-prefix-for-Leadtek-Technology/20191221-062606
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-129-g341daf20-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c:411:22: sparse: sparse: incorrect type in initializer (different argument counts)
>> drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c:411:22: sparse:    expected int ( *get_modes )( ... )
>> drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c:411:22: sparse:    got int ( * )( ... )
   drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c:463:15: sparse: sparse: undefined identifier 'drm_panel_of_backlight'

vim +411 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c

   407	
   408	static const struct drm_panel_funcs ltk500hd1829_funcs = {
   409		.unprepare = ltk500hd1829_unprepare,
   410		.prepare = ltk500hd1829_prepare,
 > 411		.get_modes = ltk500hd1829_get_modes,
   412	};
   413	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
