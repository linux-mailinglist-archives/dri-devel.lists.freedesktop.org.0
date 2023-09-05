Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7E1792D12
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 20:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A3410E289;
	Tue,  5 Sep 2023 18:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242BF10E289
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 18:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693937257; x=1725473257;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=aUInnwLHb7exRxtFfT0u84+kK3+fanxPrmSN3O21Ypk=;
 b=iuopA8VdZ2XHiJuQXSglwkqpGXW8frVnaWd70AOgy9JpiQJ1JcufUYo1
 5aNwaZtQiIOCPxu5ZvePESEhuKDEUfkqfeInDako28EjnyJqfGNcHPFY/
 n15DNIU2AspWSJKGy1z6jpJMpTNuK2ySTHFy9YNxyRM3gW8zCAOpRgW3a
 yixmcAvD1EXSrW/fk0F8qfLOa4ZeIoMoXOzzW99V48xpu4fhQJ0h2jFHN
 hz76KEVqUPgfm2/zZeNKhqPFKZaiXUt7AyhieEGMutysVmsIY+4rOGpjU
 US5m0T6KIhNHXXYQ5JFMFn1fB6M3pS45YKx3zjU58aBUEgT6EjhuBiNA4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="374259508"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="374259508"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 11:07:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="1072065537"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="1072065537"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 05 Sep 2023 11:07:33 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qdaSS-0001wN-37;
 Tue, 05 Sep 2023 18:07:27 +0000
Date: Wed, 6 Sep 2023 02:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: [drm-misc:drm-misc-next 3/3] drivers/gpu/drm/tegra/dsi.c:259:43:
 error: passing argument 3 of 'drm_debugfs_remove_files' from incompatible
 pointer type
Message-ID: <202309060212.6xvtSNAB-lkp@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   f45acf7acf75921c0409d452f0165f51a19a74fd
commit: 8e455145d8f163aefa6b9cc29478e0a9f82276e6 [3/3] drm/debugfs: rework drm_debugfs_create_files implementation v2
config: openrisc-randconfig-r015-20230906 (https://download.01.org/0day-ci/archive/20230906/202309060212.6xvtSNAB-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060212.6xvtSNAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060212.6xvtSNAB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tegra/dsi.c: In function 'tegra_dsi_early_unregister':
>> drivers/gpu/drm/tegra/dsi.c:259:43: error: passing argument 3 of 'drm_debugfs_remove_files' from incompatible pointer type [-Werror=incompatible-pointer-types]
     259 |                                  connector->debugfs_entry,
         |                                  ~~~~~~~~~^~~~~~~~~~~~~~~
         |                                           |
         |                                           struct dentry *
   In file included from drivers/gpu/drm/tegra/dsi.c:21:
   include/drm/drm_debugfs.h:163:73: note: expected 'struct drm_minor *' but argument is of type 'struct dentry *'
     163 |                                            int count, struct drm_minor *minor)
         |                                                       ~~~~~~~~~~~~~~~~~~^~~~~
>> drivers/gpu/drm/tegra/dsi.c:258:9: error: too many arguments to function 'drm_debugfs_remove_files'
     258 |         drm_debugfs_remove_files(dsi->debugfs_files, count,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_debugfs.h:162:19: note: declared here
     162 | static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/tegra/dc.c: In function 'tegra_dc_early_unregister':
>> drivers/gpu/drm/tegra/dc.c:1757:60: error: passing argument 3 of 'drm_debugfs_remove_files' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1757 |         drm_debugfs_remove_files(dc->debugfs_files, count, root, minor);
         |                                                            ^~~~
         |                                                            |
         |                                                            struct dentry *
   In file included from drivers/gpu/drm/tegra/dc.c:27:
   include/drm/drm_debugfs.h:163:73: note: expected 'struct drm_minor *' but argument is of type 'struct dentry *'
     163 |                                            int count, struct drm_minor *minor)
         |                                                       ~~~~~~~~~~~~~~~~~~^~~~~
>> drivers/gpu/drm/tegra/dc.c:1757:9: error: too many arguments to function 'drm_debugfs_remove_files'
    1757 |         drm_debugfs_remove_files(dc->debugfs_files, count, root, minor);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_debugfs.h:162:19: note: declared here
     162 | static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/tegra/hdmi.c: In function 'tegra_hdmi_early_unregister':
>> drivers/gpu/drm/tegra/hdmi.c:1120:43: error: passing argument 3 of 'drm_debugfs_remove_files' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1120 |                                  connector->debugfs_entry, minor);
         |                                  ~~~~~~~~~^~~~~~~~~~~~~~~
         |                                           |
         |                                           struct dentry *
   In file included from drivers/gpu/drm/tegra/hdmi.c:26:
   include/drm/drm_debugfs.h:163:73: note: expected 'struct drm_minor *' but argument is of type 'struct dentry *'
     163 |                                            int count, struct drm_minor *minor)
         |                                                       ~~~~~~~~~~~~~~~~~~^~~~~
>> drivers/gpu/drm/tegra/hdmi.c:1119:9: error: too many arguments to function 'drm_debugfs_remove_files'
    1119 |         drm_debugfs_remove_files(hdmi->debugfs_files, count,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_debugfs.h:162:19: note: declared here
     162 | static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/tegra/sor.c: In function 'tegra_sor_early_unregister':
>> drivers/gpu/drm/tegra/sor.c:1711:43: error: passing argument 3 of 'drm_debugfs_remove_files' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1711 |                                  connector->debugfs_entry,
         |                                  ~~~~~~~~~^~~~~~~~~~~~~~~
         |                                           |
         |                                           struct dentry *
   In file included from drivers/gpu/drm/tegra/sor.c:22:
   include/drm/drm_debugfs.h:163:73: note: expected 'struct drm_minor *' but argument is of type 'struct dentry *'
     163 |                                            int count, struct drm_minor *minor)
         |                                                       ~~~~~~~~~~~~~~~~~~^~~~~
>> drivers/gpu/drm/tegra/sor.c:1710:9: error: too many arguments to function 'drm_debugfs_remove_files'
    1710 |         drm_debugfs_remove_files(sor->debugfs_files, count,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_debugfs.h:162:19: note: declared here
     162 | static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/drm_debugfs_remove_files +259 drivers/gpu/drm/tegra/dsi.c

   251	
   252	static void tegra_dsi_early_unregister(struct drm_connector *connector)
   253	{
   254		struct tegra_output *output = connector_to_output(connector);
   255		unsigned int count = ARRAY_SIZE(debugfs_files);
   256		struct tegra_dsi *dsi = to_dsi(output);
   257	
 > 258		drm_debugfs_remove_files(dsi->debugfs_files, count,
 > 259					 connector->debugfs_entry,
   260					 connector->dev->primary);
   261		kfree(dsi->debugfs_files);
   262		dsi->debugfs_files = NULL;
   263	}
   264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
