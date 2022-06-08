Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED93543F2F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 00:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35430113628;
	Wed,  8 Jun 2022 22:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7B211361F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 22:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654727531; x=1686263531;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tKBsN7TLvPst4gWPH9NKX5dpH3pR/K/LrPbJPg+2h3s=;
 b=fZ1i2NOmBl2c+LfznI+/a6PbhjN2EnS3Ba6y9GpBu03e/71jW8kqLjuN
 bxqkWyC+lTmz3GwyBWVs2dPqaB1AQJv7E0qM8N5TOlsQrVQ4gBUYJcfNL
 rfeH+Ler+hjHu52NTu2jXmQ9H9g2LwQUHHlaAG6x2ueG0taYJsgta6tUE
 ZD5XaUdUUWbjj3/oY3rKPafycgtHAqVUJgm4aWKdM12WAwMTZrgEmwV4k
 URxDuIWvx54BqEqefp0TXfekbhu3ubIuBpn1UBZ+Y+PYgxcwNICHjYfNi
 8SDrxUZOXEMO1hb0kjfBFUDSbA2lPpcEjqKgeURd9LGJfG+al0u0HRRbC w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341163436"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341163436"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 15:32:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="555627386"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 08 Jun 2022 15:32:05 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nz4Dc-000FB4-Do;
 Wed, 08 Jun 2022 22:32:04 +0000
Date: Thu, 9 Jun 2022 06:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH 6/7] drm/bridge: anx7625: Register Type-C mode switches
Message-ID: <202206090626.D0er2ez1-lkp@intel.com>
References: <20220607190131.1647511-7-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607190131.1647511-7-pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kbuild-all@lists.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>, Prashant Malani <pmalani@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prashant,

I love your patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on usb/usb-testing v5.19-rc1 next-20220608]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Prashant-Malani/usb-typec-Introduce-typec-switch-binding/20220608-042545
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: nios2-buildonly-randconfig-r006-20220608 (https://download.01.org/0day-ci/archive/20220609/202206090626.D0er2ez1-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2ac4609c73d7bb4d1a585dae84559967ced3bad6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Prashant-Malani/usb-typec-Introduce-typec-switch-binding/20220608-042545
        git checkout 2ac4609c73d7bb4d1a585dae84559967ced3bad6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/gpu/drm/bridge/analogix/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/bridge/analogix/anx7625.c:18:
>> include/linux/usb/typec_mux.h:83:19: warning: no previous prototype for 'fwnode_typec_mux_get' [-Wmissing-prototypes]
      83 | struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
         |                   ^~~~~~~~~~~~~~~~~~~~
>> include/linux/usb/typec_mux.h:89:6: warning: no previous prototype for 'typec_mux_put' [-Wmissing-prototypes]
      89 | void typec_mux_put(struct typec_mux *mux) {}
         |      ^~~~~~~~~~~~~
>> include/linux/usb/typec_mux.h:91:5: warning: no previous prototype for 'typec_mux_set' [-Wmissing-prototypes]
      91 | int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
         |     ^~~~~~~~~~~~~
>> include/linux/usb/typec_mux.h:103:1: warning: no previous prototype for 'typec_mux_register' [-Wmissing-prototypes]
     103 | typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
         | ^~~~~~~~~~~~~~~~~~
>> include/linux/usb/typec_mux.h:107:6: warning: no previous prototype for 'typec_mux_unregister' [-Wmissing-prototypes]
     107 | void typec_mux_unregister(struct typec_mux *mux) {}
         |      ^~~~~~~~~~~~~~~~~~~~
>> include/linux/usb/typec_mux.h:109:6: warning: no previous prototype for 'typec_mux_set_drvdata' [-Wmissing-prototypes]
     109 | void typec_mux_set_drvdata(struct typec_mux *mux, void *data) {}
         |      ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/usb/typec_mux.h:110:7: warning: no previous prototype for 'typec_mux_get_drvdata' [-Wmissing-prototypes]
     110 | void *typec_mux_get_drvdata(struct typec_mux *mux)
         |       ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/analogix/anx7625.c: In function 'anx7625_register_mode_switch':
>> drivers/gpu/drm/bridge/analogix/anx7625.c:2617:30: error: assignment to 'struct typec_mux_dev *' from incompatible pointer type 'struct typec_mux *' [-Werror=incompatible-pointer-types]
    2617 |         port_data->typec_mux = typec_mux_register(dev, &mux_desc);
         |                              ^
   drivers/gpu/drm/bridge/analogix/anx7625.c: In function 'anx7625_unregister_typec_switches':
>> drivers/gpu/drm/bridge/analogix/anx7625.c:2631:57: error: passing argument 1 of 'typec_mux_unregister' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2631 |                 typec_mux_unregister(ctx->typec_ports[i].typec_mux);
         |                                      ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
         |                                                         |
         |                                                         struct typec_mux_dev *
   In file included from drivers/gpu/drm/bridge/analogix/anx7625.c:18:
   include/linux/usb/typec_mux.h:107:45: note: expected 'struct typec_mux *' but argument is of type 'struct typec_mux_dev *'
     107 | void typec_mux_unregister(struct typec_mux *mux) {}
         |                           ~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +2617 drivers/gpu/drm/bridge/analogix/anx7625.c

  2590	
  2591	static int anx7625_register_mode_switch(struct device *dev, struct device_node *node,
  2592						struct anx7625_data *ctx)
  2593	{
  2594		struct anx7625_port_data *port_data;
  2595		struct typec_mux_desc mux_desc = {};
  2596		char name[32];
  2597		u32 port_num;
  2598		int ret;
  2599	
  2600		ret = of_property_read_u32(node, "reg", &port_num);
  2601		if (ret)
  2602			return ret;
  2603	
  2604		if (port_num >= ctx->num_typec_switches) {
  2605			dev_err(dev, "Invalid port number specified: %d\n", port_num);
  2606			return -EINVAL;
  2607		}
  2608	
  2609		port_data = &ctx->typec_ports[port_num];
  2610		port_data->ctx = ctx;
  2611		mux_desc.fwnode = &node->fwnode;
  2612		mux_desc.drvdata = port_data;
  2613		snprintf(name, sizeof(name), "%s-%u", node->name, port_num);
  2614		mux_desc.name = name;
  2615		mux_desc.set = anx7625_typec_mux_set;
  2616	
> 2617		port_data->typec_mux = typec_mux_register(dev, &mux_desc);
  2618		if (IS_ERR(port_data->typec_mux)) {
  2619			ret = PTR_ERR(port_data->typec_mux);
  2620			dev_err(dev, "Mode switch register for port %d failed: %d", port_num, ret);
  2621		}
  2622	
  2623		return ret;
  2624	}
  2625	
  2626	static void anx7625_unregister_typec_switches(struct anx7625_data *ctx)
  2627	{
  2628		int i;
  2629	
  2630		for (i = 0; i < ctx->num_typec_switches; i++)
> 2631			typec_mux_unregister(ctx->typec_ports[i].typec_mux);
  2632	}
  2633	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
