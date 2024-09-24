Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC0298441A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2679F10E6D6;
	Tue, 24 Sep 2024 11:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtNFncII";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8556C10E6D6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 11:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727175738; x=1758711738;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r+j1MXTxZz2fTAivtAhGK1Hjd2mJcNatuBZE7WbDSz4=;
 b=OtNFncIIhB0rh8e6xlWW9o9MGsxocyb6vc+9HC01LxY0V8peEjyIV+CJ
 pXslMzKXPztuGPEZQSioJe/vE+p+sxnxWVUQRG1ympjU5SxKM20zNn1Bm
 rs7VmJFc/smO7guMt9nEI7txkDooz0oArJHCiZim/Cx6aooUdk8Q+w+oZ
 VAXCPlvlQ4WeEyk8slUFjqLLzw14EKTjdVdMkzSK5dmydFerBO6eB4dcb
 J1o4RY6w2vXqwxcuCSYbvB/wgiYeGmhoyWmxAghPJoURq03XgHklqNnnh
 /4hb7TMF//zxsMf6HIWOtgSRnhotRDiNFs+BeVz1bsVPOTqO1vPAJI7kJ A==;
X-CSE-ConnectionGUID: PHbcrIrmQ6aXqHaVob5abw==
X-CSE-MsgGUID: taXf4hYhQ7SjSACHcQSVxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="36748461"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="36748461"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 04:02:18 -0700
X-CSE-ConnectionGUID: WUmtV44ERIC2jdJW6RHO8Q==
X-CSE-MsgGUID: TF58PbtjRFeBD/sXxqz0lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="71823482"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 24 Sep 2024 04:02:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1st3J5-000IFv-12;
 Tue, 24 Sep 2024 11:02:11 +0000
Date: Tue, 24 Sep 2024 19:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, Pin-yen Lin <treapking@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Kenneth Hung <Kenneth.hung@ite.com.tw>,
 Hermes Wu <Hermes.wu@ite.com.tw>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] drm/bridge: it6505: HDCP CTS fail on repeater items
Message-ID: <202409241856.OWgR1x3Y-lkp@intel.com>
References: <20240923094826.13471-3-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923094826.13471-3-Hermes.Wu@ite.com.tw>
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

