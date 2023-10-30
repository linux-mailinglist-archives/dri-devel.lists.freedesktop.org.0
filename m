Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1197DB20E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 03:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8851810E1FA;
	Mon, 30 Oct 2023 02:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04D610E1FA
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 02:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698632947; x=1730168947;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fYwJcaSUlwINm8Ezc9wvvnXyuAcyakItjHqSg3FWpJ4=;
 b=ZoiZ/rRLvl0zU3ue5dDTMiBd1T4MIkxg0HwPQNvWUZr2EjfsyLINsbo/
 86zdX5vB0PwlFUqlDbnd9aGDdrwYz9SldtT2p+PymOgvHcrW+KYmOfwGr
 lZouQ0CefKkJrDEAiWyg5UTqDHbWaZhpIcwLeUOaD0GMrh8DMkDJrr3li
 47Jph5B6UOsZbQBRGUf4hbNee5aX7EJP2c/vzWUs/F+VUA8sZdoTB44Hj
 vCod2Yidf2VWgwi5zo6baIKzk9DC8QINLO0vNoHZyEpE9bQG2s6Fp0Aw9
 EyJZ/IGCxzPkgAcWbE00O3XAwEx3QWQwihrsHhgJbWbBtA0KNx+q7Z/qZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="373054563"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; d="scan'208";a="373054563"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2023 19:29:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="709967959"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; d="scan'208";a="709967959"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 29 Oct 2023 19:29:02 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qxI1T-000CzH-38;
 Mon, 30 Oct 2023 02:28:59 +0000
Date: Mon, 30 Oct 2023 10:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/8] drm/loongson: Using vbios for the LS7A2000 output
 initialization
Message-ID: <202310301026.haj8ZOHJ-lkp@intel.com>
References: <20231029194607.379459-6-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231029194607.379459-6-suijingfeng@loongson.cn>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.6-rc7 next-20231027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/drm-loongson-Introduce-a-minimal-support-for-Loongson-VBIOS/20231030-034730
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231029194607.379459-6-suijingfeng%40loongson.cn
patch subject: [PATCH 5/8] drm/loongson: Using vbios for the LS7A2000 output initialization
config: loongarch-randconfig-002-20231030 (https://download.01.org/0day-ci/archive/20231030/202310301026.haj8ZOHJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310301026.haj8ZOHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310301026.haj8ZOHJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/loongson/lsdc_output_7a2000.c:568:1: warning: no previous prototype for 'ls7a2000_query_output_configuration' [-Wmissing-prototypes]
     568 | ls7a2000_query_output_configuration(struct drm_device *ddev, unsigned int pipe)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_output_7a2000.c:498:46: warning: 'ls7a2000_encoder_helper_funcs' defined but not used [-Wunused-const-variable=]
     498 | static const struct drm_encoder_helper_funcs ls7a2000_encoder_helper_funcs = {
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_output_7a2000.c:272:39: warning: 'ls7a2000_encoder_funcs' defined but not used [-Wunused-const-variable=]
     272 | static const struct drm_encoder_funcs ls7a2000_encoder_funcs[2] = {
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_output_7a2000.c:201:41: warning: 'ls7a2000_hdmi_connector_funcs' defined but not used [-Wunused-const-variable=]
     201 | static const struct drm_connector_funcs ls7a2000_hdmi_connector_funcs[2] = {
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_output_7a2000.c:77:48: warning: 'ls7a2000_connector_helpers' defined but not used [-Wunused-const-variable=]
      77 | static const struct drm_connector_helper_funcs ls7a2000_connector_helpers = {
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ls7a2000_query_output_configuration +568 drivers/gpu/drm/loongson/lsdc_output_7a2000.c

   559	
   560	/*
   561	 * For LS7A2000, the built-in VGA encoder is transparent. If there are
   562	 * external encoder exist, then the internal HDMI encoder MUST be enabled
   563	 * and initialized. As the internal HDMI encoder is always connected, so
   564	 * only the transmitters which take HDMI signal (such as HDMI to eDP, HDMI
   565	 * to LVDS, etc) are usable with.
   566	 */
   567	const struct lsdc_output_desc *
 > 568	ls7a2000_query_output_configuration(struct drm_device *ddev, unsigned int pipe)
   569	{
   570		enum loongson_vbios_encoder_name encoder_name = 0;
   571		bool ret;
   572	
   573		ret = loongson_vbios_query_encoder_info(ddev, pipe, NULL,
   574							&encoder_name, NULL);
   575		if (!ret)
   576			goto bailout;
   577	
   578		if (pipe == 0) {
   579			switch (encoder_name) {
   580			case ENCODER_CHIP_INTERNAL_HDMI:
   581				return &ls7a2000_hdmi_pipe0;
   582	
   583			/*
   584			 * For LS7A2000, the built-in VGA encoder is transparent.
   585			 */
   586			case ENCODER_CHIP_INTERNAL_VGA:
   587				return &ls7a2000_vga_pipe0;
   588	
   589			/*
   590			 * External display bridge exists, the internal HDMI encoder
   591			 * MUST be enabled and initialized. Please add a drm bridge
   592			 * driver, and attach to this encoder.
   593			 */
   594			default:
   595				return &ls7a2000_hdmi_pipe0;
   596			}
   597		}
   598	
   599		if (pipe == 1) {
   600			switch (encoder_name) {
   601			case ENCODER_CHIP_INTERNAL_HDMI:
   602				return &ls7a2000_hdmi_pipe1;
   603	
   604			/*
   605			 * External display bridge exists, the internal HDMI encoder
   606			 * MUST be enabled and initialized. Please add a drm bridge
   607			 * driver, and attach it to this encoder.
   608			 */
   609			default:
   610				return &ls7a2000_hdmi_pipe1;
   611			}
   612		}
   613	
   614	bailout:
   615		if (pipe == 0)
   616			return &ls7a2000_vga_pipe0;
   617	
   618		if (pipe == 1)
   619			return &ls7a2000_hdmi_pipe1;
   620	
   621		return NULL;
   622	}
   623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
