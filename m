Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFA6D230FF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 09:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A5410E179;
	Thu, 15 Jan 2026 08:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zeQZjWMG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HY/1CnAc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zeQZjWMG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HY/1CnAc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4F610E179
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:21:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F3B6133694;
 Thu, 15 Jan 2026 08:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768465292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=B73bsXW/dn42L/xmLYY7VT5BOiWns8UULJCcXEDPK6M=;
 b=zeQZjWMG4OH5/A8CVCG8FKhLjeL9coqM/Vls5LnmItpN+qqzFqQpjMJxdo1MoNDE5WbvVw
 sQaWpPx/75R6XfEiDaEtwfQ/1VEDSLjY0Qrk2/LYp/IjUOlu3mrsXsCGYtSEM5yb77JvAk
 BoAzJE2d4LZmm6Ihrnig4QEnj2WkuuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768465292;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=B73bsXW/dn42L/xmLYY7VT5BOiWns8UULJCcXEDPK6M=;
 b=HY/1CnAcR8HMUf2REUZXRONqbtJnjyL7lspXKg+1Ax2xoE0m/cmDkWzcbCGoax1hm2xYLr
 qBQJL61fyuElBJAw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zeQZjWMG;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="HY/1CnAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768465292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=B73bsXW/dn42L/xmLYY7VT5BOiWns8UULJCcXEDPK6M=;
 b=zeQZjWMG4OH5/A8CVCG8FKhLjeL9coqM/Vls5LnmItpN+qqzFqQpjMJxdo1MoNDE5WbvVw
 sQaWpPx/75R6XfEiDaEtwfQ/1VEDSLjY0Qrk2/LYp/IjUOlu3mrsXsCGYtSEM5yb77JvAk
 BoAzJE2d4LZmm6Ihrnig4QEnj2WkuuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768465292;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=B73bsXW/dn42L/xmLYY7VT5BOiWns8UULJCcXEDPK6M=;
 b=HY/1CnAcR8HMUf2REUZXRONqbtJnjyL7lspXKg+1Ax2xoE0m/cmDkWzcbCGoax1hm2xYLr
 qBQJL61fyuElBJAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A145E3EA63;
 Thu, 15 Jan 2026 08:21:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id F2IvJoujaGkjBQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jan 2026 08:21:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/12] drm, coreboot: Add DRM coreboot driver
Date: Thu, 15 Jan 2026 08:57:10 +0100
Message-ID: <20260115082128.12460-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
 RCPT_COUNT_TWELVE(0.00)[12];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: F3B6133694
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Coreboot implements framebuffer support via simple-framebuffer. Provide a
dedicated DRM driver. Keep the simple-framebuffer code for now.

For each firmware's provided framebuffer, we prefer a dedicated DRM driver
tailored towards the platform's feature set. The coreboot framebuffer
device currently creates a simple-framebuffer device for the provided
framebuffer aperture. But simple-framebuffer is for DeviceTree nodes; not
for coreboot. The simple-framebuffer infrastructure should be phased out
for non-DT use cases. Coreboot is one of the final users of the code
(besides n64).

Patches 1 to 5 start by fixing problems in the coreboot framebuffer
implementation. There is a possible dangling pointer, the memory is
marked as busy, the device hierarchy is incorrect, and a few minor things.

Patches 6 to 9 prepare the coreboot support for use by external drivers.
Specifically, structures for the entries os the coreboot payload table
have to be exported.

Patches 10 to 12 add corebootdrm, a DRM driver for the new
coreboot-framebuffer platform device. Corebootdrm follows the pattern
established by similar drivers. It also uses the same sysfb helpers. It
is therefore fairly small. With patch 11, it has feature parity with
simpledrm on the old simple-framebuffer. Patch 12 adds support for panel-
orientation flags that coreboot makes available.

Tested on an HP Chromebook with MrChromebox 4.16. Runs with Weston and
fbcon. Xorg requires an additional patch available at [1].

v2:
- keep design of coreboot framebuffer code intact (Julius)
- fix bugs in the coreboot framebuffer code
- rewrite corebootdrm as platform device
- support panel orientation

[1] https://gitlab.freedesktop.org/tzimmermann/xserver/-/commit/0b326aad28549762ed2b0e2bedf8f8a42f1f6b3b

Thomas Zimmermann (12):
  firmware: google: framebuffer: Do not unregister platform device
  firmware: google: framebuffer: Do not mark framebuffer as busy
  firmware: google: framebuffer: Init memory resource with helper macro
  firmware: google: framebuffer: Tie platform device to PCI hardware
  firmware: google: framebuffer: Fix dependencies
  firmware: google: Init coreboot bus with subsys_initcall()
  firmware: google: Clean up include statements in coreboot_table.h
  firmware: google: Export coreboot table entries
  firmware: google: Pack structures for coreboot table entries
  drm/sysfb: Generalize pixel-format matching
  drm/sysfb: corebootdrm: Add DRM driver for coreboot framebuffers
  drm/corebotdrm: Support panel orientation

 MAINTAINERS                                   |   1 +
 drivers/firmware/google/Kconfig               |   5 +-
 drivers/firmware/google/cbmem.c               |   1 +
 drivers/firmware/google/coreboot_table.c      |  13 +-
 drivers/firmware/google/coreboot_table.h      |  59 +--
 .../firmware/google/framebuffer-coreboot.c    | 122 +++--
 drivers/firmware/google/memconsole-coreboot.c |   1 +
 drivers/firmware/google/vpd.c                 |   1 +
 drivers/gpu/drm/sysfb/Kconfig                 |  16 +
 drivers/gpu/drm/sysfb/Makefile                |   1 +
 drivers/gpu/drm/sysfb/corebootdrm.c           | 434 ++++++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb.c             |  24 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |   8 +-
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c |  30 --
 drivers/gpu/drm/sysfb/efidrm.c                |   8 +-
 drivers/gpu/drm/sysfb/vesadrm.c               |   8 +-
 include/linux/coreboot.h                      |  80 ++++
 17 files changed, 689 insertions(+), 123 deletions(-)
 create mode 100644 drivers/gpu/drm/sysfb/corebootdrm.c
 create mode 100644 include/linux/coreboot.h


base-commit: d5b0278e4bea2fb27de6d12b7f865a74072af677
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: a5a973e527c88a5b47053d7a72aefe0b550197cb
prerequisite-patch-id: 719d09751d38f5da743beed6266585ee063e1e29
-- 
2.52.0

