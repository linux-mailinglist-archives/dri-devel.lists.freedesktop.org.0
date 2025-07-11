Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7B4B027FD
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 01:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB64A10E184;
	Fri, 11 Jul 2025 23:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OTkpEGDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4F410E184
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 23:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752278256; x=1783814256;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5tT9ORXucLaTLjjDZNriJx1evuX5cza/Yehns8ks1zc=;
 b=OTkpEGDmnezAW0cUFj4O1uuxp2dy//GzFEGwpk6Ppsxt0WEtnuaW1Gz4
 xz5fIx9XMymU7cE3a0+4ZvuCZTAvL0GtSp7BZMbHVTRSzyd7KJG0rNH4m
 sEXcXWWIb72weCtd7Nymirkgmm9wROja/hf6RE1OfgCEV1002oroKB86n
 +54q1YYw7XKsEjilW/FijZprWr+xQlUMRtMXNvm0+LpvlkjDgiUnu7z8w
 siIDEPQlTIutVEYoW3T4UCVhSsIHljKtG567kq9GZ2xHywlq0v0KheNgf
 1/BCOTClPuyLD8WIqeotYHf0ms+rA9yV+TTC17ZFnqXuzXjFB1KqgOPWQ w==;
X-CSE-ConnectionGUID: 5OXUPeg+SROIgWRS5c2AlQ==
X-CSE-MsgGUID: aj1ZazG+QC26r4garSCcZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54436386"
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; d="scan'208";a="54436386"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 16:57:36 -0700
X-CSE-ConnectionGUID: OqbzDUo+S4e1ZPXqnfb15g==
X-CSE-MsgGUID: /djIIIW1RIyf+YXjuYsB/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; d="scan'208";a="156572850"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 11 Jul 2025 16:57:32 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uaNcP-0006uV-37;
 Fri, 11 Jul 2025 23:57:29 +0000
Date: Sat, 12 Jul 2025 07:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: iuncuim <iuncuim@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.or>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] arm64: dts: allwinner: a523: add Mali GPU node
Message-ID: <202507120723.0s2u9rLs-lkp@intel.com>
References: <20250711035730.17507-3-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711035730.17507-3-iuncuim@gmail.com>
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

Hi iuncuim,

kernel test robot noticed the following build errors:

[auto build test ERROR on sunxi/sunxi/for-next]
[also build test ERROR on robh/for-next linus/master v6.16-rc5 next-20250711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/iuncuim/dt-bindings-gpu-mali-bifrost-Add-Allwinner-A523-compatible/20250711-120104
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20250711035730.17507-3-iuncuim%40gmail.com
patch subject: [PATCH v2 2/3] arm64: dts: allwinner: a523: add Mali GPU node
config: arm64-randconfig-001-20250712 (https://download.01.org/0day-ci/archive/20250712/202507120723.0s2u9rLs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507120723.0s2u9rLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507120723.0s2u9rLs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:119.29-30 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
