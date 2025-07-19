Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D62B0B24E
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B8810E346;
	Sat, 19 Jul 2025 22:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Upe/MGUM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F5210E35D;
 Sat, 19 Jul 2025 22:42:22 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7e29d5f7672so296689585a.3; 
 Sat, 19 Jul 2025 15:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964941; x=1753569741; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QdbbYgm/iXkAkxwQMWH0ycz2sZVChnbra180vU+zHz0=;
 b=Upe/MGUMP24jsDUYBQ4zixLGKD5z380GWXhJyNsA2tYDyt+ufOVNnaY1fL6hdc2xut
 Eysstdt1jJd8JUwenfFW039GzlmJUmDGQTeD5LVfGRb0lyiYoNmye/TP/fw6oyv0zH56
 j19ODK4C5oi2a7W4UPpCSv90FMjoR3V/RkBp+B+NkZHqNMSn0EaG1kuJ95dhiUHlLyGG
 8I11m3OYNyQ0XJZHimy07Rae4N21fbihAOWWZJWFOuqK4Ddfu2wFaEl1BzAo32xYP2ot
 OoKXM9g0sNMhbczhE/0MTLzqJtcl1LE3ksnPK9NS8oPBc9P+S/Qhq+ACROYYlKstgrtB
 nKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964941; x=1753569741;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QdbbYgm/iXkAkxwQMWH0ycz2sZVChnbra180vU+zHz0=;
 b=ElJHgyx7ApxL375MHnb8uud9ZSLJQpPsZ7xagGmqVe2UMD0bhiOSJplIE6pj77y6/u
 yebz3zuFyaJR8ZgpT24LQytsl7ghhw9w7TS9Olv/Fs837uOZ8YS4UDS5JkTc0tacv6sf
 KXIn7RZRnIEjqF8EfAlBKo4VeJceAnwiNZhr73Pnn+K04ei+64KB5yYH/GWe9HmFkaZE
 KDe4kZaKs1aVchHWc1Aw21SGlbDDUxzCwcMcyyQmFDMo4BEhyRtGOFPOr7dvAqdavgtZ
 4yq/AFWGKyxd6dIhMAgrq55Zx+1bvls/+tX2UZrYvnsYmWMC0ePSqf1kL34yYu4bxd82
 J0Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfUaXsEF/ISuHr+CvCHvYYbiomXBMME4wt1qxWXOSQr23G1WpWytH3PF/3qKVqYO/4RsCn3syIhDk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1MGVrk8cOkT4ezWqrAo1LAWGmKO5kF3EuIB/N+7Fa12N31yeE
 uFSdkhprAFdfFscj8ngHZ/XWgbeBdVlj6eAP8i7PnZFiyVp84sp82UA1prqhBy6PTDznQQ==
X-Gm-Gg: ASbGncthXFmdbuPB/oHc/N/tRAB/P39DZfxLElINB9HMLn8/KM/ccWHCjtKmYaw4LHX
 FTWbNg+e0AiGDA/t8NQY5qGz2WDi4FKunW4waRXFqzlci0hxDchLfG+J44Bj60J8SQYrzjbor08
 Xuv3lrHlp8oQ/Ij4xGpOa8HAF1E9WaZ14O4A/RtOm44zhS8T8sMgb61JBVHgzJBfn/08M5UYyw8
 MFGjldMy8j45NbLtQ/XouN0g+chv0iOKPRh9+jTdd3VF47Sb6Kl28snShqcrMV5OPNXOWjIjzmL
 Lnf689Rn1/fa9pL8D8SnO6OoN10RTOv2ytzwaZuwgP10y8vL8gl2qsYoteXT3kTO/J3kQq7472b
 A+RNwaNWRzGWAxXonXMAihENojNTc/zv1SIx4Vp9kVMJio/Y53DoCu6FzNPnkqTh8iaKZVkABuq
 UPrhiM2maio3TN5Tci5TQ+RnTU9u4r
X-Google-Smtp-Source: AGHT+IExJ0S3QQDaiGbPTBsZmpSjuOQIlR5bLS/MkE3qOes24LnmbTk8ROv7AcJo9jNAjk73PAhZ2Q==
X-Received: by 2002:a05:620a:2603:b0:7d6:f963:8764 with SMTP id
 af79cd13be357-7e342b37069mr1693903085a.34.1752964941355; 
 Sat, 19 Jul 2025 15:42:21 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e356c75cf5sm251550785a.84.2025.07.19.15.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:20 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:41:57 -0400
Subject: [PATCH v2 8/8] rust: sync: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-8-1ab5ba189c6e@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964924; l=1044;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=JT4wt4ZGHRcX28Gp51Np/HdVIFSoSzvSxV6NKAkiYZQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLEQxox4uw29M7Ga/wSxO4/q3iC5xttqA8XggKW3e209GRzKxBr13fwKRE/61UufHZ5HECtWBet
 gOEf03vWiSw8=
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

