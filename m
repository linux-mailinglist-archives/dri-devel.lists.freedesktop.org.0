Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27471A939BF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 17:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F217310EBB6;
	Fri, 18 Apr 2025 15:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W3nmzrkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3377510EBB5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:37:28 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6eaf1b6ce9aso22241286d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744990648; x=1745595448; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PaSAJ7bEVoobZvX7s9TBRwmAW2KmRlOmxaaNZas7vsY=;
 b=W3nmzrkzY62ttngLYFMa3StadHJQnmVaJ487SEZiO/nfT61Y9EZmUdSpliXdVcsTg9
 P8BvAK+aUMFmxScZVh6n3KnxgdCPdEAo7Uh6TsZEIbivvnuCuG+W3YDFkNu9/VIw0ebK
 W4emcOmaqoj2cdi/8BXDKuazX2wa3rdoUDeK/dLYCTpqNSSYrZ7FZ8v7ret75qcNalKs
 +HR3EDw9VaprMsIDUDeIxDU2vqWkUin9nZCBw1FIf45Q++43yhRV24nBcatdXYjNYs+p
 v50hcY7hqUGq0U5pmVdDKOeKzrXOv0u26g3zk9WWrkdH8gK6Lnv04G/WWsa6vfey/PUA
 H/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744990648; x=1745595448;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PaSAJ7bEVoobZvX7s9TBRwmAW2KmRlOmxaaNZas7vsY=;
 b=hVyNoytT8SNMMXA4lincU1jrXqokgInFybxDCYepOTwtLg5ibj9RcgJeJe7W3JFkrv
 yns4oYIugCZBv2obTHcjwrp1RJJiyq7CZDX7xY08ZW0MBnZMfRXyqRS00vHiDsxRNq1/
 Wdr9VyfT4emFOxU+mCns3CeQwL9iV1vhvgyiQABCafYMH2mT/r+DIuKXB4vUMSzHRTbx
 cCfAFffeMe4sbgMB2Ev60Hq6nRysCovitkdxghajYGOk3N67ip/1WL2Z3cMJSVDQvs5s
 cwgSksdpUv5i5uZzMinhZZ4ayCByJOGy0VyuhknTMXLlglUpTDG/r7bYtRIf4YqS9BoR
 tciA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6H5ItMS3CS7Hx5XoxQ6beBjeykm1R3UVgEwzgG8MIyTn3CKfFivF8i6ZNtn8bzKGLoQ9Rm4KosWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzABA+eM5NNVa5Yfj+Mxlrsm88lqcOl5OEz0cBaUfHHzWmO2R9
 L5ixu0EfArCAt89T9QUF8NyE3uYhLl5HlXO/Ss8cPbds3hE5R5rf
X-Gm-Gg: ASbGncvfy06QximqULmwdWKauhUUu+gKaj4bDWKmpfvofFa6m4HEVjJ71uVShMFpVPT
 kAP3e2Ov7ttODnOdDIHwhncsoW9JZMkhkMjB3PCiYmUCQZT4dhwAlVYZUpE/HjqhfAzdTQGX0fY
 iumYp4MrML37gllzzX3RToSC7I+Pad9eBNjHegxlrTPMsxFpazW6vmAvqKP3QF2QtgK2lEB7g/L
 sgH418bQC5OHTYdlgEVQ2xnxwMg1GDos1msk5KFpxGGdemoylPtlS16kJOXdjWgFjtBKB/VXreA
 BBjKU42uN2Lhs0K7csJ9LtRrx1KWbuyNLmi3ogWOhJ073oFGMesL/m21KaxjVXqNmwOW3A==
X-Google-Smtp-Source: AGHT+IFkQhTRZqjW4xV1jKnWgn/NCzOB5gSq4F6ybTimLrSF39Hn/Jekuc0wYec+k9hEc3zjpAc5JA==
X-Received: by 2002:a05:6214:1251:b0:6e8:fa33:2969 with SMTP id
 6a1803df08f44-6f2c4539b53mr55537496d6.10.1744990647730; 
 Fri, 18 Apr 2025 08:37:27 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:7988:e5e5:1f4c:be78])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2c21d9bsm11623096d6.96.2025.04.18.08.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 08:37:27 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 18 Apr 2025 11:37:18 -0400
Subject: [PATCH v10 2/6] rust: enable `clippy::ptr_cast_constness` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-ptr-as-ptr-v10-2-3d63d27907aa@gmail.com>
References: <20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com>
In-Reply-To: <20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com>
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
- `&self as *const Self as *mut Self` becomes
  `core::ptr::from_ref(self).cast_mut()`.

Apply these changes and enable the lint -- no functional change
intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#ptr_cast_constness [1]
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile                        | 1 +
 rust/kernel/block/mq/request.rs | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

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
index 4a5b7ec914ef..af5c9ac94f36 100644
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
@@ -155,7 +155,7 @@ pub(crate) fn wrapper_ref(&self) -> &RequestDataWrapper {
         // the private data associated with this request is initialized and
         // valid. The existence of `&self` guarantees that the private data is
         // valid as a shared reference.
-        unsafe { Self::wrapper_ptr(self as *const Self as *mut Self).as_ref() }
+        unsafe { Self::wrapper_ptr(core::ptr::from_ref(self).cast_mut()).as_ref() }
     }
 }
 

-- 
2.49.0

