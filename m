Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827387AE0E8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 23:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6673210E32D;
	Mon, 25 Sep 2023 21:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B17710E32C;
 Mon, 25 Sep 2023 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695678178; x=1727214178;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=snNq+RshksgPyasRZ5b0PQsm78eS6KzqCuWRL3ih9JA=;
 b=iVEEgzT5i0uUD4AVyjJh8sYWZaqYFlevFJa/CsJA3okXVJsHNjyNYypw
 T7/LqLL2cOOq/1EZDserSOf0wevOHrjQ8sYkUb79i32t7kRWD5l0V83wz
 TreZbjieN+ULHgZFmlRah6o8BgY7EVRPVxBHj0sDMtbbnDzaphQn7paOZ
 yvg1jkUCaHIocHVIDV5YYnqfyR6YxI/aLZQLus8ncA6hvoo8S+w86O+zs
 Uc/eEREa0PpH6J4dSCrftzUB/zy9f9IkcXb9uyv6h/jpe78AD1Z5iVSOQ
 gg6veQiUgr1i4IniVobuKdXMK3ghhnYqFRHsRmI5wAbaVoVwGVdPnry5E Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380273461"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="380273461"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 14:42:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838725559"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="838725559"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Sep 2023 14:42:53 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qktLv-00022n-1Q;
 Mon, 25 Sep 2023 21:42:51 +0000
Date: Tue, 26 Sep 2023 05:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: Re: [PATCH 08/15] platform/x86/amd/pmf: Add support to update system
 state
Message-ID: <202309260515.5XbR6N0g-lkp@intel.com>
References: <20230922175056.244940-9-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922175056.244940-9-Shyam-sundar.S-k@amd.com>
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, linux-input@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Patil.Reddy@amd.com,
 oe-kbuild-all@lists.linux.dev, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Shyam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.6-rc3 next-20230925]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/platform-x86-amd-pmf-Add-PMF-TEE-interface/20230923-015418
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20230922175056.244940-9-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH 08/15] platform/x86/amd/pmf: Add support to update system state
reproduce: (https://download.01.org/0day-ci/archive/20230926/202309260515.5XbR6N0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260515.5XbR6N0g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/pmf.rst:16: WARNING: Unexpected indentation.
>> Documentation/admin-guide/pmf.rst: WARNING: document isn't included in any toctree

vim +16 Documentation/admin-guide/pmf.rst

    13	
    14	Please add the following line(s) to
    15	``/etc/udev/rules.d/99-local.rules``::
  > 16	        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="1", RUN+="/usr/bin/systemctl suspend"
    17	        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="2", RUN+="/usr/bin/systemctl hibernate"
    18	        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="3", RUN+="/bin/loginctl lock-sessions"
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
