Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMDbNap3gGne8gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:08:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC16CA961
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9553110E40C;
	Mon,  2 Feb 2026 10:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDw2WQEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E6810E40B;
 Mon,  2 Feb 2026 10:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770026919; x=1801562919;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cCgG3dIux3x+xt02C17bJz27PWIwYr7tHK1Irige0qI=;
 b=YDw2WQEz5+dH62HBMtjsk/gcEsNVkw9HGRv9mR6HETnL+IviVd0DWmbR
 oUM8vZJBb6IzpTP/a0nlV+z5bIPWiG8uv40c3+jbs+q2v3IqW/1FkrnTq
 6k2lVN3PfYkIJrV/cO7n5nFPlZknt1t8M7csj4ToJoK9A8h2AmnXK68U1
 MDy4npID0HVOrYXonNlC6SPi5gPx6RSq9dNmu7qWeI1jxByL6QNbBIkbW
 1Nf8yNN/kvrI+E0bk/QpiFYsACxR5l9u29g/wz9tVOrWR5YWXtJYmQ3R/
 LRFVaNfw7sEaxUq+f9xGUzmBp1ZnKUHrHXUll5pe9G4/+MiIMnbwT0Nfy g==;
X-CSE-ConnectionGUID: Fb9kQGgFSQezNXnTzEso5A==
X-CSE-MsgGUID: Yi3C56tvS7KH+AIQjHxeMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="82289595"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="82289595"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 02:08:38 -0800
X-CSE-ConnectionGUID: 4A8P+vxkRfuBRuRzEds7GQ==
X-CSE-MsgGUID: M1aAK9y4RLq/kvZE4ISRrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209483479"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602)
 ([10.211.93.152])
 by orviesa008.jf.intel.com with ESMTP; 02 Feb 2026 02:08:34 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vmqr9-00000000345-1anf;
 Mon, 02 Feb 2026 10:08:31 +0000
Date: Mon, 2 Feb 2026 11:08:22 +0100
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v5 1/5] drm/ras: Introduce the DRM RAS infrastructure
 over generic netlink
Message-ID: <202602021142.G5vT8UkJ-lkp@intel.com>
References: <20260202064356.286243-8-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202064356.286243-8-riana.tauro@intel.com>
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,linux.intel.com,intel.com,ffwll.ch,gmail.com,oss.qualcomm.com,amd.com,kernel.org,redhat.com,google.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,git-scm.com:url,01.org:url,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 4BC16CA961
X-Rspamd-Action: no action

Hi Riana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm-misc/drm-misc-next drm/drm-next linus/master v6.16-rc1 next-20260130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Riana-Tauro/drm-ras-Introduce-the-DRM-RAS-infrastructure-over-generic-netlink/20260202-141553
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260202064356.286243-8-riana.tauro%40intel.com
patch subject: [PATCH v5 1/5] drm/ras: Introduce the DRM RAS infrastructure over generic netlink
reproduce: (https://download.01.org/0day-ci/archive/20260202/202602021142.G5vT8UkJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602021142.G5vT8UkJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/hdmi.h
   ERROR: Cannot find file ./include/linux/hdmi.h
   WARNING: No kernel-doc for file ./include/linux/hdmi.h
   WARNING: ./drivers/gpu/drm/scheduler/sched_main.c:367 function parameter 'result' not described in 'drm_sched_job_done'
   Documentation/gpu/drm-ras:39: ./drivers/gpu/drm/drm_ras.c:40: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/drm-ras:39: ./drivers/gpu/drm/drm_ras.c:41: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/drm-ras:39: ./drivers/gpu/drm/drm_ras.c:46: ERROR: Unexpected indentation. [docutils]
   Documentation/gpu/drm-ras:39: ./drivers/gpu/drm/drm_ras.c:59: ERROR: Unexpected indentation. [docutils]
   Documentation/gpu/drm-ras:39: ./drivers/gpu/drm/drm_ras.c:60: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/drm-uapi:607: ./drivers/gpu/drm/drm_ioctl.c:923: WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:69.
   Declaration is '.. c:function:: bool drm_ioctl_flags (unsigned int nr, unsigned int *flags)'. [duplicate_declaration.c]
--
   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/gpu/drm-ras.rst:59: WARNING: undefined label: 'documentation/netlink/specs/drm_ras.yaml' [ref.ref]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
