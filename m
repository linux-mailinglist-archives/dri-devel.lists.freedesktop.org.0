Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wB2pMoD6d2nlmwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 00:36:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1258E372
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 00:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC2C10E0FB;
	Mon, 26 Jan 2026 23:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JADC1FnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9E010E0FB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 23:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769470588; x=1801006588;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=2qihAeStLk8UtWiG+d3xuYz0JuSr+DATgvhbmOIawlY=;
 b=JADC1FnEMBKGMp3xQnDR/BKu5KtXr3o3vVPmSbgODzk/0eKtTF1ys1Fg
 ur1j2ESxawbm9uoxmHStDJK6ETQOzNNn9xNnV9k+W3kMeJyqegAC8l9WP
 X3V6APHSeMRAeavvgnoWDFnlOorz+BeN5mwkmoNTkSvZc+w6wewolP+tM
 6UibaYkxS9H9ro7jKBWSnuxinPuej9X6shGZJD2WBAHmk0yhS9IkF7jkU
 yorBFyLJwqB7E7kbc19F/XDJqB+RTVPSc/pWbLPWCF7pK5ovGDt0t/gkh
 MSj4OzDHkYJ62r0U9loQi7DZ3LOnVYS3BSbEvFKbwWd4TvvUKQvLOsjZ6 Q==;
X-CSE-ConnectionGUID: LzN03tDxSMSlAE4ky6D9fg==
X-CSE-MsgGUID: vyhgC+kcTZ+V+DRMa+c1OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="96119303"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="96119303"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 15:36:28 -0800
X-CSE-ConnectionGUID: Nlgz/Ii+THSBIh9nc2kzag==
X-CSE-MsgGUID: kgB4YVN/Q/+xsGC27zwTcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="212357394"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602)
 ([10.211.93.152])
 by orviesa004.jf.intel.com with ESMTP; 26 Jan 2026 15:36:25 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vkW86-000000001cz-3iP5;
 Mon, 26 Jan 2026 23:36:22 +0000
Date: Tue, 27 Jan 2026 00:35:35 +0100
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Ma=C3=ADra?= Canal" <mcanal@igalia.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [drm-misc:drm-misc-next 1/1] kismet: WARNING: unmet direct
 dependencies detected for DRM_DISPLAY_DSC_HELPER when selected by
 DRM_PANEL_ILITEK_ILI9882T
Message-ID: <202601270005.VK6B66uK-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pgazz.com,gmail.com,lists.linux.dev,lists.freedesktop.org,linaro.org,collabora.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:paul@pgazz.com,m:fazilyildiran@gmail.com,m:oe-kbuild-all@lists.linux.dev,m:neil.armstrong@linaro.org,m:nicolas.frattaroli@collabora.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 4E1258E372
X-Rspamd-Action: no action

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   68e28facbc8ab3e701e1814323d397a75b400865
commit: 68e28facbc8ab3e701e1814323d397a75b400865 [1/1] drm/panel: ilitek-ili9882t: Select DRM_DISPLAY_DSC_HELPER
config: openrisc-kismet-CONFIG_DRM_DISPLAY_DSC_HELPER-CONFIG_DRM_PANEL_ILITEK_ILI9882T-0-0 (https://download.01.org/0day-ci/archive/20260127/202601270005.VK6B66uK-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260127/202601270005.VK6B66uK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270005.VK6B66uK-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_DSC_HELPER when selected by DRM_PANEL_ILITEK_ILI9882T
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DSC_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_PANEL_ILITEK_ILI9882T [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && DRM_MIPI_DSI [=y] && BACKLIGHT_CLASS_DEVICE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
