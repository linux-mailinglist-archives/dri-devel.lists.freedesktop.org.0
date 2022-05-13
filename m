Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CD3525CA5
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 09:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB58310E549;
	Fri, 13 May 2022 07:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED48D10E549;
 Fri, 13 May 2022 07:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652428705; x=1683964705;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mDNirvnpVg2EfPx5OXhFvMMp2oytvT3AbVi8k5j5ehU=;
 b=Do0k0dkgTR6o7/3MF0G/cyH+t3fvDffbXqbzOu9CMwiZTaYiaCvkhUZa
 fq35webwVuhL5H9X4Olqe+i/S00HjcQSoJpCuVxy9EyTi9d9lgWC8Evpm
 W5KqFULF6imvO2JTq+rNd3CNIppxxpATTF4gKAwsOGNoEc9757Wl3thSl
 SetkOJ3s2B3LkRllvS/yBS4q9DPGl1plQZE8slaJw0oQph/1H4wo/rYZj
 8BQtgUTzc4bdqN45yPppevRfdr8rF6OLNt4poi2kilnrggB3XErVQUw41
 cWVfOPRZpUvRwD47ZvKVOGo6vpIEeS+BGwKWfWh/VrvNrrTZkITbkV7ID w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="295504466"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="295504466"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 00:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="624774609"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 13 May 2022 00:58:20 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1npQBn-000LW2-Rk;
 Fri, 13 May 2022 07:58:19 +0000
