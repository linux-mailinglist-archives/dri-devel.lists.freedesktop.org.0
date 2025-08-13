Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245E3B24DAB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA3510E74D;
	Wed, 13 Aug 2025 15:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bHEHY7f6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900C410E74F;
 Wed, 13 Aug 2025 15:40:06 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7e1d89fcc31so662366985a.1; 
 Wed, 13 Aug 2025 08:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099606; x=1755704406; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tKQyJUeEwCiLmV9wAMTey92Pv78BxejTGsU885hQL84=;
 b=bHEHY7f6AnlOlzj4qFtE/ALOfhL77mSNN7cwYIVWMYuJJK9Kq7s4hy1P3d4iefsA3l
 /b3/HcnIEJizTKtrCy8Qk/rjH1ipCbj6N/gt1ZHSwYvXN0UEZfO/7uizkT3B/V1FXR5L
 Ic22z6P/EFfQSmrpb3FpCLWjVuW2a5k0xs8fYY8fvgIGNCH7w0GblOVl60Bu49ACSady
 cEdHbtvqL9dfLrGgxSnmfRfRse5RC0k+I7RN2Kt93yyZcggkFy5HDo4l1xjqLnkPRe61
 8/ZdUHRcgKeFVAQdZlLYP0RuarCrnqd6v1lu/yV7jlUG990HDdeRoe7vDSzQph++QcAi
 Xu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099606; x=1755704406;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tKQyJUeEwCiLmV9wAMTey92Pv78BxejTGsU885hQL84=;
 b=p1dyGkLcdmBWVx7gvVlbg1KbISP/5/M14N+SqM6BtPOvqAgsyIU2P5XaOMlHe1OOcC
 jyXKHnyruAXV9v4D3IAAWCwz0FQ1G3nKK2xmjgS8BweAx6NiobI259hwJ26fS18qWJx/
 yrz9NEqcDumfYIXnZfcRw0qD0Uoy+/sjv/KEmxppOKw4QWDnSyVNnpZk6pfjmAtgGue+
 r4t2HxJJk8McxuKZxsWqkAx4YVtC012nkvRZ5tLHfDX136F4jWPDGYejcLOXM21mW9kf
 Q26Yk1Dy8MULjDAIvXFU39MnYaZL2r9zxTYt0RAZ/6Jf9uIZMBHwc8z2OQk5qFwPS6Q0
 nlJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhAsaLjJo/DjY6OgdbnZAD5y2vFcSC/7mGrAeH/XRs+RRy3ton/f9rDQb8MWAT6F6CiOHjLw8New8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfVKiZRhIaosDN37S2/hCX9Psne2r3LkUOjikFtvyNpsX//6Pc
 S0XNwAugvnmnHR++TtX4z+9aQURH9mhJTauke2bTS2bSFawabBCwwVn8
X-Gm-Gg: ASbGncsqCnuKDxF6G7MNSiwxt0lzcKCaMi3npLGUsmkm2k2ehbybPubn+xIYGxv7dnt
 KWvlxwh4D3/W0AqRYdlIFzSVs6gJiYQ4HF2mflGY22rfloLO4mFhWILj84QZAw8n/tAiFOln75I
 PsoGM1hAqRR5WlyyJVqc22s1jxLRzEF3T+fU1CN61Yynf8N5LhPvFGgpJsFM62WeaAk9liKwrx7
 CUXmqUvaUACDZFyRH3btKjNls4xqJo0OXbtgu9wgypmIulc1g+s11wyBvbqJ7iiqEVh0Nlg6Oz7
 jU9oK9agSqhLsdkOYinUl97XxojjRcYnpLXZpwGtRAmanN29jzydzegKEX7Lfx4WOxHTvXpsG8m
 Xgld+3H45ibb6gvDFJqj6bh/USpTlRgn1iaWcT13KaifG6x/dGSXW6VYvCrtFccVeAuEZ7Md9K9
 Xd3lGtPdJE7tdfLSusBa/52JndZbsA5cjTzw==
X-Google-Smtp-Source: AGHT+IG14Ou5jKogZhVRtk4/jsabABzOGdHRDYRyYwlXybd5iqYGKxAQsMBHFwVEi3/l9Z9yMLj/Cg==
X-Received: by 2002:a05:620a:3707:b0:7e7:fafc:c6f with SMTP id
 af79cd13be357-7e86526c55bmr457281385a.22.1755099605519; 
 Wed, 13 Aug 2025 08:40:05 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e67f728a6asm1976119385a.64.2025.08.13.08.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:40:05 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:39:51 -0400
Subject: [PATCH v3 6/9] rust: kunit: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-6-a15eca059c51@gmail.com>
References: <20250813-core-cstr-fanout-1-v3-0-a15eca059c51@gmail.com>
In-Reply-To: <20250813-core-cstr-fanout-1-v3-0-a15eca059c51@gmail.com>
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
 Uladzislau Rezki <urezki@gmail.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099590; l=2471;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=NMYBijI5MjCpRRYFrsF0rVf9eokObKfR9KrctSSofPM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLKIxkqmYjvgREAtIt6jqTnawH9+7pVTy/Un6pR53J21I51aGM8aOXhOurMFKVJYH2NWvrbQfzx
 uG07vM7LPJgM=
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

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/kunit.rs        | 8 ++++----
 scripts/rustdoc_test_gen.rs | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 41efd87595d6..cf58a204b222 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -6,8 +6,8 @@
 //!
 //! Reference: <https://docs.kernel.org/dev-tools/kunit/index.html>
 
+use crate::fmt;
 use crate::prelude::*;
-use core::fmt;
 
 #[cfg(CONFIG_PRINTK)]
 use crate::c_str;
@@ -74,14 +74,14 @@ macro_rules! kunit_assert {
                 // mistake (it is hidden to prevent that).
                 //
                 // This mimics KUnit's failed assertion format.
-                $crate::kunit::err(format_args!(
+                $crate::kunit::err($crate::prelude::fmt!(
                     "    # {}: ASSERTION FAILED at {FILE}:{LINE}\n",
                     $name
                 ));
-                $crate::kunit::err(format_args!(
+                $crate::kunit::err($crate::prelude::fmt!(
                     "    Expected {CONDITION} to be true, but is false\n"
                 ));
-                $crate::kunit::err(format_args!(
+                $crate::kunit::err($crate::prelude::fmt!(
                     "    Failure not reported to KUnit since this is a non-KUnit task\n"
                 ));
                 break 'out;
diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
index abb34ada2508..c8f9dc2ab976 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -202,7 +202,7 @@ macro_rules! assert_eq {{
     // This follows the syntax for declaring test metadata in the proposed KTAP v2 spec, which may
     // be used for the proposed KUnit test attributes API. Thus hopefully this will make migration
     // easier later on.
-    ::kernel::kunit::info(format_args!("    # {kunit_name}.location: {real_path}:{line}\n"));
+    ::kernel::kunit::info(fmt!("    # {kunit_name}.location: {real_path}:{line}\n"));
 
     /// The anchor where the test code body starts.
     #[allow(unused)]

-- 
2.50.1

