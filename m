Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4A8A48609
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 18:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63E310EB44;
	Thu, 27 Feb 2025 17:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="neqSHVKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C855E10EB41
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 17:02:43 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-43ab5baf62cso9286035e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 09:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740675762; x=1741280562;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=42C/cfETiu38SYicrBEGEovTzMG6FpVCMB243TZ2o6c=;
 b=neqSHVKnUsDmij7yhZqKUQCf0JXhnL0X7IgdnCWDRIbIi/H3km++lLsV9CWN1CGgA0
 2m8X5T+G+zyWt5B90wipJnmSoJ35porvVO9a1ZX3CyWkgu6bcfV0NIlFaeZhwsoufCOd
 ijXdjjMjvvjXYS2C/s/dcBI32u86v3l1hC+QDia+2HUoIu4uW+vitCsKa+wDvJSTq2lw
 I2+Kx3YwSqWsYmLnVUWZtvwnzJxLDHVJrDU/alEThFRvtbohPOi67Mwwoc84UUlqvTmO
 +2fu7c2CZpIRpYhwdrbvFdTmamglSuKjvvhFN//WzgTBxF1UUzi3xgsZKGGsb+LPz6KC
 320A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740675762; x=1741280562;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=42C/cfETiu38SYicrBEGEovTzMG6FpVCMB243TZ2o6c=;
 b=aGcjSj500gBJp5cd6H9aAh2v9BDMZ+yJVgaOBxQCfN0uAtLP3m//16DLZxUzixN3pd
 6sJztmxjirnaoArS7EWPOW0f4IOxn9p1Q2rTINDyeNzj0hkeoipSQHgLEmcoqi3EQcfM
 a71L7pLKGMCdfRDIM2+i90ixrtpjXJ65OYH2vzcpaSTbEA/oGa11Iqa2J3u4o3eVKhHW
 XIlLBQrqRMlvTSzhA4Xgj/FcxJ9+JVoYbQoOQIvL7yjOjM9ZiR9nOEDXvhxljrHB4Ecg
 R4K87Dwdkaj5iJtBbX/2jRNG0685flFn7WbUIKIvLHtIK36WbGnfI3O6+zsZdPZjJx1v
 mMrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCYi9SQNKjzBnBG/bZLyWC28XS723nN23aYZhEuhrsXoYSVQKIqorp7Yy7Zf0HuS+8LVGNJUr3Cco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwS7O0fbELnytVXntK10QBCQfRp2uKr1PYTjBqTpIubx/ywN78G
 AB1MQEzO1hOad7/uEr/gOJV81O09vKOqj+BaFjzO6zU/ycsA6yy2CPYzqMFLDMINCDJOr7uvYqv
 vYcSy13uyL8f3MA==
X-Google-Smtp-Source: AGHT+IFzLINQM/tozG5T/bypCONq44msz+BgD8zzYBfO02beaTjZ1yBkcJrZzgdsFFs0KxwRXhAakR4lmalPgDY=
X-Received: from wmbek12.prod.google.com
 ([2002:a05:600c:3ecc:b0:439:948d:4146])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:548f:b0:439:9274:81dd with SMTP id
 5b1f17b1804b1-43ab8fd1f3amr63472185e9.1.1740675762400; 
 Thu, 27 Feb 2025 09:02:42 -0800 (PST)
Date: Thu, 27 Feb 2025 17:02:00 +0000
In-Reply-To: <20250227-export-macro-v1-0-948775fc37aa@google.com>
Mime-Version: 1.0
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7286; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=TeIglh23ISS4+Bdf8fwiVWAv4hzE5dSrVK2+5fzc9Q4=; 
 b=owEBbAKT/ZANAwAKAQRYvu5YxjlGAcsmYgBnwJqqKr8/onOvuGjaOiYUGmqozHC77FCgBSok4
 nPET3stwHaJAjIEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8CaqgAKCRAEWL7uWMY5
 RitPD/df0G8ivb0s8H1GZAyBpLj9Ic/1m5Re3XwiQcTT1V21Xh3S4Lvjue6PX/niFQsEJYdCofH
 kQDXIyYLK+u2jF7/IJ15TuvhMuSgZWuReLcazWLkvCU5bR7DXejkkfUxpMWngszVyo5Hy9/fdiS
 NLpxymgICMdUuomMdfTHaGLmhD2Z3B30Le9kQLo2DNkf108z9nFXGaPdy006lQnd0n6xyao8Mf5
 LAo7oTuYw3kFAXPMBKyZGgWx/Y6cv9iD/3kBd6PQofrEbL7bITBQZulZ1VQEM+3lTnvmoz3AaHy
 HRxqJulYVZ2VKpMrOBQhbqLyKS0SzZ/D3LuwoOvhCzka2yNUxqyAjWVG1ls6JYCEqySN53mvkNy
 Ihtmwng10x2KiOFZtY7PGzNZKufO1+iIfJbc8BeiSvvYa6pmQoh79cO0FeRqkM2fjgzVcD39BDq
 LPYIlAJ2i1hVaRulVaj5Z+6Jq19XnPqNTfnn/YvkGFhw51yv6WsuGi6zRMMpuLhfWzkcpVDEOk1
 tY5nLAftB3kFq2IGMfXHov2BEIWgzrORXG1keq7ij50N1Sf/zdL5hyRuVOsZ/hR0QH3hPR4PGXj
 ndhAjBFXZPqL10srqO8k/iuLFIwCweZ6UrLnJde0Ho/vv3rmhRAnAzElmOz5Iz4vffvRnaItlVn
 hOS4J2pFaD/02
