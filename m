Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD67589AD0B
	for <lists+dri-devel@lfdr.de>; Sat,  6 Apr 2024 23:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FD110F467;
	Sat,  6 Apr 2024 21:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjTStRtP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEC110F467
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Apr 2024 21:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712438874; x=1743974874;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=2b0Nr3gYJ0JwKErKfy/BhcuaCFAxl4R9PEkoCmiww3c=;
 b=jjTStRtPaMAPV4Carl07pI+HXw8c+shl6hpxCFjLJVWqyFELFAjkgowD
 WuJb7H9YvjGvBcKWhn0KMceDfN4E9lKLxQFbfQZ9coi7Gyj5517re4HXe
 /XdRnK1F+1rmBnNsxqHgffB4o7MAL/RI8+vUGGzpU/UIjm1epaJ0oPgnU
 16ETyAci6aES69TqJYI3v4xcIQ+SM8LsmzfCcfYVdUnDfbUMGSAwa2cie
 FikVga3KZ5qdOjnKxabNxSRkS952sgFnfF3hks8Zlj8hcdn4OLz1uvnvl
 c0IBektlHP66pQVFhkhXiJJHej8oWyuc6VaxNBnWaPL6qDmMu/N+B3S/9 A==;
X-CSE-ConnectionGUID: +5ySfObCQUONef3suwde6A==
X-CSE-MsgGUID: yHD9NqsvSaqQZZiT96jA9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="19112407"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; d="scan'208";a="19112407"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2024 14:27:52 -0700
X-CSE-ConnectionGUID: KYxn87VZR120CWBkVPMQ/Q==
X-CSE-MsgGUID: QMf2aKdPTyigqXPXCtwPYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; d="scan'208";a="20034968"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 06 Apr 2024 14:27:50 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rtDZj-0003r0-1N;
 Sat, 06 Apr 2024 21:27:47 +0000
Date: Sun, 7 Apr 2024 05:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [drm-misc:for-linux-next 1/3]
 drivers/accel/qaic/qaic_debugfs.h:16:5: warning: no previous prototype for
 'qaic_bootlog_register'
Message-ID: <202404070542.VUa3Q4PZ-lkp@intel.com>
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

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   e495e523b888a6155f82c767d34c8d712a41ee54
commit: 5f8df5c6def641c164ed1b673d47a41fdd0013f8 [1/3] accel/qaic: Add bootlog debugfs
config: csky-randconfig-r113-20240407 (https://download.01.org/0day-ci/archive/20240407/202404070542.VUa3Q4PZ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240407/202404070542.VUa3Q4PZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070542.VUa3Q4PZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/accel/qaic/qaic_drv.c:31:
>> drivers/accel/qaic/qaic_debugfs.h:16:5: warning: no previous prototype for 'qaic_bootlog_register' [-Wmissing-prototypes]
      16 | int qaic_bootlog_register(void) { return 0; }
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/accel/qaic/qaic_debugfs.h:17:6: warning: no previous prototype for 'qaic_bootlog_unregister' [-Wmissing-prototypes]
      17 | void qaic_bootlog_unregister(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/accel/qaic/qaic_debugfs.h:18:6: warning: no previous prototype for 'qaic_debugfs_init' [-Wmissing-prototypes]
      18 | void qaic_debugfs_init(struct qaic_drm_device *qddev) {}
         |      ^~~~~~~~~~~~~~~~~


vim +/qaic_bootlog_register +16 drivers/accel/qaic/qaic_debugfs.h

    10	
    11	#ifdef CONFIG_DEBUG_FS
    12	int qaic_bootlog_register(void);
    13	void qaic_bootlog_unregister(void);
    14	void qaic_debugfs_init(struct qaic_drm_device *qddev);
    15	#else
  > 16	int qaic_bootlog_register(void) { return 0; }
  > 17	void qaic_bootlog_unregister(void) {}
  > 18	void qaic_debugfs_init(struct qaic_drm_device *qddev) {}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
