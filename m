Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B470173B726
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 14:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8989610E061;
	Fri, 23 Jun 2023 12:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD5210E042;
 Fri, 23 Jun 2023 12:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687523174; x=1719059174;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/qOPpBugdCOBHaAoZD2TLsZ6H3fDUFJzQfbpdJY0hHo=;
 b=YwpQpJwA34gAkLMGseT0giRoMG/kAr/RjpghJwrBGaLm5FBEvc37kIqk
 x3hurQ3OQc0EYwcBp+48rrPfaVi1SNgeOvZSMXYkc1anvwTk1b6SFxHkh
 5c3dnSYKCe5W8UIOiMQh8JabCobhInj4WpS8dRzc8Mbmy/8buAWmOSV5V
 J6L0W4nuvXZLVZSTOYgrngrElIvzOV6YEcwavwf5gh/J472KqzQTk3AYI
 LNu7HoFRYsuSgB3ZypZuOZEylG0uVqUeo1ZyzIOOolB+k18Bioamz7uNa
 qYn9FdLIYgBP55H9cmTLEMY2LgBSlDAJLnukDtVXXlDmrzZLq/A3AxSQY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="341094416"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; d="scan'208";a="341094416"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 05:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="839429440"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; d="scan'208";a="839429440"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 23 Jun 2023 05:26:08 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qCfrb-0008GV-13;
 Fri, 23 Jun 2023 12:26:07 +0000
Date: Fri, 23 Jun 2023 20:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: Su Hui <suhui@nfschina.com>, alexander.deucher@amd.com,
 airlied@gmail.com, Xinhui.Pan@amd.com, daniel@ffwll.ch
