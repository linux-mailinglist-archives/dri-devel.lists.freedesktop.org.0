Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 782E39E5F1D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 20:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E432310EFA2;
	Thu,  5 Dec 2024 19:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXG54LWx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0569510EFA2;
 Thu,  5 Dec 2024 19:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733428093; x=1764964093;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=dEiIdUWvT3IrYQwyUuzrU1CFN7Q/6PEMyRLYgHq8uAg=;
 b=AXG54LWxEb9jvZoRJ5yC0EyXgDc+sEHKgD5Upd/ZokIg+C9QfgOWXG+A
 uP+oDWmKNvOjurAJ0Rcba7iw6oiUD013N0eQm5zHVqXZzknTr+v+TWize
 Cjs+HACpSICPdkqC1HKt/Cm3psNdVY7rkBE9YIs/Q0QY60w7VhDsnXWFR
 UO8Dz3P4jAUOMpZp1OVjfjaACIhM//AFcsmrHCPi+rhPq80ikub8PrRIf
 HH23QA/QMsTZsociVWMGfbBtK4QFTYj5DleV7iJnRYd0ZKjqKPBaxxwKU
 x/KhqyGoqWK2rfOKbAaaHkRKAuha0jlUlKbCqP16Ey1lfrPd8VQbC9mGz A==;
X-CSE-ConnectionGUID: z7BKZZH8TWSuU8C8TjVX3A==
X-CSE-MsgGUID: KQKDKOjgR/+eJpEqp35qVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33502490"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="33502490"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 11:48:13 -0800
X-CSE-ConnectionGUID: YHNm9szuQ3qu152gVJ18Yw==
X-CSE-MsgGUID: ff/T3ZFdQaOdCtX3xuAcmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="98268615"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.104])
 ([10.245.244.104])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 11:48:08 -0800
Message-ID: <2ce1650d-801f-4265-a876-5a8743f1c82b@linux.intel.com>
Date: Thu, 5 Dec 2024 20:48:41 +0100
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
Content-Transfer-Encoding: 8bit
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

Filled with pepernoten, still had to send a drm-misc-fixes pull request.
May contain DP-MST fixes with traces of v3d. :-)

Cheers,
~Maarten

drm-misc-fixes-2024-12-05:
drm-misc-fixes v6.13-rc2:
- v3d performance counter fix.
- A lot of DP-MST related fixes.
The following changes since commit 86e8f94789dd6f3e705bfa821e1e416f97a2f863:

  drm/sti: Add __iomem for mixer_dbg_mxn's parameter (2024-11-26 14:02:25 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-12-05

for you to fetch changes up to c98b10496b2f3c4f576af3482c71aadcfcbf765e:

  drm/v3d: Enable Performance Counters before clearing them (2024-12-05 14:27:57 -0300)

----------------------------------------------------------------
drm-misc-fixes v6.13-rc2:
- v3d performance counter fix.
- A lot of DP-MST related fixes.

----------------------------------------------------------------
Imre Deak (7):
      drm/dp_mst: Fix resetting msg rx state after topology removal
      drm/dp_mst: Verify request type in the corresponding down message reply
      drm/dp_mst: Simplify error path in drm_dp_mst_handle_down_rep()
      drm/dp_mst: Fix down request message timeout handling
      drm/dp_mst: Ensure mst_primary pointer is valid in drm_dp_mst_handle_up_req()
      drm/dp_mst: Reset message rx state after OOM in drm_dp_mst_handle_up_req()
      drm/dp_mst: Use reset_msg_rx_state() instead of open coding it

Maíra Canal (1):
      drm/v3d: Enable Performance Counters before clearing them

 drivers/gpu/drm/display/drm_dp_mst_topology.c | 104 +++++++++++++++++++++-----
 drivers/gpu/drm/v3d/v3d_perfmon.c             |   2 +-
 include/drm/display/drm_dp_mst_helper.h       |   7 ++
 3 files changed, 92 insertions(+), 21 deletions(-)
