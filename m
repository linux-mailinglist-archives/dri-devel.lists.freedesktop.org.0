Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EBDAFF245
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 22:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8F810E83A;
	Wed,  9 Jul 2025 20:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DQ5vGVj6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C9C10E848;
 Wed,  9 Jul 2025 20:00:21 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4a7a8c2b7b9so4364091cf.1; 
 Wed, 09 Jul 2025 13:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091220; x=1752696020; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p9gvM+VOG4hue7s4Ky/lEbwwDLRMvW9AGJejchy/jOM=;
 b=DQ5vGVj6EAVHOBK7lMNotcPFnmEJ3mOSal2xoEF3c0jywVyyFOY7TBb8cHLArFftbe
 /0p0FLhg3uOMJJqsD10VX7yWQeCN3eEUazEcegb8LM0Wthy2NhakXCOWhnCVCf34OXj+
 qxbPvIWpuYcEwbDsp/TlJmLARIQetpln9qVYWzWvtFwz8qeEklJ1HvDjzfSgBEsRXc3w
 +f0za6EU1Q0ctNj/UreHcKI+I7x4SOYBBf16I/8TCiUppwBeD/saOrxxcYTTko5OjHZU
 aTtJ4YGsSjGqXSraf9fzubOj6XnQAt1TRp4F2AX6ViZjWEHzY5lGQUuK9jgo7doBzsn4
 dFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091220; x=1752696020;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p9gvM+VOG4hue7s4Ky/lEbwwDLRMvW9AGJejchy/jOM=;
 b=NMpLA3N7Cg4GtPQuNT+RMldOsrkZ9aUH+yA3728vIrWzmpatLnxJTFYDfCB5VmM89D
 awrGF4Sqw6VrlHjSoRPMAc8va++X2wuytY8gfYTpBb4peKCTgdrlZVufuEUtIKUR3R75
 VF3HTyuCsDccri+hWhSjM4Oc9Ncs20DaQSk5J/j1tk8o4Nye6xUvgZaxKgYMR3QKNTSy
 8XRSl/PsbCuYtQMSaIm7RRDI5kV1NGcDOa27i/pxyweib/O1giX7DxULr36oMg347thu
 LDbIKlxKQPOKL3dbZc5rzT0cc0JNayIGDHFn20YR1ldOwJlwzjV4U2T2UBGdx7ZE1aox
 nfIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1d2j+6IX3AYEIujT+MgT3qlhkQlC3omIEF1ElTW9whGDVd8gjssoN3j4CKh8d0O4rwifXQzf8tV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVKg+P6f4N2ky437UpHjT+FXSBCxJUFYuyIUmp8ZDP8EtU3bpg
 RmU6ebU8OBYa1ZAAimOnN56olJBfutRsczFm/dwbMXc2tFtBDWdJH38n
X-Gm-Gg: ASbGnctYH1bbq9nrPi+/T4LhdoaVIsdRyaytpPsHaqxrIH1WgEOzPaXhCYQWJ3NH7B3
 L8vh3gMRBEAe4jJ6W4DXIH7oDeypO4CwoMUlAdLVAzs2kJNihTB0fN65dZzVdE8RK+I3+OfKsuG
 Rj3nJnPcFZk5iH5GSkGQ+Q1L5q5vspsCUbmi8meTkzDiwIsskZjb9brkjpOHXAWTCfuSqWGKgUa
 fbDjrYLR6ibJ823Bu/aIJSSIYucKI5LdUkcd16GoFIxHBR+OpLayzz1fP8Sq1dsmI6kETbSTc8T
 /ILrCKmdErB2/QmAO3ieSdZ1nP/dGvEonzAQlN9YhUH+uxkTClagqtSxvbf8JsiFe8PenGDoScm
 9wW3jHdc1qY2AjepNW9VW6XZs5vsxii2SpZ0I1Cn0lLmrnNGY0d/1ytG1fQ==
X-Google-Smtp-Source: AGHT+IEV3uvP3nZlQjYExvZaGVVAc/eGjPJZ4wwKG9Phg9SYpyUxlFMrIHpGAIniPkyndQlSY8PEkA==
X-Received: by 2002:a05:622a:28a:b0:4a6:f6e7:7214 with SMTP id
 d75a77b69052e-4a9ded3181cmr56018751cf.40.1752091219845; 
 Wed, 09 Jul 2025 13:00:19 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e4aaasm100432891cf.3.2025.07.09.13.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 13:00:19 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 16:00:05 -0400
Subject: [PATCH 6/9] rust: kunit: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-6-64308e7203fc@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091204; l=2424;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=E3Jjshiy+K/bIk1pDUs/GKMZc6MgTpr4XTzGbCjUqjI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMGCaFCwAxttwkIFLhFVYbmjGOfUVK9XNbhkbODW4/2lJ1th/MtbuO7FDjHiYWnHNdpL4n9Dn9F
 OTwod4TQmUw0=
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
 rust/kernel/kunit.rs        | 8 ++++----
 scripts/rustdoc_test_gen.rs | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 099a61bbb8f4..42498cb93f33 100644
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
index 1ca253594d38..507d36875196 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -201,7 +201,7 @@ macro_rules! assert_eq {{
     // This follows the syntax for declaring test metadata in the proposed KTAP v2 spec, which may
     // be used for the proposed KUnit test attributes API. Thus hopefully this will make migration
     // easier later on.
-    ::kernel::kunit::info(format_args!("    # {kunit_name}.location: {real_path}:{line}\n"));
+    ::kernel::kunit::info(fmt!("    # {kunit_name}.location: {real_path}:{line}\n"));
 
     /// The anchor where the test code body starts.
     #[allow(unused)]

-- 
2.50.0

