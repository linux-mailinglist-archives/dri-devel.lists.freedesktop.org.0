Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ADA5855E5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 22:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A70712AC27;
	Fri, 29 Jul 2022 20:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC00E12B6E6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 20:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659125247; x=1690661247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G3EYJuCImAFppAcSlVnUcEfwImmJRRAzetmU8K028Uo=;
 b=ZJ2znwYdu4xtfmvTw0e/6H7GDv/aKGMf4ueL9XHpaJdVQREQ4ahTdeBy
 LZ+d1roAPeZEUIE3zNR0G6uR/EqELRfhQFxK+YvPrHNyJ1eHRZQfpL9D8
 0Zz3Rqf988cjsjS0HsWz1Lp9FPiv8+N8cCTt101ZeSV7OIS3cz0+ZYjNd
 q4kFa+zzuCYIWvGpmzVfkdXbnXC0ABXwrYTOOPUxrV8Or74XYvazDi1bV
 NRpsmwMOhOn9bP4uye2F2z4svnzYzBL+chOYc6KWWJSCgCGyynMg+sgqh
 0D/ukUzuelobEPNXmh5afk/swOqAQboizyOt0eqrYT/mghL8zSndcATEC w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="268608875"
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; d="scan'208";a="268608875"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 13:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; d="scan'208";a="605067850"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 29 Jul 2022 13:07:21 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oHWGW-000C3P-1J;
 Fri, 29 Jul 2022 20:07:20 +0000
Date: Sat, 30 Jul 2022 04:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v1 33/35] drm/connector: Remove TV modes property
Message-ID: <202207300305.EGSDOjh4-lkp@intel.com>
References: <20220728-rpi-analog-tv-properties-v1-33-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-33-3d53ae722097@cerno.tech>
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
Cc: kbuild-all@lists.01.org, Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I love your patch! Yet something to improve:

[auto build test ERROR on 37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-Analog-TV-Improvements/20220730-004859
base:   37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9
config: hexagon-randconfig-r041-20220729 (https://download.01.org/0day-ci/archive/20220730/202207300305.EGSDOjh4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/83327cd72054a9c8d02b6f632453a8bdc90d3797
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-Analog-TV-Improvements/20220730-004859
        git checkout 83327cd72054a9c8d02b6f632453a8bdc90d3797
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/i2c/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i2c/ch7006_drv.c:253:51: error: too many arguments to function call, expected 2, have 3
           drm_mode_create_tv_properties(dev, NUM_TV_NORMS, ch7006_tv_norm_names);
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                    ^~~~~~~~~~~~~~~~~~~~
   include/drm/drm_connector.h:1807:5: note: 'drm_mode_create_tv_properties' declared here
   int drm_mode_create_tv_properties(struct drm_device *dev,
       ^
   1 error generated.


vim +253 drivers/gpu/drm/i2c/ch7006_drv.c

6ee738610f41b5 Ben Skeggs   2009-12-11  245  
6ee738610f41b5 Ben Skeggs   2009-12-11  246  static int ch7006_encoder_create_resources(struct drm_encoder *encoder,
6ee738610f41b5 Ben Skeggs   2009-12-11  247  					   struct drm_connector *connector)
6ee738610f41b5 Ben Skeggs   2009-12-11  248  {
6ee738610f41b5 Ben Skeggs   2009-12-11  249  	struct ch7006_priv *priv = to_ch7006_priv(encoder);
6ee738610f41b5 Ben Skeggs   2009-12-11  250  	struct drm_device *dev = encoder->dev;
6ee738610f41b5 Ben Skeggs   2009-12-11  251  	struct drm_mode_config *conf = &dev->mode_config;
6ee738610f41b5 Ben Skeggs   2009-12-11  252  
6ee738610f41b5 Ben Skeggs   2009-12-11 @253  	drm_mode_create_tv_properties(dev, NUM_TV_NORMS, ch7006_tv_norm_names);
6ee738610f41b5 Ben Skeggs   2009-12-11  254  
d9bc3c02e36d84 Sascha Hauer 2012-02-06  255  	priv->scale_property = drm_property_create_range(dev, 0, "scale", 0, 2);
44084efc2fd804 Insu Yun     2016-01-28  256  	if (!priv->scale_property)
44084efc2fd804 Insu Yun     2016-01-28  257  		return -ENOMEM;
6ee738610f41b5 Ben Skeggs   2009-12-11  258  
ec61c71d0dba24 Rob Clark    2012-10-11  259  	drm_object_attach_property(&connector->base, conf->tv_select_subconnector_property,
6ee738610f41b5 Ben Skeggs   2009-12-11  260  				      priv->select_subconnector);
ec61c71d0dba24 Rob Clark    2012-10-11  261  	drm_object_attach_property(&connector->base, conf->tv_subconnector_property,
6ee738610f41b5 Ben Skeggs   2009-12-11  262  				      priv->subconnector);
ec61c71d0dba24 Rob Clark    2012-10-11  263  	drm_object_attach_property(&connector->base, conf->tv_left_margin_property,
6ee738610f41b5 Ben Skeggs   2009-12-11  264  				      priv->hmargin);
ec61c71d0dba24 Rob Clark    2012-10-11  265  	drm_object_attach_property(&connector->base, conf->tv_bottom_margin_property,
6ee738610f41b5 Ben Skeggs   2009-12-11  266  				      priv->vmargin);
ec61c71d0dba24 Rob Clark    2012-10-11  267  	drm_object_attach_property(&connector->base, conf->tv_mode_property,
6ee738610f41b5 Ben Skeggs   2009-12-11  268  				      priv->norm);
ec61c71d0dba24 Rob Clark    2012-10-11  269  	drm_object_attach_property(&connector->base, conf->tv_brightness_property,
6ee738610f41b5 Ben Skeggs   2009-12-11  270  				      priv->brightness);
ec61c71d0dba24 Rob Clark    2012-10-11  271  	drm_object_attach_property(&connector->base, conf->tv_contrast_property,
6ee738610f41b5 Ben Skeggs   2009-12-11  272  				      priv->contrast);
ec61c71d0dba24 Rob Clark    2012-10-11  273  	drm_object_attach_property(&connector->base, conf->tv_flicker_reduction_property,
6ee738610f41b5 Ben Skeggs   2009-12-11  274  				      priv->flicker);
ec61c71d0dba24 Rob Clark    2012-10-11  275  	drm_object_attach_property(&connector->base, priv->scale_property,
6ee738610f41b5 Ben Skeggs   2009-12-11  276  				      priv->scale);
6ee738610f41b5 Ben Skeggs   2009-12-11  277  
6ee738610f41b5 Ben Skeggs   2009-12-11  278  	return 0;
6ee738610f41b5 Ben Skeggs   2009-12-11  279  }
6ee738610f41b5 Ben Skeggs   2009-12-11  280  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
