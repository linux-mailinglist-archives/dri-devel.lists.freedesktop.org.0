Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC353786682
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 06:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF9710E4E0;
	Thu, 24 Aug 2023 04:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8436A10E4E0;
 Thu, 24 Aug 2023 04:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692850387; x=1724386387;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8DGmYpo5e1+4XY98tv7NyzBwr148Xio3UFlCxazJQUg=;
 b=J3P3KGmprcF25yhDR4it+Md4M/roNOdMq0rgLbIyiOg7Ss4djbxTelCE
 jEI0L5bsG6EXOQc5e6b+eKAJwmNzf4SBaKf7E67QGlSYPblPijvI6xmcT
 ttBG//wSjZWnFLBg38Gw/TFR7dhaEwaira8TR9je2gXkX5mBwIQBQXFKr
 chIUnXu52mcHmkBThDNZgC7j49qImahlX4m0c6buWinF0AI8Hw9uYNQrF
 TWHgWNlVftUPyd3oVSKz3d1H0oIrArnolgNAf8VS2pjTOYxtYB67HLG+v
 KGJcv9mK1h7hPE48J+cLB6GyQlDVGuKtDKuF8g5TRa/1rxL7LnBGKsiUf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="353883744"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="353883744"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 21:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="851313291"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="851313291"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 23 Aug 2023 21:13:01 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qZ1iP-0001ke-08;
 Thu, 24 Aug 2023 04:13:01 +0000
Date: Thu, 24 Aug 2023 12:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
Subject: Re: [PATCH v2 2/6] drm/panfrost: Add fdinfo support GPU load metrics
Message-ID: <202308241240.ngAywBMr-lkp@intel.com>
References: <20230824013604.466224-3-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230824013604.466224-3-adrian.larumbe@collabora.com>
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
patch link:    https://lore.kernel.org/r/20230824013604.466224-3-adrian.larumbe%40collabora.com
patch subject: [PATCH v2 2/6] drm/panfrost: Add fdinfo support GPU load metrics
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230824/202308241240.ngAywBMr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241240.ngAywBMr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241240.ngAywBMr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/panfrost/panfrost_drv.c: In function 'panfrost_gpu_show_fdinfo':
>> drivers/gpu/drm/panfrost/panfrost_drv.c:551:50: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'long unsigned int' [-Wformat=]
     551 |                 drm_printf(p, "drm-curfreq-%s:\t%u Hz\n",
         |                                                 ~^
         |                                                  |
         |                                                  unsigned int
         |                                                 %lu
     552 |                            ei->name, pfdev->pfdevfreq.current_frequency);
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                      |
         |                                                      long unsigned int


vim +551 drivers/gpu/drm/panfrost/panfrost_drv.c

   534	
   535	
   536	static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
   537					     struct panfrost_file_priv *panfrost_priv,
   538					     struct drm_printer *p)
   539	{
   540		int i;
   541	
   542		for (i = 0; i < NUM_JOB_SLOTS - 1; i++) {
   543			struct engine_info *ei = &panfrost_priv->fdinfo.engines[i];
   544	
   545			drm_printf(p, "drm-engine-%s:\t%llu ns\n",
   546				   ei->name, ei->elapsed_ns);
   547			drm_printf(p, "drm-cycles-%s:\t%llu\n",
   548				   ei->name, ei->cycles);
   549			drm_printf(p, "drm-maxfreq-%s:\t%u Hz\n",
   550				   ei->name, panfrost_priv->fdinfo.maxfreq);
 > 551			drm_printf(p, "drm-curfreq-%s:\t%u Hz\n",
   552				   ei->name, pfdev->pfdevfreq.current_frequency);
   553		}
   554	}
   555	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
