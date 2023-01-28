Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA8767FA4A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 19:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5883F10E232;
	Sat, 28 Jan 2023 18:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E76310E232
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 18:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674932274; x=1706468274;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RjSzj603NNwrtXbFuo4/idkfWRdGyQzkcIKtdJ9tF2w=;
 b=W+Dj+s+tdkVBxNVd855omUkR7VygidZlu7fKh2AGQdD2twR7bOPHWIag
 c8upGuMlAM9DAKkdqQ/XvdnfOdoQ34otnfKYAyf6fGouiYaoFaz5uDN5o
 NLUS+UcN4w4puI2m6uIJsjkgDQz/tA8d59utYDraxyHXCh+iMToiQm8J5
 pSEqCbnWx7h7+UtlKfT7sSW5ZssJ7GZhQVyfU8lc1FxNHjT+uhRp8MzRh
 CqLr/1tPqujINIm8UdUfHaq307XEMjF97gk6jT3WatLa2xUW4TuMQ+Lek
 GHJR+Jv2Lb8zys5Q0hTdroEwtj80RXu1+evwRaYJYTGGrnDjpdViNjSzw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="325015343"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="325015343"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 10:57:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="771960926"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="771960926"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2023 10:57:47 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pLqOZ-00010C-00;
 Sat, 28 Jan 2023 18:57:47 +0000
Date: Sun, 29 Jan 2023 02:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cormier <jcormier@criticallink.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 4/4] DRM: BRIDGE: TFP410: If connected, use I2C for
 polled HPD status.
Message-ID: <202301290252.zgcWeegX-lkp@intel.com>
References: <20230125-tfp410_i2c-v1-4-66a4d4e390b7@criticallink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125-tfp410_i2c-v1-4-66a4d4e390b7@criticallink.com>
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
Cc: Jonathan Cormier <jcormier@criticallink.com>, devicetree@vger.kernel.org,
 Bob Duke <bduke@criticallink.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Williamson <michael.williamson@criticallink.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 93f875a8526a291005e7f38478079526c843cbec]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cormier/dt-bindings-display-bridge-tfp410-Add-tfp410-i2c-example/20230128-183627
base:   93f875a8526a291005e7f38478079526c843cbec
patch link:    https://lore.kernel.org/r/20230125-tfp410_i2c-v1-4-66a4d4e390b7%40criticallink.com
patch subject: [PATCH 4/4] DRM: BRIDGE: TFP410: If connected, use I2C for polled HPD status.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301290252.zgcWeegX-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/c4659fa4c02b62087c095ca99978e5eac8b490de
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Cormier/dt-bindings-display-bridge-tfp410-Add-tfp410-i2c-example/20230128-183627
        git checkout c4659fa4c02b62087c095ca99978e5eac8b490de
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/ti-tfp410.c: In function 'tfp410_connector_detect':
>> drivers/gpu/drm/bridge/ti-tfp410.c:111:13: warning: unused variable 'val' [-Wunused-variable]
     111 |         u32 val;
         |             ^~~


vim +/val +111 drivers/gpu/drm/bridge/ti-tfp410.c

   106	
   107	static enum drm_connector_status
   108	tfp410_connector_detect(struct drm_connector *connector, bool force)
   109	{
   110		struct tfp410 *dvi = drm_connector_to_tfp410(connector);
 > 111		u32 val;
   112		unsigned int ret;
   113	
   114		if (dvi->i2c) {
   115			ret = regmap_test_bits(dvi->regmap, TFP410_REG_CTL_2_MODE, TFP410_BIT_HTPLG);
   116			if (ret < 0)
   117				dev_err(dvi->dev, "%s failed to read HTPLG bit : %d\n", __func__, ret);
   118			else
   119				return ret ? connector_status_connected : connector_status_disconnected;
   120		}
   121	
   122		return drm_bridge_detect(dvi->next_bridge);
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
