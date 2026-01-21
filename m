Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIoPLCu5cGmWZQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 12:31:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195745605A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 12:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3CD10E0D0;
	Wed, 21 Jan 2026 11:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="uIdT01Gj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F035C10E0D0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 11:31:50 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-47d3c9b8c56so74700965e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 03:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768995109; x=1769599909;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4mdQj1bvKDaw6tJ7zJN+NnDko+TtCOU2zP4qWX6ApPQ=;
 b=uIdT01Gjyw5rcjJpLdoEaKaKlE1U6sk1iE8uaCZoa0xAHVxOxNsVzR/GUNjeEfSI7L
 2KsLad6tBHpDm74283wrpSVRjh3G6wArIb1geJB8c47PSzqRGevsjK7vEEEduP1XRdhA
 O73JEVVGGxXVd39CY6+XXg0F1HJ/CPwKruFK4vt4TEnqaJgbZktFS+XkHKCueKjC71tB
 NnzRuOXmZ2J6MsUY+95113YmwSEHB6SGTxzd4EWrtEOCfMH8dFVdagnYHp4y0MM8FRuf
 00DV3DbfvYIEGdIFTL01qfmBtJaqu4NcMeMHD+BIjtPyPTA3HdSd7D42tOEnABSrlgqK
 FVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768995109; x=1769599909;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4mdQj1bvKDaw6tJ7zJN+NnDko+TtCOU2zP4qWX6ApPQ=;
 b=axxIsTtaxMiDAktIt0/au98bIMcu/0brkXLgeEX+tjyNajqwJfudzgII/aB3pWqYRb
 v6DrvdO5vH6MPKBuZL/CqqRLPE9ibje4SqmM6v/m7c11xNtAh6sXC+WHHFtaNs2Et6bL
 /hZWVPdhap3a9QIZw2AKmK3xOAa8aBFP9BUSdlwq1kkK5Kv5iX3MtHxGnHIdy7BI273z
 9QL/xP12BqxKMiS+Tn/MYJdEcmAhaYkbHbQxfZKP2ozs6xlDegKGv8w5xn2ip/Rw97+C
 /oxPy4o35ljXI6+PCbE0D61jGdDCJfZujnbacE14cwOSWk9+JGa+QraDVRoA2J+EYwEL
 cf0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7J8ZXqgpiWBfGH9qBQ/IC63do/6CqdZxOnvABSN4KCzr8IatvU8AcAjozc+H4c+2HjDuulN9rJ6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFpuwXkH5lrbrBXvKaGmVlMkM0rdTdWpCBBsJBNuvrOk0LYhZF
 ocumOCHzjNRXtSJ9QNe6IZX/ZluKSUCpGIhd+1/AP4+u1mFSO6ZcFc+hGZ0UWerW2dbw0DQBTPU
 sbTboAoA0fzbU/P0Sew==
