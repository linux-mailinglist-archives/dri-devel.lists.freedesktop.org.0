Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8D1853CD3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 22:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503A910E4EE;
	Tue, 13 Feb 2024 21:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMuCoP2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A45710E4E7;
 Tue, 13 Feb 2024 21:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707858983; x=1739394983;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=70aOWZb2as+h/oFF9yERAyk5l+enGnLqVYb+kh+qAx4=;
 b=VMuCoP2Awu9TGWpJzLGJv9OYDgXUsE71Q1gV9I+KRTLYJ/0y1nlE1sDT
 BBs/K8wM+8ymusSW1Wdl5+02VcKOli61XWXRfd4xtqnucNTX6e1YmkqYQ
 s2r80cUjeN7gOtZTq0Ioz41MeXgcVA2ONdSuM0UKHHGPwrH8k5qxZCz+s
 d1OTFsHZS2yFZOEKaMec8ANqpSjhEMmP/HkehFn5e6ThtQSbYvz/JK3FD
 ATTX8JefdyO7eQZgvV5tcrLkX9F7ezSVjIyXobdUUZl9kv38GJ1+kfgU9
 aA8cE+LQdSAUW2NivqPivUhr+S5VZghjCg66HLgwiBWRPfgfd8F7DDu4h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19300552"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="19300552"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="7576918"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2024 13:16:13 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ra08R-00083s-0R;
 Tue, 13 Feb 2024 21:16:11 +0000
Date: Wed, 14 Feb 2024 05:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr,
 harry.wentland@amd.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com,
 aleixpol@kde.org, xaver.hugl@gmail.com, victoria@system76.com,
 daniel@ffwll.ch, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 sean@poorly.run, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH 01/28] [NOT FOR REVIEW] drm: color pipeline base work
Message-ID: <202402140432.nUFiOWYE-lkp@intel.com>
References: <20240213064835.139464-2-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213064835.139464-2-uma.shankar@intel.com>
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

Hi Uma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next next-20240213]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.8-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-color-pipeline-base-work/20240213-144544
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240213064835.139464-2-uma.shankar%40intel.com
patch subject: [PATCH 01/28] [NOT FOR REVIEW] drm: color pipeline base work
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240214/202402140432.nUFiOWYE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402140432.nUFiOWYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140432.nUFiOWYE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_colorop.c:268: warning: Function parameter or struct member 'type' not described in 'drm_get_colorop_curve_1d_type_name'
   drivers/gpu/drm/drm_colorop.c:268: warning: Excess function parameter 'range' description in 'drm_get_colorop_curve_1d_type_name'


vim +268 drivers/gpu/drm/drm_colorop.c

   259	
   260	/**
   261	 * drm_get_colorop_curve_1d_type_name - return a string for 1D curve type
   262	 * @range: 1d curve type to compute name of
   263	 *
   264	 * In contrast to the other drm_get_*_name functions this one here returns a
   265	 * const pointer and hence is threadsafe.
   266	 */
   267	const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type)
 > 268	{
   269		if (WARN_ON(type >= ARRAY_SIZE(colorop_curve_1d_type_name)))
   270			return "unknown";
   271	
   272		return colorop_curve_1d_type_name[type];
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
