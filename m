Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0548799A69
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 20:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4B110E15A;
	Sat,  9 Sep 2023 18:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B5310E15A;
 Sat,  9 Sep 2023 18:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694283825; x=1725819825;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jsdzmHq8rbuRqWGuSSL9/Aqq4HRROVcGsibEZJxL074=;
 b=h5p1PDSxa0p7WBHmsGvIAJ+yPyExmu7JU3UHwzs4vdAwDEoipotc3aSx
 JGg4B2h5rI1BFP2WrqoyD2CcQyCtqfIt9nC0HlNjv2OJFE1iUYhxwmCGZ
 NW0Ds9jKdIzh7yfwdmOv/6XFE5M/si3g2tKj+ppYrlHFxGoEsu/DXYHS0
 ZvxqPv/2AInBXIUtOtfOmBZPUwMWYRZZpysmXonkjLvqPjcvxdo0VNlEe
 VucyjG7m03820vRDLeYMKR1qMaOgrg98ovsoB2FC4lSpFFqM5uakp/Jos
 O2SAa+HvM0V65xHt0ylhhzacRS0G/gnDM2ZI5f7SijoQC/RghQ/Gy2uK7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="362887567"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; d="scan'208";a="362887567"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2023 11:23:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="719498893"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; d="scan'208";a="719498893"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 09 Sep 2023 11:23:40 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qf2cM-0003mX-0q;
 Sat, 09 Sep 2023 18:23:38 +0000
Date: Sun, 10 Sep 2023 02:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Subject: Re: [PATCH drm-misc-next v3 1/7] drm/gpuvm: rename struct
 drm_gpuva_manager to struct drm_gpuvm
Message-ID: <202309100242.Xp5Sk9EY-lkp@intel.com>
References: <20230909153125.30032-2-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230909153125.30032-2-dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6bd3d8da51ca1ec97c724016466606aec7739b9f]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-gpuvm-rename-struct-drm_gpuva_manager-to-struct-drm_gpuvm/20230909-233346
base:   6bd3d8da51ca1ec97c724016466606aec7739b9f
patch link:    https://lore.kernel.org/r/20230909153125.30032-2-dakr%40redhat.com
patch subject: [PATCH drm-misc-next v3 1/7] drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230910/202309100242.Xp5Sk9EY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309100242.Xp5Sk9EY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309100242.Xp5Sk9EY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_gpuvm.c: In function '__drm_gpuvm_sm_map':
>> drivers/gpu/drm/drm_gpuvm.c:1079:39: warning: variable 'prev' set but not used [-Wunused-but-set-variable]
    1079 |         struct drm_gpuva *va, *next, *prev = NULL;
         |                                       ^~~~


vim +/prev +1079 drivers/gpu/drm/drm_gpuvm.c

