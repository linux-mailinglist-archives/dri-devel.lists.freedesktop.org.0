Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC00A4B8F8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7010710E227;
	Mon,  3 Mar 2025 08:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="j/LvBxQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7A610E227
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:17:17 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4394a823036so39210355e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 00:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740989835; x=1741594635;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jA0dpvdILr7SLpPAx2h6QOM8iRHWeLVPpniq08kJ/yM=;
 b=j/LvBxQUCYO26YcBaOG+rxWkyTRaf41vjj8hWAfzwxmfH6DjLec72JjcdWi+7Ba1oX
 g2Dq6VkyxbgK2o7E/ZJZIf5+x3izRfbrY4D0W4JH3PUu4nkjLiL8RdLkvUyCgCkFFyHZ
 +mVmgcpm7JI+0jM8pkQul4co7MwhGezz2xcK5baI+Tpz7PPI4I/tkKpoWcgnxdJ4k4uC
 6ckiaySJmo+r4h//7POvtGb4wSmZeGX3e/Xs2w+vGF5eRDv6PJW3MRUjNsRzoABpdfZa
 o/eACX7clVf+KuwmCAnsi1+u9hpNl0CkN+JoyveI/IeWhoM/LtaBc2gNDIXvIJlfbx2p
 P6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740989835; x=1741594635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jA0dpvdILr7SLpPAx2h6QOM8iRHWeLVPpniq08kJ/yM=;
 b=PQd4ODLZqpcqg28RPGbNUoSRsKJhLUvbguIwjkUGtDlHtv+csm41t6mDQjwVHHMv9S
 pa/Zx1JS2dCRr0cKJO0zeu3MVjxbEltA8bVLGnZXKdx9YulWA0DFuDEftFsae4WQT147
 YPN1OjuOfIMB1hRf2ObVzWzb2R9Cet9Upx+4oaWadcZ1LFeHeRwUlSV8RkiIj1JUpgwZ
 YesjMHK0lJsfHr/YHydFDzbLeid+BOMiw/hi203SxrRaxP3V2nvPxy6aMaJBSxHzJ/8/
 mn9Wwq8Gju0D0/brL7YPwSQzOu2NKVpHguo6FWswsldKZvqlj0t3thmyeSpI7I/27X5N
 EOuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJeuwnzES6tt4/aYLL8cy2gL/s/QmdjUJGAP//a5Gb/55Xqn+pT631hJeHA+Y3RurpG6Be9YO36ko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv1mnZkyuQ4lFpFTkkBflvrR/iJxTKWQo9BvpCa7z7mgQqldR1
 DgfIjAZElElq9+LJEng++xMNioLjV4QUk5I3uDXCHbOe3EbLcl34Em4AEAAYUno6mzbg8g1DfgL
 lhXT8YeA5twt5ME7AMl1+FMMNWIv0Suc90oqq
X-Gm-Gg: ASbGnctZLkjq+thf1uNmnU0R1nkEvGd0XF9Qh13Yt/Rx3PsbiSnaeVm7UBEN4NfWxKK
 oNnwm1ENjNM67CGJ+f7Mjy1xh0fpvF7t/henovBFkqIm1ygvuTHFrlVJgqGe6iVT6rhfZk6yFqS
 Mh8o0HRS0yItcjZthVFPA+JT4Y45Xkecp5cSgJ/tVHmUiXKqxwqO6WF+o4
X-Google-Smtp-Source: AGHT+IFSYdPrfAT2czicp0H2L34T0MTTXxUfMLTH4DIdYq6oZerde5+Qjh15AbNt/anCVI0itN956I2sXy82N+8E8pk=
X-Received: by 2002:a05:6000:1acb:b0:391:6fd:bb81 with SMTP id
 ffacd0b85a97d-39106fdbd84mr2778396f8f.50.1740989835532; Mon, 03 Mar 2025
 00:17:15 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-2-569cc7e8926c@google.com>
 <CAJ-ks9nn1_gAqz9f3H9O47QA7dwk5MaT5YK3NQtZtUJHyNXbVg@mail.gmail.com>
In-Reply-To: <CAJ-ks9nn1_gAqz9f3H9O47QA7dwk5MaT5YK3NQtZtUJHyNXbVg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 09:17:03 +0100
X-Gm-Features: AQ5f1JorySWi-KYwhNh-r8Q996knGQo2fkyzux-yfstz0yHdBixCTqR1Fqf-3Ok
Message-ID: <CAH5fLgjgfgaoMP7TD46u9OsYuje6yA4ooM+6eCd5whAx+tiTqg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: macros: support additional tokens in quote!
To: Tamir Duberstein <tamird@gmail.com>
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

On Fri, Feb 28, 2025 at 4:26=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Fri, Feb 28, 2025 at 7:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > This gives the quote! macro support for the following additional tokens=
:
> >
> > * The =3D token.
> > * The _ token.
> > * Using #my_var with variables of type Ident.
> >
> > Additionally, some type annotations are added to allow cases where
> > groups are empty. For example, quote! does support () in the input, but
> > only when it is *not* empty. When it is empty, the compiler cannot infe=
r
> > the item type of `tokens`.
> >
> > These additional quote! features are used by a new proc macro that
> > generates code looking like this:
> >
> >         const _: () =3D {
> >             if true {
> >                 ::kernel::bindings::#name
> >             } else {
> >                 #name
> >             };
> >         };
> >
> > where #name has type Ident.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/macros/quote.rs | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
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
>
> It'd be nice to mention the need for this attribute in the commit
> message along with the added type annotations.

Adding a note to mention that when the () is empty, not only can't it
infer the item type, it's also never modified.

Alice
