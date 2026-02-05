Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MF2E4TahGna5wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 18:59:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76487F6407
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 18:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D0A10E942;
	Thu,  5 Feb 2026 17:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKq5FTLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8F110E94D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 17:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770314367; x=1801850367;
 h=date:from:to:cc:subject:message-id;
 bh=BWsEYzfoVGS2aZH6wLlprpMOw6Auc5lQ1EEnep+ut7I=;
 b=CKq5FTLlQVs0EX24Xr+kByR8Y4ta7H3SB9pOEoZ8lGHIcBjVdk7k0pHk
 0//D5jSLj8CxY7wR8rCppLenl0yQhfcwUoVNdQmzs1eqbPbFJOtQ4OJvy
 7nMizq0EkBAkhS1/RT4ZoIgoCxfMg5XcYVPrNb46cxLlOblQJgk26mr2M
 SzmQ4lPF6WuCrnhyOA/ge6Oc2pHiOWB/2ijtXZUgDSlA7pP7v9cfN9YGD
 ovdU0EuPb8fYP+Xggu5sLIc40XQQ9On0KLc2V0NpJPjl2p0Ua8bCD0Y89
 1ah7CVSHaN0g0Mu9pszXjkwnC+qZHiwM0LmpmmZKOFwwpMVJG6NlV+1xA g==;
X-CSE-ConnectionGUID: VI/qF8nBRl+vTC85u6HWow==
X-CSE-MsgGUID: mM5S59stRLmhfvtARuiTKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70714604"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="70714604"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 09:59:26 -0800
X-CSE-ConnectionGUID: TsD8UibkQgufUL1PXmQvxg==
X-CSE-MsgGUID: ewUC/+paRh+KJ8UeG1wNJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210569214"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 05 Feb 2026 09:59:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vo3dS-00000000k5E-1JsY;
 Thu, 05 Feb 2026 17:59:22 +0000
Date: Fri, 06 Feb 2026 01:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [drm-misc:drm-misc-next 3/5]
 drivers/gpu/drm/verisilicon/vs_dc.c:146:64: warning: '%u' directive output
 may be truncated writing between 1 and 10 bytes into a region of size 2
