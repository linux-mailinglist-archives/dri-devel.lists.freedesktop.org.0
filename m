Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8684F73CFF9
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 12:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E947210E159;
	Sun, 25 Jun 2023 10:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFC310E159;
 Sun, 25 Jun 2023 10:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687687244; x=1719223244;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3SWr32SgqAC6BAivfFTdN/GsjHOvUKGZ76gBYfe8bmo=;
 b=G8PgJYxV7t8ED+kWLmgp3W6qu6aFiMRifLnJZZHqN0iJD4dVbw89gmNy
 gPgmEg5/KOysMgSXEeVuFhriMh6ex96vswrlkSYrwR5eUVyV15WJraTek
 lCxKbeKLMbpQlacKwvdtzTJ+RGwGwbxA2fJ9i1WE9DZuOhHD4rU+4rFf0
 xEfIMwhLpeOyXGHvBwPZyhDU9+M+kuwzVgUfhNBZjgCFK1SJNbgDAOcjK
 SVumdNsMVmM6bZI8vUyShRwlW8rlTVz70MbPhu9PqlQUbYZeon9EwppXq
 fgpf6q2eemMvHehyzJHvNgpujtjxdLb4ynnzu22i46CxOjQ1h4WOQ2WaS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="364495577"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="364495577"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2023 03:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="889962156"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="889962156"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 25 Jun 2023 03:00:38 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qDMXt-0009wb-15;
 Sun, 25 Jun 2023 10:00:37 +0000
Date: Sun, 25 Jun 2023 18:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] Documentation/gpu: Add a VM_BIND async draft document
Message-ID: <202306251715.VhtKaEVg-lkp@intel.com>
References: <20230621100435.54425-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621100435.54425-1-thomas.hellstrom@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org, Oak Zeng <oak.zeng@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-tip/drm-tip next-20230623]
[cannot apply to linus/master v6.4-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/Documentation-gpu-Add-a-VM_BIND-async-draft-document/20230621-180712
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230621100435.54425-1-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v2] Documentation/gpu: Add a VM_BIND async draft document
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251715.VhtKaEVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251715.VhtKaEVg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/drm-vm-bind-async.rst:95: WARNING: Title underline too short.
>> Documentation/gpu/drm-vm-bind-async.rst: WARNING: document isn't included in any toctree

vim +95 Documentation/gpu/drm-vm-bind-async.rst

    93	
    94	Multi-operation VM_BIND IOCTL error handling and interrupts
  > 95	========================================
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
