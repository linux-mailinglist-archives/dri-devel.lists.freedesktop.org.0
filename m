Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F17A49995
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 13:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0579B10EC92;
	Fri, 28 Feb 2025 12:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ox5WVdyx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB9C10EC90
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:40:13 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4399d2a1331so10801245e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 04:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740746412; x=1741351212;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=l3jVWPGGKqLCvuenpCukdw2BdIHWqKd1uEI4muVogSg=;
 b=ox5WVdyx6DuQ73+Z8ziYPO9dXILseMsO8jBr7oKc3QZCnZ7tC5C5P+ZKPeiGXgu6cH
 U9ogUXdx7NqfLJBDnxL79SXyI45XfTMEkEEo1IpD5OW/rxic31YweaByxQN/ycuD4vuA
 u+HiQ6aKiiUflDUVdw21sDInibIj5CsTcfnnLzYtKW86LWBGlP2dYdBAe6kTh9qibGX/
 ulkLBDErQzaA7ff1i8gZgsWymfisX8F69sFNGzD0Em3pIxk/1ww3JGOSBwqUlZeHLYIL
 s/OV0L1QLpV2e12h0ei3BkOUNyPIgCl8pbO6vCVhSynM5pgppQV0bLAdweFgQrB+JM6t
 la9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740746412; x=1741351212;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l3jVWPGGKqLCvuenpCukdw2BdIHWqKd1uEI4muVogSg=;
 b=FAw7lMud83BmUh7yd602k3KNJXl7m+B+SboLsM1QmWmCuMCoxhhaOtrLNPrybrHejm
 3NAqQlHcDZCOQdrjulW4SJj1z9wzWPlI9Xfpmhfsd8YIIZpNqdfcR+qmgTqW9GgvShDi
 6vNW1OmGtIvwjlD5ujeMFYySB9IYZEc3B8lVjwtB2ILGUBl0l130dTGZ9dxzpvAyoto7
 J6AQgiqBYTfkERCTwYIQi90ENEIHn04RqLCx8urLGZtRVhsszfgBgp0aGQ7OoR5Oy0JG
 mtriJFbj8ZnBTBjbFGZvO2wevoQe2v3F2BORQZAtVB/Zbsv1Por0n9IOhMTDbAgCm75L
 bpqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6jQ4mbi/cKfEzWiw99Abtm49/HhOz/B0AKN6CLEkbFTPgFgKz9x0B/iFvXOFlVsMyI+JQDZiXGlU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzUp9yF5CvzEPNdI8chIeCrOaOhwYU9GtyU4FxdWGhDazr5zi4
 dAZjQamArN5Xc0QDROCF8oMZ9o2pHu4lYe13HQnOv7O7KJHGR97GtlMLs5GgJXtymnvYwXy6SOp
 GCYj+aeqLdpDUaQ==
