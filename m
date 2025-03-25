Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A568DA70B0D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 21:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5AF10E5ED;
	Tue, 25 Mar 2025 20:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LyIUu6NS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9620210E5F3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:08:02 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6e91d323346so2192306d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 13:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742933281; x=1743538081; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J7qMAKZkfn3qZ7sMOOmPjuPsXs8aZ5zQxKqzh4XVWmo=;
 b=LyIUu6NSlqbxorEX4QG6ggdAYjiKj4XKfNaYMCy7ZB3L27Ne1oW/9T96beCgmLPKCB
 uX8jf9rjxWj8QxQboJecJUTZGOWfxr7Hb6/JkIVAKLNley3MUuyRuKaWB5FqDD/XwF9t
 Nwo7jdsnFro3gQ05mSiJJ2BjbFuA+rWC/fXJdabCi/67IfBhS0/g9HYL3D5M2mU/rCs3
 s/aqaWxDyF/LaTj+e78QtP5UxSDdHRUVr21q2bHiMDhw2CygImpjN9hfjFjC21EJEref
 WkDjy/TZu4UXjndcAd/zl5GmQSV46uroPuTGzTPN00cMGdALb1KjVVzoxvosdwlI0e3Y
 RJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742933281; x=1743538081;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J7qMAKZkfn3qZ7sMOOmPjuPsXs8aZ5zQxKqzh4XVWmo=;
 b=k1DmyRUrP9uZPX9aggzujVSEnge+9F8b4VFWyDfu1t6yNFmxwt59dQfdMLlejxNR84
 pPpELjcVonLR7iXCAlH9a1jDOpwdVcg4dnCYU3KMD69dveFOALAaGAfI9W8JeR0WRVFi
 HhgtiEZMu+IhChe4YFJ8NjK9SOen9nPbyXOekM8fK+shLbWbIxEL20c7uJBuolJOkCsk
 yLFngtn4+8NCTIkEPqc2W9pt8FlEQ44kVn7rXFCynDspfkym7q1KS+JpK0NQ3LEWunLV
 83mG4vqYkH3vcFBQ8/VlqdBWhC9LWp6WhwYhPOS5G8vQE3+7s6TVQFsp4M9VRWojI8RJ
 tYow==
X-Forwarded-Encrypted: i=1;
 AJvYcCX19PWi+9yhk6/X7sGcFuVhoYp8tjuBMFgz1fD8vtFnv1RGDoi6X77EdlAc8+0zNCTqf8h3/l3N/l0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIDpiF7il2JGwVzUU5LrGwv2N3agDib9BIejbfqj9er5he0sU3
 lttPsIOpws37dKNl7BwjaG4ZK+9SRkiEtVJq19M667j58iKdjnj+jFIZvhx74fA=
X-Gm-Gg: ASbGncssfMfw+KZqjEiaPwzW0q8ntSESC6aDq7fpkLRsUhZjRQnYfuD6LzVt0uoAXTM
 ipWKeVroXMelB8TNcBFnBG53mybeWd5wwvX4kuHNRqHFgmRGfZrZbh0i5L1F8qA0ZQRtB4SI5a1
 C429scp9ibrxtjJntxEY0nihTq3HxUI2+lSyN+jYoRvFbZnwmYsVMHBf6FUY8c9hEfiBFeZ6E72
 eTsFy1WxqjpC9ZhTRm7A0mYZB0+F41BO8UrvAI8bPIGxJ4kSiUftebZroTrBub6KNTsMzSHYSpY
 3dWsVm496UZMZWUSTV/fLnUBE9Njo9gBSdc8iXmyFj33Orx0x4+7Q4wjPNv187orGLR9xgTlib8
 AqJO3fkpgDnMYBkOtC8Ai5QeZNrZePjBXskVJtcPQBSD29dlNDmzHXA==
X-Google-Smtp-Source: AGHT+IFcj7P2M43acjXCLPntAogjbFV68WayLoYS23bXlpmJcLC/E6TkncrczRInojNWt3+ooJGElA==
X-Received: by 2002:a05:6214:2528:b0:6e8:ec18:a1be with SMTP id
 6a1803df08f44-6ed16c3e8cemr17403746d6.7.1742933280534; 
 Tue, 25 Mar 2025 13:08:00 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:38f6]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eb3ef31810sm59790316d6.64.2025.03.25.13.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 13:08:00 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 25 Mar 2025 16:07:47 -0400
