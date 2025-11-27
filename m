Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8202C8E3D6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 13:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F063810E193;
	Thu, 27 Nov 2025 12:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ST2IUyE0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916E010E193
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 12:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764246282; x=1795782282;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iFmA0gfBLZi3VRH7c1aQ06IjGcorTM9TWDyCB6dTNtE=;
 b=ST2IUyE0iTz5Tr/jEdJhuczzn1uQR6jxHidA11ahBZgSlDbX06yyjiT9
 3rRZ1sMl0fyTJwig+3EeCySSA0KSQ5LVcj8Kr7QcWTuUAheg65KiX77E8
 RVvUtqQMw6rAD60NGTEMi8h8Nr01KfrLm5UD/no5BWiGMmglbtX+nZoMT
 /krrHdDuy+vUQvuwIlh3RCub+hFWNj179LL+OCadjduR65GRmdx2+gBUb
 xQg0CRuT26rqn/HSVLGrls21qBprcQks8YR8rZhvQQw4U+GBXddhRLfkh
 howRKTpltJSQKUia7OToH4wKEBaY2I6NRJwUHX8YFY9OjEqnVALo4LMO/ Q==;
X-CSE-ConnectionGUID: u8tOBgPNSkeBM1cKwBOVxQ==
X-CSE-MsgGUID: f1k1W/HMQEqcWm96n7puaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83685492"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="83685492"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 04:24:41 -0800
X-CSE-ConnectionGUID: +S3LMCMKQKKCeX7JLBZV4A==
X-CSE-MsgGUID: OkMQesF8QauVnnjuq5hlyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="192474715"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 27 Nov 2025 04:24:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vOb33-000000004k1-2N6M;
 Thu, 27 Nov 2025 12:24:33 +0000
Date: Thu, 27 Nov 2025 20:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>,
 kpallavi@qti.qualcomm.com, srini@kernel.org,
 amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>,
 quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v4 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
Message-ID: <202511272058.teHG4sdy-lkp@intel.com>
References: <20251126094545.2139376-3-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126094545.2139376-3-kumari.pallavi@oss.qualcomm.com>
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

Hi Kumari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus robh/for-next soc/for-next linus/master v6.18-rc7 next-20251127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kumari-Pallavi/dt-bindings-misc-qcom-fastrpc-Add-compatible-for-Kaanapali/20251126-175106
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20251126094545.2139376-3-kumari.pallavi%40oss.qualcomm.com
patch subject: [PATCH v4 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
config: arm-randconfig-002-20251127 (https://download.01.org/0day-ci/archive/20251127/202511272058.teHG4sdy-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511272058.teHG4sdy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511272058.teHG4sdy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/fastrpc.c:328:6: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     327 |                                         "Failed to assign memory dma_addr 0x%llx size 0x%llx err %d\n",
         |                                                                             ~~~~
         |                                                                             %x
     328 |                                         map->dma_addr, map->len, err);
         |                                         ^~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/misc/fastrpc.c:823:5: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     822 |                                 "Failed to assign memory with dma_addr 0x%llx size 0x%llx err %d\n",
         |                                                                          ~~~~
         |                                                                          %x
     823 |                                 map->dma_addr, map->len, err);
         |                                 ^~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/misc/fastrpc.c:1318:6: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
    1317 |                                         "Failed to assign memory with dma_addr 0x%llx size 0x%llx err %d\n",
         |                                                                                  ~~~~
         |                                                                                  %x
    1318 |                                         fl->cctx->remote_heap->dma_addr,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/misc/fastrpc.c:1373:5: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
    1372 |                         dev_err(fl->sctx->dev, "Failed to assign memory dma_addr 0x%llx size 0x%llx err %d\n",
         |                                                                                    ~~~~
         |                                                                                    %x
    1373 |                                 fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/misc/fastrpc.c:1953:5: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
    1952 |                                 "Failed to assign memory dma_addr 0x%llx size 0x%llx err %d",
         |                                                                     ~~~~
         |                                                                     %x
    1953 |                                 buf->dma_addr, buf->size, err);
         |                                 ^~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   5 warnings generated.


vim +328 drivers/misc/fastrpc.c

   307	
   308	static void fastrpc_free_map(struct kref *ref)
   309	{
   310		struct fastrpc_map *map;
   311	
   312		map = container_of(ref, struct fastrpc_map, refcount);
   313	
   314		if (map->table) {
   315			if (map->attr & FASTRPC_ATTR_SECUREMAP) {
   316				struct qcom_scm_vmperm perm;
   317				int vmid = map->fl->cctx->vmperms[0].vmid;
   318				u64 src_perms = BIT(QCOM_SCM_VMID_HLOS) | BIT(vmid);
   319				int err = 0;
   320	
   321				perm.vmid = QCOM_SCM_VMID_HLOS;
   322				perm.perm = QCOM_SCM_PERM_RWX;
   323				err = qcom_scm_assign_mem(map->dma_addr, map->len,
   324					&src_perms, &perm, 1);
   325				if (err) {
   326					dev_err(map->fl->sctx->dev,
   327						"Failed to assign memory dma_addr 0x%llx size 0x%llx err %d\n",
 > 328						map->dma_addr, map->len, err);
   329					return;
   330				}
   331			}
   332			dma_buf_unmap_attachment_unlocked(map->attach, map->table,
   333							  DMA_BIDIRECTIONAL);
   334			dma_buf_detach(map->buf, map->attach);
   335			dma_buf_put(map->buf);
   336		}
   337	
   338		if (map->fl) {
   339			spin_lock(&map->fl->lock);
   340			list_del(&map->node);
   341			spin_unlock(&map->fl->lock);
   342			map->fl = NULL;
   343		}
   344	
   345		kfree(map);
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
