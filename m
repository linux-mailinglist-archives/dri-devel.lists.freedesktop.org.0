Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPq3LcQ6qWkd3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:11:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6876A20D3D3
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F3910EB65;
	Thu,  5 Mar 2026 08:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="X3L6OlWS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UmvYUWCu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X3L6OlWS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UmvYUWCu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9464810EB66
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 08:11:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 42DAE5BCDE;
 Thu,  5 Mar 2026 08:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772698302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HoozE6gU4OEeRJdxrsg6eoYY5uOd4As2YPnVTLVVb/I=;
 b=X3L6OlWSJS6tWkYtlWF3wN4yqVcmfPt0QPVwcLNXmN9XLJBxkOQDlJQW/8/fj7O4RBWc7m
 6KZuAzBennVboGGnDopbECeGxDp+lNGqu3N9nD4C4YBxi39zbb8Q/qZYrbXARzWsEFZDu8
 fRFK9OoHxDit3pfLWaexZLJYszglzME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772698302;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HoozE6gU4OEeRJdxrsg6eoYY5uOd4As2YPnVTLVVb/I=;
 b=UmvYUWCuP759n4bkKP51b7if864GCWUAolp0N6nbVvLTcmMlF6oLSu9yRAxDZuidSiUzYp
 JS7+i1jdM9/t6qBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772698302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HoozE6gU4OEeRJdxrsg6eoYY5uOd4As2YPnVTLVVb/I=;
 b=X3L6OlWSJS6tWkYtlWF3wN4yqVcmfPt0QPVwcLNXmN9XLJBxkOQDlJQW/8/fj7O4RBWc7m
 6KZuAzBennVboGGnDopbECeGxDp+lNGqu3N9nD4C4YBxi39zbb8Q/qZYrbXARzWsEFZDu8
 fRFK9OoHxDit3pfLWaexZLJYszglzME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772698302;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HoozE6gU4OEeRJdxrsg6eoYY5uOd4As2YPnVTLVVb/I=;
 b=UmvYUWCuP759n4bkKP51b7if864GCWUAolp0N6nbVvLTcmMlF6oLSu9yRAxDZuidSiUzYp
 JS7+i1jdM9/t6qBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D6D2A3EA76;
 Thu,  5 Mar 2026 08:11:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Y+EpM706qWlmWAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Mar 2026 08:11:41 +0000
Date: Thu, 5 Mar 2026 09:11:40 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20260305081140.GA171266@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
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
X-Rspamd-Queue-Id: 6876A20D3D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona.vetter@ffwll.ch,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:rodrigo.vivi@intel.com,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:ogabbay@kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:dim-tools@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,suse.de:dkim,suse.com:url]
X-Rspamd-Action: no action

Hi Dave, Sima,

this is the PR for drm-misc-next for this week.

Best regards
Thomas

drm-misc-next-2026-03-05:
drm-misc-next for v7.1:

Cross-subsystem Changes:

dma-buf:
- Prepare for compile-time concurrency analysis

Core Changes:

buddy:
- Improve assert testing

sched:
- Fix race condition in drm_sched_fini()
- Mark slow tests

Driver Changes:

bridge:
- waveshare-dsi: Fix register and attach; Support 1..4 DSI lanes plus DT bindings

gma500:
- Use DRM client buffer for fbdev framebuffer

gud:
- Test for imported buffers with helper

imagination:
- Fix power domain handling

ivpu:
- Update boot API to v3.29.4
- Limit per-user number of doorbells and contexts

nouveau:
- Test for imported buffers with helper

panel:
- panel-edp: Fix timings for BOE NV140WUM-N64

panfrost:
- Test for imported buffers with helper

panthor:
- Test for imported buffers with helper

vc4:
- Test for imported buffers with helper
The following changes since commit 17b95278ae6adb9ea5b801fcd2ae5d182448e99d:

  Merge tag 'drm-xe-next-2026-03-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2026-03-03 10:37:29 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2026-03-05

for you to fetch changes up to d2e20c8951e4bb5f4a828aed39813599980353b6:

  drm/gud: Test for imported buffers with drm_gem_is_imported() (2026-03-05 08:14:09 +0100)

----------------------------------------------------------------
drm-misc-next for v7.1:

Cross-subsystem Changes:

dma-buf:
- Prepare for compile-time concurrency analysis

Core Changes:

