Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8737E46814C
	for <lists+dri-devel@lfdr.de>; Sat,  4 Dec 2021 01:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31015AB7EA;
	Sat,  4 Dec 2021 00:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F1CAB7EA
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 00:31:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="300465935"
X-IronPort-AV: E=Sophos;i="5.87,286,1631602800"; d="scan'208";a="300465935"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 16:31:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,286,1631602800"; d="scan'208";a="460212100"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 03 Dec 2021 16:31:27 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mtIxa-000IFM-9C; Sat, 04 Dec 2021 00:31:26 +0000
Date: Sat, 4 Dec 2021 08:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 10/11] drm/vc4: hdmi: Support HDMI YUV output
Message-ID: <202112040851.zYD2J0lK-lkp@intel.com>
References: <20211203105420.573494-11-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203105420.573494-11-maxime@cerno.tech>
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

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on next-20211203]
[cannot apply to drm-intel/for-linux-next anholt/for-next v5.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maxime-Ripard/drm-vc4-hdmi-Yet-Another-Approach-to-HDMI-YUV-output/20211203-185623
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: powerpc-randconfig-s031-20211203 (https://download.01.org/0day-ci/archive/20211204/202112040851.zYD2J0lK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/70ee339decc66c157b6c9c983e8cce172c323218
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-vc4-hdmi-Yet-Another-Approach-to-HDMI-YUV-output/20211203-185623
        git checkout 70ee339decc66c157b6c9c983e8cce172c323218
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/gpu/drm/vc4/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vc4/vc4_hdmi.c:503:37: sparse: sparse: mixing different enum types:
>> drivers/gpu/drm/vc4/vc4_hdmi.c:503:37: sparse:    unsigned int enum vc4_hdmi_output_format
>> drivers/gpu/drm/vc4/vc4_hdmi.c:503:37: sparse:    unsigned int enum hdmi_colorspace

vim +503 drivers/gpu/drm/vc4/vc4_hdmi.c

   491	
   492	static void vc4_hdmi_avi_infoframe_colorspace(struct hdmi_avi_infoframe *frame,
   493						      enum vc4_hdmi_output_format fmt)
   494	{
   495		switch (fmt) {
   496		case VC4_HDMI_OUTPUT_RGB:
   497			fallthrough;
   498		case VC4_HDMI_OUTPUT_YUV420:
   499			fallthrough;
   500		case VC4_HDMI_OUTPUT_YUV422:
   501			fallthrough;
   502		case VC4_HDMI_OUTPUT_YUV444:
 > 503			frame->colorspace = fmt;
   504			break;
   505	
   506		default:
   507			break;
   508		}
   509	}
   510	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
