Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B78DAC8215
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 20:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A9610E02E;
	Thu, 29 May 2025 18:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FblRZD3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D562510E0CB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 18:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748542848; x=1780078848;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GrYdPthuuV4voe6ZYw1AGGyhQX9V5TzLF3ORYCvQhnA=;
 b=FblRZD3WHWW3z+0BM39HDBfQUzQYBTzOKiONIP9wwWAxqdxiVbAL1spa
 OyC5QDRXiTmX/d+v8LSJ7h7BtS1YtBCo4XWCoJwjpj8c/KwVDDrMKLycO
 So9ug5Js88FYyhuUT3kbbrX8XZu2dMJdLar+Fb3+AVjG4AmtXD0Li8hhF
 JZjnwuIfZuImGaP+z3wQMN97UoYJjW9gQ8NykYDpoalSE+Q9ORo9DGO85
 NlAho+SqZb0v88IhJrP3e7jPr8L7so5lFB2p+ByN+mRzb6f80zR0C3Ltz
 brL74gPwcEc7hteTozIzN0SZRHim8RpZJj9clNwdpZiuJy1LaCFQq4iLL g==;
X-CSE-ConnectionGUID: WViY5EYbRPytT2BNPbgAjQ==
X-CSE-MsgGUID: nkvdKRcGS/6RdRNr7A0sWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50724874"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50724874"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:20:47 -0700
X-CSE-ConnectionGUID: 3nNr2650ReKeeInqckBaSw==
X-CSE-MsgGUID: s+hh8iSeQZGl5OUH0OMUlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="148795686"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 29 May 2025 11:20:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uKhrr-000Wya-1G;
 Thu, 29 May 2025 18:20:39 +0000
Date: Fri, 30 May 2025 02:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jayesh Choudhary <j-choudhary@ti.com>, dianders@chromium.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com,
 andyshrk@163.com
Cc: oe-kbuild-all@lists.linux.dev, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, lyude@redhat.com,
 andy.yan@rock-chips.com, mordan@ispras.ru, linux@treblig.org,
 viro@zeniv.linux.org.uk, a-bhatia1@ti.com, javierm@redhat.com,
 linux-kernel@vger.kernel.org, devarsht@ti.com, j-choudhary@ti.com
Subject: Re: [PATCH v3 1/5] drm/bridge: cadence: cdns-mhdp8546-core: Remove
 legacy support for connector initialisation in bridge
Message-ID: <202505300201.2s6r12yc-lkp@intel.com>
References: <20250529142517.188786-2-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529142517.188786-2-j-choudhary@ti.com>
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

Hi Jayesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.15 next-20250529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jayesh-Choudhary/drm-bridge-cadence-cdns-mhdp8546-core-Remove-legacy-support-for-connector-initialisation-in-bridge/20250529-222734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250529142517.188786-2-j-choudhary%40ti.com
patch subject: [PATCH v3 1/5] drm/bridge: cadence: cdns-mhdp8546-core: Remove legacy support for connector initialisation in bridge
config: riscv-randconfig-002-20250530 (https://download.01.org/0day-ci/archive/20250530/202505300201.2s6r12yc-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505300201.2s6r12yc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505300201.2s6r12yc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c: In function 'cdns_mhdp_hpd_work':
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2210:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    2210 |  int ret;
         |      ^~~


vim +/ret +2210 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c

6a3608eae6d33a Parshuram Thombare 2021-04-10  2204  
6a3608eae6d33a Parshuram Thombare 2021-04-10  2205  static void cdns_mhdp_hpd_work(struct work_struct *work)
6a3608eae6d33a Parshuram Thombare 2021-04-10  2206  {
6a3608eae6d33a Parshuram Thombare 2021-04-10  2207  	struct cdns_mhdp_device *mhdp = container_of(work,
6a3608eae6d33a Parshuram Thombare 2021-04-10  2208  						     struct cdns_mhdp_device,
6a3608eae6d33a Parshuram Thombare 2021-04-10  2209  						     hpd_work);
6a3608eae6d33a Parshuram Thombare 2021-04-10 @2210  	int ret;
6a3608eae6d33a Parshuram Thombare 2021-04-10  2211  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2212  	ret = cdns_mhdp_update_link_status(mhdp);
f25484d2ec5e5a Jayesh Choudhary   2025-05-29  2213  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2214  	drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2215  }
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2216  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
