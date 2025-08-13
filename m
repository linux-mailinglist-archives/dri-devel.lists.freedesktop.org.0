Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549BBB24DAC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBCD10E75A;
	Wed, 13 Aug 2025 15:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XNX+R25h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26B310E758;
 Wed, 13 Aug 2025 15:40:12 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7e86faa158fso2381985a.1; 
 Wed, 13 Aug 2025 08:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099612; x=1755704412; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=izK/WiAPZAaZKlIcAkFE0rrz+1wIUxFG7qzyjlv/jF0=;
 b=XNX+R25hf9s0SkTli+2pLNwWBuRsGfhSN9YqyGZThV8yIeSTTQoZpWffUIQs0D5p5f
 ZMDYJUK3HtNz4q0umKHaypZD7PmaMo8EwSXb12A6I0kcfkvwu96VDY5gv1UvjmJhdHs1
 Rp4dhy9pgOhVKpUe0XRlNBXiYWjTdKEwgQlbBCKllDq+Atp/49RgHxs9oX0ppfjPelZx
 wnKVin1yQbGRCv95rBQSpgJi7OGI1Px8DNeVBh8JbyJPj3QGB2npt4mskgu9655EkW/L
 rzn4O15/cUNDxgF4ec4MpN/d87nEIAVXOaAGok2OanaNqxs+41YNAkdcYWWdjjbKjS/6
 YqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099612; x=1755704412;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=izK/WiAPZAaZKlIcAkFE0rrz+1wIUxFG7qzyjlv/jF0=;
 b=IsNEi3K0jGxbXzytv5Z7S51z7biGMkYQO7DPzK/4e1Vt+T4i07tvLVgaktUYPVnXj1
 phbIVVfm0l9p9Dn1AhAw++JxTuHQIUwgbRsb+V+lQJE5YrrFmx4nES6WZO9ad9ceynWr
 BRpB6oe8dRMNiQECsKY74gQHd6eTzCJW1UnF5TBWMzrTYevPNXkS2YFNR3S3G1KSzpJz
 17bsadMqS/EjTI66TlZMNnPgB8XqHK0G7K5ePdWdd1ZWeB0rDvbEV2e1O2wRFuNooxJy
 Eyj2CNzOLZmltX9fG6KzGPHiZoPnSB2wN9NkbIY2/iR8QQEeA4hKBuH59lKg/AD2YQyQ
 LHpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/o8rMLFoZLnyRDcaEfaRykj21CbxF3+8eSEEg7imleLfI3TQsoSw5zfh9c+zoxynKZuA8LuSYS7c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+P/ZekYrqv1/ONzaPf7N0MHTa+fOLsU76tud0EbstNv0eaXYJ
 ixmbmwNNZCDg3b4wY0x7WZBK77QBR8QThlRucyd14/wpgGjQFWNsu5YL
X-Gm-Gg: ASbGncuvDQa9amUpBjN+5mYa2w4IwM2GQgmy/kpMtmyE4PsQYA/cjgldjSy7pyioiB2
 OgnSzmR6/0OIRrRCl6QDrBLRl9q7TQgL53myT2FRCebCBrtS4TkW0QH0RLtCnFl4QoTl2XJX9SM
 KYCAhHxEXZsjx+pTMhuc6ZqBsIqVH7aKsVP9wI2EM1EBSnYpANJFVXIG7TZTtx/2PEV12YO5GIS
 dJMLtvasBh8+76+VLAcoYhqk0dd/6/jRsc7/LYfj4rdi1Qm8ItxrV/IEFx5xex7Mxwce9WM7Li3
 Phz1zuKbvW7I4VTQ8iw2MxR09ZtKRHLAmmi6J2V8P9xCIJc3irRIUUCf43tK9s99I7dcE7IDadH
 tYfF/bz3HFworm63pNB7UU2VQygr1cS4fcvNNJJBHNQ4XHqvnDVSWhNdFW+13FE0h2drFetC9Ay
 71hYY3NWQx5G/l3eZp6EW72IR2ZS4ilF9Zfg==
