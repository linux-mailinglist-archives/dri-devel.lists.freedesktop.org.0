Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4D5BED722
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 20:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B5810E08C;
	Sat, 18 Oct 2025 18:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Zu6yStjh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DCD10E08C
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 18:03:16 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-47113538d8cso17692145e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 11:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760810595; x=1761415395;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=P+Xp99Syf6solx7Qtcc9CHjBfbP4dER1f+PiKli4U2c=;
 b=Zu6yStjhTT50f793wyt41gc93DlyVJAnPvVRLxAjCV+9QpHpc+yRV3mspzmmFk0xTi
 CpVe3MPC3woigmTxesBG1ru5FJpMe269PJo+WBrhYim7+4pkhAP4fDKYbDcLQ89OY0S2
 fUm3otVooKgj9+bndsEzfbcIdtslDimEs8M8mImG0nN8ct1WJ5F3MkIfCMAcLs3I/9yK
 6z+rI8V4wzMjzpiRS1drPpIP+OEXea+n8C+rvLncvEHLg+3/guwLzJs+L8Acjf7XzX2n
 YBms87OHy3lyBjWcK0uVcTppCgoBD/g8ltu0+IWP6M/FbFmDq7nptLZDcNvLaDmGXdNS
 OTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760810595; x=1761415395;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P+Xp99Syf6solx7Qtcc9CHjBfbP4dER1f+PiKli4U2c=;
 b=LAqpcOoGGfa0KB596iYAaqhLz1a2JEBH/vHkpjb3sAnSvcb37W9g0Z+tFW+n8lsxC2
 TL1eTKFWDFUI70Bp60TGKFdIrSjMTELdid3/F6FwsYR93fafRVVZijDhSGjPspnTSIJf
 RENJoNjVsAzbQNUQviJHrBTqTh2i9ckcDcO8Os0w+bIkJdqt0dHUJJ7Qok34TXuvweuP
 7urca3AT0QfB1UyFvN80hXm9ERQT+3mwr55yp6KovGKtky+TKrpqYuBh+KRoa3DTMHlK
 HiRm6Dmscps4+UgpOhd0nlF2W2Ws7oHoir0llGTD+j4v2C75Sd3YCQJeVOBWAM6zMoVf
 31HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNK80Yaht7KCwZ29Mk0ZzL9d6hc9GYJLgLecCt1DLufeSiaL5NcZsdQCmzKvi0Rv0UMzVd/WFidaU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysjYNxUPflBaUBtLZh1NcMBIRGld3q2MBddnub1JmTie+dRbTH
 stLBxnUE7wzdqAjnWWdhvXDYAZ8ZlnWBCaaYgfPieCQOOK8FktePPob18Eg8IMqe/RqtQZo16Ot
 tT288TWotO5dDagVjVQ==
X-Google-Smtp-Source: AGHT+IFD1cfJ8UvE+arlsN4Q/pztwM830HHKQSYiiR0oQA7gs4M/kyYn5nx3HAt5EUs2SUtbpxbRKJSK1nrxs4c=
X-Received: from wmbz7.prod.google.com ([2002:a05:600c:c087:b0:46f:aa50:d700])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:474a:b0:46f:b42e:e39c with SMTP id
 5b1f17b1804b1-4711794902dmr54802325e9.41.1760810594858; 
 Sat, 18 Oct 2025 11:03:14 -0700 (PDT)
