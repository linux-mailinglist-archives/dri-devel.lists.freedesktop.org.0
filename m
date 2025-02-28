Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775AFA4945B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11ACD10EC21;
	Fri, 28 Feb 2025 09:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="r0T43hf8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596E110EC26
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:04:25 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-390effd3e85so384837f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 01:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740733464; x=1741338264;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3OHkCovGrXR3vNs/yhb/RhCLokYtfuYeJvX5KaS2+hM=;
 b=r0T43hf8WtCx1j2XpD2os8I+bZ0sZuZo+gJw6cdJ7+zDMF+gitS9aG+QdQNFJZuYdE
 hG8vCgAFUirYKYvLL7KQO/zBqpay56BuH78vHpD462CjapPYNXDl3dyD+XLSJmDPQn/f
 MfpySEeDyssRNYpg+lm3iIGkaBKMJbu8YsZHDeEo4G2gFLkYxn4+Hm8tBtkTR8kM66Pu
 ilMl8vCA5tss/SQhiMxV3HTiG2qgMigtHCoJH1fGIdfhVMp/l1FdbjvYaUGHH0TtNzqA
 LM2Oe6LJFmN9cN6rHzcOqyHdSoo5ONxMRZTQ3R8kcNigEglBNy5J0wWExXQcBBZogzNd
 C/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740733464; x=1741338264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3OHkCovGrXR3vNs/yhb/RhCLokYtfuYeJvX5KaS2+hM=;
 b=AzHzNQdy6KVKsBJHmCNy4ZEH8f856FwmS5+qYuH6x1ATbC74VaVrK5cEutMJdWyD9Y
 CqLhAUtfKL5skqvaSmIMgLB9is2vEoFTR9RHaEI4C2DhwdYvD1RC1fjClLJK3LCL5+0i
 AHGT1foeez6mLd3hYS6bInIpVRWBApPbXNu+BUHynx+ZYv2YNYtwZfymVOGoakgmKpln
 BMUTxD1ZvCMgvKLHYuuWPxcknMWNvYFHGgCuQaV251wa9CfbA+byI5dGbz3xWfKfDMaQ
 y9MDURVBcPPkSJOFvJrC/8n/ad3w4ty7LuDL2tBepbVu98IFrPaHnvbsQLO15BQ0RDZ2
 eZZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVprtGF11WjxX5t9aGreSAwPk9U754bfftTVOj5SKAhWSzClzyNsztrD+Geb4CorjPeZm961zOzalQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW+nYq+7lU10Yov+l3TUxm9fAslYztLywsOYfJ7tYC1TdDDAaG
 GcUQkibtraioFYgglrGLHa0EV4vIuoES9qh6ApVPspYmM7KqGAjBFDeo3xGv2idyN2RJRq91wsK
 aXMaiEY4q+WsPJSvwB6Mr/T+hsUSoIGLDTw1V
X-Gm-Gg: ASbGncvz60Skil3FK+XjbWDupUMuSjfTrh1jzcNv9RfYWl39Q22sRE8Ee5JCfo/xW7P
 K/wvgwbnhbAnSkXGKf23q6Oz/IdDv/T8u75TboGP5q9cbvN3b7Oi1h0oy0GNtgEnXAeqQ6iFZoi
 QTKjt6E5C8KazUd87foeKqq7soGWxXHsWh90Pm
X-Google-Smtp-Source: AGHT+IHcheD4qjv4BV/CfpHVEIEjQTXsfvTUtOfeoZIL8CBuhYu/S1nosBYnS5BciMEwb5jNY7POkL8qlUxyXbG2sPs=
X-Received: by 2002:a05:6000:144b:b0:385:f7d9:99f5 with SMTP id
 ffacd0b85a97d-390eca63b71mr1942575f8f.51.1740733463613; Fri, 28 Feb 2025
 01:04:23 -0800 (PST)
MIME-Version: 1.0
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
 <CKneQ3Au7Fx5Uc7AM_RTi5BXRNnOUcrfnqI0fuWO5M7QIosWye4LhdM7bf9zqqzC5dCISrLHE9OgvVeVSla54Q==@protonmail.internalid>
 <20250227-export-macro-v1-2-948775fc37aa@google.com>
 <871pvipjxe.fsf@kernel.org>
