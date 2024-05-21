Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700BB8CB4EE
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 22:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D9D10E935;
	Tue, 21 May 2024 20:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPMGC4rc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F9310E935
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 20:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716324797; x=1747860797;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Nk2m5drImbAFQMh1gv5SA4MPVptzBY8LHz5L3E6IPO4=;
 b=GPMGC4rcacZTBYqUmjHjHsdfJ+WG21uAyqekWFbTeyzdzgnLN8BrDTn4
 nw3ShJS5HFaqhABtfnFvjaXdAMfaOcx7ye3wFi+q+QpKdGF92anCqk/99
 RqacaRP/LSvlfvWMtZulS0aF5J4ilIQdz+R3TwR0nhrlTEy4hDyrrTH75
 rBJ/isi2tSfxcNDO7RiRHud0OueDkGMKfpKijwOlVQdUhWUIZAzWZ4+gG
 watrrpVHBKMfwFY1HeFN1Ludb/UPjDKw6XT2XfKuoHLC58MtlrZzgZTFf
 wrp3aVAn3g06bK2gn0yLTft1Y5+iayJEy7ByL5SA1fm0V0QRsQC1e+w6h w==;
X-CSE-ConnectionGUID: AmlypPriQ5asLeee8W8ayg==
X-CSE-MsgGUID: m6yzbY30RzyvFmdTGzAMxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="30069553"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="30069553"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 13:53:16 -0700
X-CSE-ConnectionGUID: xGwXe5saR4eZACAD1ZMX5A==
X-CSE-MsgGUID: Bh7ZAIoNSDSkYE0WYniw5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37816431"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa003.jf.intel.com with ESMTP; 21 May 2024 13:53:08 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s9WTa-0000ih-1m;
 Tue, 21 May 2024 20:52:55 +0000
Date: Wed, 22 May 2024 04:50:53 +0800
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
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, keith.zhao@starfivetech.com
Subject: Re: [PATCH v4 04/10] drm/vs: Add hardware funcs for vs.
Message-ID: <202405220427.loHTDi8t-lkp@intel.com>
References: <20240521105817.3301-5-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521105817.3301-5-keith.zhao@starfivetech.com>
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
patch link:    https://lore.kernel.org/r/20240521105817.3301-5-keith.zhao%40starfivetech.com
patch subject: [PATCH v4 04/10] drm/vs: Add hardware funcs for vs.
config: arc-kismet-CONFIG_DMA_CMA-CONFIG_DRM_VERISILICON_DC8200-0-0 (https://download.01.org/0day-ci/archive/20240522/202405220427.loHTDi8t-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240522/202405220427.loHTDi8t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405220427.loHTDi8t-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMA_CMA when selected by DRM_VERISILICON_DC8200
   WARNING: unmet direct dependencies detected for DMA_CMA
     Depends on [n]: HAVE_DMA_CONTIGUOUS [=n] && CMA [=y]
     Selected by [y]:
     - DRM_VERISILICON_DC8200 [=y] && HAS_IOMEM [=y] && DRM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
