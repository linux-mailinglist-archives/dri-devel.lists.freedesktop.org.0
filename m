Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7C123CB87
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 16:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA9089B4D;
	Wed,  5 Aug 2020 14:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E08189B4D;
 Wed,  5 Aug 2020 14:36:34 +0000 (UTC)
IronPort-SDR: kkLzShffdd/hCKV8QTepKwN45TnSAS99Fc/I5dbK+EHFZCjS5Ltkv+bI+CqVUf2sultkLNJ9Ls
 8zrSLyKf241Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="151765250"
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="151765250"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 07:36:34 -0700
IronPort-SDR: 5s5xL7ULjjcKwA1ZbMpzVSNN1By1k0TkGC8gswbPhyywEmWjzJT3xp3c7P9Gm/qC4oSD3648GN
 nvO0VM/eQO3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="323117445"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 05 Aug 2020 07:36:30 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k3KWs-0000oK-7X; Wed, 05 Aug 2020 14:36:30 +0000
Date: Wed, 5 Aug 2020 22:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com,
 jgross@suse.com, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [Intel-gfx] [PATCH 6/6] drm/xen-front: Add support for EDID
 based configuration
Message-ID: <202008052221.duhA3v0p%lkp@intel.com>
References: <20200731125109.18666-7-andr2000@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731125109.18666-7-andr2000@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 kbuild-all@lists.01.org, dan.carpenter@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oleksandr,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on drm-intel/for-linux-next tegra-drm/drm/tegra/for-next drm-tip/drm-tip linus/master v5.8 next-20200804]
[cannot apply to xen-tip/linux-next drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Oleksandr-Andrushchenko/Fixes-and-improvements-for-Xen-pvdrm/20200731-205350
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/irqchip/irq-gic.c:161:24: warning: Local variable gic_data shadows outer variable [shadowVar]
    struct gic_chip_data *gic_data = irq_data_get_irq_chip_data(d);
                          ^
   drivers/irqchip/irq-gic.c:123:29: note: Shadowed declaration
   static struct gic_chip_data gic_data[CONFIG_ARM_GIC_MAX_NR] __read_mostly;
                               ^
   drivers/irqchip/irq-gic.c:161:24: note: Shadow variable
    struct gic_chip_data *gic_data = irq_data_get_irq_chip_data(d);
                          ^
   drivers/irqchip/irq-gic.c:167:24: warning: Local variable gic_data shadows outer variable [shadowVar]
    struct gic_chip_data *gic_data = irq_data_get_irq_chip_data(d);
                          ^
   drivers/irqchip/irq-gic.c:123:29: note: Shadowed declaration
   static struct gic_chip_data gic_data[CONFIG_ARM_GIC_MAX_NR] __read_mostly;
                               ^
   drivers/irqchip/irq-gic.c:167:24: note: Shadow variable
    struct gic_chip_data *gic_data = irq_data_get_irq_chip_data(d);
                          ^
>> drivers/irqchip/irq-gic.c:400:28: warning: Local variable gic_irq shadows outer function [shadowFunction]
    unsigned int cascade_irq, gic_irq;
                              ^
   drivers/irqchip/irq-gic.c:171:28: note: Shadowed declaration
   static inline unsigned int gic_irq(struct irq_data *d)
                              ^
   drivers/irqchip/irq-gic.c:400:28: note: Shadow variable
    unsigned int cascade_irq, gic_irq;
                              ^
>> drivers/irqchip/irq-gic.c:1507:14: warning: Local variable gic_cpu_base shadows outer function [shadowFunction]
    phys_addr_t gic_cpu_base;
                ^
   drivers/irqchip/irq-gic.c:165:29: note: Shadowed declaration
   static inline void __iomem *gic_cpu_base(struct irq_data *d)
                               ^
   drivers/irqchip/irq-gic.c:1507:14: note: Shadow variable
    phys_addr_t gic_cpu_base;
                ^
>> drivers/irqchip/irq-gic-v3.c:874:71: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
    gic_data.rdists.has_direct_lpi &= (!!(typer & GICR_TYPER_DirectLPIS) |
                                                                         ^
>> drivers/irqchip/irq-gic-v3.c:1808:6: warning: Local variable nr_redist_regions shadows outer variable [shadowVar]
    u32 nr_redist_regions;
        ^
   drivers/irqchip/irq-gic-v3.c:1880:6: note: Shadowed declaration
    u32 nr_redist_regions;
        ^
   drivers/irqchip/irq-gic-v3.c:1808:6: note: Shadow variable
    u32 nr_redist_regions;
        ^
>> drivers/irqchip/irq-gic-v3.c:2042:6: warning: Local variable maint_irq_mode shadows outer variable [shadowVar]
    int maint_irq_mode;
        ^
   drivers/irqchip/irq-gic-v3.c:1884:6: note: Shadowed declaration
    int maint_irq_mode;
        ^
   drivers/irqchip/irq-gic-v3.c:2042:6: note: Shadow variable
    int maint_irq_mode;
        ^
>> drivers/gpu/drm/xen/xen_drm_front_cfg.c:76:6: warning: Variable 'ret' is reassigned a value before the old one has been used. [redundantAssignment]
    ret = xen_drm_front_get_edid(front_info, index, pages,
        ^
   drivers/gpu/drm/xen/xen_drm_front_cfg.c:61:0: note: Variable 'ret' is reassigned a value before the old one has been used.
    int i, npages, ret = -ENOMEM;
   ^
   drivers/gpu/drm/xen/xen_drm_front_cfg.c:76:6: note: Variable 'ret' is reassigned a value before the old one has been used.
    ret = xen_drm_front_get_edid(front_info, index, pages,
        ^

vim +/ret +76 drivers/gpu/drm/xen/xen_drm_front_cfg.c

    54	
    55	static void cfg_connector_edid(struct xen_drm_front_info *front_info,
    56				       struct xen_drm_front_cfg_connector *connector,
    57				       int index)
    58	{
    59		struct page **pages;
    60		u32 edid_sz;
    61		int i, npages, ret = -ENOMEM;
    62	
    63		connector->edid = vmalloc(XENDISPL_EDID_MAX_SIZE);
    64		if (!connector->edid)
    65			goto fail;
    66	
    67		npages = DIV_ROUND_UP(XENDISPL_EDID_MAX_SIZE, PAGE_SIZE);
    68		pages = kvmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
    69		if (!pages)
    70			goto fail_free_edid;
    71	
    72		for (i = 0; i < npages; i++)
    73			pages[i] = vmalloc_to_page((u8 *)connector->edid +
    74						   i * PAGE_SIZE);
    75	
  > 76		ret = xen_drm_front_get_edid(front_info, index, pages,
    77					     XENDISPL_EDID_MAX_SIZE, &edid_sz);
    78	
    79		kvfree(pages);
    80	
    81		if (ret < 0)
    82			goto fail_free_edid;
    83	
    84		ret = -EINVAL;
    85		if (!edid_sz || (edid_sz % EDID_LENGTH))
    86			goto fail_free_edid;
    87	
    88		if (!drm_edid_is_valid(connector->edid))
    89			goto fail_free_edid;
    90	
    91		DRM_INFO("Connector %s: using EDID for configuration, size %d\n",
    92			 connector->xenstore_path, edid_sz);
    93		return;
    94	
    95	fail_free_edid:
    96		cfg_connector_free_edid(connector);
    97	fail:
    98		/*
    99		 * If any error this is not critical as we can still read
   100		 * connector settings from XenStore, so just warn.
   101		 */
   102		DRM_WARN("Connector %s: cannot read or wrong EDID: %d\n",
   103			 connector->xenstore_path, ret);
   104	}
   105	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
