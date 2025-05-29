Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FFDAC83E2
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 00:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A192C10E250;
	Thu, 29 May 2025 22:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aO3Z4jnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E377410E250;
 Thu, 29 May 2025 22:08:31 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-310447fe59aso14408391fa.0; 
 Thu, 29 May 2025 15:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748556510; x=1749161310; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rpJVcptDcpTpszgwiBlbfF17mFy9KW509xkzZ9NUjik=;
 b=aO3Z4jnM/B9bJl0tnsdFxbrG7ADpyxc2pFwsrbQAuam5kSBd5rHziOgo0Lh6xsKEP3
 KMH9izNMFotx0rQPYftVYVBbQnIEBeJX9dfLgIMzgDRfQEf0wyCVHOi/w4elgSyzB5XH
 jvFbk3O97dnw9sYmOtGnlPz1I4Gkk8fJlU+R0WZviMMQG+NS1BpGejM6DB+DQKrOgCBX
 LmQVxZnH8CMiO7HnhiRoZzcRcU/YzrUaBvo5sHe+rxr1d5tsFdMXhDIWj8SgJn9a55dL
 6R1yNgaeu33Q23bJhAJD5qqjvErmLo7jC9aMxMN61xzk4AgFnPaQwZEoGdzW90mFF72V
 TEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748556510; x=1749161310;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rpJVcptDcpTpszgwiBlbfF17mFy9KW509xkzZ9NUjik=;
 b=rECQ4eCvYEVLOPJ+HyhkjUZcbtjFqo2DmrqfxgrGFdvUnhzhNBR87N/YtWeweuuXk+
 1A8YWxwQZIbV93SVA72wJR7eBqHyHgvoMjQ0cRmLuwcu+r58lc5s06PfpVRQ/Igup6YS
 z5AgmfXt8b3guXjePC7soWb+QydQ59SMmJ4oIAeKHoi8xybvWdCHLvwEbbixfSko9AyU
 5kpn9iUXMqP7Ob3rEWeSPXaEplRRyv1vKd9QaDtjgnB9V418gQaJmmZudMatWEsEBatX
 8kVu+XGADn6Xj/5dJ4F9kzI82B4/3WxVwdrLoIp9LotDoz0Qyk5bpZ+7cNExvOBDAha6
 pBGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqShqqAGybdedTU/4+KyYsPsRr9AHJdry4kfP9bg7uRYyaga0AqPPeITwobBGzsBFNuMpO48HR8j4=@lists.freedesktop.org,
 AJvYcCVVcJwLelN9JSwFGheDhd7YbaOgcEehp27HQRkTxpG40VGkCezKtrfgOdLovY+eDzbnOhCER0ZZLQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5ZY/mKcvbcr4OaXUpeTJBOEk7XOnX9grgFEOYg/U39rKXTfHz
 nAsbf8hZV+aTxx4GL0TYtK7INz+DPjuDa3a/efj1iPCRC8syCeVgpf8R6pBI++V/sMeW9aCO9uq
 00THlKcS+urFfXYvGJkuluSMWId85dX4=
X-Gm-Gg: ASbGncv4pE+WrAnNZEgMdz0mdMKE9MaaI1+BZVHBxDK/Y1tGlC5tTLSjr0b7n3w7MS1
 aX0U2CdyPI4F0qWt2hLfw8+pWDV+X/OzCIjTfgqj16UWxaWTdRpVeSg4AgB/A4ugvili/YQUDxv
 vLEqYCCNLgNRJJ7YT+9ApTXyDamcrZGw++RDOO5CbyYCtv8YGgT/8fVocYXCHz56X0UA==
X-Google-Smtp-Source: AGHT+IF7xscUHJvyGi+GvuMMKxSnSgP5AcyU3GpJtxmnO/5KSLUzYGntXscHYyM85fadDL0Kyjmy6YDgmBtNFpFE8dI=
X-Received: by 2002:a2e:b8c6:0:b0:32a:8916:55a1 with SMTP id
 38308e7fff4ca-32a8cd3fd89mr5150041fa.7.1748556509725; Thu, 29 May 2025
 15:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-2-6412a94d9d75@gmail.com>
 <DA66BBX1PDGI.10NHLG3D4CIT7@kernel.org>
 <CAJ-ks9m48gmar0WWP9WknV2JLqkKNU0X4nwXaQ+JdG+b-EcVxA@mail.gmail.com>
 <DA6GSMHMLRFM.YH9RGZWLY2X4@kernel.org>
 <CAJ-ks9nTf4dCoDdg4+YSkXM1sJsZ-0vuSC7wybc2JMAoGemhXQ@mail.gmail.com>
 <DA78MDRNCNB8.X69904APMYCB@kernel.org>
