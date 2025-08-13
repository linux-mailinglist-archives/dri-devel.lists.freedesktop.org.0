Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891D8B24E7F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E559110E76F;
	Wed, 13 Aug 2025 15:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f2uf4pif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3516310E771;
 Wed, 13 Aug 2025 15:59:53 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4b109bd8b09so272471cf.2; 
 Wed, 13 Aug 2025 08:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755100792; x=1755705592; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4xZaci7KvfQ9cJKxtLL1F647IuetZqbfoBs69JfjggA=;
 b=f2uf4pif4V8hvEpbV4km42pLu17JRAShIA7eW9hnySa9FciPgNPzP+8MM51KcjUwUs
 Ef3CaBdFqQEM9hmjMTI6EOml7qTc5ZBz8DAmznLhH/vJmUcwqxhIBnbxUi/izMisdQvw
 4EACz6C9m+fvimDC8Kr0pJRW2ZIA/7Bqz8mCO1MTyv7h4VW9stL9XViYJu/qoYwOs7xy
 Rh8haJGB/GUEeOlOnGnwvgNnMe2uZWtSHu/oFIFyJhlvOlJ7r+wteLIQUS1QIaA8P/dE
 WlHs9a0/6tGP8bXrHuclSGtOQsfxhXvQfTzJ+HiFaTAkp+jAndxcajoy3EO5dLjk5YWy
 dhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100792; x=1755705592;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4xZaci7KvfQ9cJKxtLL1F647IuetZqbfoBs69JfjggA=;
 b=EWbr736Ma5mZ/evcdL6dkJnTmDgB98Uk0DWMgW+Y7ylc/6McMjLiaeNwKjTrxCrk1k
 RESkwY+wbmMtqdJjOi7vKzO0vqDnqnjQcIAHD5jnQhwUuD+dlRRfLK1eracyauekPo9J
 iaUxQsGJCTg0s8Olgh+EPOaGs/x2WdYkDTVtAo1xTExT/wULPilKLbNsq4+nH7zHr5tp
 EcNxu5q63wsy3b4gyhgWplPxrVZxejQuk4DcxX5KWRhqqetQdHolm7jd0+LgNf9x6Wti
 zI/Qeq9CcSjkaFa6oJ4+eAuvleYEur6CL/l/o7sR8ug6CIBHy5vOhq043iFQbIh41IIk
 N1NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuUIr/uiW0n8Y5TEw6AyVl+XyiSnkX9GI6fu3UA4G2PXzlw1QNopDEq08qInIuUFrQ/AsqU7Q2PUg=@lists.freedesktop.org,
 AJvYcCXyqS3aJzHQiEF/PqOeCJdY/KSHxNTSN0qGzVOhK3p+t8zXou7UCMdR2Q4REBPKk9mPMm6INk583w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhdDU8N0dwII9mZDf0q/WFo0Dx8XEwX5JkItaIXxVQ1pg6s0zX
 VIb8TgEMSv7m1+cfp78qofN+GuJoBxq0ypVZfveoV8KhsPjXp4vWnllT
X-Gm-Gg: ASbGnct0u42myCoTAU86B/5HgWh32KuLH0bDmVSpuEkwnfAY6lJ91KQzSV1UNKXY7Qd
 KCKWPaMloSjXmbx45JvJiJx/iFs5onkxdCHjILaQ4Jh0Ubc8gcHC8cal8JfGlkJZgj3mQQLnEJn
 /Bgn0dVT1pKqp5uht5WTAdfQsd0sLbMqpSy+hxqBlMCXoCuTg/QfCzZob7elCQ9VAVPivqSqmQj
 q4E7E/P7DBU+6AxixhjaGjPjTnVAvY8BoEz/k8zUdB9HLhtglM9MSqsDwD+Mxqt/vTLowy2kOuh
 mGfuIfJqJGE2wFp2Hg/BKFWMG8pbui3Pm77dBVQb7mHteXZeys3raSLX7gJE2aB4Bq81n/ab4wC
 udyLAiQawSzZRqNMOg4UTB1u/xEDjcj1EhlN6LQ+TaNZgSnqDHQiifInmax3kfn5blTLxJuJFWr
 2pMAab+cKlnBguVpr1yT1NeDOLCXH5
X-Google-Smtp-Source: AGHT+IGwyVF+jp+j/Dub7WGy29Shkca+ClbBDQ3S7nH/cS43Ir+wi1vGYs4X645d5o4aO3uUzcvYDg==
X-Received: by 2002:ac8:7c49:0:b0:4b0:80f1:8d48 with SMTP id
 d75a77b69052e-4b0fc8341aemr51857231cf.34.1755100791894; 
 Wed, 13 Aug 2025 08:59:51 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.08.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:59:51 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:59:19 -0400
Subject: [PATCH v2 09/19] rust: kunit: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-cstrings-v2-9-00be80fc541b@gmail.com>
References: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
In-Reply-To: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100760; l=5270;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=3ctZUWrM/ZFmDC33VBQrd7Y11Him7NQEHmNwBUrqlE0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKf/DdfqfaED3xwqY+++A2dwChPSjf3U7ItyFbVJ88ts9zWW6tRuEgZCnj3v561AZLUo2HTPEX6
 hlgrbpm3ZJAg=
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

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/kunit.rs        | 11 ++++-------
 rust/macros/kunit.rs        | 10 +++++-----
 scripts/rustdoc_test_gen.rs |  4 ++--
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 3a43886cc14e..6223a5ac801c 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -9,9 +9,6 @@
 use crate::fmt;
 use crate::prelude::*;
 
