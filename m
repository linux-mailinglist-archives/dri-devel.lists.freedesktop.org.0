Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 504CCAFF247
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 22:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED4910E845;
	Wed,  9 Jul 2025 20:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Volt9ObW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E14410E83A;
 Wed,  9 Jul 2025 20:00:22 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4a818ed5b51so2439361cf.1; 
 Wed, 09 Jul 2025 13:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091221; x=1752696021; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3rr7kum/G/nAULUNosS1R0MI3pz7eHGGsFoITym/eH0=;
 b=Volt9ObW5kCeQNa5fT2b8o9sJHwJL8RBHvQyVaV1z6KAiP7aRpqIOi/GPIzaTLfIFr
 IBMT996xa6yIU0xPGrgQNCvZOhrWbVFPNp0YfZXvrzWTrQgEnM1t2BdFkkGn9S82Zdzn
 9MxL4Sy5MApgd2cv1M7f1jFR/HS8ZWAXthofYOI6k8DoTQ9+7WHZEa2piYOvCjaXS/fK
 qsXcS8JQkI+VWkkj7kLODfMApFvPV+V88Bt/UH0vVgxIREPIdnfuHMP6sPY83XMnkQGX
 S1219W06CpK8XDTeoNn5fisYrwxo92hkGrCUDjH/ZRu+Zd1bakOO6HkG6DXTNexggUxo
 l0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091221; x=1752696021;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3rr7kum/G/nAULUNosS1R0MI3pz7eHGGsFoITym/eH0=;
 b=EB1yQUBkkZMP7O0t7rRw7CM1QaLxI4X5diOkXttOUlPCD6wc8vtS4N+mj8f81zceI6
 Li7OODfsAFGA+mzBDmWSwkrrZuQI1968CoZYc3JDKr2Onwp40QgcUg6lXKeRnqyDHB/g
 JXBVaoUcVaiEIYxxTm7a3WKCxPEn/3KRnOaiUWTtUWIkXBDC4C9b9RdAQ8NAv2vm7zMU
 RmhclGrTB1/PsJB6e6pvXKXQWL7ZnLV+MiMi/jAjAJ74OLtFDvZ2plwV/QTPBztA2pBN
 8t1m50MMNBy7/grBWTaiku8ISQnjPxtruq2sadL03O203SXD2kyOn7VGhNwr+Ott6ndB
 l+eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3TJm2bFg56qaZ6S+RbSyMv3Ejy90a3E+S2h9gMHEVt8DuyVt1I+lClkEZf6P9ao5inshOUAmTALo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyko+lOPLgZ00LvQc/qkXtqqrjjloH6zBgW104YmD2/OnRLOAMy
 HWVGVc9zdfI5QkjbnAp0meH2xKHKso/Rv6UkgQtYr/5FTYQTyIABRqCT
X-Gm-Gg: ASbGnctW96ycv2K4lvKakXKsolAixlbEYT98Nya24yfIjdqsLt3X3E5o8MIGUcYLB0j
 jzJ7d1VG2jI5+3Kt7oA4/DMUY2BUcKlpatyJIBmylipqrFsX8RsOCXvtmUQCpcCIlccAR4EmO+/
 mDU42ZvVYzZnaEjOEZflT4s1zhKd35W3U2o6T2KIccOt8yRybe9YoxjzwVwmqk8InVH3FPxgbvl
 13fX0TrRphUKBXYuMiuPI3H3umvVgid/Sh3a0XV9SRErBaXcOY87pmwwQYJ+0kwpt6++MdY7BwG
 WV1dgZl5H4N0QCm7gyneZIcEGTpMQ1EP5ASMBscGzS/r9RgkJPSGBvXkrp8/ES4UqLv8/+0uP9V
 KaUTcgX/VmjNUb6BArn/GVu3brZ5kqsJvwLPviVGDr0Tk+EIp4DAytTRvuUjrZpc85VlS
X-Google-Smtp-Source: AGHT+IHHg0c+t7PcS+3SLZUCQQlteakNfLvuS4TrJUKLH/Ehgh1m2Du4UxQgJl6j6Cn1EU1mIUV/Ow==
X-Received: by 2002:ac8:7f82:0:b0:4a7:6e64:a52b with SMTP id
 d75a77b69052e-4a9ded2b6cemr59449811cf.35.1752091221128; 
 Wed, 09 Jul 2025 13:00:21 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e4aaasm100432891cf.3.2025.07.09.13.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 13:00:20 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 16:00:06 -0400
Subject: [PATCH 7/9] rust: pin-init: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-7-64308e7203fc@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091204; l=1231;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=lO+HeL2eu/d3sUZHMkD6tbdM5xVt9wOMLWuSlc9beR8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEj3UsVZA7yJvsG9Sf/euW2071ZaMoGYRu6rRKJC2mnsxsKdjYl8h5U1C3zmszzlF4gNgpuZ7vg
 aHxv7UnAQwAY=
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
 rust/kernel/init.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 8d228c237954..aa3fc90d32d1 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -68,7 +68,7 @@
 //!
 //! ```rust,ignore
 //! # #![allow(unreachable_pub, clippy::disallowed_names)]
-//! use kernel::{prelude::*, types::Opaque};
+//! use kernel::{fmt, prelude::*, types::Opaque};
 //! use core::{ptr::addr_of_mut, marker::PhantomPinned, pin::Pin};
 //! # mod bindings {
 //! #     #![allow(non_camel_case_types)]
@@ -81,7 +81,7 @@
 //! # trait FromErrno {
 //! #     fn from_errno(errno: core::ffi::c_int) -> Error {
 //! #         // Dummy error that can be constructed outside the `kernel` crate.
-//! #         Error::from(core::fmt::Error)
+//! #         Error::from(fmt::Error)
 //! #     }
 //! # }
 //! # impl FromErrno for Error {}

-- 
2.50.0

