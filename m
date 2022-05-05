Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1F751C468
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 17:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AEC10E7E1;
	Thu,  5 May 2022 15:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F23310E7CE;
 Thu,  5 May 2022 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651766299; x=1683302299;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=gYID5Jp+eALcFrc1YmlNN6XcP/oZ8NdrTiYxA9yK6ck=;
 b=hI9m6yXgl/oTnEkGA9e8YJmFJ/v/vJP/JnTSrjHaq494MpNcg/YQ712u
 pGGg0AQF3SOqcywGt823QFqfEhsHcjiCotLbDoXANY74CYHqKinG/gXch
 AwItde0dSLGpyLAMylT7D52aDss+vVSbEJAZ0yRL0f7bzbtOdXyvr4TJM
 HkyL5zIRzUzhuuArv6aDHcx8Mgj344o4VFZPytdjFc8Hp2Scg9kjlsmVS
 Jkj85TxwUumGCVqlTb1IQ+/vEHsh/a4JZ5jkK6Fxl+kGtQIiT7zHsDDdV
 /sBzSbhSEFmYYEe81+LEOJDIMN98+AMoP+pyPIQuwQMXiy+0Nb2znTOmU Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248066178"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="248066178"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 08:50:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="563303610"
Received: from gnarciso-mobl.ger.corp.intel.com (HELO [10.252.60.181])
 ([10.252.60.181])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 08:50:31 -0700
Message-ID: <69e51773-8c6f-4ff7-9a06-5c2922a43999@linux.intel.com>
Date: Thu, 5 May 2022 17:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-fixes-2022-05-05:
drm-misc-fixes for v5.18-rc6:
- Small fix for hot-unplugging fb devices.
- Kconfig fix for it6505.
The following changes since commit dc3ae06c5f2170d879ff58696f629d8c3868aec3:

  drm/sun4i: Remove obsolete references to PHYS_OFFSET (2022-04-26 14:39:56 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-05-05

for you to fetch changes up to 841e512ffb64898db6322c0619f6bbc41266d86f:

  drm/bridge: ite-it6505: add missing Kconfig option select (2022-05-04 10:14:16 +0200)

----------------------------------------------------------------
drm-misc-fixes for v5.18-rc6:
- Small fix for hot-unplugging fb devices.
- Kconfig fix for it6505.

----------------------------------------------------------------
Fabien Parent (1):
      drm/bridge: ite-it6505: add missing Kconfig option select

Javier Martinez Canillas (1):
      fbdev: Make fb_release() return -ENODEV if fbdev was unregistered

 drivers/gpu/drm/bridge/Kconfig   | 1 +
 drivers/video/fbdev/core/fbmem.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)
