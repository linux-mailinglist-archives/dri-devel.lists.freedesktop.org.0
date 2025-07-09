Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB54AFF23E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 22:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6E510E83E;
	Wed,  9 Jul 2025 20:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NHDI+DBL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D9110E83E;
 Wed,  9 Jul 2025 20:00:12 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4a6f0bcdf45so3707091cf.0; 
 Wed, 09 Jul 2025 13:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091211; x=1752696011; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tDFRnPeUzhs4/PEdwk7+RvokosNdr/JcVURCFBZ4l74=;
 b=NHDI+DBLGHx1/E9oVrXG+612THsmuBoX0vi/ZY/2uwiXKnKvqoOl85yftDcPVE3T+u
 v5hc78pxunXfDILfpj49ZpLYVmm7DU/BT6ZXY8gRZqJhK2jhGuDSr2nSYduRv0EMMDUJ
 6kNwR8XGKk/TZT1b9gQP0mSUuo4hl9a1ZOp826dNlS9TA2XskNozSMtZEMawo6IB+EtV
 i2mDqt02oILqkb3E6cSdzZHjYIJmOO/5Y2g+YSA/ZAVut9Ev+OmdG3a6AOZrPdDkBXI9
 ssgXikfKP996Yt0LAMDymVXY+4YM3FOX50+nGDkrHirLZWtXtoxt3+zETBibTzaewXsa
 WvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091211; x=1752696011;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tDFRnPeUzhs4/PEdwk7+RvokosNdr/JcVURCFBZ4l74=;
 b=kY4J+w3Q8L31ERSDbU7F6c3zTxv6RKwW5Gw1ZSQBPwyfpT20DqNIKGtPIAEh9aNawZ
 ZqG+SKDB+XzX3YjbUi6vjJ8C69dW8k8B5iglCnJ3aeuPvavuEnz7VG2ELw57fMouphre
 4/0uz6trhmT6NYKEUYKMo2Hu4iZX8cgW/fA3KJkVosL/ZeXyjef8Jll05LfcXV5aasBk
 nQsROjml2lEl206yrylO3KSckPLDqqjWuewJv2oga4JH96Gs9jdIwKWzTzGLR8nKjbcP
 UMNVni6PTaKh9mKaCfXzNleM5WeKemx0NPyIIuJAuyD4A96SCSAUL/lih7u70FmZ8a2m
 Zf8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+6x1tvYY6aJAy4CYy9NwfXy98C9wL8Ig/2NglgFRU6Tb/L/J3tSDodIfLmyBJpXCwivS6KkANgNc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKCAJBlGCmdywNWwfk1K1ViDsinMWKTUhOkk3o1DMtyPrNWATE
 zMLxFWCB5sOMWIBTNNxwr6+Ixq7j0n4ODUX9ozd4Qg1UGf1F7BJn+/K3At/Dk/I4BgwG4g==
X-Gm-Gg: ASbGncvqkm6Ua1jSfH/B0ryQBoosfLE7fy972srzvN/weMbw78O22tWN1UojtW2xxyJ
 w0s69nXCm5yxpvJDtm02SJvRxLYkP5Qls5oDpzbKNaFPRHBqhcp2z2fgShyYhVxX1NeM1DeF2yQ
 Qtj9N8+Z6IcdNtd4Ur9vZ1imMwHDRtlz5Dto5CQYU1ulSaVtRLZFgibg2FejkyFl/Ai6yMWkGYu
 DqIlpwN3g/Ue5W7oJz4WwCq+vHA/D2nscBxaxE5Ijl3MfNp8TfPhgHRQR/Eo0n5Lkwt4BPOm9KS
 kWXt4hthyJjllCI4tvGeM7nDyI19kj6NkRPm6eNkkDC2VJN7Na+aVq2Vvxcpn/OwmYMREfLXH6u
 BlbwG+DRQ5US2LuYGEgvqRyWxmabvchBNQFuhF7gOKP+tvGYCUFJfo7LR7A==
X-Google-Smtp-Source: AGHT+IEV6Rr16PRiwu3F1M2RaV4vh1L7T1b438g7CdovMwJxpF1Aa+qhWAUTQ0cv9RCM1Yx5la3GsA==
X-Received: by 2002:a05:622a:4c14:b0:4a4:3c3e:5754 with SMTP id
 d75a77b69052e-4a9e93de7b1mr20714551cf.32.1752091210920; 
 Wed, 09 Jul 2025 13:00:10 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e4aaasm100432891cf.3.2025.07.09.13.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 13:00:10 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 16:00:02 -0400
Subject: [PATCH 3/9] rust: block: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-3-64308e7203fc@gmail.com>
References: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
In-Reply-To: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Jens Axboe <axboe@kernel.dk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091204; l=2816;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=9xXXRD/lyfY7gXMurVbMC3UhE6y1ksuC3Zml49oUENo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QI10u++JHbxVt0b/U9QTw+AgNRfy7j5OE9AiY1OYHAJi16zIiYSv2aE7ZTqvhjldKfBXZ5FbGeV
 TsnZVhVEVzAc=
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

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Custom.20formatting/with/516476467
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/block/rnull.rs             | 2 +-
 rust/kernel/block/mq.rs            | 2 +-
 rust/kernel/block/mq/gen_disk.rs   | 2 +-
 rust/kernel/block/mq/raw_writer.rs | 3 +--
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/block/rnull.rs b/drivers/block/rnull.rs
index d07e76ae2c13..6366da12c5a5 100644
--- a/drivers/block/rnull.rs
+++ b/drivers/block/rnull.rs
@@ -51,7 +51,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
                 .logical_block_size(4096)?
                 .physical_block_size(4096)?
                 .rotational(false)
-                .build(format_args!("rnullb{}", 0), tagset)
+                .build(fmt!("rnullb{}", 0), tagset)
         })();
 
         try_pin_init!(Self {
diff --git a/rust/kernel/block/mq.rs b/rust/kernel/block/mq.rs
index 831445d37181..61ea35bba7d5 100644
--- a/rust/kernel/block/mq.rs
+++ b/rust/kernel/block/mq.rs
@@ -82,7 +82,7 @@
 //!     Arc::pin_init(TagSet::new(1, 256, 1), flags::GFP_KERNEL)?;
 //! let mut disk = gen_disk::GenDiskBuilder::new()
 //!     .capacity_sectors(4096)
-//!     .build(format_args!("myblk"), tagset)?;
+//!     .build(fmt!("myblk"), tagset)?;
 //!
 //! # Ok::<(), kernel::error::Error>(())
 //! ```
diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index cd54cd64ea88..494c95623b97 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -6,9 +6,9 @@
 //! C header: [`include/linux/blk_mq.h`](srctree/include/linux/blk_mq.h)
 
 use crate::block::mq::{raw_writer::RawWriter, Operations, TagSet};
+use crate::fmt::{self, Write};
 use crate::{bindings, error::from_err_ptr, error::Result, sync::Arc};
 use crate::{error, static_lock_class};
-use core::fmt::{self, Write};
 
 /// A builder for [`GenDisk`].
 ///
diff --git a/rust/kernel/block/mq/raw_writer.rs b/rust/kernel/block/mq/raw_writer.rs
index 7e2159e4f6a6..d311e24e2595 100644
--- a/rust/kernel/block/mq/raw_writer.rs
+++ b/rust/kernel/block/mq/raw_writer.rs
@@ -1,8 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use core::fmt::{self, Write};
-
 use crate::error::Result;
+use crate::fmt::{self, Write};
 use crate::prelude::EINVAL;
 
 /// A mutable reference to a byte buffer where a string can be written into.

-- 
2.50.0

