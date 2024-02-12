Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02F6851ED5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 21:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5224B10E195;
	Mon, 12 Feb 2024 20:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dofZfdfp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5EC10E195
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 20:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707770813; x=1739306813;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=43rYMnzoKxs+g1rFQoFJuws32YY+vCTRr/KVq4oGhIQ=;
 b=dofZfdfpMdvkzxFMpyHaHXctWsCejCxINiTz2IncY6+dOMZ8hdvrKEiC
 aO/S0K3UkSC+CogTv/gBObRU+HNfEHGLOCzTM8WgruMdXP8ePInG1iAcE
 l4t9atoL+AMqL3acKPqS6XrINNRhTapX7hwSw5VqBph36cwPK8wF9Jtng
 trLfbOHttpTJyVpBS17Jc48C4pjNsthCanNktlieCYdKgGoU01XR9PrT0
 yxdkZ1yqT+FvVDyZoYT7l9I0J6pTqi5lnbKgROQMCMQzMpvrnG2TDFCzp
 e0YlXMI0sr2aworlmA4vtwSjdFSYg5kZRfPe8ckXd8ghum+caI/1Aur35 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27210515"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; d="scan'208";a="27210515"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 12:46:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="7321571"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 12 Feb 2024 12:46:51 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rZdCS-0007ME-37;
 Mon, 12 Feb 2024 20:46:48 +0000
Date: Tue, 13 Feb 2024 04:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Luca Coelho <luciano.coelho@intel.com>
Subject: [drm-misc:for-linux-next 40/49]
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:317:48: error: passing argument
 1 of 'drm_err_printer' from incompatible pointer type
Message-ID: <202402130446.4SBrCdZH-lkp@intel.com>
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
head:   247f2ee4498cfcaf18b3c3486dffd2302d56fc17
commit: 5e0c04c8c40b69ab165d52964433859d8b666376 [40/49] drm/print: make drm_err_printer() device specific by using drm_err()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240213/202402130446.4SBrCdZH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402130446.4SBrCdZH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402130446.4SBrCdZH-lkp@intel.com/

Note: the drm-misc/for-linux-next HEAD 247f2ee4498cfcaf18b3c3486dffd2302d56fc17 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c: In function 'xe_gt_tlb_invalidation_wait':
>> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:317:48: error: passing argument 1 of 'drm_err_printer' from incompatible pointer type [-Werror=incompatible-pointer-types]
     317 |         struct drm_printer p = drm_err_printer(__func__);
         |                                                ^~~~~~~~
         |                                                |
         |                                                const char *
   In file included from include/drm/ttm/ttm_resource.h:34,
                    from include/drm/ttm/ttm_device.h:30,
                    from drivers/gpu/drm/xe/xe_device_types.h:13,
                    from drivers/gpu/drm/xe/xe_device.h:15,
                    from drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:9:
   include/drm/drm_print.h:247:69: note: expected 'struct drm_device *' but argument is of type 'const char *'
     247 | static inline struct drm_printer drm_err_printer(struct drm_device *drm,
         |                                                  ~~~~~~~~~~~~~~~~~~~^~~
>> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:317:32: error: too few arguments to function 'drm_err_printer'
     317 |         struct drm_printer p = drm_err_printer(__func__);
         |                                ^~~~~~~~~~~~~~~
   include/drm/drm_print.h:247:34: note: declared here
     247 | static inline struct drm_printer drm_err_printer(struct drm_device *drm,
         |                                  ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/drm_err_printer +317 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c

a9351846d94568 Matthew Brost  2023-01-17  302  
c6b0948ff8d084 Matthew Brost  2023-01-20  303  /**
c6b0948ff8d084 Matthew Brost  2023-01-20  304   * xe_gt_tlb_invalidation_wait - Wait for TLB to complete
c6b0948ff8d084 Matthew Brost  2023-01-20  305   * @gt: graphics tile
c6b0948ff8d084 Matthew Brost  2023-01-20  306   * @seqno: seqno to wait which was returned from xe_gt_tlb_invalidation
c6b0948ff8d084 Matthew Brost  2023-01-20  307   *
c6b0948ff8d084 Matthew Brost  2023-01-20  308   * Wait for 200ms for a TLB invalidation to complete, in practice we always
c6b0948ff8d084 Matthew Brost  2023-01-20  309   * should receive the TLB invalidation within 200ms.
c6b0948ff8d084 Matthew Brost  2023-01-20  310   *
c6b0948ff8d084 Matthew Brost  2023-01-20  311   * Return: 0 on success, -ETIME on TLB invalidation timeout
c6b0948ff8d084 Matthew Brost  2023-01-20  312   */
a9351846d94568 Matthew Brost  2023-01-17  313  int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
a9351846d94568 Matthew Brost  2023-01-17  314  {
a9351846d94568 Matthew Brost  2023-01-17  315  	struct xe_device *xe = gt_to_xe(gt);
a9351846d94568 Matthew Brost  2023-01-17  316  	struct xe_guc *guc = &gt->uc.guc;
ebb00b285bef8b Pallavi Mishra 2023-11-01 @317  	struct drm_printer p = drm_err_printer(__func__);
a9351846d94568 Matthew Brost  2023-01-17  318  	int ret;
a9351846d94568 Matthew Brost  2023-01-17  319  
a9351846d94568 Matthew Brost  2023-01-17  320  	/*
a9351846d94568 Matthew Brost  2023-01-17  321  	 * XXX: See above, this algorithm only works if seqno are always in
a9351846d94568 Matthew Brost  2023-01-17  322  	 * order
a9351846d94568 Matthew Brost  2023-01-17  323  	 */
a9351846d94568 Matthew Brost  2023-01-17  324  	ret = wait_event_timeout(guc->ct.wq,
a9351846d94568 Matthew Brost  2023-01-17  325  				 tlb_invalidation_seqno_past(gt, seqno),
38224c00d9c284 Matthew Brost  2023-01-24  326  				 TLB_TIMEOUT);
a9351846d94568 Matthew Brost  2023-01-17  327  	if (!ret) {
a5cecbac92d5a5 Nirmoy Das     2023-05-05  328  		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
a5cecbac92d5a5 Nirmoy Das     2023-05-05  329  			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
ebb00b285bef8b Pallavi Mishra 2023-11-01  330  		xe_guc_ct_print(&guc->ct, &p, true);
a9351846d94568 Matthew Brost  2023-01-17  331  		return -ETIME;
a9351846d94568 Matthew Brost  2023-01-17  332  	}
a9351846d94568 Matthew Brost  2023-01-17  333  
a9351846d94568 Matthew Brost  2023-01-17  334  	return 0;
a9351846d94568 Matthew Brost  2023-01-17  335  }
a9351846d94568 Matthew Brost  2023-01-17  336  

:::::: The code at line 317 was first introduced by commit
:::::: ebb00b285bef8bcdc46ac4e344d5748539bdd213 drm/xe: Dump CTB during TLB timeout

:::::: TO: Pallavi Mishra <pallavi.mishra@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