In-Reply-To: <871pvipjxe.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 10:04:11 +0100
X-Gm-Features: AQ5f1JoJhUzxkrKlJTdjR0yIGZyICCE2ZXFseogh0kdUyKEZhUpa7ALlmGCwpTw
Message-ID: <CAH5fLggu+-Fw-4Z02xS3qSdhJAcSyNXaMn+CQ0XkBvqvgeAbGQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] rust: add #[export] macro
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Feb 28, 2025 at 9:20=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > This macro behaves like #[no_mangle], but also performs an assertion
> > that the Rust function has the same signature as what is declared in th=
e
> > C header.
> >
> > If the signatures don't match, you will get errors that look like this:
> >
> > error[E0308]: `if` and `else` have incompatible types
> >   --> <linux>/rust/kernel/print.rs:22:22
> >    |
> > 21 | #[export]
> >    | --------- expected because of this
> > 22 | unsafe extern "C" fn rust_fmt_argument(
> >    |                      ^^^^^^^^^^^^^^^^^ expected `u8`, found `i8`
> >    |
> >    =3D note: expected fn item `unsafe extern "C" fn(*mut u8, *mut u8, *=
mut c_void) -> *mut u8 {bindings::rust_fmt_argument}`
> >               found fn item `unsafe extern "C" fn(*mut i8, *mut i8, *co=
nst c_void) -> *mut i8 {print::rust_fmt_argument}`
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/prelude.rs |  2 +-
> >  rust/macros/export.rs  | 25 +++++++++++++++++++++++++
> >  rust/macros/helpers.rs | 19 ++++++++++++++++++-
> >  rust/macros/lib.rs     | 18 ++++++++++++++++++
> >  rust/macros/quote.rs   | 21 +++++++++++++++++++--
> >  5 files changed, 81 insertions(+), 4 deletions(-)
> >
> > diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> > index dde2e0649790..889102f5a81e 100644
> > --- a/rust/kernel/prelude.rs
> > +++ b/rust/kernel/prelude.rs
> > @@ -17,7 +17,7 @@
> >  pub use crate::alloc::{flags::*, Box, KBox, KVBox, KVVec, KVec, VBox, =
VVec, Vec};
> >
> >  #[doc(no_inline)]
> > -pub use macros::{module, pin_data, pinned_drop, vtable, Zeroable};
> > +pub use macros::{export, module, pin_data, pinned_drop, vtable, Zeroab=
le};
> >
> >  pub use super::{build_assert, build_error};
> >
> > diff --git a/rust/macros/export.rs b/rust/macros/export.rs
> > new file mode 100644
> > index 000000000000..3398e1655124
> > --- /dev/null
> > +++ b/rust/macros/export.rs
> > @@ -0,0 +1,25 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +use crate::helpers::function_name;
> > +use proc_macro::TokenStream;
> > +
> > +pub(crate) fn export(_attr: TokenStream, ts: TokenStream) -> TokenStre=
am {
>
> This function is documented in macros/lib.rs. Could you insert a
> docstring with a link to the function that carries the docs?

These functions are not visible in the docs, and no other macro does that.

> Please describe how the function operates and what mechanics it uses to
> achieve its goal in a implementation detail comment.
>
> > +    let Some(name) =3D function_name(ts.clone()) else {
> > +        return "::core::compile_error!(\"The #[export] attribute must =
be used on a function.\");"
> > +            .parse::<TokenStream>()
> > +            .unwrap();
> > +    };
> > +
> > +    let signature_check =3D quote!(
> > +        const _: () =3D {
> > +            if true {
> > +                ::kernel::bindings::#name
> > +            } else {
> > +                #name
> > +            };
> > +        };
> > +    );
> > +
> > +    let no_mangle =3D "#[no_mangle]".parse::<TokenStream>().unwrap();
> > +    TokenStream::from_iter([signature_check, no_mangle, ts])
> > +}
> > diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
> > index 563dcd2b7ace..3e04f8ecfc74 100644
> > --- a/rust/macros/helpers.rs
> > +++ b/rust/macros/helpers.rs
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >
> > -use proc_macro::{token_stream, Group, TokenStream, TokenTree};
> > +use proc_macro::{token_stream, Group, Ident, TokenStream, TokenTree};
> >
> >  pub(crate) fn try_ident(it: &mut token_stream::IntoIter) -> Option<Str=
ing> {
> >      if let Some(TokenTree::Ident(ident)) =3D it.next() {
> > @@ -215,3 +215,20 @@ pub(crate) fn parse_generics(input: TokenStream) -=
> (Generics, Vec<TokenTree>) {
> >          rest,
> >      )
> >  }
> > +
> > +/// Given a function declaration, finds the name of the function.
> > +pub(crate) fn function_name(input: TokenStream) -> Option<Ident> {
>
> It would be great with a few tests for this function.

I don't think we have a mechanism for tests in the macro crate?

> > +    let mut input =3D input.into_iter();
> > +    while let Some(token) =3D input.next() {
> > +        match token {
> > +            TokenTree::Ident(i) if i.to_string() =3D=3D "fn" =3D> {
> > +                if let Some(TokenTree::Ident(i)) =3D input.next() {
> > +                    return Some(i);
> > +                }
> > +                return None;
> > +            }
> > +            _ =3D> continue,
> > +        }
> > +    }
> > +    None
> > +}
> > diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> > index d61bc6a56425..3cbf7705c4c1 100644
> > --- a/rust/macros/lib.rs
> > +++ b/rust/macros/lib.rs
> > @@ -9,6 +9,7 @@
> >  #[macro_use]
> >  mod quote;
> >  mod concat_idents;
> > +mod export;
> >  mod helpers;
> >  mod module;
> >  mod paste;
> > @@ -174,6 +175,23 @@ pub fn vtable(attr: TokenStream, ts: TokenStream) =
-> TokenStream {
> >      vtable::vtable(attr, ts)
> >  }
> >
> > +/// Export a function so that C code can call it.
> > +///
> > +/// This macro has the following effect:
> > +///
> > +/// * Disables name mangling for this function.
> > +/// * Verifies at compile-time that the function signature matches wha=
t's in the header file.
> > +///
> > +/// This macro requires that the function is mentioned in a C header f=
ile, and that the header file
> > +/// is included in `rust/bindings/bindings_helper.h`.
> > +///
> > +/// This macro is *not* the same as the C macro `EXPORT_SYMBOL*`, sinc=
e all Rust symbols are
> > +/// currently automatically exported with `EXPORT_SYMBOL_GPL`.
>
> Perhaps add the following:
>
> This macro is useful when rust code is providing a function symbol whose
> signature is dictated by a C header file.

I do think this could use more info about when to use it. E.g., you
don't use it if C calls it via a vtable, but only if C calls it via a
declaration in a header file. I'll add more info.

> > +#[proc_macro_attribute]
> > +pub fn export(attr: TokenStream, ts: TokenStream) -> TokenStream {
> > +    export::export(attr, ts)
> > +}
> > +
> >  /// Concatenate two identifiers.
> >  ///
> >  /// This is useful in macros that need to declare or reference items w=
ith names
> > diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
> > index 33a199e4f176..c18960a91082 100644
> > --- a/rust/macros/quote.rs
> > +++ b/rust/macros/quote.rs
> > @@ -20,6 +20,12 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
> >      }
> >  }
> >
> > +impl ToTokens for proc_macro::Ident {
> > +    fn to_tokens(&self, tokens: &mut TokenStream) {
> > +        tokens.extend([TokenTree::from(self.clone())]);
> > +    }
> > +}
> > +
> >  impl ToTokens for TokenTree {
> >      fn to_tokens(&self, tokens: &mut TokenStream) {
> >          tokens.extend([self.clone()]);
> > @@ -40,7 +46,7 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
> >  /// `quote` crate but provides only just enough functionality needed b=
y the current `macros` crate.
> >  macro_rules! quote_spanned {
> >      ($span:expr =3D> $($tt:tt)*) =3D> {{
> > -        let mut tokens;
> > +        let mut tokens: ::std::vec::Vec<::proc_macro::TokenTree>;
> >          #[allow(clippy::vec_init_then_push)]
> >          {
> >              tokens =3D ::std::vec::Vec::new();
> > @@ -65,7 +71,8 @@ macro_rules! quote_spanned {
> >          quote_spanned!(@proc $v $span $($tt)*);
> >      };
> >      (@proc $v:ident $span:ident ( $($inner:tt)* ) $($tt:tt)*) =3D> {
> > -        let mut tokens =3D ::std::vec::Vec::new();
> > +        #[allow(unused_mut)]
> > +        let mut tokens =3D ::std::vec::Vec::<::proc_macro::TokenTree>:=
:new();
> >          quote_spanned!(@proc tokens $span $($inner)*);
> >          $v.push(::proc_macro::TokenTree::Group(::proc_macro::Group::ne=
w(
> >              ::proc_macro::Delimiter::Parenthesis,
> > @@ -136,6 +143,16 @@ macro_rules! quote_spanned {
> >          ));
> >          quote_spanned!(@proc $v $span $($tt)*);
> >      };
> > +    (@proc $v:ident $span:ident =3D $($tt:tt)*) =3D> {
> > +        $v.push(::proc_macro::TokenTree::Punct(
> > +                ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing:=
:Alone)
> > +        ));
> > +        quote_spanned!(@proc $v $span $($tt)*);
> > +    };
> > +    (@proc $v:ident $span:ident _ $($tt:tt)*) =3D> {
> > +        $v.push(::proc_macro::TokenTree::Ident(::proc_macro::Ident::ne=
w("_", $span)));
> > +        quote_spanned!(@proc $v $span $($tt)*);
> > +    };
> >      (@proc $v:ident $span:ident $id:ident $($tt:tt)*) =3D> {
> >          $v.push(::proc_macro::TokenTree::Ident(::proc_macro::Ident::ne=
w(stringify!($id), $span)));
> >          quote_spanned!(@proc $v $span $($tt)*);
>
> The update to `impl ToTokens for TokenTree` should be split out in a
> separate patch and should carry some explanation of the change.

I think this case is borderline for whether it's necessary to split
up, but okay.

Alice
