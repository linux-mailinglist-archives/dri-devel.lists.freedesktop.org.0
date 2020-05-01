Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF1F1C1FA1
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 23:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE786ED56;
	Fri,  1 May 2020 21:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B988E6ED57
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 21:30:30 +0000 (UTC)
IronPort-SDR: DoQPleWmutqkQaN/v5CgTFbD8BdwZ8wf1/JX3V0r9fHPTjGGcX55+jvbHw+JgxlDdwBGjgaeVT
 jLW5iQYa/Hcg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2020 14:30:30 -0700
IronPort-SDR: GiBVpNavePbbLUj4ZnLdDkFhW1HKiMY1/B+pTPjckSkFguqPGK+RqaZidhcgOB+A0EuW5vcohJ
 lSCkW7DdgOAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,341,1583222400"; d="scan'208";a="250112070"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 01 May 2020 14:30:28 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jUdEp-0004JE-Km; Sat, 02 May 2020 05:30:27 +0800
Date: Sat, 2 May 2020 05:29:37 +0800
From: kbuild test robot <lkp@intel.com>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org,
 nirmoy.das@amd.com, christian.koenig@amd.com, chris@chris-wilson.co.uk
Subject: Re: [PATCH v2 1/1] drm/mm: optimize rb_hole_addr rbtree search
Message-ID: <202005020555.d14nlN9q%lkp@intel.com>
References: <20200430095839.6474-1-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430095839.6474-1-nirmoy.das@amd.com>
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
Cc: nirmoy.das@amd.com, kbuild-all@lists.01.org, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next drm-tip/drm-tip linus/master v5.7-rc3 next-20200501]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Nirmoy-Das/drm-mm-optimize-rb_hole_addr-rbtree-search/20200501-165835
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/drm_mm.c:248:6: sparse: sparse: symbol 'insert_hole_addr' was not declared. Should it be static?
   drivers/gpu/drm/drm_mm.c:401:24: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/drm_mm.c:441:24: sparse: sparse: Using plain integer as NULL pointer

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
