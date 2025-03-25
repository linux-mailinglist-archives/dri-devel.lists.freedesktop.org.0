Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C520A6EE1B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 11:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D33510E392;
	Tue, 25 Mar 2025 10:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UwTsliYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7741C10E392
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 10:46:18 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30db1bd3bddso4842341fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 03:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742899576; x=1743504376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1y03yDy8TIpQcuFAWH67h1VizPaAxuPKN6wBSpHwrrE=;
 b=UwTsliYQ6340x0j72/IcFycjQkhVm/qj2+J+XCej/Uht8bWemn+g6Qng2bNxLK9yCA
 /xvsyEeCwu2wOFmj/BiyoLXlNlpWzqnrGESU0ra7jDLA+Uag6xHzgUkidNn1u16urS7k
 3xE3TYeAQp6UIN5MRwRIwm+EOZb99xFPfPoWwxFRs5swdFOqpYP6AFKRlgQVe0laGSCx
 19VSF4Z4ZuCoSlGPOOrqvp9aQMutKSlTWJ4AtAD/ZciEiy/ou6ZOMlC9g3u07ZSf9sds
 MFwTS/oF2kGq4WDQl4zD4eBWmjTe4FkFu5QSyp5aviQ8y5u5XqSEZZ+Ng7n42velY0/f
 ANxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742899576; x=1743504376;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1y03yDy8TIpQcuFAWH67h1VizPaAxuPKN6wBSpHwrrE=;
 b=nsshrhMLvKvCJBtG9/GRbZeLYK5FHX7ZyjNv+Mis+nj87CKGKE0BVwjtKj3Gt/NuYc
 tIoGaVrJMXYO0gJb3MRbl9SUDhBA38LBdfG29k7G1uSisy4GbGhckxEbRuHkIpXDGfY/
 DjFpkW0HY5xptPY7BaQ+AW6iLCJCsVbnxQAesw/WhmHRdGMJlnIwczD89Vm+hYqJNF1I
 Jg/aor3Ga21WBiB6/SBowILyMymcGTd4iWD2/CVBFWBA7OyUh0JoCKtzT7WwcTrA+TJA
 PD8yx/F2wGnBfeRrtJwGNif73SHkYJn1xqNcZPPXBMaQULMoNkmU3kyGzJxjqoXFTyud
 llNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTqJ58Fhs/pztGCbHX7HN7PSZ/Ynj6sKHXk9J1VLJgNYEzPKYw9ExwNEjiBTHowhMztf4qHCQ3nGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxGdpFLDHTjSUhkoMH4mJve5/UX+cx1vxCVIPsuf+3SP7nGiit
 rO++EKSW4xQE1tMt7HX70brYN8FrEW4ZLDwB4AwJdHnWqbDfRAP19Kl9KpfeyVKqpAY5AVEaQfe
 QIUEJCAPo385GXrUWoeRQcLoXAps=
X-Gm-Gg: ASbGnctfFSpqrwDmcOeI1EnXv2viXW93oxnnVHw+BP4F2gUyWn3ASpEAd8LbQz4C503
 rBT5Lk+ivJ9EdEd6Bs66zM6upQ5aWjebmhEF5rWs+51lCyM7jNkb9iZL4elOFCk9B2NkFbvBVkd
 q7uPIq2XefsKULpD2u2/6GtPI4gOvM7Z+nL3m+kQhwK20uj5o3BgoQu54dpRvyNX1X/QylGQA=
X-Google-Smtp-Source: AGHT+IEeSFZcNncq+Hzrd6WJLKO5wQXJ5YPLXL3SpmKlQ5a2soAQyRH0mbHomADrM6Z19b8LkmwZD61xn1jA9K4yWjQ=
X-Received: by 2002:a2e:b888:0:b0:30b:8f84:49c5 with SMTP id
 38308e7fff4ca-30d7e3000ecmr55915601fa.28.1742899576246; Tue, 25 Mar 2025
 03:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250324-ptr-as-ptr-v6-0-49d1b7fd4290@gmail.com>
 <20250324-ptr-as-ptr-v6-6-49d1b7fd4290@gmail.com>
 <D8PA773W07SS.3T2SZUIJH4HOH@proton.me>
In-Reply-To: <D8PA773W07SS.3T2SZUIJH4HOH@proton.me>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 25 Mar 2025 06:45:40 -0400
X-Gm-Features: AQ5f1JoREcOZKZS-EjqFeDZFT-IOtHg2hx9DVULWtMdlFDlEyVW6GfpqQHdJRUU
Message-ID: <CAJ-ks9=1BOsd-edBH-ZsDLzhtX=YfvZPMHebX=br4Wc1K1V-TA@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] rust: enable `clippy::cast_lossless` lint
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

On Tue, Mar 25, 2025 at 6:40=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On Mon Mar 24, 2025 at 11:01 PM CET, Tamir Duberstein wrote:
> > Before Rust 1.29.0, Clippy introduced the `cast_lossless` lint [1]:
> >
> >> Rust=E2=80=99s `as` keyword will perform many kinds of conversions, in=
cluding
> >> silently lossy conversions. Conversion functions such as `i32::from`
> >> will only perform lossless conversions. Using the conversion functions
> >> prevents conversions from becoming silently lossy if the input types
> >> ever change, and makes it clear for people reading the code that the
> >> conversion is lossless.
> >
> > While this doesn't eliminate unchecked `as` conversions, it makes such
> > conversions easier to scrutinize.  It also has the slight benefit of
> > removing a degree of freedom on which to bikeshed. Thus apply the
> > changes and enable the lint -- no functional change intended.
> >
> > Link: https://rust-lang.github.io/rust-clippy/master/index.html#cast_lo=
ssless [1]
> > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > Link: https://lore.kernel.org/all/D8ORTXSUTKGL.1KOJAGBM8F8TN@proton.me/
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> One nit below, but you may add:
>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>

Thanks!

>
> > ---
> >  Makefile                        |  1 +
> >  drivers/gpu/drm/drm_panic_qr.rs | 10 +++++-----
> >  rust/bindings/lib.rs            |  2 +-
> >  rust/kernel/net/phy.rs          |  4 ++--
> >  4 files changed, 9 insertions(+), 8 deletions(-)
>
> > diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> > index 0486a32ed314..591e4ca9bc54 100644
> > --- a/rust/bindings/lib.rs
> > +++ b/rust/bindings/lib.rs
> > @@ -25,7 +25,7 @@
> >  )]
> >
> >  #[allow(dead_code)]
> > -#[allow(clippy::ptr_as_ptr)]
> > +#[allow(clippy::cast_lossless, clippy::ptr_as_ptr)]
>
> Not sure if we instead want this in a separate attribute, ultimately it
> doesn't really matter, but why should `undocumented_unsafe_blocks` be
> special?

No reason. Moved it to a separate line. I won't respin just for this -
hopefully Miguel doesn't mind fixing when he takes it, if there's not
a v7 by then.

Tamir
