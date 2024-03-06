Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1418742CC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 23:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794D710ED23;
	Wed,  6 Mar 2024 22:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TCD02OeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC8810ED23
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 22:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709764479; x=1741300479;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=7CNhkoycE7JBgt0VYgZM7XWXLPbehkrfoDl1h7saRFw=;
 b=TCD02OeXzAOxDuZBHjtYXHVEo37a+jrYw1eNyDwlp3fiCAdIfNcqlcIR
 qTVD3v8fMaxU/imGDVQ6vOL2qoBKZ+Jk+przUamszntJr1YIcoreMMdu1
 gQEbukblGQN4mYIcgR1tH6JufN9NHq5YuHj7BbsclJ6Y5bzbsMAS5CQKY
 NhDw9gnfyXohIEbuf+yljYWvWu9AEO0SHKYd3ZCYDdMk24E6fQkYi8G+m
 nko5aiY6TCv+BEwqShfg4MTMZdpjXnE83wg+KX6BrDpfh8toadusS/hr7
 OP2hOWXCXCVXLwrserFkbYEQ65um+gDWVn3+AOyW/i0Aq0hHnH5hbpGXN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8170604"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8170604"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 14:34:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9989437"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2024 14:34:36 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rhzqL-0004an-2f;
 Wed, 06 Mar 2024 22:34:33 +0000
Date: Thu, 7 Mar 2024 06:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [drm-misc:drm-misc-next 2/2]
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1255:52: error: '%s' directive output
 may be truncated writing up to 29 bytes into a region of size 23
