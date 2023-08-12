Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F310779CF7
	for <lists+dri-devel@lfdr.de>; Sat, 12 Aug 2023 05:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9FB10E14E;
	Sat, 12 Aug 2023 03:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6457310E138;
 Sat, 12 Aug 2023 03:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691810223; x=1723346223;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7RnTUCbNGKezR9ZGviQERAcbisAQIBqbbdtJEIeUh40=;
 b=Qa6DZtptj4cE+lDKfJ/TuUUwb5s8iC7xQh2KR14uepxChWhZAG+3/LDn
 jPUUCAks4K+nC72NIfg4Tl3KJMp8PYzRkZwXR1797I70Gl1keq66PDjWB
 xYcRMNI1Dvbz+21LwtJHgPDmDQbbTd+SBiZbD/VUPV1gMd9SCEMp+WlOt
 7G3HV5pAcmlF7/LciLiqrpdxVTu/S9UKfkoPHXcv9VghloVJb8WQ12wZu
 KTSf+ELMUcIli2ucCk+ScLf8rgp8sR5uy0JzKfR2pjyac6vm8VUkjFz/v
 ODjE0DZSD0rewGgkRWaqeenwRLjztTwj1vw+lEXY14lql2gi1h0QyktTP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438133243"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="438133243"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 20:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846976594"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="846976594"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 20:17:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qUf7c-0008EB-27;
 Sat, 12 Aug 2023 03:17:00 +0000
Date: Sat, 12 Aug 2023 11:16:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 3/3] drm/i915/gt/pxp: User PXP contexts
 requires runalone bit in lrc
Message-ID: <202308121007.jU4NvVxe-lkp@intel.com>
References: <20230811044310.944883-4-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811044310.944883-4-alan.previn.teres.alexis@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 51fec314404b6a360493f225481083b2a664e3e1]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Previn/drm-i915-pxp-mtl-Update-pxp-firmware-response-timeout/20230811-124534
base:   51fec314404b6a360493f225481083b2a664e3e1
patch link:    https://lore.kernel.org/r/20230811044310.944883-4-alan.previn.teres.alexis%40intel.com
patch subject: [Intel-gfx] [PATCH v2 3/3] drm/i915/gt/pxp: User PXP contexts requires runalone bit in lrc
config: i386-randconfig-r082-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121007.jU4NvVxe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121007.jU4NvVxe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121007.jU4NvVxe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gt/intel_lrc.c:851:34: sparse: sparse: dereference of noderef expression

vim +851 drivers/gpu/drm/i915/gt/intel_lrc.c

   847	
   848	static bool ctx_needs_runalone(const struct intel_context *ce)
   849	{
   850		if (GRAPHICS_VER_FULL(ce->engine->i915) >= IP_VER(12, 70) &&
 > 851		    ce->gem_context && ce->gem_context->uses_protected_content &&
   852		    (ce->engine->class == COMPUTE_CLASS || ce->engine->class == RENDER_CLASS))
   853			return true;
   854	
   855		return false;
   856	}
   857	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
