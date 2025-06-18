Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DAEADE2B0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 06:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D28510E1D6;
	Wed, 18 Jun 2025 04:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XEqUyKdH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1606610E199;
 Wed, 18 Jun 2025 04:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750221783; x=1781757783;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qrU4m+qS2uKsFAVLPzFUsoU7GsKUoi+c8a8uxpByx+0=;
 b=XEqUyKdHZkb0BOlGdXzXOpd97G9hWXh6M3sG203dFhhXQaRHhOGBTk9c
 cDDZl9PUALBrqNLU13tW55Wjx63lz/v6REkm8hQ/FEkxVi9qYcAd/Xv91
 FSScHloneNUMvqIS8qi6Pf1Q4b8cd+xnmTRc8i1CjUuGGFrlSpeHwcJQe
 6W/uHBn0Hpc2traCjCUTCCSyNqWJWVet/U0SocrEbqj5HQ6Ix95wpYpa2
 KdEENm6U75n1PdEX/E/rA3Kw2nWlyODNXIGhoU+pxrji49s3MREJBali1
 Nr0F23/EtJ6+WbSdj1CTWWUc5DHxt3h8ypFWGmg5EtEnFFlL3nmVigsqH Q==;
X-CSE-ConnectionGUID: vNBged5cTP2jr6RkhQXWbw==
X-CSE-MsgGUID: qnISCpNLQXuiED1Umdd/sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51530992"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="51530992"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 21:43:03 -0700
X-CSE-ConnectionGUID: 0Sv4k5lOTtOuGpIooWZmxg==
X-CSE-MsgGUID: PAaLcFaLRzGzbT6i8+zvFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="154479972"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 17 Jun 2025 21:42:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uRkdS-000JOw-0u;
 Wed, 18 Jun 2025 04:42:54 +0000
Date: Wed, 18 Jun 2025 12:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, alex.hung@amd.com, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com,
 aleixpol@kde.org, xaver.hugl@gmail.com, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 arthurgrillo@riseup.net
Subject: Re: [PATCH V10 35/46] drm/amd/display: add shaper and blend colorops
 for 1D Curve Custom LUT
Message-ID: <202506181213.S2kcNsRM-lkp@intel.com>
References: <20250617041746.2884343-36-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617041746.2884343-36-alex.hung@amd.com>
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

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc2]
[cannot apply to drm-exynos/exynos-drm-next drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip next-20250617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20250617-123027
base:   linus/master
patch link:    https://lore.kernel.org/r/20250617041746.2884343-36-alex.hung%40amd.com
patch subject: [PATCH V10 35/46] drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
config: x86_64-buildonly-randconfig-006-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181213.S2kcNsRM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181213.S2kcNsRM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181213.S2kcNsRM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:442 Excess function parameter 'is_legacy' description in '__drm_lut_32_to_dc_gamma'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
