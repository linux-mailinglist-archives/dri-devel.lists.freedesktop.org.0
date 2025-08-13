Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C97BB24DA4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9301310E74E;
	Wed, 13 Aug 2025 15:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IESkY+zr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C7A10E749;
 Wed, 13 Aug 2025 15:39:58 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7e80ba947cfso667986685a.0; 
 Wed, 13 Aug 2025 08:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099597; x=1755704397; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=k8zwWmF5N009AGIXlDD+XsD4K4+mEgy8HqbF8g/gLNE=;
 b=IESkY+zrj4GYRDIGztqin+bJzhLEdLCNFHeNJZpMeAZ5uPQQOBfoBVBrAZ3hzfsTaj
 eu60i3h4unENB5MS4hIa1aAXtePSPzKQKz9LhfqufJGoyd8FHf3NAJaQ7wS2yhqdBGzj
 fqf43VMs8VBqMR2h/erXNZAT40LpjX+K/f1MtjUgQ5QJBpbhlC81Jwsqu+CzhHZy0Cz9
 tQJlUYTOQ4G0+WmDc6BllMj69jM/rejttzUia5L2zgHhkugTBJ3T+vCMeIP3Jf4B3w3/
 EjviFq+zrNY+jU7oCIB2T9AGAxmS4jxMJvkLS8guqG0XKVKZo6RaUcAZ1rlWAKVkDko4
 BlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099597; x=1755704397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8zwWmF5N009AGIXlDD+XsD4K4+mEgy8HqbF8g/gLNE=;
 b=IaidP4gxf9pH3kB7wegRp8Q6e+5/xsZFd9GuyNaOpv2dyNyfIw+ZlvMYxe/JwBDQhJ
 OprMV55XHD5NuzBcuGsNM/aE39uO/ss3qUB7O87bHl6/GamC4QMm1DZ1yrP1pfiS3laq
 OQeqPIMK6Rg4hB8UjxuC5ij4mr4H122tzWA4ysWT5BlvD2yjohxbJgdNDvPTBucn5g/3
 4nHVstmbTnelm+j7JClhIDuZ9wSodBK+l2/nkan2/ZT0GzwTc278+tNO78qx22kNWHqo
 WPiJKqd3lzIWo7Y1ddV/cnHzFmKrRM2jWrxV/FYT/TtoxtbmC5ftHJ8Ycg8wtAPRoBqT
 ElpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6OnHyLRwXm3P+XHsl2vHHpgbKF8VCejhPkTa7SQoq7NTznTrOpLHtJXylTtqBTvqxf5jo6t2y6wU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyH/7kZNd0wKnqphSFm/RFLq5l9Z2Hpxin6yZhQi1YzGXY7ULld
 Axa9mzLBOSvAMRPdm8Th5SgjobbZEGPKqrRlf8KtAQQIUXxGznvqrbUy
X-Gm-Gg: ASbGncs3xffQ0ktHi6Mpv/py4EnYfdMPBSKPGO9gFBl62XGCPN+BkrnVKixj8E7RPFF
 v9eayrbmNE6mgeJOV/zFL0S3spd0JsSDe0uUxPsGWcTJa3I5BbM2rKlzWtjA6D9Pv/hjoWj/mSL
 G6Z0EZGakXxhmhArcjRZHFiuJAVVCS7ytYC9LMvUq8KwRMN6oOJDp0yliXo2K0/zQNSh3ByXJbS
 keT2fWWfFZraWZEB6ekgvcy/vlIfEt8FsBwB4N16ReuQaf2wEHUy8LSNOc/VO+m+YI9YPZ2z26L
 ErJcWubR7XNDBWDENfNcP3K1d2+mdyGbgNNJDkTCvdE3q2PknZ7oQNCMFQ4o2v5gJ4NHmBP+PWn
 asW6atNq22St0V1mzkEq27/xpaSBwjDyKmE7RYLim6c0nvPdgJyyL8djgYYbdpXtSX4uWwHktAi
 TkNjMqYSLIgj6mZ1vMyVMAEokfSWLo5hXQcEKiQ7M3S9Ci
X-Google-Smtp-Source: AGHT+IE1pby1TNrlRmqWtTqCTDZQP1D4c39paDUDyEiVNPrf/2gtoMRUjpJ7cXNWJtGfePDy+14ROw==
X-Received: by 2002:a05:620a:8a83:b0:7e8:21ab:2846 with SMTP id
 af79cd13be357-7e8653207f2mr294256985a.36.1755099597290; 
 Wed, 13 Aug 2025 08:39:57 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e67f728a6asm1976119385a.64.2025.08.13.08.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:39:56 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:39:47 -0400
Subject: [PATCH v3 2/9] rust: alloc: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-2-a15eca059c51@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099590; l=2090;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=PSL4iigvbqQ2ksUQBIiw94ADQQA5vnHuf37BheuwWG4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QN+HYlLAYPrUuy/AnIupocmwcDxEYQ6EU0tYcePMf7VZdJcmyQEaJoOPoXUfzoxZjDXIW6ttbd0
 6E4kkz9lOvwo=
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
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/alloc/kbox.rs        | 2 +-
 rust/kernel/alloc/kvec.rs        | 2 +-
 rust/kernel/alloc/kvec/errors.rs | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 856d05aa60f1..563187d09a8e 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -7,7 +7,6 @@
 use super::{AllocError, Allocator, Flags};
 use core::alloc::Layout;
 use core::borrow::{Borrow, BorrowMut};
-use core::fmt;
 use core::marker::PhantomData;
 use core::mem::ManuallyDrop;
 use core::mem::MaybeUninit;
@@ -17,6 +16,7 @@
 use core::result::Result;
 
 use crate::ffi::c_void;
+use crate::fmt;
 use crate::init::InPlaceInit;
 use crate::types::ForeignOwnable;
 use pin_init::{InPlaceWrite, Init, PinInit, ZeroableOption};
diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 3c72e0bdddb8..4a1b2c26209a 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -7,9 +7,9 @@
     layout::ArrayLayout,
     AllocError, Allocator, Box, Flags,
 };
+use crate::fmt;
 use core::{
     borrow::{Borrow, BorrowMut},
-    fmt,
     marker::PhantomData,
     mem::{ManuallyDrop, MaybeUninit},
     ops::Deref,
diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/errors.rs
index 348b8d27e102..21a920a4b09b 100644
--- a/rust/kernel/alloc/kvec/errors.rs
+++ b/rust/kernel/alloc/kvec/errors.rs
@@ -2,7 +2,7 @@
 
 //! Errors for the [`Vec`] type.
 
-use core::fmt::{self, Debug, Formatter};
+use kernel::fmt::{self, Debug, Formatter};
 use kernel::prelude::*;
 
 /// Error type for [`Vec::push_within_capacity`].

-- 
2.50.1

