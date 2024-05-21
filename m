Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A528CB4C8
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 22:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADA010E0D7;
	Tue, 21 May 2024 20:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDwHdGYG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39EC10E0D7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 20:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716324032; x=1747860032;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=a7HBpYV952J/NzsIFy4t5Olu/Ny1r0SLPd7DBdGJaTc=;
 b=hDwHdGYGIx4gDiMbR+Q9sxdGcwBnCaQNiPAUEnmE5IYRwVmuQoSpgmJo
 DuIPAMcJC0WoMfAnO6zI054Vcb4fWmCvd02WUN+aCkJhYfQ5f0pbTU1A4
 2i6Wm3yXHJHAjxC4esDh8tIC7hZCBA6Ak9G8sNbzclXvcyuLeGZHzUTC/
 TnYlFlS3+IE6ZUpP+CeoDyutMw2yGH9cTeL+F03NesngKEodohAfb646B
 s6G1EkxrMeEMLLsAhpNLlNE13yDchW2Rt9SVpcuu/RaJYUQKhOqJsuZvn
 VGTi5QH4AkoFtub0cwtF4o8+GJNVwenCJK8fyQCQ3xiUAhCu8VJjjLa5y g==;
X-CSE-ConnectionGUID: a4XDi9/NTDe7fjD9tqQWuA==
X-CSE-MsgGUID: IFDGpOFTQG6Mwj7kH1Eh8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="30068666"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="30068666"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 13:40:31 -0700
X-CSE-ConnectionGUID: gobwC626TcO4ZqmEhMLEXA==
X-CSE-MsgGUID: FYk2rclmRAKYeyzfQKofPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37813587"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa003.jf.intel.com with ESMTP; 21 May 2024 13:40:24 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s9WHG-0000i1-1y;
 Tue, 21 May 2024 20:40:21 +0000
Date: Wed, 22 May 2024 04:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: keith <keith.zhao@starfivetech.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, xingyu.wu@starfivetech.com,
 p.zabel@pengutronix.de, jack.zhu@starfivetech.com,
 shengyang.chen@starfivetech.com
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, keith.zhao@starfivetech.com
Subject: Re: [PATCH v4 06/10] drm/vs: add vs plane api
Message-ID: <202405220419.2XNzWyBP-lkp@intel.com>
References: <20240521105817.3301-7-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521105817.3301-7-keith.zhao@starfivetech.com>
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

Hi keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master next-20240521]
[cannot apply to robh/for-next rockchip/for-next v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/keith/dt-bindings-display-Add-YAML-schema-for-JH7110-display-pipeline/20240521-110316
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240521105817.3301-7-keith.zhao%40starfivetech.com
patch subject: [PATCH v4 06/10] drm/vs: add vs plane api
config: m68k-randconfig-r133-20240522 (https://download.01.org/0day-ci/archive/20240522/202405220419.2XNzWyBP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240522/202405220419.2XNzWyBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405220419.2XNzWyBP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/verisilicon/vs_plane.c:83:30: sparse: sparse: symbol 'vs_plane_funcs' was not declared. Should it be static?
>> drivers/gpu/drm/verisilicon/vs_plane.c:339:37: sparse: sparse: symbol 'primary_plane_helpers' was not declared. Should it be static?
>> drivers/gpu/drm/verisilicon/vs_plane.c:345:37: sparse: sparse: symbol 'overlay_plane_helpers' was not declared. Should it be static?
>> drivers/gpu/drm/verisilicon/vs_plane.c:351:37: sparse: sparse: symbol 'cursor_plane_helpers' was not declared. Should it be static?

vim +/vs_plane_funcs +83 drivers/gpu/drm/verisilicon/vs_plane.c

    82	
  > 83	const struct drm_plane_funcs vs_plane_funcs = {
    84		.update_plane		= drm_atomic_helper_update_plane,
    85		.disable_plane		= drm_atomic_helper_disable_plane,
    86		.reset			= vs_plane_reset,
    87		.atomic_duplicate_state = vs_plane_atomic_duplicate_state,
    88		.atomic_destroy_state	= vs_plane_atomic_destroy_state,
    89		.format_mod_supported	= vs_format_mod_supported,
    90	};
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
