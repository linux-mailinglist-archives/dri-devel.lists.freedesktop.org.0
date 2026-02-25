Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE+QEH3hnmmCXgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:48:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE11196D82
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7528B10E742;
	Wed, 25 Feb 2026 11:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRKG9pyF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F5310E742
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772020089; x=1803556089;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=UpnA8wtNVColnP+f6tGOCuVaaBcr00UgkeO41u0tBoE=;
 b=eRKG9pyFXqbK59fo01Qk6OVL1Vl19sgyf8kROOKCR2QWE3+ShQlDfzA7
 zHZIlz/KdgB1SN7DKW4OqEwcN950IiM0UMBOFaRR20RyjiSf0LgZLFAXb
 HT8HqtxVYravukrzyhxK5o61I16BUo9aH8XK3aXnwAO06r8FrvsE2nWrZ
 +r6V9fhl2h+eiZkUMzrxv8e6No19hvLzRRC1V6InqQaIeVOGIe0Gf+ojP
 j4VJco3kfAuJjnDSp/79jtSer8aD7X80oTXf7UUxaTH0RZ2sUkYI/U8BE
 PtB1/yrCHh6Zv8mVWuRvTR8us79wrYdaBd1tfu06jMoDQYYIbxN3t+Mj2 g==;
X-CSE-ConnectionGUID: twaDn90IRQ2FyCYTUIbTiA==
X-CSE-MsgGUID: GuZCm4rcSFSIpz0Jp8lfsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="60628196"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="60628196"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 03:48:09 -0800
X-CSE-ConnectionGUID: RKjEh+oaSsqDS9nrJz0DFg==
X-CSE-MsgGUID: OqEJDItzQUeoERxXGHJmaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="220816248"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 25 Feb 2026 03:48:07 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vvDN7-000000005UZ-0wjf;
 Wed, 25 Feb 2026 11:48:05 +0000
Date: Wed, 25 Feb 2026 19:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: [drm-misc:for-linux-next 4/13]
 drivers/gpu/drm/i915/selftests/i915_active.c:326:28: error: 'struct
 dma_fence' has no member named 'lock'
Message-ID: <202602251941.3vqWv8ra-lkp@intel.com>
User-Agent: s-nail v14.9.25
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:oe-kbuild-all@lists.linux.dev,m:bbrezillon@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,01.org:url,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 9CE11196D82
X-Rspamd-Action: no action

Hi Christian,

First bad commit (maybe != root cause):

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git for-linux-next
head:   2622649ad6cdbb3e77bfafc8c0fe686090b77f70
commit: 1f32f310a13c9fb67a9993ab67f596b3f960206f [4/13] dma-buf: inline spinlock for fence protection v5
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260225/202602251941.3vqWv8ra-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602251941.3vqWv8ra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602251941.3vqWv8ra-lkp@intel.com/

Note: the drm-misc/for-linux-next HEAD 2622649ad6cdbb3e77bfafc8c0fe686090b77f70 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_active.c:1177:
   drivers/gpu/drm/i915/selftests/i915_active.c: In function 'active_flush':
>> drivers/gpu/drm/i915/selftests/i915_active.c:326:28: error: 'struct dma_fence' has no member named 'lock'
     326 |         spin_lock_irq(fence->lock);
         |                            ^~
   drivers/gpu/drm/i915/selftests/i915_active.c:328:30: error: 'struct dma_fence' has no member named 'lock'
     328 |         spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
         |                              ^~


vim +326 drivers/gpu/drm/i915/selftests/i915_active.c

38813767c7c5d9 Chris Wilson 2019-11-01  316  
e3e7aeec3281af Chris Wilson 2020-03-06  317  static void active_flush(struct i915_active *ref,
e3e7aeec3281af Chris Wilson 2020-03-06  318  			 struct i915_active_fence *active)
e3e7aeec3281af Chris Wilson 2020-03-06  319  {
e3e7aeec3281af Chris Wilson 2020-03-06  320  	struct dma_fence *fence;
e3e7aeec3281af Chris Wilson 2020-03-06  321  
e3e7aeec3281af Chris Wilson 2020-03-06  322  	fence = xchg(__active_fence_slot(active), NULL);
e3e7aeec3281af Chris Wilson 2020-03-06  323  	if (!fence)
e3e7aeec3281af Chris Wilson 2020-03-06  324  		return;
e3e7aeec3281af Chris Wilson 2020-03-06  325  
e3e7aeec3281af Chris Wilson 2020-03-06 @326  	spin_lock_irq(fence->lock);
e3e7aeec3281af Chris Wilson 2020-03-06  327  	__list_del_entry(&active->cb.node);
e3e7aeec3281af Chris Wilson 2020-03-06  328  	spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
e3e7aeec3281af Chris Wilson 2020-03-06  329  	atomic_dec(&ref->count);
e3e7aeec3281af Chris Wilson 2020-03-06  330  
e3e7aeec3281af Chris Wilson 2020-03-06  331  	GEM_BUG_ON(!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags));
e3e7aeec3281af Chris Wilson 2020-03-06  332  }
e3e7aeec3281af Chris Wilson 2020-03-06  333  

:::::: The code at line 326 was first introduced by commit
:::::: e3e7aeec3281af446d7410d6982020e1aa5795fc drm/i915/selftests: Apply a heavy handed flush to i915_active

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
