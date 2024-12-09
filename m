Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8996E9E8A00
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 04:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6484C10E47E;
	Mon,  9 Dec 2024 03:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzTLqwsQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C8110E47E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 03:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733716328; x=1765252328;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YuoC4uqSmc3wJVKeMeSTSV3DE3gZxiW5N310Ppia3gc=;
 b=dzTLqwsQJiDRpFAXtNQDb2PCnJqNI8eol208naD7e3wOyrUGnEeMC8RC
 FMkxPVOQCI3MbOmDpdexDkAQf3YxXPqZsxyPN2hZg8ZJjy5ZedIPHX+VW
 zSvqMsJfKMcFExfzEG3h/tvUxQQoKLkwnSOhcLTiD5VA5ehG6rXgQTLzg
 JQ/syGyzarpORfPXbkoHelpnZyZevAedquckmYCy8mSSbbzxJlhNsJl31
 qUfk2gOFutmfrEWAI2BSo5NVN3uaMvhcvjJalc0WRvPTxtFbdeRyWzJoF
 deI/cePArrxgwF/xCsDvFJEwO+vCmK85Ylp/CUkELM85DD1m52m9EQ/bV w==;
X-CSE-ConnectionGUID: 7EPhJCx/T1uWJplM0Cwqvg==
X-CSE-MsgGUID: YpBGV2jmQ+C1ZJtSfFlZlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37928654"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="37928654"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2024 19:52:08 -0800
X-CSE-ConnectionGUID: 61mX5yYjSXSM468V+JKzcA==
X-CSE-MsgGUID: SAu8U3K1RMygi8HUgCDklg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="99898167"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 08 Dec 2024 19:52:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tKUoS-0003kr-16;
 Mon, 09 Dec 2024 03:52:00 +0000
Date: Mon, 9 Dec 2024 11:51:26 +0800
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
Subject: Re: [PATCH 3/3] MAINTAINERS: Add entries for Apple DWI backlight
 controller
Message-ID: <202412070751.g7TFM5AI-lkp@intel.com>
References: <20241206172735.4310-4-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206172735.4310-4-towinchenmi@gmail.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Chan/dt-bindings-leds-backlight-apple-dwi-bl-Add-bindings-for-Apple-DWI-backlight/20241207-013254
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241206172735.4310-4-towinchenmi%40gmail.com
patch subject: [PATCH 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
reproduce: (https://download.01.org/0day-ci/archive/20241207/202412070751.g7TFM5AI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070751.g7TFM5AI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/video/backlight/apple,dwi-bl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
