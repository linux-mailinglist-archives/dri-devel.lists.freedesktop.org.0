Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD05B9FB57
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D244C10E945;
	Thu, 25 Sep 2025 13:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FGBmR7ED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379DF10E947
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 13:56:02 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-796d68804a0so10070956d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 06:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758808561; x=1759413361; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Su5ueCqg2TI764Opf/rKiovLX30DsPsrljKG6JdjfP0=;
 b=FGBmR7EDgbz8TmM9AA1mnKcXdl7ls2yLuJ3kALMjR9PGwnVFq7WOQ/pQWCPXajMQdu
 5X4CF3cwE++CkuT9pR206obSSSylKIDU8rUY3FgoYjGOYOqmfadLQCcnrXNbUs/kqEm7
 WrvmWE38WP82NmBBsba/m1xqejdAgYC/gw8I9M8NYHziR7RuHWOFWLYY2znPQH49/REK
 SDDkLi249+OOSGd4Te4yhBT31t5YkksOvENI7OcPZ9/adjCs5AraUNXSwxqrgYiN1Lex
 Y9EafwUPnG1OssAhYL468Zc+XqJ9BH1uy185HP6Mku20j49ilFECh/DhSQFU9mSC5QOr
 RFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808561; x=1759413361;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Su5ueCqg2TI764Opf/rKiovLX30DsPsrljKG6JdjfP0=;
 b=KgpXkHOFZBj2nnE2UVdIpHvifq367ZH0SqQNqq4TSzBHSvY/qabMuCjgG10q0bv228
 sBbGf4ZlVQyTt6whlaq3KhMZaXXnYeACwn3CNnZRFuzVj3YCoY//7gSYHjbvddFtMqcQ
 N3OFOsE0oK8jziRZSQOIB4pSKOidyBYzQfnvlwEBJFB8HClF4Y9fAOCAK+GyR/WRn9oH
 A/DHpoOIeOkIzYP/Cb17c9ZzzGcztZhGIhW7co4lV2YePBBI1+z41+Y0IiEg9YsJCkr8
 rqzg+nlsi7LK6ivLa4wZSgZ0EtqtqjhPRULMR273l0mwhuQ7d3EMR7yIYLZ32Wp2N4r9
 alRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXra7mV40NdcB0VEC/qDLVMKqix7ogsciBMyiM4e9GjTCVRNXzr3iSSwkF6Efhs3RCt8fkuHANkEko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSi5IbDw2KzjUAHXJmxdUt2pzyTb3qDdHqHQzgKZJb6p2xUmnC
 pBEZLzhjqwIKneZI5cgiTkPfaunG6+Xv9VEbX1jy7XpE/+qmBDysiDyu
X-Gm-Gg: ASbGnctbaUZxBdqHbKFl5mW2y23qp7IJ+tiQT6Q7STy2TRnuN9FdxHPygBZ1GUpUtqd
 JGx8ZQy5aVMdz6yhsVyXAdLd44O4tSYjD8fkz1P6rhaFtUOQ8zkASvL/1WmOEey9fxZVxzVHHZG
 AU5yhmF8CrC/y6ft5KpN2mU+4eQvuowt91bkRSPEwa62Mk7e0pDRxRIp6bUbNsbgl/JOvnpqgFU
 nPH7+uVdZ9LqaXvjEKxZoPH0PXh9W0MqjVPDggUsj5iPBXa4Zs8CbjK/khPyFUxKhDsymDpnDwg
 X7zDpw5rz1KkFC+FOL59HzF7Oin4yiuFi4CaI/HelJjl3QxX2rYORITSUMauTBrnG3l/c4XOVq6
 R/ptC1SFfWRyK8ynXlskFofk7a7iDwtLlN10XWemp8T8Eak7Iy28SWbdRLr3iC0ydhcLtMneKL8
 fWVmjXdaWuMVKymN6LBq+CeTSQtceKsvCnNZuDF2Q6LC2LtG+NStEA2w8qRRzUAKDCR3fy
X-Google-Smtp-Source: AGHT+IEKGM1hlb41qJ9YisDvGGBXEq7SIWXMU0HV+6pPjw6gZQj4cUtrGlxKA4Eejw5JCAnnmfC1hg==
X-Received: by 2002:a05:6214:2aaa:b0:7ef:4bbc:7767 with SMTP id
 6a1803df08f44-7fc400b2947mr55121666d6.52.1758808560892; 
 Thu, 25 Sep 2025 06:56:00 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 06:56:00 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:54:05 -0400
