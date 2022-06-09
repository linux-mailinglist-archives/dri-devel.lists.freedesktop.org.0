Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 074BA54406D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 02:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB8210E4B0;
	Thu,  9 Jun 2022 00:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A4A10E4B0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 00:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654733714; x=1686269714;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VJaoEcVsxQq1bvI/6bf3ZD+VGSdcsRuFeFp57nRDdjc=;
 b=mFXFR3ajhmTAghtq8gMvdRabflgzq2sexcREy1yXf1hN4ZEbvu8BrLCB
 26i9vTHgUop5je5xzUEVMosbaPr6C/NyUhJY7pjNpzneQW+TQRQM1/sIR
 jwY22F2vOc8cJarB95MbXiSHcz8pS4urnW1bO9Og8/opRUo63yLtomUNN
 a3QqtnPp90vw+ecNxZ9DO+df3MeIjLPcALK5iUsdOlyPBvq1hlDPy/njN
 9EB+BKaY9nl301IamnKlsXAfpg0T9l2IRrIFgjEAc48shvtT8mS/PtiaM
 BYAzavk5nRyuoXY/wtFfyizATMV3ppTqdqOdVqilk8oMYMDFyTS0OP8CA w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="338869025"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="338869025"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 17:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="609915376"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 08 Jun 2022 17:15:08 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nz5pL-000FG8-Nb;
 Thu, 09 Jun 2022 00:15:07 +0000
Date: Thu, 9 Jun 2022 08:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH 7/7] drm/bridge: anx7625: Add typec_mux_set callback
 function
Message-ID: <202206090842.UVDwwfxx-lkp@intel.com>
References: <20220607190131.1647511-8-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607190131.1647511-8-pmalani@chromium.org>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>,
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

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on usb/usb-testing v5.19-rc1 next-20220608]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Prashant-Malani/usb-typec-Introduce-typec-switch-binding/20220608-042545
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: nios2-buildonly-randconfig-r006-20220608 (https://download.01.org/0day-ci/archive/20220609/202206090842.UVDwwfxx-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/49c4c89ed5b50cbd623e611c8f4eba4b5ca9dd02
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Prashant-Malani/usb-typec-Introduce-typec-switch-binding/20220608-042545
        git checkout 49c4c89ed5b50cbd623e611c8f4eba4b5ca9dd02
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/gpu/drm/bridge/analogix/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/bridge/analogix/anx7625.c:19:
   include/linux/usb/typec_mux.h:83:19: warning: no previous prototype for 'fwnode_typec_mux_get' [-Wmissing-prototypes]
      83 | struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
         |                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/usb/typec_mux.h:89:6: warning: no previous prototype for 'typec_mux_put' [-Wmissing-prototypes]
      89 | void typec_mux_put(struct typec_mux *mux) {}
         |      ^~~~~~~~~~~~~
   include/linux/usb/typec_mux.h:91:5: warning: no previous prototype for 'typec_mux_set' [-Wmissing-prototypes]
      91 | int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
         |     ^~~~~~~~~~~~~
   include/linux/usb/typec_mux.h:103:1: warning: no previous prototype for 'typec_mux_register' [-Wmissing-prototypes]
     103 | typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
         | ^~~~~~~~~~~~~~~~~~
   include/linux/usb/typec_mux.h:107:6: warning: no previous prototype for 'typec_mux_unregister' [-Wmissing-prototypes]
     107 | void typec_mux_unregister(struct typec_mux *mux) {}
         |      ^~~~~~~~~~~~~~~~~~~~
   include/linux/usb/typec_mux.h:109:6: warning: no previous prototype for 'typec_mux_set_drvdata' [-Wmissing-prototypes]
     109 | void typec_mux_set_drvdata(struct typec_mux *mux, void *data) {}
         |      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/usb/typec_mux.h:110:7: warning: no previous prototype for 'typec_mux_get_drvdata' [-Wmissing-prototypes]
     110 | void *typec_mux_get_drvdata(struct typec_mux *mux)
         |       ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/analogix/anx7625.c: In function 'anx7625_typec_mux_set':
>> drivers/gpu/drm/bridge/analogix/anx7625.c:2616:64: error: passing argument 1 of 'typec_mux_get_drvdata' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2616 |         struct anx7625_port_data *data = typec_mux_get_drvdata(mux);
         |                                                                ^~~
         |                                                                |
         |                                                                struct typec_mux_dev *
   In file included from drivers/gpu/drm/bridge/analogix/anx7625.c:19:
   include/linux/usb/typec_mux.h:110:47: note: expected 'struct typec_mux *' but argument is of type 'struct typec_mux_dev *'
     110 | void *typec_mux_get_drvdata(struct typec_mux *mux)
         |                             ~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/bridge/analogix/anx7625.c: In function 'anx7625_register_mode_switch':
   drivers/gpu/drm/bridge/analogix/anx7625.c:2675:30: error: assignment to 'struct typec_mux_dev *' from incompatible pointer type 'struct typec_mux *' [-Werror=incompatible-pointer-types]
    2675 |         port_data->typec_mux = typec_mux_register(dev, &mux_desc);
         |                              ^
   drivers/gpu/drm/bridge/analogix/anx7625.c: In function 'anx7625_unregister_typec_switches':
   drivers/gpu/drm/bridge/analogix/anx7625.c:2689:57: error: passing argument 1 of 'typec_mux_unregister' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2689 |                 typec_mux_unregister(ctx->typec_ports[i].typec_mux);
         |                                      ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
         |                                                         |
         |                                                         struct typec_mux_dev *
   In file included from drivers/gpu/drm/bridge/analogix/anx7625.c:19:
   include/linux/usb/typec_mux.h:107:45: note: expected 'struct typec_mux *' but argument is of type 'struct typec_mux_dev *'
     107 | void typec_mux_unregister(struct typec_mux *mux) {}
         |                           ~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +/typec_mux_get_drvdata +2616 drivers/gpu/drm/bridge/analogix/anx7625.c

  2612	
  2613	static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
  2614					 struct typec_mux_state *state)
  2615	{
> 2616		struct anx7625_port_data *data = typec_mux_get_drvdata(mux);
  2617		struct anx7625_data *ctx = data->ctx;
  2618		struct device *dev = &ctx->client->dev;
  2619	
  2620		bool old_dp_connected = (ctx->typec_ports[0].dp_connected ||
  2621					 ctx->typec_ports[1].dp_connected);
  2622		bool new_dp_connected;
  2623	
  2624		if (ctx->num_typec_switches == 1)
  2625			return 0;
  2626	
  2627		dev_dbg(dev, "mux_set dp_connected: c0=%d, c1=%d\n",
  2628			ctx->typec_ports[0].dp_connected, ctx->typec_ports[1].dp_connected);
  2629	
  2630		data->dp_connected = (state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
  2631				      state->alt->mode == USB_TYPEC_DP_MODE);
  2632	
  2633		new_dp_connected = (ctx->typec_ports[0].dp_connected ||
  2634				    ctx->typec_ports[1].dp_connected);
  2635	
  2636		/* dp on, power on first */
  2637		if (!old_dp_connected && new_dp_connected)
  2638			pm_runtime_get_sync(dev);
  2639	
  2640		anx7625_typec_two_ports_update(ctx);
  2641	
  2642		/* dp off, power off last */
  2643		if (old_dp_connected && !new_dp_connected)
  2644			pm_runtime_put_sync(dev);
  2645	
  2646		return 0;
  2647	}
  2648	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
