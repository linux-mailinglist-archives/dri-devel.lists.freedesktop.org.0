Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPdLLM75rWl2+QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 23:35:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 487602327AE
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 23:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB6910E081;
	Sun,  8 Mar 2026 22:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V11Fkjlb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E8310E028
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 22:35:53 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-466ec4c6852so817130b6e.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 15:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773009352; x=1773614152; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6rOOxNN4X1st3aHd8TmN72tYm67hCF3B9p7RWUCvP0=;
 b=V11FkjlbFbSuz5t3inpifgCXIh16DOJEXlzVzxiDevqp+2qBiwKFRkerQKQIM1TnC/
 veCuAzF1lBSyAN5hxuduIdBKaBZaZOJKh20zJCrUczyVitCcCM4jr+1buLJYxZlrUPXe
 XYMblMupCTT56HLWjV5zm/FQZcGssmUu6CEGjV5eUDRE24tB47DdtA7Avep1eMKpbR+8
 M9daLnhMCw/cq6qoNHkcKcL8hnhnnJZg11/YHe4osoTOeultaU0koIGP7zZ9BW+PhxDC
 WFAXVh5+OmvRdNg2JIEKQZyVEIUkIe4obcG3a9v34X/cGnglD/eSlMcYDz5SmxZMT3QB
 NMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773009352; x=1773614152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i6rOOxNN4X1st3aHd8TmN72tYm67hCF3B9p7RWUCvP0=;
 b=GZwvNCu2wP6j1VOPymfeIphVRLrpJOr0OwlIhbAlLIqfH3CPV7Hfkv6fk5uigbEHox
 UWEi4qE82ptljLC/hRc3lRNrVMkaqzrFhs1yGc4Jtyp4XasFWzQiwqStCg+YJCZsWYvU
 YbHuOnf5pm+N7dmD+62iIvK7ssRdUskCm70EPrsu0fL7pqw9gZi/MENIukm9wkPZNUSP
 tkvDXVCZZXtPfJldi+0Saqzb8LSSgrWxXEZs4kbciywolob8reEDOpDNK7EiNNPXDh10
 dt/6qHrfUdX2p3QZyAVtI/RedNwMYoLN3E+uGOk4dywY2wZVqV2SeDD8sJLrast8pEI3
 QtVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh64Zn0X5i9EnGmuzIEO8FyqA6v0TBPOYPTo8R/xGQzFklNGRs7TExohI7vT/nOfR6uoDqycHet00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhYjH3w5TRdxKLKYqKmDHlAE2C59+8UoKcIiXizIYMbjIzsNec
 UkA4u4Nl6O/s5Fs9YdVvpBNogONGvkR1DZP10ZFnVAFyPENEmYn8VHN5
X-Gm-Gg: ATEYQzw4T7YOYUdImm4pqmAFTtvPEyoAb8MXLLsqBHRyr3D20As6GvIAdSE7ouIb/e4
 hqZ+9h1otBeMtC+UFJNUAQIRec3yOLYW0VIT2yla0PSi6F7bFDzca0ynwIOHwj5Blc8pt2IdfDD
 +dbql38jELbLKV0a60j94Dcri4kcfIgQufHoXNHPeZSw+wBKwp8ZmUWGTlICDS5FaoT5Wskdxg5
 BhW7VXyb9IZMOl4BJWo7rinPElviIG0S89tOZaLmeOyAvuYIK5XufCodO7tbzrd4hwAVHhcz0MM
 CDzzYSmwGJEqqquTcaOp52O+LnZUyblRXc9tPy05aAF8kOKbEFr1k1F7W6culRTn9flWHzd1hBS
 JQIwYF/htBO/hlsytpWG20KOJUNr+C8Vw5PpN84hI39cvqStZ5qMjwHXXYoQT42Iv9r0Q6UbjC+
 pXPpNb3IvC0c0U/BOqXEhG/OlpEky3Y7RRp/axyc9J5FNxTv4I
X-Received: by 2002:a05:6808:c228:b0:45f:434:9c1c with SMTP id
 5614622812f47-466dca167cdmr4806095b6e.12.1773009352280; 
 Sun, 08 Mar 2026 15:35:52 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-466df93ce67sm4529016b6e.1.2026.03.08.15.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 15:35:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm_buddy: fix power-of-2 rounding errs
Date: Sun,  8 Mar 2026 16:35:36 -0600
Message-ID: <20260308223538.96729-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308223538.96729-1-jim.cromie@gmail.com>
References: <20260308223538.96729-1-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 487602327AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:jim.cromie@gmail.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:jani.nikula@intel.com,m:luciano.coelho@intel.com,m:jimcromie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,amd.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On DRM-CI, I encountered this kunit:arm32 failure.

