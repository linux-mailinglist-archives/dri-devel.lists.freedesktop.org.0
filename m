Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34909A4A725
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 01:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0C510ED64;
	Sat,  1 Mar 2025 00:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hYtalTqn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDE610ECD9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 15:40:58 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-54622829175so2051819e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 07:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740757256; x=1741362056; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ljr8xrKyNBrwwV5pBT422OLhNCfKR2buem5K0sHBXw=;
 b=hYtalTqnIFgGBSbRtq4D3MsUfAeznsYJN0dnB6E+JJm96fpfyC4iTobKdWRvwlwlss
 1t8bUjp/BzwG/67DANqus7uXsMTitEsrIr978rMhqNm0RuK+PwJLgZwbgPJzq+7RRktt
 W1kWUXvui3WPmixtwGSaJe7ySUUc+3zWsrbw6Erakw4hwgULjrHdWbf8rtLWJcAhnOPh
 uI92gabYkyK/dRQo151zcm6VrAqT+KQLHHUoYGcX+y0297cBsFrLtFJtrJ+DYWXg65x0
 35QxOEljL5OEVdumaRmNDAlmWuwus2iMthvF3Y1FQ7ciXyJu8UXsc8/GW2sWGKPXKrww
 rb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740757256; x=1741362056;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ljr8xrKyNBrwwV5pBT422OLhNCfKR2buem5K0sHBXw=;
 b=lalKiDBuJTR6PHzYx8Tobi0I3FTJp5ZJ6UcxnV9Wsr+jEg0TO7k36uWS7DxNA1heaa
 osaqCso2srELfincYajaTwIEkkFrr/kxOhDGv1bCjlrudA0xOI9T0tctBIwvhNLLcbpc
 7qReVmVQ4+uInca/HBuWUdB+nJDmPd+4DMpEJ+Nfk1ceqdRnGrTZkic+Y50woRsBCKpX
 L6656D4AltOIYjOE5pfrQyoJv9giV6jhcyMkrcwdoIPM36E8j9Vi4sdlypc9TR8hGsEq
 Wh4Swr5zxsWOLy8Y+Q8MvNbgVFtMc6zw0XBwXQGLPoTBSPfASkJPWkzAcnumzEPzk8eP
 Jjeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVahUDtJ779gNOS9zft7AFwkgJZsgl2nXsryMZblO2xDKTnlZJlT/KtCRTQk1rBDiH4jTybZ3ZBnwY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3DJRbb1TE5p+NylWesiqW66w7AvVNoBdTCBnAW5rDtF+tt+9r
 AkEiabEiZ211jVqvBsCFxzs41407aakTE7BRmY+FR9wVLBJl9bX5hNL6dILbD8GJgakaP71vrgQ
 ls2R1161dpdFq9vAPTPXMaYh2dw4=
X-Gm-Gg: ASbGnctabZN/Bf/jsgnUJNqksRFOj6UcaA6KYZdfVc3iKrjRh4zw5J5EJMs871jMD49
 q/v9Zv1XKX+dDvamDhcUi3csCXg9zay5QQM/DvyNLU/+aARdEBr4/XCCCtdk8OfCsN6xn2i1YFC
 /zLgpPTkBc7B8a1V6rrHzVCgtxRm1X/+Y69C38q+bj
X-Google-Smtp-Source: AGHT+IHd2IYB1u6mEXO4FqIUkiG5whxsZfQOPChl+QF4ogaZuoZTeMFdegzS150nu6LsBFjcskSikQEFMOXQ/GqiWLc=
X-Received: by 2002:a05:6512:1085:b0:545:1d96:d702 with SMTP id
 2adb3069b0e04-5494c38c05dmr1749128e87.48.1740757256077; Fri, 28 Feb 2025
 07:40:56 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-3-569cc7e8926c@google.com>
