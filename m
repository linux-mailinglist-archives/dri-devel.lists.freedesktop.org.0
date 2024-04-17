Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417978A79AD
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 02:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0BA112F93;
	Wed, 17 Apr 2024 00:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKlcKsFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F97B112F93
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 00:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713312686; x=1744848686;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/0bQkhy6R6bkH+wNonZcUTdXypAMTB7A5B/WDE5cx2w=;
 b=fKlcKsFOM3ZrWZgT7vqpksCXeWBH5Vm+FHKufl8SxtMcx1iE/e5U6sAj
 JJ6Pw9h4/Dbrpn9QQulbwsYN/JfE6EE6IuWatykTex7NXLU5FtI4br0mr
 5ZVPiGCIMyksp7Pugd9/hgRAKBeekQ2S18XGLJHsFmwOScetYbO7RMbpv
 pU38YZin6SGLROuN0y3xSRnDNSdHPf7si8YzDka3pUgIgw1V8ZGIh/WWB
 I/2vfdg+oNKzulI960zXEDd5GFfGfjC+oQWKxlA5t8aul0wPCYTDgflw9
 F6a4S9a7UlFoqemsB4J+r4A4UcJt+HBB0Ygf28MBJuG0aDkk7dpJL0mol g==;
X-CSE-ConnectionGUID: f+waZS3wR6STXnoHjSSaZA==
X-CSE-MsgGUID: sod+id7tTG6dfVSK2Vw2EQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="34172024"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="34172024"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 17:11:25 -0700
X-CSE-ConnectionGUID: xk91JmxwTACj/hv/y9LImA==
X-CSE-MsgGUID: 4L3ApJL+QeOYTtVcltyO1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="22485084"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
 by fmviesa008.fm.intel.com with ESMTP; 16 Apr 2024 17:11:18 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rwstP-0005sO-2j;
 Wed, 17 Apr 2024 00:11:15 +0000
Date: Wed, 17 Apr 2024 08:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 "andrzej . hajda @ intel . com" <andrzej.hajda@intel.com>,
 "neil . armstrong @ linaro . org" <neil.armstrong@linaro.org>,
 "rfoss @ kernel . org" <rfoss@kernel.org>,
 "Laurent . pinchart @ ideasonboard . com" <Laurent.pinchart@ideasonboard.com>, 
 "jonas @ kwiboo . se" <jonas@kwiboo.se>,
 "jernej . skrabec @ gmail . com" <jernej.skrabec@gmail.com>,
 "maarten . lankhorst @ linux . intel . com"
 <maarten.lankhorst@linux.intel.com>, 
 "mripard @ kernel . org" <mripard@kernel.org>,
 "tzimmermann @ suse . de" <tzimmermann@suse.de>,
 "airlied @ gmail . com" <airlied@gmail.com>,
 "daniel @ ffwll . ch" <daniel@ffwll.ch>,
 "robh+dt @ kernel . org" <robh+dt@kernel.org>,
 "krzysztof . kozlowski+dt @ linaro . org" <krzysztof.kozlowski+dt@linaro.org>, 
 "conor+dt @ kernel . org" <conor+dt@kernel.org>,
 "linux @ armlinux . org . uk" <linux@armlinux.org.uk>,
 "Nicolas . Ferre @ microchip . com" <Nicolas.Ferre@microchip.com>,
 "alexandre . belloni @ bootlin . com" <alexandre.belloni@bootlin.com>,
 "claudiu . beznea @ tuxon . dev" <claudiu.beznea@tuxon.dev>,
 "Manikandan . M @ microchip . com" <Manikandan.M@microchip.com>,
 "arnd @ arndb . de" <arnd@arndb.de>,
 "geert+renesas @ glider . be" <geert+renesas@glider.be>,
 "Jason @ zx2c4 . com" <Jason@zx2c4.com>,
 "mpe @ ellerman . id . au" <mpe@ellerman.id.au>,
 "gerg @ linux-m68k . org" <gerg@linux-m68k.org>,
 "rdunlap @ infradead . org" <rdunlap@infradead.org>,
 "vbabka @ suse . cz" <vbabka@suse.cz>,
 "dri-devel @ lists . freedesktop . org" <dri-devel@lists.freedesktop.org>,
 "devicetree @ vger . kernel . org" <devicetree@vger.kernel.org>,
 "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 3/4] MAINTAINERS: add SAM9X7 SoC's LVDS controller
Message-ID: <202404170727.UvHFX4sD-lkp@intel.com>
References: <20240405043536.274220-4-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405043536.274220-4-dharma.b@microchip.com>
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

Hi Dharma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.9-rc4 next-20240416]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dharma-Balasubiramani/dt-bindings-display-bridge-add-sam9x75-lvds-binding/20240405-123901
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240405043536.274220-4-dharma.b%40microchip.com
patch subject: [PATCH v5 3/4] MAINTAINERS: add SAM9X7 SoC's LVDS controller
reproduce: (https://download.01.org/0day-ci/archive/20240417/202404170727.UvHFX4sD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404170727.UvHFX4sD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/microchip,sam9x7-lvds.yaml
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
