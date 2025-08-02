Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE6EB18DE5
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 12:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A3610E485;
	Sat,  2 Aug 2025 10:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHnWTylD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECD110E0DE;
 Sat,  2 Aug 2025 10:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754129276; x=1785665276;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WifwYiw+/VhG8MFuis/kqFt7PWc4yq0zX4DIOGOfrq8=;
 b=PHnWTylD95THkNTtvO5zAAbEp3+0EDCIU8ddD++8O9umxSd64q3OBsoh
 LExszsJu5QiEWehL2ol8wXxnak7n4hfFY+/Pu1eMXghnFFWNkSB4Rn7H5
 4nM7KB4oYnCzK3CXJLuIUtPQ4QrVCmjSahD9rM1+ysjvJdVO2yvOTRKyS
 GKn6F4vrCyN2uJUsqaLhgOnkfu8QqCKcGS3KeBrDpDxUzSN9BGN5I/uaa
 IobbPCZGwfvNYivsq7Afhw9yU1mkjLJSUIUxO5E/0MQZTUUjndf0MZSO7
 0YCCQUmcXio8lFjg8gn0HsRCP/TZUQrJm3RYfZ+mlCrZBNkAkOt14RVwf w==;
X-CSE-ConnectionGUID: 60zh/m9MSIOTVeDtpWjRWA==
X-CSE-MsgGUID: NIbg7bJLSn+0Z3TDGq7FZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56548698"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="56548698"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2025 03:07:56 -0700
X-CSE-ConnectionGUID: 3krxle8xTzCGPuWpLHetTw==
X-CSE-MsgGUID: O/FXCyNQTSqPo6EQJGwuDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="163778078"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 02 Aug 2025 03:07:53 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ui99a-0005IW-1u;
 Sat, 02 Aug 2025 10:07:50 +0000
Date: Sat, 2 Aug 2025 18:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Carter Edwards <ethan@ethancedwards.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Ethan Carter Edwards <ethan@ethancedwards.com>
Subject: Re: [PATCH] drm/nouveau/gsp: remove always true if check
Message-ID: <202508021705.k0nkiqga-lkp@intel.com>
References: <20250801-nouveau-fifo-v1-1-25b9db5283bc@ethancedwards.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-nouveau-fifo-v1-1-25b9db5283bc@ethancedwards.com>
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

Hi Ethan,

kernel test robot noticed the following build errors:

[auto build test ERROR on b9ddaa95fd283bce7041550ddbbe7e764c477110]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Carter-Edwards/drm-nouveau-gsp-remove-always-true-if-check/20250802-095804
base:   b9ddaa95fd283bce7041550ddbbe7e764c477110
patch link:    https://lore.kernel.org/r/20250801-nouveau-fifo-v1-1-25b9db5283bc%40ethancedwards.com
patch subject: [PATCH] drm/nouveau/gsp: remove always true if check
config: i386-buildonly-randconfig-004-20250802 (https://download.01.org/0day-ci/archive/20250802/202508021705.k0nkiqga-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508021705.k0nkiqga-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508021705.k0nkiqga-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c: In function 'r535_chan_ramfc_write':
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c:193:34: error: conflicting types for 'ctrl'; have 'NVA06F_CTRL_BIND_PARAMS *'
     193 |         NVA06F_CTRL_BIND_PARAMS *ctrl;
         |                                  ^~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c:191:45: note: previous declaration of 'ctrl' with type 'NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS *'
     191 |         NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS *ctrl;
         |                                             ^~~~
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c:211:13: error: 'NVA06F_CTRL_BIND_PARAMS' has no member named 'bEnable'
     211 |         ctrl->bEnable = 1;
         |             ^~


vim +193 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c

27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  152  
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  153  static int
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  154  r535_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm, bool priv)
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  155  {
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  156  	struct nvkm_fifo *fifo = chan->cgrp->runl->fifo;
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  157  	struct nvkm_engn *engn;
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  158  	struct nvkm_device *device = fifo->engine.subdev.device;
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  159  	const struct nvkm_rm_api *rmapi = device->gsp->rm->api;
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  160  	u32 eT = ~0;
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  161  	int ret;
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  162  
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  163  	if (unlikely(device->gr && !device->gr->engine.subdev.oneinit)) {
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  164  		ret = nvkm_subdev_oneinit(&device->gr->engine.subdev);
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  165  		if (ret)
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  166  			return ret;
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  167  	}
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  168  
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  169  	nvkm_runl_foreach_engn(engn, chan->cgrp->runl) {
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  170  		eT = engn->id;
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  171  		break;
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  172  	}
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  173  
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  174  	if (WARN_ON(eT == ~0))
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  175  		return -EINVAL;
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  176  
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  177  	chan->rm.mthdbuf.ptr = dma_alloc_coherent(fifo->engine.subdev.device->dev,
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  178  						  fifo->rm.mthdbuf_size,
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  179  						  &chan->rm.mthdbuf.addr, GFP_KERNEL);
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  180  	if (!chan->rm.mthdbuf.ptr)
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  181  		return -ENOMEM;
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  182  
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  183  	ret = rmapi->fifo->chan.alloc(&chan->vmm->rm.device, NVKM_RM_CHAN(chan->id),
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  184  				      eT, chan->runq, priv, chan->id, chan->inst->addr,
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  185  				      nvkm_memory_addr(chan->userd.mem) + chan->userd.base,
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  186  				      chan->rm.mthdbuf.addr, chan->vmm, offset, length,
27b13dc5d0515e drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c Ben Skeggs 2024-11-20  187  				      &chan->rm.object);
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  188  	if (ret)
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  189  		return ret;
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  190  
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  191  	NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS *ctrl;
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  192  
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19 @193  	NVA06F_CTRL_BIND_PARAMS *ctrl;
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  194  
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  195  	ctrl = nvkm_gsp_rm_ctrl_get(&chan->rm.object,
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  196  						NVA06F_CTRL_CMD_BIND, sizeof(*ctrl));
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  197  	if (WARN_ON(IS_ERR(ctrl)))
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  198  		return PTR_ERR(ctrl);
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  199  
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  200  	ctrl->engineType = eT;
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  201  
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  202  	ret = nvkm_gsp_rm_ctrl_wr(&chan->rm.object, ctrl);
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  203  	if (ret)
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  204  		return ret;
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  205  
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  206  	ctrl = nvkm_gsp_rm_ctrl_get(&chan->rm.object,
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  207  					NVA06F_CTRL_CMD_GPFIFO_SCHEDULE, sizeof(*ctrl));
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  208  	if (WARN_ON(IS_ERR(ctrl)))
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  209  		return PTR_ERR(ctrl);
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  210  
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19 @211  	ctrl->bEnable = 1;
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  212  	ret = nvkm_gsp_rm_ctrl_wr(&chan->rm.object, ctrl);
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  213  
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  214  	return ret;
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  215  }
2a77d015b53886 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c        Ben Skeggs 2023-09-19  216  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
