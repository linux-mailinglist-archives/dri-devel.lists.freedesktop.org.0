Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FC89FEF55
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 13:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C0D10E670;
	Tue, 31 Dec 2024 12:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aaroh0/Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DB110E66E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 12:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735648682; x=1767184682;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eO4FJRCM46xV+UKrRsbLkkdoDyXhlS27Mj0ITYumRtE=;
 b=aaroh0/QE21OGMXBW69O6S+FU/NpY2wIeoeCR+IrTOnJqhOZhoe/7TEz
 JFKbd7QEEV0fHmnQ5V9e3lIaHj7tNKvRN5tqiSuIXKPTfjFe78gfsQLLj
 V+wKUIeSowL+Ef8DzTKN03Ioa6EMxz3Y3xjXu93OTH6iSw1+6PhqoYFav
 6k0uxK51JJgo4KxPXV9lRDn2r2I8uprMlSwyuB5IJSUhzk9zKC8qWZjpO
 /QIIGgPUTNJGKSAHNNdkW9wusadXhc//iANDSHtT5bDMuX3k4UN3R33gG
 lDACWp5e0Fq2UZbmE8nWq+NME9s1eC6V1mqtE7rbVngTPOyzHG19LD6q1 Q==;
X-CSE-ConnectionGUID: ZUvbmKrbT62X8078a4Gfxg==
X-CSE-MsgGUID: /OWA8JA9TFWQd4eH+l5LwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35813585"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="35813585"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 04:38:01 -0800
X-CSE-ConnectionGUID: sMd/QGpVSAa/dpWzn+5Llw==
X-CSE-MsgGUID: /wIZTnzGSxiLz8HU51MmMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="131982658"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 31 Dec 2024 04:37:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tSbVS-00076l-10;
 Tue, 31 Dec 2024 12:37:54 +0000
Date: Tue, 31 Dec 2024 20:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou <zhoubb.aaron@gmail.com>,
 Huacai Chen <chenhuacai@loongson.cn>, Lee Jones <lee@kernel.org>,
 Corey Minyard <minyard@acm.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 dri-devel@lists.freedesktop.org, Xuerui Wang <kernel@xen0n.name>,
 loongarch@lists.linux.dev, Chong Qiao <qiaochong@loongson.cn>
Subject: Re: [PATCH v1 2/4] ipmi: Add Loongson-2K BMC support
Message-ID: <202412311950.Ij7v1vKv-lkp@intel.com>
References: <a4cfdeed1a91a7a12c7ebe56bed2ba94991c4065.1735550269.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4cfdeed1a91a7a12c7ebe56bed2ba94991c4065.1735550269.git.zhoubinbin@loongson.cn>
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

