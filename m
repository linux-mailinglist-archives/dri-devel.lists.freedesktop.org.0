Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867A6AD5190
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 12:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C821810E60E;
	Wed, 11 Jun 2025 10:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TllVIq8g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3D710E611
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 10:23:48 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4a5840ec53dso77507701cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 03:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749637427; x=1750242227; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Q9qhOcOtFQhfffMpoMualzwb4BvJ35IoO/XhbMyL5dA=;
 b=TllVIq8gloD4ImI/67hVipToxPyFR4lJsdXdTk7IEZRsU1CAYzqYZazQyi0eOOcuc1
 3Fe3kSD9NBnOjm8yADWrfcuLpR6gP8qPcaADE0yQy3z5ZwK2HeDTX+E8vDTfp/clnHo3
 exvTamMByCYrYVoPhLxucTH5wSRnbXqLWgaWjwRF7ang+IINj9pHuVJrABZBPXjj2Jmn
 3/ecjIs+W7d5Cxq10k/vOlNctJaQ3rKtcexv+CzBYzdfczwyUieOX65u19behr80AN7b
 oylIn0q9otlkR8DEfQqD1EDRjGfpKiI6BkY97EP6rExjuBzWQxEtiWAndPYgDg2stu07
 7ELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749637427; x=1750242227;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q9qhOcOtFQhfffMpoMualzwb4BvJ35IoO/XhbMyL5dA=;
 b=wLP2N5/rz8meaA7hnhBuHtU0UqDaGvu6Aph6n/xrFEtNTH8/nr8nLVrDaJ6IM82VLZ
 QlrgYBCTNVjZqqWnlzYKea98acP/jOp69ixMSUfc7u+XBFIbW6R76M6tk1x06ou1Jba8
 q4eZ6G1m60pfpEPBSgibmErRYA1w7BQlW2ENb2aX0MUbjzzwonmJq6LOn3Qx5UxAC49q
 nF6sicfizGWA56NC5z88LChtzdiF8x9aUzB2GaRfnuh8T/+NT5lHKvjn3zhufQguGWzL
 NinCBBbvYkMgkZ9W7HhOkmJxmFWFWjn2feu4XwttJyoM92WxzCRE7q5FRrz7hsLLg/+I
 xj8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKi5xG6flJhU37sBKw7qfjOFrE8lB7+4UZaFOlYqz1/SDp0z457miAUnZdAu+idnHUiPs/BXOECyY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3utMf19ZQleKeoe4sjVNo86cCPQf1tdP3KeOakvyFCpeOq9wp
 RgQnZkp7Gx4+qIKs2Xm4aVpZfjT+6RzKTUzrJ6vxNvi8Bs3dAdbHJRpQ
X-Gm-Gg: ASbGncvuvb6TsliiSuuI+05YsY4hIqDdxfzH/m0NOxhWyr8LckMv1u2zMQFPu4tgHbE
 QVvbrXua/K8q+sX9x5UyPwXPsMvcJI+9Jr+nIE7bPZ5xtbyiicxl/etiebhTw/LToUmSA1CQ2zy
 6DjaRN1kmoQB9ej7DafNo9T3136LZubLmOMsgiIMglipeXmwN9Ikjsx4CAnJ/NrTsIkSXBRPWUk
 Pwj5yBKabKQoiZDVGxq889ySnNtjWTeG6YRXF+s0TjI7I+//p748VTvsnFiMSNei6p1v6KWzKmf
 FvdnI+h1O0XPN9YUlfo0WE6HzQDyALEmEh6GmmnyLhkcFd+8zWyC6j+Qb9XY/Q5PDLg=
X-Google-Smtp-Source: AGHT+IEE+UdMzaOchvhdv2iTiBaMPk9Je4GKo5cGJfflzkUjSPeeVlANuY0LrkSRHqmvIwKc1ILAag==
X-Received: by 2002:a05:622a:5c87:b0:4a1:3c6c:cda2 with SMTP id
 d75a77b69052e-4a713b9527fmr54652301cf.1.1749637427330; 
 Wed, 11 Jun 2025 03:23:47 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([204.93.149.208])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a61114ff18sm85664341cf.6.2025.06.11.03.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 03:23:46 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 11 Jun 2025 06:23:29 -0400
Subject: [PATCH v11 5/6] rust: enable `clippy::cast_lossless` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-ptr-as-ptr-v11-5-ce5b41c6e9c6@gmail.com>
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
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile                        | 1 +
 drivers/gpu/drm/drm_panic_qr.rs | 4 ++--
 rust/bindings/lib.rs            | 1 +
 rust/kernel/net/phy.rs          | 4 ++--
 rust/uapi/lib.rs                | 1 +
 5 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 0ba22c361de8..29cf39be14de 100644
--- a/Makefile
+++ b/Makefile
@@ -481,6 +481,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wclippy::all \
 			    -Wclippy::as_ptr_cast_mut \
 			    -Wclippy::as_underscore \
+			    -Wclippy::cast_lossless \
 			    -Wclippy::ignored_unit_patterns \
 			    -Wclippy::mut_mut \
 			    -Wclippy::needless_bitwise_bool \
diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index dd55b1cb764d..6b59d19ab631 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -404,7 +404,7 @@ fn pop3(&mut self) -> Option<(u16, usize)> {
             let mut out = 0;
             let mut exp = 1;
             for i in 0..poplen {
-                out += self.decimals[self.len + i] as u16 * exp;
+                out += u16::from(self.decimals[self.len + i]) * exp;
                 exp *= 10;
             }
             Some((out, NUM_CHARS_BITS[poplen]))
@@ -425,7 +425,7 @@ fn next(&mut self) -> Option<Self::Item> {
         match self.segment {
             Segment::Binary(data) => {
                 if self.offset < data.len() {
-                    let byte = data[self.offset] as u16;
+                    let byte = u16::from(data[self.offset]);
                     self.offset += 1;
                     Some((byte, 8))
                 } else {
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 81b6c7aa4916..7631c9f6708d 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -25,6 +25,7 @@
 )]
 
 #[allow(dead_code)]
+#[allow(clippy::cast_lossless)]
 #[allow(clippy::ptr_as_ptr)]
 #[allow(clippy::undocumented_unsafe_blocks)]
 #[cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_transmutes))]
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 32ea43ece646..65ac4d59ad77 100644
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
@@ -427,7 +427,7 @@ impl<T: Driver> Adapter<T> {
         // where we hold `phy_device->lock`, so the accessors on
         // `Device` are okay to call.
         let dev = unsafe { Device::from_raw(phydev) };
-        T::match_phy_device(dev) as i32
+        T::match_phy_device(dev).into()
     }
 
     /// # Safety
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index e79a1f49f055..08e68ebef606 100644
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

