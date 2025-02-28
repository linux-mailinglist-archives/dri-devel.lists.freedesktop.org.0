Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15B6A49994
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 13:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22BE10EC90;
	Fri, 28 Feb 2025 12:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="On5MA0JI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FEF10EC88
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:40:11 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-43998ec3733so11289925e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 04:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740746410; x=1741351210;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ihZxooYknzT0g7MIwrtZdZDoHsnETfvcwFPVB5oE20g=;
 b=On5MA0JIcTLZ4+tuONdwLmk9neBbR/Hsaval9/v5tEZSAPh9Xigaa9WO0dKZf3M4eN
 DHxFoYv4cxhN9mcGBpr2FH3qNTYw1x6jO5xaMdcyV7EymKD5YpRlOrpcWX/3wafn+24w
 VZMOP+eH7U5zQkJxnNtJx/7dqTsTi6oitW40A82g+qMGGfGBNXhf1+7Ny0lzDcC6xjTC
 cQHJSQ0mUDJOLEKdtGX4MgB3d3SedkjTUnaMCS217IjBd/KJT74+uT5SN2SWVw+NwUhm
 2Y74PyxJPf4urC4a8eKQuWgp8m/md+QE+/UpytktF4ywh4UdJa609O24i5/vzKuMSe8G
 wNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740746410; x=1741351210;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ihZxooYknzT0g7MIwrtZdZDoHsnETfvcwFPVB5oE20g=;
 b=TFUdEcQ5XS/P1EexQak0GvfHvmfYpCu76YH9TBQ5q17pB9YkCwAo1fSIOrJLaAMiRm
 wef9rrRviwj+QL3CecXK+L04LjRDeP3AeQi9NSOGvEiDdmsyOe7lmx1TloRurmJ9JWMs
 rITX9whWZJ+nImLzPN4oJAT/T4OXb9JT6v/IFi4nfXxqugoLAkypbF1qcTpiKqC4yb2h
 4112ARVYu/tv071Yf9MJ3szFALDYt52o6O1ewfcRGDcGROjeuc/m/lMoenCoCv145scl
 wdDRHPEZzJZEEnNagY/waUxfBHgVcBF2VkJu3u2XRFUrqNBz+9kY45auydsucoiZBmm6
 t5Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoJFXPzKca++W9NPJYHQTUmKPjk4GgkOhNUFaeVTWTDPB3v5UV8cKMJ6Eek24tbP/SMhbue8vMTPY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9zLjmq8qYk7uKSOfqqs1oEObSiGqBrRDY5tMBkm5ZWakj+WTp
 mssWiMyR50eC4vPH3XkeukB12Xf6qvjJdd/9PdsVG7VEHkkVsdlQm3H37T8nVMi3PGmepo+ifZL
 zaoKLz+cPLMj2iA==
X-Google-Smtp-Source: AGHT+IGMEITDLjU4ASlaZS6GD8Wn7exwSBzOaUHr7x/3v0wRj0xk5+dqwptvCzuTjq4s4FptkTDfbSPgA1O7jVk=
X-Received: from wmbjg14.prod.google.com
 ([2002:a05:600c:a00e:b0:439:942c:b180])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a03:b0:439:9b19:9e2d with SMTP id
 5b1f17b1804b1-43ba6702becmr29268005e9.16.1740746410006; 
 Fri, 28 Feb 2025 04:40:10 -0800 (PST)
Date: Fri, 28 Feb 2025 12:39:31 +0000
In-Reply-To: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
Mime-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3131; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=2kxCqgatimm9DkO+86c5Mx3XyGNaZZFNb0jwXIeUduQ=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnwa6gi4HcYLwOcjP1+4ywczOPXPU6Ct2zzIOxr
 Bd2hpe101yJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8GuoAAKCRAEWL7uWMY5
 RpM/D/4hjhqbZcF9DblDJ2gtwYChZ7TjKidwXbqaZS2uFBN1bIFeweV0YoVoeZcFHADd8cv7bfs
 Ub11cChO1fW+ZTL0mjSIyMS040tnKhjG6eRgkq2emew0vBTo8K1FVrJYcTQIA0HJMfogwOWexr8
 oA/kxR+bUlhTOJn1fXdositwbuiBsu+2ZDkkeocob8oFDkfgsGoctAU30UKauDwdE2HNAytT2TS
 7eGXelDyCe2HCYBuY7N2f1j/sInwm+eudSi+6jJynDQUg0RNUrGYmTb1zPrX6AZN8jeAMfsegQY
 zpw3e3lIYu/augysePE1HG95uNFNL9fYvh8jFr72nuLlP7qtpu3/fcB3wpHhxcSkv+lyG9Cpjbu
 alfvEgF26SVpdND0F5ng4XtNROT/ZLKYOnUPJLHrroAO3N5m0dvhfu1/D164xIzvZymhyeEByiF
 x3rYz8qQNqJOvypQ2PpcTciMJshzHlraOEoMtpONn7C1Dnk6nG8tSNquB9ffhF9xhY8yGajyNKV
 uJck4NUgxNadRWg4JrHJS/X5uSChoHCZmqsG0028wjlDhRGu/B3dvBOhRrhFWX4kpVbxTqyK3Os
 01jSp9gEmFWSGRJhaJROwxY88GQyKPhXJkqTlFZMyW/lq+4ypr52F/jJcmp3V/S+L9/O5uSKxhJ
 0wTtrurvO1EjnWA==
X-Mailer: b4 0.14.1
Message-ID: <20250228-export-macro-v2-2-569cc7e8926c@google.com>
Subject: [PATCH v2 2/5] rust: macros: support additional tokens in quote!
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

This gives the quote! macro support for the following additional tokens:

* The = token.
* The _ token.
* Using #my_var with variables of type Ident.

Additionally, some type annotations are added to allow cases where
groups are empty. For example, quote! does support () in the input, but
only when it is *not* empty. When it is empty, the compiler cannot infer
the item type of `tokens`.

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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/macros/quote.rs | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

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
2.48.1.711.g2feabab25a-goog

