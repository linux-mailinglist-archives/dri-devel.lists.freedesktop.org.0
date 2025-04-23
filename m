Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30494A97B7A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 02:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A54010E3CB;
	Wed, 23 Apr 2025 00:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cP38n3Tu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C4110E3CB;
 Wed, 23 Apr 2025 00:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745366485; x=1776902485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=weyfJbTWEyO2rrCelTiBVub3jIwlIWeXRb7GV7JeALo=;
 b=cP38n3TuYcDo+msPmaJujhuuqpghrWOmi+aIagCWm4j3YpDQD4wALcq2
 UD+rAtzqsK7dMGsMprru3mGZPuRQzu+Ni6rv5/+5mTEq67UIrcKfTY7Gb
 Zf+Dpqt6xMuJ6vfGU/eP8ajQhoHoiwuMnH3yU0JAhpEzMFC4XkwUOeikJ
 yl7y2270QMfnt2DUSx/zbY3OIZXeQYQaeh8E3HSHKyrs87ObcJcJKybCf
 KaUjorqUTMXm3JCaQI6V4FyiycfXF28y7hFx5jaNLL0eiig/nBXf1RQWZ
 GyBa+4Y8csSQqYzNwbrmQnDsbQbwvA4vqdtXR0TCIOwnYyCsUQ67G+MpG g==;
X-CSE-ConnectionGUID: uk1skquTQZyPg9sJjkKoGA==
X-CSE-MsgGUID: Jp54gLvxQKqv8eDZaQ3TEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="64473719"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="64473719"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 17:01:25 -0700
X-CSE-ConnectionGUID: KXlNhm73REuidp51nGuUyw==
X-CSE-MsgGUID: ODJS1dHkRcGIMYUxL3/eNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="137141044"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 22 Apr 2025 17:01:21 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u7NYF-0001Pb-1G;
 Wed, 23 Apr 2025 00:01:19 +0000
Date: Wed, 23 Apr 2025 08:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, YiPeng.Chai@amd.com, tao.zhou1@amd.com
Cc: oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Wentao Liang <vulab@iscas.ac.cn>, stable@vger.kernel.org
Subject: Re: [PATCH RESEND] drm/amdgpu: Remove redundant return value checks
 for amdgpu_ras_error_data_init
Message-ID: <202504230730.y8eas9Se-lkp@intel.com>
References: <20250422073505.2378-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422073505.2378-1-vulab@iscas.ac.cn>
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

Hi Wentao,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master drm/drm-next drm-misc/drm-misc-next v6.15-rc3 next-20250422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/drm-amdgpu-Remove-redundant-return-value-checks-for-amdgpu_ras_error_data_init/20250422-153759
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250422073505.2378-1-vulab%40iscas.ac.cn
patch subject: [PATCH RESEND] drm/amdgpu: Remove redundant return value checks for amdgpu_ras_error_data_init
config: x86_64-buildonly-randconfig-001-20250423 (https://download.01.org/0day-ci/archive/20250423/202504230730.y8eas9Se-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504230730.y8eas9Se-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504230730.y8eas9Se-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c: In function 'amdgpu_reserve_page_direct':
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:170:13: warning: unused variable 'ret' [-Wunused-variable]
     170 |         int ret;
         |             ^~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c: In function 'amdgpu_ras_create_obj':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:690:51: error: expected ';' before 'obj'
     690 |         amdgpu_ras_error_data_init(&obj->err_data)
         |                                                   ^
         |                                                   ;
     691 | 
     692 |         obj->head = *head;
         |         ~~~                                        


vim +690 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c

   664	
   665	/* make one obj and return it. */
   666	static struct ras_manager *amdgpu_ras_create_obj(struct amdgpu_device *adev,
   667			struct ras_common_if *head)
   668	{
   669		struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
   670		struct ras_manager *obj;
   671	
   672		if (!adev->ras_enabled || !con)
   673			return NULL;
   674	
   675		if (head->block >= AMDGPU_RAS_BLOCK_COUNT)
   676			return NULL;
   677	
   678		if (head->block == AMDGPU_RAS_BLOCK__MCA) {
   679			if (head->sub_block_index >= AMDGPU_RAS_MCA_BLOCK__LAST)
   680				return NULL;
   681	
   682			obj = &con->objs[AMDGPU_RAS_BLOCK__LAST + head->sub_block_index];
   683		} else
   684			obj = &con->objs[head->block];
   685	
   686		/* already exist. return obj? */
   687		if (alive_obj(obj))
   688			return NULL;
   689	
 > 690		amdgpu_ras_error_data_init(&obj->err_data)
   691	
   692		obj->head = *head;
   693		obj->adev = adev;
   694		list_add(&obj->node, &con->head);
   695		get_obj(obj);
   696	
   697		return obj;
   698	}
   699	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
