Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AB0A939C0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 17:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6201910EBB7;
	Fri, 18 Apr 2025 15:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E5h3X0rv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BD710EBB5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:37:35 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6ecfc2cb1aaso19438446d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744990654; x=1745595454; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NfGu7wYVjmH2hIFg1fXfkEnn9Cm0E0H3gIglihnXeLE=;
 b=E5h3X0rveSi7iY3LUWVWHC98+dNkqr5OGPDtvE2SM2mPjTEt2zybwXfwlztoedFehR
 cztUPA+nSjxbHu1SkA6+vgXjAmLmAKhkg6IXe8MLsXBAtu3VSjmGpxlc76dBDal6L4KW
 9Ihoa9DRAtRCWOrHDjG2ls29M0+vc6+Jkze32kcltnurkExEbXQlNKxD6MpFtCMj5P/F
 K+ag3D07mvgmCULBd6TVrP6kzU2iUSqImFZA2dmAuCWPPUcTzXnb/Np3J3G9D0mXuSVy
 SbF5ooYGDBkSIhZ8Htw4anDEvqHNetjufcWYQiDCdlOlm/vfl9SPKS7QFAowvRge7z1F
 45Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744990654; x=1745595454;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NfGu7wYVjmH2hIFg1fXfkEnn9Cm0E0H3gIglihnXeLE=;
 b=jINFneB8I+rIDmUIqb21VAwtC/ZlzZ72l8Z8T+ZJQ1aSeUPlQ8zUn3kjGWgKDJHrLD
 qzODvt6q9++mJcoyV1aJ2ecTBkuYAWbHEYHwPUiWtKz+hsGEHazuVhISLklK/17sNXim
 pOc54S52iMn8UK8zYMYN/hhHO1VAcK4J8WeGmHBnJ57zyoBfuK28ZFllIaiTpVaRy6ku
 Jygrm7n10M7v+jciti9fNAqIFB0ur2M7ZUykwGaLZTm28VIsNc910FVkTr8tXlC9LPSE
 FD5JFYqqtO/zOBuRAVfHnmIJ9nUtAZZG13ZUHvw0fJI/e/bPqP0C72QoAts+sjh83aqo
 H7WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx3Z4wliNScBa9PPvc2dQBJ5vQfL32yxAD2D7NLtoltn1I3gXEAo0Vo7ZZlGrcY5sd70fYiMohBUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwO31O36Is5mPGs/nF5iJqiDS3tqLJEaC28kSKoWNwfhWeENXH4
 3jFqySPSbK2cJzAvhYrwPN2eRQrPwexFaqgra9IiUk7geIU1pJHE
X-Gm-Gg: ASbGncvkaRlFPEI4b3KS26h0vNrr3Sya/q5igsKEOZjAiy0iHfN0Ud3QH89deS4FJBo
 wgTIFYhgZ21I+ykaenj6Fboz3HGU541YuUlgU+B2F90+tHwP27Ecmzz8jbTV6Q9qXK0ztjjaq5q
 P+MLnVCOwD28fvAvTUoQWdWQ0d4byRLww9qgRNgSKynSzQRlRa5V0jfYQA6VmfJqrqClXDuWT5E
 pxb0nrzzwBGuXg93E+CaNcA6Kf3rW5cB+i8JXEKuDYJjVmAezrQamE1Oo62oahlywavXJlHiaPw
 GAVOA8zIPHeL0i1Xff6QbnUJ3gyUw4MFHJ2XiYZ4ynxj69to/FHpkVSAkPje0teWdTMwSQ==
X-Google-Smtp-Source: AGHT+IEjm4gjX6avlCTxX6P+AGziI4AEn/fqn0zvIB1++4dhmVtZSiPw0dYmXKehW0VPFJzmkwobjA==
X-Received: by 2002:a05:6214:2487:b0:6e8:fb7e:d33b with SMTP id
 6a1803df08f44-6f2c463602bmr59353916d6.33.1744990654487; 
 Fri, 18 Apr 2025 08:37:34 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:7988:e5e5:1f4c:be78])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2c21d9bsm11623096d6.96.2025.04.18.08.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 08:37:33 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 18 Apr 2025 11:37:21 -0400
