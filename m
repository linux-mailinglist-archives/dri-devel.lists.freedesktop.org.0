Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLLAAh+/fGlVOgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:24:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE1CBB8E7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDDC10E9EC;
	Fri, 30 Jan 2026 14:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="iyCxdsRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5009D10E9EC
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 14:24:22 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4806cfffca6so23126475e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 06:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769783061; x=1770387861;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wgH1umHMvKF8uVd86KXX82zt+PyZUkfGsFkd4abYEVQ=;
 b=iyCxdsRLn/tnJCb1y8Zbtb0qji3sk2vfoTJqI9XDJraHlB54sGgvb4iFoz3PKECj8c
 J5g13dDaBhf4amjZcE2CCHUGubQklrXXP1soAYnOzHNGG+rMAe8odsim62PH4AbvLZfV
 UMpqgMGgr+NyP3SLnWlhHJlMezKEEf/5RnRwKPa5f3beaLnJVtNNQVhGNyIsN4xhzg1O
 yCAqikrZc5xaepXRM2DzADzev6dlqaAZarhDBw++YOtWK0zky2Z37ZlynAzjVrvPFrH/
 by6NrRz3Os3+7WO18NUVaqragIWC/YbExfZVydwguv7R9J0j5UOGwZhOLdvxmYnd4hy+
 ErwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769783061; x=1770387861;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wgH1umHMvKF8uVd86KXX82zt+PyZUkfGsFkd4abYEVQ=;
 b=cmIdGqls6Z5UudZUPyptjxtanRJ9Dd2xHy9QmgFpiDdfD6nkzYrjlZjLmGB6va5eSY
 /iCS+Iyg6y0mMpnfvSxuEAgxk5aqcQuN8iFuvc8vg/pbunSvhLFpsGHeLjj9cJOSmfHt
 o1i/yuM9TU3b8e4qj2VcJ4usJxFYi9q0Q+T06lVsRqtM9gRXEb2CwO84Raj+g1DKzhEz
 9/lMwj7x9YfZaiO7+d9GWJ78w3WGQxQ/6D7NzTtJyyrqOu/8CQOpfOUWR8XT5o+ljnyz
 W31bWqkBDqPjUNSdXbIdGYaUcUPaFQhBbKQyD3sioqeWJaZhG0VJZEhA+CcEKdLb0l6R
 fwwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3A1aii1+kkY5z2Iok/6cmdBHKH//Zh3NySSQrwoSeY8eYehMWOfN8GITfKW+38e9FBd9pQ9JD5do=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5yMswMNW2VQZplvR5uQUuLHtaeNiY3wRr0NJLajmAL20g3u/F
 98X0+2fGaLZ1FXKvDTA5iuOnGkP/9ytItalz4ZfTRRMSp4X+gEbMgtWermtfcm6T4EJbZhATtdl
 /YnoRqYK9gwE0GbUHZA==
X-Received: from wmlc14.prod.google.com ([2002:a7b:c84e:0:b0:480:2e46:31e1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c16d:b0:477:63b5:7148 with SMTP id
 5b1f17b1804b1-482db44d22dmr41461495e9.6.1769783060869; 
 Fri, 30 Jan 2026 06:24:20 -0800 (PST)
Date: Fri, 30 Jan 2026 14:24:09 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAm/fGkC/23MSwrCMBSF4a2UjI3cJH2oI/chDvK4bQO2KUkbl
 NK9mxYEiw7Pge+fSUBvMZBLNhOP0Qbr+jTyQ0Z0K/sGqTVpEw68YIyfaDNMsaN+CiNVFTtrqXk
 lTUkSGDzW9rnFbve0WxtG519bO7L1/ZuJjAJFVZelqrnIEa6Nc80Dj9p1ZO1E/rElMNhbnqxRB
 lgOUEhQP1Z8Wc52VqzWnAsNuUQtip1dluUNQ19k4h0BAAA=
X-Change-Id: 20251128-gpuvm-rust-b719cac27ad6
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2841; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=c7+gsehW6l++ywwtKH66K3DZWRLdGhqXlJPg2WevWJg=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpfL8ODHdEgGQHcL5Hx5w+G06YTGrVLX1xlfPdu
 YsjP4Hhv+2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXy/DgAKCRAEWL7uWMY5
 RgVRD/0V0SYugUCUlBz1Sz9y942V/YvgefJCytbhSCJR46MtDAFQ84DBrnUujwLcy9XbqLRFbw9
 vijMkh2pKEwPCWCOmQn1Jfq/jGHs/kzM+pUSr+0uqeInyMtx1smuejcr4EMVz2+JMNqIhkkv2AB
 LbFXCPh3jKmFijP32lCojxbNxHIesmgMcwq0gMPZ3nunJsifWCnI2uisyznst6VNFqfHNlQ7jkF
 AS8LicvtviuEJHJnapnG1JBweUjCOiHg7HMxYu20EIPzD0XRbP5jJOdrg2K6cb0eoFKxUh57IJ4
 hSc1FMp4mAEyyQO3O0zDKERQIh/3EwMiyD3nSqVNbVmI0OiBHDx1WIQ1lwYoslkyzJl7m+5ejXr
 NeHea+soQ3XiNkY1/n87RxD7V7sX0Y164ODq7F7MZAy5lCUFrsamT5q7F8dGo8RLfe5LBWzIDK4
 Jojy/R7VzGaH6GV+YmpDPe05X6VK3SJj9Bw6n+mTvW1ltuhCnKgZGBnJR3fOUaIy023mGupQz0+
 Rg5ZsaNuxlDFT28Ur8T7S1CWMQGlp3FmPYj0K42eYS67JvjRljt4m5CX9ut6eTkRUcO9y4Qjk9+
 bRDVTy4bEge3mYvbXlxm+gl3xSCqZDASjuXHWWpsWtxUrSY3Nv5qQ8sKe9249OgJ46qaJxxxp1n
 vv5YsWte9cRmXmw==
X-Mailer: b4 0.14.2
Message-ID: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
Subject: [PATCH v4 0/6] Rust GPUVM immediate mode
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:lina@asahilina.net,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.940];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AAE1CBB8E7
X-Rspamd-Action: no action

This series provides an immediate mode GPUVM implementation.

Only immediate mode is provided for Rust code, as all planned Rust
drivers intend to use GPUVM in immediate mode.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v4:
- Add trait bound so that DriverGpuVm::Object must be the same type as
  Driver::Object.
- Add rust/helpers/dma-resv.c to MAINTAINERS.
- Add __rust_helper to dma_resv_lock and dma_resv_unlock.
- Rename GpuVm::raw_resv_lock() to GpuVm::raw_resv()
- Reword comment in obtain() for adding to extobj list.
- Fix typo in commit message referring to GpuVm<_> instead of GpuVmBo<_>.
- Changed the PhantomData type used for invariance and add comment. (No
  functional change.)
- Rename offset to gem_offset in args to sm_map().
- Link to v3: https://lore.kernel.org/r/20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com

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

 MAINTAINERS                     |   3 +
 rust/bindings/bindings_helper.h |   2 +
 rust/helpers/dma-resv.c         |  14 ++
 rust/helpers/drm_gpuvm.c        |  18 ++
 rust/helpers/helpers.c          |   2 +
 rust/kernel/drm/gpuvm/mod.rs    | 299 ++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/sm_ops.rs | 417 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/va.rs     | 148 ++++++++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs  | 227 ++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 10 files changed, 1131 insertions(+)
---
base-commit: 263e9ef3f5736697483af66babb8bc72f145b3f4
change-id: 20251128-gpuvm-rust-b719cac27ad6

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

