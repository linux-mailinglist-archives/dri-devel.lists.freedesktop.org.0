Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2333A70B06
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 21:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3216910E5F1;
	Tue, 25 Mar 2025 20:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ho1a2nUg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCDC10E5EF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:07:55 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6ed16ce246bso2031156d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 13:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742933274; x=1743538074; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jXDBuKpzZkDEwqWUPr5JbpVdesx1OReuFvw422VpuEU=;
 b=ho1a2nUgJZP0H4gy32BQvhS7EORaq60sirTIxQbnd6tSCt4bPKe17jGy1cCD2jBzKB
 6spj/GbLCJ2IWBcTvEIb61CP08siAG/Tr6bumyU5B/uSGX1jt584kSay4q4mIVPXp591
 qIFRRaO9AI4HOw82tNHxOjGapIoGL72ulVH78VMW4DfvFVwJXUIARPl9CzGiN/NQZog9
 ZLNzYTlvYtC3SO1ApUxxL4yhCDXH0HMDdtc1zJWrUmT/+lZ+DNQTFrvNft/83qdnvB68
 7RyOKreqp6O0Noe7YHgG9r6LuwJsM8wM/ZjCEe4MhwDT2sf6iwcMWQwRcwmyPoFKJWpN
 0VBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742933274; x=1743538074;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jXDBuKpzZkDEwqWUPr5JbpVdesx1OReuFvw422VpuEU=;
 b=qlmzssVTzbctfIGmG5N7ndQzw7c3yvMgxdfXhdMu9tOS12xTeHbDMd/kGsXEDC2tzm
 Q9L1UqDDIaeuz8nTxu4OpXR7Tbfgjr0FPhcXHlgH3390uwgejgBBhuxCLqVEZ8iIhZnr
 TQKrLDEJ5IXJY9EhF5iVo4FxKSmHra/kCdiYniWEXxHkObsWsthtUjRzMe3Qmbq8l/Sb
 v+wn7ss/7YDeev6TNI1+dW5bjddIfTOj1W2p9e2TASOAUJ8F+7qSIHThrveDFs+uly5w
 EEj9Kx1yKC61m9OlfgZopPq9kXSr3Z0gBGtYmGgFIgQn/TfE1Z93oiKxV6Ac/f7BwQms
 SpaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd1JI2pozmAeYmV+tv4Fx+JQcEAWzYHjv+WlH9L3ogOFY8yV2Nku6wyelCwhiLh4MWFwmuu64mmVg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDz7NIIPc0QqQRY66nw9pS2BGLs3/KwALywuuiJuRNEwR3mwvi
 j4nBWd3w/EVc7ZQFkZIHRzfuI/o9+f1O8jU/lau45CpjbPKLTbwkgURt2AKnfC4=
X-Gm-Gg: ASbGncvPhcIjmtbLZurjebw8rx/lYup9azm4l5kJtgNlDgLfo7POikDxpx+ygg/UFcK
 0o6p20SXnGneJe/aF3aor3F/d0JogdS+GGySV8969XS70YFFEpgXuy8Ygenr9M82W/JMGIz3is1
 vec7iJmjHo4z3/C3UByrPCoW0o6ytTwvkdwaivGroVw0M58nfnb0AImjsmnK5yFSRXvSQGFiGWO
 HxezkwCylVWD4HnRpkZXdis9P0u0TuNVtIo8DuWpp6XGL/SlprwbJVCGu5InqUuZ+7A/WsoZe2D
 ma2dNsr2vMR1wcAY0LwmGsunTMHMcc6//xkQ6dfcgqr6t/1pkwDgYgOnS5cuOS3ib9Qt6Pdo24P
 vEvkWScfosSXyzuTBjSIgy/af47RsnlTQzy0KkSjTSnb/NyY573SaAkc7kYpiGUZI
X-Google-Smtp-Source: AGHT+IEODFsgFHGeBQ9zW8PY+ll3LVkcvJOvrWbn6xtmL0Kku/jCxdUnT9mLuAqmvSy6k4YXj/4CGg==
X-Received: by 2002:a05:6214:252f:b0:6e8:f9e6:c4e2 with SMTP id
 6a1803df08f44-6eb3f33d619mr287029296d6.32.1742933273933; 
 Tue, 25 Mar 2025 13:07:53 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:38f6]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eb3ef31810sm59790316d6.64.2025.03.25.13.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 13:07:52 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 25 Mar 2025 16:07:43 -0400
Subject: [PATCH v7 3/7] rust: enable `clippy::ptr_cast_constness` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-ptr-as-ptr-v7-3-87ab452147b9@gmail.com>
References: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
In-Reply-To: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
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
2.49.0

