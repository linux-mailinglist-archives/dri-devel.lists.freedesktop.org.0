Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F85B8F982
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 10:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A036510E3F7;
	Mon, 22 Sep 2025 08:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nl/hRnOk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00E910E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 08:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758530453; x=1790066453;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZMo2AykX+hkkXcmuD8GfBAuju9dhidehEu+Vo5yoiqc=;
 b=Nl/hRnOk7xN+Hftlk3c4X5+4SU6gu3ZB1DWuzqeNhq5PKY35ny7XtfLi
 YOZnDJoD9FLobtnlEEiOG+Yz/X6yMajAvEOYCUnOuSVAT0RhTHwvg33FQ
 MFBkQ/tSzSs9RdiHePsNHDMXU6BmdNaDiTssXNtSYutlG4z9nQys5LbjL
 wslAVAaTSGauNypkCUNrgYpvdEJ/zcuC8Wq6JsMHeR5r/MftIinBArJ9q
 Gz7boHMl87N06pjWNaWvVVERmdcFD7K8GPjxKkKjxr79gY3/kcPjO8XD6
 PRosWZ1ZmdAxmhI2j8qGkeJjsVzvvfzXbg2B5TbFSrhpwZSYP3N41IG0A A==;
X-CSE-ConnectionGUID: XrGhDFU6Tle1PofVyvJ7uA==
X-CSE-MsgGUID: vl+suTQxRpORC4AtZriTmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60904824"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="60904824"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 01:40:05 -0700
X-CSE-ConnectionGUID: IT22XOp1SZGx1J9U9qub4w==
X-CSE-MsgGUID: aZZggFjZQtKPHRHTozIsgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="177212661"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
 by fmviesa010.fm.intel.com with ESMTP; 22 Sep 2025 01:40:02 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v0c5Y-0001Tt-0G;
 Mon, 22 Sep 2025 08:40:00 +0000
Date: Mon, 22 Sep 2025 16:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Lizhi Hou <lizhi.hou@amd.com>, linux-kernel@vger.kernel.org,
 max.zhen@amd.com, sonal.santan@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH V2] accel/amdxdna: Enhance runtime power management
Message-ID: <202509221605.9PJQqMb8-lkp@intel.com>
References: <20250918195136.439012-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918195136.439012-1-lizhi.hou@amd.com>
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