X-Google-Smtp-Source: AGHT+IGiO67Lsqlqu2zH4k6evB04PeH28TLpEEsqPRIVHE93/W85JAQLdE41QCH630255Ni8glO+u11+ewCTl8g=
X-Received: from wmsd10.prod.google.com ([2002:a05:600c:3aca:b0:439:9541:1cf5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c9f:b0:434:9e17:190c with SMTP id
 5b1f17b1804b1-43ba6188e94mr26636865e9.0.1740746412195; 
 Fri, 28 Feb 2025 04:40:12 -0800 (PST)
Date: Fri, 28 Feb 2025 12:39:32 +0000
In-Reply-To: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
Mime-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6541; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=5WVJDDoOMWVTToGZqS6EzXIOd2Gz+/3HoUezV/SekI8=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnwa6hUITYWJl/dPCaT3DkAHUJoqZpyVu6b2hRy
 /7EqajnYoyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8GuoQAKCRAEWL7uWMY5
 Rn6GD/9qthSYpENpEq926mPspcUYP5BVOc1VoMWtdTSk2Gbc6ytG9cgiVWr1qh6h0pis4Rlv6GE
 iCys28XgoAwtyPwUJyouL5vLN69zhjQ9A1bG5/7KdlWu+PQKpeQijeufFnt7VTAOceVE0soo3bm
 3UDNjaK/RMuBntw1pkOn7e2gXLdrlsGQEiMGQZTDaoWzKOYjtC7aUCzyJ53a2K0L64Zluk2+5in
 akMOnB5ywQbnvsWaf9ax7ZC7JA2k2jJxUq32ECwTd7qu4uoHqFaY7Shxryvxp8GCCioblbZPgo9
 NNOqSrDW4++cffxUog3Zfq0j81QgGUkio4nl6k5kJwsjdW38+79IkwkM3HgS+Rz8SeMvDvquLFQ
 XvD6OLEgRXVbnBfURzwDufAhpHElGq10OMT1txFrxc7RgQgpES+HqNZ33JsoMir2ROLhMgn0SAA
 2cAHKLJwlunm84rd7ZcPt9o+Glm/Ar0oUksZpbEOI5z+HNsgYF2jE/gg9fLzq+VkzWxKLnEzLGx
 ahs9Rlp4WfyhfriizEC0Dp1oHst/0VsBpOEJL7olDIl+WCAZ8hnlG6ABHeJ4B0sY12z31QFzICL
 73Mg4qh8RVEd0TlTS+ZKthzzkWyJx+bKVkddrJeRGkruXRN6cXuYeZO+Wpo4FXMpQxXzItHZuFa
 Mav3YeJON9IyQuQ==
X-Mailer: b4 0.14.1
Message-ID: <20250228-export-macro-v2-3-569cc7e8926c@google.com>
Subject: [PATCH v2 3/5] rust: add #[export] macro
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
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

Rust has two different tools for generating function declarations to
call across the FFI boundary:

* bindgen. Generates Rust declarations from a C header.
* cbindgen. Generates C headers from Rust declarations.

In the kernel, we only use bindgen. This is because cbindgen assumes a
cargo-based buildsystem, so it is not compatible with the kernel's build
system. This means that when C code calls a Rust function by name, its
signature must be duplicated in both Rust code and a C header, and the
signature needs to be kept in sync manually.

To eliminate this manual checking, introduce a new macro that verifies
at compile time that the two function declarations use the same
signature. The idea is to run the C declaration through bindgen, and
then have rustc verify that the function pointers have the same type.

The signature must still be written twice, but at least you can no
longer get it wrong. If the signatures don't match, you will get errors
that look like this:

error[E0308]: `if` and `else` have incompatible types
  --> <linux>/rust/kernel/print.rs:22:22
   |
21 | #[export]
   | --------- expected because of this
22 | unsafe extern "C" fn rust_fmt_argument(
   |                      ^^^^^^^^^^^^^^^^^ expected `u8`, found `i8`
   |
   = note: expected fn item `unsafe extern "C" fn(*mut u8, *mut u8, *mut c_void) -> *mut u8 {bindings::rust_fmt_argument}`
              found fn item `unsafe extern "C" fn(*mut i8, *mut i8, *const c_void) -> *mut i8 {print::rust_fmt_argument}`

It is unfortunate that the error message starts out by saying "`if` and
`else` have incompatible types", but I believe the rest of the error
message is reasonably clear and not too confusing.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/prelude.rs |  2 +-
 rust/macros/export.rs  | 28 ++++++++++++++++++++++++++++
 rust/macros/helpers.rs | 19 ++++++++++++++++++-
 rust/macros/lib.rs     | 24 ++++++++++++++++++++++++
 4 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index dde2e0649790..889102f5a81e 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -17,7 +17,7 @@
 pub use crate::alloc::{flags::*, Box, KBox, KVBox, KVVec, KVec, VBox, VVec, Vec};
 
 #[doc(no_inline)]
-pub use macros::{module, pin_data, pinned_drop, vtable, Zeroable};
+pub use macros::{export, module, pin_data, pinned_drop, vtable, Zeroable};
 
 pub use super::{build_assert, build_error};
 
diff --git a/rust/macros/export.rs b/rust/macros/export.rs
new file mode 100644
index 000000000000..c5ec75f2b07f
--- /dev/null
+++ b/rust/macros/export.rs
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::helpers::function_name;
+use proc_macro::TokenStream;
+
+/// Please see [`crate::export`] for documentation.
+pub(crate) fn export(_attr: TokenStream, ts: TokenStream) -> TokenStream {
+    let Some(name) = function_name(ts.clone()) else {
+        return "::core::compile_error!(\"The #[export] attribute must be used on a function.\");"
+            .parse::<TokenStream>()
+            .unwrap();
+    };
+
+    // This verifies that the function has the same signature as the declaration generated by
+    // bindgen. It makes use of the fact that all branches of an if/else must have the same type.
+    let signature_check = quote!(
+        const _: () = {
+            if true {
+                ::kernel::bindings::#name
+            } else {
+                #name
+            };
+        };
+    );
+
+    let no_mangle = "#[no_mangle]".parse::<TokenStream>().unwrap();
+    TokenStream::from_iter([signature_check, no_mangle, ts])
+}
diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
index 563dcd2b7ace..3e04f8ecfc74 100644
--- a/rust/macros/helpers.rs
+++ b/rust/macros/helpers.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use proc_macro::{token_stream, Group, TokenStream, TokenTree};
+use proc_macro::{token_stream, Group, Ident, TokenStream, TokenTree};
 
 pub(crate) fn try_ident(it: &mut token_stream::IntoIter) -> Option<String> {
     if let Some(TokenTree::Ident(ident)) = it.next() {
@@ -215,3 +215,20 @@ pub(crate) fn parse_generics(input: TokenStream) -> (Generics, Vec<TokenTree>) {
         rest,
     )
 }
+
+/// Given a function declaration, finds the name of the function.
+pub(crate) fn function_name(input: TokenStream) -> Option<Ident> {
+    let mut input = input.into_iter();
+    while let Some(token) = input.next() {
+        match token {
+            TokenTree::Ident(i) if i.to_string() == "fn" => {
+                if let Some(TokenTree::Ident(i)) = input.next() {
+                    return Some(i);
+                }
+                return None;
+            }
+            _ => continue,
+        }
+    }
+    None
+}
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index d61bc6a56425..fbb2860e991f 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -9,6 +9,7 @@
 #[macro_use]
 mod quote;
 mod concat_idents;
+mod export;
 mod helpers;
 mod module;
 mod paste;
@@ -174,6 +175,29 @@ pub fn vtable(attr: TokenStream, ts: TokenStream) -> TokenStream {
     vtable::vtable(attr, ts)
 }
 
+/// Export a function so that C code can call it via a header file.
+///
+/// Functions exported using this macro can be called from C code using the declaration in the
+/// appropriate header file. It should only be used in cases where C calls the function through a
+/// header file; cases where C calls into Rust via a function pointer in a vtable (such as
+/// `file_operations`) should not use this macro.
+///
+/// This macro has the following effect:
+///
+/// * Disables name mangling for this function.
+/// * Verifies at compile-time that the function signature matches the declaration in the header
+///   file.
+///
+/// You must declare the signature of the Rust function in a header file that is included by
+/// `rust/bindings/bindings_helper.h`.
+///
+/// This macro is *not* the same as the C macros `EXPORT_SYMBOL_*`, since all Rust symbols are
+/// currently automatically exported with `EXPORT_SYMBOL_GPL`.
+#[proc_macro_attribute]
+pub fn export(attr: TokenStream, ts: TokenStream) -> TokenStream {
+    export::export(attr, ts)
+}
+
 /// Concatenate two identifiers.
 ///
 /// This is useful in macros that need to declare or reference items with names

-- 
2.48.1.711.g2feabab25a-goog