In-Reply-To: <20250228-export-macro-v2-3-569cc7e8926c@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 28 Feb 2025 10:40:19 -0500
X-Gm-Features: AQ5f1JrvtXu6E3vZKPCRN_Ad3C8FIGZhvOqUB8FjBPWdG1dpC6lS-lRNgheE0O4
Message-ID: <CAJ-ks9ng6AqmDynFebR+2_ZEpmvxkUNWdTed2vr0kede0dxcxw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] rust: add #[export] macro
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

On Fri, Feb 28, 2025 at 7:40=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Rust has two different tools for generating function declarations to
> call across the FFI boundary:
>
> * bindgen. Generates Rust declarations from a C header.
> * cbindgen. Generates C headers from Rust declarations.
>
> In the kernel, we only use bindgen. This is because cbindgen assumes a
> cargo-based buildsystem, so it is not compatible with the kernel's build
> system. This means that when C code calls a Rust function by name, its
> signature must be duplicated in both Rust code and a C header, and the
> signature needs to be kept in sync manually.

This needs an update given Miguel's comments on the cover letter. I
wonder if the code should also justify the choice (over cbindgen).

> To eliminate this manual checking, introduce a new macro that verifies
> at compile time that the two function declarations use the same
> signature. The idea is to run the C declaration through bindgen, and
> then have rustc verify that the function pointers have the same type.
>
> The signature must still be written twice, but at least you can no
> longer get it wrong. If the signatures don't match, you will get errors
> that look like this:
>
> error[E0308]: `if` and `else` have incompatible types
>   --> <linux>/rust/kernel/print.rs:22:22
>    |
> 21 | #[export]
>    | --------- expected because of this
> 22 | unsafe extern "C" fn rust_fmt_argument(
>    |                      ^^^^^^^^^^^^^^^^^ expected `u8`, found `i8`
>    |
>    =3D note: expected fn item `unsafe extern "C" fn(*mut u8, *mut u8, *mu=
t c_void) -> *mut u8 {bindings::rust_fmt_argument}`
>               found fn item `unsafe extern "C" fn(*mut i8, *mut i8, *cons=
t c_void) -> *mut i8 {print::rust_fmt_argument}`
>
> It is unfortunate that the error message starts out by saying "`if` and
> `else` have incompatible types", but I believe the rest of the error
> message is reasonably clear and not too confusing.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/prelude.rs |  2 +-
>  rust/macros/export.rs  | 28 ++++++++++++++++++++++++++++
>  rust/macros/helpers.rs | 19 ++++++++++++++++++-
>  rust/macros/lib.rs     | 24 ++++++++++++++++++++++++
>  4 files changed, 71 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> index dde2e0649790..889102f5a81e 100644
> --- a/rust/kernel/prelude.rs
> +++ b/rust/kernel/prelude.rs
> @@ -17,7 +17,7 @@
>  pub use crate::alloc::{flags::*, Box, KBox, KVBox, KVVec, KVec, VBox, VV=
ec, Vec};
>
>  #[doc(no_inline)]
> -pub use macros::{module, pin_data, pinned_drop, vtable, Zeroable};
> +pub use macros::{export, module, pin_data, pinned_drop, vtable, Zeroable=
};
>
>  pub use super::{build_assert, build_error};
>
> diff --git a/rust/macros/export.rs b/rust/macros/export.rs
> new file mode 100644
> index 000000000000..c5ec75f2b07f
> --- /dev/null
> +++ b/rust/macros/export.rs
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use crate::helpers::function_name;
> +use proc_macro::TokenStream;
> +
> +/// Please see [`crate::export`] for documentation.
> +pub(crate) fn export(_attr: TokenStream, ts: TokenStream) -> TokenStream=
 {
> +    let Some(name) =3D function_name(ts.clone()) else {
> +        return "::core::compile_error!(\"The #[export] attribute must be=
 used on a function.\");"
> +            .parse::<TokenStream>()
> +            .unwrap();
> +    };

Could you also show in the commit message what this error looks like
when the macro is misused?

> +
> +    // This verifies that the function has the same signature as the dec=
laration generated by
> +    // bindgen. It makes use of the fact that all branches of an if/else=
 must have the same type.
> +    let signature_check =3D quote!(
> +        const _: () =3D {
> +            if true {
> +                ::kernel::bindings::#name
> +            } else {
> +                #name
> +            };
> +        };
> +    );
> +
> +    let no_mangle =3D "#[no_mangle]".parse::<TokenStream>().unwrap();

Would this be simpler as `let no_mangle =3D quote!("#[no_mangle]");`?

> +    TokenStream::from_iter([signature_check, no_mangle, ts])
> +}
> diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
> index 563dcd2b7ace..3e04f8ecfc74 100644
> --- a/rust/macros/helpers.rs
> +++ b/rust/macros/helpers.rs
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>
> -use proc_macro::{token_stream, Group, TokenStream, TokenTree};
> +use proc_macro::{token_stream, Group, Ident, TokenStream, TokenTree};
>
>  pub(crate) fn try_ident(it: &mut token_stream::IntoIter) -> Option<Strin=
g> {
>      if let Some(TokenTree::Ident(ident)) =3D it.next() {
> @@ -215,3 +215,20 @@ pub(crate) fn parse_generics(input: TokenStream) -> =
(Generics, Vec<TokenTree>) {
>          rest,
>      )
>  }
> +
> +/// Given a function declaration, finds the name of the function.
> +pub(crate) fn function_name(input: TokenStream) -> Option<Ident> {
> +    let mut input =3D input.into_iter();
> +    while let Some(token) =3D input.next() {
> +        match token {
> +            TokenTree::Ident(i) if i.to_string() =3D=3D "fn" =3D> {
> +                if let Some(TokenTree::Ident(i)) =3D input.next() {
> +                    return Some(i);
> +                }
> +                return None;
> +            }
> +            _ =3D> continue,
> +        }
> +    }
> +    None
> +}
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index d61bc6a56425..fbb2860e991f 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -9,6 +9,7 @@
>  #[macro_use]
>  mod quote;
>  mod concat_idents;
> +mod export;
>  mod helpers;
>  mod module;
>  mod paste;
> @@ -174,6 +175,29 @@ pub fn vtable(attr: TokenStream, ts: TokenStream) ->=
 TokenStream {
>      vtable::vtable(attr, ts)
>  }
>
> +/// Export a function so that C code can call it via a header file.
> +///
> +/// Functions exported using this macro can be called from C code using =
the declaration in the
> +/// appropriate header file. It should only be used in cases where C cal=
ls the function through a
> +/// header file; cases where C calls into Rust via a function pointer in=
 a vtable (such as
> +/// `file_operations`) should not use this macro.
> +///
> +/// This macro has the following effect:
> +///
> +/// * Disables name mangling for this function.
> +/// * Verifies at compile-time that the function signature matches the d=
eclaration in the header
> +///   file.
> +///
> +/// You must declare the signature of the Rust function in a header file=
 that is included by
> +/// `rust/bindings/bindings_helper.h`.
> +///
> +/// This macro is *not* the same as the C macros `EXPORT_SYMBOL_*`, sinc=
e all Rust symbols are
> +/// currently automatically exported with `EXPORT_SYMBOL_GPL`.

nit: "since" implies causation, which isn't the case, I think.
Consider if ", since" can be replaced with a semicolon.

> +#[proc_macro_attribute]
> +pub fn export(attr: TokenStream, ts: TokenStream) -> TokenStream {
> +    export::export(attr, ts)
> +}
> +
>  /// Concatenate two identifiers.
>  ///
>  /// This is useful in macros that need to declare or reference items wit=
h names
>
> --
> 2.48.1.711.g2feabab25a-goog

Minor comments.

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
