Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32093CD6E1D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 19:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C98B10E170;
	Mon, 22 Dec 2025 18:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gBkg4yCv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4BE10E170
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766427386; x=1797963386;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4G63B7NcT350/hI7OLQmxKtNgn/KtaUXOJmbgGt7+U8=;
 b=gBkg4yCv2zmIYOQ8+Py4yUWWu8qlsBqwt9cx9gdPP/pbmPMQJO+qami2
 1L92vtqtovkIHd9LJlsfhH51Z7/Z2Rb+qgGmmmHddDhkpnmSvKbVrlPsw
 /yq1XRP5j4Ej58tL3Q1MonOyDknOId3qD8eiP9dj9yXJDDgAXKoUdU4QP
 XN6Tc0Z1AVYSUJhjAnzvAGQbzb2p+5s8zwQQ9gLyDzmBDp0M2gkJuvHR4
 pPojxeB/lCTdwsxyCZviJZkHPmvW0oIRSvFSY3tPt4JNOhPDpWv4ioShm
 viIzhoRuidxfVJ+dsKaz+J+I/bXI9hGQTb4Zo46O6TdXengSeHPBggs87 Q==;
X-CSE-ConnectionGUID: oL7yxgWJTVC8lCxy+H8Lng==
X-CSE-MsgGUID: YO5OVfvCSMuVSX2osqj5WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68327703"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="68327703"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 10:16:26 -0800
X-CSE-ConnectionGUID: dh/ULpo6SPCAtTG1ixUtDw==
X-CSE-MsgGUID: L99Vm9fcS2KzJLqP6Juqqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="200486388"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a)
 ([10.211.93.152])
 by fmviesa010.fm.intel.com with ESMTP; 22 Dec 2025 10:16:23 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vXkSD-000000005Zg-01dx;
 Mon, 22 Dec 2025 18:16:21 +0000
Date: Mon, 22 Dec 2025 19:15:37 +0100
From: kernel test robot <lkp@intel.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: Re: [PATCH v6 1/7] drm/panthor: Add performance counter uAPI
Message-ID: <202512221946.gSB6iMCE-lkp@intel.com>
References: <20251215171453.2506348-2-lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215171453.2506348-2-lukas.zapolskas@arm.com>
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

Hi Lukas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20251219]
[cannot apply to linus/master v6.19-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Zapolskas/drm-panthor-Add-performance-counter-uAPI/20251216-012117
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251215171453.2506348-2-lukas.zapolskas%40arm.com
patch subject: [PATCH v6 1/7] drm/panthor: Add performance counter uAPI
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221946.gSB6iMCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221946.gSB6iMCE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/backlight.h
   ERROR: Cannot find file ./include/linux/backlight.h
   WARNING: No kernel-doc for file ./include/linux/backlight.h
   WARNING: ./include/uapi/drm/panthor_drm.h:381 struct member 'selected_coherency' not described in 'drm_panthor_gpu_info'
   WARNING: ./include/uapi/drm/panthor_drm.h:381 struct member 'selected_coherency' not described in 'drm_panthor_gpu_info'
>> Documentation/gpu/driver-uapi:24: ./include/uapi/drm/panthor_drm.h:1473: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/drm-kms:360: ./drivers/gpu/drm/drm_fourcc.c:397: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:35.
   Declaration is '.. c:function:: const struct drm_format_info * drm_format_info (u32 format)'. [duplicate_declaration.c]
   Documentation/gpu/drm-kms:491: ./drivers/gpu/drm/drm_modeset_lock.c:377: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:48.
   Declaration is '.. c:function:: int drm_modeset_lock (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'. [duplicate_declaration.c]
   ERROR: Cannot find file ./include/linux/hdmi.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
