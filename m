Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615C0397F36
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 04:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9229D6E2B8;
	Wed,  2 Jun 2021 02:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93DC89EF7;
 Wed,  2 Jun 2021 02:53:32 +0000 (UTC)
IronPort-SDR: lIpMvYX9reA2tWPI4rgTGH5FVg5yJLWfGkuGtiwVpAN+dmPqB7FC483ZmZgkhgOM/0QGMo8T75
 LYnXI0dS/Lvw==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="201828490"
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="201828490"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 19:53:30 -0700
IronPort-SDR: taM2g7piuPA/tI7H3izaG44N+uWOEH+QhG6oxGV5/5VfAPiQAvfYeAiIA7dNv2tcYerhmbQqRT
 ruZ+w6M5SgQA==
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="479525896"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.11])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 19:53:28 -0700
Date: Wed, 2 Jun 2021 10:53:13 +0800
From: kernel test robot <rong.a.chen@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/9] drm: Add Client Cap for advance gamma mode
Message-ID: <20210602025313.GE1271937@shao2-debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210601104135.29020-6-uma.shankar@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Uma Shankar <uma.shankar@intel.com>, kbuild-all@lists.01.org,
 bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uma,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next linus/master v5.13-rc4 next-20210601]
[cannot apply to drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Uma-Shankar/Enhance-pipe-color-support-for-multi-segmented-luts/20210601-180720
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs from latest version at 'include/uapi/drm/drm.h':  819> /**
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs from latest version at 'include/uapi/drm/drm.h':  820>  * Add support for advance gamma mode UAPI
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs from latest version at 'include/uapi/drm/drm.h':  821>  * If set to 1, DRM will enable advance gamma mode
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs from latest version at 'include/uapi/drm/drm.h':  822>  * UAPI to process the gamma mode based on extended
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs from latest version at 'include/uapi/drm/drm.h':  823>  * range and segments.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs from latest version at 'include/uapi/drm/drm.h':  824>  */
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs from latest version at 'include/uapi/drm/drm.h':  825> #define DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES     6
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs from latest version at 'include/uapi/drm/drm.h':  826> 

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