Message-ID: <202602060154.ONBYvM9m-lkp@intel.com>
User-Agent: s-nail v14.9.25
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:uwu@icenowy.me,m:oe-kbuild-all@lists.linux.dev,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,01.org:url,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 76487F6407
X-Rspamd-Action: no action

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   779ec12c85c9e4547519e3903a371a3b26a289de
commit: dbf21777caa8b8c88c12f7f036b01208fec0d55a [3/5] drm: verisilicon: add a driver for Verisilicon display controllers
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260206/202602060154.ONBYvM9m-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060154.ONBYvM9m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602060154.ONBYvM9m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/verisilicon/vs_dc.c: In function 'vs_dc_probe':
>> drivers/gpu/drm/verisilicon/vs_dc.c:146:64: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
     146 |                 snprintf(pixclk_name, sizeof(pixclk_name), "pix%u", i);
         |                                                                ^~
   drivers/gpu/drm/verisilicon/vs_dc.c:146:60: note: directive argument in the range [0, 4294967294]
     146 |                 snprintf(pixclk_name, sizeof(pixclk_name), "pix%u", i);
         |                                                            ^~~~~~~
   drivers/gpu/drm/verisilicon/vs_dc.c:146:17: note: 'snprintf' output between 5 and 14 bytes into a destination of size 5
     146 |                 snprintf(pixclk_name, sizeof(pixclk_name), "pix%u", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +146 drivers/gpu/drm/verisilicon/vs_dc.c

    42	
    43	static int vs_dc_probe(struct platform_device *pdev)
    44	{
    45		struct device *dev = &pdev->dev;
    46		struct vs_dc *dc;
    47		void __iomem *regs;
    48		unsigned int port_count, i;
    49		/* pix0/pix1 */
    50		char pixclk_name[5];
    51		int irq, ret;
    52	
    53		if (!dev->of_node) {
    54			dev_err(dev, "can't find DC devices\n");
    55			return -ENODEV;
    56		}
    57	
    58		port_count = of_graph_get_port_count(dev->of_node);
    59		if (!port_count) {
    60			dev_err(dev, "can't find DC downstream ports\n");
    61			return -ENODEV;
    62		}
    63		if (port_count > VSDC_MAX_OUTPUTS) {
    64			dev_err(dev, "too many DC downstream ports than possible\n");
    65			return -EINVAL;
    66		}
    67	
    68		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
    69		if (ret) {
    70			dev_err(dev, "No suitable DMA available\n");
    71			return ret;
    72		}
    73	
    74		dc = devm_kzalloc(dev, sizeof(*dc), GFP_KERNEL);
    75		if (!dc)
    76			return -ENOMEM;
    77	
    78		dc->rsts[0].id = "core";
    79		dc->rsts[1].id = "axi";
    80		dc->rsts[2].id = "ahb";
    81	
    82		ret = devm_reset_control_bulk_get_optional_shared(dev, VSDC_RESET_COUNT,
    83								  dc->rsts);
    84		if (ret) {
    85			dev_err(dev, "can't get reset lines\n");
    86			return ret;
    87		}
    88	
    89		dc->core_clk = devm_clk_get_enabled(dev, "core");
    90		if (IS_ERR(dc->core_clk)) {
    91			dev_err(dev, "can't get core clock\n");
    92			return PTR_ERR(dc->core_clk);
    93		}
    94	
    95		dc->axi_clk = devm_clk_get_enabled(dev, "axi");
    96		if (IS_ERR(dc->axi_clk)) {
    97			dev_err(dev, "can't get axi clock\n");
    98			return PTR_ERR(dc->axi_clk);
    99		}
   100	
   101		dc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
   102		if (IS_ERR(dc->ahb_clk)) {
   103			dev_err(dev, "can't get ahb clock\n");
   104			return PTR_ERR(dc->ahb_clk);
   105		}
   106	
   107		irq = platform_get_irq(pdev, 0);
   108		if (irq < 0) {
   109			dev_err(dev, "can't get irq\n");
   110			return irq;
   111		}
   112	
   113		ret = reset_control_bulk_deassert(VSDC_RESET_COUNT, dc->rsts);
   114		if (ret) {
   115			dev_err(dev, "can't deassert reset lines\n");
   116			return ret;
   117		}
   118	
   119		regs = devm_platform_ioremap_resource(pdev, 0);
   120		if (IS_ERR(regs)) {
   121			dev_err(dev, "can't map registers");
   122			ret = PTR_ERR(regs);
   123			goto err_rst_assert;
   124		}
   125	
   126		dc->regs = devm_regmap_init_mmio(dev, regs, &vs_dc_regmap_cfg);
   127		if (IS_ERR(dc->regs)) {
   128			ret = PTR_ERR(dc->regs);
   129			goto err_rst_assert;
   130		}
   131	
   132		ret = vs_fill_chip_identity(dc->regs, &dc->identity);
   133		if (ret)
   134			goto err_rst_assert;
   135	
   136		dev_info(dev, "Found DC%x rev %x customer %x\n", dc->identity.model,
   137			 dc->identity.revision, dc->identity.customer_id);
   138	
   139		if (port_count > dc->identity.display_count) {
   140			dev_err(dev, "too many downstream ports than HW capability\n");
   141			ret = -EINVAL;
   142			goto err_rst_assert;
   143		}
   144	
   145		for (i = 0; i < dc->identity.display_count; i++) {
 > 146			snprintf(pixclk_name, sizeof(pixclk_name), "pix%u", i);
   147			dc->pix_clk[i] = devm_clk_get(dev, pixclk_name);
   148			if (IS_ERR(dc->pix_clk[i])) {
   149				dev_err(dev, "can't get pixel clk %u\n", i);
   150				ret = PTR_ERR(dc->pix_clk[i]);
   151				goto err_rst_assert;
   152			}
   153		}
   154	
   155		ret = devm_request_irq(dev, irq, vs_dc_irq_handler, 0,
   156				       dev_name(dev), dc);
   157		if (ret) {
   158			dev_err(dev, "can't request irq\n");
   159			goto err_rst_assert;
   160		}
   161	
   162		dev_set_drvdata(dev, dc);
   163	
   164		ret = vs_drm_initialize(dc, pdev);
   165		if (ret)
   166			goto err_rst_assert;
   167	
   168		return 0;
   169	
   170	err_rst_assert:
   171		reset_control_bulk_assert(VSDC_RESET_COUNT, dc->rsts);
   172		return ret;
   173	}
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