Subject: [PATCH v10 5/6] rust: enable `clippy::cast_lossless` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250418-ptr-as-ptr-v10-5-3d63d27907aa@gmail.com>
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

Before Rust 1.29.0, Clippy introduced the `cast_lossless` lint [1]:

> Rust’s `as` keyword will perform many kinds of conversions, including
> silently lossy conversions. Conversion functions such as `i32::from`
> will only perform lossless conversions. Using the conversion functions
> prevents conversions from becoming silently lossy if the input types
> ever change, and makes it clear for people reading the code that the
> conversion is lossless.

While this doesn't eliminate unchecked `as` conversions, it makes such
conversions easier to scrutinize.  It also has the slight benefit of
removing a degree of freedom on which to bikeshed. Thus apply the
changes and enable the lint -- no functional change intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#cast_lossless [1]
Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://lore.kernel.org/all/D8ORTXSUTKGL.1KOJAGBM8F8TN@proton.me/
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile                        | 1 +
 drivers/gpu/drm/drm_panic_qr.rs | 2 +-
 rust/bindings/lib.rs            | 1 +
 rust/kernel/net/phy.rs          | 4 ++--
 rust/uapi/lib.rs                | 1 +
 5 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 57080a64913f..eb5a942241a2 100644
--- a/Makefile
+++ b/Makefile
@@ -476,6 +476,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wclippy::all \
 			    -Wclippy::as_ptr_cast_mut \
 			    -Wclippy::as_underscore \
+			    -Wclippy::cast_lossless \
 			    -Wclippy::ignored_unit_patterns \
 			    -Wclippy::mut_mut \
 			    -Wclippy::needless_bitwise_bool \
diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index f2a99681b998..7555513a4fd8 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -386,7 +386,7 @@ fn next(&mut self) -> Option<Self::Item> {
         match self.segment {
             Segment::Binary(data) => {
                 if self.offset < data.len() {
-                    let byte = data[self.offset] as u16;
+                    let byte = u16::from(data[self.offset]);
                     self.offset += 1;
                     Some((byte, 8))
                 } else {
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 0486a32ed314..b105a0d899cc 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -25,6 +25,7 @@
 )]
 
 #[allow(dead_code)]
+#[allow(clippy::cast_lossless)]
 #[allow(clippy::ptr_as_ptr)]
 #[allow(clippy::undocumented_unsafe_blocks)]
 mod bindings_raw {
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index a59469c785e3..f821480ad72b 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -142,7 +142,7 @@ pub fn is_autoneg_enabled(&self) -> bool {
         // SAFETY: The struct invariant ensures that we may access
         // this field without additional synchronization.
         let bit_field = unsafe { &(*self.0.get())._bitfield_1 };
-        bit_field.get(13, 1) == bindings::AUTONEG_ENABLE as u64
+        bit_field.get(13, 1) == u64::from(bindings::AUTONEG_ENABLE)
     }
 
     /// Gets the current auto-negotiation state.
@@ -426,7 +426,7 @@ impl<T: Driver> Adapter<T> {
         // where we hold `phy_device->lock`, so the accessors on
         // `Device` are okay to call.
         let dev = unsafe { Device::from_raw(phydev) };
-        T::match_phy_device(dev) as i32
+        T::match_phy_device(dev).into()
     }
 
     /// # Safety
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index f03b7aead35a..d5dab4dfabec 100644
--- a/rust/uapi/lib.rs
+++ b/rust/uapi/lib.rs
@@ -14,6 +14,7 @@
 #![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     clippy::all,
+    clippy::cast_lossless,
     clippy::ptr_as_ptr,
     clippy::undocumented_unsafe_blocks,
     dead_code,

-- 
2.49.0

