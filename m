Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E93950BD5F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 18:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E676210E087;
	Fri, 22 Apr 2022 16:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9971710E087
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 16:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650645893; x=1682181893;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zbjMmz4IPxc1dkPAAWlkk3z02hRug2vjYO3ePBmaF+4=;
 b=ju/ddF6mF6mwUX6C958FHUceB30E97dYhHsmncgutqd59Ps82PYnmAIy
 tUBnSYB+th4Vix2Hw+Gfm20IqkwwhKwnyWgyXG6u/bPd+oEPrYKmANcQN
 xF940ekyMetAsMITKJ29Mku55pOEWMzNLVWv46CLUyMCApX4CcRsl7d42
 Vd9d+v35Mdf9oviMc/xNLa7Ryn0hsZWm8bBa9gKPrzkLyz4+LDlq6qJ11
 kYgE4L0p0QLpmGw2VE4xXUe5HdrWU7eM7G1pyfiigeO4OD4EQTFqOOOOw
 aiKlHPrrIwvwlwxqOdLPQkRvOqkCTZiqIKfeGJQC/L/QfQhfJhFDAQbea Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="289845663"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; d="scan'208";a="289845663"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 09:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; d="scan'208";a="659101622"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2022 09:44:50 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nhwOn-000ALq-Aj;
 Fri, 22 Apr 2022 16:44:49 +0000
Date: Sat, 23 Apr 2022 00:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: Chenyang Li <lichenyang@loongson.cn>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <error27@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 devel@linuxdriverproject.org
Subject: Re: [PATCH v7 2/4] drm/loongson: Add GPIO and I2C driver for
 loongson drm.
Message-ID: <202204230046.2fBNTJrK-lkp@intel.com>
References: <20220422081459.682700-1-lichenyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422081459.682700-1-lichenyang@loongson.cn>
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
Cc: Yi Li <liyi@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chenyang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on v5.18-rc3 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Chenyang-Li/drm-loongson-Add-DRM-Driver-for-Loongson-7A1000-bridge-chip/20220422-161914
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20220423/202204230046.2fBNTJrK-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4a5b6ac99c37617e030a054ca431c5c9aab227b8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chenyang-Li/drm-loongson-Add-DRM-Driver-for-Loongson-7A1000-bridge-chip/20220422-161914
        git checkout 4a5b6ac99c37617e030a054ca431c5c9aab227b8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/loongson/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/loongson/loongson_encoder.c:10:27: warning: no previous prototype for 'loongson_bridge_detect' [-Wmissing-prototypes]
      10 | enum drm_connector_status loongson_bridge_detect(struct drm_bridge *bridge)
         |                           ^~~~~~~~~~~~~~~~~~~~~~


vim +/loongson_bridge_detect +10 drivers/gpu/drm/loongson/loongson_encoder.c

     9	
  > 10	enum drm_connector_status loongson_bridge_detect(struct drm_bridge *bridge)
    11	{
    12		unsigned char start = 0x0;
    13		struct i2c_msg msgs = {
    14			.addr = DDC_ADDR,
    15			.flags = 0,
    16			.len = 1,
    17			.buf = &start,
    18		};
    19	
    20		if (i2c_transfer(bridge->ddc, &msgs, 1) != 1)
    21			return connector_status_disconnected;
    22		else
    23			return connector_status_connected;
    24	}
    25	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
