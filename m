Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5306846522
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 01:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EE010ED9A;
	Fri,  2 Feb 2024 00:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K21xhU1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8135010ED9A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 00:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706834825; x=1738370825;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=+j8LMO+IOP+7vD7y30g/kDTaUgyz087tpiGgG1uwfXo=;
 b=K21xhU1RhCZgEQR19Blz08WWQ8LY2LdIqYbdoegrlDI5qdiHK8a76dAJ
 SCK2KEjjGFSGnujA7my3Mo6jzW6ijo45juhGJgkQ+f1uoEza2Dq/ivLyZ
 rCRPMGPp9lT3YFTjwlh2t8cJwR97zihQSHU5wWUe/TyNK4CafqkC/lKha
 UkGwkt//VUReBjJCGmObUr9kXEEFF7EaQ8nxmpXYk5+U/HmlQ4AafNjc7
 d/V66e4tbetqBPatOqzyJrmUzhDBQosFjtAF/TNxekP9akBYQiRxUmyhk
 WHbLJ0Pqx7KgCD9DVlVHIl/vA1fFWtKQ8AYHI/8WdTi9g4WpSu7/Z99AM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="2977654"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="2977654"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 16:46:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="30756783"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 01 Feb 2024 16:46:50 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rVhhe-0003Pi-24;
 Fri, 02 Feb 2024 00:46:46 +0000
Date: Fri, 2 Feb 2024 08:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Subject: [drm-misc:drm-misc-next 2/6]
 drivers/gpu/drm/drm_managed.c:200:22-24: WARNING !A || A && B is equivalent
 to !A || B
Message-ID: <202402020855.4Fsjr97a-lkp@intel.com>
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
head:   041261ac4c365e03b07427569d6735f8adfd21c8
commit: 42d6196f6a948aaecfedf72326925dcbd054f9db [2/6] drm/managed: Add drmm_release_action
config: x86_64-randconfig-103-20240201 (https://download.01.org/0day-ci/archive/20240202/202402020855.4Fsjr97a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402020855.4Fsjr97a-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_managed.c:200:22-24: WARNING !A || A && B is equivalent to !A || B

vim +200 drivers/gpu/drm/drm_managed.c

   178	
   179	/**
   180	 * drmm_release_action - release a managed action from a &drm_device
   181	 * @dev: DRM device
   182	 * @action: function which would be called when @dev is released
   183	 * @data: opaque pointer, passed to @action
   184	 *
   185	 * This function calls the @action previously added by drmm_add_action()
   186	 * immediately.
   187	 * The @action is removed from the list of cleanup actions for @dev,
   188	 * which means that it won't be called in the final drm_dev_put().
   189	 */
   190	void drmm_release_action(struct drm_device *dev,
   191				 drmres_release_t action,
   192				 void *data)
   193	{
   194		struct drmres *dr_match = NULL, *dr;
   195		unsigned long flags;
   196	
   197		spin_lock_irqsave(&dev->managed.lock, flags);
   198		list_for_each_entry_reverse(dr, &dev->managed.resources, node.entry) {
   199			if (dr->node.release == action) {
 > 200				if (!data || (data && *(void **)dr->data == data)) {
   201					dr_match = dr;
   202					del_dr(dev, dr_match);
   203					break;
   204				}
   205			}
   206		}
   207		spin_unlock_irqrestore(&dev->managed.lock, flags);
   208	
   209		if (WARN_ON(!dr_match))
   210			return;
   211	
   212		action(dev, data);
   213	
   214		free_dr(dr_match);
   215	}
   216	EXPORT_SYMBOL(drmm_release_action);
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
