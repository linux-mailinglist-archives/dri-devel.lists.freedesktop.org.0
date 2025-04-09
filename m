Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B277A82877
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 16:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E371E10E91F;
	Wed,  9 Apr 2025 14:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m5MSiXFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8FF10E91C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 14:47:29 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7c54b651310so914531185a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 07:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744210049; x=1744814849; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bUwLdZwmh+cy9A2SbSrrWRD9Fgt6AUa5s7mHmX38m6c=;
 b=m5MSiXFOdlFPj0DUqgV7Y9TphvG4HdTunEoPRJuCQIqoQNQ7dj1VP2G4l43uGUwrlT
 CCUMZjfNTuE5VvjHG54rP7g3iS7eqhvf2gU/TeHpxUpEwalTkWHLbx8RzWEHJAQhX83b
 OYt5ObhGc1K1xR9KdUiwLkwvwaYpOsQGICw6wFzIolZM1fxVpAa5gSxsHDiiceD1VkyU
 +0NbtQrcMWW+DVgPV7m0c3exFpL9/QxQ7mtdHRCt++o9BGvJVcmMr98Wq2uOx10BVQ2A
 J4KxQrafR7Cu9/1S5EzARRE+xKaqVyiTNnUHXsIAx+7XGl4DwK0ZHif4kT3F0fZmVdZO
 lt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744210049; x=1744814849;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bUwLdZwmh+cy9A2SbSrrWRD9Fgt6AUa5s7mHmX38m6c=;
 b=nAHY9d4h2k5MnCWogt5cx71ClFELY5WUSZzHwGnnKa7mCd5pvB+HUsZaKGgrN71axv
 SXyvuVdKda1HLK+7bLiB8J9DZdR0xzZGIBzJO/XXaM3M4xXV/d+f2F7+u9SSB1Sj9xme
 vKTeWevgeI411GFq47vkMtO6703hRYiO1T055SbjjhE4amwt0nVdShw7R2Zg1XVswtlo
 Z0zwJt59CGCqcj+RsSezmAS8E5hyudDSR7+4zaWtkUOa6wSf/dqdBDlJt84heoIbB1n8
 SUXFrSPXY6xE0rV7hXH0iXxg+erfRC6lnB3Nk4MZIR4cUAYhoD0ILzaGbKAszbcvwzQK
 KveQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr9BkkXDOn4AOVBSgebmXtOKkHLot5S3XuSK4DEACUD8+3STsCayniRXaM+t5rIuFl5SWtqTzbiNk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTBMczE+Kvbncup6+h1isePmbsDGvLJRJyGbhhVYfk6r4wph6n
 NWefGopvbdei4HA3pqRQrCre/ITz1s0dWRiK9+Bgv8FEwXixBVzU
X-Gm-Gg: ASbGncs8MdrQj+3YOCt/sU58zjBZc1iBeU8g7jXxZ5ZJ98bCELQ2I671ukJbc8+y+0U
 SiGC6WX2g1VMg2GGhXPHDydmvQo33kf64wvQQvbm1oNB5ojc41WtbqE99eO1BhoUxqGI3SnX+OD
 a4T0VsO922IubDP6aA+PfZ2Qy1e6VK4Ft2XgPffOUJ5+LXmr9GGHF6k70sLkP2cR4AiY57VJGXn
 BswGuZesHjxxL+ilKD0kOT7RR9FwjBnwCyLE/JSBogeMbNUNAsHBmm5aujqdISuoQqt4lMGAoNk
 pPfNmqVd7Dvs4WLjric9qZ6vJxOKEc0S2eqCJxDNM6Oj8NZnlpy2H52XjOwBpRHtmU18UifXomF
 1uNJwBYATbHK0mCgsAe2jFmxZp6vY8owsdihs8m036pVN