Message-ID: <202403070619.KffNoC64-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   f89632a9e5fa6c4787c14458cd42a9ef42025434
commit: f89632a9e5fa6c4787c14458cd42a9ef42025434 [2/2] drm: Add CONFIG_DRM_WERROR
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240307/202403070619.KffNoC64-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403070619.KffNoC64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403070619.KffNoC64-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c: In function 'gfx_v9_0_early_init':
>> drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1255:52: error: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Werror=format-truncation=]
    1255 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
         |                                                    ^~
   ......
    1393 |                 r = gfx_v9_0_init_cp_gfx_microcode(adev, ucode_prefix);
         |                                                          ~~~~~~~~~~~~
   In function 'gfx_v9_0_init_cp_gfx_microcode',
       inlined from 'gfx_v9_0_init_microcode' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1393:7,
       inlined from 'gfx_v9_0_early_init' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4540:9:
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1255:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 30
    1255 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c: In function 'gfx_v9_0_early_init':
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1261:52: error: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Werror=format-truncation=]
    1261 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
         |                                                    ^~
   ......
    1393 |                 r = gfx_v9_0_init_cp_gfx_microcode(adev, ucode_prefix);
         |                                                          ~~~~~~~~~~~~
   In function 'gfx_v9_0_init_cp_gfx_microcode',
       inlined from 'gfx_v9_0_init_microcode' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1393:7,
       inlined from 'gfx_v9_0_early_init' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4540:9:
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1261:9: note: 'snprintf' output between 15 and 44 bytes into a destination of size 30
    1261 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c: In function 'gfx_v9_0_early_init':
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1267:52: error: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Werror=format-truncation=]
    1267 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
         |                                                    ^~
   ......
    1393 |                 r = gfx_v9_0_init_cp_gfx_microcode(adev, ucode_prefix);
         |                                                          ~~~~~~~~~~~~
   In function 'gfx_v9_0_init_cp_gfx_microcode',
       inlined from 'gfx_v9_0_init_microcode' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1393:7,
       inlined from 'gfx_v9_0_early_init' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4540:9:
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1267:9: note: 'snprintf' output between 15 and 44 bytes into a destination of size 30
    1267 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c: In function 'gfx_v9_0_early_init':
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1303:60: error: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Werror=format-truncation=]
    1303 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc_am4.bin", chip_name);
         |                                                            ^~
   ......
    1398 |         r = gfx_v9_0_init_rlc_microcode(adev, ucode_prefix);
         |                                               ~~~~~~~~~~~~  
   In function 'gfx_v9_0_init_rlc_microcode',
       inlined from 'gfx_v9_0_init_microcode' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1398:6,
       inlined from 'gfx_v9_0_early_init' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4540:9:
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1303:17: note: 'snprintf' output between 20 and 49 bytes into a destination of size 30
    1303 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc_am4.bin", chip_name);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c: In function 'gfx_v9_0_early_init':
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1309:60: error: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Werror=format-truncation=]
    1309 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_kicker_rlc.bin", chip_name);
         |                                                            ^~
   ......
    1398 |         r = gfx_v9_0_init_rlc_microcode(adev, ucode_prefix);
         |                                               ~~~~~~~~~~~~  
   In function 'gfx_v9_0_init_rlc_microcode',
       inlined from 'gfx_v9_0_init_microcode' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1398:6,
       inlined from 'gfx_v9_0_early_init' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4540:9:
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1309:17: note: 'snprintf' output between 23 and 52 bytes into a destination of size 30
    1309 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_kicker_rlc.bin", chip_name);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c: In function 'gfx_v9_0_early_init':
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1311:60: error: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Werror=format-truncation=]
    1311 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
         |                                                            ^~
   ......
    1398 |         r = gfx_v9_0_init_rlc_microcode(adev, ucode_prefix);
         |                                               ~~~~~~~~~~~~  
   In function 'gfx_v9_0_init_rlc_microcode',
       inlined from 'gfx_v9_0_init_microcode' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1398:6,
       inlined from 'gfx_v9_0_early_init' at drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4540:9:
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1311:17: note: 'snprintf' output between 16 and 45 bytes into a destination of size 30
    1311 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c: In function 'gfx_v10_0_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3979:58: error: '%s' directive output may be truncated writing up to 4 bytes into a region of size between 0 and 29 [-Werror=format-truncation=]
    3979 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp%s.bin", ucode_prefix, wks);
         |                                                          ^~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3979:9: note: 'snprintf' output between 16 and 49 bytes into a destination of size 40
    3979 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp%s.bin", ucode_prefix, wks);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3985:57: error: '%s' directive output may be truncated writing up to 4 bytes into a region of size between 1 and 30 [-Werror=format-truncation=]
    3985 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", ucode_prefix, wks);
         |                                                         ^~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3985:9: note: 'snprintf' output between 15 and 48 bytes into a destination of size 40
    3985 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", ucode_prefix, wks);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3991:57: error: '%s' directive output may be truncated writing up to 4 bytes into a region of size between 1 and 30 [-Werror=format-truncation=]
    3991 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", ucode_prefix, wks);
         |                                                         ^~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3991:9: note: 'snprintf' output between 15 and 48 bytes into a destination of size 40
    3991 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", ucode_prefix, wks);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3998:62: error: '_rlc.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Werror=format-truncation=]
    3998 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                                                              ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3998:17: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
    3998 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4014:58: error: '%s' directive output may be truncated writing up to 4 bytes into a region of size between 0 and 29 [-Werror=format-truncation=]
    4014 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", ucode_prefix, wks);
         |                                                          ^~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4014:9: note: 'snprintf' output between 16 and 49 bytes into a destination of size 40
    4014 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", ucode_prefix, wks);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4021:54: error: '_mec2' directive output may be truncated writing 5 bytes into a region of size between 4 and 33 [-Werror=format-truncation=]
    4021 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", ucode_prefix, wks);
         |                                                      ^~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4021:9: note: 'snprintf' output between 17 and 50 bytes into a destination of size 40
    4021 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", ucode_prefix, wks);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c: In function 'gfx_v11_0_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:519:54: error: '_pfp.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Werror=format-truncation=]
     519 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:519:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     519 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:536:54: error: '_me.bin' directive output may be truncated writing 7 bytes into a region of size between 4 and 33 [-Werror=format-truncation=]
     536 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
         |                                                      ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:536:9: note: 'snprintf' output between 15 and 44 bytes into a destination of size 40
     536 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:553:70: error: '_rlc.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Werror=format-truncation=]
     553 |                         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:553:25: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     553 |                         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:565:54: error: '_mec.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Werror=format-truncation=]
     565 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:565:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     565 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c: In function 'amdgpu_mes_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1486:66: error: '%s' directive output may be truncated writing up to 1 bytes into a region of size between 0 and 29 [-Werror=format-truncation=]
    1486 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                                                                  ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1486:17: note: 'snprintf' output between 16 and 46 bytes into a destination of size 40
    1486 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1487 |                          ucode_prefix,
         |                          ~~~~~~~~~~~~~
    1488 |                          pipe == AMDGPU_MES_SCHED_PIPE ? "" : "1");
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1481:66: error: '%s' directive output may be truncated writing 1 byte into a region of size between 0 and 29 [-Werror=format-truncation=]
    1481 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                                                                  ^~
    1482 |                          ucode_prefix,
    1483 |                          pipe == AMDGPU_MES_SCHED_PIPE ? "_2" : "1");
         |                                                                 ~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1481:17: note: 'snprintf' output between 17 and 46 bytes into a destination of size 40
    1481 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1482 |                          ucode_prefix,
         |                          ~~~~~~~~~~~~~
    1483 |                          pipe == AMDGPU_MES_SCHED_PIPE ? "_2" : "1");
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1481:66: error: '%s' directive output may be truncated writing 2 bytes into a region of size between 0 and 29 [-Werror=format-truncation=]
    1481 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                                                                  ^~
    1482 |                          ucode_prefix,
    1483 |                          pipe == AMDGPU_MES_SCHED_PIPE ? "_2" : "1");
         |                                                          ~~~~     
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1481:17: note: 'snprintf' output between 18 and 47 bytes into a destination of size 40
    1481 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1482 |                          ucode_prefix,
         |                          ~~~~~~~~~~~~~
    1483 |                          pipe == AMDGPU_MES_SCHED_PIPE ? "_2" : "1");
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1493:62: error: '_mes.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Werror=format-truncation=]
    1493 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes.bin",
         |                                                              ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1493:17: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
    1493 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes.bin",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1494 |                          ucode_prefix);
         |                          ~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c: In function 'amdgpu_vcn_early_init':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:97:58: error: 'snprintf' output may be truncated before the last format character [-Werror=format-truncation=]
      97 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                          ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:97:9: note: 'snprintf' output between 12 and 41 bytes into a destination of size 40
      97 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c: In function 'smu_v11_0_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:110:54: error: '.bin' directive output may be truncated writing 4 bytes into a region of size between 0 and 29 [-Werror=format-truncation=]
     110 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                      ^~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:110:9: note: 'snprintf' output between 12 and 41 bytes into a destination of size 36
     110 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.c: In function 'smu_v13_0_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.c:108:52: error: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Werror=format-truncation=]
     108 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                    ^~       ~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.c:108:9: note: 'snprintf' output between 12 and 41 bytes into a destination of size 30
     108 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c: In function 'rzg2l_du_vsp_atomic_flush':
