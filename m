Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDluHYg1p2k9fwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 20:24:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A361F5F0A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 20:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5746710E8A2;
	Tue,  3 Mar 2026 19:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NewCSqQa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E6010E06A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 19:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772565888;
 bh=dtIiUDlss3QK5iC/FpbPGRm8q1fUo2OdFnyI1yPLxXA=;
 h=From:Subject:Date:To:Cc:From;
 b=NewCSqQaAGpNLo1qTDgcEFSTVWpPuF4EgfRHiM1OLKPdGefk+phe86G9892sWdeJ7
 y/ZZc57I2MzpSfURAtoUYy1nUiAODiHhyP+56kvLeLyBlld2T+VMkqAgyZMqxWW0gc
 TbYJVp/vD8tLBx9DiuwjF8VRiPcoq6D3n0YaS56B+ZkYJVx64G5ScjHC/P7Qr73fgM
 MEAuqH+Lr9zEnHw6b4urMB87DYiPLZdTjOTEnxVEKuyGCwt0hVygcMTwRW1bEJkwA0
 GNhLvn6Sy49oI2ZSuajnR1YX6JK0GpxOPLmNMjSmsHUsBTi8y0dw1vd2Fy/MQYkTk9
 /0JpQbjmO9oAQ==
Received: from localhost (unknown [86.123.23.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BB92317E0959;
 Tue,  3 Mar 2026 20:24:48 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v8 0/4] Introduce BACKGROUND_COLOR DRM CRTC property
Date: Tue, 03 Mar 2026 21:24:16 +0200
Message-Id: <20260303-rk3588-bgcolor-v8-0-fee377037ad1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23QwU7DMAwG4FeZcqYodusm4cR7IA6uk2wRY0Upq
 kBT3510CIpIj79lf/rlq5pCTmFSD4erymFOUxovJdi7g5ITX46hSb5khRpJW3RNfmnJ2mY4yng
 ecyPAZnBM2gyiytFbDjF93MCn55JPaXof8+fNn2GdflNO439qhkY30TvjowNvXXws8zMPY+Z7G
 V/Vys34S4CGtiKwEEgirQU9sJU9ot0IAFsRbSEYRZx2HdrAe0S3EQjVT+ZubREjAJrAhsweQT9
 Er8taRVAhBiRm20OLAHtE/5eoW/SFEKBoiLjTRHuE2QjUXUWYQhjrwWsQEq5aLMvyBSQ/b+xCA
 gAA
X-Change-ID: 20250829-rk3588-bgcolor-c1a7b9a507bc
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matt Roper <matthew.d.roper@intel.com>, Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.14.3
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
X-Rspamd-Queue-Id: C5A361F5F0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:jani.nikula@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:nfraprado@collabora.com,m:diederik@cknow-tech.com,m:angelogioacchino.delregno@collabora.com,m:matthew.d.roper@intel.com,m:andyshrk@163.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,cknow-tech.com,intel.com,163.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

Some display controllers can be hardware-configured to present non-black
colors for pixels which are not covered by any plane (or are exposed
through transparent regions of higher planes).

The 1st patch of the series provides DIV_ROUND_CLOSEST() to uapi, as a
prerequisite to the 2nd patch introducing the BACKGROUND_COLOR DRM
property that can be attached to a CRTC via a dedicated helper function.
A 64-bit ARGB color value format is also defined and can be manipulated
with the help of a few utility macros.

Note this is a reworked version of the patch [1] submitted (many) years
ago by Matt Roper.  The main changes are:

* Renamed DRM_ARGB_<COMP>() to DRM_ARGB64_GET<C>_BPC() while providing
  convenience wrappers to extract all 16 bits of a specific color via
  DRM_ARGB64_GET<C>()
* Replaced drm_argb() function with DRM_ARGB64_PREP_BPC() macro, to
  improve uAPI consistency and readability; additionally fixed a bug in
  case of using bpc < 16: the unused least-significant bits of a given
  component in the output value would contain the unused
  most-significant bits of the following component in the input value,
  instead of being set to 0
* Replaced GENMASK_ULL(63, 0) with U64_MAX when calling
  drm_property_create_range() to create the BACKGROUND_COLOR property
* Moved crtc_state->bgcolor initialization from
  __drm_atomic_helper_crtc_reset() to
  __drm_atomic_helper_crtc_state_reset()
* Replaced '*bgcolor*' occurrences to '*background_color*' for
  consistency with the actual property name in both storage field and
  helper functions names

The subsequent patches add background color support to VKMS and the VOP2
display controller used in the RK3568, RK3576, and RK3588 Rockchip SoC
families.

The validation has been done using a dedicated IGT test [2] - see the
reported results below.

On the userland side, a Weston merge request [3] is available, providing
support for the BACKGROUND_COLOR CRTC property to the DRM backend.  It
relies on the already existing background-color setting in weston.ini:

  [shell]
  background-color=0xAARRGGBB

[1] https://lore.kernel.org/all/20190930224707.14904-2-matthew.d.roper@intel.com/
[2] https://lore.kernel.org/all/20251219-crtc-bgcolor-v3-1-31b589911588@collabora.com/
[3] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1845

IGT kms_crtc_background_color test results
==========================================

* VKMS

virtme-ng$ IGT_FORCE_DRIVER=vkms build/tests/kms_crtc_background_color

IGT-Version: 2.3-g6b07138e8 (x86_64) (Linux: 6.19.0-rc1-virtme x86_64)
Using IGT_SRANDOM=1766149634 for randomisation
Opened device: /dev/dri/card0
Starting subtest: background-color-red
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.071s)
Subtest background-color-red: SUCCESS (0.073s)
Starting subtest: background-color-green
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.074s)
Subtest background-color-green: SUCCESS (0.074s)
Starting subtest: background-color-blue
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.074s)
Subtest background-color-blue: SUCCESS (0.074s)
Starting subtest: background-color-yellow
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.072s)
Subtest background-color-yellow: SUCCESS (0.073s)
Starting subtest: background-color-purple
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.072s)
Subtest background-color-purple: SUCCESS (0.074s)
Starting subtest: background-color-cyan
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.074s)
Subtest background-color-cyan: SUCCESS (0.074s)
Starting subtest: background-color-black
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.072s)
Subtest background-color-black: SUCCESS (0.072s)
Starting subtest: background-color-white
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.073s)
Subtest background-color-white: SUCCESS (0.074s)

