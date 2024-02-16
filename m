Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63604857D5F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 14:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9587110EA3B;
	Fri, 16 Feb 2024 13:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="insdE1+R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7820310E9E8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 13:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708089185; x=1739625185;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w7PxYeL2YJi5lLDMuxgVxDRatSZggnbIIYFFi/StyVM=;
 b=insdE1+RVAg7Bx2xLsdsMnNePf2jYsZrEgFsktLRZH9ktM8Fl5jvnsTd
 LpSww8++PvMNWnWVe/p5jDMoAk/tCDYSYD7mDSajLeXrRfHpb9JMLKBkp
 71DOP0nteDwb9zJnHi+5UFvFUdnDTwsW6oF6RjAWfDyd9jLBN0OPfzwRF
 kAJzr+tptI9g7AeFUp9LZAIyIQpDm4H2jeO5R05V+Dv4ADRnTn/7VmGI2
 i/zY+vVAIdS+wn0P4KF5Ljp9u2HZKm1ru6JF6cMpZ0W3PyOf/AJ6AigSK
 keKlK+J4AJzZsYUMcY5GtvrFCF93QAjcahjdjFEkqCnXg/xBCseLBn0E2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2083629"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2083629"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 05:13:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="3801537"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by fmviesa009.fm.intel.com with ESMTP; 16 Feb 2024 05:12:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ray1N-0001IA-17;
 Fri, 16 Feb 2024 13:12:54 +0000
Date: Fri, 16 Feb 2024 21:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH v5 2/3] drm/stm: lvds: add new STM32 LVDS Display
 Interface Transmitter driver
Message-ID: <202402162038.HP7VzIHX-lkp@intel.com>
References: <20240206-lvds-v5-2-bd16797b0f09@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206-lvds-v5-2-bd16797b0f09@foss.st.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Raphael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bb3bc3eac316b7c388733e625cc2343131b69dee]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/dt-bindings-display-add-STM32-LVDS-device/20240206-194740
base:   bb3bc3eac316b7c388733e625cc2343131b69dee
patch link:    https://lore.kernel.org/r/20240206-lvds-v5-2-bd16797b0f09%40foss.st.com
patch subject: [PATCH v5 2/3] drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver
config: arm-randconfig-r132-20240214 (https://download.01.org/0day-ci/archive/20240216/202402162038.HP7VzIHX-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20240216/202402162038.HP7VzIHX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402162038.HP7VzIHX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/stm/lvds.c:318:17: sparse: sparse: symbol 'lvds_bitmap_jeida_rgb888' was not declared. Should it be static?
>> drivers/gpu/drm/stm/lvds.c:335:17: sparse: sparse: symbol 'lvds_bitmap_vesa_rgb888' was not declared. Should it be static?
   drivers/gpu/drm/stm/lvds.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/stackdepot.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +/lvds_bitmap_jeida_rgb888 +318 drivers/gpu/drm/stm/lvds.c

   308	
   309	/*
   310	 * Expected JEIDA-RGB888 data to be sent in LSB format
   311	 *	    bit6 ............................bit0
   312	 * CHAN0   {ONE, ONE, ZERO, ZERO, ZERO, ONE, ONE}
   313	 * CHAN1   {G2,  R7,  R6,   R5,   R4,   R3,  R2}
   314	 * CHAN2   {B3,  B2,  G7,   G6,   G5,   G4,  G3}
   315	 * CHAN3   {DE,  VS,  HS,   B7,   B6,   B5,  B4}
   316	 * CHAN4   {CE,  B1,  B0,   G1,   G0,   R1,  R0}
   317	 */
 > 318	enum lvds_pixel lvds_bitmap_jeida_rgb888[5][7] = {
   319		{ PIX_ONE, PIX_ONE, PIX_ZER, PIX_ZER, PIX_ZER, PIX_ONE, PIX_ONE },
   320		{ PIX_G_2, PIX_R_7, PIX_R_6, PIX_R_5, PIX_R_4, PIX_R_3, PIX_R_2 },
   321		{ PIX_B_3, PIX_B_2, PIX_G_7, PIX_G_6, PIX_G_5, PIX_G_4, PIX_G_3 },
   322		{ PIX_D_E, PIX_V_S, PIX_H_S, PIX_B_7, PIX_B_6, PIX_B_5, PIX_B_4 },
   323		{ PIX_C_E, PIX_B_1, PIX_B_0, PIX_G_1, PIX_G_0, PIX_R_1, PIX_R_0 }
   324	};
   325	
   326	/*
   327	 * Expected VESA-RGB888 data to be sent in LSB format
   328	 *	    bit6 ............................bit0
   329	 * CHAN0   {ONE, ONE, ZERO, ZERO, ZERO, ONE, ONE}
   330	 * CHAN1   {G0,  R5,  R4,   R3,   R2,   R1,  R0}
   331	 * CHAN2   {B1,  B0,  G5,   G4,   G3,   G2,  G1}
   332	 * CHAN3   {DE,  VS,  HS,   B5,   B4,   B3,  B2}
   333	 * CHAN4   {CE,  B7,  B6,   G7,   G6,   R7,  R6}
   334	 */
 > 335	enum lvds_pixel lvds_bitmap_vesa_rgb888[5][7] = {
   336		{ PIX_ONE, PIX_ONE, PIX_ZER, PIX_ZER, PIX_ZER, PIX_ONE, PIX_ONE },
   337		{ PIX_G_0, PIX_R_5, PIX_R_4, PIX_R_3, PIX_R_2, PIX_R_1, PIX_R_0 },
   338		{ PIX_B_1, PIX_B_0, PIX_G_5, PIX_G_4, PIX_G_3, PIX_G_2, PIX_G_1 },
   339		{ PIX_D_E, PIX_V_S, PIX_H_S, PIX_B_5, PIX_B_4, PIX_B_3, PIX_B_2 },
   340		{ PIX_C_E, PIX_B_7, PIX_B_6, PIX_G_7, PIX_G_6, PIX_R_7, PIX_R_6 }
   341	};
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