>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:69:37: error: variable 'state' set but not used [-Werror=unused-but-set-variable]
      69 |         struct rzg2l_du_crtc_state *state;
         |                                     ^~~~~
   cc1: all warnings being treated as errors
--
   drivers/gpu/drm/imx/ipuv3/imx-ldb.c: In function 'imx_ldb_probe':
>> drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:57: error: '_sel' directive output may be truncated writing 4 bytes into a region of size between 3 and 13 [-Werror=format-truncation=]
     658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
         |                                                         ^~~~
   drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:17: note: 'snprintf' output between 8 and 18 bytes into a destination of size 16
     658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/gpu/drm/panthor/panthor_device.c:142:13: error: 'panthor_device_is_initialized' defined but not used [-Werror=unused-function]
     142 | static bool panthor_device_is_initialized(struct panthor_device *ptdev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +1255 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c

005440066f929b Huang Rui         2019-03-13  1248  
24c44c89178208 Le Ma             2018-09-18  1249  static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
1c21885ec1ef3e Mario Limonciello 2022-12-28  1250  					  char *chip_name)
b1023571479020 Ken Wang          2017-03-03  1251  {
b1023571479020 Ken Wang          2017-03-03  1252  	char fw_name[30];
b1023571479020 Ken Wang          2017-03-03  1253  	int err;
b1023571479020 Ken Wang          2017-03-03  1254  
b1023571479020 Ken Wang          2017-03-03 @1255  	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
ec787deb2ddffc Mario Limonciello 2023-01-03  1256  	err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
b1023571479020 Ken Wang          2017-03-03  1257  	if (err)
b1023571479020 Ken Wang          2017-03-03  1258  		goto out;
93cad722d3fe54 Likun Gao         2022-09-20  1259  	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_PFP);
b1023571479020 Ken Wang          2017-03-03  1260  
b1023571479020 Ken Wang          2017-03-03  1261  	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
ec787deb2ddffc Mario Limonciello 2023-01-03  1262  	err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
b1023571479020 Ken Wang          2017-03-03  1263  	if (err)
b1023571479020 Ken Wang          2017-03-03  1264  		goto out;
93cad722d3fe54 Likun Gao         2022-09-20  1265  	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_ME);
b1023571479020 Ken Wang          2017-03-03  1266  
b1023571479020 Ken Wang          2017-03-03  1267  	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
ec787deb2ddffc Mario Limonciello 2023-01-03  1268  	err = amdgpu_ucode_request(adev, &adev->gfx.ce_fw, fw_name);
b1023571479020 Ken Wang          2017-03-03  1269  	if (err)
b1023571479020 Ken Wang          2017-03-03  1270  		goto out;
93cad722d3fe54 Likun Gao         2022-09-20  1271  	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_CE);
24c44c89178208 Le Ma             2018-09-18  1272  
24c44c89178208 Le Ma             2018-09-18  1273  out:
24c44c89178208 Le Ma             2018-09-18  1274  	if (err) {
ec787deb2ddffc Mario Limonciello 2023-01-03  1275  		amdgpu_ucode_release(&adev->gfx.pfp_fw);
ec787deb2ddffc Mario Limonciello 2023-01-03  1276  		amdgpu_ucode_release(&adev->gfx.me_fw);
ec787deb2ddffc Mario Limonciello 2023-01-03  1277  		amdgpu_ucode_release(&adev->gfx.ce_fw);
24c44c89178208 Le Ma             2018-09-18  1278  	}
24c44c89178208 Le Ma             2018-09-18  1279  	return err;
24c44c89178208 Le Ma             2018-09-18  1280  }
24c44c89178208 Le Ma             2018-09-18  1281  

:::::: The code at line 1255 was first introduced by commit
:::::: b1023571479020e9e9c15a51b43bf8e15406952b drm/amdgpu: implement GFX 9.0 support (v2)

:::::: TO: Ken Wang <Qingqing.Wang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
