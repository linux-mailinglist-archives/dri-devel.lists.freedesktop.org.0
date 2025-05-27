Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BD3AC517D
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 17:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD52C10E504;
	Tue, 27 May 2025 15:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fHMtVqfx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF24110E500;
 Tue, 27 May 2025 15:02:43 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-32a72cb7e4dso4864361fa.0; 
 Tue, 27 May 2025 08:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748358162; x=1748962962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWnpNgtFcY6Rfei4jRxG9rFAWp+cX3YYTz4I7H9Ixuk=;
 b=fHMtVqfx88lQiQzXlRPKX11rkF2H1TIoiY2vy/o7ys3hOgE3yaURSuYweSgAKf/F/4
 akF7szmc/rYKbEupi7Zx5zFBmryeMM/LHboOs6DM/zg43rvtCzs2zZAudDtaN4oVyvpy
 GOoalCnIBTYHSPIXq53W3jqNTNdiLq96hRRTAsJnK7YsDCsVtO0GQou/xLnhqfuFbZ9f
 VnorX2eXnw4vZr0iKDOlj7kIwRcDtFA1wOp7XqHgPe5Gp+OZhF0cNfo6e4JvHBBmnE1+
 JL5ZQH9LapD8yEiFMD2915TDSmuoD1mrbAa2mlnQzAbXvGTtD/Da5c04WpfUMbnMNyXX
 hQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748358162; x=1748962962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oWnpNgtFcY6Rfei4jRxG9rFAWp+cX3YYTz4I7H9Ixuk=;
 b=phIQtIJzLolJjjJCxMfJlDATYW/Hdiy+mOgQSw/faZXiKIdltAHd5HOyeCK18j6/xl
 DyEt+UToTassxvxMZrzoguy41ArEN4ZECA7AGqFg/Bbu0gGKzfUcc/lN0+djApylC14L
 biOm+YrUMnAcGm/NC85LZknl5gBOnEF+gMbIe0fwIDBRhTYSGijQgL646ukxoWpXJdaE
 AY0+iVD/Zj3CZwsWgYnX8kY1pxwFQLUusW9rrwbOvJLi2S7u4qPcZrLiTTeaazm7fnV5
 7B/duswefieWaqx63n5sSWqUBpywGQDCpiv0v9jN+nF17lpxRuUNfzxHJwjWnXpwkd5l
 ay5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmGC4yz9wtJ+2mL3HJeJwbgTegiBfU7qRWXEgOFDuo7IlTXK9AFWeO0YbtdOPO134DJv6gfo3wbA==@lists.freedesktop.org,
 AJvYcCV5paSpR909SVVZ6sRWEI5IyB0PYiJ9NRBnAP/MHrKuVAnRLl0WJ02FZe3vQtnKhgXdUft5JDqcnBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIYU/vDFyS0WjFjfWrPtIXieC8ftRjJvx8lC6Vtu7ZJE2qG1u4
 cG3SEJ+vsr5APZidhwXH7+d0d3rFJeF5bKlyI0wWOJbWRosB++mIKLZkVbvW8bCW7x5yAXaYZB4
 Gwloj7ZIrkoY8ExpP0aalwDWqKWIHm8o=
X-Gm-Gg: ASbGncsi4rIfze50qj+4saXsWpGT80KS1Fh6k4jnjGP2J4MECumiIWCUXftwFFwAXGY
 fK/Z2peOlwEcvYSnwZp04B2prl8gvGd9vgGNLh0qj4EhunG8vNwsGnJi2Ct2yoyxvIHIhGgycyP
 YuCAtgBRUwby731h1ecLrmDIaR/I3na9QLNko4e+8UJOjYNLol
X-Google-Smtp-Source: AGHT+IGFw/n0N4u0zEu1rQhqLzZPgaC14Lz0t0tgt/02Nzcqwd49+7j8OT/V+Lq3Y4h3EFBfzwAWStg3WQPZ89F2+a4=
X-Received: by 2002:a2e:be1d:0:b0:328:604:9da8 with SMTP id
 38308e7fff4ca-3295b991e39mr39297221fa.6.1748358161709; Tue, 27 May 2025
 08:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-2-6412a94d9d75@gmail.com>
 <DA66BBX1PDGI.10NHLG3D4CIT7@kernel.org>
 <CAJ-ks9m48gmar0WWP9WknV2JLqkKNU0X4nwXaQ+JdG+b-EcVxA@mail.gmail.com>
 <DA6GSMHMLRFM.YH9RGZWLY2X4@kernel.org>
