Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90E7B46531
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 23:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DA710EC51;
	Fri,  5 Sep 2025 21:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OUhiTyiG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B1710EC51
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 21:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757106550; x=1788642550;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q4/Hy3I/j5BNl0X6z2Pxo3w50TkPZNmdARahvFuu1ZQ=;
 b=OUhiTyiGsWxhmX78IdDcEfhA14iXvJKCeyZvneladrfIQAPwhXlNczEJ
 F3OhGaN9YPvns4hNLMrIEYE0J6E5NtJPl0s/ZbA7bnlUpPbig/JH+XByW
 ieJbXNltStB1h/cApb/4HnIe1znHoq7RCdjt1u/ihMumQw1b63SJNG/Pg
 wjKiHo8D0DHAmx8Gzd5yKtB41kL3tZwtZlFDfIcOOXRQnY/9bojTqFAwv
 nNVnNpnkJ6bjV0G4qqI4btkHlyqObe8BgGDrDzgcTs/uiBjY+px3+NURH
 ZhYTIp+WITLzUiT0nTmf6LdTclK1JiCf95OYIXyknIoco5AWrBJ33/UJx g==;
X-CSE-ConnectionGUID: W/X0fhBFQo+ViwmWxwSrZQ==
X-CSE-MsgGUID: zUtWKa1FR6+5ERmU0wK9BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59531469"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59531469"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:09:10 -0700
X-CSE-ConnectionGUID: VOWIU12ASdy49fjY+iID5g==
X-CSE-MsgGUID: 1Ts5C591QMqIbNOwjdMlSQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 05 Sep 2025 14:09:05 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uudg7-0000rF-1I;
 Fri, 05 Sep 2025 21:09:03 +0000
Date: Sat, 6 Sep 2025 05:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support HDMI vendor specific
 infoframe
Message-ID: <202509060412.LmXs40Rg-lkp@intel.com>
References: <20250904-it6263-vendor-specific-infoframe-v1-1-6efe6545b634@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-it6263-vendor-specific-infoframe-v1-1-6efe6545b634@nxp.com>
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

Hi Liu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4ac65880ebca1b68495bd8704263b26c050ac010]

url:    https://github.com/intel-lab-lkp/linux/commits/Liu-Ying/drm-bridge-ite-it6263-Support-HDMI-vendor-specific-infoframe/20250904-171143
base:   4ac65880ebca1b68495bd8704263b26c050ac010
patch link:    https://lore.kernel.org/r/20250904-it6263-vendor-specific-infoframe-v1-1-6efe6545b634%40nxp.com
patch subject: [PATCH] drm/bridge: ite-it6263: Support HDMI vendor specific infoframe
config: i386-buildonly-randconfig-001-20250906 (https://download.01.org/0day-ci/archive/20250906/202509060412.LmXs40Rg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509060412.LmXs40Rg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509060412.LmXs40Rg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/ite-it6263.c:810:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     810 |                 const char zero_bulk[HDMI_PKT_HB_PB_CHUNK_SIZE] = { };
         |                 ^
   1 warning generated.


vim +810 drivers/gpu/drm/bridge/ite-it6263.c

   782	
   783	static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
   784					       enum hdmi_infoframe_type type,
   785					       const u8 *buffer, size_t len)
   786	{
   787		struct it6263 *it = bridge_to_it6263(bridge);
   788		struct regmap *regmap = it->hdmi_regmap;
   789	
   790		switch (type) {
   791		case HDMI_INFOFRAME_TYPE_AVI:
   792			/* write the first AVI infoframe data byte chunk(DB1-DB5) */
   793			regmap_bulk_write(regmap, HDMI_REG_AVI_DB1,
   794					  &buffer[HDMI_INFOFRAME_HEADER_SIZE],
   795					  HDMI_AVI_DB_CHUNK1_SIZE);
   796	
   797			/* write the second AVI infoframe data byte chunk(DB6-DB13) */
   798			regmap_bulk_write(regmap, HDMI_REG_AVI_DB6,
   799					  &buffer[HDMI_INFOFRAME_HEADER_SIZE +
   800						  HDMI_AVI_DB_CHUNK1_SIZE],
   801					  HDMI_AVI_DB_CHUNK2_SIZE);
   802	
   803			/* write checksum */
   804			regmap_write(regmap, HDMI_REG_AVI_CSUM, buffer[3]);
   805	
   806			regmap_write(regmap, HDMI_REG_AVI_INFOFRM_CTRL,
   807				     ENABLE_PKT | REPEAT_PKT);
   808			break;
   809		case HDMI_INFOFRAME_TYPE_VENDOR:
 > 810			const char zero_bulk[HDMI_PKT_HB_PB_CHUNK_SIZE] = { };
   811	
   812			/* clear NULL packet registers due to undefined default value */
   813			regmap_bulk_write(regmap, HDMI_REG_PKT_HB(0),
   814					  zero_bulk, sizeof(zero_bulk));
   815	
   816			/* write header and payload */
   817			regmap_bulk_write(regmap, HDMI_REG_PKT_HB(0), buffer, len);
   818	
   819			regmap_write(regmap, HDMI_REG_PKT_NULL_CTRL,
   820				     ENABLE_PKT | REPEAT_PKT);
   821			break;
   822		default:
   823			dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
   824		}
   825	
   826		return 0;
   827	}
   828	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
