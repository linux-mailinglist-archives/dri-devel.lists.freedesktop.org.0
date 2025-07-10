Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE0CB006BB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D2810E906;
	Thu, 10 Jul 2025 15:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ky3js8yS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA8810E905;
 Thu, 10 Jul 2025 15:31:45 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3ddb4a7ac19so4598635ab.3; 
 Thu, 10 Jul 2025 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161504; x=1752766304; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Pk9yBfYr9s3i/fDmLyzx3AytEEzdMrcwMBN15yX6MyM=;
 b=Ky3js8yShVkYa9T8UkixAzCsLHcs5jBJa0OteD7bagpRzNo7kzNvJ56988B7vZ/WLN
 DkP7jERMKoK64Q1YWlV7t3zXOoPBnsZZjyY9SUJDVbNM3t9pmHmrXCE9UECUgZiCpim4
 du5YXiDGhWKdSozVLxuSy9QqrpwfCSYSTrWulO92ExtCDHzETMMgJObUYDYmjxun4ufu
 r+u/UPhm79LaeZdoFvJ+QILqZ6oyme2GN1MUqeT8RxWHXQL/P7bAMTXk9k6L78+lQtHH
 oZNGVLa+ZIOBdRw2R3BMVIJmXKi6ZRtpwbc21qi97n2GE0U7K3g26C6m5NnphRPy8Ago
 xTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161504; x=1752766304;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pk9yBfYr9s3i/fDmLyzx3AytEEzdMrcwMBN15yX6MyM=;
 b=YUpUTyDNa+Ee436bmwLFOMKWmtZAKlKAi8QKJxY98yutOg4WqbSsFIRUKkSHA1UutN
 wqQvdkCOx1ys3HlLBJb9ecYVTZSIQppqMJqEmXcfos+M0kivdjReKrbCEgJleRdvkOMq
 l3OLk5zTIlEB3d5eXCvY8wARAB6pM1BdEEmwdonkmlH8jwxDUhGktT7IHsLW2qm9zNrx
 w3siiOd4bwau1ZY1Vjq9vV/l1UxsHSVd57v3Fd+SHIBn3pJrtz14JEPdkKvdJtYS1h1J
 m02jdYTB8LebNTm+Je9VDUTeW9G8grqt6RQVlgYdVpbLsyDVDK+JB1QF6kwTJTuAwZJ3
 BLIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXYjFfAkEgEzlHJBZUVhPz3kEQk87AAtcm+eNrNwNUQIOxEo2sNoxGOP4vG7T76jzS6KWFnpl45A==@lists.freedesktop.org,
 AJvYcCUeKv8qCoR4Nu38TVr8Rwe+El9tJBH+EcS10vCfoAhcf1u9k647otOqY4BmTeKsUHOhaUR5WyrVHBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEba81pMj9bgNDdV1Kvxj02HZtG2A0MLjJAJ5LdPXOMuJnE9lX
 JmlWGWVRB3QU29rgJ0WtLAqTPiSV0EuWBkzZWN6PGFkfbMEGGwax/MSf
X-Gm-Gg: ASbGnctLv6m08dSrzAYbQiHCoq2l1RtgzmdB2ABietDu6UTTlrIM3I8MGZfZQUmIC6+
 vuEcHu0G5HQSDJC79DPuB2DuHfzvJFLiA0e2yUQ5qvITceFu2hsK4DWgUkzOij7LVfi0jtsKxHD
 amHgHFSScTN+6UeU8T+CD/49MIB4y80gz4Tf7OQtYGT4hafNAgATSwBsxvhCU9oLZ1LqwURM2/q
 Oxjzswd/KKdErextjYFNxvEENnfiLOajV8JfxmL8xDW+Ya6hHQcVHRKTprBDctG0DxHJ5q+C0qE
 aByPKmM+S3BpdUG1Yxa3NJYotXPhN1Lsx6gbCYQ07LsN/4KmzlO1pPILU32NYWT6i3YW6CnxPjp
 z+5OhOtmGvu7ocmlQF8QICppCkwfmjHffLkdYeonZT8lLBy09jXGYFTKcPg==
X-Google-Smtp-Source: AGHT+IGD6IulrTtq7XJJHp+fBg0G4KoR4rFCaX6uY+nRZVwSVNUZXwzRxJL6DK9cdBhYXCisVCq1Wg==
X-Received: by 2002:a05:6e02:2703:b0:3dd:f338:6361 with SMTP id
 e9e14a558f8ab-3e243fad673mr39944225ab.6.1752161504011; 
 Thu, 10 Jul 2025 08:31:44 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:31:43 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 11:31:08 -0400
Subject: [PATCH 05/17] rust: configfs: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-core-cstr-cstrings-v1-5-027420ea799e@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161489; l=2514;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=af7hQUrBJ3daMKChg+zbV28e67c6tFE/LW/j16AENwg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNZwSCTvhx189kCCr7+aSgexpeSI6tU5D5MB3shP5Z3q8AlIw1OPYf9wRw5vEVrf3gxS0l1TJdN
 IQXvUr3fPrQ8=
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
 rust/kernel/configfs.rs       | 5 ++---
 samples/rust/rust_configfs.rs | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index d4797c41ba77..9e7308e4d4ce 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -21,7 +21,6 @@
 //!
 //! ```ignore
 //! use kernel::alloc::flags;
-//! use kernel::c_str;
 //! use kernel::configfs_attrs;
 //! use kernel::configfs;
 //! use kernel::new_mutex;
@@ -50,7 +49,7 @@
 //!
 //!         try_pin_init!(Self {
 //!             config <- configfs::Subsystem::new(
-//!                 c_str!("rust_configfs"), item_type, Configuration::new()
+//!                 c"rust_configfs", item_type, Configuration::new()
 //!             ),
 //!         })
 //!     }
@@ -66,7 +65,7 @@
 //! impl Configuration {
 //!     fn new() -> impl PinInit<Self, Error> {
 //!         try_pin_init!(Self {
-//!             message: c_str!("Hello World\n"),
+//!             message: c"Hello World\n",
 //!             bar <- new_mutex!((KBox::new([0; PAGE_SIZE], flags::GFP_KERNEL)?, 0)),
 //!         })
 //!     }
diff --git a/samples/rust/rust_configfs.rs b/samples/rust/rust_configfs.rs
index 5005453f874d..ea84c23b784b 100644
--- a/samples/rust/rust_configfs.rs
+++ b/samples/rust/rust_configfs.rs
@@ -3,7 +3,6 @@
 //! Rust configfs sample.
 
 use kernel::alloc::flags;
-use kernel::c_str;
 use kernel::configfs;
 use kernel::configfs_attrs;
 use kernel::new_mutex;
@@ -35,7 +34,7 @@ struct Configuration {
 impl Configuration {
     fn new() -> impl PinInit<Self, Error> {
         try_pin_init!(Self {
-            message: c_str!("Hello World\n"),
+            message: c"Hello World\n",
             bar <- new_mutex!((KBox::new([0; PAGE_SIZE], flags::GFP_KERNEL)?, 0)),
         })
     }
@@ -61,7 +60,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
 
         try_pin_init!(Self {
             config <- configfs::Subsystem::new(
-                c_str!("rust_configfs"), item_type, Configuration::new()
+                c"rust_configfs", item_type, Configuration::new()
             ),
         })
     }

-- 
2.50.0