X-Google-Smtp-Source: AGHT+IEtpm2maEl8wOrCcK7U+9nPKjcEayy9yuyC9vnFfyrE2QXcE2b1Bx+rFHLvmbOyvjQvRgGi/A==
X-Received: by 2002:a05:620a:280d:b0:7c5:5d4b:e63b with SMTP id
 af79cd13be357-7c79de91e5fmr351879785a.38.1744210048520; 
 Wed, 09 Apr 2025 07:47:28 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:3298]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47964eb9a8fsm8024461cf.49.2025.04.09.07.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 07:47:27 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Apr 2025 10:47:19 -0400
Subject: [PATCH v8 2/6] rust: enable `clippy::ptr_cast_constness` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-ptr-as-ptr-v8-2-3738061534ef@gmail.com>
References: <20250409-ptr-as-ptr-v8-0-3738061534ef@gmail.com>
In-Reply-To: <20250409-ptr-as-ptr-v8-0-3738061534ef@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
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

In Rust 1.72.0, Clippy introduced the `ptr_cast_constness` lint [1]:

> Though `as` casts between raw pointers are not terrible,
> `pointer::cast_mut` and `pointer::cast_const` are safer because they
> cannot accidentally cast the pointer to another type.

There are only 2 affected sites:
- `*mut T as *const U as *mut U` becomes `(*mut T).cast()`
- `&self as *const Self as *mut Self` becomes a reference-to-pointer
  coercion + `(*const Self).cast()`.

Apply these changes and enable the lint -- no functional change
intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#ptr_cast_constness [1]
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile                        | 1 +
 rust/kernel/block/mq/request.rs | 5 +++--
 rust/kernel/dma.rs              | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 5d2931344490..7b85b2a8d371 100644
--- a/Makefile
+++ b/Makefile
@@ -481,6 +481,7 @@ export rust_common_flags := --edition=2021 \
 			    -Aclippy::needless_lifetimes \
 			    -Wclippy::no_mangle_with_rust_abi \
 			    -Wclippy::ptr_as_ptr \
+			    -Wclippy::ptr_cast_constness \
 			    -Wclippy::undocumented_unsafe_blocks \
 			    -Wclippy::unnecessary_safety_comment \
 			    -Wclippy::unnecessary_safety_doc \
diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
index 4a5b7ec914ef..c9f8046af65c 100644
--- a/rust/kernel/block/mq/request.rs
+++ b/rust/kernel/block/mq/request.rs
@@ -69,7 +69,7 @@ pub(crate) unsafe fn aref_from_raw(ptr: *mut bindings::request) -> ARef<Self> {
         // INVARIANT: By the safety requirements of this function, invariants are upheld.
         // SAFETY: By the safety requirement of this function, we own a
         // reference count that we can pass to `ARef`.
-        unsafe { ARef::from_raw(NonNull::new_unchecked(ptr as *const Self as *mut Self)) }
+        unsafe { ARef::from_raw(NonNull::new_unchecked(ptr.cast())) }
     }
 
     /// Notify the block layer that a request is going to be processed now.
@@ -151,11 +151,12 @@ pub(crate) unsafe fn wrapper_ptr(this: *mut Self) -> NonNull<RequestDataWrapper>
     /// Return a reference to the [`RequestDataWrapper`] stored in the private
     /// area of the request structure.
     pub(crate) fn wrapper_ref(&self) -> &RequestDataWrapper {
+        let this: *const _ = self;
         // SAFETY: By type invariant, `self.0` is a valid allocation. Further,
         // the private data associated with this request is initialized and
         // valid. The existence of `&self` guarantees that the private data is
         // valid as a shared reference.
-        unsafe { Self::wrapper_ptr(self as *const Self as *mut Self).as_ref() }
+        unsafe { Self::wrapper_ptr(this.cast_mut()).as_ref() }
     }
 }
 
diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index f395d1a6fe48..43ecf3c2e860 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -186,7 +186,7 @@ pub fn alloc_attrs(
             dev: dev.into(),
             dma_handle,
             count,
-            cpu_addr: ret.cast(),
+            cpu_addr: ret.cast::<T>(),
             dma_attrs,
         })
     }

-- 
2.49.0

