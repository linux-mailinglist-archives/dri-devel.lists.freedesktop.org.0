Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E77AB32889
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 14:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B00210E331;
	Sat, 23 Aug 2025 12:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DILsqVfG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C8F10E1E1;
 Sat, 23 Aug 2025 12:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755952181; x=1787488181;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v3xJNxOTA3ejstQq8SF/+geOe4Zrznj4F09Ilieo3V8=;
 b=DILsqVfGtKsxZpVkYvWzK9UTo2n3+49HKCUPqQy+k8LN+sxzNeqZLWSz
 LAGZPpIcuPWyvNmP+AeUeTaeVvxfUgGSDrAd3enzEA9xj/NuN0wrDzxwB
 Cuxa3ZmTA+So8uqVKYsQbWdf8tjRB6WQBDZRMsgOG4xTgljqp7JpVZdtP
 NlpUfFrRlSO71Q+B2nd60vL6R0LcgpQPOyPB23L3jn02hPWI+u3BIDFzx
 CLtkXXv/41p6K9LSGkJ/2nLAU6VWWzzKyiK8NfMLxkz7ZqfVypJbebNn/
 wM0gg+MNcgr17mtvbZG2cZsHu+DvMKkjlgcCoCn9JIBRlTAR1wep1e9WI Q==;
X-CSE-ConnectionGUID: DjRrc+p2RN6zh10HE20pGA==
X-CSE-MsgGUID: WQIlFWkMSzywLVufTxt7GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58158773"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58158773"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2025 05:29:41 -0700
X-CSE-ConnectionGUID: vUjtLK17TbSU8Jj/Npw2PQ==
X-CSE-MsgGUID: 9HVw6mUJQ9yrulwzZSkRhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="173316596"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa004.jf.intel.com with ESMTP; 23 Aug 2025 05:29:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1upnMm-000MIp-03;
 Sat, 23 Aug 2025 12:29:13 +0000
Date: Sat, 23 Aug 2025 20:28:18 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH] drm/nouveau: Support reclocking on gp10b
Message-ID: <202508232014.eQOclzLG-lkp@intel.com>
References: <20250822-gp10b-reclock-v1-1-5b03eaf3735a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-gp10b-reclock-v1-1-5b03eaf3735a@gmail.com>
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

Hi Aaron,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Kling-via-B4-Relay/drm-nouveau-Support-reclocking-on-gp10b/20250823-090132
base:   c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
patch link:    https://lore.kernel.org/r/20250822-gp10b-reclock-v1-1-5b03eaf3735a%40gmail.com
patch subject: [PATCH] drm/nouveau: Support reclocking on gp10b
config: x86_64-buildonly-randconfig-005-20250823 (https://download.01.org/0day-ci/archive/20250823/202508232014.eQOclzLG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508232014.eQOclzLG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508232014.eQOclzLG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c:30:1: warning: no previous prototype for 'gp10b_clk_read' [-Wmissing-prototypes]
      30 | gp10b_clk_read(struct nvkm_clk *base, enum nv_clk_src src)
         | ^~~~~~~~~~~~~~


vim +/gp10b_clk_read +30 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c

    28	
    29	int
  > 30	gp10b_clk_read(struct nvkm_clk *base, enum nv_clk_src src)
    31	{
    32		struct gp10b_clk *clk = gp10b_clk(base);
    33		struct nvkm_subdev *subdev = &clk->base.subdev;
    34	
    35		switch (src) {
    36		case nv_clk_src_gpc:
    37			return clk_get_rate(clk->clk) / GK20A_CLK_GPC_MDIV;
    38		default:
    39			nvkm_error(subdev, "invalid clock source %d\n", src);
    40			return -EINVAL;
    41		}
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