In-Reply-To: <DA78MDRNCNB8.X69904APMYCB@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 29 May 2025 18:07:52 -0400
X-Gm-Features: AX0GCFu41pC0z7_KQ2CYQPyB1pil2qNhuH6L70S1ECJZkmQT9P0P8s6oLTTUl3c
Message-ID: <CAJ-ks9=OsopMhr6Ui3PLD-ZkBo736ha9Ltkw=0ZaBzrQLC60Eg@mail.gmail.com>
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

On Tue, May 27, 2025 at 4:49=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Tue May 27, 2025 at 5:02 PM CEST, Tamir Duberstein wrote:
> > On Mon, May 26, 2025 at 7:01=E2=80=AFPM Benno Lossin <lossin@kernel.org=
> wrote:
> >> On Tue May 27, 2025 at 12:17 AM CEST, Tamir Duberstein wrote:
> >> > On Mon, May 26, 2025 at 10:48=E2=80=AFAM Benno Lossin <lossin@kernel=
.org> wrote:
> >> >> On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> >> >> > +impl_display_forward!(
> >> >> > +    bool,
> >> >> > +    char,
> >> >> > +    core::panic::PanicInfo<'_>,
> >> >> > +    crate::str::BStr,
> >> >> > +    fmt::Arguments<'_>,
> >> >> > +    i128,
> >> >> > +    i16,
> >> >> > +    i32,
> >> >> > +    i64,
> >> >> > +    i8,
> >> >> > +    isize,
> >> >> > +    str,
> >> >> > +    u128,
> >> >> > +    u16,
> >> >> > +    u32,
> >> >> > +    u64,
> >> >> > +    u8,
> >> >> > +    usize,
> >> >> > +    {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>=
: fmt::Display},
> >> >> > +    {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::=
UniqueArc<T>: fmt::Display},
> >> >> > +);
> >> >>
> >> >> If we use `{}` instead of `()`, then we can format the contents
> >> >> differently:
> >> >>
> >> >>     impl_display_forward! {
> >> >>         i8, i16, i32, i64, i128, isize,
> >> >>         u8, u16, u32, u64, u128, usize,
> >> >>         bool, char, str,
> >> >>         crate::str::BStr,
> >> >>         fmt::Arguments<'_>,
> >> >>         core::panic::PanicInfo<'_>,
> >> >>         {<T: ?Sized>} crate::sync::Arc<T> {where Self: fmt::Display=
},
> >> >>         {<T: ?Sized>} crate::sync::UniqueArc<T> {where Self: fmt::D=
isplay},
> >> >>     }
> >> >
> >> > Is that formatting better? rustfmt refuses to touch it either way.
> >>
> >> Yeah rustfmt doesn't touch macro parameters enclosed in `{}`. I think
> >> it's better.
> >
> > OK, but why? This seems entirely subjective.
>
> If more types are added to the list, it will grow over one screen size.
> With my formatting, leaving related types on a single line, that will
> only happen much later.
>
> >> >> > +/// Please see [`crate::fmt`] for documentation.
> >> >> > +pub(crate) fn fmt(input: TokenStream) -> TokenStream {
> >> >> > +    let mut input =3D input.into_iter();
> >> >> > +
> >> >> > +    let first_opt =3D input.next();
> >> >> > +    let first_owned_str;
> >> >> > +    let mut names =3D BTreeSet::new();
> >> >> > +    let first_lit =3D {
> >> >> > +        let Some((mut first_str, first_lit)) =3D (match first_op=
t.as_ref() {
> >> >> > +            Some(TokenTree::Literal(first_lit)) =3D> {
> >> >> > +                first_owned_str =3D first_lit.to_string();
> >> >> > +                Some(first_owned_str.as_str()).and_then(|first| =
{
> >> >> > +                    let first =3D first.strip_prefix('"')?;
> >> >> > +                    let first =3D first.strip_suffix('"')?;
> >> >> > +                    Some((first, first_lit))
> >> >> > +                })
> >> >> > +            }
> >> >> > +            _ =3D> None,
> >> >> > +        }) else {
> >> >> > +            return first_opt.into_iter().chain(input).collect();
> >> >> > +        };
> >> >>
> >> >> This usage of let-else + match is pretty confusing and could just b=
e a
> >> >> single match statement.
> >> >
> >> > I don't think so. Can you try rewriting it into the form you like?
> >>
> >>     let (mut first_str, first_lit) match first_opt.as_ref() {
> >>         Some(TokenTree::Literal(lit)) if lit.to_string().starts_with('=
"') =3D> {
> >>             let contents =3D lit.to_string();
> >>             let contents =3D contents.strip_prefix('"').unwrap().strip=
_suffix('"').unwrap();
> >>             ((contents, lit))
> >>         }
> >>         _ =3D> return first_opt.into_iter().chain(input).collect(),
> >>     };
> >
> > What happens if the invocation is utterly malformed, e.g.
> > `fmt!("hello)`? You're unwrapping here, which I intentionally avoid.
>
> That example won't even survive lexing (macros always will get valid
> rust tokens as input). If a literal begins with a `"`, it also will end
> with one AFAIK.
>
> >> Yes it will error like that, but if we do the replacement only when th=
e
> >> syntax is correct, there also will be compile errors because of a
> >> missing `Display` impl, or is that not the case?
> >
> > I'm not sure - I would guess syntax errors "mask" typeck errors.
>
> I checked and it seems to be so, that's good.

=F0=9F=91=8D

>
> >> >> > +                    first_str =3D rest;
> >> >> > +                    continue;
> >> >> > +                }
> >> >> > +                let name =3D name.split_once(':').map_or(name, |=
(name, _)| name);
> >> >> > +                if !name.is_empty() && !name.chars().all(|c| c.i=
s_ascii_digit()) {
> >> >> > +                    names.insert(name);
> >> >> > +                }
> >> >> > +                break;
> >> >> > +            }
> >> >> > +        }
> >> >> > +        first_lit
> >> >>
> >> >> `first_lit` is not modified, so could we just the code above it int=
o a
> >> >> block instead of keeping it in the expr for `first_lit`?
> >> >
> >> > As above, can you suggest the alternate form you like better? The
> >> > gymnastics here are all in service of being able to let malformed
> >> > input fall through to core::format_args which will do the hard work =
of
> >> > producing good diagnostics.
> >>
> >> I don't see how this is hard, just do:
> >>
> >>     let (first_str, first_lit) =3D ...;
> >
> > It requires you to unwrap, like you did above, which is what I'm
> > trying to avoid.
>
> How so? What do you need to unwrap?

