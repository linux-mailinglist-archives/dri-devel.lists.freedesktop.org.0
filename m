Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE270C0334E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 21:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0EC10E0C9;
	Thu, 23 Oct 2025 19:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkHAt3ef";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D4010E0C1;
 Thu, 23 Oct 2025 19:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761248380; x=1792784380;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OSmpnNs0/AMNUFsS6Fsz1K/9p0tTe3Vtc+ysYl6ffNc=;
 b=fkHAt3efR2/QwWEEoqcsJXqaGlzkcQzjDXuGItii+gGlqTgd+Q7YM7qV
 VHVRQ6nALxz/7o0F+lb5qmZVn7swW1tVzP3Mek26f6+hGgyzPLz6oabjV
 DOtdyy6k/S3/Cfj2kX2T0qn+nmHjoZG9Jw9Nu8ZmCbhdGyFEMdt/EwMcE
 v3humuxo0l0D87/QeqLJP/8n+eccsMNKmi100n1++GBgprz79pj3xUjMo
 WrH1pjyAErIJNlUiJSMZAidIac+L4irHOZ6vHashvQgcnhn7jC7CxAxXV
 me4deObyX78vYfsLCBVxkx+7siQ1TyZCuZofkqlpvYVfxXoseBfxFf8PL w==;
X-CSE-ConnectionGUID: nukmwx9LTZCxdYjY34mvVA==
X-CSE-MsgGUID: Gl+nKTurRK+ty5Hy50+SDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62639515"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="62639515"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 12:39:40 -0700
X-CSE-ConnectionGUID: f2VFH6p4QSS41LQ8JPt06g==
X-CSE-MsgGUID: 2AGvUH8MQj+9jbyOus63oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184168230"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 23 Oct 2025 12:39:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vC19q-000DoX-35;
 Thu, 23 Oct 2025 19:39:34 +0000
Date: Fri, 24 Oct 2025 03:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>, YiPeng Chai <YiPeng.Chai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/amd/ras: Fix memory corruption in
 ras_core_convert_timestamp_to_time()
Message-ID: <202510240310.WujwpVmw-lkp@intel.com>
References: <aPi6I5z5oenppEuu@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPi6I5z5oenppEuu@stanley.mountain>
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

Hi Dan,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251022]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/drm-amd-ras-Fix-memory-corruption-in-ras_core_convert_timestamp_to_time/20251022-190512
base:   next-20251022
patch link:    https://lore.kernel.org/r/aPi6I5z5oenppEuu%40stanley.mountain
patch subject: [PATCH next] drm/amd/ras: Fix memory corruption in ras_core_convert_timestamp_to_time()
config: i386-randconfig-014-20251023 (https://download.01.org/0day-ci/archive/20251024/202510240310.WujwpVmw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240310.WujwpVmw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510240310.WujwpVmw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "__udivdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>> ERROR: modpost: "__udivmoddi4" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
