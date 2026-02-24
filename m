Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NQ9MtWhnWlrQwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 14:04:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B961875D9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 14:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAFB10E2BE;
	Tue, 24 Feb 2026 13:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8Gt0ziA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D43A10E2BE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 13:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771938257; x=1803474257;
 h=date:from:to:cc:subject:message-id;
 bh=YbNVbOfaVUBS5RcFF1QOaOBJQ0ahbzvh2/VZn6C/d18=;
 b=Z8Gt0ziAUEWFCKfRj3EXsqAsupeWijCiHLJkYK3Av4LV0MBvs0a9HuEo
 AnrzxuvHvzk5GjBmKtRl7rLLD5Fl5u18Bdir+OGBLc5w9uig5cuCx9ZBm
 IXLI8LMYS16IAgRBMa7RfRobSn053FjV3ydAjZ+XoLYx9tl2fbs3y6u+Y
 fQn6bYEoipxtOaS3hUGo3hCVLOiof5uDQeTzHd6y2QgORvcDD2habfB0x
 UxyZ4ysUBTCzqPmRcgdezYG5ypdaDEj9MNHg3q1OEbcNXplWuzCbytyvg
 WMAIm4IPqwfeEWVqJ27dZVp2DQWmDwt1JNhoDwC2j8GIMvzkwUAqd9t61 w==;
X-CSE-ConnectionGUID: 2je2qe7tQsCUMUiiXBEWUg==
X-CSE-MsgGUID: nNuCqjM3R5G8kFlT74c2HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73014574"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73014574"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:04:16 -0800
X-CSE-ConnectionGUID: RJJ/2a1rRXKapXfg4POo3Q==
X-CSE-MsgGUID: A5U8l61wTPW/t3zYqM926Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215757854"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 24 Feb 2026 05:04:14 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vus5E-000000001yT-0SZH;
 Tue, 24 Feb 2026 13:04:12 +0000
Date: Tue, 24 Feb 2026 21:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [drm-misc:drm-misc-next 3/5]
 drivers/gpu/drm/verisilicon/vs_bridge.c:325:9-16: WARNING: ERR_CAST can be
 used with bridge
Message-ID: <202602242000.bQ0qN6AC-lkp@intel.com>
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 39B961875D9
X-Rspamd-Action: no action

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   61c0f69a2ff79c8f388a9e973abb4853be467127
commit: dbf21777caa8b8c88c12f7f036b01208fec0d55a [3/5] drm: verisilicon: add a driver for Verisilicon display controllers
config: riscv-randconfig-r052-20260224 (https://download.01.org/0day-ci/archive/20260224/202602242000.bQ0qN6AC-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602242000.bQ0qN6AC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/verisilicon/vs_bridge.c:325:9-16: WARNING: ERR_CAST can be used with bridge
--
>> drivers/gpu/drm/verisilicon/vs_crtc.c:175:9-16: WARNING: ERR_CAST can be used with primary
--
>> drivers/gpu/drm/verisilicon/vs_dc.c:109:2-9: line 109 is redundant because platform_get_irq() already prints an error

vim +325 drivers/gpu/drm/verisilicon/vs_bridge.c

   288	
   289	struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
   290					 struct vs_crtc *crtc)
   291	{
   292		unsigned int output = crtc->id;
   293		struct vs_bridge *bridge;
   294		struct drm_bridge *next;
   295		enum vs_bridge_output_interface intf;
   296		const struct drm_bridge_funcs *bridge_funcs;
   297		int ret, enctype;
   298	
   299		intf = vs_bridge_detect_output_interface(drm_dev->dev->of_node,
   300							 output);
   301		if (intf == -ENODEV) {
   302			drm_dbg(drm_dev, "Skipping output %u\n", output);
   303			return NULL;
   304		}
   305	
   306		next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
   307					      output, intf);
   308		if (IS_ERR(next)) {
   309			ret = PTR_ERR(next);
   310			if (ret != -EPROBE_DEFER)
   311				drm_err(drm_dev,
   312					"Cannot get downstream bridge of output %u\n",
   313					output);
   314			return ERR_PTR(ret);
   315		}
   316	
   317		if (intf == VSDC_OUTPUT_INTERFACE_DPI)
   318			bridge_funcs = &vs_dpi_bridge_funcs;
   319		else
   320			bridge_funcs = &vs_dp_bridge_funcs;
   321	
   322		bridge = devm_drm_bridge_alloc(drm_dev->dev, struct vs_bridge, base,
   323					       bridge_funcs);
   324		if (IS_ERR(bridge))
 > 325			return ERR_PTR(PTR_ERR(bridge));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
