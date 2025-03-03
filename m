Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868D8A4B9B0
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B32110E377;
	Mon,  3 Mar 2025 08:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="G3ESn+6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AE310E377
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:45:52 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4399a5afcb3so35745295e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 00:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740991551; x=1741596351;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Yl6OXiLxc2DNrX6mWydkEen+W3a+U6q5HOC8/Fd7HQw=;
 b=G3ESn+6IfnpQ00uedpk3MtPMMN20xm7Z6fIe+vTL27zxDm18fZBeCNp9mmfxodW9h6
 Y5Zm0tJ+QjKLOQJa3Rsr8jNImQzb4u5kHYGCO62S5sLH09s0CLf3zupUqTBVM6gHo3Nk
 /4q+fGg9C9vxE2PZp5EZigi4nrdwqOqfj6hUJeAvIXDdo9oQLB3NqUuopJjb36mzh3hv
 FTvIevYYJ3qybKBtCwre2BPWyg9XcouOuU30yO3Vx+pRLq4WtaXFRQtScjJBFP4XldiS
 bTkvaqlQP2/Vq7RimFkM8RpF/B6es+f5wETQrMPLs1h/gU5RGIyY4M5XZcCqXoBZZ68s
 e8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740991551; x=1741596351;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yl6OXiLxc2DNrX6mWydkEen+W3a+U6q5HOC8/Fd7HQw=;
 b=rdW9Z9E9V4Lj6lDbzmMVeuYVJs+t1xys1gqTNPVht6q+Lj8e10SUbf80ZJ0rEErDMw
 KgyLMT1T64huaPmTki30viT7IsDZZVrRSOFJs/hqYn1MVfXnPx7N/SWUAGa5FGkSZzwO
 gr6UQ8fjuoFhJVH5Ie3BpRv1iebKF+xHclCyM5+wafQHtrbq3lMeKWtNyBT3AtSSKlGw
 f0OSzwIysaOacD8wtYtrNkGbbm7C4tkarDv/OhIxYRGd8GLgyJlHuMDw+yRhX1++ZLWQ
 qDabY9cqWmYXPEWeFp80dkI5ETYUpusMFaBIcT5n7yB/YkyWAgwY3FomXMHj9RUAA1fI
 CLLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6lVQFaEDTeuouFB5ZZL4+y6TF2hHz6nHMBU8PHaxJjdnaZsPWbb+7HEA6BrWln29NqCpi5tGOI8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcEMVJBbI8Q3wHnljMRHR1zj5pLcqBpvN7S2R3aMAMzwqg+ZkB
 do41TDF/bw0mw7CYmKfDaVdNFIT9UfDERKfKwmdgSDGxNncHEsDZ9+u3d5ILl1jQ9sw9qMQv8E/
 KIXhC474YgUUp0g==
X-Google-Smtp-Source: AGHT+IHTziRho0PdDiqY+w7INFWExFlSE+JgzgeyQW5xfAW6NBxpwCji0bm/eXLdqeaM8WMzyupzDJI8C6vUsII=
X-Received: from wmqe20.prod.google.com ([2002:a05:600c:4e54:b0:43b:c7e5:66e0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1990:b0:439:9b80:ca6f with SMTP id
 5b1f17b1804b1-43bad205987mr103494675e9.5.1740991551369; 
 Mon, 03 Mar 2025 00:45:51 -0800 (PST)
Date: Mon, 03 Mar 2025 08:45:13 +0000
In-Reply-To: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
Mime-Version: 1.0
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3689; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=GN9iRw4vP0biBC3qh1br1TYeqEjFY0JaW5FPcfgG69g=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnxWw1V7qzGAYepkGLB5056taWAfpA48W2E+6j7
 36pkLuCplKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8VsNQAKCRAEWL7uWMY5
 Rp0OD/0YxQOPsE7P9lwb5wr1WtaICm79Mv5E1VBseN+IJVPkRaMtI9PZOPMYl2nkkxIthFrBfB5
 VA9z7R/Ayu59wN8WJG0KaAP+4b6+Hf/7NK4Qja/DBtDxkgk7NBz4suJ1OIfC++krRwnTX1Sja+m
 W3tz69mVlP+mq3G4KB/KJ2krJ4m7nmpcQLxjnmyKbjhR4J6FQaYv6HOmelCuvKdkWJGFar4mhe4
 6JPThxK3D45Jmy5k5LnfYQaRNn1xB6IdprUAVEt85bp4HvqgSjMof/Cvv/+ygRmAHijGM6ikJnG
 eCQGzRajiTA5q6rWl1HC0EmbVELa4Wl8ytL5rj+N4RJBCCV9+n5SJeXFy0V3D/6VoY6qDbObxj7
 /y1pjasux7b8tEe3ffOrYqDKK3j+rx6rmzOuYs/Yuv2EnMMCIttl6GuxwQfkKfGXGJrYWrGRTRs
 iyFHvwo4C8MJEvQaG4P/wGwxyM2aSRD7MJoIh8neJFojUpASlc7g/zA+MfArJlfmeuP6ktX2SKv
 xSeAIu6RAEVXp2hC7SQJ2jKkt2GQw3RGvWKosp9L1Jl6kjxUUXV8F1wUTtYAcKB5/ovsh9tqORV
 opNlnGdFoiM4XyttGOBynM7Eq8Aci+A/UPofTC7lxRjHejSQjL98l136YwRA1Mi1eOOV9Bppl5d
 pjkjLpnriIPhq5Q==
X-Mailer: b4 0.14.1
Message-ID: <20250303-export-macro-v3-2-41fbad85a27f@google.com>
Subject: [PATCH v3 2/5] rust: macros: support additional tokens in quote!
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
 Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Alice Ryhl <aliceryhl@google.com>
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

This gives the quote! macro support for the following additional tokens:

* The = token.
* The _ token.
* The # token. (when not followed by an identifier)
* Using #my_var with variables of type Ident.

Additionally, some type annotations are added to allow cases where
groups are empty. For example, quote! does support () in the input, but
only when it is *not* empty. When it is empty, there are zero `.push`
calls, so the compiler can't infer the item type and also emits a
warning about it not needing to be mutable.

These additional quote! features are used by a new proc macro that
generates code looking like this:

	const _: () = {
	    if true {
	        ::kernel::bindings::#name
	    } else {
	        #name
	    };
	};

where #name has type Ident.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/macros/quote.rs | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
index 33a199e4f176..31b7ebe504f4 100644
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
@@ -136,6 +143,22 @@ macro_rules! quote_spanned {
         ));
         quote_spanned!(@proc $v $span $($tt)*);
     };
+    (@proc $v:ident $span:ident = $($tt:tt)*) => {
+        $v.push(::proc_macro::TokenTree::Punct(
+                ::proc_macro::Punct::new('=', ::proc_macro::Spacing::Alone)
+        ));
+        quote_spanned!(@proc $v $span $($tt)*);
+    };
+    (@proc $v:ident $span:ident # $($tt:tt)*) => {
+        $v.push(::proc_macro::TokenTree::Punct(
+                ::proc_macro::Punct::new('#', ::proc_macro::Spacing::Alone)
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
2.48.1.711.g2feabab25a-goog