Hi Binbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.13-rc5]
[cannot apply to cminyard-ipmi/for-next lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mfd-ls2kbmc-Introduce-Loongson-2K-BMC-MFD-Core-driver/20241230-174205
base:   linus/master
patch link:    https://lore.kernel.org/r/a4cfdeed1a91a7a12c7ebe56bed2ba94991c4065.1735550269.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v1 2/4] ipmi: Add Loongson-2K BMC support
config: loongarch-randconfig-r123-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311950.Ij7v1vKv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241231/202412311950.Ij7v1vKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311950.Ij7v1vKv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/char/ipmi/ipmi_si_ls2k.c:110:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ls2k_kcs_data *ik @@     got void [noderef] __iomem *const addr @@
   drivers/char/ipmi/ipmi_si_ls2k.c:110:38: sparse:     expected struct ls2k_kcs_data *ik
   drivers/char/ipmi/ipmi_si_ls2k.c:110:38: sparse:     got void [noderef] __iomem *const addr
   drivers/char/ipmi/ipmi_si_ls2k.c:168:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ls2k_kcs_data *ik @@     got void [noderef] __iomem *const addr @@
   drivers/char/ipmi/ipmi_si_ls2k.c:168:38: sparse:     expected struct ls2k_kcs_data *ik
   drivers/char/ipmi/ipmi_si_ls2k.c:168:38: sparse:     got void [noderef] __iomem *const addr
>> drivers/char/ipmi/ipmi_si_ls2k.c:226:24: sparse: sparse: symbol 'ipmi_ls2k_platform_driver' was not declared. Should it be static?

vim +110 drivers/char/ipmi/ipmi_si_ls2k.c

   106	
   107	static unsigned char ls2k_mem_inb(const struct si_sm_io *io,
   108					  unsigned int offset)
   109	{
 > 110		struct ls2k_kcs_data *ik = io->addr;
   111		int inb = 0;
   112	
   113		if (ik->version == 0)
   114			inb = intf_sim_inb_v0(ik, offset);
   115		else if (ik->version == 1)
   116			inb = intf_sim_inb_v1(ik, offset);
   117	
   118		return inb;
   119	}
   120	
   121	static void intf_sim_outb_v0(struct ls2k_kcs_data *ik, unsigned int offset,
   122				     unsigned char val)
   123	{
   124		if (ls2k_get_ibf(ik))
   125			return;
   126	
   127		switch (offset & BIT(0)) {
   128		case 0:
   129			ik->reg.data_in = val;
   130			ik->reg.status &= ~LS2K_KCS_STS_CMD;
   131			break;
   132	
   133		case 1:
   134			ik->reg.cmd = val;
   135			ik->reg.status |= LS2K_KCS_STS_CMD;
   136			break;
   137		}
   138	
   139		ls2k_set_ibf(ik, 1);
   140		ik->write_req++;
   141	}
   142	
   143	static void intf_sim_outb_v1(struct ls2k_kcs_data *ik, unsigned int offset,
   144				     unsigned char val)
   145	{
   146		if (ik->fifo.ibfh != ik->fifo.ibft)
   147			return;
   148	
   149		switch (offset & BIT(0)) {
   150		case 0:
   151			ik->reg.data_in = val;
   152			ik->cmd_data = 0;
   153			break;
   154	
   155		case 1:
   156			ik->reg.cmd = val;
   157			ik->cmd_data = 1;
   158			break;
   159		}
   160	
   161		ik->fifo.ibfh = !ik->fifo.ibft;
   162		ik->write_req++;
   163	}
   164	
   165	static void ls2k_mem_outb(const struct si_sm_io *io, unsigned int offset,
   166				  unsigned char val)
   167	{
   168		struct ls2k_kcs_data *ik = io->addr;
   169	
   170		if (ik->version == 0)
   171			intf_sim_outb_v0(ik, offset, val);
   172		else if (ik->version == 1)
   173			intf_sim_outb_v1(ik, offset, val);
   174	}
   175	
   176	static void ls2k_mem_cleanup(struct si_sm_io *io)
   177	{
   178		if (io->addr)
   179			iounmap(io->addr);
   180	}
   181	
   182	static int ipmi_ls2k_sim_setup(struct si_sm_io *io)
   183	{
   184		io->addr = ioremap(io->addr_data, io->regspacing);
   185		if (!io->addr)
   186			return -EIO;
   187	
   188		io->inputb = ls2k_mem_inb;
   189		io->outputb = ls2k_mem_outb;
   190		io->io_cleanup = ls2k_mem_cleanup;
   191	
   192		return 0;
   193	}
   194	
   195	static int ipmi_ls2k_probe(struct platform_device *pdev)
   196	{
   197		struct si_sm_io io;
   198	
   199		dev_info(&pdev->dev, "probing via ls2k platform");
   200		memset(&io, 0, sizeof(io));
   201	
   202		io.addr_source	= SI_PLATFORM;
   203		io.si_type	= SI_KCS;
   204		io.addr_space	= IPMI_MEM_ADDR_SPACE;
   205		io.io_setup	= ipmi_ls2k_sim_setup;
   206		io.addr_data	= pdev->resource[0].start;
   207		io.regspacing	= pdev->resource[0].end - pdev->resource[0].start + 1;
   208		io.regsize	= DEFAULT_REGSIZE;
   209		io.regshift	= 0;
   210		io.dev		= &pdev->dev;
   211		io.irq		= 0;
   212		if (io.irq)
   213			io.irq_setup = ipmi_std_irq_setup;
   214	
   215		dev_info(&pdev->dev, "%pR regsize %d spacing %d irq %d\n",
   216			 &pdev->resource[0], io.regsize, io.regspacing, io.irq);
   217	
   218		return ipmi_si_add_smi(&io);
   219	}
   220	
   221	static void ipmi_ls2k_remove(struct platform_device *pdev)
   222	{
   223		ipmi_si_remove_by_dev(&pdev->dev);
   224	}
   225	
 > 226	struct platform_driver ipmi_ls2k_platform_driver = {
   227		.driver = {
   228			.name = "ls2k-ipmi-si",
   229		},
   230		.probe	= ipmi_ls2k_probe,
   231		.remove	= ipmi_ls2k_remove,
   232	};
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
