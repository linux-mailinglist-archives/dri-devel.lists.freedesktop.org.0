Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D736776F71
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 07:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8C910E154;
	Thu, 10 Aug 2023 05:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D37210E154
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 05:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691644623; x=1723180623;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EnSYzqifzvsagwFRy6FFx7PXyJJwVY1BT3a5fddqK50=;
 b=ZRObC8tfVviKL0lY3iKuKpQ/iqb/TXfI/bv4n+p5127/IBdqlHAF9ilk
 lafO0lsYMWPFoUk0PbaGpMPQp/D7I32g8IgR4HCMOylBMpAb+7eGpecAk
 Hjq2Q2JVswBaPNgEzfN0jN8TojPw9kA5mf8jNND0CmqHQfHbK+N+AHEnf
 eubZT836obYsdgdhuXgiCquM7hTioyMRM+a+v3/8FFHvIkLz/vUHkSIvy
 +WHOhzPe4NvqYn2Gh/LcB1VHyIlAk09QJ055QQTBBRBveRSt7YcHav3rD
 qSUDcQj97rwHWo6Gur5ysgvYdIpi/uyEx3Q8CY7mVKng08NqTJgg037sI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="457657721"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="457657721"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 22:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="978649917"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="978649917"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 09 Aug 2023 22:17:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qTy2d-0006ji-1L;
 Thu, 10 Aug 2023 05:16:59 +0000
Date: Thu, 10 Aug 2023 13:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net
Subject: Re: [PATCH 1/2] drm/panic: Add a drm panic handler
Message-ID: <202308101307.hbEyAamN-lkp@intel.com>
References: <20230809192514.158062-2-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809192514.158062-2-jfalempe@redhat.com>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6995e2de6891c724bfeb2db33d7b87775f913ad1]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-panic-Add-a-drm-panic-handler/20230810-032733
base:   6995e2de6891c724bfeb2db33d7b87775f913ad1
patch link:    https://lore.kernel.org/r/20230809192514.158062-2-jfalempe%40redhat.com
patch subject: [PATCH 1/2] drm/panic: Add a drm panic handler
config: nios2-randconfig-r011-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101307.hbEyAamN-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101307.hbEyAamN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101307.hbEyAamN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_panic.c:246:6: warning: no previous prototype for 'drm_panic_init_client' [-Wmissing-prototypes]
     246 | void drm_panic_init_client(struct drm_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_panic.c:272:6: warning: no previous prototype for 'drm_panic_init' [-Wmissing-prototypes]
     272 | void drm_panic_init(void)
         |      ^~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_panic.c:282:6: warning: no previous prototype for 'drm_panic_exit' [-Wmissing-prototypes]
     282 | void drm_panic_exit(void)
         |      ^~~~~~~~~~~~~~
--
>> drivers/gpu/drm/drm_panic.c:28: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This module displays a user friendly message on screen when a kernel panic
   drivers/gpu/drm/drm_panic.c:36: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * List of drm clients
>> drivers/gpu/drm/drm_panic.c:283: warning: expecting prototype for drm_log_exit(). Prototype was for drm_panic_exit() instead


vim +/drm_panic_init_client +246 drivers/gpu/drm/drm_panic.c

   245	
 > 246	void drm_panic_init_client(struct drm_device *dev)
   247	{
   248		struct dpanic_drm_client *new;
   249		int ret;
   250	
   251		new = kzalloc(sizeof(*new), GFP_KERNEL);
   252		if (!new)
   253			return;
   254	
   255		ret = drm_client_init(dev, &new->client, "drm_panic", NULL);
   256		if (ret < 0) {
   257			kfree(new);
   258			return;
   259		}
   260		drm_client_register(&new->client);
   261		list_add_tail(&new->head, &dpanic_clients);
   262	
   263		drm_info(dev, "Registered with drm panic\n");
   264	}
   265	EXPORT_SYMBOL(drm_panic_init_client);
   266	
   267	/**
   268	 * drm_panic_init() - Initialize drm-panic subsystem
   269	 *
   270	 * register the panic notifier
   271	 */
 > 272	void drm_panic_init(void)
   273	{
   274		/* register panic handler */
   275		atomic_notifier_chain_register(&panic_notifier_list,
   276					       &drm_panic_notifier);
   277	}
   278	
   279	/**
   280	 * drm_log_exit() - Shutdown drm-panic subsystem
   281	 */
 > 282	void drm_panic_exit(void)
 > 283	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
