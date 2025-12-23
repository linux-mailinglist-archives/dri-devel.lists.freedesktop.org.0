Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F23CD79A9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 02:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA22810E105;
	Tue, 23 Dec 2025 01:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATS/pRg2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7636710E105
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 01:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766451693; x=1797987693;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XjIDb9uNLq1iGyrVNKgCjIHdLfX2vLHgSLa+wD2UtSw=;
 b=ATS/pRg26nIHTeu5y3e4/Mn7sTT469ygUh15S2ukFrC9B7Oemk5RL59I
 XWWrABlK/5jFVZybR2+q5r619KF5/hSQwdWSVBwUEWXTiahNiwc81Efib
 Ua4AAw84DTydi5TaP0wLeSvMsJllsbzbGztL2VLnLY2VG2HkCIVTcT10n
 KngrNqSuTU08jTrj/d15RoeCGZWALbJryWEWozHYKkLcL9FxahUmvas3W
 N3Z8jZcPWyJp0Z4ouB2LyGAGLXV71kjofdHHZD8v50+r9R1FMepa4Ej3t
 J7bLHn1R4M/0hdkl0dy1XeWQSxQDyYK4Q1AnMB/r05cKQohy2a/T3wgot Q==;
X-CSE-ConnectionGUID: sr+Z4y6MQHWuMBseoMg29Q==
X-CSE-MsgGUID: jOct8xo4Qum/e9pqtcg64A==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68350721"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="68350721"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 17:01:32 -0800
X-CSE-ConnectionGUID: 3NSC3j0xRIOcn/ncFk6Iww==
X-CSE-MsgGUID: kEnM13XhQp2T5kS78DVayw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="230664464"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a)
 ([10.211.93.152])
 by fmviesa001.fm.intel.com with ESMTP; 22 Dec 2025 17:01:28 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vXqmE-000000005gW-1GX2;
 Tue, 23 Dec 2025 01:01:26 +0000
Date: Tue, 23 Dec 2025 02:00:41 +0100
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, victoria@system76.com,
 sebastian.wick@redhat.com, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
Message-ID: <202512230158.yEDymogC-lkp@intel.com>
References: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
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

Hi Louis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8e7460eac786c72f48c4e04ce9be692b939428ce]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/Documentation-ABI-vkms-Add-current-VKMS-ABI-documentation/20251222-181426
base:   8e7460eac786c72f48c4e04ce9be692b939428ce
patch link:    https://lore.kernel.org/r/20251222-vkms-all-config-v3-18-ba42dc3fb9ff%40bootlin.com
patch subject: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251223/202512230158.yEDymogC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230158.yEDymogC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230158.yEDymogC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/vkms/vkms_configfs.c:676 expecting prototype for parse_next_format(). Prototype was for vkms_configfs_parse_next_format() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
