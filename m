Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mplcCfJNl2lFwwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 18:52:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E241616B7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 18:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DC010E728;
	Thu, 19 Feb 2026 17:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3/ogsVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0527F10E728
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 17:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771523565; x=1803059565;
 h=date:from:to:cc:subject:message-id;
 bh=rewaKEPWQgRL6T7y5NXhHQDs9qR4wr0rnEN8a1RRycI=;
 b=g3/ogsVEOjnR5iu3FHSjVOM/XEPd2RD3ehTidv0dhjYDbZjRTuiX2f9b
 2cGGJ5w9XI8muLusqqhEy+wa+JNAQnvdSnxXJB/JHbfY/LsJ173nzZUgh
 KdfnRBiZ8vq/XvbbymrV8IHMoZJXYjONa60fVG6l7w1DYtP62WsJI5Atl
 iEDPRFPpccYyUgssSAhHxCQdNni1K0IKXhOub6JPTnjFqFVvBIGyBX2r1
 k8XUibjtZTlp95TuKq6r4hiKyT7tQkdIOOZBMByjiwDcH/AFWTeuomfPK
 0jZQV5EKSb8axTLSjB2+ti4RVihZWkSzwJg+L0mbQjbfiQIRiA/C9QOjk Q==;
X-CSE-ConnectionGUID: W5ZSbINfR/iD3IxJP1SWeQ==
X-CSE-MsgGUID: D0A6e/skRpi7Tam5vivQvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="83334577"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="83334577"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 09:52:44 -0800
X-CSE-ConnectionGUID: q5d9fzArT0iGG+jPKFlOJA==
X-CSE-MsgGUID: 0aZzNUAYQpq9gcehlel5Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="252283372"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 19 Feb 2026 09:52:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vt8Ce-000000013Qe-0oBA;
 Thu, 19 Feb 2026 17:52:40 +0000
Date: Fri, 20 Feb 2026 01:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
Subject: [drm-misc:drm-misc-next 5/25]
 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c:108:55: sparse: sparse:
 incorrect type in initializer (different base types)
Message-ID: <202602200130.LjofC7YE-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kory.maincent@bootlin.com,m:oe-kbuild-all@lists.linux.dev,m:luca.ceresoli@bootlin.com,m:herve.codina@bootlin.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,01.org:url,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 26E241616B7
X-Rspamd-Action: no action

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   948e195dfaa56e48eabda591f97630502ff7e27e
commit: 0ff223d991477fa4677dcb0f1fb00065847e2212 [5/25] drm/tilcdc: Convert legacy panel binding via DT overlay at boot time
config: arm-randconfig-r111-20260219 (https://download.01.org/0day-ci/archive/20260220/202602200130.LjofC7YE-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200130.LjofC7YE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200130.LjofC7YE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c:108:55: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c:108:55: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c:108:55: sparse:     got restricted __be32 [usertype]
   drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c:115:55: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c:115:55: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c:115:55: sparse:     got restricted __be32 [usertype]

vim +108 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c

    41	
    42	static int __init tilcdc_panel_copy_props(struct device_node *old_panel,
    43						  struct device_node *new_panel)
    44	{
    45		struct device_node *old_timing __free(device_node) = NULL;
    46		struct device_node *new_timing __free(device_node) = NULL;
    47		struct device_node *panel_info __free(device_node) = NULL;
    48		struct device_node *child __free(device_node) = NULL;
    49		u32 invert_pxl_clk = 0, sync_edge = 0;
    50		struct of_changeset ocs;
    51		struct property *prop;
    52		int ret;
    53	
    54		child = of_get_child_by_name(old_panel, "display-timings");
    55		if (!child)
    56			return -EINVAL;
    57	
    58		/* The default display timing is the one specified as native-mode.
    59		 * If no native-mode is specified then the first node is assumed
    60		 * to be the native mode.
    61		 */
    62		old_timing = of_parse_phandle(child, "native-mode", 0);
    63		if (!old_timing) {
    64			old_timing = of_get_next_child(child, NULL);
    65			if (!old_timing)
    66				return -EINVAL;
    67		}
    68	
    69		panel_info = of_get_child_by_name(old_panel, "panel-info");
    70		if (!panel_info)
    71			return -EINVAL;
    72	
    73		of_changeset_init(&ocs);
    74	
    75		/* Copy all panel properties to the new panel node */
    76		for_each_property_of_node(old_panel, prop) {
    77			if (!strncmp(prop->name, "compatible", sizeof("compatible")))
    78				continue;
    79	
    80			ret = tilcdc_panel_update_prop(&ocs, new_panel, prop->name,
    81						       prop->value, prop->length);
    82			if (ret)
    83				goto destroy_ocs;
    84		}
    85	
    86		new_timing = of_changeset_create_node(&ocs, new_panel, "panel-timing");
    87		if (!new_timing) {
    88			ret = -ENODEV;
    89			goto destroy_ocs;
    90		}
    91	
    92		/* Copy all panel timing properties to the new panel node */
    93		for_each_property_of_node(old_timing, prop) {
    94			ret = tilcdc_panel_update_prop(&ocs, new_timing, prop->name,
    95						       prop->value, prop->length);
    96			if (ret)
    97				goto destroy_ocs;
    98		}
    99	
   100		/* Looked only for these two parameter as all the other are always
   101		 * set to default and not related to common DRM properties.
   102		 */
   103		of_property_read_u32(panel_info, "invert-pxl-clk", &invert_pxl_clk);
   104		of_property_read_u32(panel_info, "sync-edge", &sync_edge);
   105	
   106		if (!invert_pxl_clk) {
   107			ret = tilcdc_panel_update_prop(&ocs, new_timing, "pixelclk-active",
 > 108						       &(u32){cpu_to_be32(1)}, sizeof(u32));
   109			if (ret)
   110				goto destroy_ocs;
   111		}
   112	
   113		if (!sync_edge) {
   114			ret = tilcdc_panel_update_prop(&ocs, new_timing, "syncclk-active",
   115						       &(u32){cpu_to_be32(1)}, sizeof(u32));
   116			if (ret)
   117				goto destroy_ocs;
   118		}
   119	
   120		/* Remove compatible property to avoid any driver compatible match */
   121		of_changeset_remove_property(&ocs, old_panel,
   122					     of_find_property(old_panel, "compatible", NULL));
   123	
   124		of_changeset_apply(&ocs);
   125		return 0;
   126	
   127	destroy_ocs:
   128		of_changeset_destroy(&ocs);
   129		return ret;
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