[23:19:40] [PASSED] drm_test_buddy_alloc_clear
[23:19:40] [PASSED] drm_test_buddy_alloc_range_bias
[23:19:41] [PASSED] drm_test_buddy_fragmentation_performance
[23:19:41]     # drm_test_buddy_alloc_exceeds_max_order: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_buddy_test.c:889
[23:19:41]     Expected err == -22, but
[23:19:41]         err == 0 (0x0)
[23:19:41] ------------[ cut here ]------------
[23:19:41] WARNING: drivers/gpu/drm/drm_buddy.c:405 at drm_buddy_fini+0x114/0x1b8, CPU#0: kunit_try_catch/74
[23:19:41] CPU: 0 UID: 0 PID: 74 Comm: kunit_try_catch Tainted: G                 N  7.0.0-rc1-gdfb0bcedd08a #1 VOLUNTARY
[23:19:41] Tainted: [N]=TEST
[23:19:41] Hardware name: Generic DT based system
[23:19:41] Call trace:
[23:19:41]  unwind_backtrace from show_stack+0x10/0x14
[23:19:41]  show_stack from dump_stack_lvl+0x3c/0x4c
[23:19:41]  dump_stack_lvl from __warn+0xe8/0x1c4
[23:19:41]  __warn from warn_slowpath_fmt+0xa4/0xc0
[23:19:41]  warn_slowpath_fmt from drm_buddy_fini+0x114/0x1b8
[23:19:41]  drm_buddy_fini from drm_test_buddy_alloc_exceeds_max_order+0x1c8/0x36c
[23:19:41]  drm_test_buddy_alloc_exceeds_max_order from kunit_try_run_case+0x78/0x1c8
[23:19:41]  kunit_try_run_case from kunit_generic_run_threadfn_adapter+0x1c/0x34
[23:19:41]  kunit_generic_run_threadfn_adapter from kthread+0x108/0x134
[23:19:41]  kthread from ret_from_fork+0x14/0x28
[23:19:41] Exception stack(0xf0bd5fb0 to 0xf0bd5ff8)
[23:19:41] 5fa0:                                     00000000 00000000 00000000 00000000
[23:19:41] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[23:19:41] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[23:19:41] ---[ end trace 0000000000000000 ]---
[23:19:41]     # drm_test_buddy_alloc_exceeds_max_order: drivers/gpu/drm/drm_buddy.c:406: buddy_fini() root
[23:19:41] ------------[ cut here ]------------
[23:19:41] WARNING: drivers/gpu/drm/drm_buddy.c:414 at drm_buddy_fini+0x1b4/0x1b8, CPU#0: kunit_try_catch/74
[23:19:41] CPU: 0 UID: 0 PID: 74 Comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc1-gdfb0bcedd08a #1 VOLUNTARY
[23:19:41] Tainted: [W]=WARN, [N]=TEST
[23:19:41] Hardware name: Generic DT based system
[23:19:41] Call trace:
[23:19:41]  unwind_backtrace from show_stack+0x10/0x14
[23:19:41]  show_stack from dump_stack_lvl+0x3c/0x4c
[23:19:41]  dump_stack_lvl from __warn+0xe8/0x1c4
[23:19:41]  __warn from warn_slowpath_fmt+0xa4/0xc0
[23:19:41]  warn_slowpath_fmt from drm_buddy_fini+0x1b4/0x1b8
[23:19:41]  drm_buddy_fini from drm_test_buddy_alloc_exceeds_max_order+0x1c8/0x36c
[23:19:41]  drm_test_buddy_alloc_exceeds_max_order from kunit_try_run_case+0x78/0x1c8
[23:19:41]  kunit_try_run_case from kunit_generic_run_threadfn_adapter+0x1c/0x34
[23:19:41]  kunit_generic_run_threadfn_adapter from kthread+0x108/0x134
[23:19:41]  kthread from ret_from_fork+0x14/0x28
[23:19:41] Exception stack(0xf0bd5fb0 to 0xf0bd5ff8)
[23:19:41] 5fa0:                                     00000000 00000000 00000000 00000000
[23:19:41] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[23:19:41] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[23:19:41] ---[ end trace 0000000000000000 ]---
[23:19:41] [FAILED] drm_test_buddy_alloc_exceeds_max_order
[23:19:41]     # drm_buddy: Testing DRM buddy manager, with random_seed=0xacce106c
[23:19:41]     # module: drm_buddy_test
[23:19:41] # drm_buddy: pass:8 fail:1 skip:0 total:9

This error in drm_test_buddy_alloc_exceeds_max_order (Expected -22,
got 0) is caused by a 64-bit truncation bug in the DRM buddy
allocator's core logic.

On 32-bit architectures (like arm32), the standard
roundup_pow_of_two() and rounddown_pow_of_two() macros use unsigned
long internally. When these are called with u64 memory sizes (as
drm_buddy.c does), any size above 4GB is truncated.

The test tries to allocate ~9GB on a ~10GB manager.  Due to
truncation, it actually asks for ~1GB on a ~2GB manager, which
unexpectedly succeeds.  This then causes a mm->avail mismatch warning
when the test finishes.

Use 64-bit safe power-of-two calculations. Since ilog2() is already
safe for u64, I'll use it to implement safe rounding.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_buddy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index dbf984f8e301..8f23fb615d47 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -919,7 +919,7 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 	u64 modify_size;
 	int err;
 
-	modify_size = rounddown_pow_of_two(size);
+	modify_size = 1ULL << ilog2(size);
 	pages = modify_size >> ilog2(mm->chunk_size);
 	order = fls(pages) - 1;
 	if (order == 0)
@@ -1140,7 +1140,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 
 	/* Roundup the size to power of 2 */
 	if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION) {
-		size = roundup_pow_of_two(size);
+		size = 1ULL << (ilog2(size - 1) + 1);
 		min_block_size = size;
 	/* Align size value to min_block_size */
 	} else if (!IS_ALIGNED(size, min_block_size)) {
-- 
2.53.0