e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1072  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1073  static int
5d2000a9816e19 drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1074  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
5d2000a9816e19 drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1075  		   const struct drm_gpuvm_ops *ops, void *priv,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1076  		   u64 req_addr, u64 req_range,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1077  		   struct drm_gem_object *req_obj, u64 req_offset)
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1078  {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20 @1079  	struct drm_gpuva *va, *next, *prev = NULL;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1080  	u64 req_end = req_addr + req_range;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1081  	int ret;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1082  
5d2000a9816e19 drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1083  	if (unlikely(!drm_gpuva_range_valid(gpuvm, req_addr, req_range)))
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1084  		return -EINVAL;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1085  
5d2000a9816e19 drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1086  	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_end) {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1087  		struct drm_gem_object *obj = va->gem.obj;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1088  		u64 offset = va->gem.offset;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1089  		u64 addr = va->va.addr;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1090  		u64 range = va->va.range;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1091  		u64 end = addr + range;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1092  		bool merge = !!va->gem.obj;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1093  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1094  		if (addr == req_addr) {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1095  			merge &= obj == req_obj &&
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1096  				 offset == req_offset;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1097  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1098  			if (end == req_end) {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1099  				ret = op_unmap_cb(ops, priv, va, merge);
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1100  				if (ret)
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1101  					return ret;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1102  				break;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1103  			}
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1104  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1105  			if (end < req_end) {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1106  				ret = op_unmap_cb(ops, priv, va, merge);
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1107  				if (ret)
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1108  					return ret;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1109  				goto next;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1110  			}
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1111  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1112  			if (end > req_end) {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1113  				struct drm_gpuva_op_map n = {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1114  					.va.addr = req_end,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1115  					.va.range = range - req_range,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1116  					.gem.obj = obj,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1117  					.gem.offset = offset + req_range,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1118  				};
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1119  				struct drm_gpuva_op_unmap u = {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1120  					.va = va,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1121  					.keep = merge,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1122  				};
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1123  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1124  				ret = op_remap_cb(ops, priv, NULL, &n, &u);
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1125  				if (ret)
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1126  					return ret;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1127  				break;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1128  			}
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1129  		} else if (addr < req_addr) {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1130  			u64 ls_range = req_addr - addr;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1131  			struct drm_gpuva_op_map p = {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1132  				.va.addr = addr,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1133  				.va.range = ls_range,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1134  				.gem.obj = obj,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1135  				.gem.offset = offset,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1136  			};
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1137  			struct drm_gpuva_op_unmap u = { .va = va };
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1138  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1139  			merge &= obj == req_obj &&
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1140  				 offset + ls_range == req_offset;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1141  			u.keep = merge;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1142  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1143  			if (end == req_end) {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1144  				ret = op_remap_cb(ops, priv, &p, NULL, &u);
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1145  				if (ret)
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1146  					return ret;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1147  				break;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1148  			}
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1149  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1150  			if (end < req_end) {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1151  				ret = op_remap_cb(ops, priv, &p, NULL, &u);
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1152  				if (ret)
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1153  					return ret;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1154  				goto next;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1155  			}
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1156  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1157  			if (end > req_end) {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1158  				struct drm_gpuva_op_map n = {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1159  					.va.addr = req_end,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1160  					.va.range = end - req_end,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1161  					.gem.obj = obj,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1162  					.gem.offset = offset + ls_range +
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1163  						      req_range,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1164  				};
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1165  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1166  				ret = op_remap_cb(ops, priv, &p, &n, &u);
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1167  				if (ret)
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1168  					return ret;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1169  				break;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1170  			}
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1171  		} else if (addr > req_addr) {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1172  			merge &= obj == req_obj &&
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1173  				 offset == req_offset +
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1174  					   (addr - req_addr);
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1175  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1176  			if (end == req_end) {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1177  				ret = op_unmap_cb(ops, priv, va, merge);
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1178  				if (ret)
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1179  					return ret;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1180  				break;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1181  			}
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1182  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1183  			if (end < req_end) {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1184  				ret = op_unmap_cb(ops, priv, va, merge);
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1185  				if (ret)
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1186  					return ret;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1187  				goto next;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1188  			}
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1189  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1190  			if (end > req_end) {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1191  				struct drm_gpuva_op_map n = {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1192  					.va.addr = req_end,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1193  					.va.range = end - req_end,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1194  					.gem.obj = obj,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1195  					.gem.offset = offset + req_end - addr,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1196  				};
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1197  				struct drm_gpuva_op_unmap u = {
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1198  					.va = va,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1199  					.keep = merge,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1200  				};
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1201  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1202  				ret = op_remap_cb(ops, priv, NULL, &n, &u);
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1203  				if (ret)
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1204  					return ret;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1205  				break;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1206  			}
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1207  		}
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1208  next:
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1209  		prev = va;
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1210  	}
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1211  
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1212  	return op_map_cb(ops, priv,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1213  			 req_addr, req_range,
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1214  			 req_obj, req_offset);
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1215  }
e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20  1216  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
