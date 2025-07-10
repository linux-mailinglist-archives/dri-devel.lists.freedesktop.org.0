Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9331EB006C7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFE610E90D;
	Thu, 10 Jul 2025 15:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E6XJK8mw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864CB10E90A;
 Thu, 10 Jul 2025 15:31:59 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7d0976776dcso126389885a.2; 
 Thu, 10 Jul 2025 08:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161518; x=1752766318; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VogKYzaF/TPYy0XdUUSO/DnQeAdUNW05tROf4gMJ6DE=;
 b=E6XJK8mwYtiiGMsSyB3jEID5qBd0PLtoaYEMpJKi3y8zY7OHVy1aFkmU1aNb6PYGd3
 uImTDLbqtz51rjsH02L1+hSU1SvtCUsXSGcMpA7q+h4ITxRf89mK5al1P7LR4ddYCUzC
 LY1q6jBXh9Lxc9eSaTvd7x5OmoPSdrvIohMblwkuTt49qSQ6SpPoUwI7XwfqJKY8/vHB
 /e+PA3tZu+AHs7R71GkF11uf4zrMZxgWb5NzZ6t7iB0kYLxtoAu07HNcsQIYCbN5GmzR
 XNIofAeo0+zCqwpjs7Oc1w/Qaww/gHI7mesTwVYrTB2iwTcLARaMbfVqaMRzMAEeRAn+
 Qa9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161518; x=1752766318;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VogKYzaF/TPYy0XdUUSO/DnQeAdUNW05tROf4gMJ6DE=;
 b=t+0JtJnQHEB/DRNRBog1B1E7BGbFcG3Njs6YZztM3SO2vV5xHTgSWBLI4YBzSor5+N
 IanqHBGpHUrAefULBOjx12XBvRFqAiSWfmpLvfzaxrujRfd6dL3+rbF38YEOw+XCJ3/k
 s6sN7t4L96G2IRfo7ACO5x9TxRfx9kpY0cSAoa1RxvrW5w5QROoWR38/oMUyxJqPxAhI
 HBRsFRO59R+J6HSfwLzVgSknpdTaUEbbWxlRlmWuPTeBh6t0GPjE4EPbg3HZzx5G9jtb
 mSnGD+2a7jtIPBsOIjM5AUqZPHcuNKUcVXbD4HEGB0flv6JCjx5Nl224MrGT+8Q3YgUs
 Zhhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+ysVkZBgA3RdrzU7xFNRQWm/eVftjesyBHQdzC2R7cmjIBnlv3ugwx58X/jt/gnZZftkKXkdOdQ==@lists.freedesktop.org,
 AJvYcCW/i4MXv1519SxqI1s1lYb5xgq/ujl004DZigX0eB75K6xGcuPoJ0ZeTYJ7Xpdzls5cL9Jfwm8evcQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzvcsz76lA1UJ6KoIwjxKGZ0A4xCn9d4IjdtzgsrD3ju8qsMvYJ
 oLUy9ZrICn4DuWu6UYsx2dhOb7HBwMZ8ihPug48cy/GlzjX358kHDqAB
X-Gm-Gg: ASbGncv49+UwFsbgMe82/B+maKmb45VUQnCYRqaK/6oRvXoQpuYBpiD1A27kHxPFChN
 +i1NiLzYkvLRYx5FWaB8RVZIyM+TqQBaZtx7UUvaxutavkZ1PdNDdkcB4YUa2K9I31Wzbu2Wbos
 Kawf7RdcALphiiQUX0h+ILXMhhbmne48xxs6PKqmF9FwRrxJi/ZfqeFfdxUhLWeBsx2zy24oOFN
 MB17m4P05r3WxNYKCe2PIiO/s4eRmHN2CMO+Rdhvux5rw0LyNqBiQDRFCCvwLGC+Mxv0YUXyHrD
 DH9Xw9hEEkRxI8AeDPddFvmxyJy4JnYeriJ/OhqVxNayuBEhEKCJ3PalZk/d8vo6ZabHNXIBBjB
 9HG+cBVCkRm90nZ/9GwlE1u6/xKXIH/vJ5gueJnmNH2HNesXkCOQ5NZa6oA==
X-Google-Smtp-Source: AGHT+IG2Rkfi8OgB6SO217W8qmSZiHD1v3NtIITwS70q5UwQAur6eRtXERJ8W6PVRjTxYB6Q3LpV6g==
X-Received: by 2002:a05:620a:458c:b0:7d5:c8bc:fa72 with SMTP id
 af79cd13be357-7dccbf44f7amr446032685a.28.1752161518435; 
 Thu, 10 Jul 2025 08:31:58 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:31:58 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 11:31:15 -0400
Subject: [PATCH 12/17] rust: net: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-core-cstr-cstrings-v1-12-027420ea799e@gmail.com>
References: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
In-Reply-To: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Jens Axboe <axboe@kernel.dk>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161490; l=1665;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=7TrWBDFWFk9XPUm28ZWCh8FAmf3iX04XjynnFQqD4OU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFXzGSK5HRWWRQmhbpkjsw0M+w2zZ3jjGVMgci5eUPPMKCslqQirC8ELfLlHiYCioE2kdDwvYv7
 NilN9Earm3gU=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
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

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/net/phy.rs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index c420e5ecab4b..236ea516a134 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -781,7 +781,6 @@ const fn as_int(&self) -> u32 {
 ///
 /// ```
 /// # mod module_phy_driver_sample {
-/// use kernel::c_str;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
@@ -800,7 +799,7 @@ const fn as_int(&self) -> u32 {
 ///
 /// #[vtable]
 /// impl phy::Driver for PhySample {
-///     const NAME: &'static CStr = c_str!("PhySample");
+///     const NAME: &'static CStr = c"PhySample";
 ///     const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x00000001);
 /// }
 /// # }
@@ -809,7 +808,6 @@ const fn as_int(&self) -> u32 {
 /// This expands to the following code:
 ///
 /// ```ignore
-/// use kernel::c_str;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
@@ -829,7 +827,7 @@ const fn as_int(&self) -> u32 {
 ///
 /// #[vtable]
 /// impl phy::Driver for PhySample {
-///     const NAME: &'static CStr = c_str!("PhySample");
+///     const NAME: &'static CStr = c"PhySample";
 ///     const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x00000001);
 /// }
 ///

-- 
2.50.0

