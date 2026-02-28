Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJGaD03uomny8AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 14:31:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE2B1C33D7
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 14:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FCB10E147;
	Sat, 28 Feb 2026 13:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="inhGoeUZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E1310E2B3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772285510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1aKltuGD73YjisWVS6CLmrdjTwiXA9NrG9kYPekxkOw=;
 b=inhGoeUZL+NhNgJETTTshDi7/DDCAYG2wgMDoIA+erg1dWO3QQMDVK8y4k81YxgYmxr/mr
 2ZyIlPTCAdY0KLawi28ky+lgTRcIofbv94NfomhF7pT5rhzU1Wx9s3lXZNzMnOKnt4qkPw
 MAbd5SH+XH3STOC44QHAPp+IwNsMiPw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-k5xNQxTyNk6ExbBYiiP4bA-1; Sat, 28 Feb 2026 08:31:49 -0500
X-MC-Unique: k5xNQxTyNk6ExbBYiiP4bA-1
X-Mimecast-MFC-AGG-ID: k5xNQxTyNk6ExbBYiiP4bA_1772285508
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-358df8fbd1cso2705677a91.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 05:31:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772285508; x=1772890308;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1aKltuGD73YjisWVS6CLmrdjTwiXA9NrG9kYPekxkOw=;
 b=AGMw5iOXjZgQTIwqY739oWZCW0KoO9zOvCsGCaVirgTsEvj71WqErtXJU7o/62Tp7k
 0ipcFZAEyJe8A6qSYs/24yIIQcUFjEtMSrBcuQXUwzXvXN0zI/pqRZ7Zfaf+IT7mALdl
 WP4GZh1n9fkr0/TyGfzlZoKSgEVJtiJ6ek3Ad06C+wkj93tsw4Rf/GcHx4A2AlVFe8FI
 4ndM9TvvAe9yPJzeMBxnrb2ZCfMr9dM0bdUIyGrcQlFoF55S5R+ZXPXSSQs8MPk2/fdM
 wufOSIydSJFU72xqigJqpROITiZlV2FLsLDU0FT5ntJdotyX/mswuYQZg0fj1Gr4t5cr
 BQDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBKJMt00o9gENpPBwZwx8cB2ss7D0YmqNihkTVxndft1xQmLgpqYF9vB3xY9l/gPNcbJiRuLF69ok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7r1HHYHxekCJTDhXUpnyuGx9x+5XplZm/GudyuObdYzYSqKKh
 1ZiDNR5BWeKhPtjhvobsLgnjq7gpvLNpMx+251VchVF1a7fcldbVzzUVH//6IY+5NRGjjTpQRNO
 iXBkvtcajjyelPgpiY1AA5dwQvnLF2aDevZZEjjjOhdpuSrIlqASHc9F4Y8WkQSGlfBWLng==
X-Gm-Gg: ATEYQzwHLJVoVyhdMzQXGaqdFYj1CZcZcjoXRkEwWn83KyA4DlxKwQtNBvKvHJKo7SA
 0WT7hqbCxYCRHn+pYl5xyDnJUtwxq56UZjGy0VvtIxjb0HHmfOf5dOVn/Br2lFvzLulRJr1USAH
 BrOf1Xe1sc236YqPiwNHUWsKX8fj8hvjn7WIfdGStPFzWQoj5Ts916uYYZowL3Yln2GsaZNa9/9
 +iDzD48/5OObrTAk4hRc4vSKWGGuApkuM+SN4la+rE9sq1zyfFV474D8keheJsCxT1q+wIXyOJ8
 CYcE88IVjiVndLgjC9HxT1Je5JEuyCJ8a8HVJzue1Lgmdw/bJXIlGTWvZZua1FSjkBZdHcymUTC
 k2j2vaA1eKhFnCKZxPweKxDe9m2hteT/NHeE=
X-Received: by 2002:a17:90b:544b:b0:354:bd08:480c with SMTP id
 98e67ed59e1d1-35965d029fcmr5533357a91.30.1772285507837; 
 Sat, 28 Feb 2026 05:31:47 -0800 (PST)
X-Received: by 2002:a17:90b:544b:b0:354:bd08:480c with SMTP id
 98e67ed59e1d1-35965d029fcmr5533334a91.30.1772285507391; 
 Sat, 28 Feb 2026 05:31:47 -0800 (PST)
Received: from localhost.localdomain.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c70fa82dab1sm6844448a12.27.2026.02.28.05.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 05:31:46 -0800 (PST)
From: Tao Liu <ltao@redhat.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tao Liu <ltao@redhat.com>
Subject: [PATCH] i915: Fix NULL pointer dereference in
 intel_dmc_update_dc6_allowed_count()
Date: Sun,  1 Mar 2026 02:09:47 +1300
Message-ID: <20260228130946.50919-2-ltao@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a7fa-6rqzI11DQczaXq_j4N5L5S2ouw5_g6xql2J-aM_1772285508
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ltao@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ltao@redhat.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltao@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4CE2B1C33D7
X-Rspamd-Action: no action

