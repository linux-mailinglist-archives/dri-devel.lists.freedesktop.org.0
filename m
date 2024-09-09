Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3167D97187A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 13:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BCB10E3E4;
	Mon,  9 Sep 2024 11:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k25e9EqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1182210E38D;
 Mon,  9 Sep 2024 11:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725882191; x=1757418191;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HWz6DwNqd+5/2bPmYUs32Mg3Wp+Dg3BfRh9BQiyBw7M=;
 b=k25e9EqLWZalSOsxT1rJFZ5fjgdH5YupAOrR3f+e79Wk1SWXgU+sTUTg
 RVEabuRGcsvOh7q9BpigI0LpCRv1o5y9RUH6U+RSs5mmEmgn7p1Wf/ElK
 Pa+v85dkZ85sjtZMk3zUKQCt7owgY5mYC67ghWo9M3jv1SqEtnZZRGEQb
 db0Fw/tV2E8ipF8ftpxh3poTYlT6Gepo3nkTjH8UoukkQ/OaaG5x8rgBV
 Dxq4b7c9fvzcgWuMGXB9gz0K7qAgfjyYFmWE6Z10iJMHigayuuOZdnPFb
 zWOd050xorTvcOnxsojGoUSDqYq4HTPkTIuiNH97SHgvhauJRquUzKjvC g==;
X-CSE-ConnectionGUID: eu53/lNFSWeprc9yaeRwqA==
X-CSE-MsgGUID: Rd9n7ZfiRdqDjrFa1X9lXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="47095027"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="47095027"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 04:43:10 -0700
X-CSE-ConnectionGUID: cpTBspiJSJaX7wyfJ5TaMA==
X-CSE-MsgGUID: GSYguTXPSAqtLbEX6nCCng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="97353623"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 09 Sep 2024 04:43:08 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sncnR-000EfC-0z;
 Mon, 09 Sep 2024 11:43:05 +0000
Date: Mon, 9 Sep 2024 19:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2 3/3] drm/nouveau: Add drm_panic support for nv50+
Message-ID: <202409091805.3PzxoAY6-lkp@intel.com>
References: <20240906100434.1171093-4-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906100434.1171093-4-jfalempe@redhat.com>
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

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e8653e63e834e4c7de60b81b8b24deb7bdd3bf56]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-panic-Add-ABGR2101010-support/20240906-180717
base:   e8653e63e834e4c7de60b81b8b24deb7bdd3bf56
patch link:    https://lore.kernel.org/r/20240906100434.1171093-4-jfalempe%40redhat.com
patch subject: [PATCH v2 3/3] drm/nouveau: Add drm_panic support for nv50+
config: x86_64-randconfig-121-20240909 (https://download.01.org/0day-ci/archive/20240909/202409091805.3PzxoAY6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091805.3PzxoAY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091805.3PzxoAY6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/dispnv50/wndw.c:651:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *vaddr_iomem @@     got void *virtual @@
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:651:66: sparse:     expected void [noderef] __iomem *vaddr_iomem
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:651:66: sparse:     got void *virtual

vim +651 drivers/gpu/drm/nouveau/dispnv50/wndw.c

   628	
   629	static int
   630	nv50_wndw_get_scanout_buffer(struct drm_plane *plane, struct drm_scanout_buffer *sb)
   631	{
   632		struct drm_framebuffer *fb;
   633		struct nouveau_bo *nvbo;
   634	
   635		if (!plane->state || !plane->state->fb)
   636			return -EINVAL;
   637	
   638		fb = plane->state->fb;
   639		nvbo = nouveau_gem_object(fb->obj[0]);
   640	
   641		/* Don't support compressed format, or multiplane yet. */
   642		if (nvbo->comp || fb->format->num_planes != 1)
   643			return -EOPNOTSUPP;
   644	
   645		if (nouveau_bo_map(nvbo)) {
   646			pr_warn("nouveau bo map failed, panic won't be displayed\n");
   647			return -ENOMEM;
   648		}
   649	
   650		if (nvbo->kmap.bo_kmap_type & TTM_BO_MAP_IOMEM_MASK)
 > 651			iosys_map_set_vaddr_iomem(&sb->map[0], nvbo->kmap.virtual);
   652		else
   653			iosys_map_set_vaddr(&sb->map[0], nvbo->kmap.virtual);
   654	
   655		sb->height = fb->height;
   656		sb->width = fb->width;
   657		sb->pitch[0] = fb->pitches[0];
   658		sb->format = fb->format;
   659	
   660		/* If tiling is enabled, use the set_pixel() to display correctly.
   661		 * Only handle 32bits format for now.
   662		 */
   663		if (fb->modifier & 0xf) {
   664			if (fb->format->cpp[0] != 4)
   665				return -EOPNOTSUPP;
   666			sb->private = (void *) fb;
   667			sb->set_pixel = nv50_set_pixel;
   668		}
   669		return 0;
   670	}
   671	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