Subject: [PATCH v7 7/7] rust: enable `clippy::ref_as_ptr` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-ptr-as-ptr-v7-7-87ab452147b9@gmail.com>
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

In Rust 1.78.0, Clippy introduced the `ref_as_ptr` lint [1]:

> Using `as` casts may result in silently changing mutability or type.

While this doesn't eliminate unchecked `as` conversions, it makes such
conversions easier to scrutinize.  It also has the slight benefit of
removing a degree of freedom on which to bikeshed. Thus apply the
changes and enable the lint -- no functional change intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr [1]
Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://lore.kernel.org/all/D8PGG7NTWB6U.3SS3A5LN4XWMN@proton.me/
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile                 | 1 +
 rust/bindings/lib.rs     | 1 +
 rust/kernel/device_id.rs | 3 ++-
 rust/kernel/fs/file.rs   | 3 ++-
 rust/kernel/str.rs       | 4 ++--
 rust/kernel/uaccess.rs   | 5 +++--
 rust/uapi/lib.rs         | 1 +
 7 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 2e9eca8b7671..081b5fa2aa81 100644
--- a/Makefile
+++ b/Makefile
@@ -488,6 +488,7 @@ export rust_common_flags := --edition=2021 \
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
index 4063f09d76d9..37cc03d1df4c 100644
--- a/rust/kernel/device_id.rs
+++ b/rust/kernel/device_id.rs
@@ -136,7 +136,8 @@ impl<T: RawDeviceId, U, const N: usize> IdTable<T, U> for IdArray<T, U, N> {
     fn as_ptr(&self) -> *const T::RawType {
         // This cannot be `self.ids.as_ptr()`, as the return pointer must have correct provenance
         // to access the sentinel.
-        (self as *const Self).cast()
+        let this: *const Self = self;
+        this.cast()
     }
 
     fn id(&self, index: usize) -> &T::RawType {
diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 9e2639aee61a..366e23dc0803 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -359,12 +359,13 @@ impl core::ops::Deref for File {
     type Target = LocalFile;
     #[inline]
     fn deref(&self) -> &LocalFile {
+        let this: *const Self = self;
         // SAFETY: The caller provides a `&File`, and since it is a reference, it must point at a
         // valid file for the desired duration.
         //
         // By the type invariants, there are no `fdget_pos` calls that did not take the
         // `f_pos_lock` mutex.
-        unsafe { LocalFile::from_raw_file((self as *const Self).cast()) }
+        unsafe { LocalFile::from_raw_file(this.cast()) }
     }
 }
 
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 40034f77fc2f..6233af50bab7 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -29,7 +29,7 @@ pub const fn is_empty(&self) -> bool {
     #[inline]
     pub const fn from_bytes(bytes: &[u8]) -> &Self {
         // SAFETY: `BStr` is transparent to `[u8]`.
-        unsafe { &*(bytes as *const [u8] as *const BStr) }
+        unsafe { &*(core::mem::transmute::<*const [u8], *const Self>(bytes)) }
     }
 
     /// Strip a prefix from `self`. Delegates to [`slice::strip_prefix`].
@@ -290,7 +290,7 @@ pub const fn from_bytes_with_nul(bytes: &[u8]) -> Result<&Self, CStrConvertError
     #[inline]
     pub unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut CStr {
         // SAFETY: Properties of `bytes` guaranteed by the safety precondition.
-        unsafe { &mut *(bytes as *mut [u8] as *mut CStr) }
+        unsafe { &mut *(core::mem::transmute::<*mut [u8], *mut Self>(bytes)) }
     }
 
     /// Returns a C pointer to the string.
diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 80a9782b1c6e..c042b1fe499e 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -242,7 +242,7 @@ pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
     pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
         // SAFETY: The types are compatible and `read_raw` doesn't write uninitialized bytes to
         // `out`.
-        let out = unsafe { &mut *(out as *mut [u8] as *mut [MaybeUninit<u8>]) };
+        let out = unsafe { &mut *(core::mem::transmute::<*mut [u8], *mut [MaybeUninit<u8>]>(out)) };
         self.read_raw(out)
     }
 
@@ -348,6 +348,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
         if len > self.length {
             return Err(EFAULT);
         }
+        let value: *const T = value;
         // SAFETY: The reference points to a value of type `T`, so it is valid for reading
         // `size_of::<T>()` bytes.
         //
@@ -357,7 +358,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
         let res = unsafe {
             bindings::_copy_to_user(
                 self.ptr as *mut c_void,
-                (value as *const T).cast::<c_void>(),
+                value.cast::<c_void>(),
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

