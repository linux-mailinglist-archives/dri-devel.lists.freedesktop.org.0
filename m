Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C96792207
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 13:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC84F10E4AE;
	Tue,  5 Sep 2023 11:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640CA10E4AE;
 Tue,  5 Sep 2023 11:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693911689; x=1725447689;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fDI45R6W8t/ZljCV7zv9zrYFb6R9WkaVGX4N3lJCYbU=;
 b=EHikOsCb6iIOe/uiMkJIhmwdmV9tu6Kn/JXIGbU8ZmTzmvMS/BMLrs+n
 XwDedUrlGy3h3Fbc5iMi4TZe7NmCywtz7ZKm6y9xzIrhKX6X/hr5tt3BI
 lKHL/rjVZBlM/SfJ4S2fTxgU5GA/YBdbE7H31qHH8rx5YwNCIP9xqCOPg
 He4ZSw2BavQhxPUq1R/pqa9B/Gc+CdZ5W7PNS3dEykQzf09nM6nHXWuds
 8Mi48jQ2/Xva0xJzETYYSFD0hYIvc1vJC7oE5i9ZG22cAH3Qy4Qmuch57
 igeC+cfVr9s+L5Y8P+tUdbJsQQsA5gGrKAOWypQZRp5iDPnjVi1JL0ciH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="376690437"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="376690437"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 04:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="914793383"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="914793383"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 05 Sep 2023 04:00:33 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qdTnK-0001ZV-36;
 Tue, 05 Sep 2023 11:00:30 +0000
Date: Tue, 5 Sep 2023 19:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v5 3/6] drm/i915/panelreplay: Initializaton
 and compute config for panel replay
Message-ID: <202309051831.AMUjJOcB-lkp@intel.com>
References: <20230905073551.958368-4-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905073551.958368-4-animesh.manna@intel.com>
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
Cc: jani.nikula@intel.com, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Animesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Animesh-Manna/drm-panelreplay-dpcd-register-definition-for-panelreplay/20230905-154811
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230905073551.958368-4-animesh.manna%40intel.com
patch subject: [Intel-gfx] [PATCH v5 3/6] drm/i915/panelreplay: Initializaton and compute config for panel replay
config: i386-randconfig-r036-20230905 (https://download.01.org/0day-ci/archive/20230905/202309051831.AMUjJOcB-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309051831.AMUjJOcB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309051831.AMUjJOcB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dp.c:3779:27: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]
           if (vsc->revision != 0x5 || vsc->revision != 0x7)
               ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +3779 drivers/gpu/drm/i915/display/intel_dp.c

  3754	
  3755	static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
  3756					     struct dp_sdp *sdp, size_t size)
  3757	{
  3758		size_t length = sizeof(struct dp_sdp);
  3759	
  3760		if (size < length)
  3761			return -ENOSPC;
  3762	
  3763		memset(sdp, 0, size);
  3764	
  3765		/*
  3766		 * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
  3767		 * VSC SDP Header Bytes
  3768		 */
  3769		sdp->sdp_header.HB0 = 0; /* Secondary-Data Packet ID = 0 */
  3770		sdp->sdp_header.HB1 = vsc->sdp_type; /* Secondary-data Packet Type */
  3771		sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
  3772		sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
  3773	
  3774		/*
  3775		 * Other than revision 0x5 which supports Pixel Encoding/Colorimetry
  3776		 * Format as per DP 1.4a spec, revision 0x7 also supports Pixel
  3777		 * Encoding/Colorimetry Format as per DP 2.0 spec.
  3778		 */
> 3779		if (vsc->revision != 0x5 || vsc->revision != 0x7)
  3780			goto out;
  3781	
  3782		/* VSC SDP Payload for DB16 through DB18 */
  3783		/* Pixel Encoding and Colorimetry Formats  */
  3784		sdp->db[16] = (vsc->pixelformat & 0xf) << 4; /* DB16[7:4] */
  3785		sdp->db[16] |= vsc->colorimetry & 0xf; /* DB16[3:0] */
  3786	
  3787		switch (vsc->bpc) {
  3788		case 6:
  3789			/* 6bpc: 0x0 */
  3790			break;
  3791		case 8:
  3792			sdp->db[17] = 0x1; /* DB17[3:0] */
  3793			break;
  3794		case 10:
  3795			sdp->db[17] = 0x2;
  3796			break;
  3797		case 12:
  3798			sdp->db[17] = 0x3;
  3799			break;
  3800		case 16:
  3801			sdp->db[17] = 0x4;
  3802			break;
  3803		default:
  3804			MISSING_CASE(vsc->bpc);
  3805			break;
  3806		}
  3807		/* Dynamic Range and Component Bit Depth */
  3808		if (vsc->dynamic_range == DP_DYNAMIC_RANGE_CTA)
  3809			sdp->db[17] |= 0x80;  /* DB17[7] */
  3810	
  3811		/* Content Type */
  3812		sdp->db[18] = vsc->content_type & 0x7;
  3813	
  3814	out:
  3815		return length;
  3816	}
  3817	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
