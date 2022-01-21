Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B8A4959A0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 06:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D896310E2A6;
	Fri, 21 Jan 2022 05:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5D010E588;
 Fri, 21 Jan 2022 05:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642744596; x=1674280596;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zpNm2Ggem8XpBfHfA1dmrV91N9MOBYjEMGPmDHp5OUc=;
 b=I7AVbg6mBjXjfG9LDaLxvGClz5wTZYRGQxjmgU81FdMhp63nx1ARMocV
 m+WOWI1ThywL2sNC89zUGkwpbrGC5KaHFDwWNFBIAXIP2+mrbGbX9/1pR
 7QmvVY3YUCr4Vxr5Ty7vOEiRhlTOmezTkSpJs5XSUHkk/s9wBmOD5KtDq
 HO5p8Ny0lxo6PDJ7GNa8Sf+n6meciiSbfZhbitRk/sG/aCIZa4x5ruIL1
 Iqv/bppM0HY/blMK0sA+DWEtBWvcSNSBxlSaUMD8/DGYNJ91C857uvdKx
 sBceOXrQLWTZQ3eb3RaJeDF9Oiiw7aDsUK4aG5cGgp2KsyZcogaW5L3gp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="225552604"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="225552604"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:56:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="626622213"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 20 Jan 2022 21:56:33 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nAmuX-000EyX-5X; Fri, 21 Jan 2022 05:56:33 +0000
Date: Fri, 21 Jan 2022 13:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Don't check CT descriptor
 status before CT write / read
Message-ID: <202201211310.Npkld1YY-lkp@intel.com>
References: <20220120182413.8074-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120182413.8074-1-matthew.brost@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthew,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next v5.16 next-20220121]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Matthew-Brost/drm-i915-guc-Don-t-check-CT-descriptor-status-before-CT-write-read/20220121-023033
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: i386-randconfig-a005-20220117 (https://download.01.org/0day-ci/archive/20220121/202201211310.Npkld1YY-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0311a8b0f99c50ab1a666a5cdbe2b1a0a2c3c71d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Matthew-Brost/drm-i915-guc-Don-t-check-CT-descriptor-status-before-CT-write-read/20220121-023033
        git checkout 0311a8b0f99c50ab1a666a5cdbe2b1a0a2c3c71d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:469:1: error: unused label 'corrupted' [-Werror,-Wunused-label]
   corrupted:
   ^~~~~~~~~~
   1 error generated.


vim +/corrupted +469 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c

f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  422  
1d407096002beca drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2018-03-26  423  	/*
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  424  	 * dw0: CT header (including fence)
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  425  	 * dw1: HXG header (including action code)
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  426  	 * dw2+: action data
f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  427  	 */
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  428  	header = FIELD_PREP(GUC_CTB_MSG_0_FORMAT, GUC_CTB_FORMAT_HXG) |
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  429  		 FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  430  		 FIELD_PREP(GUC_CTB_MSG_0_FENCE, fence);
f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  431  
1681924d8bdeb24 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-07-08  432  	type = (flags & INTEL_GUC_CT_SEND_NB) ? GUC_HXG_TYPE_EVENT :
1681924d8bdeb24 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-07-08  433  		GUC_HXG_TYPE_REQUEST;
1681924d8bdeb24 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-07-08  434  	hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |
1681924d8bdeb24 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-07-08  435  		FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
1681924d8bdeb24 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-07-08  436  			   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  437  
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  438  	CT_DEBUG(ct, "writing (tail %u) %*ph %*ph %*ph\n",
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  439  		 tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);
0a015ff9730c169 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2018-03-26  440  
f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  441  	cmds[tail] = header;
f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  442  	tail = (tail + 1) % size;
f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  443  
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  444  	cmds[tail] = hxg;
f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  445  	tail = (tail + 1) % size;
f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  446  
f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  447  	for (i = 1; i < len; i++) {
f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  448  		cmds[tail] = action[i];
f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  449  		tail = (tail + 1) % size;
f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  450  	}
4c22abfbcb8456d drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2020-01-20  451  	GEM_BUG_ON(tail > size);
f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  452  
d35ca600873eebc drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-06-02  453  	/*
d35ca600873eebc drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-06-02  454  	 * make sure H2G buffer update and LRC tail update (if this triggering a
d35ca600873eebc drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-06-02  455  	 * submission) are visible before updating the descriptor tail
d35ca600873eebc drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-06-02  456  	 */
6b540bf6f14362a drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-10-14  457  	intel_guc_write_barrier(ct_to_guc(ct));
d35ca600873eebc drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-06-02  458  
75452167a2794c3 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-07-08  459  	/* update local copies */
75452167a2794c3 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-07-08  460  	ctb->tail = tail;
f4eb1f3fe94683c drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-07-21  461  	GEM_BUG_ON(atomic_read(&ctb->space) < len + GUC_CTB_HDR_LEN);
f4eb1f3fe94683c drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-07-21  462  	atomic_sub(len + GUC_CTB_HDR_LEN, &ctb->space);
75452167a2794c3 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Matthew Brost    2021-07-08  463  
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  464  	/* now update descriptor */
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  465  	WRITE_ONCE(desc->tail, tail);
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  466  
f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  467  	return 0;
4c22abfbcb8456d drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2020-01-20  468  
4c22abfbcb8456d drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2020-01-20 @469  corrupted:
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  470  	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  471  		 desc->head, desc->tail, desc->status);
572f2a5cd9742c5 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2021-06-15  472  	ctb->broken = true;
4c22abfbcb8456d drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c Michal Wajdeczko 2020-01-20  473  	return -EPIPE;
f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  474  }
f8a58d639dd95b0 drivers/gpu/drm/i915/intel_guc_ct.c       Michal Wajdeczko 2017-05-26  475  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
