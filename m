Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208255082E6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A416510F1B9;
	Wed, 20 Apr 2022 07:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBA610F1B8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650441256; x=1681977256;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/cXH9mhL+Kc+JfnZMdiLurkemiqzhu8RI4LasdVuTxk=;
 b=nioztINE61APMvG/FVpCFJffU/hp2HrzZSt5dCs5gdRrnM5FpOpW358a
 kiUJP7di/ca1JU5i/VbvsvDlppdHGtgQW2NeMdvu1nZOdiB8f/QqlaDq0
 gJKEOdsW4nB0p14GIrY0ehkYFatJ1hbMfxze22OIZ7Ng9YcMHJHoPAdLG
 wlzhJUlpdBTS0tCU5GeRJwyxsZhe35IyFgV75DGmUekXhEnnQC02MP7iU
 8zeTZEOmsQEuZBOZy8HgwEBl5ipmm4MhEtXw5wYhl3FsSZM3ZHJIxM02r
 5Ci5wh8h6D81OQzQ/TJDGGo5zd8lYaHYhBCn4KNBmRN6XIdaYffRC/Eq7 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="326867118"
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="326867118"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 00:54:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="804962470"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 20 Apr 2022 00:54:12 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nh5AB-0006jg-9D;
 Wed, 20 Apr 2022 07:54:11 +0000
Date: Wed, 20 Apr 2022 15:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH 2/2] drm/nvdla: Add driver support for NVDLA
Message-ID: <202204201512.pp20MXT5-lkp@intel.com>
References: <20220419135908.39606-3-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419135908.39606-3-cai.huoqing@linux.dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Cai,

