Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA646BCE19
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 12:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB67810E0A3;
	Thu, 16 Mar 2023 11:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6879A10E0A3;
 Thu, 16 Mar 2023 11:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678965933; x=1710501933;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FwHW50/xG6xGlvXZlh91opwVyZcLXNs3iGsUuI10i5A=;
 b=R8Wm5XQFmm5O7RDOgQII0dp0h6febLEw2x4PtqeeJ3gT8wT2rZo3ZcFw
 V2FJ7FmRhRE3YHIp2FJ/zbSBUf6dWLdLJxG8ZPIHGvKAlTGpVAA9lAs0B
 gNDdArJs084oV+uxvK58bBTH5zjfXj6U2gcJDqnfhzuZF1j8CK1RG5CX8
 HhTjoCZp0hdoHwOspZ+NjNxLUzBkkcSQXRrxzIVOUJ/FEt6qUaEH74MGW
 HzvRHd0Co7OCshlgUrcL0g9O+W9KyjVzSXf4fjN5rQx736AgZuSXOnMdP
 Rc4uSONfwnU6HHN/pcq/iu3xGSMi2fzxzNmhO+nq0LXIiptID9e4QnuPn A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="339487384"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="339487384"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 04:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="1009186213"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="1009186213"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 16 Mar 2023 04:25:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pcljc-0008Ug-2A;
 Thu, 16 Mar 2023 11:25:28 +0000
Date: Thu, 16 Mar 2023 19:24:49 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 mcanal@igalia.com, stanislaw.gruszka@linux.intel.com,
 ogabbay@kernel.org, quic_jhugo@quicinc.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, mwen@igalia.com, maxime@cerno.tech,
 wambui.karugax@gmail.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 7/7] drm/debugfs: remove debugfs_root pointer from minor
Message-ID: <202303161920.xBWFRr94-lkp@intel.com>
References: <20230316082035.567520-8-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230316082035.567520-8-christian.koenig@amd.com>
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
Cc: oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next-fixes linus/master v6.3-rc2]
[cannot apply to drm-tip/drm-tip drm-intel/for-linux-next tegra/for-next next-20230316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-tegra-allow-compile-test-on-ARM/20230316-172205
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230316082035.567520-8-christian.koenig%40amd.com
patch subject: [PATCH 7/7] drm/debugfs: remove debugfs_root pointer from minor
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230316/202303161920.xBWFRr94-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/70b21b15c200ec426c806bf2aa03083e3b19dd41
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-K-nig/drm-tegra-allow-compile-test-on-ARM/20230316-172205
        git checkout 70b21b15c200ec426c806bf2aa03083e3b19dd41
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161920.xBWFRr94-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/msm_debugfs.c: In function 'msm_debugfs_init':
>> drivers/gpu/drm/msm/msm_debugfs.c:329:58: error: 'struct drm_minor' has no member named 'debugfs_root'
     329 |         gpu_devfreq = debugfs_create_dir("devfreq", minor->debugfs_root);
         |                                                          ^~


vim +329 drivers/gpu/drm/msm/msm_debugfs.c

edcd60ce243d16 Rob Clark                 2016-03-16  303  
7ce84471e3c72e Wambui Karuga             2020-03-10  304  void msm_debugfs_init(struct drm_minor *minor)
edcd60ce243d16 Rob Clark                 2016-03-16  305  {
edcd60ce243d16 Rob Clark                 2016-03-16  306  	struct drm_device *dev = minor->dev;
bc5289eed48176 Rob Clark                 2016-10-26  307  	struct msm_drm_private *priv = dev->dev_private;
6563f60f14cbb3 Rob Clark                 2023-01-10  308  	struct dentry *gpu_devfreq;
edcd60ce243d16 Rob Clark                 2016-03-16  309  
9e2fd463ec346d Wambui Karuga             2020-03-10  310  	drm_debugfs_create_files(msm_debugfs_list,
edcd60ce243d16 Rob Clark                 2016-03-16  311  				 ARRAY_SIZE(msm_debugfs_list),
70b21b15c200ec Christian König           2023-03-16  312  				 minor->dev->debugfs_root, minor);
edcd60ce243d16 Rob Clark                 2016-03-16  313  
70b21b15c200ec Christian König           2023-03-16  314  	debugfs_create_file("gpu", S_IRUSR, minor->dev->debugfs_root,
4f776f4511c7f7 Jordan Crouse             2018-07-24  315  		dev, &msm_gpu_fops);
4f776f4511c7f7 Jordan Crouse             2018-07-24  316  
70b21b15c200ec Christian König           2023-03-16  317  	debugfs_create_file("kms", S_IRUSR, minor->dev->debugfs_root,
c1760555884b7f Rob Clark                 2021-12-15  318  		dev, &msm_kms_fops);
c1760555884b7f Rob Clark                 2021-12-15  319  
70b21b15c200ec Christian König           2023-03-16  320  	debugfs_create_u32("hangcheck_period_ms", 0600, minor->dev->debugfs_root,
1d2fa58e0dda33 Samuel Iglesias Gonsalvez 2021-06-07  321  		&priv->hangcheck_period);
1d2fa58e0dda33 Samuel Iglesias Gonsalvez 2021-06-07  322  
70b21b15c200ec Christian König           2023-03-16  323  	debugfs_create_bool("disable_err_irq", 0600, minor->dev->debugfs_root,
5edf2750d998b7 Rob Clark                 2021-11-09  324  		&priv->disable_err_irq);
5edf2750d998b7 Rob Clark                 2021-11-09  325  
70b21b15c200ec Christian König           2023-03-16  326  	debugfs_create_file("shrink", S_IRWXU, minor->dev->debugfs_root,
5434941fd45d30 Rob Clark                 2021-06-14  327  		dev, &shrink_fops);
5434941fd45d30 Rob Clark                 2021-06-14  328  
6563f60f14cbb3 Rob Clark                 2023-01-10 @329  	gpu_devfreq = debugfs_create_dir("devfreq", minor->debugfs_root);
6563f60f14cbb3 Rob Clark                 2023-01-10  330  
6563f60f14cbb3 Rob Clark                 2023-01-10  331  	debugfs_create_bool("idle_clamp",0600, gpu_devfreq,
6563f60f14cbb3 Rob Clark                 2023-01-10  332  			    &priv->gpu_clamp_to_idle);
6563f60f14cbb3 Rob Clark                 2023-01-10  333  
6563f60f14cbb3 Rob Clark                 2023-01-10  334  	debugfs_create_u32("upthreshold",0600, gpu_devfreq,
6563f60f14cbb3 Rob Clark                 2023-01-10  335  			   &priv->gpu_devfreq_config.upthreshold);
6563f60f14cbb3 Rob Clark                 2023-01-10  336  
6563f60f14cbb3 Rob Clark                 2023-01-10  337  	debugfs_create_u32("downdifferential",0600, gpu_devfreq,
6563f60f14cbb3 Rob Clark                 2023-01-10  338  			   &priv->gpu_devfreq_config.downdifferential);
6563f60f14cbb3 Rob Clark                 2023-01-10  339  
7ce84471e3c72e Wambui Karuga             2020-03-10  340  	if (priv->kms && priv->kms->funcs->debugfs_init)
7ce84471e3c72e Wambui Karuga             2020-03-10  341  		priv->kms->funcs->debugfs_init(priv->kms, minor);
6d29709de8028c Rob Clark                 2022-08-07  342  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
