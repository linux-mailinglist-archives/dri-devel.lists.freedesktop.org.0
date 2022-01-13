Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E94F48DEB2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 21:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DB510E2B3;
	Thu, 13 Jan 2022 20:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5653810E12A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 20:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642105025; x=1673641025;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aKc/MkMx9cUEOGpw55cv5Z4VZVMCA0JOdIwIdP/az/c=;
 b=PXoqLft2v1KM5Bw1kaZ3HBWBQtCy+UrTJTRjIWD5eV88fyNbTi9DBdcf
 EvuVuPECk18oqSQAdCE6H0XTM4V2m4YfVXGfhIV4dZF5WeWCCpl0/0n6G
 Ya+MlMKB9TDsWgvKapZxoI3LN7bam/LEoEoinjY3aXSeSn4YvdPOB2R3m
 gTEgqft1Sg/Q8f7YgB1x3TiLhxis5Ykf+nLDxFIo/lmsxUn3u6+gpZgsz
 btpn2PNVkvRZXLFMuqhmlfkdi98HC+s1eZPK4XHCUKygX68bQ4LmFMsZ2
 XVPb0PsxQ1UeVvsHP3iaifdJR0njSj1q6uFdg08uobwI0nc+3cs664hkX g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="244059305"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="244059305"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 12:17:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="691935136"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 13 Jan 2022 12:17:02 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n86Wr-0007bn-D1; Thu, 13 Jan 2022 20:17:01 +0000
Date: Fri, 14 Jan 2022 04:16:47 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 04/16] drm/connector: Fix typo in output format
Message-ID: <202201140436.WlQxR5wG-lkp@intel.com>
References: <20220113140720.1678907-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113140720.1678907-5-maxime@cerno.tech>
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
Cc: kbuild-all@lists.01.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I love your patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-intel/for-linux-next v5.16 next-20220113]
[cannot apply to anholt/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maxime-Ripard/drm-vc4-hdmi-Yet-Another-Approach-to-HDMI-YUV-output/20220113-221035
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20220114/202201140436.WlQxR5wG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/52bba93426db6667839f3b01a759ad9084127008
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-vc4-hdmi-Yet-Another-Approach-to-HDMI-YUV-output/20220113-221035
        git checkout 52bba93426db6667839f3b01a759ad9084127008
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=csky SHELL=/bin/bash drivers/gpu/drm/rockchip/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c: In function 'rockchip_dp_get_modes':
>> drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:120:48: error: 'DRM_COLOR_FORMAT_YCRCB422' undeclared (first use in this function); did you mean 'DRM_COLOR_FORMAT_YCBCR422'?
     120 |         u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCRCB422;
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                DRM_COLOR_FORMAT_YCBCR422
   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:120:48: note: each undeclared identifier is reported only once for each function it appears in


vim +120 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c

   114	
   115	static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
   116					 struct drm_connector *connector)
   117	{
   118		struct drm_display_info *di = &connector->display_info;
   119		/* VOP couldn't output YUV video format for eDP rightly */
 > 120		u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCRCB422;
   121	
   122		if ((di->color_formats & mask)) {
   123			DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
   124			di->color_formats &= ~mask;
   125			di->color_formats |= DRM_COLOR_FORMAT_RGB444;
   126			di->bpc = 8;
   127		}
   128	
   129		return 0;
   130	}
   131	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
