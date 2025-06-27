Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778ACAEAF90
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 09:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0623210E319;
	Fri, 27 Jun 2025 07:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWq+ToF2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE9410E318;
 Fri, 27 Jun 2025 07:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751007847; x=1782543847;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=5aNet3A6eyCtgf2gY1Misug6RR1GEhTb7sytlh8WVh0=;
 b=ZWq+ToF2G9/X4p91WENMPbm0NDgASKvSsAmio8qgUCUgjyaFh/0FHQWn
 rNkXQ5wqRbqpkwErlkHhfgUwPUirfBT2dmwcPu9y+mry3skGf4ZPET1C9
 FD/yyxDRFlkw6ij8K6ji674l+n5gXxxOOMsII1A0sBPrjUc8W47/GLH8v
 Nmtbnhihnt411yz9un4YQsOxc1xezxTAjbjNkbuXwJmMHl3PS5YFGuBjn
 ZA0xU+lBVnW3JofXNeo5W/lqlzOLsHCYffD3Y+mZfcrcCgprIjJcNJZ5L
 6gQ8QtjHgXONfUGCqX5zsG9BsWjih++Klb3v10iLfexbJhB79bTZvZRRm g==;
X-CSE-ConnectionGUID: BM3cWPJPSI+5vpux9g2Mxw==
X-CSE-MsgGUID: Tgy2q01HTcGreocj0cI0EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="40933644"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="40933644"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 00:04:06 -0700
X-CSE-ConnectionGUID: OQhZqlFBTtWNWN64y82PpA==
X-CSE-MsgGUID: nTKhtqfUQj6CZ8D4DL2maw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="152910195"
Received: from agladkov-desk.ger.corp.intel.com (HELO [10.245.245.70])
 ([10.245.245.70])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 00:04:02 -0700
Message-ID: <3dd1d5e1-73b6-4b0c-a208-f7d6235cf530@linux.intel.com>
Date: Fri, 27 Jun 2025 09:04:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Simona,

I prepared a pull request yesterday, but forgot to actually send it, hence the date.
Doesn't look like any new requests came in, so sending anyway!

Kind regards,
~Maarten

drm-misc-fixes-2025-06-26:
drm-misc-fixes for v6.16-rc4:
- Fix function signature of drm_writeback_connector_cleanup.
- Use correct HDMI audio bridge in drm_connector_hdmi_audio_init.
- Make HPD work on SN65DSI86.
The following changes since commit 61ee19dedb8d753249e20308782bf4e9e2fb7344:

  drm/etnaviv: Protect the scheduler's pending list with its lock (2025-06-16 20:18:13 -0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-06-26

for you to fetch changes up to 55e8ff842051b1150461d7595d8f1d033c69d66b:

  drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort connector type (2025-06-25 07:49:01 -0700)

----------------------------------------------------------------
drm-misc-fixes for v6.16-rc4:
- Fix function signature of drm_writeback_connector_cleanup.
- Use correct HDMI audio bridge in drm_connector_hdmi_audio_init.
- Make HPD work on SN65DSI86.

----------------------------------------------------------------
Chaoyi Chen (1):
      drm/bridge-connector: Fix bridge in drm_connector_hdmi_audio_init()

Jayesh Choudhary (1):
      drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort connector type

Louis Chauvet (1):
      drm: writeback: Fix drm_writeback_connector_cleanup signature

 drivers/gpu/drm/bridge/ti-sn65dsi86.c          | 69 ++++++++++++++++++++++----
 drivers/gpu/drm/display/drm_bridge_connector.c |  7 ++-
 drivers/gpu/drm/drm_writeback.c                |  7 +--
 3 files changed, 69 insertions(+), 14 deletions(-)
