Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9715B7654
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 18:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6910A10E72D;
	Tue, 13 Sep 2022 16:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE6F10E787
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 16:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663086107; x=1694622107;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/CF+x/gE6AFL0vKB6b07IftvPWB503rn7YywIyS0C+U=;
 b=cXqcDWwUYHsWtJdHWoDUopP0HuQtEsQZaWeBXiKaFbJlp+f0puKC9MoT
 YgEtfnzsDVYVOxNE9TIIA9frgcKrbAoOyTyxovCkCs9PdtKHGc3JNTPMz
 kswmsF39ke1JWI4dycxzlbwCoXbUSzj7xoTc2nX59WPdmNz9n8CXPTlHN
 brZKOg4WIFSmkKZmqhF6g+IJmhEA/OxaGOkcRqjvTG+ry9v+p7AYvbOB+
 gRE7aYzcfXjsTjdg3ViQU/ZehxBhRWGcoycPTNSuveOAjKc/OLxJZKrPY
 QKhg5Jer/08z3jv730qbOuthYqNrf5/JEKlvTu/3PqMmcHkOCHAiK9ZSY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="296917832"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="296917832"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 09:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="616515078"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 13 Sep 2022 09:21:40 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oY8fL-0003jp-2K;
 Tue, 13 Sep 2022 16:21:39 +0000
Date: Wed, 14 Sep 2022 00:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH v2 4/7] drm/ivpu: Add IPC driver and JSM messages
Message-ID: <202209140053.mvWJxESt-lkp@intel.com>
References: <20220913121017.993825-5-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913121017.993825-5-jacek.lawrynowicz@linux.intel.com>
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
Cc: andrzej.kacprowski@linux.intel.com, kbuild-all@lists.01.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jacek,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-intel/for-linux-next drm-tip/drm-tip linus/master v6.0-rc5 next-20220913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacek-Lawrynowicz/New-DRM-driver-for-Intel-VPU/20220913-201321
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220914/202209140053.mvWJxESt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/c21bf99dba1461054354b40a02d396930323064a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jacek-Lawrynowicz/New-DRM-driver-for-Intel-VPU/20220913-201321
        git checkout c21bf99dba1461054354b40a02d396930323064a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/ivpu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ivpu/ivpu_ipc.c:24:1: warning: alignment 1 of 'struct ivpu_ipc_tx_buf' is less than 64 [-Wpacked-not-aligned]
      24 | } __packed;
         | ^


vim +24 drivers/gpu/drm/ivpu/ivpu_ipc.c

    20	
    21	struct ivpu_ipc_tx_buf {
    22		struct ivpu_ipc_hdr ipc;
    23		struct vpu_jsm_msg jsm;
  > 24	} __packed;
    25	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
