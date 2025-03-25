Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DA6A70B0C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 21:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BD310E5F8;
	Tue, 25 Mar 2025 20:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dnKfTLqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9B110E5F3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:08:00 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6e8f05acc13so71518036d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 13:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742933279; x=1743538079; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WhHHPw9VsIQ8nPVAfMnycs/8Jg6QWfo4aL2Y5h0BST0=;
 b=dnKfTLqU234+bLW8mWOCKvLxRfLGTvkd0rwPCl4XScmbkZxG3AL8s3zy25d5nKaU2M
 D0UjdV+pG3UfXsirNwgeSOGhomZjnzKDzP9cPu1bD5hRhfvLEeifLcrx4mj0EQ0VxXHY
 sUNpF3hPGSAETrGSuA7/zoLjj91im9hIW6wRpTZEKR63m72pAQHtRcTH2BrC2qbX8CnA
 4kSyVjzGGl5gEB1SgMgSJqAq0gldfY5Zf52Hkmf70V/fTdXDNXYsX9iddYKO1OLAqXKI
 HGszZR8L3AgP02IMeN8081ctNCyjlynv/2113HrcxHOFzeI5hICtPfw0gZExgUsAaydD
 /u+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742933279; x=1743538079;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WhHHPw9VsIQ8nPVAfMnycs/8Jg6QWfo4aL2Y5h0BST0=;
 b=wyGo+TWueMQXD7z1638g/v9Mi8yrGW5M8rrgU1hYYPuz3RYZVvd2ZbZkTKd+guJIw5
 UDWX4PKo1QKWp69vgMIDx/mbN/OKNF5WDZWZDAtrosTC2frpaUPb6WYsjniTusq7pUqB
 uArKmo5K/sf6NAWr04o8xOubxzpo102UXhtelq9lde1JyQWcsCarJpAtaE/v0qiQIoOD
 iSH1W+kHgfV49mARPofO/xPUIjzG/S5n/p2Sxsdr37yFueIRnCWVMRefLhphodO4iVFD
 IfhXd477WWM/ettJkAHWoVVexCjgYZdHc6HPASFPAlLv987a6kJg2wcPd0jYfu9b27Uf
 Re0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRcF+FE1NkzkmrYsM3Oe5h8+eGJuILpNIX4NmFrxQOtddSlX3MtfgQxdaRWzPERS6uG5G90WN2vHA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV9tg4lTRlONm2nLWzV/IwRZDPHOLXxeD8shWQscRGMkP700HK
 q5/wC9oqJ5bH8Oi8tccuz/v1D1aETjNzUsu2y1y3MZ1bCptoXN8GdjxO8SQvD7s=
X-Gm-Gg: ASbGncvc08a+a/ySr6trjeFykXOrZEmXqziRxh+1DeeWw2bb4OF+yl2laQ7TfHxXD/j
 m/wGld6JpxvxPi/MA9Sud4xl62a44vVERRhxd3xS6F0HZ3JeYpTYnK5bER/oClnFnHb+tNVb3Ce
 cXT4dEKWFeuHtnc6UD2un18Nect7LpaaqgON7x2r0E0wH3rB6HHL+fmMMYTk6SdW0J6pdAFCMTh
 t4ktJp2MhvttMz7D0Z4TuT6bIR7uuPrVQaXsFAiNQGbWD+AaHcjbdipmRSoFpqQeb4M/5lxVPDW
 IyU1ajr7UZ+M6G0fwKtsSBYolpe+QjFwVgifq40MGdiU0mYzsr37mZCph6y1XUSAROlpXb2kZBI
 g9MzGAzConK4IZDIvwkAXdVumFUiudc6FyS4e+ggTZ4kYn0N0xO/Euw==
X-Google-Smtp-Source: AGHT+IGoTw6FuUYAgruyLB+0D5U26hD/STaRmc6f8lnI3rPnEGb1tHRnHvBUkYzvVURFj5tZDHV9gg==
X-Received: by 2002:a05:6214:194b:b0:6e8:f133:3795 with SMTP id
 6a1803df08f44-6eb3f34b5b6mr317424406d6.32.1742933278872; 
 Tue, 25 Mar 2025 13:07:58 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:38f6]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eb3ef31810sm59790316d6.64.2025.03.25.13.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 13:07:58 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 25 Mar 2025 16:07:46 -0400
Subject: [PATCH v7 6/7] rust: enable `clippy::cast_lossless` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-ptr-as-ptr-v7-6-87ab452147b9@gmail.com>
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
 Makefile                        |  1 +
 drivers/gpu/drm/drm_panic_qr.rs | 10 +++++-----
 rust/bindings/lib.rs            |  1 +
 rust/kernel/net/phy.rs          |  4 ++--
 rust/uapi/lib.rs                |  1 +
 5 files changed, 10 insertions(+), 7 deletions(-)

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

