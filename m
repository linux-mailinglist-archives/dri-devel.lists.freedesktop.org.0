Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C728A4A7EB6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 05:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE4B10E8E2;
	Thu,  3 Feb 2022 04:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FCC10E8E2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 04:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643863369; x=1675399369;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4HJIgMbu1i5ul9x1By+kPANYBrkRuORglkmy3K7GOik=;
 b=SbtWbTxXMbgBCXNdhJuH+IaSflZWY511iaSkzz8MKj6ZJ3TonN98uUQc
 woe+I+uBBvqNyfSJNfF1F4UVMxrmKefMmziP//OHGVl3vbbZJJAIBzpE8
 t+z3NnSR8Cz62zdyG9yAPjqSWr4FiskJl6GBSbLPLWz/AmuUm5xb98y4K
 vbsfY85ak9F6klA21Gx/kVnsSDTyJKdfRyB5SNizXVxGCtUZ7RgU0QhEH
 OcPH505i48W3V1dj4HGfB0IcnDHPHih8GfyXg6xHtIIf2UzwlAkwzeCuE
 DZDzOW9C3KCuvJyAUKC0d1VfBdJ6OGf26bRJZB21ozBJrQfKIemjobzkz Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="248291412"
X-IronPort-AV: E=Sophos;i="5.88,338,1635231600"; d="scan'208";a="248291412"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 20:42:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,338,1635231600"; d="scan'208";a="566289443"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 02 Feb 2022 20:42:46 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nFTxF-000VaP-E0; Thu, 03 Feb 2022 04:42:45 +0000
Date: Thu, 3 Feb 2022 12:41:58 +0800
From: kernel test robot <lkp@intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH RESEND v5 3/4] drm/bridge: anx7625: Support reading edid
 through aux channel
Message-ID: <202202031234.X27Z4zTL-lkp@intel.com>
References: <20220202160602.440792-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202160602.440792-3-hsinyi@chromium.org>
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
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on next-20220202]
[cannot apply to robh/for-next drm-intel/for-linux-next v5.17-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hsin-Yi-Wang/drm-bridge-anx7625-send-DPCD-command-to-downstream/20220203-001041
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: s390-randconfig-r044-20220130 (https://download.01.org/0day-ci/archive/20220203/202202031234.X27Z4zTL-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f706d1336c4d5a5984565b964370868113710354
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hsin-Yi-Wang/drm-bridge-anx7625-send-DPCD-command-to-downstream/20220203-001041
        git checkout f706d1336c4d5a5984565b964370868113710354
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function `anx7625_i2c_probe':
>> anx7625.c:(.text+0x5d02): undefined reference to `devm_of_dp_aux_populate_ep_devices'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
