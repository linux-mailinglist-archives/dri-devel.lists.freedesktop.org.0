Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8574BC29E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 23:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC64010ED79;
	Fri, 18 Feb 2022 22:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151CE10ED4D;
 Fri, 18 Feb 2022 22:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645223655; x=1676759655;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MbPPAnT0lnFEeCtqd3UkohahPnY60SHGwzsvC99IBUc=;
 b=kVRYREniaXUDfMNALPxZ48k5MTZ1mXyE1R0naLio4S3sdU+5kjHFbnfR
 vmco8MYJPdHAwi91zo6b7UQ/MXfAjexR/0KQQLqFirS+Cd0adX6uWS13m
 YP4dICnU/MdPMha1/1yfSoLeB/9fzP4Xe/6+zK8bnEiQn/P0YlgxprCDb
 ILrynhVK8fyLMiSD0oYpCX4IF+cHYKnhM8/lvI4LJPcEydSbOjRkuzk4W
 oU0kNrrACQSyuF0dstKje7B45k+3tMi9mSmWhozp3Odrz7G29lX9w/C1o
 GKmXxvwdHJy5b/3H1JUsMyCvlxEZbfuFhaBiZS5XZ5P/jr+V97YFXNhfL g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="238647643"
X-IronPort-AV: E=Sophos;i="5.88,380,1635231600"; d="scan'208";a="238647643"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 14:34:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,380,1635231600"; d="scan'208";a="572475539"
Received: from svaddara-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.147.37])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 14:34:13 -0800
Date: Fri, 18 Feb 2022 14:34:15 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [drm-intel:topic/core-for-CI 1/1]
 drivers/gpu/drm/i915/intel_device_info.c:236:14: error:
 'INTEL_SUBPLATFORM_G12' undeclared; did you mean 'INTEL_SUBPLATFORM_G10'?
Message-ID: <20220218223415.gjut5qik2iujd7db@ldmartin-desk2>
References: <202202171718.0GTDm2wX-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <202202171718.0GTDm2wX-lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 05:40:51PM +0800, kernel test robot wrote:
>tree:   git://anongit.freedesktop.org/drm-intel topic/core-for-CI
>head:   b56d8d7bad86a9badc1d1b9ea2d1730fa1d3978b
>commit: b56d8d7bad86a9badc1d1b9ea2d1730fa1d3978b [1/1] drm/i915: Add DG2 PCI IDs
>config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20220217/202202171718.0GTDm2wX-lkp@intel.com/config)
>compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
>reproduce (this is a W=1 build):
>        git remote add drm-intel git://anongit.freedesktop.org/drm-intel
>        git fetch --no-tags drm-intel topic/core-for-CI
>        git checkout b56d8d7bad86a9badc1d1b9ea2d1730fa1d3978b
>        # save the config file to linux build tree
>        mkdir build_dir
>        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
>
>If you fix the issue, kindly add following tag as appropriate
>Reported-by: kernel test robot <lkp@intel.com>
>
>All errors (new ones prefixed by >>):
>
>   In file included from include/linux/bits.h:6,
>                    from include/linux/ratelimit_types.h:5,
>                    from include/linux/printk.h:10,
>                    from include/drm/drm_print.h:30,
>                    from drivers/gpu/drm/i915/intel_device_info.c:25:
>   drivers/gpu/drm/i915/intel_device_info.c: In function 'intel_device_info_subplatform_init':
>>> drivers/gpu/drm/i915/intel_device_info.c:236:14: error: 'INTEL_SUBPLATFORM_G12' undeclared (first use in this function); did you mean 'INTEL_SUBPLATFORM_G10'?
>     236 |   mask = BIT(INTEL_SUBPLATFORM_G12);
>         |              ^~~~~~~~~~~~~~~~~~~~~

I rebased the topic/core-for-CI branch an in the process squashed a define for
INTEL_SUBPLATFORM_G12 to fix this.

Lucas De Marchi
