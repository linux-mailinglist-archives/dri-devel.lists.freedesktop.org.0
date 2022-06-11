Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E870547235
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 07:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AD911BF9C;
	Sat, 11 Jun 2022 05:23:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6013D11BF9B;
 Sat, 11 Jun 2022 05:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654924985; x=1686460985;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2Gsfa6/pnPDSaSI8IhymqyxGEgQ1H6vDrxW6HhskKls=;
 b=jiMcigtqhEow0jKXhHeC1cSWc6qbyL7pofCk/lxKhzb8jjNkW2swmc01
 2xBthGbZpLt/GLtEG7G+BypAnkRo3geHHeq4ajAh+b2QspGCIoswscZUt
 jaqpwOmNrIY3K9OXDxoaLP1DQ+eie87jIiiZOBYb9UPU2I5l/8x+6o5CC
 4Hc1r4fjtmJGGBYVo076aB7NZaXNqpBi/ZZZ2aIvLBZRozUb0CWSkuvy7
 NnYl/G83lcGRwW1mX/xeZZq9gA9VQJnAQNsCSaM+7PZM/qzPe388IMw5v
 KfMLRok3bcRwBUScJAK5eKiwCDVgN2AOP12y6mcm3VZPD4Ml7tN7jtlza Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="276609627"
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; d="scan'208";a="276609627"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 22:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; d="scan'208";a="616793128"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 10 Jun 2022 22:23:03 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nztaQ-000IZb-Jn;
 Sat, 11 Jun 2022 05:23:02 +0000
Date: Sat, 11 Jun 2022 13:22:10 +0800
From: kernel test robot <lkp@intel.com>
To: John.C.Harrison@intel.com, Intel-GFX@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/guc: Use drm_err instead of pr_err
Message-ID: <202206111316.zDpQcjgJ-lkp@intel.com>
References: <20220607215103.3342267-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607215103.3342267-1-John.C.Harrison@Intel.com>
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
Cc: kbuild-all@lists.01.org, DRI-Devel@lists.freedesktop.org,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.19-rc1]
[also build test ERROR on next-20220610]
[cannot apply to drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/John-C-Harrison-Intel-com/drm-i915-guc-Use-drm_err-instead-of-pr_err/20220608-055315
base:    f2906aa863381afb0015a9eb7fefad885d4e5a56
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220611/202206111316.zDpQcjgJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/66426324c5bb1a53dd401b7d781c3c9c58f163d5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review John-C-Harrison-Intel-com/drm-i915-guc-Use-drm_err-instead-of-pr_err/20220608-055315
        git checkout 66426324c5bb1a53dd401b7d781c3c9c58f163d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4956:
   drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c: In function '__intel_guc_multi_lrc_basic':
>> drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c:121:17: error: implicit declaration of function 'drm_debug'; did you mean 'pr_debug'? [-Werror=implicit-function-declaration]
     121 |                 drm_debug(&gt->i915->drm, "Not enough engines in class: %d", class);
         |                 ^~~~~~~~~
         |                 pr_debug
   cc1: all warnings being treated as errors


vim +121 drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c

   109	
   110	static int __intel_guc_multi_lrc_basic(struct intel_gt *gt, unsigned int class)
   111	{
   112		struct intel_context *parent;
   113		struct i915_request *rq;
   114		int ret;
   115	
   116		parent = multi_lrc_create_parent(gt, class, 0);
   117		if (IS_ERR(parent)) {
   118			drm_err(&gt->i915->drm, "Failed creating contexts: %ld", PTR_ERR(parent));
   119			return PTR_ERR(parent);
   120		} else if (!parent) {
 > 121			drm_debug(&gt->i915->drm, "Not enough engines in class: %d", class);
   122			return 0;
   123		}
   124	
   125		rq = multi_lrc_nop_request(parent);
   126		if (IS_ERR(rq)) {
   127			ret = PTR_ERR(rq);
   128			drm_err(&gt->i915->drm, "Failed creating requests: %d", ret);
   129			goto out;
   130		}
   131	
   132		ret = intel_selftest_wait_for_rq(rq);
   133		if (ret)
   134			drm_err(&gt->i915->drm, "Failed waiting on request: %d", ret);
   135	
   136		i915_request_put(rq);
   137	
   138		if (ret >= 0) {
   139			ret = intel_gt_wait_for_idle(gt, HZ * 5);
   140			if (ret < 0)
   141				drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
   142		}
   143	
   144	out:
   145		multi_lrc_context_unpin(parent);
   146		multi_lrc_context_put(parent);
   147		return ret;
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
