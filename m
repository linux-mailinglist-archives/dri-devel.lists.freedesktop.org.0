Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E49C66972
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 00:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3733D10E0A2;
	Mon, 17 Nov 2025 23:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="R7xl+c66";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFA910E0A2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 23:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763423542;
 bh=smDe7iZaNTeEZMAeqC1VMg7ernXF86ghORb8bmGZPKY=;
 h=From:Subject:Date:To:Cc:From;
 b=R7xl+c66pKCYxVqNmPaz6Fxv7XsNEs2LQ6O7BU5ZPj/D9rOPmBechDZtL4filkNP4
 a0whXlt5vciZn687K8FkXR2nUE/GhHx+dE/uExo4IntIuyR1ebXuGAaqLvx5FFIFNr
 eHUKp2KSQib4olM26jwE/cRaJWQrYRNBqzZN9HVoJeM+8yJ2gcwBmMkfigM4bUy1ZP
 VBeH3POm+7Cf8Fp7SCXpjBUT+9xdLhrh+tN/EpjKrrWKrE5Gq0lUA1PxBg4envvoGC
 fEIJjy+hz8OWk31gJETioTY/6lqo9FHFmcum732ZXDVR1YxKdlaTbGWZyzyZ4lVTs9
 6LOlqs9KNXiKA==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4419E17E10F3;
 Tue, 18 Nov 2025 00:52:22 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v3 0/4] Introduce BACKGROUND_COLOR DRM CRTC property
Date: Tue, 18 Nov 2025 01:51:58 +0200
Message-Id: <20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB61G2kC/2XM3wrCIByG4VsZHmf4B5l21H1EB/pTN2nN0JBie
 O+5BR2sw/eD71lQdim4jE7dgpIrIYc4t+CHDsGo58HhYFsjRpggkimcblxIic0AcYoJA9W9UVq
 Q3gBqp0dyPrw28HJtPYb8jOm9+YWu65dShO2pQjHB3qreekWtVP7c9kmbmPQR4h2tXGE/ghLK/
 wjWCCYAuKTEaAl7otb6AVDxXiDzAAAA
X-Change-ID: 20250829-rk3588-bgcolor-c1a7b9a507bc
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Matt Roper <matthew.d.roper@intel.com>
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
[2] https://lore.kernel.org/all/20251118-crtc-bgcolor-v2-1-dce4063f85a9@collabora.com/
[3] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1845

IGT kms_crtc_background_color test results
==========================================

* VKMS

virtme-ng$ IGT_FORCE_DRIVER=vkms build/tests/kms_crtc_background_color

IGT-Version: 2.2-gf50583245 (x86_64) (Linux: 6.18.0-rc5-next-20251111+ x86_64)
Using IGT_SRANDOM=1763159189 for randomisation
Opened device: /dev/dri/card0
Starting subtest: background-color-red
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.071s)
Subtest background-color-red: SUCCESS (0.072s)
Starting subtest: background-color-green
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.072s)
Subtest background-color-green: SUCCESS (0.072s)
Starting subtest: background-color-blue
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.072s)
Subtest background-color-blue: SUCCESS (0.072s)
Starting subtest: background-color-yellow
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.073s)
Subtest background-color-yellow: SUCCESS (0.073s)
Starting subtest: background-color-purple
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.073s)
Subtest background-color-purple: SUCCESS (0.073s)
Starting subtest: background-color-cyan
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.073s)
Subtest background-color-cyan: SUCCESS (0.073s)
Starting subtest: background-color-black
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.073s)
Subtest background-color-black: SUCCESS (0.073s)
Starting subtest: background-color-white
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.072s)
Subtest background-color-white: SUCCESS (0.072s)

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

 drivers/gpu/drm/drm_atomic_state_helper.c    |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c            |  4 ++
 drivers/gpu/drm/drm_blend.c                  | 39 ++++++++++++++--
 drivers/gpu/drm/drm_mode_config.c            |  6 +++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 +++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++
 drivers/gpu/drm/vkms/vkms_composer.c         | 10 ++++-
 drivers/gpu/drm/vkms/vkms_crtc.c             |  3 ++
 include/drm/drm_blend.h                      |  4 +-
 include/drm/drm_crtc.h                       | 12 +++++
 include/drm/drm_mode_config.h                |  5 +++
 include/linux/math.h                         | 18 +-------
 include/uapi/drm/drm_mode.h                  | 67 ++++++++++++++++++++++++++++
 include/uapi/linux/const.h                   | 17 +++++++
 14 files changed, 178 insertions(+), 25 deletions(-)
---
base-commit: 92c49b3f4df8f9acfa95551ef38fc00c675319fd
change-id: 20250829-rk3588-bgcolor-c1a7b9a507bc

