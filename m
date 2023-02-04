Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BD068A923
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 10:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED3810E0E5;
	Sat,  4 Feb 2023 09:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A464910E0C5;
 Sat,  4 Feb 2023 09:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675501662; x=1707037662;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Vh1rn/GElzkmw4J+3sdswSnKFPEU6wulsbnU0427utc=;
 b=QKYsmyVZuLb/ckPdGKN2iogRIx2GIHQn7r9FzqsQtBFfQz7d+cAOQQBR
 sGEWGe4uHHAWSms8fMr3VGy9dag/6YUwCtH/HFfgfoLrYk3ue9jOIPciy
 ruIPlp2iNNiW/IWqLAVrCmQfErIXktJqf6ZYiXHvTdoC5lPYNB5ouFDbZ
 d10E9U+UH7FZ7ghKRJUelq2RFjIWU0yChJu+Bmw0T5NQT1jGjNjWq7c/F
 gU6WDsEQzulSF4W2EEAC4M2IUIFCCRtuTGfs2FvHEptPBTZR3mXa0Wj6/
 roMjzNWsOeRt1Z+XrnzmJUVd3Wg/jsz+WESIhY7BQnel8HbbK6/fNYQOu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="393524875"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; d="scan'208";a="393524875"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2023 01:07:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="698343878"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; d="scan'208";a="698343878"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 04 Feb 2023 01:07:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pOEWH-0001BS-32;
 Sat, 04 Feb 2023 09:07:37 +0000
Date: Sat, 4 Feb 2023 17:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Ashton <joshua@froggi.es>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
Message-ID: <202302041649.Dswc7gNr-lkp@intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203020744.30745-1-joshua@froggi.es>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, oe-kbuild-all@lists.linux.dev,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joshua,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.2-rc6 next-20230203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Ashton/drm-connector-Add-enum-documentation-to-drm_colorspace/20230203-100927
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230203020744.30745-1-joshua%40froggi.es
patch subject: [PATCH 1/3] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
config: arc-randconfig-r034-20230204 (https://download.01.org/0day-ci/archive/20230204/202302041649.Dswc7gNr-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/146e4b57c07c6b478f24bb7cf2603ab123dcb6f2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Joshua-Ashton/drm-connector-Add-enum-documentation-to-drm_colorspace/20230203-100927
        git checkout 146e4b57c07c6b478f24bb7cf2603ab123dcb6f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/display/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_hdmi_helper.c:108:10: error: 'DRM_MODE_COLORIMETRY_NO_DATA' undeclared here (not in a function); did you mean 'DRM_MODE_COLORIMETRY_OPRGB'?
     108 |         [DRM_MODE_COLORIMETRY_NO_DATA] = HDMI_COLORIMETRY_NO_DATA,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          DRM_MODE_COLORIMETRY_OPRGB
>> drivers/gpu/drm/display/drm_hdmi_helper.c:108:10: error: array index in initializer not of integer type
   drivers/gpu/drm/display/drm_hdmi_helper.c:108:10: note: (near initialization for 'hdmi_colorimetry_val')


vim +108 drivers/gpu/drm/display/drm_hdmi_helper.c

4fc8cb47fcfdc9 Thomas Zimmermann 2022-04-21  106  
4fc8cb47fcfdc9 Thomas Zimmermann 2022-04-21  107  static const u32 hdmi_colorimetry_val[] = {
4fc8cb47fcfdc9 Thomas Zimmermann 2022-04-21 @108  	[DRM_MODE_COLORIMETRY_NO_DATA] = HDMI_COLORIMETRY_NO_DATA,
4fc8cb47fcfdc9 Thomas Zimmermann 2022-04-21  109  	[DRM_MODE_COLORIMETRY_SMPTE_170M_YCC] = HDMI_COLORIMETRY_SMPTE_170M_YCC,
4fc8cb47fcfdc9 Thomas Zimmermann 2022-04-21  110  	[DRM_MODE_COLORIMETRY_BT709_YCC] = HDMI_COLORIMETRY_BT709_YCC,
4fc8cb47fcfdc9 Thomas Zimmermann 2022-04-21  111  	[DRM_MODE_COLORIMETRY_XVYCC_601] = HDMI_COLORIMETRY_XVYCC_601,
4fc8cb47fcfdc9 Thomas Zimmermann 2022-04-21  112  	[DRM_MODE_COLORIMETRY_XVYCC_709] = HDMI_COLORIMETRY_XVYCC_709,
4fc8cb47fcfdc9 Thomas Zimmermann 2022-04-21  113  	[DRM_MODE_COLORIMETRY_SYCC_601] = HDMI_COLORIMETRY_SYCC_601,
4fc8cb47fcfdc9 Thomas Zimmermann 2022-04-21  114  	[DRM_MODE_COLORIMETRY_OPYCC_601] = HDMI_COLORIMETRY_OPYCC_601,
4fc8cb47fcfdc9 Thomas Zimmermann 2022-04-21  115  	[DRM_MODE_COLORIMETRY_OPRGB] = HDMI_COLORIMETRY_OPRGB,
4fc8cb47fcfdc9 Thomas Zimmermann 2022-04-21  116  	[DRM_MODE_COLORIMETRY_BT2020_CYCC] = HDMI_COLORIMETRY_BT2020_CYCC,
4fc8cb47fcfdc9 Thomas Zimmermann 2022-04-21  117  	[DRM_MODE_COLORIMETRY_BT2020_RGB] = HDMI_COLORIMETRY_BT2020_RGB,
4fc8cb47fcfdc9 Thomas Zimmermann 2022-04-21  118  	[DRM_MODE_COLORIMETRY_BT2020_YCC] = HDMI_COLORIMETRY_BT2020_YCC,
4fc8cb47fcfdc9 Thomas Zimmermann 2022-04-21  119  };
4fc8cb47fcfdc9 Thomas Zimmermann 2022-04-21  120  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
