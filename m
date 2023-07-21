Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BC775D10F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 20:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DB310E6E0;
	Fri, 21 Jul 2023 18:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC8F10E6E0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 18:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689962840; x=1721498840;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ftzKxyeE1YgehaHuy61AcU/z7PNQcwtQedEeNHLH3Ds=;
 b=jFBnOsEqRFbHC2ihnS+/khOImJbX5KoVyqWSejndM6DfA3S1mNzsFTRm
 uoxj7Vb9OoJp317Ziu6tBRPoI1FPbt7NiJ2PRzv6j78okDSaX/hrEL7Jw
 gb4BpCSS11TPKvdHX8fvVWXSV0xArKSve5CaFWKwizkfx366JwyZT+A46
 n8t0w8XhiBcki98LjnjLh3cjXZikty2rikIMWgW0bN4gb/y7bM6v7u/u7
 NF/aFesBROm6Ii/1OrrNtKhw5KDqCX2HI+UTR0xXlpRn2NzXIUTxvyxab
 WamKs/SzfBr4vMixZbhbU6dh7HCpdH0W+Db2uQJTCeY6aJ4Vzp+tK6RsU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="357078812"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="357078812"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 11:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="848902542"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="848902542"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 21 Jul 2023 11:07:17 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qMuX5-0007W1-2o;
 Fri, 21 Jul 2023 18:07:15 +0000
Date: Sat, 22 Jul 2023 02:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: Erik Kurzinger <ekurzinger@nvidia.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/syncobj: add
 DRM_IOCTL_SYNCOBJ_IMPORT/EXPORT_SYNC_FILE
Message-ID: <202307220102.hq8N9hIr-lkp@intel.com>
References: <a09e38a6-5ac3-75c1-eadd-38a265e0ae33@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a09e38a6-5ac3-75c1-eadd-38a265e0ae33@nvidia.com>
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
Cc: James Jones <jajones@nvidia.com>, Austin Shafer <ashafer@nvidia.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Erik,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip next-20230721]
[cannot apply to drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.5-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Erik-Kurzinger/drm-syncobj-add-DRM_IOCTL_SYNCOBJ_IMPORT-EXPORT_SYNC_FILE/20230722-003446
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/a09e38a6-5ac3-75c1-eadd-38a265e0ae33%40nvidia.com
patch subject: [PATCH v2] drm/syncobj: add DRM_IOCTL_SYNCOBJ_IMPORT/EXPORT_SYNC_FILE
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230722/202307220102.hq8N9hIr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220102.hq8N9hIr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220102.hq8N9hIr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_syncobj.c: In function 'drm_syncobj_fd_to_handle_ioctl':
>> drivers/gpu/drm/drm_syncobj.c:922:71: error: expected ')' before numeric constant
     922 |                                                           args->handle
         |                                                                       ^
         |                                                                       )
     923 |                                                           0 /* binary */);
         |                                                           ~            
   drivers/gpu/drm/drm_syncobj.c:920:58: note: to match this '('
     920 |                 return drm_syncobj_import_sync_file_fence(file_private,
         |                                                          ^
>> drivers/gpu/drm/drm_syncobj.c:920:24: error: too few arguments to function 'drm_syncobj_import_sync_file_fence'
     920 |                 return drm_syncobj_import_sync_file_fence(file_private,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:745:12: note: declared here
     745 | static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +922 drivers/gpu/drm/drm_syncobj.c

   902	
   903	int
   904	drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
   905					   struct drm_file *file_private)
   906	{
   907		struct drm_syncobj_handle *args = data;
   908	
   909		if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
   910			return -EOPNOTSUPP;
   911	
   912		if (args->pad)
   913			return -EINVAL;
   914	
   915		if (args->flags != 0 &&
   916		    args->flags != DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
   917			return -EINVAL;
   918	
   919		if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
 > 920			return drm_syncobj_import_sync_file_fence(file_private,
   921								  args->fd,
 > 922								  args->handle
   923								  0 /* binary */);
   924	
   925		return drm_syncobj_fd_to_handle(file_private, args->fd,
   926						&args->handle);
   927	}
   928	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
