Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2184A9C6B54
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 10:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647FA10E6B9;
	Wed, 13 Nov 2024 09:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEjtp/YM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D62510E6B9;
 Wed, 13 Nov 2024 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731489602; x=1763025602;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=PpjB4QaZcfk1iOp33R6Up8bd557Rl7eXahIs39cJ77Q=;
 b=FEjtp/YMaVKhT36LfVymeRWBfK1vQRLimlWFYg7mPZiEXEfv4OBCJ4kM
 4kDfKlF2jD088P7gqJX8IQkinbwABN1YkTDos6YLkXPZQAXik5CtBKFs/
 L3Ps8sucbF6a2K30BaM93uinzOUBgzuf6JsZhOt0jFdQcfDzXKHXSxNDR
 FF0ICztSvH/No4kraA+RkF6cyJsNRueShrVRXj3PNh6hl3j4ti81WtEnA
 0oaq2gQOIyvY2ZfthglEBRXYBIZg0650Hcu6UhT1tvpKbYwnh7nplSGvV
 d0hvL7ppi/yqPyW9DJByULSlUjDbQ1yKG2ilWKqJZV2JCX6QN1rOFDxSr A==;
X-CSE-ConnectionGUID: BISgDk4jQ9uYpuw4WP3txg==
X-CSE-MsgGUID: b8kRLofWROeCjLOwozssjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31526187"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31526187"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 01:20:02 -0800
X-CSE-ConnectionGUID: zVyatI2hSMmNOcj2i9awvg==
X-CSE-MsgGUID: k0lU/5ITQSefmlD8ob3B+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="87921483"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.245.137])
 ([10.245.245.137])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 01:19:58 -0800
Message-ID: <5a467f58-000b-4160-868f-7032665cc814@linux.intel.com>
Date: Wed, 13 Nov 2024 10:19:56 +0100
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
Subject: [PULL] drm-misc-next
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Next pull request, hopefully we'll have a v6.12 release soon!

Cheers,
~Maarten

drm-misc-next-2024-11-13:
drm-misc-next for v6.13-rc1:

Core Changes:
- Replace use of of_graph_get_next_endpoint by get_endpoint_by_regs in
   core and drivers.

Driver Changes:
- Use drm_connector_helper_hpd_irq_event in rockchip, and add gamma LUT
   support.
- Small fixes to v3d, rockchip, bridge/cdns-mhdp8546.
The following changes since commit baf4afc5831438b35de4b0e951b9cd58435a6d99:

   drm/sched: Improve teardown documentation (2024-11-07 10:05:54 +0100)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-next-2024-11-13

for you to fetch changes up to 17558f97fe62fbe14757880a0aa998bfd194ea95:

   gpu: drm: replace of_graph_get_next_endpoint() (2024-11-12 13:05:35 
+0100)

----------------------------------------------------------------
drm-misc-next for v6.13-rc1:

Core Changes:
- Replace use of of_graph_get_next_endpoint by get_endpoint_by_regs in
   core and drivers.

Driver Changes:
- Use drm_connector_helper_hpd_irq_event in rockchip, and add gamma LUT
   support.
- Small fixes to v3d, rockchip, bridge/cdns-mhdp8546.

----------------------------------------------------------------
Andy Yan (1):
       drm/rockchip: vop2: Don't spam logs in atomic update

Dr. David Alan Gilbert (1):
       drm/bridge: cdns-mhdp8546: Remove unused functions

Kuninori Morimoto (1):
       gpu: drm: replace of_graph_get_next_endpoint()

Maíra Canal (1):
       drm/v3d: Fix performance counter source settings on V3D 7.x

Piotr Zalewski (1):
       rockchip/drm: vop2: add support for gamma LUT

Thomas Zimmermann (1):
       drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()

  .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c    |  28 ---
  .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h    |   3 -
  drivers/gpu/drm/drm_of.c                           |   4 +-
  .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |   2 +-
  drivers/gpu/drm/rockchip/cdn-dp-core.c             |   9 +-
  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       | 208 
++++++++++++++++++++-
  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |   5 +
  drivers/gpu/drm/tiny/arcpgu.c                      |   2 +-
  drivers/gpu/drm/v3d/v3d_debugfs.c                  |   4 +-
  drivers/gpu/drm/v3d/v3d_perfmon.c                  |  15 +-
  drivers/gpu/drm/v3d/v3d_regs.h                     |  29 +--
  11 files changed, 236 insertions(+), 73 deletions(-)
