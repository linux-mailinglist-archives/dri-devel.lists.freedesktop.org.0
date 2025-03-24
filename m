Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E95A6E613
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 23:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F6E10E4E4;
	Mon, 24 Mar 2025 22:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KUeXQPpP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C394610E4E0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 22:01:50 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-474f0c1e1c6so75605631cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 15:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742853709; x=1743458509; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RrSMUDZZYlyoJ9Y4j+pFyX1Efp/qPB5Vo8olgw4flH0=;
 b=KUeXQPpPyvNRcrMi6yL8ztxHzY5NHjdktJICLw27BI9yWK+vEtWnN2MZe9Qy2yAs7J
 y5au39To+cDlyHMsDL2HKuBdm5ET7+EtX8aIs58ykJeNh/bw71sGG+popw7PuT4mtj91
 6pDWRq9R6UIaQ0SY00V5sMCG0ULin5LEs6irKdLjtgLfF+sXSndgYTJQ4LRav4v1nJrY
 hJJZa+tGq7pbDBFEW8Clgjrly2+fcqJ+SB/Ape/UA0VgWWsvIdOjvLF/rXVXeyUIy7IR
 MHIPqNIALyeAkunn0fj7nlGQXIj4Tgw3nBMVVhJ8y1E37o94jS0jfmJAJ9EuoGlHldE6
 DjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742853709; x=1743458509;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RrSMUDZZYlyoJ9Y4j+pFyX1Efp/qPB5Vo8olgw4flH0=;
 b=CTGzgai76kIRoiai9JXNhE9R9jDWpb2MLRK39funcRwXB5V25qJsUxpZ5crbiC27EY
 nv0yfbz8jZVRvnwkbu+13GycC9AgrIssg1h5cPydt5pffRZ4HqCpMJ4osHV+maVSmNr+
 JuZf6hCflpmqB2YYm407xappzBxpl0CbKbg2dpiMyoNlfA9kfMqCaHdXwy6CYtw4yOp3
 2YDQvWT2VViCy96js30F0sf7kppT7gSp+BTbspVmdlHRG5vS08lvY07AKKQDzSLHAXKW
 +Rh+h9E3qgHulN/xjrcTj1jtllNeJtyhbAmN3ryfrVE4wO+sEh1LditkK3RMBduI8R9I
 0SAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjOYEmhy4ynoR1VYXdP9K6iFOxZodWhwqvxrGEMFCNUFOOyxOVZsONWy7DzU+EbG3EKJ+endS0Fic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuD62wQIIGSxTnLFEf4bD54V+I+U3WvJYKV4P9D6K46nNZe7jR
 YWzqU1jUoc6adNm6TaCc+nTD68szo0gX6aklU2j9awUJn8u2GTnVuvczV39mLtk=
X-Gm-Gg: ASbGncsZIN+orq53tVw5eC+Azo+yWPAz6dhCpO1KpYTjb0fnmhd73TH9rwh3o3wSk8r
 aIG7rbS06Dyd0blq5y4h+wHnZTE7Ipdr5u5vmlrUNvKfj/mtX7hAzCS7UHOtgPw4M2y0PzAsEU0
 KDqUeS6nYILAR6uAyLc0/Uqzz2OaUKUn/UpZWqDR+D1BT1giU+sSQq88NpqHZyMWY6lcMsYY7Dh
 eZjyAs34Zn0Jwh979K7wnIX0nP/KrUpWawd0wlKNWOp7XmZ73Kuxq2NE9tk3Z6bnt9OFh0DZPQ4
 Qmxpz71w2Hgy0qiz8KiInVI2kOIjx+czp0o/j5nxtsWBu+IO3Z9G8KBk/3ATqWlxiB+gyjYVYy9
 4lgSwQDqTcv8kmgME9XurDKQJVxo78/5zZ7sawNjp0gwzOhqFLs8kmw==
X-Google-Smtp-Source: AGHT+IGClCAaATZslBV1U1w4j++Vn9oRujV1utPTcSNqeAgqWjnn31iDitDZyWoTomflHvtQ1nvRqA==
X-Received: by 2002:a05:622a:244a:b0:477:db8:e15b with SMTP id
 d75a77b69052e-4771dd608acmr207554641cf.9.1742853708852; 
 Mon, 24 Mar 2025 15:01:48 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:43c7]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4771d0ad87esm52129541cf.0.2025.03.24.15.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 15:01:48 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 24 Mar 2025 18:01:32 -0400
Subject: [PATCH v6 3/6] rust: enable `clippy::ptr_cast_constness` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-ptr-as-ptr-v6-3-49d1b7fd4290@gmail.com>
References: <20250324-ptr-as-ptr-v6-0-49d1b7fd4290@gmail.com>
In-Reply-To: <20250324-ptr-as-ptr-v6-0-49d1b7fd4290@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
 FUJITA Tomonori <fujita.tomonori@gmail.com>
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
index ec8efc8e23ba..c62bae2b107b 100644
--- a/Makefile
+++ b/Makefile
@@ -484,6 +484,7 @@ export rust_common_flags := --edition=2021 \
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
2.48.1

