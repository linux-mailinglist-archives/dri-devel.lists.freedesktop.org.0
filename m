Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64FCB0B246
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C5E10E359;
	Sat, 19 Jul 2025 22:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QRtWOHrb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751F710E0FC;
 Sat, 19 Jul 2025 22:42:13 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7e1f3b95449so411533285a.1; 
 Sat, 19 Jul 2025 15:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964932; x=1753569732; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Aw7v9AoXajCiA3y3c/HUxv7RbEkPrpCQfUUsk1ERQPc=;
 b=QRtWOHrbcE+oZ2talVbHMcrY0dBoF8KfAWpIRyFvTLVwXkNRTJBwGKFDuPGmW5f9GR
 mXgzP8lKOAXLiEXLDHfl5kI5SzX+84BqFeAdInXVjqsekJYbQ/GY3cAGLzjmwUqF409t
 xSSxkeTDp+Fq4NFKwBAB4Rdfyq/taBeOW7awatPG+/93z6sRx8qyV3+AAJ6Zx0Q0p37O
 nxaqyE7x7e3Yq0s2vI4FzfmQ9iNKAY1K3k9Usjv8IRzmISh7DzRI8C9yrsGwKsqpGfWu
 JTlbEXNnFTlN3jiWOxMV3Bk1vJytPkg2xC7fZkATCDfG/1cFZt+RwqgfyRhjf/zJDf4m
 APUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964932; x=1753569732;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aw7v9AoXajCiA3y3c/HUxv7RbEkPrpCQfUUsk1ERQPc=;
 b=CNvRe+kbp3ghUQj0zzFLlzFceNYz9W9yI7dmp/sR2JhS8TWnBb9ZaokRbmAgYknsn/
 +G1g5E7q/gUL6iGO8k7QzFM6deDra7Us6j68l7iVzMdoRK0M3paTR6fMRowwjokPWaWH
 JHgx6OBseQOIOtJLVmqTtGKRvcwPy3CnQsbgLyu/7sVb4c8JHiRWxlwbSqnbvKJMPPIY
 nQHzwtz7zOLk7+uNhTUOTPVjiGWCmfrArnUnd5d8hz+F/F9d34UlYjecnSvV5WY7XthO
 ZaAg6xuiO8+QnciJonah/CqwXDmznqtB2q+0eJkpWhtO2I0yHhm7gLDxg/ccH1ONbN4I
 nWwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcDUb/IbdUfpuuhPO8n5943w0TqsZth2yLxlH7gsQ4rvrA5a7pWgiPEqCqQitunzVeJDslqGt97rs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiwL/6LHG9ciXH3fCsw20Q9Ki8eeaByUUK1axCX1dcjUZD4uBS
 e4VpzsPwt0sBoLh31E+fOYIdyRLorWN3ADvhMkLGv0lxWzzgM1rCWxBq
X-Gm-Gg: ASbGnctMmuj/otKuRVudMk5jHetLOchyfLB1fbH/q96NswKFnro+8jYpHf9D1eXh2Y2
 +XVAAQAhz3wuIIwb6TRkcrhcoqZ49aNEjADEPa0XRkVnPR1iH6P4Qa8cp6F8e7RVptRaNh91jmr
 Vf6p/6uNiHyW7gU0ehleLXkkp+vIB3oEdASF1i3BMVbBdN7RtK3LWYOKRasQe1V2eIaADYkVR34
 qTuV7Zhwb3u/DL2teLCXpJt8DXZVd9zpHftyW0cUTF0H5saX/I+3U0xTJvR8OGQ0RcGHKsdjzX8
 8tODa0ZVY5iJKDbJlhXHHUPRGlL/L1FdUT4+Ow/Jdeyje8OoG4v+vJO20/62J1oJdWF0lRBvymW
 AT7J/Uuvs2Zv6ZuJKFu+feoESPKIHaKzP0yvdM+akyKjt9hsaQmk/YCtZmRNB63l228TXr/10Gg
 lDkvBIXH+0hmq/ijm5JDSH12MZVb0F
X-Google-Smtp-Source: AGHT+IHTev6teKqBxr3yVPaGIfkg92j5uUM5edVfrIYIKgPuAl81m1vfH5UUeD5NEDYnMWK+yKJIxw==
X-Received: by 2002:a05:620a:1a25:b0:7e3:3682:6dee with SMTP id
 af79cd13be357-7e34d1094b5mr1835427185a.4.1752964932457; 
 Sat, 19 Jul 2025 15:42:12 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e356c75cf5sm251550785a.84.2025.07.19.15.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:11 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:41:52 -0400
Subject: [PATCH v2 3/8] rust: block: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-3-1ab5ba189c6e@gmail.com>
References: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
In-Reply-To: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
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
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964924; l=2909;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=vuDgQYV2nbF6wDrYHHf8eMvazUJvWvWnDsga4yR8ZwA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHc+KbWe0mrNmiJ0AautqYraxFDr7unwZE/5c0RQ2Ojk4ru4U2Oae0ZmVmEDXv7ZRDiXgq3EQH3
 G6511ib+cXQs=
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
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
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
2.50.1

