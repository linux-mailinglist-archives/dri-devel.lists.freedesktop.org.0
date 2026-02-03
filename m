Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKFpMLkqgmnFPwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:04:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50659DC78A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FFB10E720;
	Tue,  3 Feb 2026 17:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FcSYJk9w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2E110E720
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 17:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770138294; x=1801674294;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kNKlVWt0ITs0XqNiVkBXtz5BNZYNxn7AM0oFtkv1gug=;
 b=FcSYJk9wyOKGasIgsH4lZpBwOxpIpD19F9t7RpI0L3k+E17WFPb4+QQp
 tU6oPmjdHM8D4mwfRqOlMSuLPL6dydgaCg7GAWRpLiPgDqifLB9Jri2Xy
 ToeAlKXaaupEFHeSBb4s/DRIfm0F2G9OgNF57IS0Ex28ACLMWOuoRYcF4
 nVN7Y0AVzNfiEYKW6ow7qWhngOGPSM5DKVzzqWaiYicIznNiDCCfdlfFc
 G9DhRP7VK5DuNfe/KDk/YmwLRsWlrbXBGM78YUVinhCk3cw1AvwXbBEEs
 zaj98QFhBVQXBHMhPgBJRn/ik6yQWRQR8SVNNYubn/3ydqb2F+SsjtDcm Q==;
X-CSE-ConnectionGUID: 6y5+Sq0yTmigKxUyTKucEg==
X-CSE-MsgGUID: OEQmOZ1vQdS5LLgMVBKOpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71213387"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="71213387"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 09:04:53 -0800
X-CSE-ConnectionGUID: orUB1YMISzufp6xwiQ/nhg==
X-CSE-MsgGUID: uOlJDxGRQM6bajounDIJ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="247506200"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602)
 ([10.211.93.152])
 by orviesa001.jf.intel.com with ESMTP; 03 Feb 2026 09:04:49 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vnJpW-000000003O5-4330;
 Tue, 03 Feb 2026 17:04:46 +0000
Date: Tue, 3 Feb 2026 18:04:20 +0100
From: kernel test robot <lkp@intel.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] drm/panel: ilitek-ili9806e: add Rocktech
 RK050HR345-CT106A SPI panel
Message-ID: <202602031842.bg1GhtQE-lkp@intel.com>
References: <20260203075548.14907-5-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203075548.14907-5-dario.binacchi@amarulasolutions.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[pgazz.com,gmail.com,lists.linux.dev,amarulasolutions.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dario.binacchi@amarulasolutions.com,m:linux-kernel@vger.kernel.org,m:paul@pgazz.com,m:fazilyildiran@gmail.com,m:oe-kbuild-all@lists.linux.dev,m:linux-amarula@amarulasolutions.com,m:airlied@gmail.com,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mwalle@kernel.org,m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 50659DC78A
X-Rspamd-Action: no action

Hi Dario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6bd9ed02871f22beb0e50690b0c3caf457104f7c]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/drm-panel-ilitek-ili9806e-rename-to-specific-DSI-driver/20260203-155721
base:   6bd9ed02871f22beb0e50690b0c3caf457104f7c
patch link:    https://lore.kernel.org/r/20260203075548.14907-5-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH v3 4/4] drm/panel: ilitek-ili9806e: add Rocktech RK050HR345-CT106A SPI panel
config: hexagon-kismet-CONFIG_DRM_PANEL_ILITEK_ILI9806E_CORE-CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI-0-0 (https://download.01.org/0day-ci/archive/20260203/202602031842.bg1GhtQE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260203/202602031842.bg1GhtQE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031842.bg1GhtQE-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_PANEL_ILITEK_ILI9806E_CORE when selected by DRM_PANEL_ILITEK_ILI9806E_SPI
   WARNING: unmet direct dependencies detected for DRM_PANEL_ILITEK_ILI9806E_CORE
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && BACKLIGHT_CLASS_DEVICE [=n]
     Selected by [y]:
     - DRM_PANEL_ILITEK_ILI9806E_SPI [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && SPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
