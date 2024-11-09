Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C919C2F80
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 21:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F7510E06C;
	Sat,  9 Nov 2024 20:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9oYKpxD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8044E10E3A8
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 20:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731184264; x=1762720264;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lwc+6sp3mcJ5Ad0yQLyDMLqBIcNpYLMMzahip6ZIWmI=;
 b=m9oYKpxDl36q0mQ2H5UPuGv9IX/5g5hizmK7EulooXW1oMFEqO5Ymc4b
 t7FSXPY/NCMtNVvlx3jYDMhaLepsVifPbYnFgGRDQKnqy2i4jr/kC6baE
 FIxgajU+Gui6T/dVadPEu8v6RRQA5ExvJ/F/r9e0Jl2rCovTDmWdCm/fi
 uZVPe22RrinOjWpNBeZq6C09iQx3N+A9Sj32HDJkJqeCqkrCxo00HR6Pc
 M92ibTbKNTvFKJJotMKiQDFnP+q2f+81qaEwJbknf9wRHu4KFBzvIXdiC
 Mc++WGLfKzma04lWMqs0F5BCJ2s+n0uQ2umx4hTgW/Mky3VhixnhCHXY7 Q==;
X-CSE-ConnectionGUID: vDkl8jGGRPSNochWq6yFTQ==
X-CSE-MsgGUID: S6LuHuqiR8qgQE+LIP8lBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="31146949"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; d="scan'208";a="31146949"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 12:31:03 -0800
X-CSE-ConnectionGUID: SqYXoFcpRpS+1UQ6kzFulw==
X-CSE-MsgGUID: gbPkTUaOTr+b6WNW2HVVlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="91027501"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 09 Nov 2024 12:30:58 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t9s6i-000sby-0c;
 Sat, 09 Nov 2024 20:30:56 +0000
Date: Sun, 10 Nov 2024 04:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 3/7] drm/vc4: use drm_hdmi_connector_mode_valid()
Message-ID: <202411100456.0JcsAx2b-lkp@intel.com>
References: <20241109-hdmi-mode-valid-v3-3-5348c2368076@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109-hdmi-mode-valid-v3-3-5348c2368076@linaro.org>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 929beafbe7acce3267c06115e13e03ff6e50548a]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-hdmi-add-generic-mode_valid-helper/20241109-203557
base:   929beafbe7acce3267c06115e13e03ff6e50548a
patch link:    https://lore.kernel.org/r/20241109-hdmi-mode-valid-v3-3-5348c2368076%40linaro.org
patch subject: [PATCH v3 3/7] drm/vc4: use drm_hdmi_connector_mode_valid()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241110/202411100456.0JcsAx2b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100456.0JcsAx2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100456.0JcsAx2b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vc4/vc4_hdmi.c: In function 'vc4_hdmi_encoder_mode_valid':
>> drivers/gpu/drm/vc4/vc4_hdmi.c:1762:68: warning: passing argument 2 of 'drm_hdmi_connector_mode_valid' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1762 |         return drm_hdmi_connector_mode_valid(&vc4_hdmi->connector, mode);
         |                                                                    ^~~~
   In file included from drivers/gpu/drm/vc4/vc4_hdmi.c:35:
   include/drm/display/drm_hdmi_state_helper.h:25:56: note: expected 'struct drm_display_mode *' but argument is of type 'const struct drm_display_mode *'
      25 |                               struct drm_display_mode *mode);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~


vim +1762 drivers/gpu/drm/vc4/vc4_hdmi.c

  1749	
  1750	static enum drm_mode_status
  1751	vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
  1752				    const struct drm_display_mode *mode)
  1753	{
  1754		struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
  1755	
  1756		if (vc4_hdmi->variant->unsupported_odd_h_timings &&
  1757		    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
  1758		    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
  1759		     (mode->hsync_end % 2) || (mode->htotal % 2)))
  1760			return MODE_H_ILLEGAL;
  1761	
> 1762		return drm_hdmi_connector_mode_valid(&vc4_hdmi->connector, mode);
  1763	}
  1764	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
