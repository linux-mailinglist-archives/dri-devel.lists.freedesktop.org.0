Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AF6ADFF77
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 10:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7551510E9D3;
	Thu, 19 Jun 2025 08:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5iOtL4t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9918210E9CF;
 Thu, 19 Jun 2025 08:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750320735; x=1781856735;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=R4g7T6gb+gtI9xtMOgV2EIEm7OUDjtzPl/9mF/excG0=;
 b=J5iOtL4tDze7wb8n8r7DDw3idp/zfLrCWYF96LZ6ztD2XZadXmkO2ctc
 pWgV3+PPWSYFQr0vpYZ2Z0Pc7YYqfzr/GjFh9TZyR7LFSaJfIlgAItI5z
 XQj0d24BXGrIv1tgESiT1qrquy8Ab5l/OXDgQVDAl+kyVQjkVzXaPUYGe
 Z4AbbfaPtTmgQOE7w3HNA9l12vORkyGohbEG96IIUGEZJkfX2RmHCZM0l
 DE+9JKqpul7LZwGo6HC6eqWxKQT5BGUcskP+nVzHvW6Y+xs2ns0gginWw
 ozDotFCYS31LKS0V/yTlUOPsnc0/Xxkkx84TXYPFZzziSaFTV6GJ0MHeG A==;
X-CSE-ConnectionGUID: l5Xu9TJ3TO6gohgMX9G/bQ==
X-CSE-MsgGUID: nzdO9Ds2SEG2x/LLqf63bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52537387"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="52537387"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 01:12:14 -0700
X-CSE-ConnectionGUID: py0RoW3tRWKugASiCHKylw==
X-CSE-MsgGUID: +bi4q9cXQxmw6myMuNPEPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="151100518"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.186])
 ([10.245.244.186])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 01:12:11 -0700
Message-ID: <d44bab7b-01f8-45a8-a7f4-5d3d563d2f9d@linux.intel.com>
Date: Thu, 19 Jun 2025 10:12:07 +0200
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

Pull request right before midsummer celebrations here, hope you have a great midsummer (and midwinter?)

Best regards!
~Maarten

drm-misc-fixes-2025-06-19:
drm-misc-fixes for v6.16-rc3:
- vivante scheduler fix.
- v3d null pointer crash fix.
- fix backlight, booting GSP-RM, and potential integer shift overflow in nouveau.
- fix compiler warnings about unused linux/export.h
- fix malidp unknown modifier spam.
- fix for ssd130x.
The following changes since commit afe382843717d44b24ef5014d57dcbaab75a4052:

  udmabuf: use sgtable-based scatterlist wrappers (2025-06-11 13:18:07 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-06-19

for you to fetch changes up to 61ee19dedb8d753249e20308782bf4e9e2fb7344:

  drm/etnaviv: Protect the scheduler's pending list with its lock (2025-06-16 20:18:13 -0300)

----------------------------------------------------------------
drm-misc-fixes for v6.16-rc3:
- vivante scheduler fix.
- v3d null pointer crash fix.
- fix backlight, booting GSP-RM, and potential integer shift overflow in nouveau.
- fix compiler warnings about unused linux/export.h
- fix malidp unknown modifier spam.
- fix for ssd130x.

----------------------------------------------------------------
Alexander Stein (1):
      drm/arm/malidp: Silence informational message

Bagas Sanjaya (1):
      Documentation: nouveau: Update GSP message queue kernel-doc reference

Colin Ian King (1):
      drm/nouveau/gsp: Fix potential integer overflow on integer shifts

Jacob Keller (1):
      drm/nouveau/bl: increase buffer size to avoid truncate warning

John Keeping (1):
      drm/ssd130x: fix ssd132x_clear_screen() columns

Maíra Canal (2):
      drm/v3d: Avoid NULL pointer dereference in `v3d_job_update_stats()`
      drm/etnaviv: Protect the scheduler's pending list with its lock

Thomas Zimmermann (2):
      drm/ast: Do not include <linux/export.h>
      drm/mgag200: Do not include <linux/export.h>

Zhi Wang (1):
      drm/nouveau: fix a use-after-free in r535_gsp_rpc_push()

 Documentation/gpu/nouveau.rst                         |  2 +-
 drivers/gpu/drm/arm/malidp_planes.c                   |  2 +-
 drivers/gpu/drm/ast/ast_mode.c                        |  1 -
 drivers/gpu/drm/etnaviv/etnaviv_sched.c               |  5 ++++-
 drivers/gpu/drm/mgag200/mgag200_ddc.c                 |  1 -
 drivers/gpu/drm/nouveau/nouveau_backlight.c           |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c | 17 ++++++++++++-----
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c |  2 +-
 drivers/gpu/drm/solomon/ssd130x.c                     |  2 +-
 drivers/gpu/drm/v3d/v3d_sched.c                       |  8 ++++++--
 10 files changed, 27 insertions(+), 15 deletions(-)
