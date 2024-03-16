Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0913987D9B9
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 11:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2537A10E778;
	Sat, 16 Mar 2024 10:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qb7zZnMk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FA410E703
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 10:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710584087; x=1742120087;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Kr9XyN1BcJNx8ud6k8+lAqKYYVwHrFUQFkqpwFyswy8=;
 b=Qb7zZnMkttoaoH8n13ztU1573avUl8Ns0+YRQ4S7IGtcL0Ws/KycLcns
 jHFjOU8iqpZM8nw62uUYhi8IeRqyap8pg58A60BZyb4DHnVfBvKjK5vA+
 WTcTNs/kzZbd7MkF/V4TvwHYX5xQ1KFxeLyEyagV0geXM1+sLD8rUpphi
 rf07coZbZsJ2+4kY3msDU09nt5npDYydRonkPvCG5hp2EEzpk1IEPVq5L
 Cing0G/cSbR21L6blJTJc/qeafXeBE0OFoHqrnMorT1WWqbmwpvO6JuQI
 MP1Lgo3DJBBhSAS9T1zpMKUYuKbr58v7JSAan2uFRp/y9m5D0jyjA5DH4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16600458"
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; d="scan'208";a="16600458"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2024 03:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; d="scan'208";a="13014277"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 16 Mar 2024 03:14:42 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rlR3o-000FJl-1o;
 Sat, 16 Mar 2024 10:14:40 +0000
Date: Sat, 16 Mar 2024 18:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH 6/6] drm: zynqmp_dp: Add debugfs interface for compliance
 testing
Message-ID: <202403161704.ACHJdSJG-lkp@intel.com>
References: <20240315230916.1759060-7-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315230916.1759060-7-sean.anderson@linux.dev>
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

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.8]
[cannot apply to drm-misc/drm-misc-next linus/master next-20240315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/drm-zynqmp_dp-Downgrade-log-level-for-aux-retries-message/20240316-071208
base:   v6.8
patch link:    https://lore.kernel.org/r/20240315230916.1759060-7-sean.anderson%40linux.dev
patch subject: [PATCH 6/6] drm: zynqmp_dp: Add debugfs interface for compliance testing
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240316/202403161704.ACHJdSJG-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161704.ACHJdSJG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161704.ACHJdSJG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/zynqmp_dp.c: In function 'zynqmp_dp_bridge_debugfs_init':
>> drivers/gpu/drm/xlnx/zynqmp_dp.c:2168:31: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
    2168 |                 sprintf(name, fmt, i);
         |                               ^~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:2168:17: note: 'sprintf' output between 18 and 20 bytes into a destination of size 19
    2168 |                 sprintf(name, fmt, i);
         |                 ^~~~~~~~~~~~~~~~~~~~~


vim +/sprintf +2168 drivers/gpu/drm/xlnx/zynqmp_dp.c

  2136	
  2137	DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_rate, zynqmp_dp_rate_get,
  2138				 zynqmp_dp_rate_set, "%llu\n");
  2139	
  2140	static void zynqmp_dp_bridge_debugfs_init(struct drm_bridge *bridge,
  2141						  struct dentry *root)
  2142	{
  2143		struct zynqmp_dp *dp = bridge_to_dp(bridge);
  2144		struct dentry *test;
  2145		int i;
  2146	
  2147		dp->test.bw_code = DP_LINK_BW_5_4;
  2148		dp->test.link_cnt = dp->num_lanes;
  2149	
  2150		test = debugfs_create_dir("test", root);
  2151	#define CREATE_FILE(name) \
  2152		debugfs_create_file(#name, 0600, test, dp, &fops_zynqmp_dp_##name)
  2153		CREATE_FILE(pattern);
  2154		CREATE_FILE(enhanced);
  2155		CREATE_FILE(downspread);
  2156		CREATE_FILE(active);
  2157		CREATE_FILE(custom);
  2158		CREATE_FILE(rate);
  2159		CREATE_FILE(lanes);
  2160	
  2161		for (i = 0; i < dp->num_lanes; i++) {
  2162			static const char fmt[] = "lane%d_preemphasis";
  2163			char name[sizeof(fmt)];
  2164	
  2165			dp->debugfs_train_set[i].dp = dp;
  2166			dp->debugfs_train_set[i].lane = i;
  2167	
> 2168			sprintf(name, fmt, i);
  2169			debugfs_create_file(name, 0600, test,
  2170					    &dp->debugfs_train_set[i],
  2171					    &fops_zynqmp_dp_preemphasis);
  2172	
  2173			sprintf(name, "lane%d_swing", i);
  2174			debugfs_create_file(name, 0600, test,
  2175					    &dp->debugfs_train_set[i],
  2176					    &fops_zynqmp_dp_swing);
  2177		}
  2178	}
  2179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
