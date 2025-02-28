Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D08A4A724
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 01:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEFD10E0E2;
	Sat,  1 Mar 2025 00:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BOOHMNmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194F410ECD4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 15:26:20 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30a2cdb2b98so22332381fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 07:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740756378; x=1741361178; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQEzC2j8pg6sUrIixsw7/ei5GObidVE1c76DSZgQvMA=;
 b=BOOHMNmzd15eetMrQxK900fMXtPHYoLVqaU1ObDSCbjbDX0Zd/cPAhuzBGTrQ4K9pi
 9YGqztl5A2hTpbkUBJmT+sGyotKur7SVABr4dQztQCDyeNtY8r2xB2vqgZT2WEXcItTq
 QZhLYD+nPRON0PWuGJjPyONTTuEfPU921tb42sLNIcZr82piRqK7BBfR5dL/b0KJyabj
 t3ioqTcQOL0MkiRQ2hoAzLxQS4YgHiVujTfy4U4p+uetJceZqop+TYOrldTiQgFC0sS5
 msTybEcIUhm5hOd/YBSYIezemNxAle2gOL4t5CXRNhEEMt3pSUzwBZqLwAuP5ZnKueWu
 5upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740756378; x=1741361178;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sQEzC2j8pg6sUrIixsw7/ei5GObidVE1c76DSZgQvMA=;
 b=MLdIYqvKhJe0PTmVyL8WlnMyLI9Oc/dZ8QGexFzma1M+M95CBc/0HtcmkukOssYAdE
 YVRR3Q5TIPQ6yqc3dWKGc6vTAZUB/A6QL44tdqRnUiBnuLksZUWtBwQ+X7sAHMG4Smbp
 3RwiipsIbSCkNmBmNmscExAYhhmdn+1nOmoVJLPXIVKeFJDJIoMes4+A+flTJcdcrCn4
 C2Nu0/BvSTxuFY5cjkVhIKxsl7Jv7z0seutCtPO4O2A6umJUqg+bh2C7LyxGDdis8wqf
 IMcMYq0VLEmiu1S4ne+A83Ti+SeojofavR9vDUVhQ2CdNYCHEXUJLxqF7XHVeVm2wFvy
 PlAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPgog/qmNoVv/qPQF3ts3XtOV6kiSv8aCg8/wbh/rJbaKdg+iKar3gJoKLX67OHlDQ8xc1X70tXGo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhbG9JvEXtdHAixO1RnWbRErQBI9pH6+0xaKqsotyjLPSsbO3r
 TEbLDkfBX/V1T0Jidn8OmzZJSFmHXzLcrmfgl+Jq+tmkLl7J+abuDNaslQSo4QwzuXIxi5GcPps
 lrOyH2UNP3X3tsCvZvA2vIy5JB6g=
X-Gm-Gg: ASbGncuAX/IGHoykj68Z22+089SHjBUX2ajoUwFJ/G22gqT8S7UbxL6mHdyv1EnmlYo
 u2EUvAEGLqd5RWoaf6Pn1xqKh3VW99ZQ86NFQL5ZTunowNkJcI4qrnZDxIfGKpzRGSUII2SW3DV
 sa8XxhllmP3/BjKIIZHo2Pp3QeCr3xmOmvdYTALzYO
X-Google-Smtp-Source: AGHT+IEeeY1j83AEsNh8WhsygLXPj8O1jjT1aI0TaV+Ap8nu6lHEh2ES40t+f+bMf9+oSYWFTfFGKwhKrpXchbIKRa8=
X-Received: by 2002:a05:651c:2221:b0:30b:8ef2:161d with SMTP id
 38308e7fff4ca-30b9325a121mr16636211fa.18.1740756378205; Fri, 28 Feb 2025
 07:26:18 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-2-569cc7e8926c@google.com>
