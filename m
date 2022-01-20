Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B33494625
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 04:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0174110E311;
	Thu, 20 Jan 2022 03:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3D110E261
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 03:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642649331; x=1674185331;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=arwPcs8Kyc09pesbQKhsEh0ZIRHJCBHsbXYgE2TqQ8c=;
 b=OedDLRtrB/0+KaYCjns8xureIuY0ms5c/gG6OjbOyysbA61ftQYMgjLf
 n8JlDv51gMue9MHMxIvtrGQodsnywOEtZvcf7vYiTjn1jz8PTtr+Y9RVF
 2gFeVbLdJNANkRA8Ds3XvbkpLTfOi19be41yjU7L5Uqbv0/4NoetvYqar
 xwcQxP/FP7W38AVj14sexLv1pPOKgCC8Nbnji5ugD4/0L/FArUjrs15pu
 U38TBNgpr2qi7wzUFXY0MzqE9CrZibc1iaoY5YL1AuNU4pWulTA/pcDSR
 NdM9UJPU+Ue3dePYjv97BzGqMpOIfkuil5/ywzU0j0EBLZA3tdSdJNM0l w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="269658236"
X-IronPort-AV: E=Sophos;i="5.88,301,1635231600"; d="scan'208";a="269658236"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 19:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,301,1635231600"; d="scan'208";a="579061203"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 19 Jan 2022 19:28:48 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nAO7z-000Dxx-Kx; Thu, 20 Jan 2022 03:28:47 +0000
Date: Thu, 20 Jan 2022 11:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v5 3/4] drm/bridge: anx7625: Support reading edid through
 aux channel
Message-ID: <202201200932.S1r1TWum-lkp@intel.com>
References: <20220119151751.986185-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119151751.986185-3-hsinyi@chromium.org>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm/drm-next robh/for-next drm-intel/for-linux-next v5.16 next-20220118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hsin-Yi-Wang/drm-bridge-anx7625-send-DPCD-command-to-downstream/20220119-231952
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: arm-randconfig-c002-20220118 (https://download.01.org/0day-ci/archive/20220120/202201200932.S1r1TWum-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/61809df270082584886188b067ee19744f4b35e1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hsin-Yi-Wang/drm-bridge-anx7625-send-DPCD-command-to-downstream/20220119-231952
        git checkout 61809df270082584886188b067ee19744f4b35e1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function `anx7625_i2c_probe':
>> anx7625.c:(.text+0x1c10): undefined reference to `devm_of_dp_aux_populate_ep_devices'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
