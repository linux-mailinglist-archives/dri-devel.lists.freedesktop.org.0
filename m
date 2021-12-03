Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F32D4677B7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 13:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BC57AAAB;
	Fri,  3 Dec 2021 12:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753817AAAB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 12:57:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="217658165"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="217658165"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 04:57:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="478318241"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 03 Dec 2021 04:57:10 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mt87h-000Har-Ac; Fri, 03 Dec 2021 12:57:09 +0000
Date: Fri, 3 Dec 2021 20:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 10/11] drm/vc4: hdmi: Support HDMI YUV output
Message-ID: <202112032036.vcxJzxkG-lkp@intel.com>
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
config: nds32-allyesconfig (https://download.01.org/0day-ci/archive/20211203/202112032036.vcxJzxkG-lkp@intel.com/config)
compiler: nds32le-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/70ee339decc66c157b6c9c983e8cce172c323218
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-vc4-hdmi-Yet-Another-Approach-to-HDMI-YUV-output/20211203-185623
        git checkout 70ee339decc66c157b6c9c983e8cce172c323218
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nds32 SHELL=/bin/bash drivers/gpu/drm/vc4/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vc4/vc4_hdmi.c: In function 'vc4_hdmi_avi_infoframe_colorspace':
>> drivers/gpu/drm/vc4/vc4_hdmi.c:503:35: warning: implicit conversion from 'enum vc4_hdmi_output_format' to 'enum hdmi_colorspace' [-Wenum-conversion]
     503 |                 frame->colorspace = fmt;
         |                                   ^


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
