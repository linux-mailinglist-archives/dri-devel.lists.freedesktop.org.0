Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D6FACF4E4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 19:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D650C10E356;
	Thu,  5 Jun 2025 17:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DOB5lUmS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE10910E134;
 Thu,  5 Jun 2025 17:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749142964; x=1780678964;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=yjO+rl+hMJQpjrsEwT2wZSb6PfHcGK0YScayDZMCJsw=;
 b=DOB5lUmS6XsADij2KDR+5KGdOeKA2WOPWfBc46ouIJlPfT47dNixvF/m
 6hUcuHv6ORH93jfZLReJVCENKa5M7HlqDdp9pDbk/Amo2NLxyBnjeFP/C
 OkivY3FLz3VU/nGxmm9ypI4v11QE8XsPc7OCs5lTZPOvXVNt06nkVWFdW
 KqU/4Ok1ZMNhuuBkEuNz3oH8zsgNyy0VkuMe0mYfWlsVZa/EHawmkKnZy
 MmjJ/z5BGDElOvNxEJX5rWZ5iesrBauLLqxgWWzLq1qY4wIlEvMGhzvWg
 NWZyuSG+zVxuj80i9fmx6+Q5psdozHDcNDoX9/ExpJyYCyjeaQ3jsrMa7 A==;
X-CSE-ConnectionGUID: S+Y9tWKDT5Gf2BcjZ762cQ==
X-CSE-MsgGUID: Vfe3ou2EQMObbTdc1+ErTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="53904562"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="53904562"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 10:02:43 -0700
X-CSE-ConnectionGUID: y8YZ9KCXQPWDV6VvyYqIfQ==
X-CSE-MsgGUID: clOBw9/0RF+Sd4EHiI1hSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="146548021"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.183])
 ([10.245.244.183])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 10:02:40 -0700
Message-ID: <14c2eff8-701d-4699-b187-08862715e1ac@linux.intel.com>
Date: Thu, 5 Jun 2025 19:02:37 +0200
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
Subject: [PULL] drm-misc-next-fixes
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

Small list of fixes for v6.16-rc1!

Best regards!
~Maarten

drm-misc-next-fixes-2025-06-05:
drm-misc-fixes for v6.16-rc1:
- Fixes for nt37801 panel
- Fix null deref in HDMI audio helper.
- Fixes for analogix_dp.
The following changes since commit 7c1a9408ce5f34ded5a85db81cf80e0975901685:

  Merge tag 'drm-msm-next-2025-05-16' of https://gitlab.freedesktop.org/drm/msm into drm-next (2025-05-19 11:05:58 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2025-06-05

for you to fetch changes up to fd03f82a026cc03cb8051a8c6487c99f96c9029f:

  drm/bridge: analogix_dp: Fix clk-disable removal (2025-05-28 16:53:31 +0300)

----------------------------------------------------------------
drm-misc-fixes for v6.16-rc1:
- Fixes for nt37801 panel
- Fix null deref in HDMI audio helper.
- Fixes for analogix_dp.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/panel: nt37801: select CONFIG_DRM_DISPLAY_DSC_HELPER

Damon Ding (1):
      drm/bridge: analogix_dp: Remove the unnecessary calls to clk_disable_unprepare() during probing

Dan Carpenter (1):
      drm/panel: nt37801: Fix IS_ERR() vs NULL check in probe()

Heiko Stuebner (1):
      drm/bridge: analogix_dp: Fix clk-disable removal

Nicolas Frattaroli (1):
      drm/connector: only call HDMI audio helper plugged cb if non-null

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 20 ++++++--------------
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    |  3 ++-
 drivers/gpu/drm/panel/Kconfig                      |  2 ++
 drivers/gpu/drm/panel/panel-novatek-nt37801.c      |  4 ++--
 4 files changed, 12 insertions(+), 17 deletions(-)
