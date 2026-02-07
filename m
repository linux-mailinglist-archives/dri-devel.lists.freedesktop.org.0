Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCk4FJi2h2k6cQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 23:03:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D4310744E
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 23:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C100089A1F;
	Sat,  7 Feb 2026 22:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFrqCZGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7387689A1F
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 22:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770501780; x=1802037780;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aGSHk5h8a4Od06LiU+U1O3nBJuXGoWX6fO+wbq/Ogvo=;
 b=CFrqCZGgoRW5dPSs7PlPcORDzkwONM2pRVs4cXQb3DcFK0NRmMQrKZRM
 BLCoFyzFUTHcKVslwl5qYn6S9Uwtjus3XYWqvY3SfRnbyTMVhu43XplTP
 SqS2VeG3G5FMH04dsmOkuOlwQMIPGl96xX5O3KtAiBX4ACWpk6KMZL8Xq
 wm16dA+7pyrfHPcYDzFtwjAKeqQBvKfjCofXbTg6VGmj0YfgJk/rME2VD
 pDeLOhmfz5+h/h1klYhsN8nPkC2blDCVYw1SmZtCsrcFpfsBZAF6vdEsJ
 caV+ZpAtM8iy8s6bj+VGlRKe99P0hCZQrs3zZoxUjs3hYghUINK/edQK8 g==;
X-CSE-ConnectionGUID: Oq80QwEOQCq4BF+3AYqvrg==
X-CSE-MsgGUID: 5S4A0tuhR/Swc1W1w84+8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="71568425"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; d="scan'208";a="71568425"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2026 14:03:00 -0800
X-CSE-ConnectionGUID: pyaCtHXAQ46+PFmUa4BY9A==
X-CSE-MsgGUID: 5qTiilBwSCCs3RiwNWA2og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; d="scan'208";a="241514582"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 07 Feb 2026 14:02:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1voqOF-00000000luK-0tqF;
 Sat, 07 Feb 2026 22:02:55 +0000
Date: Sun, 8 Feb 2026 06:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, Chen Ni <nichen@iscas.ac.cn>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] fbdev: au1100fb: Make driver compilable on
 non-mips platforms
Message-ID: <202602080635.w8n9dF6S-lkp@intel.com>
References: <b894247689a7a920d9caa465dbcb840bca806cbf.1770483674.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b894247689a7a920d9caa465dbcb840bca806cbf.1770483674.git.u.kleine-koenig@baylibre.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:deller@gmx.de,m:oe-kbuild-all@lists.linux.dev,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,gmx.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A2D4310744E
X-Rspamd-Action: no action

Hi Uwe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0636e6205beed850d985276dc56fd73d785bea5c]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/fbdev-au1100fb-Don-t-store-device-specific-data-in-global-variables/20260208-011505
base:   0636e6205beed850d985276dc56fd73d785bea5c
patch link:    https://lore.kernel.org/r/b894247689a7a920d9caa465dbcb840bca806cbf.1770483674.git.u.kleine-koenig%40baylibre.com
patch subject: [PATCH v2 4/4] fbdev: au1100fb: Make driver compilable on non-mips platforms
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260208/202602080635.w8n9dF6S-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602080635.w8n9dF6S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602080635.w8n9dF6S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/au1100fb.c:551:29: warning: 'fbregs' defined but not used [-Wunused-variable]
     551 | static struct au1100fb_regs fbregs;
         |                             ^~~~~~


vim +/fbregs +551 drivers/video/fbdev/au1100fb.c

^1da177e4c3f415 drivers/video/au1100fb.c Linus Torvalds   2005-04-16  549  
f77f50ca1a236ae drivers/video/au1100fb.c Rodolfo Giometti 2006-06-26  550  #ifdef CONFIG_PM
f77f50ca1a236ae drivers/video/au1100fb.c Rodolfo Giometti 2006-06-26 @551  static struct au1100fb_regs fbregs;
f77f50ca1a236ae drivers/video/au1100fb.c Rodolfo Giometti 2006-06-26  552  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
