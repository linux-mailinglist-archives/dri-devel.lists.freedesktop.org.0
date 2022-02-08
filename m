Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 564324ACCB1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 01:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C457610E519;
	Tue,  8 Feb 2022 00:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67A510E128;
 Tue,  8 Feb 2022 00:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644278884; x=1675814884;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p+eVes9YLI8+w1bIOxr/qbRFT8QHLdWkcU6N3SFx4Ig=;
 b=KFR7n+hvPzAMnyrT5ZZhOVlkiStH6I1TeoxeqlRZFseRQYPS8a5dXE6D
 kFXHACBkM/F+qIHM6zZc0ecCvpy5rK40T2GbouZYeD8PsflCNAotzd9Yo
 aIZarTne1DmlvHtOx6jWorQ/egZuLUob/McTXIEXgluhNxE9gzaTYWDJx
 dRhy+LmdvHCI2lVIZGTZTqROn2M+lCUdC+vsBbKFGHnF3njnQAWtUTaq6
 j2cflr6BPdpZkFq67lPcZ9dgYdI2bahd6V94/d195dbCMPHffHtOHythI
 ocSXXvuo5VEDgnWtmixrYMbzIggt/ukCqdSRXBsvwwGg3YBdXD2XaKaff g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="248599930"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="248599930"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 16:08:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="632653447"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 07 Feb 2022 16:08:02 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nHE38-00017v-6k; Tue, 08 Feb 2022 00:08:02 +0000
Date: Tue, 8 Feb 2022 08:07:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/uapi: Add struct
 drm_i915_query_hwconfig_blob_item
Message-ID: <202202080828.bS4NTyCU-lkp@intel.com>
References: <20220207192854.862959-4-jordan.l.justen@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207192854.862959-4-jordan.l.justen@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kbuild-all@lists.01.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jordan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next v5.17-rc3 next-20220207]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jordan-Justen/GuC-HWCONFIG-with-documentation/20220208-032950
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-a013-20220207 (https://download.01.org/0day-ci/archive/20220208/202202080828.bS4NTyCU-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/7e0cfba7f05cefa8d48ec73782b66b4255a6b4ff
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jordan-Justen/GuC-HWCONFIG-with-documentation/20220208-032950
        git checkout 7e0cfba7f05cefa8d48ec73782b66b4255a6b4ff
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <command-line>:32:
>> ./usr/include/drm/i915_drm.h:3298:2: error: unknown type name 'u32'
    3298 |  u32 key;
         |  ^~~
   ./usr/include/drm/i915_drm.h:3299:2: error: unknown type name 'u32'
    3299 |  u32 length;
         |  ^~~
   ./usr/include/drm/i915_drm.h:3300:2: error: unknown type name 'u32'
    3300 |  u32 data[];
         |  ^~~

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
