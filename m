Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C4C543B2D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 20:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0EF112186;
	Wed,  8 Jun 2022 18:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1F5112186
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 18:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654712095; x=1686248095;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=USR+6rgHbgZJo4Au9EyLSSIMNVZXWNHuMgZbXeF60T8=;
 b=X0j9JAzlWHUDyeeYiYluIu245UwRnK2njMOkWqcP4h47w4U5UR6T44Ln
 c1MrNS6UDp0m9x4Zu1CQUmsi+Qrdq3EdKbzip2DhNxv9lGuhdtOvVIflB
 bq1X+W6rn2gaCiRuSRX/dmBqlOFInI6Ase3ezyK/y3d6vMH0mNc6B42XC
 f2dK3ICAIMBD4ngl0qd5OOG9ahRF35wxpKNpqFq9ENADXyNgIGrhuyHN6
 VxvP32pSVIBvo+Gfg6v2j8a0HU5GkMmlvnom2z1SlbZTbLSWWuoZZ6aUH
 MW32pYxbfrDWZu6YfLOjObeXBFox7R3bCN4n35bKmWQahsQD6T1Mz4aoO Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="275760191"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="275760191"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 11:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="683478114"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2022 11:14:48 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nz0CY-000Et1-O8;
 Wed, 08 Jun 2022 18:14:42 +0000
