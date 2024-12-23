Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A75A9FA918
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 02:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E7510E084;
	Mon, 23 Dec 2024 01:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMDmi1Zc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0ADD10E084;
 Mon, 23 Dec 2024 01:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734918766; x=1766454766;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=T4sCONtDkgWBgW5Y5liRBMMMB+hz5OrLq7axDA3q130=;
 b=NMDmi1Zc6EnKghtEGnDlNzly/AoantsecPYpArdRVL+EtJNdWNCJquPq
 sGTnmuiBhKhnMkMDDkB6c0m1d9udo/3WQjPW7HvLFVkh86FTVp9pU+rLI
 TzMXlvbOwdZeJNJNYqLCGLpwrlImKmveG6jKGWha/yhGbaNwdgzyOYlUw
 eCCoUb4KNO6bfJdpPKDHJLdDdidU5M2EEwxynxLrWSit3temmP278+xkT
 h27QJt2fII8yAJEGeUNop7hG0je6Io1Rq06ZPUS0qdzN7lhL+feVZd69y
 G4IUQML4ZYC/C8oho+tTt40iguK8p1COWq0nTgU+fWU/YNDH9s5imbd9Q A==;
X-CSE-ConnectionGUID: Bvsskr4XR8CbA9G3YMqYig==
X-CSE-MsgGUID: zMohPpjRShGe0kFce5xVzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35413813"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; d="scan'208";a="35413813"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2024 17:52:45 -0800
X-CSE-ConnectionGUID: nEucv8zaSSS5RJ7lHaLYXw==
X-CSE-MsgGUID: QPyOoHUSSTaXQrF2qZgLqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122359887"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2024 17:51:44 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tPXbi-0003Lj-1m;
 Mon, 23 Dec 2024 01:51:42 +0000
Date: Mon, 23 Dec 2024 09:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 11/11] drm/msm/dp: drop the msm_dp_catalog module
Message-ID: <202412230903.RMun9kc4-lkp@intel.com>
References: <20241222-fd-dp-audio-fixup-v5-11-370f09492cf6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222-fd-dp-audio-fixup-v5-11-370f09492cf6@linaro.org>
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

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on c9261bcc1546a564407513e148c35a79a58bc2b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-msm-dp-split-MMSS_DP_DSC_DTO-register-write-to-a-separate-function/20241223-041635
base:   c9261bcc1546a564407513e148c35a79a58bc2b9
patch link:    https://lore.kernel.org/r/20241222-fd-dp-audio-fixup-v5-11-370f09492cf6%40linaro.org
patch subject: [PATCH v5 11/11] drm/msm/dp: drop the msm_dp_catalog module
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20241223/202412230903.RMun9kc4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230903.RMun9kc4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230903.RMun9kc4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_read_link':
>> drivers/gpu/drm/msm/dp/dp_panel.c:33:16: error: implicit declaration of function 'readl_relaxed' [-Wimplicit-function-declaration]
      33 |         return readl_relaxed(panel->link_base + offset);
         |                ^~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_write_link':
>> drivers/gpu/drm/msm/dp/dp_panel.c:43:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
      43 |         writel(data, panel->link_base + offset);
         |         ^~~~~~


vim +/readl_relaxed +33 drivers/gpu/drm/msm/dp/dp_panel.c

    30	
    31	static inline u32 msm_dp_read_link(struct msm_dp_panel_private *panel, u32 offset)
    32	{
  > 33		return readl_relaxed(panel->link_base + offset);
    34	}
    35	
    36	static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
    37				       u32 offset, u32 data)
    38	{
    39		/*
    40		 * To make sure link reg writes happens before any other operation,
    41		 * this function uses writel() instread of writel_relaxed()
    42		 */
  > 43		writel(data, panel->link_base + offset);
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
