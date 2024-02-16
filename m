Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E6A857C4D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 13:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB9510E86B;
	Fri, 16 Feb 2024 12:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdkLMHE4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B7710E86B;
 Fri, 16 Feb 2024 12:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708085333; x=1739621333;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QkLD/XHG9+NuCQzZHPbebqKmxkWVbMevBNZ3+AaFDQg=;
 b=KdkLMHE4XdCqsY2wcQYDSh03tzeL41MbSLk/PyMlMMO0pE1Q9ZljbT6g
 sIozXzD4DwbXdj1lsiwkWucXSR/Dn3eh9GNOUDDMvEetsCgFaBrKUnXo5
 BzdoP/g0CVX5QV6ax7BiijOEF0Afmuacw7jmER6wQfE1SoJsAS6I6M7DF
 QkDP6HjkHxTNw19a3QXnH+cGTKqOOUosZJJX/pgr4e4FhzKHEsffi3yqo
 f41CLxfUDnDILO5+E7GlPZsqrbbp5ZxT7oaWXLjUvsbcqs3YFGR8LkxK8
 HEnzmmKRg7h8i20UEZ4vHZUn32Dyxm5zclYeHr00DQ3AVwqvtKIL8TkVf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2117040"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2117040"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 04:08:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="3901578"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 16 Feb 2024 04:08:47 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rax1H-0001Ei-37;
 Fri, 16 Feb 2024 12:08:43 +0000
Date: Fri, 16 Feb 2024 20:07:46 +0800
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
Message-ID: <202402161931.6Z8xdViq-lkp@intel.com>
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
config: x86_64-randconfig-121-20240214 (https://download.01.org/0day-ci/archive/20240216/202402161931.6Z8xdViq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402161931.6Z8xdViq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402161931.6Z8xdViq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vkms/vkms_colorop.c:11:11: sparse: sparse: symbol 'vkms_initialize_tf_pipeline' was not declared. Should it be static?
--
   drivers/gpu/drm/vkms/vkms_composer.c: note: in included file:
>> drivers/gpu/drm/vkms/tests/vkms_color_tests.c:29:29: sparse: sparse: symbol 'test_linear_lut' was not declared. Should it be static?
>> drivers/gpu/drm/vkms/tests/vkms_color_tests.c:87:32: sparse: sparse: symbol 'test_matrix_3x4_50_desat' was not declared. Should it be static?
>> drivers/gpu/drm/vkms/tests/vkms_color_tests.c:146:32: sparse: sparse: symbol 'test_matrix_3x4_bt709_enc' was not declared. Should it be static?

vim +/vkms_initialize_tf_pipeline +11 drivers/gpu/drm/vkms/vkms_colorop.c

    10	
  > 11	const int vkms_initialize_tf_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
    12	{
    13	
    14		struct drm_colorop *op, *prev_op;
    15		struct drm_device *dev = plane->dev;
    16		int ret;
    17	
    18		/* 1st op: 1d curve */
    19		op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
    20		if (!op) {
    21			DRM_ERROR("KMS: Failed to allocate colorop\n");
    22			return -ENOMEM;
    23		}
    24	
    25		ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_1D_CURVE);
    26		if (ret)
    27			return ret;
    28	
    29		list->type = op->base.id;
    30		list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", op->base.id);
    31	
    32		prev_op = op;
    33	
    34		/* 2nd op: 3x4 matrix */
    35		op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
    36		if (!op) {
    37			DRM_ERROR("KMS: Failed to allocate colorop\n");
    38			return -ENOMEM;
    39		}
    40	
    41		ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_CTM_3X4);
    42		if (ret)
    43			return ret;
    44	
    45		drm_colorop_set_next_property(prev_op, op);
    46	
    47		prev_op = op;
    48	
    49		/* 3rd op: 3x4 matrix */
    50		op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
    51		if (!op) {
    52			DRM_ERROR("KMS: Failed to allocate colorop\n");
    53			return -ENOMEM;
    54		}
    55	
    56		ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_CTM_3X4);
    57		if (ret)
    58			return ret;
    59	
    60		drm_colorop_set_next_property(prev_op, op);
    61	
    62		prev_op = op;
    63	
    64		/* 4th op: 1d curve */
    65		op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
    66		if (!op) {
    67			DRM_ERROR("KMS: Failed to allocate colorop\n");
    68			return -ENOMEM;
    69		}
    70	
    71		ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_1D_CURVE);
    72		if (ret)
    73			return ret;
    74	
    75		drm_colorop_set_next_property(prev_op, op);
    76	
    77		return 0;
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
