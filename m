Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724307CF74F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 13:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B5C10E4C7;
	Thu, 19 Oct 2023 11:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B9C10E4C5;
 Thu, 19 Oct 2023 11:46:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7F9271F88B;
 Thu, 19 Oct 2023 11:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697715967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=PLDnM/toaIRsi/qxgoUHzTNOVJaQqnYg7Vx9UUzRpZ8=;
 b=wEssl7BC+7bQ+ifparmKrP/sOWQkl2H4a1l7ULRBlkx4SbC2RP7vWEh/JbOnRYMXxPJb2w
 jnaTztf5FtX6aBk6te6YSd3kSxprbqX8f3uno3k881FQ6on8jnOYpausBDXXriFcQytVUz
 6/+5fsAG3HmZsZ9f+22Q+HG1K9Xs5sg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697715967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=PLDnM/toaIRsi/qxgoUHzTNOVJaQqnYg7Vx9UUzRpZ8=;
 b=0s5Ndoa3SbhmPdkYqzkH9cNTYwqfy+FvRxgxGTeT1a7cJjcMPwEQLEw41NKZGWq3lgrQt5
 jkIX75At2Y/h8FDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CAC9139C2;
 Thu, 19 Oct 2023 11:46:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NiCqEf8WMWWJJwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 19 Oct 2023 11:46:07 +0000
Date: Thu, 19 Oct 2023 13:46:05 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20231019114605.GA22540@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.60
X-Spamd-Result: default: False [-6.60 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_TWELVE(0.00)[12];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

this is the PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2023-10-19:
Short summary of fixes pull:

amdgpu:
- Disable AMD_CTX_PRIORITY_UNSET

bridge:
- ti-sn65dsi86: Fix device lifetime

edid:
- Add quirk for BenQ GW2765

ivpu:
- Extend address range for MMU mmap

nouveau:
- DP-connector fixes
- Documentation fixes

panel:
- Move AUX B116XW03 into panel-simple

scheduler:
- Eliminate DRM_SCHED_PRIORITY_UNSET

ttm:
- Fix possible NULL-ptr deref in cleanup
The following changes since commit c1165df2be2fffe3adeeaa68f4ee4325108c5e4e:

  drm/tiny: correctly print `struct resource *` on error (2023-10-12 10:57:07 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-10-19

for you to fetch changes up to 8f5ad367e8b884772945c6c9fb622ac94b7d3e32:

  accel/ivpu: Extend address range for MMU mmap (2023-10-19 08:01:20 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

amdgpu:
- Disable AMD_CTX_PRIORITY_UNSET

bridge:
- ti-sn65dsi86: Fix device lifetime

edid:
- Add quirk for BenQ GW2765

ivpu:
- Extend address range for MMU mmap

nouveau:
- DP-connector fixes
- Documentation fixes

panel:
- Move AUX B116XW03 into panel-simple

scheduler:
- Eliminate DRM_SCHED_PRIORITY_UNSET

ttm:
- Fix possible NULL-ptr deref in cleanup

----------------------------------------------------------------
Douglas Anderson (1):
      drm/panel: Move AUX B116XW03 out of panel-edp back to panel-simple

Hamza Mahfooz (1):
      drm/edid: add 8 bpc quirk to the BenQ GW2765

Jacek Lawrynowicz (1):
      accel/ivpu: Don't enter d0i3 during FLR

Karol Herbst (1):
      drm/nouveau/disp: fix DP capable DSM connectors

Karolina Stolarek (1):
      drm/ttm: Reorder sys manager cleanup step

Luben Tuikov (2):
      drm/amdgpu: Unset context priority is now invalid
      gpu/drm: Eliminate DRM_SCHED_PRIORITY_UNSET

Randy Dunlap (1):
      drm/nouveau: exec: fix ioctl kernel-doc warning

Stanislaw Gruszka (1):
      Revert "accel/ivpu: Use cached buffers for FW loading"

Stephen Boyd (1):
      drm/bridge: ti-sn65dsi86: Associate DSI device lifetime with auxiliary device

Wludzik, Jozef (1):
      accel/ivpu: Extend address range for MMU mmap

 drivers/accel/ivpu/ivpu_drv.c                    | 11 ++++++--
 drivers/accel/ivpu/ivpu_drv.h                    |  1 +
 drivers/accel/ivpu/ivpu_fw.c                     |  9 +++---
 drivers/accel/ivpu/ivpu_gem.h                    |  5 ----
 drivers/accel/ivpu/ivpu_hw.h                     |  8 ++++++
 drivers/accel/ivpu/ivpu_hw_37xx.c                |  1 +
 drivers/accel/ivpu/ivpu_hw_40xx.c                |  1 +
 drivers/accel/ivpu/ivpu_mmu_context.c            |  9 ++----
 drivers/accel/ivpu/ivpu_pm.c                     |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c          |  5 ++--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c            | 14 +++++-----
 drivers/gpu/drm/drm_edid.c                       |  3 ++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c | 14 +++++++++-
 drivers/gpu/drm/panel/panel-edp.c                | 29 --------------------
 drivers/gpu/drm/panel/panel-simple.c             | 35 ++++++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_device.c                 |  8 +++---
 include/drm/gpu_scheduler.h                      |  3 +-
 include/uapi/drm/nouveau_drm.h                   |  4 +--
 18 files changed, 96 insertions(+), 67 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