I love your patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-tip/drm-tip linus/master v5.18-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cai-Huoqing/drm-nvdla-Add-driver-support-for-NVDLA/20220419-220255
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: h8300-randconfig-r014-20220420 (https://download.01.org/0day-ci/archive/20220420/202204201512.pp20MXT5-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7539e5487eb7d0c6f13c03bba596e51a2238106d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cai-Huoqing/drm-nvdla-Add-driver-support-for-NVDLA/20220419-220255
        git checkout 7539e5487eb7d0c6f13c03bba596e51a2238106d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross W=1 O=build_dir ARCH=h8300 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'drivers/gpu/drm/nvdla/nvdla_engine_data.o', needed by 'drivers/gpu/drm/nvdla/built-in.a'.
>> make[5]: *** No rule to make target 'drivers/gpu/drm/nvdla/nvdla_engine_debug.o', needed by 'drivers/gpu/drm/nvdla/built-in.a'.
   make[5]: Target '__build' not remade because of errors.
--
>> drivers/gpu/drm/nvdla/nvdla_drm.c:45:9: warning: no previous prototype for 'dla_get_time_us' [-Wmissing-prototypes]
      45 | int64_t dla_get_time_us(void)
         |         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/nvdla/nvdla_drm.c: In function 'nvdla_engine_isr':
>> drivers/gpu/drm/nvdla/nvdla_drm.c:75:18: warning: variable 'mask' set but not used [-Wunused-but-set-variable]
      75 |         uint32_t mask;
         |                  ^~~~
--
   drivers/gpu/drm/nvdla/nvdla_gem.c: In function 'nvdla_fill_task_desc':
>> drivers/gpu/drm/nvdla/nvdla_gem.c:39:17: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      39 |                 (void __user *)local_task->address_list,
         |                 ^
--
   drivers/gpu/drm/nvdla/nvdla_scheduler.c: In function 'dla_op_completion':
>> drivers/gpu/drm/nvdla/nvdla_scheduler.c:513:26: warning: variable 'task' set but not used [-Wunused-but-set-variable]
     513 |         struct dla_task *task;
         |                          ^~~~
--
>> drivers/gpu/drm/nvdla/nvdla_scheduler.c:363: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Dequeue next operation of same type from list of operations
   drivers/gpu/drm/nvdla/nvdla_scheduler.c:505: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Handle operation completion notification
   drivers/gpu/drm/nvdla/nvdla_scheduler.c:610: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Read network configuration from DRAM, network descriptor address
   drivers/gpu/drm/nvdla/nvdla_scheduler.c:920: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Execute task selected by task scheduler
--
   drivers/gpu/drm/nvdla/nvdla_bdma.c: In function 'dla_bdma_dump_config':
>> drivers/gpu/drm/nvdla/nvdla_bdma.c:157:39: warning: variable 'bdma_surface' set but not used [-Wunused-but-set-variable]
     157 |         struct dla_bdma_surface_desc *bdma_surface;
         |                                       ^~~~~~~~~~~~
>> drivers/gpu/drm/nvdla/nvdla_bdma.c:156:34: warning: variable 'bdma_op' set but not used [-Wunused-but-set-variable]
     156 |         struct dla_bdma_op_desc *bdma_op;
         |                                  ^~~~~~~
--
   drivers/gpu/drm/nvdla/nvdla_conv.c: In function 'dla_conv_dump_config':
>> drivers/gpu/drm/nvdla/nvdla_conv.c:666:39: warning: variable 'conv_surface' set but not used [-Wunused-but-set-variable]
     666 |         struct dla_conv_surface_desc *conv_surface;
         |                                       ^~~~~~~~~~~~
>> drivers/gpu/drm/nvdla/nvdla_conv.c:665:34: warning: variable 'conv_op' set but not used [-Wunused-but-set-variable]
     665 |         struct dla_conv_op_desc *conv_op;
         |                                  ^~~~~~~
--
>> drivers/gpu/drm/nvdla/nvdla_engine.c:67: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Get DMA data cube address
   drivers/gpu/drm/nvdla/nvdla_engine.c:88: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Read input buffer address
--
>> drivers/gpu/drm/nvdla/nvdla_bdma.c:56: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Program BDMA slot for transfer
--
   drivers/gpu/drm/nvdla/nvdla_sdp.c: In function 'processor_sdp_program':
>> drivers/gpu/drm/nvdla/nvdla_sdp.c:190:18: warning: variable 'atom_size' set but not used [-Wunused-but-set-variable]
     190 |         uint32_t atom_size;
         |                  ^~~~~~~~~
   drivers/gpu/drm/nvdla/nvdla_sdp.c: In function 'dla_sdp_dump_config':
>> drivers/gpu/drm/nvdla/nvdla_sdp.c:708:38: warning: variable 'sdp_surface' set but not used [-Wunused-but-set-variable]
     708 |         struct dla_sdp_surface_desc *sdp_surface;
         |                                      ^~~~~~~~~~~
>> drivers/gpu/drm/nvdla/nvdla_sdp.c:707:33: warning: variable 'sdp_op' set but not used [-Wunused-but-set-variable]
     707 |         struct dla_sdp_op_desc *sdp_op;
         |                                 ^~~~~~
   At top level:
   drivers/gpu/drm/nvdla/nvdla_sdp.c:118:22: warning: 'map_perf_nan_inf' defined but not used [-Wunused-const-variable=]
     118 | static const uint8_t map_perf_nan_inf[] = {
         |                      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/nvdla/nvdla_sdp.c:113:22: warning: 'map_perf_sat' defined but not used [-Wunused-const-variable=]
     113 | static const uint8_t map_perf_sat[] = {
         |                      ^~~~~~~~~~~~
   drivers/gpu/drm/nvdla/nvdla_sdp.c:108:22: warning: 'map_perf_lut' defined but not used [-Wunused-const-variable=]
     108 | static const uint8_t map_perf_lut[] = {
         |                      ^~~~~~~~~~~~
   drivers/gpu/drm/nvdla/nvdla_sdp.c:103:22: warning: 'map_perf_dma' defined but not used [-Wunused-const-variable=]
     103 | static const uint8_t map_perf_dma[] = {
         |                      ^~~~~~~~~~~~
--
   drivers/gpu/drm/nvdla/nvdla_cdp.c: In function 'dla_cdp_dump_config':
>> drivers/gpu/drm/nvdla/nvdla_cdp.c:280:38: warning: variable 'cdp_surface' set but not used [-Wunused-but-set-variable]
     280 |         struct dla_cdp_surface_desc *cdp_surface;
         |                                      ^~~~~~~~~~~
>> drivers/gpu/drm/nvdla/nvdla_cdp.c:279:33: warning: variable 'cdp_op' set but not used [-Wunused-but-set-variable]
     279 |         struct dla_cdp_op_desc *cdp_op;
         |                                 ^~~~~~
   At top level:
   drivers/gpu/drm/nvdla/nvdla_cdp.c:28:22: warning: 'map_perf_lut' defined but not used [-Wunused-const-variable=]
      28 | static const uint8_t map_perf_lut[] = {
         |                      ^~~~~~~~~~~~
   drivers/gpu/drm/nvdla/nvdla_cdp.c:23:22: warning: 'map_perf_dma' defined but not used [-Wunused-const-variable=]
      23 | static const uint8_t map_perf_dma[] = {
         |                      ^~~~~~~~~~~~
..


vim +/dla_get_time_us +45 drivers/gpu/drm/nvdla/nvdla_drm.c

    44	
  > 45	int64_t dla_get_time_us(void)
    46	{
    47		return ktime_get_ns() / NSEC_PER_USEC;
    48	}
    49	
    50	void dla_reg_write(void *driver_context, uint32_t addr, uint32_t reg)
    51	{
    52		struct nvdla_device *nvdla_dev =
    53				(struct nvdla_device *)driver_context;
    54	
    55		if (!nvdla_dev)
    56			return;
    57	
    58		writel(reg, nvdla_dev->base + addr);
    59	}
    60	
    61	uint32_t dla_reg_read(void *driver_context, uint32_t addr)
    62	{
    63		struct nvdla_device *nvdla_dev =
    64				(struct nvdla_device *)driver_context;
    65	
    66		if (!nvdla_dev)
    67			return 0;
    68	
    69		return readl(nvdla_dev->base + addr);
    70	}
    71	
    72	static irqreturn_t nvdla_engine_isr(int32_t irq, void *data)
    73	{
    74		unsigned long flags;
  > 75		uint32_t mask;
    76		uint32_t reg;
    77		struct dla_processor *processor = NULL;
    78		struct dla_processor_group *group;
    79		struct dla_engine *engine;
    80		struct nvdla_device *nvdla_dev = (struct nvdla_device *)data;
    81	
    82		if (!nvdla_dev)
    83			return IRQ_NONE;
    84	
    85		engine = nvdla_dev->engine_context;
    86		spin_lock_irqsave(&nvdla_dev->nvdla_lock, flags);
    87	
    88		mask = glb_reg_read(engine, S_INTR_MASK);
    89		reg = glb_reg_read(engine, S_INTR_STATUS);
    90	
    91		if (reg & MASK(GLB_S_INTR_STATUS_0, CACC_DONE_STATUS0)) {
    92			processor = &engine->processors[DLA_OP_CONV];
    93			group = &processor->groups[0];
    94			group->events |= (1 << DLA_EVENT_OP_COMPLETED);
    95		}
    96		if (reg & MASK(GLB_S_INTR_STATUS_0, CACC_DONE_STATUS1)) {
    97			processor = &engine->processors[DLA_OP_CONV];
    98			group = &processor->groups[1];
    99			group->events |= (1 << DLA_EVENT_OP_COMPLETED);
   100		}
   101		if (reg & MASK(GLB_S_INTR_STATUS_0, SDP_DONE_STATUS0)) {
   102			processor = &engine->processors[DLA_OP_SDP];
   103			group = &processor->groups[0];
   104			group->events |= (1 << DLA_EVENT_OP_COMPLETED);
   105		}
   106		if (reg & MASK(GLB_S_INTR_STATUS_0, SDP_DONE_STATUS1)) {
   107			processor = &engine->processors[DLA_OP_SDP];
   108			group = &processor->groups[1];
   109			group->events |= (1 << DLA_EVENT_OP_COMPLETED);
   110		}
   111		if (reg & MASK(GLB_S_INTR_STATUS_0, CDP_DONE_STATUS0)) {
   112			processor = &engine->processors[DLA_OP_CDP];
   113			group = &processor->groups[0];
   114			group->events |= (1 << DLA_EVENT_OP_COMPLETED);
   115		}
   116		if (reg & MASK(GLB_S_INTR_STATUS_0, CDP_DONE_STATUS1)) {
   117			processor = &engine->processors[DLA_OP_CDP];
   118			group = &processor->groups[1];
   119			group->events |= (1 << DLA_EVENT_OP_COMPLETED);
   120		}
   121		if (reg & MASK(GLB_S_INTR_STATUS_0, RUBIK_DONE_STATUS0)) {
   122			processor = &engine->processors[DLA_OP_RUBIK];
   123			group = &processor->groups[0];
   124			group->events |= (1 << DLA_EVENT_OP_COMPLETED);
   125		}
   126		if (reg & MASK(GLB_S_INTR_STATUS_0, RUBIK_DONE_STATUS1)) {
   127			processor = &engine->processors[DLA_OP_RUBIK];
   128			group = &processor->groups[1];
   129			group->events |= (1 << DLA_EVENT_OP_COMPLETED);
   130		}
   131		if (reg & MASK(GLB_S_INTR_STATUS_0, PDP_DONE_STATUS0)) {
   132			processor = &engine->processors[DLA_OP_PDP];
   133			group = &processor->groups[0];
   134			group->events |= (1 << DLA_EVENT_OP_COMPLETED);
   135		}
   136		if (reg & MASK(GLB_S_INTR_STATUS_0, PDP_DONE_STATUS1)) {
   137			processor = &engine->processors[DLA_OP_PDP];
   138			group = &processor->groups[1];
   139			group->events |= (1 << DLA_EVENT_OP_COMPLETED);
   140		}
   141		if (reg & MASK(GLB_S_INTR_STATUS_0, BDMA_DONE_STATUS0)) {
   142			processor = &engine->processors[DLA_OP_BDMA];
   143			group = &processor->groups[0];
   144			group->events |= (1 << DLA_EVENT_OP_COMPLETED);
   145		}
   146		if (reg & MASK(GLB_S_INTR_STATUS_0, BDMA_DONE_STATUS1)) {
   147			processor = &engine->processors[DLA_OP_BDMA];
   148			group = &processor->groups[1];
   149			group->events |= (1 << DLA_EVENT_OP_COMPLETED);
   150		}
   151		if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_DAT_DONE_STATUS0)) {
   152			processor = &engine->processors[DLA_OP_CONV];
   153			group = &processor->groups[0];
   154			group->events |= (1 << DLA_EVENT_CDMA_DT_DONE);
   155		}
   156		if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_DAT_DONE_STATUS1)) {
   157			processor = &engine->processors[DLA_OP_CONV];
   158			group = &processor->groups[1];
   159			group->events |= (1 << DLA_EVENT_CDMA_DT_DONE);
   160		}
   161		if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_WT_DONE_STATUS0)) {
   162			processor = &engine->processors[DLA_OP_CONV];
   163			group = &processor->groups[0];
   164			group->events |= (1 << DLA_EVENT_CDMA_WT_DONE);
   165		}
   166		if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_WT_DONE_STATUS1)) {
   167			processor = &engine->processors[DLA_OP_CONV];
   168			group = &processor->groups[1];
   169			group->events |= (1 << DLA_EVENT_CDMA_WT_DONE);
   170		}
   171	
   172		glb_reg_write(engine, S_INTR_STATUS, reg);
   173		mask = glb_reg_read(engine, S_INTR_MASK);
   174		reg = glb_reg_read(engine, S_INTR_STATUS);
   175	
   176		complete(&nvdla_dev->event_notifier);
   177		spin_unlock_irqrestore(&nvdla_dev->nvdla_lock, flags);
   178	
   179		return IRQ_HANDLED;
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
