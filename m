Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439D0955BF5
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 10:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB6810E04C;
	Sun, 18 Aug 2024 08:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ft3ik8jk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948C310E04C
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 08:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723970047; x=1755506047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=25yu9p37vsAbdqZRphRP+Y2t3rTyzWYj9NBH5ai5GQU=;
 b=ft3ik8jkvIN0aUAxMrEW6DNQQokWlEDN5cELgp+fJjt+A3NgIbLMB0nS
 D0vf3OJztUj4UYzk6E68vHzRIkSLOtU8fWWxS7ZDEoy76Byvw+niiGQS1
 vBRQ7DkLSD7VA/zSyA7eHsDJipeStlx3gtM0NNiywQDYXiVaZF3WC6Cxk
 TGIPJLG2wbtulWUjg4rt6W4a144LBwefWb8T/Qef8fxxT6PQLipA5uyHB
 xAO8eWOoQZDzvW8Bz9J8/cJHhdtDRhgASjkbOAe/fJBoDmmmYMJ+R1j38
 SZsGpmbyylWB29KflKOe2v3VywymkGnJYcri2ExuHqWNa3Em+oIPOVmZn A==;
X-CSE-ConnectionGUID: ERqqp/IQQr+8y9sU0k8/PQ==
X-CSE-MsgGUID: XgupEE8ISDaqkNObfEz6zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="22038453"
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; d="scan'208";a="22038453"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2024 01:34:07 -0700
X-CSE-ConnectionGUID: iJOolUfjRQ+dRXYPgLXGiw==
X-CSE-MsgGUID: R4V0vhG9TGWmbRjYobBZjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; d="scan'208";a="59790703"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2024 01:34:04 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sfbMQ-00087u-0V;
 Sun, 18 Aug 2024 08:34:02 +0000
Date: Sun, 18 Aug 2024 16:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2 3/5] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
Message-ID: <202408181614.AAr0qM24-lkp@intel.com>
References: <20240816125612.1003295-4-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816125612.1003295-4-jfalempe@redhat.com>
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

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8befe8fa5a4e4b30787b17e078d9d7b5cb92ea19]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-panic-Squash-of-pending-series/20240816-205859
base:   8befe8fa5a4e4b30787b17e078d9d7b5cb92ea19
patch link:    https://lore.kernel.org/r/20240816125612.1003295-4-jfalempe%40redhat.com
patch subject: [PATCH v2 3/5] drm/log: Introduce a new boot logger to draw the kmsg on the screen
config: arm-randconfig-r121-20240818 (https://download.01.org/0day-ci/archive/20240818/202408181614.AAr0qM24-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240818/202408181614.AAr0qM24-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408181614.AAr0qM24-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_log.c:66:17: sparse: sparse: symbol 'drm_log_buf' was not declared. Should it be static?
>> drivers/gpu/drm/drm_log.c:384:1: sparse: sparse: symbol 'drm_log_work' was not declared. Should it be static?
   drivers/gpu/drm/drm_log.c: note: in included file (through include/linux/rculist.h, include/linux/console.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/drm_log_buf +66 drivers/gpu/drm/drm_log.c

    59	
    60	/*
    61	 * A circular buffer, with the last kmsg logs to print.
    62	 * 8K is more than what can be drawn on most monitors.
    63	 */
    64	#define CIRC_BUF_SIZE	(1 << 13)
    65	#define CIRC_BUF_MASK	(CIRC_BUF_SIZE - 1)
  > 66	struct circ_buf drm_log_buf;
    67	static DEFINE_SPINLOCK(drm_log_writer_lock);
    68	static DEFINE_SPINLOCK(drm_log_reader_lock);
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
