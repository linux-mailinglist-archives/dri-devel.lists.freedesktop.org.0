Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK3lDZlse2mMEgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 15:20:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B80B0DB4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 15:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDE610E334;
	Thu, 29 Jan 2026 14:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COY+I1LN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE88110E330;
 Thu, 29 Jan 2026 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769696404; x=1801232404;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=apqALf2mZvnFPwFAMX3pLXqSOd6RTvU3jT7r+/TFQCQ=;
 b=COY+I1LN/5i3LdC7YO1hmlFv5Ltx+PoDkdyLfwZth3PfSylc0HHigq0/
 4KpVsnmDQ9Ik2W8tpTssXe0NmFvHTwHUmFoiIgFek6M4Ky6tjTzCD3tQP
 05HlInzZrfuHsA2ttcFYCfTkIrEVsOQAlCTQstjFi9McHsqsb2hW9weba
 m/8Hs5YRROXRGK3dQH9mn8AZLMulICeqw4E6enBnxgI0GQZbaj5DKJcW7
 ajK3twchq3wmtp9cSorMesZNakDq1xYBmBNBZgFHJBS7IrRpAuSU+wzuo
 1mkgJO+IK1qKHwplkFQ7UikmYXYfdu16NUDqMt3YGX3rKdf+TMs4iBOr7 A==;
X-CSE-ConnectionGUID: GgSVWZJ+Q+epaziioHOH0Q==
X-CSE-MsgGUID: v8WLJIqKQXG2KZkkHW0W4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70831091"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70831091"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 06:20:03 -0800
X-CSE-ConnectionGUID: +fIWDTCtRX+Rd9/3zT4Q+Q==
X-CSE-MsgGUID: cHu1RMjnT+SWuLKUdUN45Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208829978"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 29 Jan 2026 06:19:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vlSsE-00000000bXM-42xH;
 Thu, 29 Jan 2026 14:19:54 +0000
Date: Thu, 29 Jan 2026 22:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org,
 harry.wentland@amd.com, uma.shankar@intel.com,
 louis.chauvet@bootlin.com, naveen1.kumar@intel.com,
 ramya.krishna.yella@intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v8 2/7] drm/atomic: Add error_code element in atomic_state
Message-ID: <202601292223.hq35FrBc-lkp@intel.com>
References: <20260129-atomic-v8-2-4cb7b0faa051@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-atomic-v8-2-4cb7b0faa051@intel.com>
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,ursulin.net,kde.org,amd.com,bootlin.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E0B80B0DB4
X-Rspamd-Action: no action

Hi Arun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6a3c9a03d943eb112c916c7419a837bc7de3a296]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-R-Murthy/drm-Define-user-readable-error-codes-for-atomic-ioctl/20260129-170325
base:   6a3c9a03d943eb112c916c7419a837bc7de3a296
patch link:    https://lore.kernel.org/r/20260129-atomic-v8-2-4cb7b0faa051%40intel.com
patch subject: [PATCH v8 2/7] drm/atomic: Add error_code element in atomic_state
config: hexagon-randconfig-001-20260129 (https://download.01.org/0day-ci/archive/20260129/202601292223.hq35FrBc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601292223.hq35FrBc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601292223.hq35FrBc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_atomic.c:2119 function parameter 'format' not described in 'drm_mode_atomic_add_error_msg'
>> Warning: drivers/gpu/drm/drm_atomic.c:2119 function parameter 'format' not described in 'drm_mode_atomic_add_error_msg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