Subject: [PATCH v2 17/19] rust: sync: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-17-78e0aaace1cd@gmail.com>
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
In-Reply-To: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
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
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808438; l=3839;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=VECNpd/2fGBh3QJ0YU9rU/w8zx6qBuVEWTaPGNBZjLs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFx8Jxi6AjT1YSsescfenvnVsKv/V+CsWmgyG9TWGf4peefBqx8sfDGAJ3fkDpsXNUJgJQ5G9qv
 456V5li7HsQM=
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
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/block/rnull.rs         | 2 +-
 rust/kernel/sync.rs            | 5 ++---
 rust/kernel/sync/completion.rs | 2 +-
 rust/kernel/workqueue.rs       | 8 ++++----
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/block/rnull.rs b/drivers/block/rnull.rs
index 6366da12c5a5..9aa79b862b63 100644
--- a/drivers/block/rnull.rs
+++ b/drivers/block/rnull.rs
@@ -55,7 +55,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
         })();
 
         try_pin_init!(Self {
-            _disk <- new_mutex!(disk?, "nullb:disk"),
+            _disk <- new_mutex!(disk?, c"nullb:disk"),
         })
     }
 }
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 00f9b558a3ad..672411058a92 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -44,7 +44,6 @@ impl LockClassKey {
     ///
     /// # Examples
     /// ```
-    /// # use kernel::c_str;
     /// # use kernel::alloc::KBox;
     /// # use kernel::types::ForeignOwnable;
     /// # use kernel::sync::{LockClassKey, SpinLock};
@@ -56,7 +55,7 @@ impl LockClassKey {
     /// {
     ///     stack_pin_init!(let num: SpinLock<u32> = SpinLock::new(
     ///         0,
-    ///         c_str!("my_spinlock"),
+    ///         c"my_spinlock",
     ///         // SAFETY: `key_ptr` is returned by the above `into_foreign()`, whose
     ///         // `from_foreign()` has not yet been called.
     ///         unsafe { <Pin<KBox<LockClassKey>> as ForeignOwnable>::borrow(key_ptr) }
@@ -115,6 +114,6 @@ macro_rules! optional_name {
         $crate::c_str!(::core::concat!(::core::file!(), ":", ::core::line!()))
     };
     ($name:literal) => {
-        $crate::c_str!($name)
+        $name
     };
 }
diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
index c50012a940a3..97d39c248793 100644
--- a/rust/kernel/sync/completion.rs
+++ b/rust/kernel/sync/completion.rs
@@ -34,7 +34,7 @@
 /// impl MyTask {
 ///     fn new() -> Result<Arc<Self>> {
 ///         let this = Arc::pin_init(pin_init!(MyTask {
-///             work <- new_work!("MyTask::work"),
+///             work <- new_work!(c"MyTask::work"),
 ///             done <- Completion::new(),
 ///         }), GFP_KERNEL)?;
 ///
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index b9343d5bc00f..261b827235ae 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -51,7 +51,7 @@
 //!     fn new(value: i32) -> Result<Arc<Self>> {
 //!         Arc::pin_init(pin_init!(MyStruct {
 //!             value,
-//!             work <- new_work!("MyStruct::work"),
+//!             work <- new_work!(c"MyStruct::work"),
 //!         }), GFP_KERNEL)
 //!     }
 //! }
@@ -98,8 +98,8 @@
 //!         Arc::pin_init(pin_init!(MyStruct {
 //!             value_1,
 //!             value_2,
-//!             work_1 <- new_work!("MyStruct::work_1"),
-//!             work_2 <- new_work!("MyStruct::work_2"),
+//!             work_1 <- new_work!(c"MyStruct::work_1"),
+//!             work_2 <- new_work!(c"MyStruct::work_2"),
 //!         }), GFP_KERNEL)
 //!     }
 //! }
@@ -337,7 +337,7 @@ pub fn try_spawn<T: 'static + Send + FnOnce()>(
         func: T,
     ) -> Result<(), AllocError> {
         let init = pin_init!(ClosureWork {
-            work <- new_work!("Queue::try_spawn"),
+            work <- new_work!(c"Queue::try_spawn"),
             func: Some(func),
         });
 

-- 
2.51.0