In-Reply-To: <DA6GSMHMLRFM.YH9RGZWLY2X4@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 27 May 2025 11:02:05 -0400
X-Gm-Features: AX0GCFvsyDAFuT3w5C3nGuFHFjR6aYE_88niNwIangoOQL2awwx9lqh_vNT5Xj0
Message-ID: <CAJ-ks9nTf4dCoDdg4+YSkXM1sJsZ-0vuSC7wybc2JMAoGemhXQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] rust: support formatting of foreign types
To: Benno Lossin <lossin@kernel.org>
Cc: Michal Rostecki <vadorovsky@protonmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
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

On Mon, May 26, 2025 at 7:01=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Tue May 27, 2025 at 12:17 AM CEST, Tamir Duberstein wrote:
> > On Mon, May 26, 2025 at 10:48=E2=80=AFAM Benno Lossin <lossin@kernel.or=
g> wrote:
> >> On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> >> > Introduce a `fmt!` macro which wraps all arguments in
> >> > `kernel::fmt::Adapter` This enables formatting of foreign types (lik=
e
> >> > `core::ffi::CStr`) that do not implement `fmt::Display` due to conce=
rns
> >> > around lossy conversions which do not apply in the kernel.
> >> >
> >> > Replace all direct calls to `format_args!` with `fmt!`.
> >> >
> >> > In preparation for replacing our `CStr` with `core::ffi::CStr`, move=
 its
