Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF5DA6E617
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 23:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0A610E4EC;
	Mon, 24 Mar 2025 22:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fU3TKxN7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF9A10E4EA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 22:01:55 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-476f4e9cf92so33006671cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 15:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742853714; x=1743458514; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Okf71mJ2fjHM6RavOTp6+N0Ztqg8E8Xvt1yqhkIK7vU=;
 b=fU3TKxN77Z9/hoNGnc00fk3ujcX5Sk1u4JIjik+bSx6+KXitQ5QZK7KoQL/pGTcr1r
 eMI6NwKLi2nCSRKo7NBB6LxTdAiCR9mCco2TKNfiIRszduYsDixRXx2WMwAX+PMNFWMO
 sxm0TDm4+rWUuxQZRGMTehWYhxsArkHcq9NOmB6Gl4PcreZnHXBte5Lp03oYbxMYBAsa
 hq0dElLbQEPGFoZttr3lo3tsPWVXnfu/3yuxKaFETiQDtMLFp10P8M2uxQWUDuJilEYf
 mnzLDuex3cl67lbsEt1oHLphMRAOxZ3ipeqm3ONftOrvNqpSwFW+ThC910yZaUC9iG2o
 o7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742853714; x=1743458514;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Okf71mJ2fjHM6RavOTp6+N0Ztqg8E8Xvt1yqhkIK7vU=;
 b=oVdvsWzPHppCp5H7W14ESqpA9ShhBxKhaI/zlPaliiYAFZZD2JEstKqVK0axV4lKpm
 w7XzWLuqOvxi998rFL1+pv5ifnoQSdFzjjxu6Je66rjD0wtNr+tlkBn4H3pXvoEATL85
 6NtXCisUlt8Vy0HogbdBHoX1014ZVv3aOyUBa8/Fcv4WOylQMuNl+WCeHzo01ap4Nyna
 wXoCWzo4a9/GV9BOdpEhJsP4MWD4LTQNCOXvzXLMGADArkGnsY/9cgUISKbl/ab08jlx
 Z2pD/NLaDiOzPHXNyPjFmwo4NEnucpBhWhSBon5zFhcJe06O7Yl3kMQ/xjNCyCo5e2w6
 ++HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvDnSzr0K+LRjLOAv3Arlr40EpmW0hoXi4k1OA/DkNGN3a3aU49+SX5nKAjUlCZSYsxt8GsJ1SIhc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFec18S61JfG4N/Ny50KGCWTCIAWO6oJVdJnuGmcxH4dYJqmBg
 kvRC2g3fVxCJux+Qne+c3Qd6666G6mwrseotfpg2LRrETL/lBiO1fmiK3q09UoM=
X-Gm-Gg: ASbGncuw5oRwPcVVPXbxq+Y8LqCB/5N1RC844lWCxk0SggcIdB6bSx3vK2U8C+uZk4n
 qKYUKA2kG9Me3QEd4GYL1egXRcAmAHN02KNWCx6bnESf//VNzydSXMtdd6MmkkN7ITm23iJSlbr
 QH19Djr2kzKjLAJjsUzLe3oE3TiikNy2hJ9KbD2mlf/yk82dFWhZISFq15IPPVAkvoc29HLL3UF
 PeIH3BAc9vyXKdlgfICVUQMfe0ZASLl6ts9QZJQlaRuuVPL8GRSYW0LpLSDTgc2L+LlASX2pj/Q
 f7x64X0QT7ZGtM2Ko/IOG0WPzZZIx8Z+gQTuGlm1gcyTZnGaZvDI6M6gstTDaOiIwQUO6/hme01
 w111+JAZuJK0Kc0mmCqe26ZNS5vbehTsnU2ABR+RAdD512qvZ3wZvd66WyOclzUl/
X-Google-Smtp-Source: AGHT+IGiTpxJOfUP6yEDw+BZ5IoEtfpjeRAnSg8Fp13Y/l+nete8QxRyDKUWgvo+a1iooMF3ftJdsw==
X-Received: by 2002:a05:622a:1805:b0:477:1e1f:8a0a with SMTP id
 d75a77b69052e-4771e1f928bmr226073741cf.0.1742853713644; 
 Mon, 24 Mar 2025 15:01:53 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:43c7]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4771d0ad87esm52129541cf.0.2025.03.24.15.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 15:01:53 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 24 Mar 2025 18:01:35 -0400
Subject: [PATCH v6 6/6] rust: enable `clippy::cast_lossless` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250324-ptr-as-ptr-v6-6-49d1b7fd4290@gmail.com>
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
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile                        |  1 +
 drivers/gpu/drm/drm_panic_qr.rs | 10 +++++-----
 rust/bindings/lib.rs            |  2 +-
 rust/kernel/net/phy.rs          |  4 ++--
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 2af40bfed9ce..2e9eca8b7671 100644
--- a/Makefile
+++ b/Makefile
@@ -479,6 +479,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wclippy::all \
 			    -Wclippy::as_ptr_cast_mut \
 			    -Wclippy::as_underscore \
+			    -Wclippy::cast_lossless \
 			    -Wclippy::ignored_unit_patterns \
 			    -Wclippy::mut_mut \
 			    -Wclippy::needless_bitwise_bool \
diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index ecd87e8ffe05..01337ce896df 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -305,15 +305,15 @@ fn get_next_13b(data: &[u8], offset: usize) -> Option<(u16, usize)> {
         // `b` is 20 at max (`bit_off` <= 7 and `size` <= 13).
         let b = (bit_off + size) as u16;
 
-        let first_byte = (data[byte_off] << bit_off >> bit_off) as u16;
+        let first_byte = u16::from(data[byte_off] << bit_off >> bit_off);
 
         let number = match b {
             0..=8 => first_byte >> (8 - b),
-            9..=16 => (first_byte << (b - 8)) + (data[byte_off + 1] >> (16 - b)) as u16,
+            9..=16 => (first_byte << (b - 8)) + u16::from(data[byte_off + 1] >> (16 - b)),
             _ => {
                 (first_byte << (b - 8))
-                    + ((data[byte_off + 1] as u16) << (b - 16))
-                    + (data[byte_off + 2] >> (24 - b)) as u16
+                    + u16::from(data[byte_off + 1] << (b - 16))
+                    + u16::from(data[byte_off + 2] >> (24 - b))
             }
         };
         Some((number, size))
@@ -414,7 +414,7 @@ fn next(&mut self) -> Option<Self::Item> {
         match self.segment {
             Segment::Binary(data) => {
                 if self.offset < data.len() {
-                    let byte = data[self.offset] as u16;
+                    let byte = data[self.offset].into();
                     self.offset += 1;
                     Some((byte, 8))
                 } else {
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 0486a32ed314..591e4ca9bc54 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -25,7 +25,7 @@
 )]
 
 #[allow(dead_code)]
-#[allow(clippy::ptr_as_ptr)]
+#[allow(clippy::cast_lossless, clippy::ptr_as_ptr)]
 #[allow(clippy::undocumented_unsafe_blocks)]
 mod bindings_raw {
     // Manual definition for blocklisted types.
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index a59469c785e3..abc58b4d1bf4 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -142,7 +142,7 @@ pub fn is_autoneg_enabled(&self) -> bool {
         // SAFETY: The struct invariant ensures that we may access
         // this field without additional synchronization.
         let bit_field = unsafe { &(*self.0.get())._bitfield_1 };
-        bit_field.get(13, 1) == bindings::AUTONEG_ENABLE as u64
+        bit_field.get(13, 1) == bindings::AUTONEG_ENABLE.into()
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

-- 
2.48.1

