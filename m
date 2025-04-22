Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5536A96702
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 13:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF7F10E082;
	Tue, 22 Apr 2025 11:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRFLGJxy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A386510E082;
 Tue, 22 Apr 2025 11:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745320285; x=1776856285;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GgJCNAGMvR0NtaDv652psAyvJcAiYqq6JDbJevX2YzQ=;
 b=LRFLGJxyExyYtTdo92WIuPboslWB8LkS+A9cUPZDE0LWCBBsY5P3n+dW
 dhlLqr6yWUWin1Zl0CATi1B7v37h+jXOcHMdIW5PYDtzy0TgLKij2KsEz
 iJJT9sj2mYjO5Bto/DO+4L6iH9M2wM9gVve+41t2aLqoW7ljC6XISIR7U
 tco0Tl0mQbFzdYVKW5dMf+uQS+wjKbMooN0YVokTPO3qcExQawnQ8s7bC
 DMSTKqW6w4oU/DB2JGxWZk80HpYxtgeoHl+9K7MNBWaIFyiVLxJKTqMRe
 gGbIPnu6r8PgOQ0OnT4GXnsU0nn6GkGZM2ryWhEP1bMaSclP51gEBciZr A==;
X-CSE-ConnectionGUID: YVS5rxG3Tj+iVFRRooSJqQ==
X-CSE-MsgGUID: P3mxRykSREGJ00sPne598w==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57537200"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="57537200"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 04:11:22 -0700
X-CSE-ConnectionGUID: YdRcZeB1TpiEuEaveCHjDg==
X-CSE-MsgGUID: 7y+61/VvTvaQNkl5z4jmSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="169189240"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 22 Apr 2025 04:11:18 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u7BX1-0000tP-2l;
 Tue, 22 Apr 2025 11:11:15 +0000
Date: Tue, 22 Apr 2025 19:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, YiPeng.Chai@amd.com, tao.zhou1@amd.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
 stable@vger.kernel.org
Subject: Re: [PATCH RESEND] drm/amdgpu: Remove redundant return value checks
 for amdgpu_ras_error_data_init
Message-ID: <202504221807.hOSkO5OB-lkp@intel.com>
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
[also build test ERROR on linus/master v6.15-rc3 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/drm-amdgpu-Remove-redundant-return-value-checks-for-amdgpu_ras_error_data_init/20250422-153759
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250422073505.2378-1-vulab%40iscas.ac.cn
patch subject: [PATCH RESEND] drm/amdgpu: Remove redundant return value checks for amdgpu_ras_error_data_init
config: i386-buildonly-randconfig-005-20250422 (https://download.01.org/0day-ci/archive/20250422/202504221807.hOSkO5OB-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504221807.hOSkO5OB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504221807.hOSkO5OB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:170:6: warning: unused variable 'ret' [-Wunused-variable]
     170 |         int ret;
         |             ^~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:690:44: error: expected ';' after expression
     690 |         amdgpu_ras_error_data_init(&obj->err_data)
         |                                                   ^
         |                                                   ;
   1 warning and 1 error generated.


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