> >> > `fmt::Display` implementation to `kernel::fmt::Adapter<&CStr>`.
> >> >
> >> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> >> > Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Ge=
neral/topic/Custom.20formatting/with/516476467
> >> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> >> > ---
> >> >  drivers/block/rnull.rs      |   2 +-
> >> >  rust/kernel/block/mq.rs     |   2 +-
> >> >  rust/kernel/device.rs       |   2 +-
> >> >  rust/kernel/fmt.rs          |  77 +++++++++++++++++++++++++++++
> >> >  rust/kernel/kunit.rs        |   6 +--
> >> >  rust/kernel/lib.rs          |   1 +
> >> >  rust/kernel/prelude.rs      |   3 +-
> >> >  rust/kernel/print.rs        |   4 +-
> >> >  rust/kernel/seq_file.rs     |   2 +-
> >> >  rust/kernel/str.rs          |  23 ++++-----
> >> >  rust/macros/fmt.rs          | 118 +++++++++++++++++++++++++++++++++=
+++++++++++
> >> >  rust/macros/lib.rs          |  19 +++++++
> >> >  scripts/rustdoc_test_gen.rs |   2 +-
> >> >  13 files changed, 235 insertions(+), 26 deletions(-)
> >>
> >> Can you split this into creating the proc-macro, forwarding the displa=
y
> >> impls and replacing all the uses with the proc macro?
> >
> > Can you help me understand why that's better?
>
> It makes reviewing significantly easier.
>
> >> > +macro_rules! impl_display_forward {
> >> > +    ($(
> >> > +        $( { $($generics:tt)* } )? $ty:ty $( { where $($where:tt)* =
} )?
> >>
> >> You don't need `{}` around the `where` clause, as a `where` keyword ca=
n
> >> follow a `ty` fragment.
> >
> > This doesn't work:
> > ```
> > error: local ambiguity when calling macro `impl_display_forward`:
> > multiple parsing options: built-in NTs tt ('r#where') or 2 other
> > options.
> >   --> rust/kernel/fmt.rs:75:78
> >    |
> > 75 |     {<T: ?Sized>} crate::sync::Arc<T> where crate::sync::Arc<T>:
> > fmt::Display,
> >    |
> >            ^
> > ```
>
> Ah right that's a shame, forgot about the `tt`s at the end...
>
> >> > +impl_display_forward!(
> >> > +    bool,
> >> > +    char,
> >> > +    core::panic::PanicInfo<'_>,
> >> > +    crate::str::BStr,
> >> > +    fmt::Arguments<'_>,
> >> > +    i128,
> >> > +    i16,
> >> > +    i32,
> >> > +    i64,
> >> > +    i8,
> >> > +    isize,
> >> > +    str,
> >> > +    u128,
> >> > +    u16,
> >> > +    u32,
> >> > +    u64,
> >> > +    u8,
> >> > +    usize,
> >> > +    {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: f=
mt::Display},
> >> > +    {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::Uni=
queArc<T>: fmt::Display},
> >> > +);
> >>
> >> If we use `{}` instead of `()`, then we can format the contents
> >> differently:
> >>
> >>     impl_display_forward! {
> >>         i8, i16, i32, i64, i128, isize,
> >>         u8, u16, u32, u64, u128, usize,
> >>         bool, char, str,
> >>         crate::str::BStr,
> >>         fmt::Arguments<'_>,
> >>         core::panic::PanicInfo<'_>,
> >>         {<T: ?Sized>} crate::sync::Arc<T> {where Self: fmt::Display},
> >>         {<T: ?Sized>} crate::sync::UniqueArc<T> {where Self: fmt::Disp=
lay},
> >>     }
> >
> > Is that formatting better? rustfmt refuses to touch it either way.
>
> Yeah rustfmt doesn't touch macro parameters enclosed in `{}`. I think
> it's better.

OK, but why? This seems entirely subjective.

> >> > +/// Please see [`crate::fmt`] for documentation.
> >> > +pub(crate) fn fmt(input: TokenStream) -> TokenStream {
> >> > +    let mut input =3D input.into_iter();
> >> > +
> >> > +    let first_opt =3D input.next();
> >> > +    let first_owned_str;
> >> > +    let mut names =3D BTreeSet::new();
> >> > +    let first_lit =3D {
> >> > +        let Some((mut first_str, first_lit)) =3D (match first_opt.a=
s_ref() {
> >> > +            Some(TokenTree::Literal(first_lit)) =3D> {
> >> > +                first_owned_str =3D first_lit.to_string();
> >> > +                Some(first_owned_str.as_str()).and_then(|first| {
> >> > +                    let first =3D first.strip_prefix('"')?;
> >> > +                    let first =3D first.strip_suffix('"')?;
> >> > +                    Some((first, first_lit))
> >> > +                })
> >> > +            }
> >> > +            _ =3D> None,
> >> > +        }) else {
> >> > +            return first_opt.into_iter().chain(input).collect();
> >> > +        };
> >>
> >> This usage of let-else + match is pretty confusing and could just be a
> >> single match statement.
> >
> > I don't think so. Can you try rewriting it into the form you like?
>
>     let (mut first_str, first_lit) match first_opt.as_ref() {
>         Some(TokenTree::Literal(lit)) if lit.to_string().starts_with('"')=
 =3D> {
>             let contents =3D lit.to_string();
>             let contents =3D contents.strip_prefix('"').unwrap().strip_su=
ffix('"').unwrap();
>             ((contents, lit))
>         }
>         _ =3D> return first_opt.into_iter().chain(input).collect(),
>     };

What happens if the invocation is utterly malformed, e.g.
`fmt!("hello)`? You're unwrapping here, which I intentionally avoid.

>
> >> > +        while let Some((_, rest)) =3D first_str.split_once('{') {
> >> > +            first_str =3D rest;
> >> > +            if let Some(rest) =3D first_str.strip_prefix('{') {
> >> > +                first_str =3D rest;
> >> > +                continue;
> >> > +            }
> >> > +            while let Some((name, rest)) =3D first_str.split_once('=
}') {
> >> > +                first_str =3D rest;
> >> > +                if let Some(rest) =3D first_str.strip_prefix('}') {
> >>
> >> This doesn't make sense, we've matched a `{`, some text and a `}`. You
> >> can't escape a `}` that is associated to a `{`.
> >
> > Sure, but such input would be malformed, so I don't think it's
> > necessary to handle it "perfectly". We'll get a nice error from
> > format_args anyhow.
>
> My suggestion in this case would be to just remove this if-let. The
> search for `{` above would skip the `}` if it's correct.
>
> > https://play.rust-lang.org/?version=3Dstable&mode=3Ddebug&edition=3D202=
4&gist=3D5f529d93da7cf46b3c99ba7772623e33

Makes sense to me.

>
> Yes it will error like that, but if we do the replacement only when the
> syntax is correct, there also will be compile errors because of a
> missing `Display` impl, or is that not the case?

I'm not sure - I would guess syntax errors "mask" typeck errors.

>
> I'm a bit concerned about the ergonomics that this change will
> introduce, but I guess there really isn't anything that we can do about
> except not do it.
>
> >> > +                    first_str =3D rest;
> >> > +                    continue;
> >> > +                }
> >> > +                let name =3D name.split_once(':').map_or(name, |(na=
me, _)| name);
> >> > +                if !name.is_empty() && !name.chars().all(|c| c.is_a=
scii_digit()) {
> >> > +                    names.insert(name);
> >> > +                }
> >> > +                break;
> >> > +            }
> >> > +        }
> >> > +        first_lit
> >>
> >> `first_lit` is not modified, so could we just the code above it into a
> >> block instead of keeping it in the expr for `first_lit`?
> >
> > As above, can you suggest the alternate form you like better? The
> > gymnastics here are all in service of being able to let malformed
> > input fall through to core::format_args which will do the hard work of
> > producing good diagnostics.
>
> I don't see how this is hard, just do:
>
>     let (first_str, first_lit) =3D ...;

It requires you to unwrap, like you did above, which is what I'm
trying to avoid.

>
>     while ...
>
> >> > +    };
> >> > +
> >> > +    let first_span =3D first_lit.span();
> >> > +    let adapt =3D |expr| {
> >> > +        let mut borrow =3D
> >> > +            TokenStream::from_iter([TokenTree::Punct(Punct::new('&'=
, Spacing::Alone))]);
> >> > +        borrow.extend(expr);
> >> > +        make_ident(first_span, ["kernel", "fmt", "Adapter"])
> >> > +            .chain([TokenTree::Group(Group::new(Delimiter::Parenthe=
sis, borrow))])
> >>
> >> This should be fine with using `quote!`:
> >>
> >>     quote!(::kernel::fmt::Adapter(&#expr))
> >
> > Yeah, I have a local commit that uses quote_spanned to remove all the
> > manual constructions.
>
> I don't think that you need `quote_spanned` here at all. If you do, then
> let me know, something weird with spans is going on then.

You need to give idents a span, so each of `kernel`, `fmt`, and
`adapter` need a span. I *could* use `quote!` and get whatever span it
uses (mixed_site) but I'd rather retain control.

>
> >> > +    };
> >> > +
> >> > +    let flush =3D |args: &mut TokenStream, current: &mut TokenStrea=
m| {
> >> > +        let current =3D std::mem::take(current);
> >> > +        if !current.is_empty() {
> >> > +            args.extend(adapt(current));
> >> > +        }
> >> > +    };
> >> > +
> >> > +    let mut args =3D TokenStream::from_iter(first_opt);
> >> > +    {
> >> > +        let mut current =3D TokenStream::new();
> >> > +        for tt in input {
> >> > +            match &tt {
> >> > +                TokenTree::Punct(p) =3D> match p.as_char() {
> >> > +                    ',' =3D> {
> >> > +                        flush(&mut args, &mut current);
> >> > +                        &mut args
> >> > +                    }
> >> > +                    '=3D' =3D> {
> >> > +                        names.remove(current.to_string().as_str());
> >> > +                        args.extend(std::mem::take(&mut current));
> >> > +                        &mut args
> >> > +                    }
> >> > +                    _ =3D> &mut current,
> >> > +                },
> >> > +                _ =3D> &mut current,
> >> > +            }
> >> > +            .extend([tt]);
> >> > +        }
> >>
> >> This doesn't handle the following code correctly ):
> >>
> >>     let mut a =3D 0;
> >>     pr_info!("{a:?}", a =3D a =3D a);
> >>
> >> Looks like we'll have to remember what "kind" of an equals we parsed..=
.
> >
> > Hmm, good point. Maybe we can just avoid dealing with `=3D` at all unti=
l
> > we hit the `,` and just split on the leftmost `=3D`. WDYT? I'll have
> > that in v11.
>
> Sounds good, if there is no `=3D`, then ignore it.
>
> >> > +/// Like [`core::format_args!`], but automatically wraps arguments =
in [`kernel::fmt::Adapter`].
> >> > +///
> >> > +/// This macro allows generating `core::fmt::Arguments` while ensur=
ing that each argument is wrapped
> >> > +/// with `::kernel::fmt::Adapter`, which customizes formatting beha=
vior for kernel logging.
> >> > +///
> >> > +/// Named arguments used in the format string (e.g. `{foo}`) are de=
tected and resolved from local
> >> > +/// bindings. All positional and named arguments are automatically =
wrapped.
> >> > +///
> >> > +/// This macro is an implementation detail of other kernel logging =
macros like [`pr_info!`] and
> >> > +/// should not typically be used directly.
> >> > +///
> >> > +/// [`kernel::fmt::Adapter`]: ../kernel/fmt/struct.Adapter.html
> >> > +/// [`pr_info!`]: ../kernel/macro.pr_info.html
> >> > +#[proc_macro]
> >> > +pub fn fmt(input: TokenStream) -> TokenStream {
> >>
> >> I'm wondering if we should name this `format_args` instead in order to
> >> better communicate that it's a replacement for `core::format_args!`.
> >
> > Unfortunately that introduces ambiguity in cases where
> > kernel::prelude::* is imported because core::format_args is in core's
> > prelude.
>
> Ahh that's unfortunate.
>
> ---
> Cheers,
> Benno
