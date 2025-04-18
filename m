Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A6CA939C1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 17:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C75810EBB8;
	Fri, 18 Apr 2025 15:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XTjS469m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A934110EBB8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:37:37 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6f2c45ecaffso8022296d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744990657; x=1745595457; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d5hiiUh/P67/GQqlTcZ6AkOFOmj5iMZ3jMe2SBwJf9k=;
 b=XTjS469m6LHl0rjedYWExQWQR2aNx7fQN/i4fHWSpQVf8iVfoV5gTdQVe0hSKV0Irv
 hkR+Z18xMOl16z74+NFEURREzhFfIgPjWRpc6447BGgxlER+FzAF3QjPrwwJxR8d1tFn
 1kR+IjOgqRz/SRHM3lijD/Q9hWibt1EXec0t9dW0LDENF1fOpBx6BeJxMrkf0l9iZTcV
 jtRt9Iv11ZhvGMbBUkNYlwgBwMHDMlJfyCr30laDr3A//aNAbbdFwuZB6he7hIgQBltj
 PErzww9LTUzP0Iprfy6qaijwaSumJ5iM76pIsVEfYS5EBfVSF66U1Z9+VODXMdL54fGK
 WSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744990657; x=1745595457;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d5hiiUh/P67/GQqlTcZ6AkOFOmj5iMZ3jMe2SBwJf9k=;
 b=KY4OG1FdH0zJo6lwVmOjPBECL69c5YkXVHRmBMJ35p7SOfeTdONTWNqAs/NXup5fdK
 w8ZZA1X8fxPMIyqdaaiqzCumX3jrfLc6QaeSDFm19VgH21DJ69WnwwzVLJjiTO2D4iD5
 tE6hkS3peGccq2JaMcbGHDyuDedHVCjki0eHm4PYTq83aqOl3nkZ3Jjds6oJxiZhFB1F
 j4/p68bAWbNWqnjiZIq4xNsVKH8OBXDH9q4OZAizJnpyqkKRCCqSuEx8begj1mOMfagO
 /8D64QrpHbKG9WvCII7Zdc8Snx3dK9I75k2Hq0l7WlWEo2FQCQixUdgW6nn0xk3m4/dP
 HEbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwLT/WAO+ZMOb6Xyd8frRP6OxwJS+V2DNGp0uyQTD3FxWZshURhcg8/JiyajUUtG9LQZhigLxov1Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKVGHEmPgyXZabB6pILgUX7jGKF6S3XU90zjjvvk5hFQdvOqSI
 oIGoZ/t3snmMs+K0KlW//F8gFRuX9cj/dE/Q3ryftz61plNYN2La
X-Gm-Gg: ASbGncsyjXz1+Xj7sNBvaXC+dlQ+NVRloIKkLTxPk4NqKu+PkwB0MaMdxKX6uFXETVA
 Sh7hDWWuy9yAww2BrbI6oA/dzmI5J5FSnYTmYVXJtkZ+cR3zy0x79gYCOK9aEOmpCC9OTAxR0F2
 7pGwvCN6PIMxSwGE3TENNuOXeLZDx/jai+49oOjUXogc+d9IeM4mFeqDX1/x6XvU2TskCzw4DbV
 C1eL6D8nN5gywY8Ntgk44k4Pus7XvRBZdGJB6CaBUmeXqGBfHs2Db5fmlhaq20mxMj2nlkUlm2y
 vvNYfeUnOMRXpLtvg6mcZujnLWKBU1fnrdu6Mud2SMsIfiaz+uLfT9lVB7RgDpuuO5/0KXjO2AB
 snMjV
X-Google-Smtp-Source: AGHT+IE6q7vZay+OEaNaFKC2yY4Mgb23CsaphyC2no0B8NXz2XdFGwpfQ02v9LdUIlLAeT+YHdFGgQ==
X-Received: by 2002:a05:6214:1d0c:b0:6e8:86d3:be78 with SMTP id
 6a1803df08f44-6f2c46b88b4mr48009246d6.37.1744990656672; 
 Fri, 18 Apr 2025 08:37:36 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:7988:e5e5:1f4c:be78])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2c21d9bsm11623096d6.96.2025.04.18.08.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 08:37:36 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 18 Apr 2025 11:37:22 -0400
Subject: [PATCH v10 6/6] rust: enable `clippy::ref_as_ptr` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-ptr-as-ptr-v10-6-3d63d27907aa@gmail.com>
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

In Rust 1.78.0, Clippy introduced the `ref_as_ptr` lint [1]:

> Using `as` casts may result in silently changing mutability or type.

