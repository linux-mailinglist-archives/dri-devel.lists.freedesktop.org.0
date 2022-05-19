Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C40652CCC2
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 09:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE30511AC79;
	Thu, 19 May 2022 07:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85A911AC79
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 07:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652944939; x=1684480939;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KHj0qt1OuGRQy/u8k8ZSPKmi2BsjinMuEfasGYWGjTo=;
 b=eY5PVZ4u1RXrHiOlors+aUuj9MtslbVjCFd35FaFka9ihltD86AnfFmi
 VH7OgAspOwgCE1f1VCjXxAYwcTPVxSxkOJLpP2RJQuAD45v1k5BOTaV/8
 XBAuvY7eHIeuJm2Df/XGTijm7CQ7N+mEDiXsH3inKfQeokt81Lhn+6UC9
 8TPFv8eG8peJoSRKpIP9hNodMBQHFa6OCPOaxNlW4aOcZM3INI0m8eevr
 u2X9/W7EPCR3sKVGItwslQ+rauryrFmfv5VWM13YIomw7Qz0PspqMA/wG
 8KykO1pOJgxjCPtoAhf7HuXOe0i5Z09sIPF6XcFj8MFoV03aktcJnspBT Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="251962141"
X-IronPort-AV: E=Sophos;i="5.91,236,1647327600"; d="scan'208";a="251962141"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 00:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,236,1647327600"; d="scan'208";a="898642374"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 19 May 2022 00:22:15 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nraUA-0003DS-J9;
 Thu, 19 May 2022 07:22:14 +0000
Date: Thu, 19 May 2022 15:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
Message-ID: <202205191500.XkbwDucz-lkp@intel.com>
References: <20220519004431.320942-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519004431.320942-2-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 kbuild-all@lists.01.org, martyn.welch@collabora.com, robert.foss@linaro.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-tip/drm-tip tegra-drm/drm/tegra/for-next v5.18-rc7]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/dt-bindings-lcdif-Add-compatible-for-i-MX8MP/20220519-084546
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220519/202205191500.XkbwDucz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/85568e7c941f3751b0a6da9e7f14ee9b5593260b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marek-Vasut/dt-bindings-lcdif-Add-compatible-for-i-MX8MP/20220519-084546
        git checkout 85568e7c941f3751b0a6da9e7f14ee9b5593260b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/mxsfb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mxsfb/lcdif_kms.c:461:18: warning: 'lcdif_overlay_plane_formats' defined but not used [-Wunused-const-variable=]
     461 | static const u32 lcdif_overlay_plane_formats[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/lcdif_overlay_plane_formats +461 drivers/gpu/drm/mxsfb/lcdif_kms.c

   460	
 > 461	static const u32 lcdif_overlay_plane_formats[] = {
   462		DRM_FORMAT_XRGB4444,
   463		DRM_FORMAT_ARGB4444,
   464		DRM_FORMAT_XRGB1555,
   465		DRM_FORMAT_ARGB1555,
   466		DRM_FORMAT_RGB565,
   467		DRM_FORMAT_XRGB8888,
   468		DRM_FORMAT_ARGB8888,
   469	};
   470	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
