Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA51991BAD
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 03:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B622B10E002;
	Sun,  6 Oct 2024 01:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsMSY5ek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438DE10E002
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 01:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728176497; x=1759712497;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YIWI7OzQBWjQRQD3dHv9yU7vVXX/6sPNdKhYQzsmi7s=;
 b=jsMSY5ek83voJiVLhuWAIsMRf950sLgQ9J4yB3UhlCqZbK+H+S0PoaBw
 eNyRVnnQZSlNhbz+U4/Lo8BYHd3HXYoBOLtQlmWM9eZNJ2WDq2jUDZY95
 sMVwXUVGcNLEESQ6wtQQtW8YDTxIA85srxmWbKYkhWFFQHiz2pqvswMRE
 mmcbSzS01KNjdob1HXOLq2zzGqIWfytDLzJauOWI0QJsjcybE00pq7cxX
 Y8Ln+LfrA03BPkTFOnrkOAYmH0rqAld/OwbOau5d/GIwy1jAMhrfXic/R
 +8bCtV9yigYdaNY2i7QBjZuc38pWb0WxjGP243qqqj0Jo0SiU1A9CrCSY Q==;
X-CSE-ConnectionGUID: TcxSQC5tQJuK9K6wgqAsng==
X-CSE-MsgGUID: Xt9eKDcsTNGfjWq9kIzOWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="52759064"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; d="scan'208";a="52759064"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2024 18:01:36 -0700
X-CSE-ConnectionGUID: rm2xF1dkRRm8x8ZgM0GGpg==
X-CSE-MsgGUID: /8nkO2UwQra292lnawWP8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; d="scan'208";a="75420417"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 05 Oct 2024 18:01:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sxFeO-0003Uw-0U;
 Sun, 06 Oct 2024 01:01:32 +0000
Date: Sun, 6 Oct 2024 09:01:14 +0800
From: kernel test robot <lkp@intel.com>
To: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu/drm: set gamma_lut or degamma_lut based on HW in
 setcmap_atomic
Message-ID: <202410060802.Ln9ygpuY-lkp@intel.com>
References: <20241003120655.53663-1-vamsikrishna.brahmajosyula@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003120655.53663-1-vamsikrishna.brahmajosyula@gmail.com>
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

Hi Vamsi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7ec462100ef9142344ddbf86f2c3008b97acddbe]

url:    https://github.com/intel-lab-lkp/linux/commits/Vamsi-Krishna-Brahmajosyula/gpu-drm-set-gamma_lut-or-degamma_lut-based-on-HW-in-setcmap_atomic/20241003-200835
base:   7ec462100ef9142344ddbf86f2c3008b97acddbe
patch link:    https://lore.kernel.org/r/20241003120655.53663-1-vamsikrishna.brahmajosyula%40gmail.com
patch subject: [PATCH] gpu/drm: set gamma_lut or degamma_lut based on HW in setcmap_atomic
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241006/202410060802.Ln9ygpuY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060802.Ln9ygpuY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060802.Ln9ygpuY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_mode_obj_find_prop_id" [drivers/gpu/drm/drm_kms_helper.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