* Radxa ROCK 5B (RK3588)

rock5b$ build/tests/kms_crtc_background_color --device drm:/dev/dri/card1

IGT-Version: 2.2-g3e4ec308e (aarch64) (Linux: 6.18.0-rc1 aarch64)
Using IGT_SRANDOM=1762774806 for randomisation
Opened device: /dev/dri/card1
Starting subtest: background-color-red
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.491s)
Subtest background-color-red: SUCCESS (0.493s)
Starting subtest: background-color-green
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.533s)
Subtest background-color-green: SUCCESS (0.535s)
Starting subtest: background-color-blue
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.541s)
Subtest background-color-blue: SUCCESS (0.544s)
Starting subtest: background-color-yellow
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.535s)
Subtest background-color-yellow: SUCCESS (0.537s)
Starting subtest: background-color-purple
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.536s)
Subtest background-color-purple: SUCCESS (0.538s)
Starting subtest: background-color-cyan
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.539s)
Subtest background-color-cyan: SUCCESS (0.541s)
Starting subtest: background-color-black
Starting dynamic subtest: pipe-C-DP-1
(kms_crtc_background_color:744) igt_pipe_crc-WARNING: Warning on condition all_zero in function crc_sanity_checks, file ../lib/igt_pipe_crc.c:475
(kms_crtc_background_color:744) igt_pipe_crc-WARNING: Suspicious CRC: All values are 0.
(kms_crtc_background_color:744) igt_pipe_crc-WARNING: Warning on condition all_zero in function crc_sanity_checks, file ../lib/igt_pipe_crc.c:475
(kms_crtc_background_color:744) igt_pipe_crc-WARNING: Suspicious CRC: All values are 0.
Dynamic subtest pipe-C-DP-1: SUCCESS (0.535s)
Subtest background-color-black: SUCCESS (0.537s)
Starting subtest: background-color-white
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.540s)
Subtest background-color-white: SUCCESS (0.542s)

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v8:
- Collected R-b tags from Louis Chauvet and Andy Yan
- Handled unsupported alpha-blending with background color in
  vop2_plane_atomic_check()