While this doesn't eliminate unchecked `as` conversions, it makes such
conversions easier to scrutinize.  It also has the slight benefit of
removing a degree of freedom on which to bikeshed. Thus apply the
changes and enable the lint -- no functional change intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr [1]
Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://lore.kernel.org/all/D8PGG7NTWB6U.3SS3A5LN4XWMN@proton.me/
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile                 | 1 +
 rust/bindings/lib.rs     | 1 +
 rust/kernel/device_id.rs | 2 +-
 rust/kernel/fs/file.rs   | 2 +-
 rust/kernel/str.rs       | 4 ++--
 rust/kernel/uaccess.rs   | 4 ++--
 rust/uapi/lib.rs         | 1 +
 7 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index eb5a942241a2..2a16e02f26db 100644
--- a/Makefile
+++ b/Makefile
@@ -485,6 +485,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wclippy::no_mangle_with_rust_abi \
 			    -Wclippy::ptr_as_ptr \
 			    -Wclippy::ptr_cast_constness \
+			    -Wclippy::ref_as_ptr \
 			    -Wclippy::undocumented_unsafe_blocks \
 			    -Wclippy::unnecessary_safety_comment \
 			    -Wclippy::unnecessary_safety_doc \
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index b105a0d899cc..2b69016070c6 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -27,6 +27,7 @@
 #[allow(dead_code)]
 #[allow(clippy::cast_lossless)]
 #[allow(clippy::ptr_as_ptr)]
+#[allow(clippy::ref_as_ptr)]
 #[allow(clippy::undocumented_unsafe_blocks)]
 mod bindings_raw {
     // Manual definition for blocklisted types.
diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
index 4063f09d76d9..74b5db81231f 100644
--- a/rust/kernel/device_id.rs
+++ b/rust/kernel/device_id.rs
@@ -136,7 +136,7 @@ impl<T: RawDeviceId, U, const N: usize> IdTable<T, U> for IdArray<T, U, N> {
     fn as_ptr(&self) -> *const T::RawType {
         // This cannot be `self.ids.as_ptr()`, as the return pointer must have correct provenance
         // to access the sentinel.
-        (self as *const Self).cast()
+        core::ptr::from_ref(self).cast()
     }
 
     fn id(&self, index: usize) -> &T::RawType {
diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 791f493ada10..c9a86beacb65 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -364,7 +364,7 @@ fn deref(&self) -> &LocalFile {
         //
         // By the type invariants, there are no `fdget_pos` calls that did not take the
         // `f_pos_lock` mutex.
-        unsafe { LocalFile::from_raw_file((self as *const Self).cast()) }
+        unsafe { LocalFile::from_raw_file(core::ptr::from_ref(self).cast()) }
     }
 }
 
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 40034f77fc2f..ca173ae3282d 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -29,7 +29,7 @@ pub const fn is_empty(&self) -> bool {
     #[inline]
     pub const fn from_bytes(bytes: &[u8]) -> &Self {
         // SAFETY: `BStr` is transparent to `[u8]`.
-        unsafe { &*(bytes as *const [u8] as *const BStr) }
+        unsafe { &*(core::ptr::from_ref(bytes) as *const BStr) }
     }
 
     /// Strip a prefix from `self`. Delegates to [`slice::strip_prefix`].
@@ -290,7 +290,7 @@ pub const fn from_bytes_with_nul(bytes: &[u8]) -> Result<&Self, CStrConvertError
     #[inline]
     pub unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut CStr {
         // SAFETY: Properties of `bytes` guaranteed by the safety precondition.
-        unsafe { &mut *(bytes as *mut [u8] as *mut CStr) }
+        unsafe { &mut *(core::ptr::from_mut(bytes) as *mut CStr) }
     }
 
     /// Returns a C pointer to the string.
diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 80a9782b1c6e..5f8e1e7babb3 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -242,7 +242,7 @@ pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
     pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
         // SAFETY: The types are compatible and `read_raw` doesn't write uninitialized bytes to
         // `out`.
-        let out = unsafe { &mut *(out as *mut [u8] as *mut [MaybeUninit<u8>]) };
+        let out = unsafe { &mut *(core::ptr::from_mut(out) as *mut [MaybeUninit<u8>]) };
         self.read_raw(out)
     }
 
@@ -357,7 +357,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
         let res = unsafe {
             bindings::_copy_to_user(
                 self.ptr as *mut c_void,
-                (value as *const T).cast::<c_void>(),
+                core::ptr::from_ref(value).cast::<c_void>(),
                 len,
             )
         };
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index d5dab4dfabec..6230ba48201d 100644
--- a/rust/uapi/lib.rs
+++ b/rust/uapi/lib.rs
@@ -16,6 +16,7 @@
     clippy::all,
     clippy::cast_lossless,
     clippy::ptr_as_ptr,
+    clippy::ref_as_ptr,
     clippy::undocumented_unsafe_blocks,
     dead_code,
     missing_docs,

-- 
2.49.0

