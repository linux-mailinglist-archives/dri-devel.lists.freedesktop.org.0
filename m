Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF4EA722B1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 23:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4679910E06F;
	Wed, 26 Mar 2025 22:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NVFDzHUK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED70810E06F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 22:09:58 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30c44a87b9cso3121771fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 15:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743026997; x=1743631797; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=25Tr7RM7XhHf1JCtkM+bWEr7gcCanZ/l1B2na6DpLrY=;
 b=NVFDzHUK279FCWhrSvbZ4bBXQi54kJstkQZvBHgaNj5cecJ3m46/0PJMTR8Ej4mUVI
 8+/vlclA0hsi9wJyc93SICVS6Fq/MUEMRzeZxjlfU+HmJBgkQN+x7FWypFp63n8/tBi+
 HLI9E10g0tdeNPcBs5tFW5L/L0Xdxrth1AVvk9aWgz8N+LU0GSiRG+DeU5bGylv0l+se
 2z+duaaB5NqtSMGdkFalj+p9wUw35vYpO+yiUmK6KN+11QYgEA3povQuhGep4wyk/Exg
 4krYhazDVspRXEjupiJ1HHmp3emUiNYCi9ssiSxcSloKe4uSklJB/Dc863Jhai5PuP0t
 552Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743026997; x=1743631797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=25Tr7RM7XhHf1JCtkM+bWEr7gcCanZ/l1B2na6DpLrY=;
 b=K+FsiLk1DXwa1Sc57qhUI4AA1fUM3w1XwJCySRC1q2ZSf0AnR+0sQ1BBj7esm6fKOY
 Nd8iOrwX49OPlE8zIgtg0N6liIO1Xnx2MgXyxUPppNdXZ0Rl1XZ8IzIFFNWhKlmcQF7N
 gO3scOw/yzLswfCgnj/+SkerWRUjuwCwy+qw6xRLhWObRhaQauY/5K7W8kiHSWLMz37i
 hgxRye3NHkuaja5DB/sR6AbhxW2CFyP5pm3fGEKV3Hrp5JbcB5WzodwAWyuKfbDtg1PW
 f2JACgQltaHh21O+iSr3+zI1tTSDamxguaK3cIxh9hQRaW6+x4uVakOMncluGCOAnBzs
 VmqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqrHIvn9Wfb/8/BrI4/CkY/BWB3xKZR1t7ob9oaZ52OxjlQI2SXK2+k9WjTqqfJFjtLS6BhcG9VUY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKjAMLCEjz4+dh7HCj2i1A/6ITvc3aYQZrpvA6VhFR7IGTfdfF
 kvxzmd44XZfs6VqD3OIX0y+z84sltgryki+FYRIxCb3D4PdN9vdJJBodUajd/LnCiC/KtXVe5D7
 oFq8kpwTi9FjlmT++D019NPXQKkg=
X-Gm-Gg: ASbGncuql8BEYpEZTFUw1vBqG87QAJiVz8eA5iJNtR0dVGwRGpAQewekvbKDllm9V4e
 Q+CL8MSk23CiZiTG6+OkM+Flp+Imnz60Og9Y0R7jv9FjR/8jRmF8URWUr1OxjvG2FLwMK2QKToW
 x0iVNj6PvxhLK4h+U+ZsLsUyB6/GnV96OBcSubeGGqYQ==
X-Google-Smtp-Source: AGHT+IHX4HWxiuDcJh6RFBYB0z4mv1VQdnwmt/CKhKHr01wYV9yimExXiWC5KliSOM/5II+nRJgfsPlCyM8KCWUVSdg=
X-Received: by 2002:a2e:9982:0:b0:300:26bc:4311 with SMTP id
 38308e7fff4ca-30dc5dd50b1mr5206711fa.18.1743026996866; Wed, 26 Mar 2025
 15:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
 <D8PPIYIJCNX8.13VPQULEI0ALN@proton.me>
 <CAJ-ks9k6220j6CQSOF4TDrgY9qq4PfV9uaMXz1Qk4m=eeSr5Ag@mail.gmail.com>
 <D8Q4MSXXZ7OI.1NC226MO02VSN@proton.me>
 <CAJ-ks9nHKpQPuSBypXTSATYhbAFkQTJzUq8jN0nu4t=Kw+0xxg@mail.gmail.com>
 <D8QCK3CQES3Y.3LTZ4MVO5B3KT@proton.me>
 <CAJ-ks9nKT2PUDm6=b4AB1QUWwwvcqPn7Vz60=c0B+uFMZrqPew@mail.gmail.com>
 <D8QDOBUM6NF0.CGJY7ZA5KD9S@proton.me>
 <CAJ-ks9ntTxBM=c5nUZWGv3MoRt-LveBchn-c1Xy-DGap7fLVRA@mail.gmail.com>
 <D8QI804Q3DAS.2BV4WSL81H52Z@proton.me>
