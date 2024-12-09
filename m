Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678969E89CE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 04:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B3610E466;
	Mon,  9 Dec 2024 03:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEnEG7pA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6353810E471
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 03:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733715666; x=1765251666;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ncK/sE8+KnlE+XPzzVk25YCDyXg/f1NqF+jwwsC606M=;
 b=hEnEG7pAZ1aPRWgU5BUMJmr6xRn0U0qe25wHFuJFjOf/OrusXHx/ymcB
 hvgzz6vvkUZA/KbBaQTU7gYOi+T7ykRBNT3BRscP9610c9FZsYs3Vgmuo
 wohapfzsWQk20VAQGxH4z2gVISloGUGhM22EdS2aZmB/QyEGuAbJZz0kg
 vxFqyXIGfDbBjD7/KyyRtOr6ESBPI7HrJ6bPqx4DrAE/pyS0+ow9uzUBy
 feGAYGadSWlJJojge34UWEKLyAC1fjLdLkemW1kmnJbFzOtzTOCEYsCld
 8HLgUesgQ2f+ZE/+Lkua3VkDjAhd8P6hajNBmsclqWg/F2BAZFspgIDlh A==;
X-CSE-ConnectionGUID: ZdJn+UdgQkmWGRWy7cruAA==
X-CSE-MsgGUID: rGAKSQysQk2Z4/X/pZ9AjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33889114"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="33889114"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2024 19:41:06 -0800
X-CSE-ConnectionGUID: X3YHOIjOT4KxtkQC+kKXTQ==
X-CSE-MsgGUID: nkT5gCzYSmOuxlFtB3DBpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="95295523"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 08 Dec 2024 19:41:02 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tKUdn-0003kB-0K;
 Mon, 09 Dec 2024 03:40:59 +0000
Date: Mon, 9 Dec 2024 11:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Chan <towinchenmi@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Message-ID: <202412070721.9tZI9Ogl-lkp@intel.com>
References: <20241206172735.4310-3-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206172735.4310-3-towinchenmi@gmail.com>
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

Hi Nick,

kernel test robot noticed the following build errors:

[auto build test ERROR on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Chan/dt-bindings-leds-backlight-apple-dwi-bl-Add-bindings-for-Apple-DWI-backlight/20241207-013254
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241206172735.4310-3-towinchenmi%40gmail.com
patch subject: [PATCH 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
config: arc-randconfig-001-20241207 (https://download.01.org/0day-ci/archive/20241207/202412070721.9tZI9Ogl-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070721.9tZI9Ogl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070721.9tZI9Ogl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/backlight/dwi_bl.c: In function 'dwi_bl_update_status':
>> drivers/video/backlight/dwi_bl.c:46:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
      46 |         cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
         |                ^~~~~~~~~~
   drivers/video/backlight/dwi_bl.c: In function 'dwi_bl_get_brightness':
>> drivers/video/backlight/dwi_bl.c:61:16: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      61 |         return FIELD_GET(DWI_BL_CMD_DATA, cmd);
         |                ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +46 drivers/video/backlight/dwi_bl.c

    37	
    38	static int dwi_bl_update_status(struct backlight_device *bl)
    39	{
    40		struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
    41	
    42		int brightness = backlight_get_brightness(bl);
    43	
    44		u32 cmd = 0;
    45	
  > 46		cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
    47		cmd |= FIELD_PREP(DWI_BL_CMD_TYPE, DWI_BL_CMD_TYPE_SET_BRIGHTNESS);
    48	
    49		writel(cmd, dwi_bl->base + DWI_BL_CMD);
    50		writel(DWI_BL_CTL_SEND, dwi_bl->base + DWI_BL_CTL);
    51	
    52		return 0;
    53	}
    54	
    55	static int dwi_bl_get_brightness(struct backlight_device *bl)
    56	{
    57		struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
    58	
    59		u32 cmd = readl(dwi_bl->base + DWI_BL_CMD);
    60	
  > 61		return FIELD_GET(DWI_BL_CMD_DATA, cmd);
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
