Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DD57DC704
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 08:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0223910E40B;
	Tue, 31 Oct 2023 07:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A823010E40B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 07:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698736492; x=1730272492;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=liUdIdIGIx2wKIEr2EN1EyrxZocBOurqsuzRDZYIzp0=;
 b=X2f+scN0p8Cs62Sdwp6CFBo1c2h44eRP2AR4F2ebcqUmogqlOrFcUaPQ
 JyzWE95nsP6+D62Hjec9YBdYFU2CTKVDkGQDJakfl8tIW6FgW7vq+Q8Dd
 rVq6Xe5j5uQ08wHiXB2R3e8Sn+QQCZOYfKKmJBr3L8lU3H9KMGC4PTK5W
 tcp/Lm/Nic/j1NzMiqJR90Djtf95fxXKLXkKsMXfx0aE8UnDhNTPxAP6r
 qJOW7H7p/m4Hj10MwiWOEPvnvhv6De47BAjgbEpLm8uPExb1Nn+Rrqqqs
 Kq7QXZQMG+K0Mj8wJ49wKyBs9iNGIr6wD/91vGCsy/ng+DAsaFgJRlhiD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="367574483"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="367574483"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 00:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="710338098"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="710338098"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 31 Oct 2023 00:14:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qxixT-000Du3-1X;
 Tue, 31 Oct 2023 07:14:39 +0000
Date: Tue, 31 Oct 2023 15:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net, luben.tuikov@amd.com
Subject: Re: [PATCH drm-misc-next v4] drm/sched: implement dynamic job-flow
 control
Message-ID: <202310311534.I8WQWOK0-lkp@intel.com>
References: <20231031002655.38707-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031002655.38707-1-dakr@redhat.com>
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

kernel test robot noticed the following build errors:

[auto build test ERROR on b2139fb5051554a7f297e4ad584ef1bc26c76d5d]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-sched-implement-dynamic-job-flow-control/20231031-082915
base:   b2139fb5051554a7f297e4ad584ef1bc26c76d5d
patch link:    https://lore.kernel.org/r/20231031002655.38707-1-dakr%40redhat.com
patch subject: [PATCH drm-misc-next v4] drm/sched: implement dynamic job-flow control
config: arc-randconfig-002-20231031 (https://download.01.org/0day-ci/archive/20231031/202310311534.I8WQWOK0-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311534.I8WQWOK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311534.I8WQWOK0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panfrost/panfrost_job.c: In function 'panfrost_job_is_idle':
>> drivers/gpu/drm/panfrost/panfrost_job.c:966:52: error: 'struct drm_gpu_scheduler' has no member named 'hw_rq_count'
     966 |                 if (atomic_read(&js->queue[i].sched.hw_rq_count))
         |                                                    ^


vim +966 drivers/gpu/drm/panfrost/panfrost_job.c

f3ba91228e8e91 Rob Herring 2018-09-10  958  
f3ba91228e8e91 Rob Herring 2018-09-10  959  int panfrost_job_is_idle(struct panfrost_device *pfdev)
f3ba91228e8e91 Rob Herring 2018-09-10  960  {
f3ba91228e8e91 Rob Herring 2018-09-10  961  	struct panfrost_job_slot *js = pfdev->js;
f3ba91228e8e91 Rob Herring 2018-09-10  962  	int i;
f3ba91228e8e91 Rob Herring 2018-09-10  963  
f3ba91228e8e91 Rob Herring 2018-09-10  964  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
f3ba91228e8e91 Rob Herring 2018-09-10  965  		/* If there are any jobs in the HW queue, we're not idle */
f3ba91228e8e91 Rob Herring 2018-09-10 @966  		if (atomic_read(&js->queue[i].sched.hw_rq_count))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
