Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95370812EA0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 12:34:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9D310E0CC;
	Thu, 14 Dec 2023 11:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8950D10E0CC;
 Thu, 14 Dec 2023 11:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702553683; x=1734089683;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9ud8cXZSP1WLnG538Q6VnkL1U861REyJ5R5GyjeJAGQ=;
 b=YE1FS54lwfpQgEezZQzm0Yg7Pjt84P+FtSP7gjUU12nXq+fGPUO8Ez/L
 5/ICUPdXWpHmvSpzYn0tCdOpUszyLiiO0zrufaQFliAcl5UPlDNnE98I/
 4z/OvlHSXVmwpGQmzUFSauUtOaRz3/n802JDNPHKv95CQCUjpbQf1cl8I
 RxjJBlFrs55kMTKaOK4LHfk3KM7ekyMewJe5gNTDm5dFBQTwiKV/EVuaH
 3s3qoFiZ7OHV0MzOGVZrmimsyL6CL17hR+Zs3zJP25fHIfO3ZS4d3ZtZ/
 t9NwYWyac3Kr6/+NVIc2L+cmWCqLLRIvoUwaDTS3yfKFVypFtJ7rDJbTp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="16657377"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="16657377"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:34:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844675316"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="844675316"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 14 Dec 2023 03:34:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rDjzA-000LzZ-2L;
 Thu, 14 Dec 2023 11:34:36 +0000
Date: Thu, 14 Dec 2023 19:34:31 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: Re: [PATCH] MAINTAINERS: Updates to Intel DRM
Message-ID: <202312141902.3smgOmnr-lkp@intel.com>
References: <20231213160915.1414733-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213160915.1414733-1-rodrigo.vivi@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip linus/master v6.7-rc5 next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rodrigo-Vivi/MAINTAINERS-Updates-to-Intel-DRM/20231214-001056
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231213160915.1414733-1-rodrigo.vivi%40intel.com
patch subject: [PATCH] MAINTAINERS: Updates to Intel DRM
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312141902.3smgOmnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141902.3smgOmnr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/gpu/xe/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
