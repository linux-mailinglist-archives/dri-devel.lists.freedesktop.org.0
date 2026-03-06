Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAZ4IfMyqmmNNAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:50:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FDF21A5E6
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A36810E2E1;
	Fri,  6 Mar 2026 01:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iJ6KU0B9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88F510E2C2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 01:50:39 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-45f18e8f2f5so5621341b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 17:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772761839; x=1773366639; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bkFWDNzYpAaNf6nKTX9X2HQLMlJtuGjLEa5TVIf/IA4=;
 b=iJ6KU0B9xpJmpAsnoXuhKqsVAnPEzYjYgty+P0/JMZMxUvgkTOAkk6kUG8Dx+JQaUD
 OthHA9qZiFXu4hXIVQH9U7RLpVHmi/WsCikVQuDwLvJCjgJjiZqMIJZ+Tf8XejENNKrO
 JTKhfcx4bKMclqFOKKiwrG6LdOju3iW9pkv/KwKoQ9lShGZgzU3gep+mG8T6wTCghQqL
 1zrEZ80GgQHIi/GVfccTOUYrQVwm/rUNSjjF5ObN5aoKrrpFsWfsjgj8DbJOpjwKZLsV
 N2zjXz7GpfLcOH865jrEuIJxZsRPYmq9b1w9X57RFzG0hpCGqQOqEKEGlipFTS5l0x9Y
 aToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772761839; x=1773366639;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkFWDNzYpAaNf6nKTX9X2HQLMlJtuGjLEa5TVIf/IA4=;
 b=GLVYeYx6S/drlV3PStJ9j4hIlOQbp5NASFphainiKjXTokMbJ8Vymbctyfox1QJfna
 rOt8Z+nTXpNvedU3FL0OZaJcQaaZFfvM9ti1xYckYihzV6jqGyr7taFuOstMwNplKHLf
 r28Jl0MxL5X5P90t1wmGJ/cPzlj02VHz1NkBy7tgUX8CZtOqUIebazQVLE6Ah19xan4Q
 0TuAaoTulrUfyo1dIuc7mHee/RpbNb1jsXlaGfjKFNjXAW7tMH8UihgqDvEEdZfOuUnp
 Zn9Kij8vaD9NdBNzILy5C6DvlUDBxBwIv0MT1rTwtMPfjn0XpY6wJmEcSf50wiGTW3Hk
 y/uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVH/yCvHdELRXYu8Vh149A0D4uxiSU8jFetm7GZikv5iUR4z12MRKPw6tC80EkPaw9WWaiEr14GWo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLBbuJaXiWmrqErciP/YBDt7aCQSCKq/ZkdqkmH+jEzIn90Qyo
 Tz3rIxCYpPlHkArgXNN5O20iuczM57cXxfGNEvPXJ+CNkMiirULkT+gJ
X-Gm-Gg: ATEYQzxfgRiYT6T/wWmg5y7u2dv32fvtWnxknzRJ1WZNcYz/PTLgozi5kHRLft/Z+2C
 DX34mV+kpvDsdGODwd7BkZG1K6YdbpKzIRhi69px19cyjFwEjH6PTe4dv5UatIBTtRMJRJ5pBhO
 0bOYYiFyGfdzt5uzNCbVVclFP5HLiZzvxC4pLFB034A3qAmiVzaxaWFnGLizRzfpUH6FJJucOhf
 XTpi3577RDw/WyKsPgKTQyCB4gy+IGpLhEKAUy5iqPO9ld45kbGa5KUoEZedhPQvl2TivqV3Lrc
 qa0WqChKqHt9w3A852oqHIGHY5SL+4TCNzIpv1PNcAgnuqacBzaKqgMoLHWez6ojN/JcjqEmoOH
 NMZZUzLOGIOQ3kUHcnwXRL9FSWPQvYzVRpbaozSoqQe3W54WgqBI43GK1hGuBk/92koE139CXz9
 PnENyKf91PhxPaLMEAcIkbflOfTZSEoKTWlfQ0MTV4KN/XXZfo
X-Received: by 2002:a05:6820:4487:b0:679:96f:3f11 with SMTP id
 006d021491bc7-67b9bd4c44bmr385436eaf.64.1772761838800; 
 Thu, 05 Mar 2026 17:50:38 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-67b9cc1a627sm115245eaf.6.2026.03.05.17.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 17:50:38 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [RFC PATCH 0/7] queued static-key API reduces IPIs to 134/16154 in
 dyndbg 