Date: Fri, 13 May 2022 15:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: pengfuyuan <pengfuyuan@kylinos.cn>, Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH] drm/amd/display: Remove macro DC_DEFAULT_LOG_MASK
Message-ID: <202205131519.0PPhVMxz-lkp@intel.com>
References: <20220512084851.104099-1-pengfuyuan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512084851.104099-1-pengfuyuan@kylinos.cn>
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
Cc: Xinhui.Pan@amd.com, kbuild-all@lists.01.org,
 pengfuyuan <pengfuyuan@kylinos.cn>, Leo Li <sunpeng.li@amd.com>,
 llvm@lists.linux.dev, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi pengfuyuan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v5.18-rc6 next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/pengfuyuan/drm-amd-display-Remove-macro-DC_DEFAULT_LOG_MASK/20220512-185320
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm-randconfig-r016-20220512 (https://download.01.org/0day-ci/archive/20220513/202205131519.0PPhVMxz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9519dacab7b8afd537811fc2abaceb4d14f4e16a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/94b3092ea272cf77105cc7b19fcffc44b49e1a71
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review pengfuyuan/drm-amd-display-Remove-macro-DC_DEFAULT_LOG_MASK/20220512-185320
        git checkout 94b3092ea272cf77105cc7b19fcffc44b49e1a71
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:30:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:31:
>> drivers/gpu/drm/amd/amdgpu/../display/include/logger_types.h:26:2: error: unterminated conditional directive
   #ifndef __DAL_LOGGER_TYPES_H__
    ^
   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:30:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:40:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/hw_sequencer.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/clock_source.h:31:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/include/bios_parser_types.h:30:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:36:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/include/logger_interface.h:29:
>> drivers/gpu/drm/amd/amdgpu/../display/include/logger_types.h:26:2: error: unterminated conditional directive
   #ifndef __DAL_LOGGER_TYPES_H__
    ^
   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:35:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dmub/dmub_srv.h:67:
   drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h:862:18: warning: field cursor_copy_src within 'struct dmub_rb_cmd_mall' is less aligned than 'union dmub_addr' and is usually due to 'struct dmub_rb_cmd_mall' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union dmub_addr cursor_copy_src; /**< Cursor copy address */
                           ^
   drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h:863:18: warning: field cursor_copy_dst within 'struct dmub_rb_cmd_mall' is less aligned than 'union dmub_addr' and is usually due to 'struct dmub_rb_cmd_mall' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union dmub_addr cursor_copy_dst; /**< Cursor copy destination */
                           ^
   2 warnings and 2 errors generated.
--
   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:27:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:31:
>> drivers/gpu/drm/amd/amdgpu/../display/include/logger_types.h:26:2: error: unterminated conditional directive
   #ifndef __DAL_LOGGER_TYPES_H__
    ^
   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:27:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:40:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/hw_sequencer.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/clock_source.h:31:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/include/bios_parser_types.h:30:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:36:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/include/logger_interface.h:29:
>> drivers/gpu/drm/amd/amdgpu/../display/include/logger_types.h:26:2: error: unterminated conditional directive
   #ifndef __DAL_LOGGER_TYPES_H__
    ^
   2 errors generated.
--
   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_pp_smu.c:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:36:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/include/logger_interface.h:29:
>> drivers/gpu/drm/amd/amdgpu/../display/include/logger_types.h:26:2: error: unterminated conditional directive
   #ifndef __DAL_LOGGER_TYPES_H__
    ^
   1 error generated.
--
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:28:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:36:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/include/logger_interface.h:29:
>> drivers/gpu/drm/amd/amdgpu/../display/include/logger_types.h:26:2: error: unterminated conditional directive
   #ifndef __DAL_LOGGER_TYPES_H__
    ^
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:30:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_helpers.h:34:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:31:
>> drivers/gpu/drm/amd/amdgpu/../display/include/logger_types.h:26:2: error: unterminated conditional directive
   #ifndef __DAL_LOGGER_TYPES_H__
    ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:3685:25: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           enum act_return_status ret;
                                  ^
   1 warning and 2 errors generated.
--
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:28:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:36:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/include/logger_interface.h:29:
>> drivers/gpu/drm/amd/amdgpu/../display/include/logger_types.h:26:2: error: unterminated conditional directive
   #ifndef __DAL_LOGGER_TYPES_H__
    ^
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:30:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/resource.h:28:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:31:
>> drivers/gpu/drm/amd/amdgpu/../display/include/logger_types.h:26:2: error: unterminated conditional directive
   #ifndef __DAL_LOGGER_TYPES_H__
    ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1642:6: warning: no previous prototype for function 'is_timing_changed' [-Wmissing-prototypes]
   bool is_timing_changed(struct dc_stream_state *cur_stream,
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1642:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool is_timing_changed(struct dc_stream_state *cur_stream,
   ^
   static 
   1 warning and 2 errors generated.
--
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.c:25:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/link_enc_cfg.h:33:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:31:
>> drivers/gpu/drm/amd/amdgpu/../display/include/logger_types.h:26:2: error: unterminated conditional directive
   #ifndef __DAL_LOGGER_TYPES_H__
    ^
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.c:25:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/link_enc_cfg.h:33:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:40:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/hw_sequencer.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/clock_source.h:31:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/include/bios_parser_types.h:30:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:36:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/include/logger_interface.h:29:
>> drivers/gpu/drm/amd/amdgpu/../display/include/logger_types.h:26:2: error: unterminated conditional directive
   #ifndef __DAL_LOGGER_TYPES_H__
    ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.c:570:6: warning: variable 'matching_stream_ptrs' set but not used [-Wunused-but-set-variable]
           int matching_stream_ptrs = 0;
               ^
   1 warning and 2 errors generated.
--
   In file included from drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:28:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:36:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/include/logger_interface.h:29:
>> drivers/gpu/drm/amd/amdgpu/../display/include/logger_types.h:26:2: error: unterminated conditional directive
   #ifndef __DAL_LOGGER_TYPES_H__
    ^
   In file included from drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:31:
>> drivers/gpu/drm/amd/amdgpu/../display/include/logger_types.h:26:2: error: unterminated conditional directive
   #ifndef __DAL_LOGGER_TYPES_H__
    ^
   drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:1179:15: warning: variable 'average_render_time_in_us' set but not used [-Wunused-but-set-variable]
           unsigned int average_render_time_in_us = 0;
                        ^
   1 warning and 2 errors generated.


vim +26 drivers/gpu/drm/amd/amdgpu/../display/include/logger_types.h

4562236b3bc0a28 Harry Wentland 2017-09-12 @26  #ifndef __DAL_LOGGER_TYPES_H__
4562236b3bc0a28 Harry Wentland 2017-09-12  27  #define __DAL_LOGGER_TYPES_H__
4562236b3bc0a28 Harry Wentland 2017-09-12  28  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