There is a NULL pointer dereference issue noticed in i915 when 2nd kernel
bootup during kdump. This will panic 2nd kernel and lead to no vmcore
generation. The issue is observed in Meteorlake CPU(cpuid: 0xA06A2):

    BUG: kernel NULL pointer dereference, address: 0000000000000000
    #PF: supervisor read access in kernel mode
    #PF: error_code(0x0000) - not-present page
    PGD 0 P4D 0
    Oops: Oops: 0000 [#1] SMP NOPTI
    ...
    RIP: 0010:intel_dmc_update_dc6_allowed_count+0x16/0xa0 [i915]
    ...

It is easy to locate the NULL pointer dereference by disassembly:

    00000000001171e0 <intel_dmc_update_dc6_allowed_count>:
      1171e0:       f3 0f 1e fa             endbr64
      1171e4:       e8 00 00 00 00          call   1171e9
      1171e9:       41 55                   push   %r13
      1171eb:       41 54                   push   %r12
      1171ed:       55                      push   %rbp
      1171ee:       53                      push   %rbx
      1171ef:       4c 8b a7 18 03 00 00    mov    0x318(%rdi),%r12
      1171f6:       49 8b 2c 24             mov    (%r12),%rbp

To fix this, add a NULL pointer check before dereferencing.

Signed-off-by: Tao Liu <ltao@redhat.com>
---

The issue doesn't happen in 1st kernel, but in 2nd kernel of kdump. I'm not
an expert to i915 and unsure what lead to the NULL pointer. To help further
analysis, here is the full stack:

[    8.608520]  <TASK> 
[    8.610652]  gen9_set_dc_state.part.0+0x25d/0x2f0 [i915] 
[    8.616096]  icl_display_core_init+0x2d/0x620 [i915] 
[    8.621266]  intel_power_domains_init_hw+0x1b2/0x500 [i915] 
[    8.627047]  intel_display_driver_probe_noirq+0x87/0x300 [i915] 
[    8.633188]  i915_driver_probe+0x207/0x5d0 [i915] 
[    8.637977]  ? drm_privacy_screen_get+0x198/0x1c0 
[    8.642832]  local_pci_probe+0x41/0x90 
[    8.646646]  pci_call_probe+0x58/0x160 
[    8.650458]  ? pci_assign_irq+0x2f/0x160 
[    8.654447]  ? pci_match_device+0xf8/0x120 
[    8.658522]  pci_device_probe+0x95/0x140 
[    8.662582]  call_driver_probe+0x27/0x110 
[    8.666570]  really_probe+0xcc/0x2c0 
[    8.670190]  __driver_probe_device+0x78/0x120 
[    8.674692]  driver_probe_device+0x1f/0xa0 
[    8.678857]  __driver_attach+0xfa/0x230 
[    8.682757]  ? __pfx___driver_attach+0x10/0x10 
[    8.687185]  bus_for_each_dev+0x8e/0xe0 
[    8.691159]  bus_add_driver+0x11f/0x200 
[    8.694970]  driver_register+0x72/0xd0 
[    8.698853]  i915_init+0x26/0x90 [i915] 
[    8.702837]  ? __pfx_i915_init+0x10/0x10 [i915] 
[    8.707433]  do_one_initcall+0x5c/0x320 
[    8.711409]  do_init_module+0x60/0x240 
[    8.715132]  init_module_from_file+0xd6/0x130 
[    8.719634]  idempotent_init_module+0x114/0x310 
[    8.724241]  __x64_sys_finit_module+0x71/0xe0 
[    8.728671]  do_syscall_64+0x11b/0x6d0 
[    8.732483]  ? ksys_read+0x6b/0xe0 
[    8.735854]  ? arch_exit_to_user_mode_prepare.isra.0+0xa2/0xd0 
[    8.741768]  ? do_syscall_64+0x153/0x6d0 
[    8.745828]  ? do_syscall_64+0x153/0x6d0 
[    8.749814]  ? do_syscall_64+0x153/0x6d0 
[    8.753800]  ? clear_bhb_loop+0x30/0x80 
[    8.757700]  entry_SYSCALL_64_after_hwframe+0x76/0x7e 

---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 1006b060c3f3..fd2756badc0c 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -1578,7 +1578,7 @@ void intel_dmc_update_dc6_allowed_count(struct intel_display *display,
 	struct intel_dmc *dmc = display_to_dmc(display);
 	u32 dc5_cur_count;
 
-	if (DISPLAY_VER(dmc->display) < 14)
+	if (!dmc || DISPLAY_VER(dmc->display) < 14)
 		return;
 
 	dc5_cur_count = intel_de_read(dmc->display, DG1_DMC_DEBUG_DC5_COUNT);
-- 
2.47.0

