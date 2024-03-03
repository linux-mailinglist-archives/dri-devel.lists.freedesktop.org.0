Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D12786F658
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 18:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2125010E954;
	Sun,  3 Mar 2024 17:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cja6FnO7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FC910E954
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Mar 2024 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709486162; x=1741022162;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qRStcwLXl2/7vDMZpOL69TpjetNulwoJj2qetC831JA=;
 b=Cja6FnO7Fwu5+wxSvXgSGdryMWJwyOcUda2XOkN8cQsP3K7X/Dy3+T/R
 Q/TuVebpBk5iG8ZT9AwBqJKwRFn2lDXy3favt0wQsASKCTfWRB9MWrTeB
 A5fQTYZBM6l6Zd7Kx6hPgat8bAfEDMTTc82YV+lxbrniiTVCJIRMajYvO
 CnEqu1YOkfqxfKGqkTBrdWjjVoJxA05lRK98hj4NFUgMOL21QJj1D6m3u
 fABf5odxvyP9ktj7+7U0hB5qcdW+4K7n1Y/YHGGO7xBhTYIEC48fWSlRH
 k48RlcrVXloZ88bPrRIj9srFcyQZyvCbg8X8C1dUiUChzopz44TR0XJbo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7790977"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="7790977"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2024 09:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="9196876"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 03 Mar 2024 09:15:56 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rgpRJ-0001yO-2z;
 Sun, 03 Mar 2024 17:15:53 +0000
Date: Mon, 4 Mar 2024 01:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <monstr@monstr.eu>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Subject: Re: [PATCH 3/4] drm: xlnx: zynqmp_dpsub: Set input live format
Message-ID: <202403040104.mwzqu5gs-lkp@intel.com>
References: <20240226-dp-live-fmt-v1-3-b78c3f69c9d8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226-dp-live-fmt-v1-3-b78c3f69c9d8@amd.com>
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

Hi Anatoliy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bfa4437fd3938ae2e186e7664b2db65bb8775670]

url:    https://github.com/intel-lab-lkp/linux/commits/Anatoliy-Klymenko/drm-xlnx-zynqmp_dpsub-Set-layer-mode-during-creation/20240227-124631
base:   bfa4437fd3938ae2e186e7664b2db65bb8775670
patch link:    https://lore.kernel.org/r/20240226-dp-live-fmt-v1-3-b78c3f69c9d8%40amd.com
patch subject: [PATCH 3/4] drm: xlnx: zynqmp_dpsub: Set input live format
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240304/202403040104.mwzqu5gs-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040104.mwzqu5gs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040104.mwzqu5gs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/zynqmp_disp.c:164: warning: Function parameter or struct member 'blend' not described in 'zynqmp_disp'
   drivers/gpu/drm/xlnx/zynqmp_disp.c:164: warning: Function parameter or struct member 'avbuf' not described in 'zynqmp_disp'
   drivers/gpu/drm/xlnx/zynqmp_disp.c:164: warning: Function parameter or struct member 'audio' not described in 'zynqmp_disp'
>> drivers/gpu/drm/xlnx/zynqmp_disp.c:1019: warning: Function parameter or struct member 'bus_format' not described in 'zynqmp_disp_layer_set_live_format'
>> drivers/gpu/drm/xlnx/zynqmp_disp.c:1019: warning: Excess function parameter 'info' description in 'zynqmp_disp_layer_set_live_format'


vim +1019 drivers/gpu/drm/xlnx/zynqmp_disp.c

  1009	
  1010	/**
  1011	 * zynqmp_disp_layer_set_live_format - Set live layer input format
  1012	 * @layer: The layer
  1013	 * @info: Input media bus format
  1014	 *
  1015	 * Set the live @layer input bus format. The layer must be disabled.
  1016	 */
  1017	void zynqmp_disp_layer_set_live_format(struct zynqmp_disp_layer *layer,
  1018					       u32 bus_format)
> 1019	{
  1020		int i;
  1021		const struct zynqmp_disp_format *fmt;
  1022	
  1023		for (i = 0; i < ARRAY_SIZE(avbuf_live_fmts); ++i) {
  1024			fmt = &avbuf_live_fmts[i];
  1025			if (fmt->bus_fmt == bus_format) {
  1026				layer->disp_fmt = fmt;
  1027				layer->drm_fmt = drm_format_info(fmt->drm_fmt);
  1028				zynqmp_disp_avbuf_set_live_format(layer->disp, layer, fmt);
  1029				return;
  1030			}
  1031		}
  1032	}
  1033	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
