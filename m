Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA74BA5E1B2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 17:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76C510E133;
	Wed, 12 Mar 2025 16:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQhRf+/v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05BA10E133
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 16:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741796593; x=1773332593;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=39N4YWbrlRjKgyGmIu2v/Ox99/YqQuXlc6DAmIUPcaE=;
 b=lQhRf+/vxm+rAlMhDggmPuToZMP/ykgdnVhr6pe8H+lE6eURqKF9w36e
 sFm5Fea89rnA32JdKEbjboYcJHv3YTcGzpRnZLdg4aWJhyGdqgrkIoOsb
 N3G1uLJeoXtLe3zATZUAuXlNuxDfar9mze3hYQsubf+z4BdCPft/Dkd0H
 pEkoJGrcEKb9MZa+dHzFjyllMZSUdasrPwClQru7W80vNvfc/7bDi9tVO
 mnchdtJr8VqnlvXrQwqYal9vY/fGA16RdZmlSJxEyYAyCIITT9oHDcjFr
 5bYj5Nqaup6j2eVTZnlsem2ehCprAcgStpkvsQWk8iJrB9BE9LLgRAi2j g==;
X-CSE-ConnectionGUID: 8PPtLU9HTKW1ltOmIVA15w==
X-CSE-MsgGUID: YG5Tos1PSQWoo8mSWqYDNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="68244391"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="68244391"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 09:22:51 -0700
X-CSE-ConnectionGUID: A0Zfqf7hT6mmPygu7D05/Q==
X-CSE-MsgGUID: 5MIj5pGkQ3y3hsnBvJ1rEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120376505"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 12 Mar 2025 09:22:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tsOpQ-0008hw-1n;
 Wed, 12 Mar 2025 16:22:03 +0000
Date: Thu, 13 Mar 2025 00:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: oushixiong1025@163.com, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Zsolt Kajtar <soci@c64.rulez.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH 1/2] fbcon: Register sysfs groups through device_add_group
Message-ID: <202503122323.h75SQfrd-lkp@intel.com>
References: <20250311112856.1020095-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311112856.1020095-1-oushixiong1025@163.com>
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.14-rc6 next-20250312]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/oushixiong1025-163-com/fbcon-Change-return-value-type-to-void/20250311-193230
base:   linus/master
patch link:    https://lore.kernel.org/r/20250311112856.1020095-1-oushixiong1025%40163.com
patch subject: [PATCH 1/2] fbcon: Register sysfs groups through device_add_group
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250312/202503122323.h75SQfrd-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503122323.h75SQfrd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503122323.h75SQfrd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/core/fbcon.c:3390:23: error: use of undeclared identifier 'fb_info'
    3390 |                 device_remove_group(fb_info->dev, &fbcon_device_attr_group);
         |                                     ^
   1 error generated.


vim +/fb_info +3390 drivers/video/fbdev/core/fbcon.c

  3388	
  3389		if (fbcon_has_sysfs) {
> 3390			device_remove_group(fb_info->dev, &fbcon_device_attr_group);
  3391	
  3392			fbcon_has_sysfs = 0;
  3393		}
  3394	}
  3395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
