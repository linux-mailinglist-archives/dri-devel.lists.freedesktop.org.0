Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE15FA90A14
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 19:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D7110E987;
	Wed, 16 Apr 2025 17:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EAMm59bT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D65F10E987
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 17:36:34 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6eaf1b6ce9aso75957826d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 10:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744824993; x=1745429793; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=70V/ZNK+rmYoFvMHiW/74+os3nIm0NWF0rbd6T5wy5s=;
 b=EAMm59bT7IXTQcnot1exFGK8PmAfPTBOq7X/apXXWyLdM+UmmOxn0Pzt4hhQy7Y04M
 wcG6CF5iIGLwJFv8flgQsSOBvbpMIYTFeHRwPuRS8Aa9g5ZFVTy21wfaMQMUDStSm0ok
 Cx9EmTECzoFU46X+liJ1GPNMn67k5ElcisYLv1dUhNDpRJx+M+SeaO3EzrYMoexQeFfU
 p9woC3hKm7flVJjeeq20Fmwm/x2GPGMFRWMOqFptFQXTJ3Mx0Csmy0K/HvXmtH0cKtvY
 wYCWvWImxAgvBJe1KxkGDDhx2JHmREtw5vKkp98RhWN1/tmXXOGssneeNC77YlMUCSxU
 JvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744824993; x=1745429793;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=70V/ZNK+rmYoFvMHiW/74+os3nIm0NWF0rbd6T5wy5s=;
 b=sq1UGs/uFUPaO/btUSgOxZv99adawpS2Mp2sWDlbkLEMffQDdSdOJEki1lOjLApXUK
 6Sl5TphlsysxwVeJFIvA7wNvHPeG1dtft884maHgiTrK007/HpfjCoW+Huh5VRQ1JYyq
 y0r3oBroxl7zpOJjPO3PNtcE6gsTE2uRVKkjaL4vvOy+wP3kXLg3IxzCjwDGFFGpnqbB
 nIckWV6N8TBQXgE+5KM51HoOJTAtDLF9cs/itr5Y/2G6dY2DsRAcGcEzRzcv8uC4cBYg
 TZah6Cs38ipsTeuRkbep9+57rhrzYN+e8sqT7lAK1NNkgSKsZjvfzBgG4qfHF7WwjiOd
 klsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyxkt/ebalVQJxqNV92axW1GDQ+/NzjHuZqhYd9dQE2kTMfawJSXmRvjpsx8SDER22ZdQialvn/70=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTh5FO3FyK+ct40DTi3tJt+/wscPfjMFoD8/mxBZ23svS2XAIV
 bwtIp23cidyq4wRhqB6HqnOkTFLcXOZPX8OK9Hc15slRrgWZJvXr
X-Gm-Gg: ASbGncsCkriipfDCdP9/PL71F29tpvuzamykQ/bX37Hk/ka7NQLlH5w5fe2AxLCRfK1
 j9BcNZnY9qhmKqdQaDjY1gi8TQRKlPuwrRQMu2xCuCDa10huXsU6SSLZmOEihrj19bgCPUeFcrf
 tfwOwPPfA0ERVZtMAUBY2QJUohJG1v5PBM61u9/RgYt+Y8SQMeUCsSJ8YaQqodiS/CvLnK9BA4j
 yyNsdeYWlfkX5E0KQI5CNgdYday882IkVDtqb1ZTQNG7ZZcqwfzaakk6EDFoDu6YVnTKhtuL5fp
 lDJ8ofUi85sk2SXRdjN049i+e2+Z8gl6lhYzB/sv5M7lrqJCuBu08GJ98UivEs3QpdVu6Ugiy/7
 bpyApg9oOHqj9AK4ZVkU+D/WH/60ryXU3LmplbuKi8Atz
X-Google-Smtp-Source: AGHT+IHoff5UaNKwwImuHNe3ew0+XBOuxETDH2IiJSCOUP4kTLnxRtQBJcnt2KWDVXSB29dyM1PQUA==
X-Received: by 2002:a05:6214:411b:b0:6f2:a457:19a with SMTP id
 6a1803df08f44-6f2b2f8bf34mr40614196d6.25.1744824993112; 
 Wed, 16 Apr 2025 10:36:33 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:a61d]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f0dea07c50sm118289886d6.77.2025.04.16.10.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 10:36:32 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 16 Apr 2025 13:36:10 -0400
Subject: [PATCH v9 6/6] rust: enable `clippy::ref_as_ptr` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-ptr-as-ptr-v9-6-18ec29b1b1f3@gmail.com>
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
In-Reply-To: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
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

