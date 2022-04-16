Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD6F50372D
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 16:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAAF10E5E9;
	Sat, 16 Apr 2022 14:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EFC10E5D3;
 Sat, 16 Apr 2022 14:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650120610; x=1681656610;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=RZxmljWMFs4/ZP4sHFO0QHsWgAqGC4PLfHdiMKjNDGM=;
 b=j94/isT4ZNy4t1CQCztF90J3G4Pqh6rQVvcY8H1bQHfCuRkHFsR7IzhT
 8sAos+3ADjt8KkqbbE7itJEvSVevvhiwqovgGtRgapU6jtSHuCb+f88Ob
 5ycvmTJMUuaifsbNn/qBzo2rw21J8gCgBkJSuSj9ef/ul9pCpLVS1ArkM
 hBOKeHed1fT491cFh5sXdz8my5IGcupGVyf3NSCx5k2yXnLxsEI4voR9g
 VOw748yc1J/G85Hg1/IQ1RlvR9mIAsVLwWrJ7xWSpzVHUTO3lXR5JmUdr
 28z0n97aVxMeFWjcu/YcKaMpBuCOmIz4RHHpqSGqdWAkBtbIEy2kIVra6 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="250596127"
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="250596127"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2022 07:50:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="528100647"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 16 Apr 2022 07:50:07 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nfjkV-0003EH-7u;
 Sat, 16 Apr 2022 14:50:07 +0000
Date: Sat, 16 Apr 2022 22:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: [drm-intel:for-linux-next-gt 9/9]
 drivers/gpu/drm/i915/gt/intel_migrate.c:643:2-3: Unneeded semicolon
Message-ID: <202204162238.wHNWRiAG-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel for-linux-next-gt
head:   bcfc713f11f957711f9494f69c740b95ed335d57
commit: da0595ae91da837929a00470ab40546090e5b9ae [9/9] drm/i915/migrate: Evict and restore the flatccs capable lmem obj
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/20220416/202204162238.wHNWRiAG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gt/intel_migrate.c:643:2-3: Unneeded semicolon

Please review and possibly fold the followup patch.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