Subject: Re: [PATCH] drm/amd/amdgpu: Properly tune the size of struct
Message-ID: <202306232056.UoCMpRUZ-lkp@intel.com>
References: <20230620045919.492128-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620045919.492128-1-suhui@nfschina.com>
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
Cc: Su Hui <suhui@nfschina.com>, Jane.Jian@amd.com, Bokun.Zhang@amd.com,
 David.Francis@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 monk.liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Su,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.4-rc7 next-20230623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Su-Hui/drm-amd-amdgpu-Properly-tune-the-size-of-struct/20230620-130013
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230620045919.492128-1-suhui%40nfschina.com
patch subject: [PATCH] drm/amd/amdgpu: Properly tune the size of struct
config: riscv-randconfig-s032-20230622 (https://download.01.org/0day-ci/archive/20230623/202306232056.UoCMpRUZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306232056.UoCMpRUZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306232056.UoCMpRUZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:914:43: sparse:     expected unsigned int [addressable] [assigned] [usertype] ulSymClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:914:43: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:991:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] usRefDiv @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:991:40: sparse:     expected unsigned short [addressable] [assigned] [usertype] usRefDiv
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:991:40: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:993:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] usFbDiv @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:993:39: sparse:     expected unsigned short [addressable] [assigned] [usertype] usFbDiv
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:993:39: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1001:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] usPixelClock @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1001:44: sparse:     expected unsigned short [addressable] [assigned] [usertype] usPixelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1001:44: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1064:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] usFbDiv @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1064:40: sparse:     expected unsigned short [addressable] [assigned] [usertype] usFbDiv
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1064:40: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1066:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] [usertype] ulFbDivDecFrac @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1066:47: sparse:     expected unsigned int [addressable] [assigned] [usertype] ulFbDivDecFrac
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1066:47: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1079:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] usPixelClock @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1079:45: sparse:     expected unsigned short [addressable] [assigned] [usertype] usPixelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1079:45: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1153:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] usFbDiv @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1153:40: sparse:     expected unsigned short [addressable] [assigned] [usertype] usFbDiv
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1153:40: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1155:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] [usertype] ulFbDivDecFrac @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1155:47: sparse:     expected unsigned int [addressable] [assigned] [usertype] ulFbDivDecFrac
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1155:47: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1168:60: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] [usertype] ulPixelClock:24 @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1168:60: sparse:     expected unsigned int [addressable] [assigned] [usertype] ulPixelClock:24
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1168:60: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1245:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] [usertype] ulPixelClock @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1245:34: sparse:     expected unsigned int [addressable] [assigned] [usertype] ulPixelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1245:34: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1334:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumPercentage @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1334:43: sparse:     expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumPercentage
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1334:43: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1383:51: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumPercentage @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1383:51: sparse:     expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumPercentage
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1383:51: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1385:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumStep @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1385:45: sparse:     expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumStep
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1385:45: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1399:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumAmount @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1399:47: sparse:     expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumAmount
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1399:47: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1453:51: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumAmountFrac @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1453:51: sparse:     expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumAmountFrac
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1453:51: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1455:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumStep @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1455:45: sparse:     expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumStep
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1455:45: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1468:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumAmount @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1468:47: sparse:     expected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrumAmount
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1468:47: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1527:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] usPixelClock @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1527:29: sparse:     expected unsigned short [usertype] usPixelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1527:29: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1541:43: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1571:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [usertype] usPixelClock @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1571:36: sparse:     expected unsigned short [addressable] [usertype] usPixelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1571:36: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1591:43: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1666:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] usPixelClock @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1666:30: sparse:     expected unsigned short [usertype] usPixelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1666:30: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1909:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usH_Size @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1909:25: sparse:     expected unsigned short [assigned] [usertype] usH_Size
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1909:25: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1911:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usH_Blanking_Time @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1911:34: sparse:     expected unsigned short [assigned] [usertype] usH_Blanking_Time
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1911:34: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1914:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usV_Size @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1914:25: sparse:     expected unsigned short [assigned] [usertype] usV_Size
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1914:25: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1916:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usV_Blanking_Time @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1916:34: sparse:     expected unsigned short [assigned] [usertype] usV_Blanking_Time
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1916:34: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1921:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usH_SyncOffset @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1921:31: sparse:     expected unsigned short [assigned] [usertype] usH_SyncOffset
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1921:31: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1923:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usH_SyncWidth @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1923:30: sparse:     expected unsigned short [assigned] [usertype] usH_SyncWidth
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1923:30: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1927:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usV_SyncOffset @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1927:31: sparse:     expected unsigned short [assigned] [usertype] usV_SyncOffset
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1927:31: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1929:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usV_SyncWidth @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1929:30: sparse:     expected unsigned short [assigned] [usertype] usV_SyncWidth
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1929:30: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1938:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1937:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usAccess @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1937:49: sparse:     expected unsigned short [assigned] [usertype] usAccess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1937:49: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1942:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1941:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usAccess @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1941:49: sparse:     expected unsigned short [assigned] [usertype] usAccess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1941:49: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1946:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1945:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usAccess @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1945:49: sparse:     expected unsigned short [assigned] [usertype] usAccess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1945:49: sparse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1963:39: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le16 [usertype] *var @@     got unsigned short * @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1963:39: sparse:     expected restricted __le16 [usertype] *var
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1963:39: sparse:     got unsigned short *
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1969:33: sparse: sparse: cast to restricted __le16
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1968:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] usAccess @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1968:49: sparse:     expected unsigned short [addressable] [assigned] [usertype] usAccess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1968:49: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1835:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usH_Total @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1835:26: sparse:     expected unsigned short [assigned] [usertype] usH_Total
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1835:26: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1836:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usH_Disp @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1836:25: sparse:     expected unsigned short [assigned] [usertype] usH_Disp
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1836:25: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1837:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usH_SyncStart @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1837:30: sparse:     expected unsigned short [assigned] [usertype] usH_SyncStart
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1837:30: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1838:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usH_SyncWidth @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1838:30: sparse:     expected unsigned short [assigned] [usertype] usH_SyncWidth
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1838:30: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1839:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usV_Total @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1839:26: sparse:     expected unsigned short [assigned] [usertype] usV_Total
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1839:26: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1840:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usV_Disp @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1840:25: sparse:     expected unsigned short [assigned] [usertype] usV_Disp
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1840:25: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1841:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usV_SyncStart @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1841:30: sparse:     expected unsigned short [assigned] [usertype] usV_SyncStart
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1841:30: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1843:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usV_SyncWidth @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1843:30: sparse:     expected unsigned short [assigned] [usertype] usV_SyncWidth
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1843:30: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1859:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1858:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usAccess @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1858:49: sparse:     expected unsigned short [assigned] [usertype] usAccess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1858:49: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1863:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1862:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usAccess @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1862:49: sparse:     expected unsigned short [assigned] [usertype] usAccess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1862:49: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1867:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1866:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usAccess @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1866:49: sparse:     expected unsigned short [assigned] [usertype] usAccess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1866:49: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1882:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usV_SyncStart @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1882:38: sparse:     expected unsigned short [assigned] [usertype] usV_SyncStart
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1882:38: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1888:33: sparse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1887:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] usAccess @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1887:49: sparse:     expected unsigned short [assigned] [usertype] usAccess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1887:49: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2130:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] usPixelClock @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2130:40: sparse:     expected unsigned short [addressable] [assigned] [usertype] usPixelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2130:40: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2162:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] [usertype] ulDispEngClkFreq @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2162:44: sparse:     expected unsigned int [addressable] [assigned] [usertype] ulDispEngClkFreq
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2162:44: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2175:44: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2257:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] usConnectorId @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2257:44: sparse:     expected unsigned short [usertype] usConnectorId
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2257:44: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2266:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] usPixelClock @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2266:43: sparse:     expected unsigned short [usertype] usPixelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2266:43: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2290:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] usPixelClock @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2290:43: sparse:     expected unsigned short [usertype] usPixelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2290:43: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2423:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] [usertype] ulDCEClkFreq @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2423:45: sparse:     expected unsigned int [addressable] [assigned] [usertype] ulDCEClkFreq
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2423:45: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2427:53: sparse: sparse: cast to restricted __le32
--
   WARNING: invalid argument to '-march': '_zihintpause'
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:485:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:500:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:546:21: sparse:     got unsigned int [usertype] *
--
   WARNING: invalid argument to '-march': '_zihintpause'
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:579:42: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2347:21: sparse:     got unsigned int [usertype] *
--
   WARNING: invalid argument to '-march': '_zihintpause'
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:284:29: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:330:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct amdgpu_debugfs_regs2_iocdata_v2 * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:330:46: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:330:46: sparse:     got struct amdgpu_debugfs_regs2_iocdata_v2 *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:336:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct amdgpu_debugfs_regs2_iocdata * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:336:47: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:336:47: sparse:     got struct amdgpu_debugfs_regs2_iocdata *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:460:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:488:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct amdgpu_debugfs_gprwave_iocdata * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:488:37: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:488:37: sparse:     got struct amdgpu_debugfs_gprwave_iocdata *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:711:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:711:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:711:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:711:21: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:711:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:824:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:824:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:824:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:824:21: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:824:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1003:29: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1003:29: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1003:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected signed int [noderef] __user *__p @@     got signed int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1003:29: sparse:     expected signed int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1003:29: sparse:     got signed int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1089:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1089:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1089:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1089:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1089:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1182:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1182:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1182:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1182:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1182:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1237:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1237:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1237:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1237:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1237:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1284:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1284:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1284:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1284:21: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1284:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1336:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1336:21: sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1336:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] __user *__p @@     got unsigned long long [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1336:21: sparse:     expected unsigned long long [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1336:21: sparse:     got unsigned long long [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1383:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1383:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1383:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1383:21: sparse:     expected unsigned int const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1383:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1431:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1431:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1431:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1431:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1431:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1472:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1472:21: sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1472:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1472:21: sparse:     expected unsigned int [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1472:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1808:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1808:25: sparse:    struct dma_fence [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1808:25: sparse:    struct dma_fence *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1809:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1809:17: sparse:    struct dma_fence [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1809:17: sparse:    struct dma_fence *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1860:23: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1868:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1868:17: sparse:    struct dma_fence [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1868:17: sparse:    struct dma_fence *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1903:32: sparse: sparse: cast to restricted __le32
--
   WARNING: invalid argument to '-march': '_zihintpause'
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:159:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:159:52: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:159:52: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:165:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:165:55: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:165:55: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:174:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:174:48: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:174:48: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:231:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:231:27: sparse:     expected void [noderef] __user *to
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:231:27: sparse:     got char *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:258:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:258:52: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:258:52: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:264:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:264:50: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:264:50: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:307:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:307:52: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:307:52: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:312:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:312:50: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:312:50: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:317:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:317:51: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:317:51: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:322:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:322:59: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:322:59: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:330:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:330:52: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:330:52: sparse:     got char const *
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:365:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:365:27: sparse:     expected void [noderef] __user *to
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:365:27: sparse:     got char *
>> drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:87:19: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected long ( *write )( ... ) @@     got long ( * )( ... ) @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:87:19: sparse:     expected long ( *write )( ... )
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:87:19: sparse:     got long ( * )( ... )
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:93:19: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected long ( *write )( ... ) @@     got long ( * )( ... ) @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:93:19: sparse:     expected long ( *write )( ... )
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:93:19: sparse:     got long ( * )( ... )
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:99:19: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected long ( *write )( ... ) @@     got long ( * )( ... ) @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:99:19: sparse:     expected long ( *write )( ... )
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:99:19: sparse:     got long ( * )( ... )

vim +1963 drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c

4562236b3bc0a2 Harry Wentland 2017-09-12  1895  
4562236b3bc0a2 Harry Wentland 2017-09-12  1896  static enum bp_result set_crtc_using_dtd_timing_v3(
4562236b3bc0a2 Harry Wentland 2017-09-12  1897  	struct bios_parser *bp,
4562236b3bc0a2 Harry Wentland 2017-09-12  1898  	struct bp_hw_crtc_timing_parameters *bp_params)
4562236b3bc0a2 Harry Wentland 2017-09-12  1899  {
4562236b3bc0a2 Harry Wentland 2017-09-12  1900  	enum bp_result result = BP_RESULT_FAILURE;
4562236b3bc0a2 Harry Wentland 2017-09-12  1901  	SET_CRTC_USING_DTD_TIMING_PARAMETERS params = {0};
4562236b3bc0a2 Harry Wentland 2017-09-12  1902  	uint8_t atom_controller_id;
4562236b3bc0a2 Harry Wentland 2017-09-12  1903  
4562236b3bc0a2 Harry Wentland 2017-09-12  1904  	if (bp->cmd_helper->controller_id_to_atom(
4562236b3bc0a2 Harry Wentland 2017-09-12  1905  			bp_params->controller_id, &atom_controller_id))
4562236b3bc0a2 Harry Wentland 2017-09-12  1906  		params.ucCRTC = atom_controller_id;
4562236b3bc0a2 Harry Wentland 2017-09-12  1907  
4562236b3bc0a2 Harry Wentland 2017-09-12  1908  	/* bios usH_Size wants h addressable size */
4562236b3bc0a2 Harry Wentland 2017-09-12  1909  	params.usH_Size = cpu_to_le16((uint16_t)bp_params->h_addressable);
4562236b3bc0a2 Harry Wentland 2017-09-12  1910  	/* bios usH_Blanking_Time wants borders included in blanking */
4562236b3bc0a2 Harry Wentland 2017-09-12  1911  	params.usH_Blanking_Time =
4562236b3bc0a2 Harry Wentland 2017-09-12  1912  			cpu_to_le16((uint16_t)(bp_params->h_total - bp_params->h_addressable));
4562236b3bc0a2 Harry Wentland 2017-09-12  1913  	/* bios usV_Size wants v addressable size */
4562236b3bc0a2 Harry Wentland 2017-09-12  1914  	params.usV_Size = cpu_to_le16((uint16_t)bp_params->v_addressable);
4562236b3bc0a2 Harry Wentland 2017-09-12  1915  	/* bios usV_Blanking_Time wants borders included in blanking */
4562236b3bc0a2 Harry Wentland 2017-09-12  1916  	params.usV_Blanking_Time =
4562236b3bc0a2 Harry Wentland 2017-09-12  1917  			cpu_to_le16((uint16_t)(bp_params->v_total - bp_params->v_addressable));
4562236b3bc0a2 Harry Wentland 2017-09-12  1918  	/* bios usHSyncOffset is the offset from the end of h addressable,
4562236b3bc0a2 Harry Wentland 2017-09-12  1919  	 * our horizontalSyncStart is the offset from the beginning
4562236b3bc0a2 Harry Wentland 2017-09-12  1920  	 * of h addressable */
4562236b3bc0a2 Harry Wentland 2017-09-12  1921  	params.usH_SyncOffset =
4562236b3bc0a2 Harry Wentland 2017-09-12  1922  			cpu_to_le16((uint16_t)(bp_params->h_sync_start - bp_params->h_addressable));
4562236b3bc0a2 Harry Wentland 2017-09-12  1923  	params.usH_SyncWidth = cpu_to_le16((uint16_t)bp_params->h_sync_width);
4562236b3bc0a2 Harry Wentland 2017-09-12  1924  	/* bios usHSyncOffset is the offset from the end of v addressable,
4562236b3bc0a2 Harry Wentland 2017-09-12  1925  	 * our verticalSyncStart is the offset from the beginning of
4562236b3bc0a2 Harry Wentland 2017-09-12  1926  	 * v addressable */
4562236b3bc0a2 Harry Wentland 2017-09-12  1927  	params.usV_SyncOffset =
4562236b3bc0a2 Harry Wentland 2017-09-12  1928  			cpu_to_le16((uint16_t)(bp_params->v_sync_start - bp_params->v_addressable));
4562236b3bc0a2 Harry Wentland 2017-09-12  1929  	params.usV_SyncWidth = cpu_to_le16((uint16_t)bp_params->v_sync_width);
4562236b3bc0a2 Harry Wentland 2017-09-12  1930  
4562236b3bc0a2 Harry Wentland 2017-09-12  1931  	/* we assume that overscan from original timing does not get bigger
4562236b3bc0a2 Harry Wentland 2017-09-12  1932  	 * than 255
4562236b3bc0a2 Harry Wentland 2017-09-12  1933  	 * we will program all the borders in the Set CRTC Overscan call below
4562236b3bc0a2 Harry Wentland 2017-09-12  1934  	 */
4562236b3bc0a2 Harry Wentland 2017-09-12  1935  
4562236b3bc0a2 Harry Wentland 2017-09-12  1936  	if (0 == bp_params->flags.HSYNC_POSITIVE_POLARITY)
4562236b3bc0a2 Harry Wentland 2017-09-12  1937  		params.susModeMiscInfo.usAccess =
4562236b3bc0a2 Harry Wentland 2017-09-12  1938  				cpu_to_le16(le16_to_cpu(params.susModeMiscInfo.usAccess) | ATOM_HSYNC_POLARITY);
4562236b3bc0a2 Harry Wentland 2017-09-12  1939  
4562236b3bc0a2 Harry Wentland 2017-09-12  1940  	if (0 == bp_params->flags.VSYNC_POSITIVE_POLARITY)
4562236b3bc0a2 Harry Wentland 2017-09-12  1941  		params.susModeMiscInfo.usAccess =
4562236b3bc0a2 Harry Wentland 2017-09-12  1942  				cpu_to_le16(le16_to_cpu(params.susModeMiscInfo.usAccess) | ATOM_VSYNC_POLARITY);
4562236b3bc0a2 Harry Wentland 2017-09-12  1943  
4562236b3bc0a2 Harry Wentland 2017-09-12  1944  	if (bp_params->flags.INTERLACE)	{
4562236b3bc0a2 Harry Wentland 2017-09-12  1945  		params.susModeMiscInfo.usAccess =
4562236b3bc0a2 Harry Wentland 2017-09-12  1946  				cpu_to_le16(le16_to_cpu(params.susModeMiscInfo.usAccess) | ATOM_INTERLACE);
4562236b3bc0a2 Harry Wentland 2017-09-12  1947  
4562236b3bc0a2 Harry Wentland 2017-09-12  1948  		/* original DAL code has this condition to apply this
4562236b3bc0a2 Harry Wentland 2017-09-12  1949  		 * for non-TV/CV only
4562236b3bc0a2 Harry Wentland 2017-09-12  1950  		 * due to complex MV testing for possible impact
4562236b3bc0a2 Harry Wentland 2017-09-12  1951  		 * if ( pACParameters->signal != SignalType_YPbPr &&
4562236b3bc0a2 Harry Wentland 2017-09-12  1952  		 *  pACParameters->signal != SignalType_Composite &&
4562236b3bc0a2 Harry Wentland 2017-09-12  1953  		 *  pACParameters->signal != SignalType_SVideo)
4562236b3bc0a2 Harry Wentland 2017-09-12  1954  		 */
4562236b3bc0a2 Harry Wentland 2017-09-12  1955  		{
4562236b3bc0a2 Harry Wentland 2017-09-12  1956  			/* HW will deduct 0.5 line from 2nd feild.
4562236b3bc0a2 Harry Wentland 2017-09-12  1957  			 * i.e. for 1080i, it is 2 lines for 1st field,
4562236b3bc0a2 Harry Wentland 2017-09-12  1958  			 * 2.5 lines for the 2nd feild. we need input as 5
4562236b3bc0a2 Harry Wentland 2017-09-12  1959  			 * instead of 4.
4562236b3bc0a2 Harry Wentland 2017-09-12  1960  			 * but it is 4 either from Edid data (spec CEA 861)
4562236b3bc0a2 Harry Wentland 2017-09-12  1961  			 * or CEA timing table.
4562236b3bc0a2 Harry Wentland 2017-09-12  1962  			 */
d6e6dfb287443b Qinglang Miao  2020-08-10 @1963  			le16_add_cpu(&params.usV_SyncOffset, 1);
4562236b3bc0a2 Harry Wentland 2017-09-12  1964  		}
4562236b3bc0a2 Harry Wentland 2017-09-12  1965  	}
4562236b3bc0a2 Harry Wentland 2017-09-12  1966  
4562236b3bc0a2 Harry Wentland 2017-09-12  1967  	if (bp_params->flags.HORZ_COUNT_BY_TWO)
4562236b3bc0a2 Harry Wentland 2017-09-12 @1968  		params.susModeMiscInfo.usAccess =
4562236b3bc0a2 Harry Wentland 2017-09-12  1969  				cpu_to_le16(le16_to_cpu(params.susModeMiscInfo.usAccess) | ATOM_DOUBLE_CLOCK_MODE);
4562236b3bc0a2 Harry Wentland 2017-09-12  1970  
4562236b3bc0a2 Harry Wentland 2017-09-12  1971  	if (EXEC_BIOS_CMD_TABLE(SetCRTC_UsingDTDTiming, params))
4562236b3bc0a2 Harry Wentland 2017-09-12  1972  		result = BP_RESULT_OK;
4562236b3bc0a2 Harry Wentland 2017-09-12  1973  
4562236b3bc0a2 Harry Wentland 2017-09-12  1974  	return result;
4562236b3bc0a2 Harry Wentland 2017-09-12  1975  }
4562236b3bc0a2 Harry Wentland 2017-09-12  1976  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
