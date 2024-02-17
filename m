Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFAB85913C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 17:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A336A10E0BF;
	Sat, 17 Feb 2024 16:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4Vff+K7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610C310E0BF;
 Sat, 17 Feb 2024 16:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708188998; x=1739724998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hHHwDi6AfO5jRRRPcJuMu5ugy9TlN2ID1venVAURWGc=;
 b=e4Vff+K7VoCM9eidjOxNcoOs7P8zBwYdKEaHDb0ogZC5qllAKhQ8BPJh
 /tmEJWmOy+W30gQyv8mzSAAahDrz7oSMC+Cc5OgUEygmQ/MaVn792ipX1
 CXvTQIhQqj02vB4UZ+WyHL5Kf3EdAIzb2antVnzq0R/C3yJ+8UOOAjXMP
 ySXMO2egtzUus3WUGNDiHr09R44v+t15Hz2ejfbhzsnyhUfUTG8eqlAri
 RVlUjb9z/fgOIzXUV4ElGUPOrsIC1UAO2Zrjx2Jlvqop5Jlf4dfojWnEE
 V/kvCYGvTV1WfdJqGbjLN9p774zYvRqaaBQz6kh5on990wMEINyp5zUFV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2174285"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="2174285"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2024 08:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="4165471"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 17 Feb 2024 08:56:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rbNzI-0002I9-1i;
 Sat, 17 Feb 2024 16:56:28 +0000
Date: Sun, 18 Feb 2024 00:56:07 +0800
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
Message-ID: <202402180051.37wkwgMx-lkp@intel.com>
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
[also build test WARNING on drm/drm-next next-20240216]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.8-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-color-pipeline-base-work/20240213-144544
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240213064835.139464-2-uma.shankar%40intel.com
patch subject: [PATCH 01/28] [NOT FOR REVIEW] drm: color pipeline base work
config: x86_64-randconfig-161-20240213 (https://download.01.org/0day-ci/archive/20240218/202402180051.37wkwgMx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180051.37wkwgMx-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_atomic.c:825 drm_atomic_plane_print_state() warn: inconsistent indenting

vim +825 drivers/gpu/drm/drm_atomic.c

   799	
   800	static void drm_atomic_plane_print_state(struct drm_printer *p,
   801			const struct drm_plane_state *state)
   802	{
   803		struct drm_plane *plane = state->plane;
   804		struct drm_rect src  = drm_plane_state_src(state);
   805		struct drm_rect dest = drm_plane_state_dest(state);
   806	
   807		drm_printf(p, "plane[%u]: %s\n", plane->base.id, plane->name);
   808		drm_printf(p, "\tcrtc=%s\n", state->crtc ? state->crtc->name : "(null)");
   809		drm_printf(p, "\tfb=%u\n", state->fb ? state->fb->base.id : 0);
   810		if (state->fb)
   811			drm_framebuffer_print_info(p, 2, state->fb);
   812		drm_printf(p, "\tcrtc-pos=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&dest));
   813		drm_printf(p, "\tsrc-pos=" DRM_RECT_FP_FMT "\n", DRM_RECT_FP_ARG(&src));
   814		drm_printf(p, "\trotation=%x\n", state->rotation);
   815		drm_printf(p, "\tnormalized-zpos=%x\n", state->normalized_zpos);
   816		drm_printf(p, "\tcolor-encoding=%s\n",
   817			   drm_get_color_encoding_name(state->color_encoding));
   818		drm_printf(p, "\tcolor-range=%s\n",
   819			   drm_get_color_range_name(state->color_range));
   820		drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
   821	#if 0
   822	       drm_printf(p, "\tcolor-pipeline=%s\n",
   823	                  drm_get_color_pipeline_name(state->color_pipeline));
   824	#else
 > 825	       drm_printf(p, "\tcolor-pipeline=%d\n",
   826	                  state->color_pipeline ? state->color_pipeline->base.id : 0);
   827	#endif
   828	
   829	
   830		if (plane->funcs->atomic_print_state)
   831			plane->funcs->atomic_print_state(p, state);
   832	}
   833	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