X-Mailer: b4 0.14.1
Message-ID: <20250227-export-macro-v1-2-948775fc37aa@google.com>
Subject: [PATCH 2/4] rust: add #[export] macro
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

This macro behaves like #[no_mangle], but also performs an assertion
that the Rust function has the same signature as what is declared in the
C header.

If the signatures don't match, you will get errors that look like this:

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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/prelude.rs |  2 +-
 rust/macros/export.rs  | 25 +++++++++++++++++++++++++
 rust/macros/helpers.rs | 19 ++++++++++++++++++-
 rust/macros/lib.rs     | 18 ++++++++++++++++++
 rust/macros/quote.rs   | 21 +++++++++++++++++++--
 5 files changed, 81 insertions(+), 4 deletions(-)

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
index 000000000000..3398e1655124
--- /dev/null
+++ b/rust/macros/export.rs
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::helpers::function_name;
+use proc_macro::TokenStream;
+
+pub(crate) fn export(_attr: TokenStream, ts: TokenStream) -> TokenStream {
+    let Some(name) = function_name(ts.clone()) else {
+        return "::core::compile_error!(\"The #[export] attribute must be used on a function.\");"
+            .parse::<TokenStream>()
+            .unwrap();
+    };
+
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
index d61bc6a56425..3cbf7705c4c1 100644
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
@@ -174,6 +175,23 @@ pub fn vtable(attr: TokenStream, ts: TokenStream) -> TokenStream {
     vtable::vtable(attr, ts)
 }
 
+/// Export a function so that C code can call it.
+///
+/// This macro has the following effect:
+///
+/// * Disables name mangling for this function.
+/// * Verifies at compile-time that the function signature matches what's in the header file.
+///
+/// This macro requires that the function is mentioned in a C header file, and that the header file
+/// is included in `rust/bindings/bindings_helper.h`.
+///
+/// This macro is *not* the same as the C macro `EXPORT_SYMBOL*`, since all Rust symbols are
+/// currently automatically exported with `EXPORT_SYMBOL_GPL`.
+#[proc_macro_attribute]
+pub fn export(attr: TokenStream, ts: TokenStream) -> TokenStream {
+    export::export(attr, ts)
+}
+
 /// Concatenate two identifiers.
 ///
 /// This is useful in macros that need to declare or reference items with names
diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
index 33a199e4f176..c18960a91082 100644
--- a/rust/macros/quote.rs
+++ b/rust/macros/quote.rs
@@ -20,6 +20,12 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
     }
 }
 
+impl ToTokens for proc_macro::Ident {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.extend([TokenTree::from(self.clone())]);
+    }
+}
+
 impl ToTokens for TokenTree {
     fn to_tokens(&self, tokens: &mut TokenStream) {
         tokens.extend([self.clone()]);
@@ -40,7 +46,7 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
 /// `quote` crate but provides only just enough functionality needed by the current `macros` crate.
 macro_rules! quote_spanned {
     ($span:expr => $($tt:tt)*) => {{
-        let mut tokens;
+        let mut tokens: ::std::vec::Vec<::proc_macro::TokenTree>;
         #[allow(clippy::vec_init_then_push)]
         {
             tokens = ::std::vec::Vec::new();
@@ -65,7 +71,8 @@ macro_rules! quote_spanned {
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident ( $($inner:tt)* ) $($tt:tt)*) => {
-        let mut tokens = ::std::vec::Vec::new();
+        #[allow(unused_mut)]
+        let mut tokens = ::std::vec::Vec::<::proc_macro::TokenTree>::new();
         quote_spanned!(@proc tokens $span $($inner)*);
         $v.push(::proc_macro::TokenTree::Group(::proc_macro::Group::new(
             ::proc_macro::Delimiter::Parenthesis,
@@ -136,6 +143,16 @@ macro_rules! quote_spanned {
         ));
         quote_spanned!(@proc $v $span $($tt)*);
     };
+    (@proc $v:ident $span:ident = $($tt:tt)*) => {
+        $v.push(::proc_macro::TokenTree::Punct(
+                ::proc_macro::Punct::new('=', ::proc_macro::Spacing::Alone)
+        ));
+        quote_spanned!(@proc $v $span $($tt)*);
+    };
+    (@proc $v:ident $span:ident _ $($tt:tt)*) => {
+        $v.push(::proc_macro::TokenTree::Ident(::proc_macro::Ident::new("_", $span)));
+        quote_spanned!(@proc $v $span $($tt)*);
+    };
     (@proc $v:ident $span:ident $id:ident $($tt:tt)*) => {
         $v.push(::proc_macro::TokenTree::Ident(::proc_macro::Ident::new(stringify!($id), $span)));
         quote_spanned!(@proc $v $span $($tt)*);

-- 
2.48.1.658.g4767266eb4-goog

