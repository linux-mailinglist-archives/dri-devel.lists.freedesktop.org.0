Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DD49969CE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 14:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398E510E2A5;
	Wed,  9 Oct 2024 12:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXwrgTUs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED8C10E2A5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728476335; x=1760012335;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c2gFY4gtveL1XpFdSfORF1+tbN/JPlxEpuexOeTX9cU=;
 b=kXwrgTUsWW4L7cihZJQ5WqkqBKHCLxR/mz4tZY48fHdqh7Xz93iGq6dt
 bUZWLrc9wCJYxgF3uRnlzQWyaiuw4ZpdVtJ0r4YFMqI018ZP3okOhRlTK
 Cbs4acj44/Un7fp6y7o6MdbSi2fw45y2Ni3VLyXpuosLPouAxuF0ECdmO
 lbey4tc4NvyzHxUFTjniEEMFBw4AhPGz2KiL572fA5TiQC8xTZvpx0l49
 5UuLms2tj9FzlmFdorl5a/BfA+i4NHke6hRnm9RCugRkKYrlKfBkJFT1h
 jEmPd9t+jljetVUbIKbQn6JjkpO/swgqm5B3+y4Y/KryX24FfUDZko+kI A==;
X-CSE-ConnectionGUID: ETQhPneVSUerMeNfPvjyLg==
X-CSE-MsgGUID: xI3DHP4uQF+IHe0n9T+/8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31563776"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="31563776"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 05:18:54 -0700
X-CSE-ConnectionGUID: PbgVQfRNSVOsRuFInDbpIw==
X-CSE-MsgGUID: qvIVTNMJRfizD8QMeqt59w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76188060"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 09 Oct 2024 05:18:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1syVeS-0009C0-30;
 Wed, 09 Oct 2024 12:18:48 +0000
Date: Wed, 9 Oct 2024 20:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dzmitry Sankouski <dsankouski@gmail.com>
Subject: Re: [PATCH v6 1/3] drm/mipi-dsi: add mipi_dsi_compression_mode_multi
Message-ID: <202410092245.tfsuUllL-lkp@intel.com>
References: <20241006-starqltechn_integration_upstream-v6-1-8336b9cd6c34@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241006-starqltechn_integration_upstream-v6-1-8336b9cd6c34@gmail.com>
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

Hi Dzmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 58ca61c1a866bfdaa5e19fb19a2416764f847d75]

url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/drm-mipi-dsi-add-mipi_dsi_compression_mode_multi/20241007-022151
base:   58ca61c1a866bfdaa5e19fb19a2416764f847d75
patch link:    https://lore.kernel.org/r/20241006-starqltechn_integration_upstream-v6-1-8336b9cd6c34%40gmail.com
patch subject: [PATCH v6 1/3] drm/mipi-dsi: add mipi_dsi_compression_mode_multi
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241009/202410092245.tfsuUllL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410092245.tfsuUllL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410092245.tfsuUllL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_mipi_dsi.c:1533: warning: Function parameter or struct member 'ctx' not described in 'mipi_dsi_compression_mode_multi'
>> drivers/gpu/drm/drm_mipi_dsi.c:1533: warning: Excess function parameter 'dsi' description in 'mipi_dsi_compression_mode_multi'


vim +1533 drivers/gpu/drm/drm_mipi_dsi.c

  1522	
  1523	/**
  1524	 * mipi_dsi_compression_mode_multi() - enable/disable DSC on the peripheral
  1525	 * @dsi: DSI peripheral device
  1526	 * @enable: Whether to enable or disable the DSC
  1527	 *
  1528	 * Enable or disable Display Stream Compression on the peripheral using the
  1529	 * default Picture Parameter Set and VESA DSC 1.1 algorithm.
  1530	 */
  1531	void mipi_dsi_compression_mode_multi(struct mipi_dsi_multi_context *ctx,
  1532					     bool enable)
> 1533	{
  1534		return mipi_dsi_compression_mode_ext_multi(ctx, enable,
  1535							   MIPI_DSI_COMPRESSION_DSC, 0);
  1536	}
  1537	EXPORT_SYMBOL(mipi_dsi_compression_mode_multi);
  1538	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