- Rebased series onto the very recent drm-misc-next
- Link to v7: https://lore.kernel.org/r/20260204-rk3588-bgcolor-v7-0-78d1d01c5ca1@collabora.com

Changes in v7:
- Consistently put "({" on a separate line for all macro definitions
  (Andy Shevchenko)
- Rebased series onto latest drm-misc-next
- Link to v6: https://lore.kernel.org/r/20260129-rk3588-bgcolor-v6-0-c15f755a4055@collabora.com

Changes in v6:
- Collected Acked-by & Reviewed-by tags from Andy S & Angelo
- Handled feedback from Andy Shevchenko
  * Fixed up styling for __KERNEL_DIV_ROUND_CLOSEST() macro
  * Made use of __GENMASK() helper in __DRM_ARGB64_PREP*() and
    __DRM_ARGB64_GET*() definitions
  * Introduced DRM_ARGB64_GET*_BPCS() as an alternative for
    DRM_ARGB64_GET*_BPC() to help when performance is more important
    than accuracy, e.g. used it along with FIELD_MODIFY() in the vop2
    related patch to simplify a bit the bgcolor operations
- Link to v5: https://lore.kernel.org/r/20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com

Changes in v5:
- Collected Reviewed-by & Tested-by tags from Nícolas & Diederik
- Dumped background_color prop value in drm_atomic_crtc_print_state()
  and updated comment in drm_crtc_state (Nícolas)
- Documented the reasons of not using the DRM_ARGB64_GET*_BPC() helpers
  in vop2 related patch (Nícolas)
- Rebased series onto latest drm-misc-next
- Link to v4: https://lore.kernel.org/r/20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com

Changes in v4:
- Switched to simple bit-shifting approach when performing the bpc
  conversion in the vop2 driver, to avoid the expensive division since
  we shouldn't be concerned anymore about the precision (Chaoyi)
- Rebased series onto latest drm-misc-next
- Link to v3: https://lore.kernel.org/r/20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com

Changes in v3:
- Added new patches:
  * uapi: Provide DIV_ROUND_CLOSEST()
  * drm/vkms: Support setting custom background color
- Improved DRM_ARGB64_{PREP|GET}*() helpers by using a conversion ratio
  for better color approximation when dealing with less than 16 bits of
  precision
- Mentioned the IGT test in the cover letter while documenting the
  validation results; also dropped references to the now useless
  modetest wrapper script and its generated report
- Rebased series onto latest drm-misc-next
- Link to v2: https://lore.kernel.org/r/20251013-rk3588-bgcolor-v2-0-25cc3810ba8c@collabora.com

Changes in v2:
- Improved uAPI consistency and readability by introducing
  DRM_ARGB64_PREP*() and DRM_ARGB64_GET*() helper macros
- Updated several code comment sections
- Referenced the counterpart Weston support in the cover letter
- Rebased series onto v6.18-rc1
- Link to v1: https://lore.kernel.org/r/20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com

---
Cristian Ciocaltea (4):
      uapi: Provide DIV_ROUND_CLOSEST()
      drm: Add CRTC background color property
      drm/vkms: Support setting custom background color
      drm/rockchip: vop2: Support setting custom background color

 drivers/gpu/drm/drm_atomic.c                 |  1 +
 drivers/gpu/drm/drm_atomic_state_helper.c    |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c            |  4 ++
 drivers/gpu/drm/drm_blend.c                  | 39 ++++++++++++--
 drivers/gpu/drm/drm_mode_config.c            |  6 +++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 24 ++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++
 drivers/gpu/drm/vkms/vkms_composer.c         | 10 +++-
 drivers/gpu/drm/vkms/vkms_crtc.c             |  3 ++
 include/drm/drm_blend.h                      |  4 +-
 include/drm/drm_crtc.h                       | 12 +++++
 include/drm/drm_mode_config.h                |  5 ++
 include/linux/math.h                         | 18 +------
 include/uapi/drm/drm_mode.h                  | 80 ++++++++++++++++++++++++++++
 include/uapi/linux/const.h                   | 18 +++++++
 15 files changed, 204 insertions(+), 25 deletions(-)
---
base-commit: fca11428425e92bf21d4a7f5865708c5e64430e4
change-id: 20250829-rk3588-bgcolor-c1a7b9a507bc

