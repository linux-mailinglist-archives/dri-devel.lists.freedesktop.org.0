Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F75DD324B5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 15:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BC710E8AA;
	Fri, 16 Jan 2026 14:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MD34V6Es";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3373410E8A8;
 Fri, 16 Jan 2026 14:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768572244; x=1800108244;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Kbhyq+SBAS20jDfUYkCsufjC2PTkpWj3iHsn46XYUBQ=;
 b=MD34V6EsSmiUvzHNj1oX7vrOT1BBCJ/YpIfAp8ZNa6fb43j2mamJWrP/
 4pdC/LmwQuPHruWT3+yG2Xx0vv1sRRi8Dy1v6nZFPhwoOQUuIRc07pUJ6
 6go+x1mUighkZU36G0deZ2yO/IAb57wLI88EpHf1nyk1SglXmpDxWHnC/
 4N9abOB9S45MCEcH5mXuthbiY4ir0+5egx0fjH3tQNd7N/UGGO0qnQ0EC
 4px7le2HFfD2c08vh7ntjjNBdo1SIUixLJu2+G0t+UlS4eSfWVzPiCKWT
 i2he7tSSTJRf3qub40Rkn/zzGkMqgQRn1ZYmL6Od7RqNSuB8kQ32/q7gB g==;
X-CSE-ConnectionGUID: mSKaIi22RgaR5LQ+MezHvA==
X-CSE-MsgGUID: xth2DGjhTcWaLuUA9K38Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="95362878"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="95362878"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 06:04:04 -0800
X-CSE-ConnectionGUID: eh1KU9icSp6d5wMXcSvD+g==
X-CSE-MsgGUID: Fb2CGsrGRAW+ZwwaMjJqIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="210111413"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2026 06:04:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vgkQh-00000000KuW-2xDy;
 Fri, 16 Jan 2026 14:03:59 +0000
Date: Fri, 16 Jan 2026 22:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Harry.Wentland@amd.com, simona@ffwll.ch,
 airlied@gmail.com, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, Leo Li <sunpeng.li@amd.com>
Subject: Re: [PATCH v3 1/2] drm: Introduce drm_crtc_vblank_prepare()
Message-ID: <202601162107.idPiWG44-lkp@intel.com>
References: <20260109192027.116325-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109192027.116325-1-sunpeng.li@amd.com>
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-tip/drm-tip]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sunpeng-li-amd-com/drm-amd-display-Implement-prepare_vblank_enable-callback/20260110-032355
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260109192027.116325-1-sunpeng.li%40amd.com
patch subject: [PATCH v3 1/2] drm: Introduce drm_crtc_vblank_prepare()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260116/202601162107.idPiWG44-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601162107.idPiWG44-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601162107.idPiWG44-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_crtc_vblank_prepare" [drivers/gpu/drm/drm_kms_helper.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