-#[cfg(CONFIG_PRINTK)]
-use crate::c_str;
-
 /// Prints a KUnit error-level message.
 ///
 /// Public but hidden since it should only be used from KUnit generated code.
@@ -22,7 +19,7 @@ pub fn err(args: fmt::Arguments<'_>) {
     #[cfg(CONFIG_PRINTK)]
     unsafe {
         bindings::_printk(
-            c_str!("\x013%pA").as_char_ptr(),
+            c"\x013%pA".as_char_ptr(),
             core::ptr::from_ref(&args).cast::<c_void>(),
         );
     }
@@ -38,7 +35,7 @@ pub fn info(args: fmt::Arguments<'_>) {
     #[cfg(CONFIG_PRINTK)]
     unsafe {
         bindings::_printk(
-            c_str!("\x016%pA").as_char_ptr(),
+            c"\x016%pA".as_char_ptr(),
             core::ptr::from_ref(&args).cast::<c_void>(),
         );
     }
@@ -60,7 +57,7 @@ macro_rules! kunit_assert {
                 break 'out;
             }
 
-            static FILE: &'static $crate::str::CStr = $crate::c_str!($file);
+            static FILE: &'static $crate::str::CStr = $file;
             static LINE: i32 = ::core::line!() as i32 - $diff;
             static CONDITION: &'static $crate::str::CStr = $crate::c_str!(stringify!($condition));
 
@@ -249,7 +246,7 @@ pub const fn kunit_case_null() -> kernel::bindings::kunit_case {
 /// }
 ///
 /// static mut KUNIT_TEST_CASES: [kernel::bindings::kunit_case; 2] = [
-///     kernel::kunit::kunit_case(kernel::c_str!("name"), test_fn),
+///     kernel::kunit::kunit_case(c"name", test_fn),
 ///     kernel::kunit::kunit_case_null(),
 /// ];
 /// kernel::kunit_unsafe_test_suite!(suite_name, KUNIT_TEST_CASES);
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index 81d18149a0cc..c64df1a01b9d 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -89,8 +89,8 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
     // unsafe extern "C" fn kunit_rust_wrapper_bar(_test: *mut ::kernel::bindings::kunit) { bar(); }
     //
     // static mut TEST_CASES: [::kernel::bindings::kunit_case; 3] = [
-    //     ::kernel::kunit::kunit_case(::kernel::c_str!("foo"), kunit_rust_wrapper_foo),
-    //     ::kernel::kunit::kunit_case(::kernel::c_str!("bar"), kunit_rust_wrapper_bar),
+    //     ::kernel::kunit::kunit_case(c"foo", kunit_rust_wrapper_foo),
+    //     ::kernel::kunit::kunit_case(c"bar", kunit_rust_wrapper_bar),
     //     ::kernel::kunit::kunit_case_null(),
     // ];
     //
@@ -109,7 +109,7 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
         writeln!(kunit_macros, "{kunit_wrapper}").unwrap();
         writeln!(
             test_cases,
-            "    ::kernel::kunit::kunit_case(::kernel::c_str!(\"{test}\"), {kunit_wrapper_fn_name}),"
+            "    ::kernel::kunit::kunit_case(c\"{test}\", {kunit_wrapper_fn_name}),"
         )
         .unwrap();
         writeln!(
@@ -119,7 +119,7 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
 #[allow(unused)]
 macro_rules! assert {{
     ($cond:expr $(,)?) => {{{{
-        kernel::kunit_assert!("{test}", "{path}", 0, $cond);
+        kernel::kunit_assert!("{test}", c"{path}", 0, $cond);
     }}}}
 }}
 
@@ -127,7 +127,7 @@ macro_rules! assert {{
 #[allow(unused)]
 macro_rules! assert_eq {{
     ($left:expr, $right:expr $(,)?) => {{{{
-        kernel::kunit_assert_eq!("{test}", "{path}", 0, $left, $right);
+        kernel::kunit_assert_eq!("{test}", c"{path}", 0, $left, $right);
     }}}}
 }}
         "#
diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
index c8f9dc2ab976..b0b70a3d0f54 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -174,7 +174,7 @@ pub extern "C" fn {kunit_name}(__kunit_test: *mut ::kernel::bindings::kunit) {{
     macro_rules! assert {{
         ($cond:expr $(,)?) => {{{{
             ::kernel::kunit_assert!(
-                "{kunit_name}", "{real_path}", __DOCTEST_ANCHOR - {line}, $cond
+                "{kunit_name}", c"{real_path}", __DOCTEST_ANCHOR - {line}, $cond
             );
         }}}}
     }}
@@ -184,7 +184,7 @@ macro_rules! assert {{
     macro_rules! assert_eq {{
         ($left:expr, $right:expr $(,)?) => {{{{
             ::kernel::kunit_assert_eq!(
-                "{kunit_name}", "{real_path}", __DOCTEST_ANCHOR - {line}, $left, $right
+                "{kunit_name}", c"{real_path}", __DOCTEST_ANCHOR - {line}, $left, $right
             );
         }}}}
     }}

-- 
2.50.1

