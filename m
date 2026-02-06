Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKNHKsw5hmmcLAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 19:58:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF52D102526
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 19:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CE210E8B4;
	Fri,  6 Feb 2026 18:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLHUOXi0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D1110E8B4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 18:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770404295; x=1801940295;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kdhHn1aU+LGwtdk0F6OxFjBYYCvDJR0wDI8x9Ze6Xws=;
 b=gLHUOXi0YR+vD3SY9eXMvC1zOd+CMSU31H0l5+L/BeWoEYB1C/TQgzDp
 sJKzWunBqgLsZconXZyXS4PkuFML4GY4Mq6bGnaYXDvsvX0hUMCB6Jrst
 lDeihAsjSzG9gJMF9T698vZvMUhb+ppkNp+HFv0RJEIXAiqSGNHLY817r
 6mCHj98RO6g1BiuJLWF2SFCinScJJ7aOMfVUmLWUHhsO+TaE1S5DpGzMk
 0x0OapJMTRs95s8V9+Wmts/UMusG0aaLGill8wr5pAtg+bRUBRAz5xLSj
 UhuqSOZ6URkO7MGJvLvofad387t1zsnNZ6G17ZcdG1z/y4UbWagdSEheP Q==;
X-CSE-ConnectionGUID: yq65rhnuTLWttxWpPmaR4Q==
X-CSE-MsgGUID: 9BhIX4LCTNu6mkHaBGjkfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="59185949"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="59185949"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:58:15 -0800
X-CSE-ConnectionGUID: ix9tU7lSS4SEwZI4qGpqTg==
X-CSE-MsgGUID: dAHJ53QVQPmPJDh0ZGYBLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="215128465"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 06 Feb 2026 10:58:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1voR1t-00000000l2e-0gvE;
 Fri, 06 Feb 2026 18:58:09 +0000
Date: Sat, 7 Feb 2026 02:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Frank Binns <frank.binns@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matt Coster <matt.coster@imgtec.com>
Subject: Re: [PATCH 1/2] drm/imagination: Define packed BVNCs in the uapi
Message-ID: <202602070204.PjaKNSpZ-lkp@intel.com>
References: <20260206-bvnc-cleanup-v1-1-f3c818541fbe@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-bvnc-cleanup-v1-1-f3c818541fbe@imgtec.com>
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
	FORGED_RECIPIENTS(0.00)[m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:oe-kbuild-all@lists.linux.dev,m:frank.binns@imgtec.com,m:brajesh.gupta@imgtec.com,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
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
	NEURAL_HAM(-0.00)[-0.988];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EF52D102526
X-Rspamd-Action: no action

Hi Matt,

kernel test robot noticed the following build errors:

[auto build test ERROR on 55473b60178060a4fdb4631bd0c91879cc7d18d8]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Coster/drm-imagination-Define-packed-BVNCs-in-the-uapi/20260206-175844
base:   55473b60178060a4fdb4631bd0c91879cc7d18d8
patch link:    https://lore.kernel.org/r/20260206-bvnc-cleanup-v1-1-f3c818541fbe%40imgtec.com
patch subject: [PATCH 1/2] drm/imagination: Define packed BVNCs in the uapi
config: riscv-randconfig-r112-20260206 (https://download.01.org/0day-ci/archive/20260207/202602070204.PjaKNSpZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070204.PjaKNSpZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070204.PjaKNSpZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/imagination/pvr_device.c: In function 'pvr_gpu_support_level':
>> drivers/gpu/drm/imagination/pvr_device.c:550:2: error: case label does not reduce to an integer constant
     550 |  case PVR_PACKED_BVNC(33, 15, 11, 3):
         |  ^~~~
   drivers/gpu/drm/imagination/pvr_device.c:551:2: error: case label does not reduce to an integer constant
     551 |  case PVR_PACKED_BVNC(36, 53, 104, 796):
         |  ^~~~
   drivers/gpu/drm/imagination/pvr_device.c:554:2: error: case label does not reduce to an integer constant
     554 |  case PVR_PACKED_BVNC(36, 52, 104, 182):
         |  ^~~~


vim +550 drivers/gpu/drm/imagination/pvr_device.c

1c21f240fbc1e4 Matt Coster 2026-01-13  545  
1c21f240fbc1e4 Matt Coster 2026-01-13  546  static enum pvr_gpu_support_level
1c21f240fbc1e4 Matt Coster 2026-01-13  547  pvr_gpu_support_level(const struct pvr_gpu_id *gpu_id)
1c21f240fbc1e4 Matt Coster 2026-01-13  548  {
1c21f240fbc1e4 Matt Coster 2026-01-13  549  	switch (pvr_gpu_id_to_packed_bvnc(gpu_id)) {
1c21f240fbc1e4 Matt Coster 2026-01-13 @550  	case PVR_PACKED_BVNC(33, 15, 11, 3):
1c21f240fbc1e4 Matt Coster 2026-01-13  551  	case PVR_PACKED_BVNC(36, 53, 104, 796):
1c21f240fbc1e4 Matt Coster 2026-01-13  552  		return PVR_GPU_SUPPORTED;
1c21f240fbc1e4 Matt Coster 2026-01-13  553  
1c21f240fbc1e4 Matt Coster 2026-01-13  554  	case PVR_PACKED_BVNC(36, 52, 104, 182):
1c21f240fbc1e4 Matt Coster 2026-01-13  555  		return PVR_GPU_EXPERIMENTAL;
1c21f240fbc1e4 Matt Coster 2026-01-13  556  
1c21f240fbc1e4 Matt Coster 2026-01-13  557  	default:
1c21f240fbc1e4 Matt Coster 2026-01-13  558  		return PVR_GPU_UNKNOWN;
1c21f240fbc1e4 Matt Coster 2026-01-13  559  	}
1c21f240fbc1e4 Matt Coster 2026-01-13  560  }
1c21f240fbc1e4 Matt Coster 2026-01-13  561  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
