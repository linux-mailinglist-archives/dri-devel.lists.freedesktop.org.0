Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HC3jGiorlGmPAQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 09:47:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D75114A153
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 09:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F7210E170;
	Tue, 17 Feb 2026 08:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9kzhqDE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614F110E170
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771318053; x=1802854053;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6r+UY8it6sSkyBM8s7UXOxX26Vnjj7n0rJoQ4iyzL5E=;
 b=X9kzhqDEdEd8RTzcypQjkQT4ecjaE3iKSdTzzXtZHkHmGtMkG8NbH1mH
 0TcDaP13+GJZ714Dx+2/KLpBc6jlQPvoXZDulVsxzi0SQ9DQbzFjwqdeV
 mD/PviPH+plIIJGCoFMu/mZuSFvaX8cMLWspL5C3uWoSqwo4ES/zTOD8N
 ldu/t7UteqN2dRVYn//UwbUOpXH1FEhykXQ/VEy7DeJJA5j4xjXwDsifS
 TBtjJEo3KUyvjIEE1M93P/WMgAnYih7+8ykrEQ1XZDygS2I1pI0OsMVCo
 ZO8fXLeLyvSGYyMk4S0FKS6i+6CnMhvKLP4io5mC0W2AKfxDQqurNDTNz g==;
X-CSE-ConnectionGUID: Paqz6NezQx+LxWvc6Tbgdg==
X-CSE-MsgGUID: sMoIeHqMQViCbngcjH37EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="76237001"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="76237001"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 00:47:32 -0800
X-CSE-ConnectionGUID: Gtu4q1fASISpXNfavsgv9g==
X-CSE-MsgGUID: Xr8k71zqQvK84zCLjfnj0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="218355730"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 17 Feb 2026 00:47:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vsGju-000000010lg-1hSs;
 Tue, 17 Feb 2026 08:47:26 +0000
Date: Tue, 17 Feb 2026 16:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>, Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel@puri.sm,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Oliver F. Brown" <oliver.brown@oss.nxp.com>,
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Subject: Re: [PATCH] drm/bridge: nwl-dsi: Correct MIPI DSI horizontal sync
 timing
Message-ID: <202602171616.QToUwfFa-lkp@intel.com>
References: <20260216-nwl-sync-timing-v1-1-b0ff6ecf204a@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216-nwl-sync-timing-v1-1-b0ff6ecf204a@puri.sm>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[puri.sm,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,sigxcpu.org,nxp.com];
	FORGED_RECIPIENTS(0.00)[m:sebastian.krzyszkowiak@puri.sm,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sam@ravnborg.org,m:agx@sigxcpu.org,m:robert.chiras@nxp.com,m:festevam@gmail.com,m:oe-kbuild-all@lists.linux.dev,m:kernel@puri.sm,m:linux-kernel@vger.kernel.org,m:oliver.brown@oss.nxp.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 3D75114A153
X-Rspamd-Action: no action

Hi Sebastian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0f2acd3148e0ef42bdacbd477f90e8533f96b2ac]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Krzyszkowiak/drm-bridge-nwl-dsi-Correct-MIPI-DSI-horizontal-sync-timing/20260217-015316
base:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
patch link:    https://lore.kernel.org/r/20260216-nwl-sync-timing-v1-1-b0ff6ecf204a%40puri.sm
patch subject: [PATCH] drm/bridge: nwl-dsi: Correct MIPI DSI horizontal sync timing
config: arm-randconfig-r112-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171616.QToUwfFa-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171616.QToUwfFa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171616.QToUwfFa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_uldivmod
   >>> referenced by nwl-dsi.c
   >>>               drivers/gpu/drm/bridge/nwl-dsi.o:(nwl_dsi_bridge_mode_set) in archive vmlinux.a
   >>> referenced by nwl-dsi.c
   >>>               drivers/gpu/drm/bridge/nwl-dsi.o:(nwl_dsi_bridge_mode_set) in archive vmlinux.a
   >>> referenced by nwl-dsi.c
   >>>               drivers/gpu/drm/bridge/nwl-dsi.o:(nwl_dsi_bridge_mode_set) in archive vmlinux.a
   >>> did you mean: __aeabi_uidivmod
   >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