Date: Thu, 9 Jun 2022 02:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH 6/7] drm/bridge: anx7625: Register Type-C mode switches
Message-ID: <202206090139.lV7qgO5F-lkp@intel.com>
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
 David Airlie <airlied@linux.ie>, llvm@lists.linux.dev,
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

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on usb/usb-testing v5.19-rc1 next-20220608]
[cannot apply to balbi-usb/testing/next peter-chen-usb/for-usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Prashant-Malani/usb-typec-Introduce-typec-switch-binding/20220608-042545
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220609/202206090139.lV7qgO5F-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2ac4609c73d7bb4d1a585dae84559967ced3bad6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Prashant-Malani/usb-typec-Introduce-typec-switch-binding/20220608-042545
        git checkout 2ac4609c73d7bb4d1a585dae84559967ced3bad6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/bridge/analogix/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/bridge/analogix/anx7625.c:18:
>> include/linux/usb/typec_mux.h:83:19: warning: no previous prototype for function 'fwnode_typec_mux_get' [-Wmissing-prototypes]
   struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
                     ^
   include/linux/usb/typec_mux.h:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
   ^
   static 
>> include/linux/usb/typec_mux.h:89:6: warning: no previous prototype for function 'typec_mux_put' [-Wmissing-prototypes]
   void typec_mux_put(struct typec_mux *mux) {}
        ^
   include/linux/usb/typec_mux.h:89:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void typec_mux_put(struct typec_mux *mux) {}
   ^
   static 
>> include/linux/usb/typec_mux.h:91:5: warning: no previous prototype for function 'typec_mux_set' [-Wmissing-prototypes]
   int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
       ^
   include/linux/usb/typec_mux.h:91:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
   ^
   static 
>> include/linux/usb/typec_mux.h:103:1: warning: no previous prototype for function 'typec_mux_register' [-Wmissing-prototypes]
   typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
   ^
   include/linux/usb/typec_mux.h:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct typec_mux *
   ^
   static 
>> include/linux/usb/typec_mux.h:107:6: warning: no previous prototype for function 'typec_mux_unregister' [-Wmissing-prototypes]
   void typec_mux_unregister(struct typec_mux *mux) {}
        ^
   include/linux/usb/typec_mux.h:107:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void typec_mux_unregister(struct typec_mux *mux) {}
   ^
   static 
>> include/linux/usb/typec_mux.h:109:6: warning: no previous prototype for function 'typec_mux_set_drvdata' [-Wmissing-prototypes]
   void typec_mux_set_drvdata(struct typec_mux *mux, void *data) {}
        ^
   include/linux/usb/typec_mux.h:109:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void typec_mux_set_drvdata(struct typec_mux *mux, void *data) {}
   ^
   static 
>> include/linux/usb/typec_mux.h:110:7: warning: no previous prototype for function 'typec_mux_get_drvdata' [-Wmissing-prototypes]
   void *typec_mux_get_drvdata(struct typec_mux *mux)
         ^
   include/linux/usb/typec_mux.h:110:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *typec_mux_get_drvdata(struct typec_mux *mux)
   ^
   static 
   drivers/gpu/drm/bridge/analogix/anx7625.c:2617:23: error: incompatible pointer types assigning to 'struct typec_mux_dev *' from 'struct typec_mux *' [-Werror,-Wincompatible-pointer-types]
           port_data->typec_mux = typec_mux_register(dev, &mux_desc);
                                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/analogix/anx7625.c:2631:24: error: incompatible pointer types passing 'struct typec_mux_dev *' to parameter of type 'struct typec_mux *' [-Werror,-Wincompatible-pointer-types]
                   typec_mux_unregister(ctx->typec_ports[i].typec_mux);
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb/typec_mux.h:107:45: note: passing argument to parameter 'mux' here
   void typec_mux_unregister(struct typec_mux *mux) {}
                                               ^
   7 warnings and 2 errors generated.


vim +/fwnode_typec_mux_get +83 include/linux/usb/typec_mux.h

0835afe6b807ae Prashant Malani 2022-06-07   82  
0835afe6b807ae Prashant Malani 2022-06-07  @83  struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
0835afe6b807ae Prashant Malani 2022-06-07   84  				       const struct typec_altmode_desc *desc)
0835afe6b807ae Prashant Malani 2022-06-07   85  {
0835afe6b807ae Prashant Malani 2022-06-07   86  	return ERR_PTR(-EOPNOTSUPP);
0835afe6b807ae Prashant Malani 2022-06-07   87  }
0835afe6b807ae Prashant Malani 2022-06-07   88  
0835afe6b807ae Prashant Malani 2022-06-07  @89  void typec_mux_put(struct typec_mux *mux) {}
0835afe6b807ae Prashant Malani 2022-06-07   90  
0835afe6b807ae Prashant Malani 2022-06-07  @91  int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
0835afe6b807ae Prashant Malani 2022-06-07   92  {
0835afe6b807ae Prashant Malani 2022-06-07   93  	return -EOPNOTSUPP;
0835afe6b807ae Prashant Malani 2022-06-07   94  }
0835afe6b807ae Prashant Malani 2022-06-07   95  
0835afe6b807ae Prashant Malani 2022-06-07   96  static inline struct typec_mux *
0835afe6b807ae Prashant Malani 2022-06-07   97  typec_mux_get(struct device *dev, const struct typec_altmode_desc *desc)
0835afe6b807ae Prashant Malani 2022-06-07   98  {
0835afe6b807ae Prashant Malani 2022-06-07   99  	return ERR_PTR(-EOPNOTSUPP);
0835afe6b807ae Prashant Malani 2022-06-07  100  }
0835afe6b807ae Prashant Malani 2022-06-07  101  
0835afe6b807ae Prashant Malani 2022-06-07  102  struct typec_mux *
0835afe6b807ae Prashant Malani 2022-06-07 @103  typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
0835afe6b807ae Prashant Malani 2022-06-07  104  {
0835afe6b807ae Prashant Malani 2022-06-07  105  	return ERR_PTR(-EOPNOTSUPP);
0835afe6b807ae Prashant Malani 2022-06-07  106  }
0835afe6b807ae Prashant Malani 2022-06-07 @107  void typec_mux_unregister(struct typec_mux *mux) {}
0835afe6b807ae Prashant Malani 2022-06-07  108  
0835afe6b807ae Prashant Malani 2022-06-07 @109  void typec_mux_set_drvdata(struct typec_mux *mux, void *data) {}
0835afe6b807ae Prashant Malani 2022-06-07 @110  void *typec_mux_get_drvdata(struct typec_mux *mux)
0835afe6b807ae Prashant Malani 2022-06-07  111  {
0835afe6b807ae Prashant Malani 2022-06-07  112  	return ERR_PTR(-EOPNOTSUPP);
0835afe6b807ae Prashant Malani 2022-06-07  113  }
0835afe6b807ae Prashant Malani 2022-06-07  114  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
