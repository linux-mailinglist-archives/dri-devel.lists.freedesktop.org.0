Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37DCA42472
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 15:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A65710E030;
	Mon, 24 Feb 2025 14:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSoNhnvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B724710E030
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 14:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740408998; x=1771944998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kLvQSsfByF9witrbdeJo0ttxnE3VKPGq/3+vWTmXkgc=;
 b=CSoNhnvUb1j1QlIAvBfxwdTIOvrwBTvIUMNnC+0w8R90QA4jqd5d9I0M
 rd9rxCdorz9sR+u7gWmLg+v1g5DZvKmmkOYcMdb2i4tV/dSi/OzbdnPo1
 Lwjj2j9V0AS7Qh68rHgryHd8KyKBXiAZL592zI7B3Volid7gISA2XZbQq
 7vuLO9h1s35pGJj7ZwTyginUkHTeaMrWEOtVFyMkJkQDh+jdNsyNrN4XX
 tGLJTYDZ2S8emYFt9JNHcJw8rQT9VB5x/KZqEp75TKFi70y0edl3kzqxn
 59wnWwFng7UOzOjrTJtRDPyYD2Mxynpes6pzs1+KakwfxmkuVS8bFc4lx A==;
X-CSE-ConnectionGUID: bTym/mWhTyW3BrUy1PvDGA==
X-CSE-MsgGUID: gj6LEBWmRjSSAdK7xi9pKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40353112"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="40353112"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:56:37 -0800
X-CSE-ConnectionGUID: xQ/AlRxeSYueNaOP2pPq3w==
X-CSE-MsgGUID: xlXwXB39RReif3MX5BGDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="115873701"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 24 Feb 2025 06:56:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tmZsh-0008eZ-1E;
 Mon, 24 Feb 2025 14:56:27 +0000
Date: Mon, 24 Feb 2025 22:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Yan <andyshrk@163.com>, heiko@sntech.de
Cc: oe-kbuild-all@lists.linux.dev, hjc@rock-chips.com, mripard@kernel.org,
 cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 3/6] drm/rockchip: Add RK3588 DPTX output support
Message-ID: <202502242201.3fE7QpMy-lkp@intel.com>
References: <20250223113036.74252-4-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223113036.74252-4-andyshrk@163.com>
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

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.14-rc4]
[cannot apply to rockchip/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Yan/dt-bindings-display-rockchip-Add-schema-for-RK3588-DPTX-Controller/20250223-193323
base:   linus/master
patch link:    https://lore.kernel.org/r/20250223113036.74252-4-andyshrk%40163.com
patch subject: [PATCH 3/6] drm/rockchip: Add RK3588 DPTX output support
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250224/202502242201.3fE7QpMy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502242201.3fE7QpMy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502242201.3fE7QpMy-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dw_dp_bind" [drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
