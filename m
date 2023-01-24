Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 768A0679805
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 13:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5D210E671;
	Tue, 24 Jan 2023 12:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A3F10E062;
 Tue, 24 Jan 2023 12:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674563224; x=1706099224;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z3Dx3gBnEObZB0hnHZv+e1Wl3zLmeyqgQt9ooQNjwho=;
 b=V2te0Egt2zx/BimNAQj2wKP53nIMpEq8mZQkQ8UxX1zhEjegOwxeh651
 +r38boeArCgQE8afz9Fz3h5MC3+5IpY4Y5JIuQkpb/ByeCh/Sk9FcnIqP
 /SXtJ5Q0mji3Ca4dmLnSLrtBuWJBFHjJNIEaLKZ0jHvyj56Aub8/rQeWM
 aTuKNwPEykYTig0DGQji//gU68whfQYp8y9adsvWcrXtwuP7swjJ85mtl
 E2/f8U56t8E11eM1be+z/5s0Gg26XDYeaTUKzgDg3untDR02sgcYj2alL
 +6aNsuy/vWphnYRwiLP+SxnUmhP0ehTsGsGK7UhgI2U415h8QBxUdAmFv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="388628911"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="388628911"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 04:27:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655403204"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="655403204"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 24 Jan 2023 04:26:55 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pKIO6-0006S8-32;
 Tue, 24 Jan 2023 12:26:54 +0000
Date: Tue, 24 Jan 2023 20:26:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/connector: move ELD and video/audio
 latencies to display info
Message-ID: <202301242049.eKzx7RzZ-lkp@intel.com>
References: <20230124094154.2282778-3-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124094154.2282778-3-jani.nikula@intel.com>
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
Cc: Pan@freedesktop.org, Emma Anholt <emma@anholt.net>,
 amd-gfx@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 jani.nikula@intel.com, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-mediatek@lists.infradead.org, oe-kbuild-all@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>, Xinhui <Xinhui.Pan@amd.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-connector-move-HDR-sink-metadata-to-display-info/20230124-174322
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230124094154.2282778-3-jani.nikula%40intel.com
patch subject: [Intel-gfx] [PATCH 3/3] drm/connector: move ELD and video/audio latencies to display info
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230124/202301242049.eKzx7RzZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1e92b5478cfc1b0df66153652111117e9548b0d5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jani-Nikula/drm-connector-move-HDR-sink-metadata-to-display-info/20230124-174322
        git checkout 1e92b5478cfc1b0df66153652111117e9548b0d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tegra/hdmi.c: In function 'tegra_hdmi_write_eld':
>> drivers/gpu/drm/tegra/hdmi.c:620:60: error: 'struct drm_connector' has no member named 'eld'
     620 |         size_t length = drm_eld_size(hdmi->output.connector.eld), i;
         |                                                            ^
   drivers/gpu/drm/tegra/hdmi.c:624:72: error: 'struct drm_connector' has no member named 'eld'
     624 |                 tegra_hdmi_writel(hdmi, i << 8 | hdmi->output.connector.eld[i],
         |                                                                        ^
--
   drivers/gpu/drm/tegra/sor.c: In function 'tegra_sor_write_eld':
>> drivers/gpu/drm/tegra/sor.c:1951:59: error: 'struct drm_connector' has no member named 'eld'
    1951 |         size_t length = drm_eld_size(sor->output.connector.eld), i;
         |                                                           ^
   drivers/gpu/drm/tegra/sor.c:1954:69: error: 'struct drm_connector' has no member named 'eld'
    1954 |                 tegra_sor_writel(sor, i << 8 | sor->output.connector.eld[i],
         |                                                                     ^


vim +620 drivers/gpu/drm/tegra/hdmi.c

edec4af4c3d6d2 Thierry Reding 2012-11-15  617  
5234549b93aa2a Thierry Reding 2015-08-07  618  static void tegra_hdmi_write_eld(struct tegra_hdmi *hdmi)
5234549b93aa2a Thierry Reding 2015-08-07  619  {
5234549b93aa2a Thierry Reding 2015-08-07 @620  	size_t length = drm_eld_size(hdmi->output.connector.eld), i;
5234549b93aa2a Thierry Reding 2015-08-07  621  	u32 value;
edec4af4c3d6d2 Thierry Reding 2012-11-15  622  
5234549b93aa2a Thierry Reding 2015-08-07  623  	for (i = 0; i < length; i++)
5234549b93aa2a Thierry Reding 2015-08-07  624  		tegra_hdmi_writel(hdmi, i << 8 | hdmi->output.connector.eld[i],
5234549b93aa2a Thierry Reding 2015-08-07  625  				  HDMI_NV_PDISP_SOR_AUDIO_HDA_ELD_BUFWR);
edec4af4c3d6d2 Thierry Reding 2012-11-15  626  
5234549b93aa2a Thierry Reding 2015-08-07  627  	/*
5234549b93aa2a Thierry Reding 2015-08-07  628  	 * The HDA codec will always report an ELD buffer size of 96 bytes and
5234549b93aa2a Thierry Reding 2015-08-07  629  	 * the HDA codec driver will check that each byte read from the buffer
5234549b93aa2a Thierry Reding 2015-08-07  630  	 * is valid. Therefore every byte must be written, even if no 96 bytes
5234549b93aa2a Thierry Reding 2015-08-07  631  	 * were parsed from EDID.
5234549b93aa2a Thierry Reding 2015-08-07  632  	 */
5234549b93aa2a Thierry Reding 2015-08-07  633  	for (i = length; i < HDMI_ELD_BUFFER_SIZE; i++)
5234549b93aa2a Thierry Reding 2015-08-07  634  		tegra_hdmi_writel(hdmi, i << 8 | 0,
5234549b93aa2a Thierry Reding 2015-08-07  635  				  HDMI_NV_PDISP_SOR_AUDIO_HDA_ELD_BUFWR);
5234549b93aa2a Thierry Reding 2015-08-07  636  
5234549b93aa2a Thierry Reding 2015-08-07  637  	value = SOR_AUDIO_HDA_PRESENSE_VALID | SOR_AUDIO_HDA_PRESENSE_PRESENT;
5234549b93aa2a Thierry Reding 2015-08-07  638  	tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_SOR_AUDIO_HDA_PRESENSE);
edec4af4c3d6d2 Thierry Reding 2012-11-15  639  }
edec4af4c3d6d2 Thierry Reding 2012-11-15  640  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