I was referring to your unwraps above.

> >> >> > +    };
> >> >> > +
> >> >> > +    let first_span =3D first_lit.span();
> >> >> > +    let adapt =3D |expr| {
> >> >> > +        let mut borrow =3D
> >> >> > +            TokenStream::from_iter([TokenTree::Punct(Punct::new(=
'&', Spacing::Alone))]);
> >> >> > +        borrow.extend(expr);
> >> >> > +        make_ident(first_span, ["kernel", "fmt", "Adapter"])
> >> >> > +            .chain([TokenTree::Group(Group::new(Delimiter::Paren=
thesis, borrow))])
> >> >>
> >> >> This should be fine with using `quote!`:
> >> >>
> >> >>     quote!(::kernel::fmt::Adapter(&#expr))
> >> >
> >> > Yeah, I have a local commit that uses quote_spanned to remove all th=
e
> >> > manual constructions.
> >>
> >> I don't think that you need `quote_spanned` here at all. If you do, th=
en
> >> let me know, something weird with spans is going on then.
> >
> > You need to give idents a span, so each of `kernel`, `fmt`, and
> > `adapter` need a span. I *could* use `quote!` and get whatever span it
> > uses (mixed_site) but I'd rather retain control.
>
> Please use `quote!` if it works. No need to make this more complex than
> it already is. If it doesn't work then that's another story.

Let's adjudicate that on v11, where you can see the code.
