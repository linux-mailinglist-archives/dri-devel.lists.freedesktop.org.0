Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D0FAD518B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 12:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D329310E279;
	Wed, 11 Jun 2025 10:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ftrPI9gI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6139010E30E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 10:23:41 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4a442a3a2bfso114616351cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 03:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749637420; x=1750242220; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3zUYH66sAi4M6SnRnDRUP9N7P8+78tvCpZpLM0hP8f0=;
 b=ftrPI9gIr1e/7g3OdakU5u6hSd0oKX8zVr2+jGMisglGWRkbDnflX1QqUri4Zg8a+6
 Qlp7vcZLja2JKvLEiAZC71Wes2c1lBjgaSVDvyoBP8ctZ+rFHDyBsE73YgYmREdG+qGo
 1ohfx7IZxqSqTosis/Ibbw3s7LMVX8pc/RGjADNqguMnC7PNbRBJwk8GDpGyU48rWBok
 QLAZ3V1/PCpoIyitbgJBF5qjqFAfUmpWQLd1BbdYEqv4KhYhRoeLWnJzB/Bt71duqKjw
 d01s0LsfB0iKnIsPGPX/q0EOVYp/53/HJKkwV8gGVvvatoenVvjOaAsRhSr2krmEJu40
 2CoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749637420; x=1750242220;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3zUYH66sAi4M6SnRnDRUP9N7P8+78tvCpZpLM0hP8f0=;
 b=A1/YGzCUknra3g2gouZitlxxfMcW5bPTOOqYNBBjs3+AxBZ096Q/3F5bb4SdlSvZVA
 PYG97jCXzzWwh+9Dc828bYfUViJioHabGNzKvOePXimOeVlr/uaGdJJl6InJLOCTaajA
 fwdvq966TSIuetjgnWNXR0J4X1P9vVG/AVB9GFsmN8MU7C7vInPoDK01vda3agWoVXnm
 kpnQWoWeu52dqKe/7HTShZ9mn3lG/cM0NmK145tOWE/FLa1gHEhhzPMPJAaNVOj2yjKp
 Lhdvl+Vyo7Zd0nPqkew7K3/VlmK12ykZ6siIqT2IyJOD/QZVpJye1p3gTKizCT+zoIlV
 KhOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPQCoxKWAmnENM2Z1b14xQ75yhrID0S6iwfxHtERuWPRU7/IOcJ7Y4Q2e9Cin5nuaYP5lU4VPKflI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRHHRJEETYJX2QU9LFSsWTyT8kMWybhLnRKKeMuU6t04KGg1V2
 OOmPry6YkZtyTDQ/l7FaAQ2YIiyr+TmgvFxV5SkxvQGokfr103hjkmtL
X-Gm-Gg: ASbGncsACaowQHMt2wubWXx72n3IcNQmH8pHxvGXq4zmEFU7dglIaVoGm9gnb2jXdYj
 DPtI4s2q90ehZHWgOFrH5A9trXmVHENM6s3B1lGnFeIE7v1brtqnvyqH8gsptDV7YgF0VcNoWlb
 l7UzjBcm28Psh96oFS/jQHSRACaNWFIpgr1lYCDplmmMSdmwD8oUY+gUyUS5LEAjOWKRNv3I6vD
 CRJmTNW7JaQ0BOcb8wgjEegP2kMGsnQU3NI7HVSnL+TZe/qaJ4Wgi1bsWDLPB5RDei6flGAR13V
 LV9LhQwFFwgwYjsncFwQPtyRpGEx3BxzF8MjCcIrqj8AXaBE92+JXCOT2Dv3hvJedf4=
X-Google-Smtp-Source: AGHT+IGodjTiDzYzaYbdpnH5N4FiwK0k6INV5kLplUVd33gCvZuYk755vGupfng1qLMMcQ+unK6ODg==
X-Received: by 2002:a05:622a:1929:b0:476:b7cf:4d42 with SMTP id
 d75a77b69052e-4a714c5a834mr32371381cf.27.1749637420294; 
 Wed, 11 Jun 2025 03:23:40 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([204.93.149.208])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a61114ff18sm85664341cf.6.2025.06.11.03.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 03:23:39 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 11 Jun 2025 06:23:26 -0400
Subject: [PATCH v11 2/6] rust: enable `clippy::ptr_cast_constness` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ptr-as-ptr-v11-2-ce5b41c6e9c6@gmail.com>
References: <20250611-ptr-as-ptr-v11-0-ce5b41c6e9c6@gmail.com>
In-Reply-To: <20250611-ptr-as-ptr-v11-0-ce5b41c6e9c6@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
 Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
 Tamir Duberstein <tamird@gmail.com>, Benno Lossin <lossin@kernel.org>
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

There are only 3 affected sites:
- `*mut T as *const U as *mut U` becomes `(*mut T).cast()`.
- `&self as *const Self as *mut Self` becomes
  `core::ptr::from_ref(self).cast_mut()`.
- `*const T as *mut _` becommes `(*const T).cast_mut()`.

Apply these changes and enable the lint -- no functional change
intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#ptr_cast_constness [1]
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile                        | 1 +
 rust/kernel/block/mq/request.rs | 4 ++--
 rust/kernel/drm/device.rs       | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 21cc6e312ec9..5eeddfbf5900 100644
--- a/Makefile
+++ b/Makefile
@@ -485,6 +485,7 @@ export rust_common_flags := --edition=2021 \
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
 
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 624d7a4c83ea..ef66deb7ce23 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -83,8 +83,8 @@ impl<T: drm::Driver> Device<T> {
         major: T::INFO.major,
         minor: T::INFO.minor,
         patchlevel: T::INFO.patchlevel,
-        name: T::INFO.name.as_char_ptr() as *mut _,
-        desc: T::INFO.desc.as_char_ptr() as *mut _,
+        name: T::INFO.name.as_char_ptr().cast_mut(),
+        desc: T::INFO.desc.as_char_ptr().cast_mut(),
 
         driver_features: drm::driver::FEAT_GEM,
         ioctls: T::IOCTLS.as_ptr(),

-- 
2.49.0

