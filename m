Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKqLCU/PmWl6WwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 16:29:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56E16D2B0
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 16:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E15710E0A0;
	Sat, 21 Feb 2026 15:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZJVS4Ct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1629610E0C5
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 15:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771687754; x=1803223754;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4JjL0l+nLorUxDyMz8O1wmqKirNzDbDtAXWdXi0Ls+U=;
 b=nZJVS4CtTQ551KSDmChha+hE2HdPxxl6wjPzB2xFxY3E7qDB4XK2NVAx
 PvBv9ty95xmQ4c5djvdlVCuIR6Lx+UFoGl7amE2lTNDtXsZw8CbZbmy+y
 4WM0MKj4/LmY7JJm6+FuQSTVlQihrEe13SrPSITJ/KPGPxLl2238SoGH3
 7Xu5RjiDbS7rmelHJ0Evlo89VJ2SEsD/ba7YcNIo3bRCPIgiZ9hJr2RgJ
 +RpjS78iiBdEFfG0G7L7aF7LKEr28UELBiPyXiFVUPiduaoYwBBUGryFQ
 seqjFJLVJFROPQf1E8BZK2zuhqV06kdCNiocSVIJkwPCEEWOBvcvIpd29 w==;
X-CSE-ConnectionGUID: rLl2zdsFSOm/egyyWZK4+Q==
X-CSE-MsgGUID: jXRZ27irTvKO1miq7BXipg==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="60324291"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; d="scan'208";a="60324291"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2026 07:29:13 -0800
X-CSE-ConnectionGUID: nWVBhHZ8Q/2hQ5l00AfygQ==
X-CSE-MsgGUID: 5d11ktmXSq2b4fYgGqpTmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; d="scan'208";a="238074591"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 21 Feb 2026 07:29:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vtour-0000000150W-29yC;
 Sat, 21 Feb 2026 15:29:09 +0000
Date: Sat, 21 Feb 2026 23:28:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/8] dma-buf: detach fence ops on signal v2
Message-ID: <202602212322.qKZcoRK3-lkp@intel.com>
References: <20260219160822.1529-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219160822.1529-3-christian.koenig@amd.com>
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:oe-kbuild-all@lists.linux.dev,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,mailbox.org,intel.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,git-scm.com:url,01.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 8A56E16D2B0
X-Rspamd-Action: no action

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-xe/drm-xe-next linus/master v6.19 next-20260220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-detach-fence-ops-on-signal-v2/20260220-010804
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260219160822.1529-3-christian.koenig%40amd.com
patch subject: [PATCH 2/8] dma-buf: detach fence ops on signal v2
config: hexagon-randconfig-r121-20260221 (https://download.01.org/0day-ci/archive/20260221/202602212322.qKZcoRK3-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602212322.qKZcoRK3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602212322.qKZcoRK3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-fence.c:1051:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *timeline @@     got char * @@
   drivers/dma-buf/dma-fence.c:1051:38: sparse:     expected char const [noderef] __rcu *timeline
   drivers/dma-buf/dma-fence.c:1051:38: sparse:     got char *
   drivers/dma-buf/dma-fence.c:1052:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *driver @@     got char * @@
   drivers/dma-buf/dma-fence.c:1052:36: sparse:     expected char const [noderef] __rcu *driver
   drivers/dma-buf/dma-fence.c:1052:36: sparse:     got char *
   drivers/dma-buf/dma-fence.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/dma_fence.h):
   include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of noderef expression
   include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of noderef expression
>> drivers/dma-buf/dma-fence.c:379:19: sparse: sparse: dereference of noderef expression
   drivers/dma-buf/dma-fence.c:379:43: sparse: sparse: dereference of noderef expression

vim +379 drivers/dma-buf/dma-fence.c

   345	
   346	
   347	/**
   348	 * dma_fence_signal_timestamp_locked - signal completion of a fence
   349	 * @fence: the fence to signal
   350	 * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
   351	 *
   352	 * Signal completion for software callbacks on a fence, this will unblock
   353	 * dma_fence_wait() calls and run all the callbacks added with
   354	 * dma_fence_add_callback(). Can be called multiple times, but since a fence
   355	 * can only go from the unsignaled to the signaled state and not back, it will
   356	 * only be effective the first time. Set the timestamp provided as the fence
   357	 * signal timestamp.
   358	 *
   359	 * Unlike dma_fence_signal_timestamp(), this function must be called with
   360	 * &dma_fence.lock held.
   361	 */
   362	void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
   363					      ktime_t timestamp)
   364	{
   365		struct dma_fence_cb *cur, *tmp;
   366		struct list_head cb_list;
   367	
   368		lockdep_assert_held(fence->lock);
   369	
   370		if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
   371					      &fence->flags)))
   372			return;
   373	
   374		/*
   375		 * When neither a release nor a wait operation is specified set the ops
   376		 * pointer to NULL to allow the fence structure to become independent
   377		 * from who originally issued it.
   378		 */
 > 379		if (!fence->ops->release && !fence->ops->wait)
   380			RCU_INIT_POINTER(fence->ops, NULL);
   381	
   382		/* Stash the cb_list before replacing it with the timestamp */
   383		list_replace(&fence->cb_list, &cb_list);
   384	
   385		fence->timestamp = timestamp;
   386		set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
   387		trace_dma_fence_signaled(fence);
   388	
   389		list_for_each_entry_safe(cur, tmp, &cb_list, node) {
   390			INIT_LIST_HEAD(&cur->node);
   391			cur->func(fence, cur);
   392		}
   393	}
   394	EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
   395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
