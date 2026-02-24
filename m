Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBiyObxRnWkoOgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:22:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7784F182F20
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C419310E1BC;
	Tue, 24 Feb 2026 07:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KfA1cHpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341D010E1BC
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771917753; x=1803453753;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=H7xvRs46WVjFjBCia44dxiLos3oa4E9iIzpo2oCziks=;
 b=KfA1cHpYGietzsamST5Yf/J/hrEPCLeTFztXmcp99zFEuXc7CHHkQFJP
 YpK2xHnaG66IR9vvK5WPQ118DrEJlXDf+b1Ch9GoGc+vicyA7aLnXBI0U
 Iou0I4rL40sLen11MPWVkc0yfMpNnjRaDcBey8pUQNxWOYm8hotzhFzzH
 TPa3NFgMu6/JD4BPiqNYLIOk497wpH7IvSdiHCm4gmjzhHmRCnK5ww3IY
 XRPTumul9nGIkRSFQSvUtyIJvKWkAyhpkW1zcPjxyWOR6mUvhgR9W4s8K
 gsMH7ZDo1m+CCdMhdJ09DVlZsX9L0zD6sBcifFozlwp7OZHOHffgsWFDm A==;
X-CSE-ConnectionGUID: dHyX8kZuSayK4dV/bjAktA==
X-CSE-MsgGUID: iXE3aUVcQoGW0PttRsDYUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90508138"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="90508138"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 23:22:32 -0800
X-CSE-ConnectionGUID: u4l+lXbnRX2a6gbqx20FQQ==
X-CSE-MsgGUID: S3A+ZFQTREKrbohJgUeJZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215976313"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
 by orviesa007.jf.intel.com with ESMTP; 23 Feb 2026 23:22:30 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vumjP-000000001cD-2xWh;
 Tue, 24 Feb 2026 07:21:45 +0000
Date: Tue, 24 Feb 2026 15:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [PATCH 07/16] memcg: add support for GPU page counters. (v4)
Message-ID: <202602241519.EVW5jcey-lkp@intel.com>
References: <20260224020854.791201-8-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224020854.791201-8-airlied@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:tj@kernel.org,m:christian.koenig@amd.com,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:roman.gushchin@linux.dev,m:shakeel.butt@linux.dev,m:muchun.song@linux.dev,m:oe-kbuild-all@lists.linux.dev,m:cgroups@vger.kernel.org,m:david@fromorbit.com,m:longman@redhat.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,kernel.org,amd.com,cmpxchg.org,linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email,gitlab.freedesktop.org:url,git-scm.com:url]
X-Rspamd-Queue-Id: 7784F182F20
X-Rspamd-Action: no action

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.0-rc1 next-20260223]
[cannot apply to akpm-mm/mm-everything drm-xe/drm-xe-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/drm-ttm-use-gpu-mm-stats-to-track-gpu-memory-allocations-v4/20260224-112019
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260224020854.791201-8-airlied%40gmail.com
patch subject: [PATCH 07/16] memcg: add support for GPU page counters. (v4)
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260224/202602241519.EVW5jcey-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602241519.EVW5jcey-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241519.EVW5jcey-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/memcontrol.c:5216 function parameter 'page' not described in 'mem_cgroup_move_gpu_page_reclaim'
>> Warning: mm/memcontrol.c:5216 function parameter 'order' not described in 'mem_cgroup_move_gpu_page_reclaim'
>> Warning: mm/memcontrol.c:5216 expecting prototype for mem_cgroup_move_gpu_reclaim(). Prototype was for mem_cgroup_move_gpu_page_reclaim() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
