Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6172373639
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 10:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77286E0C6;
	Wed,  5 May 2021 08:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E959D6E0C6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 08:24:34 +0000 (UTC)
IronPort-SDR: DiSJQJJTJsHalDrX8y44uC+HhvsX3kmzieLJN9OVrtQWK7lYZe8GLAMvC6NBlcgKr068jHNJtn
 u4yUSeCfhtdQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="259439006"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
 d="gz'50?scan'50,208,50";a="259439006"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 01:24:08 -0700
IronPort-SDR: LVFpc62FnlMqMjYcsWtERdbd80XSGCLCBgYXbxLMhERTIWYPNeMhWtb15laZJL0eGUmLE2lZCU
 xl2wvVmvbJzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
 d="gz'50?scan'50,208,50";a="429740232"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 05 May 2021 01:24:05 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1leCpB-0009td-4w; Wed, 05 May 2021 08:24:05 +0000
Date: Wed, 5 May 2021 16:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/6] drm/vmwgfx: Add basic support for SVGA3
Message-ID: <202105051616.l8IfI5q2-lkp@intel.com>
References: <20210505035740.286923-6-zackr@vmware.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <20210505035740.286923-6-zackr@vmware.com>
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
Cc: sroland@vmware.com, krastevm@vmware.com, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zack,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master next-20210505]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next drm/drm-next v5.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zack-Rusin/drm-vmwgfx-SVGA-v3-and-arm64-support/20210505-120026
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-s021-20210505 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/4acf63c8eca79f6073ada0994b0e2a03c8fcfb71
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zack-Rusin/drm-vmwgfx-SVGA-v3-and-arm64-support/20210505-120026
        git checkout 4acf63c8eca79f6073ada0994b0e2a03c8fcfb71
        # save the attached .config to linux build tree
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:718:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *rmmio @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:718:28: sparse:     expected unsigned int [usertype] *rmmio
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:718:28: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: note: in included file:
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
--
   drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c: note: in included file:
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
--
   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c: note: in included file (through drivers/gpu/drm/vmwgfx/vmwgfx_kms.h):
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
--
   drivers/gpu/drm/vmwgfx/vmwgfx_irq.c: note: in included file:
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
--
>> drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:105:24: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:674:33: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c: note: in included file:
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
--
   drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c: note: in included file (through drivers/gpu/drm/vmwgfx/vmwgfx_kms.h):
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
--
   drivers/gpu/drm/vmwgfx/vmwgfx_fence.c: note: in included file:
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int [usertype] *
--
   drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: note: in included file:
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int [usertype] *

vim +718 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c

   692	
   693	static int vmw_setup_pci_resources(struct vmw_private *dev,
   694					   unsigned long pci_id)
   695	{
   696		resource_size_t rmmio_start;
   697		resource_size_t rmmio_size;
   698		resource_size_t fifo_start;
   699		resource_size_t fifo_size;
   700		int ret;
   701		struct pci_dev *pdev = to_pci_dev(dev->drm.dev);
   702	
   703		pci_set_master(pdev);
   704	
   705		ret = pci_request_regions(pdev, "vmwgfx probe");
   706		if (ret)
   707			return ret;
   708	
   709		dev->pci_id = pci_id;
   710		if (pci_id == VMWGFX_PCI_ID_SVGA3) {
   711			rmmio_start = pci_resource_start(pdev, 0);
   712			rmmio_size = pci_resource_len(pdev, 0);
   713			dev->vram_start = pci_resource_start(pdev, 2);
   714			dev->vram_size = pci_resource_len(pdev, 2);
   715	
   716			DRM_INFO("Register MMIO at 0x%pa size is %llu kiB\n",
   717				 &rmmio_start, (uint64_t)rmmio_size / 1024);
 > 718			dev->rmmio = devm_ioremap(dev->drm.dev,
   719						  rmmio_start,
   720						  rmmio_size);
   721			if (IS_ERR(dev->rmmio)) {
   722				DRM_ERROR("Failed mapping registers mmio memory.\n");
   723				pci_release_regions(pdev);
   724				return PTR_ERR(dev->rmmio);
   725			}
   726		} else if (pci_id == VMWGFX_PCI_ID_SVGA2) {
   727			dev->io_start = pci_resource_start(pdev, 0);
   728			dev->vram_start = pci_resource_start(pdev, 1);
   729			dev->vram_size = pci_resource_len(pdev, 1);
   730			fifo_start = pci_resource_start(pdev, 2);
   731			fifo_size = pci_resource_len(pdev, 2);
   732	
   733			DRM_INFO("FIFO at %pa size is %llu kiB\n",
   734				 &fifo_start, (uint64_t)fifo_size / 1024);
   735			dev->fifo_mem = devm_memremap(dev->drm.dev,
   736						      fifo_start,
   737						      fifo_size,
   738						      MEMREMAP_WB);
   739	
   740			if (IS_ERR(dev->fifo_mem)) {
   741				DRM_ERROR("Failed mapping FIFO memory.\n");
   742				pci_release_regions(pdev);
   743				return PTR_ERR(dev->fifo_mem);
   744			}
   745		} else {
   746			pci_release_regions(pdev);
   747			return -EINVAL;
   748		}
   749	
   750		/*
   751		 * This is approximate size of the vram, the exact size will only
   752		 * be known after we read SVGA_REG_VRAM_SIZE. The PCI resource
   753		 * size will be equal to or bigger than the size reported by
   754		 * SVGA_REG_VRAM_SIZE.
   755		 */
   756		DRM_INFO("VRAM at %pa size is %llu kiB\n",
   757			 &dev->vram_start, (uint64_t)dev->vram_size / 1024);
   758	
   759		return 0;
   760	}
   761	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--/9DWx/yDrRhgMJTb
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--/9DWx/yDrRhgMJTb--