In-Reply-To: <20250228-export-macro-v2-2-569cc7e8926c@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 28 Feb 2025 10:25:40 -0500
X-Gm-Features: AQ5f1Jq4xHWMjB-Z0ayoaooc4oG9WsypYkgFp2QgRFRS7rFpCWPZvPbMiNGEReE
Message-ID: <CAJ-ks9nn1_gAqz9f3H9O47QA7dwk5MaT5YK3NQtZtUJHyNXbVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: macros: support additional tokens in quote!
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 01 Mar 2025 00:40:26 +0000
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

On Fri, Feb 28, 2025 at 7:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This gives the quote! macro support for the following additional tokens:
>
> * The =3D token.
> * The _ token.
> * Using #my_var with variables of type Ident.
>
> Additionally, some type annotations are added to allow cases where
> groups are empty. For example, quote! does support () in the input, but
> only when it is *not* empty. When it is empty, the compiler cannot infer
> the item type of `tokens`.
>
> These additional quote! features are used by a new proc macro that
> generates code looking like this:
>
>         const _: () =3D {
>             if true {
>                 ::kernel::bindings::#name
>             } else {
>                 #name
>             };
>         };
>
> where #name has type Ident.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/macros/quote.rs | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
> index 33a199e4f176..c18960a91082 100644
> --- a/rust/macros/quote.rs
> +++ b/rust/macros/quote.rs
> @@ -20,6 +20,12 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
>      }
>  }
>
> +impl ToTokens for proc_macro::Ident {
> +    fn to_tokens(&self, tokens: &mut TokenStream) {
> +        tokens.extend([TokenTree::from(self.clone())]);
> +    }
> +}
> +
>  impl ToTokens for TokenTree {
>      fn to_tokens(&self, tokens: &mut TokenStream) {
>          tokens.extend([self.clone()]);
> @@ -40,7 +46,7 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
>  /// `quote` crate but provides only just enough functionality needed by =
the current `macros` crate.
>  macro_rules! quote_spanned {
>      ($span:expr =3D> $($tt:tt)*) =3D> {{
> -        let mut tokens;
> +        let mut tokens: ::std::vec::Vec<::proc_macro::TokenTree>;
>          #[allow(clippy::vec_init_then_push)]
>          {
>              tokens =3D ::std::vec::Vec::new();
> @@ -65,7 +71,8 @@ macro_rules! quote_spanned {
>          quote_spanned!(@proc $v $span $($tt)*);
>      };
>      (@proc $v:ident $span:ident ( $($inner:tt)* ) $($tt:tt)*) =3D> {
> -        let mut tokens =3D ::std::vec::Vec::new();
> +        #[allow(unused_mut)]

It'd be nice to mention the need for this attribute in the commit
message along with the added type annotations.

> +        let mut tokens =3D ::std::vec::Vec::<::proc_macro::TokenTree>::n=
ew();
>          quote_spanned!(@proc tokens $span $($inner)*);
>          $v.push(::proc_macro::TokenTree::Group(::proc_macro::Group::new(
>              ::proc_macro::Delimiter::Parenthesis,
> @@ -136,6 +143,16 @@ macro_rules! quote_spanned {
>          ));
>          quote_spanned!(@proc $v $span $($tt)*);
>      };
> +    (@proc $v:ident $span:ident =3D $($tt:tt)*) =3D> {
> +        $v.push(::proc_macro::TokenTree::Punct(
> +                ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing::A=
lone)
> +        ));
> +        quote_spanned!(@proc $v $span $($tt)*);
> +    };
> +    (@proc $v:ident $span:ident _ $($tt:tt)*) =3D> {
> +        $v.push(::proc_macro::TokenTree::Ident(::proc_macro::Ident::new(=
"_", $span)));
> +        quote_spanned!(@proc $v $span $($tt)*);
> +    };
>      (@proc $v:ident $span:ident $id:ident $($tt:tt)*) =3D> {
>          $v.push(::proc_macro::TokenTree::Ident(::proc_macro::Ident::new(=
stringify!($id), $span)));
>          quote_spanned!(@proc $v $span $($tt)*);
>
> --
> 2.48.1.711.g2feabab25a-goog

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
