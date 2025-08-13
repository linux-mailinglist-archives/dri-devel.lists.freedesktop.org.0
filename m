Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071BBB24DA7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFDA10E757;
	Wed, 13 Aug 2025 15:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ba8VITux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A56610E756;
 Wed, 13 Aug 2025 15:40:10 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7e69960c557so1016290485a.1; 
 Wed, 13 Aug 2025 08:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099609; x=1755704409; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Txy/cJf0GBJ+o0igtkYkmxWlbfspCRXzkvSHCuYjmpk=;
 b=Ba8VITuxqi/lxd8EZXui+qPcNjSEkodJ6udnVIByNrk2CC5c38V2HJBbIMUq5r7pT3
 s5+RMJ9UZXKBc/8E9LKBAnxjMMBrnFuN5Hr6tAXuQOLrdV7KvqqhGNZcRrkqv+GL350v
 d6SgITcgk12NIWzy5Oa05B/A13b/tojbpCWWKSjAzelSmWd6rPy27KnJVW1ISvI26p6W
 6Fl62Z+4q4D+oWiLseSObuI8bA1rfLKQLBqrsEI4K90jwgHb/wOCtOEPuQVn9AT4LMRO
 zQOGrSTqm+uq7d7d1yvrsz10tur6AoKk9cuOHtqT/mdt3xotzmWD+myfOFLbBXNqCaT5
 7ErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099609; x=1755704409;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Txy/cJf0GBJ+o0igtkYkmxWlbfspCRXzkvSHCuYjmpk=;
 b=LrV8nYqJxgf2287Ha6qeIvG5y152YDjT082leN20FusS/Se4eCK8S5t1tzn8SxqsYj
 uie3cTJ4Z1Wpz/JJGmZSlE9WoEuUD4FRO3lJFCGzaFOtYB8+DKWgD+YUH/MiRg0Gj3z7
 MDr655IcMQvg8elCYI2uGCpHlUp2w4/aLmJ1BreZ73ziN+0JHEwZ/mvrUTIHypF7Iarr
 3QBCecZqsvCIL+eabmVJHEf/ytm3bybc68WEjBV/6koIxvctLCy25zt0HQDlCC8CLXI8
 BmFNLGUgiCNjWyH5IIhtmWpa7wo3kAPSBV8w+5ItNQkw/3CxlvMOrtM2BbkQJ9V0Hmch
 a1JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLmt95wNtvAnMkHKjgenY8OTXVmCVH5+W2zYeuitwLR7nNyQOYq8FRK9U99ZP+wu3IlQ9I7aFuk7Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo38+nNuWFdAfQ71EPLsXg5gZC4fxtJOcBsiYdzvJvaWK5Jdgm
 PApxJBr+NAZuv5VD+X9UNhWgO+/XCJDBBO44ykl3DBA3j24fNxuv8FZU
X-Gm-Gg: ASbGncsTAFfM+eOLVmnrIAvv11eWpqbaRo+CGSxaF9kmfpCZXO08VbQv1iwSG3kpv1v
 vKMYUPPjzodB5iU3nxaIIF+1A58x65ogReQYMn0J7UAAMWilSArYzOIgZZujRtOQ3DaRhsFTA6I
 ygft4e1ZEf/8wRwD68jGmkVnUQXcumppWUvYouj/Fdq+cC2yfqjyYqL/ydHoxRvrFEDOCYhq4kU
 CLzO7Btc9E7oZJDiCxuuZqia3saHV2neW/8Bf887Uwl/U0v0MybU4zFkcCCrv0odtNvbVHGdZMx
 UT/0ldigSWhe8VnppEpk3vofimd4w46tn9Y5S2/vaj711sbqxBq6sU/5IlXJFAoTGvswP2+Dvns
 ln4VvODjXGobD6Y9dgBhouWMElMQgi3Lxy6401eJ9GXvmkW1XKGa+lBhR3Z+PwW4b3xND8Tm9DJ
 ZUmyM3hPgiF4duFUNSFm8veS75ZzZ9eCeg1w==
X-Google-Smtp-Source: AGHT+IFxJagWPZZZ2hzouDkHBzhG5TPmQTOcmugjvUWSzlYtPNO6sC6jEyzc3aC/S1mkWUBCIwCCGQ==
X-Received: by 2002:a05:620a:4897:b0:7e8:21af:3d6f with SMTP id
 af79cd13be357-7e865276f4emr408733985a.17.1755099609321; 
 Wed, 13 Aug 2025 08:40:09 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e67f728a6asm1976119385a.64.2025.08.13.08.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:40:08 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:39:53 -0400
Subject: [PATCH v3 8/9] rust: sync: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-8-a15eca059c51@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099591; l=998;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=GRf55CBaIXfcLimWiztzt2WPB2t4kstaCplsKmlIKbc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOAIUsQflz2HGM4AvRq77QQJYK6O5RKw6D4n7a/7jWYfKPgD+405KYQHwXHJu4uUN1IVy1k31PV
 2UmoGqrCUOQI=
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
 rust/kernel/sync/arc.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 63a66761d0c7..4f3c1c2ff05e 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -20,6 +20,7 @@
     alloc::{AllocError, Flags, KBox},
     bindings,
     ffi::c_void,
+    fmt,
     init::InPlaceInit,
     try_init,
     types::{ForeignOwnable, Opaque},
@@ -27,7 +28,6 @@
 use core::{
     alloc::Layout,
     borrow::{Borrow, BorrowMut},
-    fmt,
     marker::PhantomData,
     mem::{ManuallyDrop, MaybeUninit},
     ops::{Deref, DerefMut},

-- 
2.50.1