Hi Lizhi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip next-20250919]
[cannot apply to linus/master v6.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lizhi-Hou/accel-amdxdna-Enhance-runtime-power-management/20250919-035402
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250918195136.439012-1-lizhi.hou%40amd.com
patch subject: [PATCH V2] accel/amdxdna: Enhance runtime power management
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250922/202509221605.9PJQqMb8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221605.9PJQqMb8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509221605.9PJQqMb8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accel/amdxdna/amdxdna_ctx.c:171:3: error: cannot jump from this goto statement to its label
     171 |                 goto free_hwctx;
         |                 ^
   drivers/accel/amdxdna/amdxdna_ctx.c:180:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     180 |         guard(mutex)(&xdna->dev_lock);
         |         ^
   include/linux/cleanup.h:401:15: note: expanded from macro 'guard'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:16:1: note: expanded from here
      16 | __UNIQUE_ID_guard1255
         | ^
   1 error generated.


vim +171 drivers/accel/amdxdna/amdxdna_ctx.c

be462c97b7dfd2 Lizhi Hou 2024-11-18  152  
be462c97b7dfd2 Lizhi Hou 2024-11-18  153  int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
be462c97b7dfd2 Lizhi Hou 2024-11-18  154  {
be462c97b7dfd2 Lizhi Hou 2024-11-18  155  	struct amdxdna_client *client = filp->driver_priv;
be462c97b7dfd2 Lizhi Hou 2024-11-18  156  	struct amdxdna_drm_create_hwctx *args = data;
be462c97b7dfd2 Lizhi Hou 2024-11-18  157  	struct amdxdna_dev *xdna = to_xdna_dev(dev);
be462c97b7dfd2 Lizhi Hou 2024-11-18  158  	struct amdxdna_hwctx *hwctx;
be462c97b7dfd2 Lizhi Hou 2024-11-18  159  	int ret, idx;
be462c97b7dfd2 Lizhi Hou 2024-11-18  160  
be462c97b7dfd2 Lizhi Hou 2024-11-18  161  	if (args->ext || args->ext_flags)
be462c97b7dfd2 Lizhi Hou 2024-11-18  162  		return -EINVAL;
be462c97b7dfd2 Lizhi Hou 2024-11-18  163  
be462c97b7dfd2 Lizhi Hou 2024-11-18  164  	hwctx = kzalloc(sizeof(*hwctx), GFP_KERNEL);
17b2662aa6d69f Lizhi Hou 2025-09-18  165  	if (!hwctx)
17b2662aa6d69f Lizhi Hou 2025-09-18  166  		return -ENOMEM;
be462c97b7dfd2 Lizhi Hou 2024-11-18  167  
be462c97b7dfd2 Lizhi Hou 2024-11-18  168  	if (copy_from_user(&hwctx->qos, u64_to_user_ptr(args->qos_p), sizeof(hwctx->qos))) {
be462c97b7dfd2 Lizhi Hou 2024-11-18  169  		XDNA_ERR(xdna, "Access QoS info failed");
be462c97b7dfd2 Lizhi Hou 2024-11-18  170  		ret = -EFAULT;
be462c97b7dfd2 Lizhi Hou 2024-11-18 @171  		goto free_hwctx;
be462c97b7dfd2 Lizhi Hou 2024-11-18  172  	}
be462c97b7dfd2 Lizhi Hou 2024-11-18  173  
be462c97b7dfd2 Lizhi Hou 2024-11-18  174  	hwctx->client = client;
be462c97b7dfd2 Lizhi Hou 2024-11-18  175  	hwctx->fw_ctx_id = -1;
be462c97b7dfd2 Lizhi Hou 2024-11-18  176  	hwctx->num_tiles = args->num_tiles;
be462c97b7dfd2 Lizhi Hou 2024-11-18  177  	hwctx->mem_size = args->mem_size;
be462c97b7dfd2 Lizhi Hou 2024-11-18  178  	hwctx->max_opc = args->max_opc;
17b2662aa6d69f Lizhi Hou 2025-09-18  179  
17b2662aa6d69f Lizhi Hou 2025-09-18  180  	guard(mutex)(&xdna->dev_lock);
17b2662aa6d69f Lizhi Hou 2025-09-18  181  
17b2662aa6d69f Lizhi Hou 2025-09-18  182  	if (!drm_dev_enter(dev, &idx)) {
17b2662aa6d69f Lizhi Hou 2025-09-18  183  		ret = -ENODEV;
be462c97b7dfd2 Lizhi Hou 2024-11-18  184  		goto free_hwctx;
be462c97b7dfd2 Lizhi Hou 2024-11-18  185  	}
be462c97b7dfd2 Lizhi Hou 2024-11-18  186  
17b2662aa6d69f Lizhi Hou 2025-09-18  187  	ret = xdna->dev_info->ops->hwctx_init(hwctx);
17b2662aa6d69f Lizhi Hou 2025-09-18  188  	if (ret) {
17b2662aa6d69f Lizhi Hou 2025-09-18  189  		XDNA_ERR(xdna, "Init hwctx failed, ret %d", ret);
17b2662aa6d69f Lizhi Hou 2025-09-18  190  		goto dev_exit;
17b2662aa6d69f Lizhi Hou 2025-09-18  191  	}
17b2662aa6d69f Lizhi Hou 2025-09-18  192  
17b2662aa6d69f Lizhi Hou 2025-09-18  193  	hwctx->name = kasprintf(GFP_KERNEL, "hwctx.%d.%d", client->pid, hwctx->fw_ctx_id);
be462c97b7dfd2 Lizhi Hou 2024-11-18  194  	if (!hwctx->name) {
be462c97b7dfd2 Lizhi Hou 2024-11-18  195  		ret = -ENOMEM;
17b2662aa6d69f Lizhi Hou 2025-09-18  196  		goto fini_hwctx;
be462c97b7dfd2 Lizhi Hou 2024-11-18  197  	}
be462c97b7dfd2 Lizhi Hou 2024-11-18  198  
17b2662aa6d69f Lizhi Hou 2025-09-18  199  	ret = xa_alloc_cyclic(&client->hwctx_xa, &hwctx->id, hwctx,
17b2662aa6d69f Lizhi Hou 2025-09-18  200  			      XA_LIMIT(AMDXDNA_INVALID_CTX_HANDLE + 1, MAX_HWCTX_ID),
17b2662aa6d69f Lizhi Hou 2025-09-18  201  			      &client->next_hwctxid, GFP_KERNEL);
17b2662aa6d69f Lizhi Hou 2025-09-18  202  	if (ret < 0) {
17b2662aa6d69f Lizhi Hou 2025-09-18  203  		XDNA_ERR(xdna, "Allocate hwctx ID failed, ret %d", ret);
be462c97b7dfd2 Lizhi Hou 2024-11-18  204  		goto free_name;
be462c97b7dfd2 Lizhi Hou 2024-11-18  205  	}
17b2662aa6d69f Lizhi Hou 2025-09-18  206  
be462c97b7dfd2 Lizhi Hou 2024-11-18  207  	args->handle = hwctx->id;
be462c97b7dfd2 Lizhi Hou 2024-11-18  208  	args->syncobj_handle = hwctx->syncobj_hdl;
be462c97b7dfd2 Lizhi Hou 2024-11-18  209  
4fd6ca90fc7f50 Lizhi Hou 2025-01-24  210  	atomic64_set(&hwctx->job_submit_cnt, 0);
4fd6ca90fc7f50 Lizhi Hou 2025-01-24  211  	atomic64_set(&hwctx->job_free_cnt, 0);
be462c97b7dfd2 Lizhi Hou 2024-11-18  212  	XDNA_DBG(xdna, "PID %d create HW context %d, ret %d", client->pid, args->handle, ret);
be462c97b7dfd2 Lizhi Hou 2024-11-18  213  	drm_dev_exit(idx);
be462c97b7dfd2 Lizhi Hou 2024-11-18  214  	return 0;
be462c97b7dfd2 Lizhi Hou 2024-11-18  215  
be462c97b7dfd2 Lizhi Hou 2024-11-18  216  free_name:
be462c97b7dfd2 Lizhi Hou 2024-11-18  217  	kfree(hwctx->name);
17b2662aa6d69f Lizhi Hou 2025-09-18  218  fini_hwctx:
17b2662aa6d69f Lizhi Hou 2025-09-18  219  	xdna->dev_info->ops->hwctx_fini(hwctx);
17b2662aa6d69f Lizhi Hou 2025-09-18  220  dev_exit:
17b2662aa6d69f Lizhi Hou 2025-09-18  221  	drm_dev_exit(idx);
be462c97b7dfd2 Lizhi Hou 2024-11-18  222  free_hwctx:
be462c97b7dfd2 Lizhi Hou 2024-11-18  223  	kfree(hwctx);
be462c97b7dfd2 Lizhi Hou 2024-11-18  224  	return ret;
be462c97b7dfd2 Lizhi Hou 2024-11-18  225  }
be462c97b7dfd2 Lizhi Hou 2024-11-18  226  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