Date: Thu,  5 Mar 2026 18:50:03 -0700
Message-ID: <20260306015022.1940986-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
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
X-Rspamd-Queue-Id: 34FDF21A5E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:intel-gvt-dev@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:jim.cromie@gmail.com,m:jimcromie@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[drm-misc-fixes-2026-02-26-78-g535e886b182f:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

This patchset formalizes and exposes the internal
architecture-specific arch_jump_label_transform_queue API as a public
kernel interface (static_key_*_queued).

Currently, dynamic_debug toggles static keys individually, which
triggers a machine-wide synchronization (IPI) for every callsite.
This causes $O(N)$ overhead.

By using the new queued API, (which also adds an insert-sort to the
queue) dynamic_debug can now toggle up to 256 sites (x86 queue length)
with a single IPI.

Without the sort, dyndbg saw a far more modest IPI reduction; ~6k/16k.
Ordered descriptors does not insure ordered patch-addresses.
Currently, only x86 has the sort.

I tested on virtme-ng, using:

  echo +p > /proc/dynamic_debug/control
  echo -p > /proc/dynamic_debug/control

With this patch and test, IPIs reduced to 134 from 16154.

Patchset also changes virtio.c to use pr_debug_ratelimited() instead
of pr_debug(), which otherwise flooded my test-setup, obscuring
results.

serial_core.c also gets 1 _ratelimited() change, though I didnt see
them in my setup, and likely missed a few conversion candidates.

Patchset also includes a new query-cmd syntax for dyndbg:

  echo 'module !virtio* +p' > /proc/dynamic_debug/control
  echo -p > /proc/dynamic_debug/control

It further reduced the console output, so might have sufficient
utility for eventual inclusion, despite lacking and/or logic.

The patch hoisting the static_key_apply_queued() out of
ddebug_change() up to ddebug_exec_queries() does nothing in this case,
and would only affect multi-queries:

  echo 'module !virtio* +p ; module serial -p' > /proc/dynamic_debug/control

ISTM such queries are currently rare, but could be leveraged in
classmap-params, to optimize drm.debug=0x1ff, which currently would
get one query-command per bit (12+ IPIs).

DRM is the biggest potential beneficiary of this:

root@drm-misc-fixes-2026-02-26-78-g535e886b182f:/home/jimc/projects/lx/wk-D/b0-dd-drm-all# modprobe i915
[   20.405557] dyndbg:  25 debug prints in module i2c_core
[   20.459373] dyndbg: 340 debug prints in module drm
[   20.459851] ACPI: bus type drm_connector registered
[   20.471366] dyndbg:  89 debug prints in module drm_kms_helper
[   20.482336] dyndbg: 155 debug prints in module drm_display_helper
[   20.496153] dyndbg:   2 debug prints in module ttm
[   21.136619] dyndbg: 1801 debug prints in module i915
root@drm-misc-fixes-2026-02-26-78-g535e886b182f:/home/jimc/projects/lx/wk-D/b0-dd-drm-all# modprobe amdgpu
[   32.907485] dyndbg: 4532 debug prints in module amdgpu


Jim Cromie (7):
  jump_label: expose queueing API for batched static key updates
  virtio: use pr_debug_ratelimited to avoid flooding
  drivers/tty/serial/serial_core: ratelimit uart_wait_until_sent
  dyndbg: use static-key queueing API in dynamic-debug
  dyndbg: hoist static_key_apply_queued up
  lib/dynamic_debug: add negation support to queries
  dyndbg-test: test keyword !value negation

 arch/Kconfig                                  |   3 +
 arch/x86/Kconfig                              |   1 +
 arch/x86/kernel/alternative.c                 |  50 ++++---
 arch/x86/kernel/jump_label.c                  |  13 +-
 drivers/tty/serial/serial_core.c              |   4 +-
 drivers/virtio/virtio_ring.c                  |  12 +-
 include/linux/jump_label.h                    |  24 ++++
 kernel/jump_label.c                           | 125 ++++++++++++++++--
 lib/dynamic_debug.c                           |  88 ++++++++----
 .../dynamic_debug/dyndbg_selftest.sh          |  35 +++++
 10 files changed, 290 insertions(+), 65 deletions(-)

-- 
2.53.0

