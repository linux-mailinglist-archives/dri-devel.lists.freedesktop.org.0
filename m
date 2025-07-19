Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA36B0B24A
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21DC10E36B;
	Sat, 19 Jul 2025 22:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IWkFOzEZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C48310E35D;
 Sat, 19 Jul 2025 22:42:15 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7e34399cdb2so344323485a.3; 
 Sat, 19 Jul 2025 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964934; x=1753569734; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pBla166t5r/3r2D+ChYAZke2nd+xgoyT3sVy8XOPMb0=;
 b=IWkFOzEZ5hC4louTrWX2zJiRCsloqAmuXe/J+pAISiz2M+sWhFGoKZh/1fWJt9/sFF
 5RDELgZQWkeOwVa/yCPJkiEF5NjI2a58GEN8DbvzQRof45pYhrQwan+ECg9ODd4s7Ob2
 SWCWcD4X9jkQbkLg0wDPKd8/anp9JtxeE+/N3/y7tdqWFpQJbNeaMaaQo6P94lvrcG9w
 8f7PY7MBos7icC0VdDq1F7DjvGlJ2mTH8VSbpHHz+yMN0f2gXBXXIHzZdMdFspSige6z
 ywoalpsOvwr4zE2Hzr+mZTOYoayDkemyoMiz+D/B7AlvdkCGTUFKaGYzfyPT6T9suwx+
 +LtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964934; x=1753569734;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pBla166t5r/3r2D+ChYAZke2nd+xgoyT3sVy8XOPMb0=;
 b=NXFI8KbpGfTXB1yu1ljXV+NuW+MHFavzWDtJcDZKaTHrMUoDbaOZro3CdiyfP27VK4
 5R97TPPMXHEkToDSUf5ypLle2YrXpiIO+eYlN7q3uwCrLsKmz3uhC7K/9NLvTM68s30b
 CMe33uHvhE1JbriKXDnYi4lDrtr4SI3keVOnfD7IAjDxFGCd/fcy0fevO1Pp5ZnRC6xk
 4KcEJpqVU1WdSiwqfHs/TQXgPgwiLAKgUkV27a9jY50B+5V6wgmD3x4CMqoXI46yjrj+
 7z2cy+C3fR9JkHPrhX3+KpnEORsj5u+9ZLauVqklRBhXgvQpBpduYbxKrxo/8wIuDQGZ
 9i+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkG6eyy1A1du8RhWabDYwdLDY9K2o9EIIorB1oXJ7y9/K2Ob6osLmjGQGol90nCTrWVQJvzOZh6bc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYlCn45d6f+Jp8rMqI8Bo1HPLntj5rxivZrGPdCRxVn+Y4I/US
 3WTZ0ulCg8zH4H1uqLOr1TiSA4qlTXesU0OYRrtsYeZ031X0ihfZo4HG
X-Gm-Gg: ASbGncuYY929PunRfZcT8a2GFPJpq5BunbfI7YG24gEdWL3V/cqL3E7fqhTmxIZv9zh
 zuRIw6qQpX1jK6TLINK4Hl902c2Yih7BTsh3cw0flneFbXKs+xMUA6O3obLAPiy8+qbZ2TZZ+bf
 AYgsVoNCoG0de/Z8W4yEbJcWRWpUOjtqp83SE6gIwhKk7hILcEiV3SKuhwYPzIXrf4aZNm5L8E2
 d3TroYUoOrlW+j4HP5cewdkaVqk5xbhCE8Mimg4JMXB+yN+CvgDZvMDL+ZM7P/QnHUpTv3Fpoav
 y4Lkk4eS28w3SCizklFdyAF5ua+GAiGe0sMYqKLhLup5VdGuFXvY0i8nnN7N1SC+sLt7X5t5i6r
 IzVGvl4J54F0OF57OjOvvoqMnbUn/N0Ekd3x3jkuWW1wgBExkMXwzWfzMT6cZVvZmN8s9JfEbmU
 FQ0OqvEQvWWm0ux6mQk3VWvw7tCIS9
X-Google-Smtp-Source: AGHT+IESl2YLjvcT4j9is52UMA6fKdbfS1rWW+Nul6Pb+u8f5NHy8MCnsJDoGVOb40bOsnG8e/xlag==
X-Received: by 2002:a05:620a:371a:b0:7e3:4899:28ab with SMTP id
 af79cd13be357-7e348992b22mr1949092085a.57.1752964934197; 
 Sat, 19 Jul 2025 15:42:14 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e356c75cf5sm251550785a.84.2025.07.19.15.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:13 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:41:53 -0400
Subject: [PATCH v2 4/8] rust: device: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-4-1ab5ba189c6e@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964924; l=1290;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=CRl/lQSZVYzZ8ljWAUnUAXiehzAwEFBaZRkNdCXXhsU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAdqNNzgmFK7wLExHbGwFaZHfT+WPObXmybruma+nVHZ+/uH3ldrzJxHVRnirRqQXJe3FqZDEn+
 f9lwVHboijg0=
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
 rust/kernel/device.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 5c946af3a4d5..9e9ecdb1beec 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -5,11 +5,11 @@
 //! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
 
 use crate::{
-    bindings,
+    bindings, fmt,
     str::CStr,
     types::{ARef, Opaque},
 };
-use core::{fmt, marker::PhantomData, ptr};
+use core::{marker::PhantomData, ptr};
 
 #[cfg(CONFIG_PRINTK)]
 use crate::c_str;
@@ -345,7 +345,7 @@ macro_rules! impl_device_context_into_aref {
 macro_rules! dev_printk {
     ($method:ident, $dev:expr, $($f:tt)*) => {
         {
-            ($dev).$method(::core::format_args!($($f)*));
+            ($dev).$method($crate::prelude::fmt!($($f)*));
         }
     }
 }

-- 
2.50.1

