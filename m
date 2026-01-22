Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAUhBNjycWmvZwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:50:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E064CC8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8131A10E968;
	Thu, 22 Jan 2026 09:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZP/05id";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5162110E04C;
 Thu, 22 Jan 2026 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769075410; x=1800611410;
 h=message-id:date:mime-version:from:subject:to:cc:
 content-transfer-encoding;
 bh=4ybfii4BWPoCK7ky/4CnvTh+jvaVeIkWliXRCAmJa+0=;
 b=IZP/05idLUKH8N4FWV3ureRHiDoxJGgiGi0mkOfk8WADZz9LkJqRzOCa
 6HAI51fMgQSuUFRhu4zF6k02oK7g8gKpZd8WbQueJamIR5ctdAPdC/ryE
 /jJsB1/YumzFEdDnu+rz4caZqLdNasf0miVFFUU9bgHITQ7+NsDdtjQ7c
 nnhS3XS72JJO4H+4/zpUjrr98XZw18/B3tbbmkyEni8uiEjIvxggADq91
 0NC8SxroyQB68cF8h/TZtVRpAtm1BEo4CvWH075LgseZzV9Kv2FbpxSjj
 t1an/rPvtoLg6Fj3YCoPXdG/+k7ytUUm56mKvVZl8uao8kXvFJ1nANOp/ w==;
X-CSE-ConnectionGUID: bi3bEmgeTr+lK/iRzAj3OQ==
X-CSE-MsgGUID: F7KVJ6XaTKufqVwp3iIciQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87729220"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87729220"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:50:07 -0800
X-CSE-ConnectionGUID: 2JpqYnYTSXuhZ6wEdRE0DA==
X-CSE-MsgGUID: fG1yCkqWTjWOLVzREsIzHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206746503"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.17])
 ([10.245.244.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:50:03 -0800
Message-ID: <4c2f66df-c990-448a-b466-99a66981272b@linux.intel.com>
Date: Thu, 22 Jan 2026 10:50:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PULL] drm-misc-fixes
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim,patchwork.freedesktop.org:url];
	FROM_NEQ_ENVFROM(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: B52E064CC8
X-Rspamd-Action: no action

Hi Dave, Sima,

Here's a pull request for v6.19. There were some small fixes related to colorops,
including a last minute fix to correct the intel pipeline ordering.

There are still some leaks in the unload and load failure paths,
https://patchwork.freedesktop.org/series/159261/ patches 5-13, but I feel those
can be addressed separately with less urgency so late in the release cycle.

Kind regards,
~Maarten Lankhorst

drm-misc-fixes-2026-01-22:
drm-msic-fixes for v6.19:

imagination:
- sync wait for logtype update completion to ensure FW trace is
  available

bridge/synopsis:
- Fix error paths in dw_dp_bind

nouveau:
- Add and implement missing DSB connector types, and improve unknown
  connector handling.
- Set missing atomic function ops.

intel/display, amd, vkms:
- (all) Fix a leak during device init where strings were leaked.
- (intel) Place 3D lut at correct place in colorops pipeline.

The following changes since commit 9dd1f5f3eb8cb175e2f7fd2a685bdb6b1bd2a726:

  Merge tag 'drm-misc-fixes-2026-01-16' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes (2026-01-16 20:27:21 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-01-22

for you to fetch changes up to 0a095b64fa5b4b1edfeb2e9b1751e044230c5d73:

  drm/i915/display: Fix color pipeline enum name leak (2026-01-22 10:26:55 +0100)

----------------------------------------------------------------
drm-msic-fixes for v6.19:

imagination:
- sync wait for logtype update completion to ensure FW trace is
  available

bridge/synopsis:
- Fix error paths in dw_dp_bind

nouveau:
- Add and implement missing DSB connector types, and improve unknown
  connector handling.
- Set missing atomic function ops.

intel/display, amd, vkms:
- (intel) Place 3D lut at correct place in colorops pipeline.
- (all) Fix a leak during device init where strings were leaked.

----------------------------------------------------------------
Alex Ramírez (2):
      drm/nouveau: add missing DCB connector types
      drm/nouveau: implement missing DCB connector types; gracefully handle unknown connectors

Brajesh Gupta (1):
      drm/imagination: Wait for FW trace update command completion

Chaitanya Kumar Borah (4):
      drm/i915/color: Place 3D LUT after CSC in plane color pipeline
      drm/amd/display: Fix color pipeline enum name leak
      drm/vkms: Fix color pipeline enum name leak
      drm/i915/display: Fix color pipeline enum name leak

Lyude Paul (1):
      drm/nouveau/disp: Set drm_mode_config_funcs.atomic_(check|commit)

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-fixes' into drm-misc-fixes

Osama Abdelkader (1):
      drm/bridge: synopsys: dw-dp: fix error paths of dw_dp_bind

 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c  |  4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 13 ++-
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            | 20 +++--
 .../gpu/drm/i915/display/intel_color_pipeline.c    | 36 ++++----
 drivers/gpu/drm/imagination/pvr_fw_trace.c         |  8 +-
 .../drm/nouveau/include/nvkm/subdev/bios/conn.h    | 95 +++++++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_display.c          |  2 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c   | 73 ++++++++++++-----
 drivers/gpu/drm/vkms/vkms_colorop.c                | 15 ++--
 9 files changed, 192 insertions(+), 74 deletions(-)
