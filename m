Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA0FAFF243
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 22:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C3C10E83F;
	Wed,  9 Jul 2025 20:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MQDWb8eu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB3E10E83A;
 Wed,  9 Jul 2025 20:00:18 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4a58f79d6e9so3807421cf.2; 
 Wed, 09 Jul 2025 13:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091217; x=1752696017; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FtAb0bRzj6kkU1aoRo4HWiBiB02s3rvT49BZnRuUOhI=;
 b=MQDWb8euqQpHknYeXdrH/2aZl/+v2ZhQWgVxHf0O6Je/6XAv3T53u7XaIC87zQxUWT
 S4NTidJX15zKLwySLiASlD1/iTnHoaA2RBLIoKty/xKrktXn0J9aMb7CvReyl3XqHgkW
 h2ysfp6da+//L4osgvVkVsBTfWf4PCvmNvtCcx9QegUh+BT815Qyq+SNKObLfU8FFlfB
 GvtOZ3ES7M0cwDnb6jFrb5YYC0be0IXtyBDCickigrgbYEfLVgRC4kj+7WVWS+uNxnPr
 g2fY4S5w11cgzIL9K4VFs39LNN/ThY87CiRP+7/lQNqWuTtKSG8z/ux7ycAeSsiBb7Gp
 Cxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091217; x=1752696017;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FtAb0bRzj6kkU1aoRo4HWiBiB02s3rvT49BZnRuUOhI=;
 b=Gz9OTvZ1eLn0w+17xc/St8Gq3QKG9qQXYW+vELc1HJQ0H9lB3V/L61KLhikcmIpBdh
 TgCzHT/qyW4/myz3ea5psJ+bBkhZbVlvk4bYc4VXAoctMHTGBZWkFk8sTlubHUTbOF+Q
 BI/R5deBzDZYPTWuw4Taoe2ROtwv2hgRu6crQtP7me5xdfPInvrgJHKGyvtQ7/rcE+Iz
 KtpsNLf3NdMELGNO3huUTmpNueX6mpxnP8QUTK7yaoGgb4Lflvs31McUVjNQWwQqFX41
 +iAh/IN6QgrxytKgltAn2Rm4UEKG+pvLiP+jtQ6ugzTB3Zf1d1XPv1NrKvJiD67+q9o+
 TvHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiDIoYcnggVgFSaKdkM9xmAE4osoxCdmxof0HjswiiBAxDzMtxlJlhMHDCkgpMu6ZvgBPtq1+B16I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8e4IcSrigeVSTWumkY8bkZGc64/8aXsp5sMc8Jj/tqC+8juqb
 sG4waewVM18RJ4g20U4CZRKGOV0oQmFvx7SXnfhI/N6YH1JuTWUJ61eu
X-Gm-Gg: ASbGncvZ05PCrb5uAjWhqVKq4yhpot+MkTqgWKL7zRDh725Zw55GWJoqcFc/oBs4bV7
 pGMuRXqgmsmraQiZHMwoYXKF2OWsKSwmX+rl8c1aic7BbMUzdSstV5ed1tq++BtYYg6rfq9hfAA
 1L/7dqkRioKNtuBsbb/gz5wvM0vS6OtRF5otXcGctembEX+fWSD2mGLfAcF8la96y/v762g2txd
 ZnQfex/b2H6DGcSQyTod8wJ9r+yc83rsAHdSkAm0WnZz/5X4jYTU7rX2E5/Jrqji7pEX1TYSvIk
 /s8AXQt+alLltdx1LEH/JuNt8tY3mxwI4Do4AQBeYcV8n5G9qYZvj2oAIDm/iuoAUynvmAjXwMe
 hQ7xwCOI5he42nWK4yjwGYgdTuau6Qu/AJWRJib182a2WSkoILCCB/ss9vJT0aenoEv3t
X-Google-Smtp-Source: AGHT+IHINhIqlUa7DCpDjHN+II+KrfU91sr0X+Nh9ajVLFRJzCxP8B8BUPyzTg89wGo0r7WtCvZq4Q==
X-Received: by 2002:ac8:5ed3:0:b0:4a6:c5ee:6ced with SMTP id
 d75a77b69052e-4a9dfe6c7eamr50950701cf.4.1752091216860; 
 Wed, 09 Jul 2025 13:00:16 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e4aaasm100432891cf.3.2025.07.09.13.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 13:00:11 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 16:00:03 -0400
Subject: [PATCH 4/9] rust: device: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-4-64308e7203fc@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091204; l=1197;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=ulVPEZq9Jbltpj5m+ZKcCOATlnirfkaWcJbMC12CGGQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKa+9W1qEMCIC5nwDM5pzqB0yrk8C6OiT/Eck8hVU2yYFOH0UcdQB5HSqXCLqIEzznx1uAPJMxt
 Yys2X7knfKQU=
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
2.50.0