buddy:
- Improve assert testing

sched:
- Fix race condition in drm_sched_fini()
- Mark slow tests

Driver Changes:

bridge:
- waveshare-dsi: Fix register and attach; Support 1..4 DSI lanes plus DT bindings

gma500:
- Use DRM client buffer for fbdev framebuffer

gud:
- Test for imported buffers with helper

imagination:
- Fix power domain handling

ivpu:
- Update boot API to v3.29.4
- Limit per-user number of doorbells and contexts

nouveau:
- Test for imported buffers with helper

panel:
- panel-edp: Fix timings for BOE NV140WUM-N64

panfrost:
- Test for imported buffers with helper

panthor:
- Test for imported buffers with helper

vc4:
- Test for imported buffers with helper

----------------------------------------------------------------
Bart Van Assche (1):
      dma-buf: Suppress a thread-safety complaint

Haikun Zhou (1):
      drm/panel-edp: Change BOE NV140WUM-N64 timings

Karol Wachowski (1):
      accel/ivpu: Limit number of maximum contexts and doorbells per user

Maciej Falkowski (1):
      accel/ivpu: Update FW Boot API to version 3.29.4

Marek Vasut (3):
      drm/bridge: waveshare-dsi: Register and attach our DSI device at probe
      dt-bindings: display: bridge: waveshare,dsi2dpi: Document 1..4 DSI lane support
      drm/bridge: waveshare-dsi: Add support for 1..4 DSI data lanes

Matt Coster (3):
      drm/imagination: Check for NULL struct dev_pm_domain_list
      drm/imagination: Detach pm domains if linking fails
      drm/imagination: Ensure struct pvr_device->power is initialized

Maxime Ripard (1):
      drm/tests: Mark slow tests as slow

Philipp Stanner (1):
      drm/sched: Remove racy hack from drm_sched_fini()

Sanjay Yadav (1):
      gpu/buddy: Introduce gpu_buddy_assert() for kunit-aware assertions

Thomas Zimmermann (11):
      drm/nouveau: Test for imported buffers with drm_gem_is_imported()
      drm/panfrost: Test for imported buffers with drm_gem_is_imported()
      drm/panthor: Test for imported buffers with drm_gem_is_imported()
      drm/client: Export drm_client_buffer_create()
      drm/gma500: fbdev: Set framebuffer size to GEM object size
      drm/gma500: fbdev: Calculate buffer geometry with format helpers
      drm/gma500: fbdev: Use a DRM client buffer
      drm/gma500: Create framebuffers with drm_gem_fb_create()
      drm/vc4: Test for imported buffers with drm_gem_is_imported()
      Merge drm/drm-next into drm-misc-next
      drm/gud: Test for imported buffers with drm_gem_is_imported()

 .../bindings/display/bridge/waveshare,dsi2dpi.yaml |   3 +
 drivers/accel/ivpu/ivpu_drv.c                      |  94 ++++++++-
 drivers/accel/ivpu/ivpu_drv.h                      |  26 ++-
 drivers/accel/ivpu/ivpu_job.c                      |  36 +++-
 drivers/accel/ivpu/vpu_boot_api.h                  | 211 +++++++++------------
 drivers/dma-buf/dma-resv.c                         |   5 +-
 drivers/gpu/buddy.c                                |  36 +++-
 drivers/gpu/drm/bridge/waveshare-dsi.c             |  14 +-
 drivers/gpu/drm/drm_client.c                       |   3 +-
 drivers/gpu/drm/gma500/fbdev.c                     | 101 +++++-----
 drivers/gpu/drm/gma500/framebuffer.c               | 104 +---------
 drivers/gpu/drm/gma500/psb_drv.h                   |   6 -
 drivers/gpu/drm/gud/gud_pipe.c                     |   2 +-
 drivers/gpu/drm/imagination/pvr_power.c            |  52 +++--
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   2 +-
 drivers/gpu/drm/panel/panel-edp.c                  |   9 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c            |   2 +-
 drivers/gpu/drm/panthor/panthor_gem.c              |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  38 +---
 drivers/gpu/drm/scheduler/tests/tests_basic.c      |   4 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |   2 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |   2 +-
 drivers/gpu/tests/gpu_buddy_test.c                 |   2 +-
 include/drm/drm_client.h                           |   3 +
 24 files changed, 388 insertions(+), 371 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)