Date: Sat, 18 Oct 2025 18:03:12 +0000
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
Mime-Version: 1.0
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
X-Mailer: git-send-email 2.51.0.915.g61a8936c21-goog
Message-ID: <20251018180313.3615630-1-aliceryhl@google.com>
Subject: [PATCH v18 13/16] rust: regulator: use `CStr::as_char_ptr`
From: Alice Ryhl <aliceryhl@google.com>
To: tamird@gmail.com
Cc: Liam.Howlett@oracle.com, a.hindborg@kernel.org, airlied@gmail.com, 
 alex.gaynor@gmail.com, aliceryhl@google.com, arve@android.com, 
 axboe@kernel.dk, bhelgaas@google.com, bjorn3_gh@protonmail.com, 
 boqun.feng@gmail.com, brauner@kernel.org, broonie@kernel.org, 
 cmllamas@google.com, dakr@kernel.org, dri-devel@lists.freedesktop.org, 
 gary@garyguo.net, gregkh@linuxfoundation.org, jack@suse.cz, 
 joelagnelf@nvidia.com, justinstitt@google.com, kwilczynski@kernel.org, 
 leitao@debian.org, lgirdwood@gmail.com, linux-block@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, llvm@lists.linux.dev, longman@redhat.com, 
 lorenzo.stoakes@oracle.com, lossin@kernel.org, maco@android.com, 
 mcgrof@kernel.org, mingo@redhat.com, mmaurer@google.com, morbo@google.com, 
 mturquette@baylibre.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
 nm@ti.com, ojeda@kernel.org, peterz@infradead.org, rafael@kernel.org, 
 russ.weight@linux.dev, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
 simona@ffwll.ch, surenb@google.com, tkjos@android.com, tmgross@umich.edu, 
 urezki@gmail.com, vbabka@suse.cz, vireshk@kernel.org, viro@zeniv.linux.org.uk, 
 will@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

From: Tamir Duberstein <tamird@gmail.com>

Replace the use of `as_ptr` which works through `<CStr as
Deref<Target=&[u8]>::deref()` in preparation for replacing
`kernel::str::CStr` with `core::ffi::CStr` as the latter does not
implement `Deref<Target=&[u8]>`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/regulator.rs | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
index b55a201e5029..65a4eb096cae 100644
--- a/rust/kernel/regulator.rs
+++ b/rust/kernel/regulator.rs
@@ -84,7 +84,7 @@ pub struct Error<State: RegulatorState> {
 pub fn devm_enable(dev: &Device<Bound>, name: &CStr) -> Result {
     // SAFETY: `dev` is a valid and bound device, while `name` is a valid C
     // string.
-    to_result(unsafe { bindings::devm_regulator_get_enable(dev.as_raw(), name.as_ptr()) })
+    to_result(unsafe { bindings::devm_regulator_get_enable(dev.as_raw(), name.as_char_ptr()) })
 }
 
 /// Same as [`devm_enable`], but calls `devm_regulator_get_enable_optional`
@@ -102,7 +102,9 @@ pub fn devm_enable(dev: &Device<Bound>, name: &CStr) -> Result {
 pub fn devm_enable_optional(dev: &Device<Bound>, name: &CStr) -> Result {
     // SAFETY: `dev` is a valid and bound device, while `name` is a valid C
     // string.
-    to_result(unsafe { bindings::devm_regulator_get_enable_optional(dev.as_raw(), name.as_ptr()) })
+    to_result(unsafe {
+        bindings::devm_regulator_get_enable_optional(dev.as_raw(), name.as_char_ptr())
+    })
 }
 
 /// A `struct regulator` abstraction.
@@ -268,7 +270,8 @@ pub fn get_voltage(&self) -> Result<Voltage> {
     fn get_internal(dev: &Device, name: &CStr) -> Result<Regulator<T>> {
         // SAFETY: It is safe to call `regulator_get()`, on a device pointer
         // received from the C code.
-        let inner = from_err_ptr(unsafe { bindings::regulator_get(dev.as_raw(), name.as_ptr()) })?;
+        let inner =
+            from_err_ptr(unsafe { bindings::regulator_get(dev.as_raw(), name.as_char_ptr()) })?;
 
         // SAFETY: We can safely trust `inner` to be a pointer to a valid
         // regulator if `ERR_PTR` was not returned.
-- 
2.51.0.915.g61a8936c21-goog

