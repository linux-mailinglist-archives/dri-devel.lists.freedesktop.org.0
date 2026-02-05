Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE76CbVohGlK2wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:53:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02B1F10DF
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAB310E853;
	Thu,  5 Feb 2026 09:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyL7pCLv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601CC10E84E;
 Thu,  5 Feb 2026 09:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770285234; x=1801821234;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=0c4m+M38mrU170Z6WcWDX4wuh8ZaRMFel8u/1VYCCcw=;
 b=CyL7pCLvNnQsQGf0GD4yZ94lzHxJ9qfzw/sk421n+95YXWTjaEo19q1S
 rrcL7w87oLUsdMRkvc2BMID5l5Z3NhNAsLKWU08ILSUaNgWXyrkPJlypM
 suqT5OiLLVmyqXUlvTl4Qtp30N6x6zj13GXsQhsuuTmIomTa4oa3qUs/7
 S2x90dy+PSN8OZ/ug9D89Zt2qiRkTL4+qhF9bz9/nJ0Wruggm/sXDp1ni
 qZq4X5W+B78D+dWfX+zyINkE+WxGvDdHXWLoV6dEU8oN09nvcubpVW9me
 8WfehxBXJD+IVPa36Vl8vkero0nTPCs4FDbvGXEIqUmY7iMvbwdPQ4Ds1 g==;
X-CSE-ConnectionGUID: WB8JFYZOTPSexfj9mrtfCQ==
X-CSE-MsgGUID: 93M16wu/TPSrMy4R9+jqpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71577910"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71577910"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:53:53 -0800
X-CSE-ConnectionGUID: Sh6kyAcTRauAHwm3zxoJwA==
X-CSE-MsgGUID: r/pRW69FSfiRgytQYAuf9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="241138557"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.127])
 ([10.245.244.127])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:53:48 -0800
Message-ID: <c0077ea5-faeb-4b0c-bd4a-ea2384d6dc0c@linux.intel.com>
Date: Thu, 5 Feb 2026 10:53:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,linux.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: C02B1F10DF
X-Rspamd-Action: no action

Hi Dave, Simona,

Here's hopefully the last pull request for v6.19!

Kind regards,
~Maarten

drm-misc-fixes-2026-02-05:
drm-misc-fixes for v6.19 final:

nouveau
-------
Revert adding atomic commit functions as it regresses pre-nv50.
Fix bugs exposed by enabling 570 firmware.

gma500
------
Revert a regression caused by vblank changes.

mgag200
-------
Replace a busy loop with a polling loop to fix that blocking 1 cpu for 300 ms roughly every 20 minutes.

bridge
------
imx8mp-hdmi-pa: Use runtime pm to fix a bug in channel ordering.
The following changes since commit e535c23513c63f02f67e3e09e0787907029efeaf:

  drm/imx/tve: fix probe device leak (2026-01-28 10:53:19 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-02-05

for you to fetch changes up to 40b24d9cdd4141ef43eeaa7e57c3efc07a567473:

  drm/bridge: imx8mp-hdmi-pai: enable PM runtime (2026-02-05 16:16:45 +0800)

----------------------------------------------------------------
drm-misc-fixes for v6.19 final:

nouveau
-------
Revert adding atomic commit functions as it regresses pre-nv50.
Fix bugs exposed by enabling 570 firmware.

gma500
------
Revert a regression caused by vblank changes.

mgag200
-------
Replace a busy loop with a polling loop to fix that blocking 1 cpu for 300 ms roughly every 20 minutes.

bridge
------
imx8mp-hdmi-pa: Use runtime pm to fix a bug in channel ordering.

----------------------------------------------------------------
Dave Airlie (3):
      nouveau/gsp: use rpc sequence numbers properly.
      nouveau: add a third state to the fini handler.
      nouveau/gsp: fix suspend/resume regression on r570 firmware

Jacob Keller (1):
      drm/mgag200: fix mgag200_bmc_stop_scanout()

Jani Nikula (1):
      Revert "drm/gma500: use drm_crtc_vblank_crtc()"

John Ogness (1):
      Revert "drm/nouveau/disp: Set drm_mode_config_funcs.atomic_(check|commit)"

Shengjiu Wang (1):
      drm/bridge: imx8mp-hdmi-pai: enable PM runtime

 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c       | 15 +++++++++
 drivers/gpu/drm/gma500/psb_irq.c                   | 36 ++++++++--------------
 drivers/gpu/drm/mgag200/mgag200_bmc.c              | 31 ++++++++-----------
 drivers/gpu/drm/mgag200/mgag200_drv.h              |  6 ++++
 drivers/gpu/drm/nouveau/include/nvif/client.h      |  2 +-
 drivers/gpu/drm/nouveau/include/nvif/driver.h      |  2 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/device.h |  3 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/engine.h |  2 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/object.h |  5 +--
 drivers/gpu/drm/nouveau/include/nvkm/core/oproxy.h |  2 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h |  4 +--
 .../drm/nouveau/include/nvkm/core/suspend_state.h  | 11 +++++++
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |  6 ++++
 drivers/gpu/drm/nouveau/nouveau_display.c          |  2 --
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  2 +-
 drivers/gpu/drm/nouveau/nouveau_nvif.c             | 10 ++++--
 drivers/gpu/drm/nouveau/nvif/client.c              |  4 +--
 drivers/gpu/drm/nouveau/nvkm/core/engine.c         |  4 +--
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c          |  4 +--
 drivers/gpu/drm/nouveau/nvkm/core/object.c         | 20 +++++++++---
 drivers/gpu/drm/nouveau/nvkm/core/oproxy.c         |  2 +-
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c         | 18 +++++++++--
 drivers/gpu/drm/nouveau/nvkm/core/uevent.c         |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h      |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  | 22 ++++++++++---
 drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c   |  4 +--
 drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c    |  4 +--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/falcon.c       |  4 +--
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c   |  6 ++--
 drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c      |  4 +--
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c      |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c      |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c      |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.h      |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c      |  4 +--
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/base.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/xtensa.c       |  4 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c |  4 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c   |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c   |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h     |  8 ++---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  |  8 ++---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c  |  6 ++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c |  8 ++---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c   |  6 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/timer/base.c   |  2 +-
 67 files changed, 207 insertions(+), 138 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/suspend_state.h
