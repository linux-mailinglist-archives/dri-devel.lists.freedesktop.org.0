Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DC37867C6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 08:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B90F10E48B;
	Thu, 24 Aug 2023 06:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A257910E486;
 Thu, 24 Aug 2023 06:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692859825; x=1724395825;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7c1u4LL4oLHnfK/HLKKjWnjJYUV11K5kwkL59BvWvZQ=;
 b=lfRUAr/vpKBhF23uxrxiiKODvBBdwDLTybzk0XsyyZ9MBYV5FvTD2Muo
 UeKjUjT/ZTYnePPcLE6wugw/KgWThuzVJapHukm2q30dnmX6ChBkEYLMz
 CNMKU90xgvu1j5GEnDo19fdER6+7uMg1c0wS20WBEP9xYZeFMqCRtNTmH
 RPYefKTB1m+O7DUAn3y94T6g84jNhP5YCrg1DcHsxCmG2BT5ZWl/L31OS
 nwzA2iVcMgngnXsuTkQlEhHCTP65lre7GAWVk0Mkq/yJOgByDR4d8ivZA
 gTYFduUaNAa1serZa2/0vqrUUaJA4gmtmb7BHyhCitCm7sgQ7YAosnWx1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="378114828"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="378114828"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 23:50:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="910789373"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="910789373"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2023 23:50:19 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qZ4Ac-0001oG-27;
 Thu, 24 Aug 2023 06:50:18 +0000
Date: Thu, 24 Aug 2023 14:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
Subject: Re: [PATCH v2 6/6] drm/drm-file: Allow size unit selection in
 drm_show_memory_stats
Message-ID: <202308241401.Hr6gvevs-lkp@intel.com>
References: <20230824013604.466224-7-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230824013604.466224-7-adrian.larumbe@collabora.com>
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
Cc: linux-arm-msm@vger.kernel.org, adrian.larumbe@collabora.com,
 healych@amazon.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 kernel@collabora.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adrián,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.5-rc7 next-20230823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panfrost-Add-cycle-count-GPU-register-definitions/20230824-093848
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230824013604.466224-7-adrian.larumbe%40collabora.com
patch subject: [PATCH v2 6/6] drm/drm-file: Allow size unit selection in drm_show_memory_stats
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230824/202308241401.Hr6gvevs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241401.Hr6gvevs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241401.Hr6gvevs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_file.c:905: warning: Function parameter or member 'unit' not described in 'drm_print_memory_stats'


vim +905 drivers/gpu/drm/drm_file.c

686b21b5f6ca2f Rob Clark      2023-05-24  891  
686b21b5f6ca2f Rob Clark      2023-05-24  892  /**
686b21b5f6ca2f Rob Clark      2023-05-24  893   * drm_print_memory_stats - A helper to print memory stats
686b21b5f6ca2f Rob Clark      2023-05-24  894   * @p: The printer to print output to
686b21b5f6ca2f Rob Clark      2023-05-24  895   * @stats: The collected memory stats
686b21b5f6ca2f Rob Clark      2023-05-24  896   * @supported_status: Bitmask of optional stats which are available
686b21b5f6ca2f Rob Clark      2023-05-24  897   * @region: The memory region
686b21b5f6ca2f Rob Clark      2023-05-24  898   *
686b21b5f6ca2f Rob Clark      2023-05-24  899   */
686b21b5f6ca2f Rob Clark      2023-05-24  900  void drm_print_memory_stats(struct drm_printer *p,
686b21b5f6ca2f Rob Clark      2023-05-24  901  			    const struct drm_memory_stats *stats,
686b21b5f6ca2f Rob Clark      2023-05-24  902  			    enum drm_gem_object_status supported_status,
cccad8cb432637 Adrián Larumbe 2023-08-24  903  			    const char *region,
cccad8cb432637 Adrián Larumbe 2023-08-24  904  			    unsigned int unit)
686b21b5f6ca2f Rob Clark      2023-05-24 @905  {
cccad8cb432637 Adrián Larumbe 2023-08-24  906  	print_size(p, "total", region, stats->private + stats->shared, unit);
cccad8cb432637 Adrián Larumbe 2023-08-24  907  	print_size(p, "shared", region, stats->shared, unit);
cccad8cb432637 Adrián Larumbe 2023-08-24  908  	print_size(p, "active", region, stats->active, unit);
686b21b5f6ca2f Rob Clark      2023-05-24  909  
686b21b5f6ca2f Rob Clark      2023-05-24  910  	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
cccad8cb432637 Adrián Larumbe 2023-08-24  911  		print_size(p, "resident", region, stats->resident, unit);
686b21b5f6ca2f Rob Clark      2023-05-24  912  
686b21b5f6ca2f Rob Clark      2023-05-24  913  	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
cccad8cb432637 Adrián Larumbe 2023-08-24  914  		print_size(p, "purgeable", region, stats->purgeable, unit);
686b21b5f6ca2f Rob Clark      2023-05-24  915  }
686b21b5f6ca2f Rob Clark      2023-05-24  916  EXPORT_SYMBOL(drm_print_memory_stats);
686b21b5f6ca2f Rob Clark      2023-05-24  917  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