In-Reply-To: <D8QI804Q3DAS.2BV4WSL81H52Z@proton.me>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 26 Mar 2025 18:09:20 -0400
X-Gm-Features: AQ5f1Jr4h_VyjyWTUSlSb_WqvOkQ5GTUuP7SqBZOv0icJYUW2AkHAvgmWwY4H9E
Message-ID: <CAJ-ks9mA5QDeZ3EvOD3THayFt4TtDysgm0jp2aiSF2mQCrhWiQ@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] rust: enable `clippy::ref_as_ptr` lint
To: Benno Lossin <benno.lossin@proton.me>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org
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

On Wed, Mar 26, 2025 at 5:09=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On Wed Mar 26, 2025 at 8:06 PM CET, Tamir Duberstein wrote:
> > On Wed, Mar 26, 2025 at 1:36=E2=80=AFPM Benno Lossin <benno.lossin@prot=
on.me> wrote:
> >> On Wed Mar 26, 2025 at 5:57 PM CET, Tamir Duberstein wrote:
> >> > In the current code you're looking at, yes. But in the code I have
> >> > locally I'm transmuting `[u8]` to `BStr`. See my earlier reply where=
 I
> >> > said "Hmm, looking at this again we can just transmute ref-to-ref an=
d
> >> > avoid pointers entirely. We're already doing that in
> >> > `CStr::from_bytes_with_nul_unchecked`".
> >>
> >> `CStr::from_bytes_with_nul_unchecked` does the transmute with
> >> references. That is a usage that the docs of `transmute` explicitly
> >> recommend to change to an `as` cast [1].
> >
> > RIght. That guidance was written in 2016
> > (https://github.com/rust-lang/rust/pull/34609) and doesn't present any
> > rationale for `as` casts being preferred to transmute. I posted a
> > comment in the most relevant issue I could find:
> > https://github.com/rust-lang/rust/issues/34249#issuecomment-2755316610.
>
> Not sure if that's the correct issue, maybe we should post one on the
> UCG (unsafe code guidelines). But before that we probably should ask on
> zulip...
>
> >> No idea about provenance still.
> >
> > Well that's not surprising, nobody was thinking about provenance in
> > 2016. But I really don't think we should blindly follow the advice in
> > this case. It doesn't make an iota of sense to me - does it make sense
> > to you?
>
> For ptr-to-int transmutes, I know that they will probably remove
> provenance, hence I am a bit cautious about using them for ptr-to-ptr or
> ref-to-ref.
>
> >> [1]: https://doc.rust-lang.org/std/mem/fn.transmute.html#alternatives
> >>
> >> >> I tried to find some existing issues about the topic and found that
> >> >> there exists a clippy lint `transmute_ptr_to_ptr`. There is an issu=
e
> >> >> asking for a better justification [1] and it seems like nobody prov=
ided
> >> >> one there. Maybe we should ask the opsem team what happens to prove=
nance
> >> >> when transmuting?
> >> >
> >> > Yeah, we should do this - but again: not relevant in this discussion=
.
> >>
> >> I think it's pretty relevant.
> >
> > It's not relevant because we're no longer talking about transmuting
> > pointer to pointer. The two options are:
> > 1. transmute reference to reference.
> > 2. coerce reference to pointer, `as` cast pointer to pointer (triggers
> > `ptr_as_ptr`), reborrow pointer to reference.
> >
> > If anyone can help me understand why (2) is better than (1), I'd
> > certainly appreciate it.
>
> I am very confident that (2) is correct. With (1) I'm not sure (see
> above), so that's why I mentioned it.

Can you help me understand why you're confident about (2) but not (1)?