X-Received: from wmco6.prod.google.com ([2002:a05:600c:a306:b0:47e:d98a:b5c5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3107:b0:480:1a3a:5ce6 with SMTP id
 5b1f17b1804b1-4801eabf6b4mr226568075e9.14.1768995109430; 
 Wed, 21 Jan 2026 03:31:49 -0800 (PST)
Date: Wed, 21 Jan 2026 11:31:16 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAW5cGkC/23MSwqDMBSF4a1Ixk25iRrbjrqP0kEe1xioRhINL
 eLeG4UOhA7Pge9fSMTgMJJbsZCAyUXnhzzKU0F0JweL1Jm8CQdeM8Yv1I5z6mmY40RVw65aat5
 II0gGY8DWvffY45l35+Lkw2dvJ7a9fzOJUaCoWiFUy8sK4W69ty88a9+TrZP4zwpgcLQ8W6MMs
 AqglqAOdl3XL4Ku39/hAAAA
X-Change-Id: 20251128-gpuvm-rust-b719cac27ad6
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2204; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=BZWCRFLXkjqhK1Z88505dFjo7BoPBfOgcyNTLcg5274=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpcLkYKwMOETW3FfMZsE5YWaTcRU+Dx/I+uQMZq
 zYjWZzvJDOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXC5GAAKCRAEWL7uWMY5
 RhiWD/0SsqiqQ5F2+aIVmxYumjMRZy5kct/zEaHje7Ey/vJWcbrKouTg51ujxypn+7GWX/LnqM3
 puKgrSPlJpc5rB3+kPUOCsYBT+hRaDjp1ftJ6pDp7GfVoof7GxpYU+3TbPgUxGVqaiPHZ2kcgMe
 oTUBNk9AHBQVmKr8dDk5YYJsMdStOTP8sr0RdApZ8vkx+VKGFM/ZKr1xucbf6+BFVbpfy1PRXWC
 OMa3DRTcKDUjA4KHfS0TbYSW66VsztmZmPDW/PzJNmyLUrGThIDVTfKMscU3Ym/sbvZP2J4mZIg
 5Vjp3+M2ds+b9zz9gU4kluwvIn7PxNGSRPvJRPicWzPmsfE+DUBBt2Fnjqj0QZaMwapbzQu7I99
 tWH/z5hzJa4RagzHSK9imYDSHaZYD9z/6CuJZ09T9JpqsD2eIwuHPn0mt/Xhe/ivRu/Ks/Hul8k
 YkWoba21+xoyIQaP9VPOJ+KUjQPUlFxLZxXxaSyyfT0Njmih1Xi5/b/cjQFkd0r+xCDylKXhaOL
 txrKFCAQl6mJVfoZqlcXbNRh6pUN9lA5+6fhAW/1LcWXqIhPEry755uXDx4/MO6nKk6ER7MYbPU
 9vHrGooZvJ3eNYV+s5kg72aOhty5vzgw2ENOg3Ud2aIBwQ674Axhe6SQ5YeBsRUq9NR8GN9miKQ
 WX8tAJuJwdjWFhw==
X-Mailer: b4 0.14.2
Message-ID: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
Subject: [PATCH v3 0/6] Rust GPUVM immediate mode
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>, 
 "=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:lina@asahilina.net,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 195745605A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series provides an immediate mode GPUVM implementation.

Only immediate mode is provided for Rust code, as all planned Rust
drivers intend to use GPUVM in immediate mode.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- C prerequisites have landed, so only Rust part is present.
- The logic for drm_exec was removed, and is for a follow-up.
- Split up into patches.
- Add lifetime to SmStepContext.
- Docs filled out.
- Mutex abstractions used for GEM gpuva lock.
- Drop 'shared data' concept for now. (Can be added back later if required.)
- Rename 'core' field to 'data'.
- GpuVmCore<T> now derefs to GpuVm<T> instead of T.
- Renamed GpuVmBoObtain to GpuVmBoResident.
- Probably more changes I forgot.
- Link to v2: https://lore.kernel.org/r/20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com

Changes in v2:
- For this version, only the C prerequisites are included. Rust will be
  sent as follow-up.
- Add comment to drm_gpuvm_bo_destroy_not_in_lists()
- Add Fixes: tag.
- Pick up Reviewed-by tags.
- Link to v1: https://lore.kernel.org/r/20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com

---
Alice Ryhl (4):
      rust: gpuvm: add GpuVm::obtain()
      rust: gpuvm: add GpuVa struct
      rust: gpuvm: add GpuVmCore::sm_unmap()
      rust: gpuvm: add GpuVmCore::sm_map()

Asahi Lina (2):
      rust: drm: add base GPUVM immediate mode abstraction
      rust: helpers: Add bindings/wrappers for dma_resv_lock

 MAINTAINERS                     |   2 +
 rust/bindings/bindings_helper.h |   2 +
 rust/helpers/dma-resv.c         |  13 ++
 rust/helpers/drm_gpuvm.c        |  18 ++
 rust/helpers/helpers.c          |   2 +
 rust/kernel/drm/gpuvm/mod.rs    | 299 +++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/sm_ops.rs | 408 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/va.rs     | 148 +++++++++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs  | 227 ++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 10 files changed, 1120 insertions(+)
---
base-commit: 263e9ef3f5736697483af66babb8bc72f145b3f4
change-id: 20251128-gpuvm-rust-b719cac27ad6

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

