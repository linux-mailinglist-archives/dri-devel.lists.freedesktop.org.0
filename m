Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD3679E813
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 14:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA5F10E4B2;
	Wed, 13 Sep 2023 12:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427E088D18;
 Wed, 13 Sep 2023 12:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694608310; x=1726144310;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HrD1kau9wT3KEsqQTKdQ+/wu8yACK1Fs2bkBjLcV3V0=;
 b=bWCzpCPWxoSt5jLFA7fO6gfKiYNOBwcGTa1Ws+9Fa5H9MdcqXuDDSoLI
 DwM6Qnm7+cc2LSYUcxWpbmBhOV2cqZPKWLtfoawq1iue7YsaNb/7B/OzM
 A3u7Qua/+Tx+84n7oASOW3vGcw6IoYobqW6mgpTfYb81dlaW27fkuyjwo
 hD5Lgv6kK0EL4RTSjE+RUGp12ThD2W1MX+Hg40vq5ogvkDPHLk2gfneug
 1RaXpvTHn9jE+vzwG3nFt/MhkqLL9ErnXnQg7nZdkNOy1+cmWnAzcr2hw
 lK+RU2lvcKhx41hfGpnHbKH1ZkxKRsfKTLT/gQGP3o0rtSb6mrwzk600e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="375975564"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="375975564"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 05:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779171258"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="779171258"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 13 Sep 2023 05:31:44 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qgP1x-000034-0k;
 Wed, 13 Sep 2023 12:31:41 +0000
Date: Wed, 13 Sep 2023 20:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 04/13] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY
 scheduling policy
Message-ID: <202309132041.76l2uKon-lkp@intel.com>
References: <20230912021615.2086698-5-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912021615.2086698-5-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, mcanal@igalia.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 oe-kbuild-all@lists.linux.dev, Liviu.Dudau@arm.com, luben.tuikov@amd.com,
 boris.brezillon@collabora.com, donald.robson@imgtec.com,
 Matthew Brost <matthew.brost@intel.com>, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.6-rc1 next-20230913]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Add-drm_sched_submit_-helpers/20230912-102001
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20230912021615.2086698-5-matthew.brost%40intel.com
patch subject: [PATCH v3 04/13] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
reproduce: (https://download.01.org/0day-ci/archive/20230913/202309132041.76l2uKon-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309132041.76l2uKon-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/drm-mm:552: ./drivers/gpu/drm/scheduler/sched_main.c:52: WARNING: Enumerated list ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
