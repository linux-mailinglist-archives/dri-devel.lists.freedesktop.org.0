Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A2877606E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 15:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B8E10E43C;
	Wed,  9 Aug 2023 13:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A6A10E43C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 13:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691587060; x=1723123060;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=COM8b++zFSJJGlRL6RPS1+zGQht6x8MaZDgSA0FjnJk=;
 b=LhEZtqMzhIQPzEe3MHI+alsztIzGFfGIyr8oEsX7apSCq656SF8gqtVC
 LpvdQRp4zQ0YyIh7x0u7gV547pkmgmWK2ihiL7lC9Gy9SkqI7BTpegiLM
 7e8wk2GvHXbFxKw4dBhs49H/VO7il1B/KE0RgOdIzUkLNdm6MZPclZx42
 LkAxZdPEnsayo8r5aOXPq5nZezdMzBY7uD7ZV9+dyxE98GJQeoY15/nmY
 4OohGlq1HVThGVHG2uwkYSNZdZZbyGxrlzASeqQnofmmxkIh6Wj6TeVSJ
 PMH7m4I1rLljby57Dv301c+0xCFPAMrD5TgvLotlG3/8FANOpvWbvi3CD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373899910"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="373899910"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 06:17:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="708712550"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="708712550"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 09 Aug 2023 06:17:33 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qTj48-00067c-2b;
 Wed, 09 Aug 2023 13:17:32 +0000
Date: Wed, 9 Aug 2023 21:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH] drm: manager: Remove the unused variable prev
Message-ID: <202308092135.95Kg6wDq-lkp@intel.com>
References: <20230809065229.71300-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809065229.71300-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, tzimmermann@suse.de,
 llvm@lists.linux.dev, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, mripard@kernel.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jiapeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20230809]
[cannot apply to linus/master v6.5-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiapeng-Chong/drm-manager-Remove-the-unused-variable-prev/20230809-145348
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230809065229.71300-1-jiapeng.chong%40linux.alibaba.com
patch subject: [PATCH] drm: manager: Remove the unused variable prev
config: riscv-randconfig-r042-20230809 (https://download.01.org/0day-ci/archive/20230809/202308092135.95Kg6wDq-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092135.95Kg6wDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308092135.95Kg6wDq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gpuva_mgr.c:1209:2: warning: label at end of compound statement is a C2x extension [-Wc2x-extensions]
           }
           ^
   1 warning generated.


vim +1209 drivers/gpu/drm/drm_gpuva_mgr.c

e6303f323b1ad9 Danilo Krummrich 2023-07-20  1072  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1073  static int
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1074  __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1075  		   const struct drm_gpuva_fn_ops *ops, void *priv,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1076  		   u64 req_addr, u64 req_range,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1077  		   struct drm_gem_object *req_obj, u64 req_offset)
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1078  {
e927727c10be76 Jiapeng Chong    2023-08-09  1079  	struct drm_gpuva *va, *next = NULL;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1080  	u64 req_end = req_addr + req_range;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1081  	int ret;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1082  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1083  	if (unlikely(!drm_gpuva_range_valid(mgr, req_addr, req_range)))
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1084  		return -EINVAL;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1085  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1086  	drm_gpuva_for_each_va_range_safe(va, next, mgr, req_addr, req_end) {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1087  		struct drm_gem_object *obj = va->gem.obj;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1088  		u64 offset = va->gem.offset;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1089  		u64 addr = va->va.addr;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1090  		u64 range = va->va.range;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1091  		u64 end = addr + range;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1092  		bool merge = !!va->gem.obj;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1093  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1094  		if (addr == req_addr) {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1095  			merge &= obj == req_obj &&
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1096  				 offset == req_offset;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1097  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1098  			if (end == req_end) {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1099  				ret = op_unmap_cb(ops, priv, va, merge);
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1100  				if (ret)
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1101  					return ret;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1102  				break;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1103  			}
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1104  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1105  			if (end < req_end) {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1106  				ret = op_unmap_cb(ops, priv, va, merge);
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1107  				if (ret)
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1108  					return ret;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1109  				goto next;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1110  			}
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1111  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1112  			if (end > req_end) {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1113  				struct drm_gpuva_op_map n = {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1114  					.va.addr = req_end,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1115  					.va.range = range - req_range,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1116  					.gem.obj = obj,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1117  					.gem.offset = offset + req_range,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1118  				};
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1119  				struct drm_gpuva_op_unmap u = {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1120  					.va = va,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1121  					.keep = merge,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1122  				};
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1123  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1124  				ret = op_remap_cb(ops, priv, NULL, &n, &u);
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1125  				if (ret)
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1126  					return ret;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1127  				break;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1128  			}
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1129  		} else if (addr < req_addr) {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1130  			u64 ls_range = req_addr - addr;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1131  			struct drm_gpuva_op_map p = {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1132  				.va.addr = addr,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1133  				.va.range = ls_range,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1134  				.gem.obj = obj,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1135  				.gem.offset = offset,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1136  			};
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1137  			struct drm_gpuva_op_unmap u = { .va = va };
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1138  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1139  			merge &= obj == req_obj &&
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1140  				 offset + ls_range == req_offset;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1141  			u.keep = merge;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1142  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1143  			if (end == req_end) {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1144  				ret = op_remap_cb(ops, priv, &p, NULL, &u);
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1145  				if (ret)
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1146  					return ret;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1147  				break;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1148  			}
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1149  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1150  			if (end < req_end) {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1151  				ret = op_remap_cb(ops, priv, &p, NULL, &u);
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1152  				if (ret)
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1153  					return ret;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1154  				goto next;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1155  			}
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1156  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1157  			if (end > req_end) {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1158  				struct drm_gpuva_op_map n = {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1159  					.va.addr = req_end,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1160  					.va.range = end - req_end,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1161  					.gem.obj = obj,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1162  					.gem.offset = offset + ls_range +
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1163  						      req_range,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1164  				};
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1165  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1166  				ret = op_remap_cb(ops, priv, &p, &n, &u);
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1167  				if (ret)
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1168  					return ret;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1169  				break;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1170  			}
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1171  		} else if (addr > req_addr) {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1172  			merge &= obj == req_obj &&
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1173  				 offset == req_offset +
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1174  					   (addr - req_addr);
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1175  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1176  			if (end == req_end) {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1177  				ret = op_unmap_cb(ops, priv, va, merge);
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1178  				if (ret)
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1179  					return ret;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1180  				break;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1181  			}
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1182  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1183  			if (end < req_end) {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1184  				ret = op_unmap_cb(ops, priv, va, merge);
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1185  				if (ret)
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1186  					return ret;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1187  				goto next;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1188  			}
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1189  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1190  			if (end > req_end) {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1191  				struct drm_gpuva_op_map n = {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1192  					.va.addr = req_end,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1193  					.va.range = end - req_end,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1194  					.gem.obj = obj,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1195  					.gem.offset = offset + req_end - addr,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1196  				};
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1197  				struct drm_gpuva_op_unmap u = {
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1198  					.va = va,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1199  					.keep = merge,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1200  				};
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1201  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1202  				ret = op_remap_cb(ops, priv, NULL, &n, &u);
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1203  				if (ret)
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1204  					return ret;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1205  				break;
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1206  			}
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1207  		}
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1208  next:
e6303f323b1ad9 Danilo Krummrich 2023-07-20 @1209  	}
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1210  
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1211  	return op_map_cb(ops, priv,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1212  			 req_addr, req_range,
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1213  			 req_obj, req_offset);
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1214  }
e6303f323b1ad9 Danilo Krummrich 2023-07-20  1215  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