Hi Hermes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11 next-20240923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hermes-Wu/drm-bridge-it6505-fix-AUX-read-use-aux-fifo/20240923-175041
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240923094826.13471-3-Hermes.Wu%40ite.com.tw
patch subject: [PATCH v3 2/3] drm/bridge: it6505: HDCP CTS fail on repeater items
config: nios2-randconfig-r073-20240924 (https://download.01.org/0day-ci/archive/20240924/202409241856.OWgR1x3Y-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241856.OWgR1x3Y-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/ite-it6505.c:2027 it6505_setup_sha1_input() warn: inconsistent indenting

vim +2027 drivers/gpu/drm/bridge/ite-it6505.c

b5c84a9edcd418 Allen Chen  2022-01-14  1996  
b5c84a9edcd418 Allen Chen  2022-01-14  1997  static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input)
b5c84a9edcd418 Allen Chen  2022-01-14  1998  {
d65feac281ab47 Pin-yen Lin 2023-07-18  1999  	struct device *dev = it6505->dev;
b5c84a9edcd418 Allen Chen  2022-01-14  2000  	u8 binfo[2];
9665163df60e16 Hermes Wu   2024-09-23  2001  	int down_stream_count, err, msg_count = 0;
b5c84a9edcd418 Allen Chen  2022-01-14  2002  
b5c84a9edcd418 Allen Chen  2022-01-14  2003  	err = it6505_get_dpcd(it6505, DP_AUX_HDCP_BINFO, binfo,
b5c84a9edcd418 Allen Chen  2022-01-14  2004  			      ARRAY_SIZE(binfo));
b5c84a9edcd418 Allen Chen  2022-01-14  2005  
b5c84a9edcd418 Allen Chen  2022-01-14  2006  	if (err < 0) {
b5c84a9edcd418 Allen Chen  2022-01-14  2007  		dev_err(dev, "Read binfo value Fail");
b5c84a9edcd418 Allen Chen  2022-01-14  2008  		return err;
b5c84a9edcd418 Allen Chen  2022-01-14  2009  	}
b5c84a9edcd418 Allen Chen  2022-01-14  2010  
b5c84a9edcd418 Allen Chen  2022-01-14  2011  	down_stream_count = binfo[0] & 0x7F;
b5c84a9edcd418 Allen Chen  2022-01-14  2012  	DRM_DEV_DEBUG_DRIVER(dev, "binfo:0x%*ph", (int)ARRAY_SIZE(binfo),
b5c84a9edcd418 Allen Chen  2022-01-14  2013  			     binfo);
b5c84a9edcd418 Allen Chen  2022-01-14  2014  
b5c84a9edcd418 Allen Chen  2022-01-14  2015  	if ((binfo[0] & BIT(7)) || (binfo[1] & BIT(3))) {
b5c84a9edcd418 Allen Chen  2022-01-14  2016  		dev_err(dev, "HDCP max cascade device exceed");
b5c84a9edcd418 Allen Chen  2022-01-14  2017  		return 0;
b5c84a9edcd418 Allen Chen  2022-01-14  2018  	}
b5c84a9edcd418 Allen Chen  2022-01-14  2019  
b5c84a9edcd418 Allen Chen  2022-01-14  2020  	if (!down_stream_count ||
b5c84a9edcd418 Allen Chen  2022-01-14  2021  	    down_stream_count > MAX_HDCP_DOWN_STREAM_COUNT) {
b5c84a9edcd418 Allen Chen  2022-01-14  2022  		dev_err(dev, "HDCP down stream count Error %d",
b5c84a9edcd418 Allen Chen  2022-01-14  2023  			down_stream_count);
b5c84a9edcd418 Allen Chen  2022-01-14  2024  		return 0;
b5c84a9edcd418 Allen Chen  2022-01-14  2025  	}
9665163df60e16 Hermes Wu   2024-09-23  2026  	err =  it6505_get_ksvlist(it6505, sha1_input, down_stream_count * 5);
b5c84a9edcd418 Allen Chen  2022-01-14 @2027  		if (err < 0)
b5c84a9edcd418 Allen Chen  2022-01-14  2028  			return err;
b5c84a9edcd418 Allen Chen  2022-01-14  2029  
9665163df60e16 Hermes Wu   2024-09-23  2030  	msg_count += down_stream_count * 5;
b5c84a9edcd418 Allen Chen  2022-01-14  2031  
b5c84a9edcd418 Allen Chen  2022-01-14  2032  	it6505->hdcp_down_stream_count = down_stream_count;
b5c84a9edcd418 Allen Chen  2022-01-14  2033  	sha1_input[msg_count++] = binfo[0];
b5c84a9edcd418 Allen Chen  2022-01-14  2034  	sha1_input[msg_count++] = binfo[1];
b5c84a9edcd418 Allen Chen  2022-01-14  2035  
b5c84a9edcd418 Allen Chen  2022-01-14  2036  	it6505_set_bits(it6505, REG_HDCP_CTRL2, HDCP_EN_M0_READ,
b5c84a9edcd418 Allen Chen  2022-01-14  2037  			HDCP_EN_M0_READ);
b5c84a9edcd418 Allen Chen  2022-01-14  2038  
b5c84a9edcd418 Allen Chen  2022-01-14  2039  	err = regmap_bulk_read(it6505->regmap, REG_M0_0_7,
b5c84a9edcd418 Allen Chen  2022-01-14  2040  			       sha1_input + msg_count, 8);
b5c84a9edcd418 Allen Chen  2022-01-14  2041  
b5c84a9edcd418 Allen Chen  2022-01-14  2042  	it6505_set_bits(it6505, REG_HDCP_CTRL2, HDCP_EN_M0_READ, 0x00);
b5c84a9edcd418 Allen Chen  2022-01-14  2043  
b5c84a9edcd418 Allen Chen  2022-01-14  2044  	if (err < 0) {
b5c84a9edcd418 Allen Chen  2022-01-14  2045  		dev_err(dev, " Warning, Read M value Fail");
b5c84a9edcd418 Allen Chen  2022-01-14  2046  		return err;
b5c84a9edcd418 Allen Chen  2022-01-14  2047  	}
b5c84a9edcd418 Allen Chen  2022-01-14  2048  
b5c84a9edcd418 Allen Chen  2022-01-14  2049  	msg_count += 8;
b5c84a9edcd418 Allen Chen  2022-01-14  2050  
b5c84a9edcd418 Allen Chen  2022-01-14  2051  	return msg_count;
b5c84a9edcd418 Allen Chen  2022-01-14  2052  }
b5c84a9edcd418 Allen Chen  2022-01-14  2053  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