X-Google-Smtp-Source: AGHT+IHZn/g5szhfMfFQFGXYl+pBHg/EpdCIVARFA50+xJj+KXURmnbR4Sb92/OTyxkaNK5Lvur9xQ==
X-Received: by 2002:a05:620a:4505:b0:7e6:8b21:fe8b with SMTP id
 af79cd13be357-7e86fa5af32mr11093685a.0.1755099611401; 
 Wed, 13 Aug 2025 08:40:11 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e67f728a6asm1976119385a.64.2025.08.13.08.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:40:10 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:39:54 -0400
Subject: [PATCH v3 9/9] rust: device: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-9-a15eca059c51@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099591; l=3475;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=crPkoR00cXYcPvikGdstY+SXedz+0EWwi2X94sQLRp0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKPx7imLLl1IyTUMbn/UU9jRwKiWRs/5JaaYbOw7kxpIJQbxaN+IToLgk64d7J03HxECB5q+Z4M
 nXv5TSbO1yAs=
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

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/device/property.rs | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 49ee12a906db..3a332a8c53a9 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -11,6 +11,7 @@
     alloc::KVec,
     bindings,
     error::{to_result, Result},
+    fmt,
     prelude::*,
     str::{CStr, CString},
     types::{ARef, Opaque},
@@ -68,16 +69,16 @@ pub fn is_of_node(&self) -> bool {
         unsafe { bindings::is_of_node(self.as_raw()) }
     }
 
-    /// Returns an object that implements [`Display`](core::fmt::Display) for
+    /// Returns an object that implements [`Display`](fmt::Display) for
     /// printing the name of a node.
     ///
     /// This is an alternative to the default `Display` implementation, which
     /// prints the full path.
-    pub fn display_name(&self) -> impl core::fmt::Display + '_ {
+    pub fn display_name(&self) -> impl fmt::Display + '_ {
         struct FwNodeDisplayName<'a>(&'a FwNode);
 
-        impl core::fmt::Display for FwNodeDisplayName<'_> {
-            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        impl fmt::Display for FwNodeDisplayName<'_> {
+            fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                 // SAFETY: `self` is valid by its type invariant.
                 let name = unsafe { bindings::fwnode_get_name(self.0.as_raw()) };
                 if name.is_null() {
@@ -87,7 +88,7 @@ fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
                 // - `fwnode_get_name` returns null or a valid C string.
                 // - `name` was checked to be non-null.
                 let name = unsafe { CStr::from_char_ptr(name) };
-                write!(f, "{name}")
+                fmt::Display::fmt(name, f)
             }
         }
 
@@ -351,8 +352,8 @@ pub fn is_empty(&self) -> bool {
     }
 }
 
-impl core::fmt::Debug for FwNodeReferenceArgs {
-    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+impl fmt::Debug for FwNodeReferenceArgs {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(f, "{:?}", self.as_slice())
     }
 }
@@ -377,8 +378,8 @@ enum Node<'a> {
     Owned(ARef<FwNode>),
 }
 
-impl core::fmt::Display for FwNode {
-    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+impl fmt::Display for FwNode {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         // The logic here is the same as the one in lib/vsprintf.c
         // (fwnode_full_name_string).
 
@@ -413,9 +414,9 @@ fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
                 // SAFETY: `fwnode_get_name_prefix` returns null or a
                 // valid C string.
                 let prefix = unsafe { CStr::from_char_ptr(prefix) };
-                write!(f, "{prefix}")?;
+                fmt::Display::fmt(prefix, f)?;
             }
-            write!(f, "{}", fwnode.display_name())?;
+            fmt::Display::fmt(&fwnode.display_name(), f)?;
         }
 
         Ok(())

-- 
2.50.1

