Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBB9CEACD9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 23:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D1310E17E;
	Tue, 30 Dec 2025 22:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BiIfpYXP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BCB10E17E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 22:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767135079; x=1798671079;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=iiIrdOFOFI+g5ldtCCr0SI9PsZxJwAVj2GLXKN3o2yc=;
 b=BiIfpYXP9chOSdNo00DlgE3x5l6V7lZ0/2rfnwq0qkrznt6G+unF2If4
 y3oSOGlHd+PSARkGPbCL+T/zRdiHT/QpGJiyI7uM6FNqzU+8ArQctDOUB
 f+15q2kLuSbUmONarGrP86ywH7OHZ9GFGqnfH6Sd6SLVTjLNCkyyTayco
 QL5q8CJve8X9v5qtY8vQ1I8p+qvC0aexurzjggkje1jpUnPUpm8R4tUit
 4z/0r8fSikMLDATvrV7bpTCtGNScT7seKOR+758zuvsd55lSsS16efdDO
 qbI9yAU+4y+knUmLX3F5quloeeQLT7Xx+W9yyo2A28bS5gUhQQF66vaAA g==;
X-CSE-ConnectionGUID: GrPoEbedSSyV29/zE8CWjQ==
X-CSE-MsgGUID: i+EA81/NR+WzOy20xMlAGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68472785"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; d="scan'208";a="68472785"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 14:51:19 -0800
X-CSE-ConnectionGUID: qnO7xPkvQMuvVXxVszJGXw==
X-CSE-MsgGUID: C1zcGa4bS1GI4uvX2ooaAA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a)
 ([10.211.93.152])
 by fmviesa003.fm.intel.com with ESMTP; 30 Dec 2025 14:51:18 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vaiYd-00000000820-1EEq;
 Tue, 30 Dec 2025 22:51:15 +0000
Date: Tue, 30 Dec 2025 23:50:49 +0100
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, linux-doc@vger.kernel.org
Subject: [drm-misc:for-linux-next 2/18] htmldocs:
 Documentation/gpu/drm-kms-helpers:197: ./drivers/gpu/drm/drm_bridge.c:1521:
 WARNING: Block quote ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202512302319.1PGGt3CN-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git for-linux-next
head:   40630210211a34f0714fe976530ccf1291e5ef78
commit: 9da0e06abda87b1f97014113d5231fdeb4700749 [2/18] drm/bridge: deprecate of_drm_find_bridge()
reproduce: (https://download.01.org/0day-ci/archive/20251230/202512302319.1PGGt3CN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512302319.1PGGt3CN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/gpu/drm-kms:360: ./drivers/gpu/drm/drm_fourcc.c:397: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:35.
   Declaration is '.. c:function:: const struct drm_format_info * drm_format_info (u32 format)'. [duplicate_declaration.c]
   Documentation/gpu/drm-kms:491: ./drivers/gpu/drm/drm_modeset_lock.c:377: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:48.
   Declaration is '.. c:function:: int drm_modeset_lock (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'. [duplicate_declaration.c]
   Documentation/gpu/drm-kms-helpers:197: ./drivers/gpu/drm/drm_bridge.c:1519: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/drm-kms-helpers:197: ./drivers/gpu/drm/drm_bridge.c:1521: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./include/linux/hdmi.h
   ERROR: Cannot find file ./include/linux/hdmi.h
   WARNING: No kernel-doc for file ./include/linux/hdmi.h
   WARNING: ./drivers/gpu/drm/scheduler/sched_main.c:367 function parameter 'result' not described in 'drm_sched_job_done'
   Documentation/gpu/drm-uapi:607: ./drivers/gpu/drm/drm_ioctl.c:923: WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:69.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
