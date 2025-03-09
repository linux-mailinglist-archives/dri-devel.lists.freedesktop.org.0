Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D87A5896A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 00:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D2410E37B;
	Sun,  9 Mar 2025 23:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYpVNIID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7415910E37B;
 Sun,  9 Mar 2025 23:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741564705; x=1773100705;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3g/+jeRs5nhDAbqAZc0kAv6A5GCo+NTky5mMlZ8s5Zw=;
 b=VYpVNIIDWhm7i0bWJdVottemoAoV5Pp1/5/EpB46Cv6i2jOt89oGdpko
 rkLV/QbAKup2yeHXeN0XXmi/l8Amb+lLNAfZxD1m5HvST3LVJGInF/Vq2
 YAwKcekBqHaU/OZW8IpTpiiekwR0MkaFEKDUxIydlHJg8ounf1gws5tPw
 23JF+Q4qFYz8ruL6gnv/qTPgLBsWgNB0y4mKX6M8oxrJb4VlqUTwrbLs3
 68NKYr7+aMexlcMv8ltxJUZThzNSKfiFbIbJ1ZsFMgY9w0extH3Oo0f9U
 BlXy3yo0iObea59LnJ3F8ILTYOmbFphJq0xhSA8m6MBI9oLxIlgl5U/wE w==;
X-CSE-ConnectionGUID: E5XjRYvtQQWsYWBmeG5uuA==
X-CSE-MsgGUID: fvWkdraxRMSMJUP2f3K3zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="52756897"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="52756897"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 16:58:25 -0700
X-CSE-ConnectionGUID: AipAg9jNT0is5bFPMhYlNQ==
X-CSE-MsgGUID: D/npFTWhRJGdziAE2u95Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="124439273"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 09 Mar 2025 16:58:19 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1trQX8-0003ZI-02;
 Sun, 09 Mar 2025 23:58:15 +0000
Date: Mon, 10 Mar 2025 07:57:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/4] drm/msm/hdmi: use new helper for ACR tables
Message-ID: <202503100745.KWEAWjFD-lkp@intel.com>
References: <20250309-drm-hdmi-acr-v1-2-bb9c242f4d4b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309-drm-hdmi-acr-v1-2-bb9c242f4d4b@linaro.org>
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

[auto build test ERROR on 0a2f889128969dab41861b6e40111aa03dc57014]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-hdmi-provide-central-data-authority-for-ACR-params/20250309-161610
base:   0a2f889128969dab41861b6e40111aa03dc57014
patch link:    https://lore.kernel.org/r/20250309-drm-hdmi-acr-v1-2-bb9c242f4d4b%40linaro.org
patch subject: [PATCH 2/4] drm/msm/hdmi: use new helper for ACR tables
config: arm-randconfig-004-20250310 (https://download.01.org/0day-ci/archive/20250310/202503100745.KWEAWjFD-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100745.KWEAWjFD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100745.KWEAWjFD-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_hdmi_acr_get_n_cts" [drivers/gpu/drm/msm/msm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
