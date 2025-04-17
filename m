Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7CBA92BC3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 21:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BCA10E3A9;
	Thu, 17 Apr 2025 19:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KQn54HeL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85B910E3A9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 19:29:34 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3105ef2a08dso10590071fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 12:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744918172; x=1745522972; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZVUIqZiEwl1B2+vNCfJHA2gPwonxMuRc8KmAVY778TU=;
 b=KQn54HeLHz/BOyQMYey4Y8i+8WGeAJfsuDJoNkiSjX9/7laID9VCagdZQ4XqNQaN6M
 yBpTQlET6F1ZPuU3KTfovkr5KzPndzqHD9CcIIa41LS+sqvWcapBbzWFRyFYsjG5UoZ7
 NS39ZnePN+GCAq+BOS2Btb8ce8TVwnZ72ZA57MdHxzhB5zR+YJsXbYrcodMlhdscm2CR
 YqtHBV3Pkmbu0qZlfVly8EkjCJgnGmdc1Ez3XrabUEIPPcuOCol0e+x79E1SIDzETkjz
 ZCyqMVQt2Jx44MgrAOC5glkfaEre7QBy7IYew7b274J6ETb/mIv6qZ0fXSrbs+OKBdIi
 abeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744918172; x=1745522972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZVUIqZiEwl1B2+vNCfJHA2gPwonxMuRc8KmAVY778TU=;
 b=bltc31SST0AHvZsKZ63x9/W3lVa9h/u5UKazHPxRt0t63zvu96UtdlzyYAh1v9TIQe
 g0Crzw4JD7ON4rgn1G2xk1cz0xBVfR/lRNSKjhvOU1xE23NfBWQd9X5c0Ba2hdNopWZq
 0t7zOP3catf1sd113/vUEeEk6rjNHgGTD8BZsjxPbkwdYYi7AcF+fkSYavBUbbS/2I2u
 JPxa41WpBZoP/8ec2sHwt3SzGW5dJ54cgdYMWntN7RPhuGzwF4AVQSYL/OKuFytvbuub
 wBx8SjG9Y7YPYt+/5fl5fvAdo8Bz4qDMWAb7AMU+KOsfRgNIGXXgX7Il4cO130bpGKJO
 onBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe5v494vqgjK9eU+qRSavgr9E0MA4atXQ0kvmG16JM8golQOqFx8m+HuDtsmZ/R9W4h8a7uAuqKTo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywubTmED5EWDOUr83j9tOmXAjOEFrNfXiWWMq9ZmK6ANJjpqSa
 XGcmxNBxMEHCn/5NqkmkxhznT2LFsFpOoskGcuZKo+HFGwK5WSAvnWhv983PHsX8Q48wTk9JdAg
 27duMFBRqUMQ5s73RvaBK7fmsPVc=
X-Gm-Gg: ASbGncvtF6lBS9dlO7nh4ZoL4fVQfgGRp6FuQsHb/RulKapoTDCC1xjRjr63gKY59s+
 fmCyZjuT2Xio4JPGG0gajG443fT3266nAv8Iz6R7Zm7ma989/ByLc7AOGnRdkW5FSGo89HPBwpC
 3kzXXkme4P2lZBK1utvS7BIQWYXTK9eydjjtoooNvwT+22ji4bh9Fa5Opd
X-Google-Smtp-Source: AGHT+IG5mK7LWEjBBjgvaPujR4uL+pD+1vaxQJEnu5BLKGvcdiDqWZfp+hxnrvF2g8P0ICGFMFbUr3+qlHFH6S/5gSM=
X-Received: by 2002:a2e:b894:0:b0:30b:cc6a:ffd9 with SMTP id
 38308e7fff4ca-310903bc156mr905941fa.0.1744918172067; Thu, 17 Apr 2025
 12:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-5-18ec29b1b1f3@gmail.com>
 <68013a67.050a0220.8a966.0ee4@mx.google.com>
In-Reply-To: <68013a67.050a0220.8a966.0ee4@mx.google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 17 Apr 2025 15:28:56 -0400
X-Gm-Features: ATxdqUEYpB6Rcb7DkTbpdj8iW2c5U3MqBLy3k7sa8KPmXCWoLVopG5m6ePd31Ys
Message-ID: <CAJ-ks9neJ+8mwfa7UO-8ymM=AAOHrR0iH+NGA6B3c=DWT5Cu1Q@mail.gmail.com>
Subject: Re: [PATCH v9 5/6] rust: enable `clippy::cast_lossless` lint
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org
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

On Thu, Apr 17, 2025 at 1:29=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Wed, Apr 16, 2025 at 01:36:09PM -0400, Tamir Duberstein wrote:
> > Before Rust 1.29.0, Clippy introduced the `cast_lossless` lint [1]:
> >
> > > Rust=E2=80=99s `as` keyword will perform many kinds of conversions, i=
ncluding
> > > silently lossy conversions. Conversion functions such as `i32::from`
> > > will only perform lossless conversions. Using the conversion function=
s
> > > prevents conversions from becoming silently lossy if the input types
> > > ever change, and makes it clear for people reading the code that the
> > > conversion is lossless.
> >
> > While this doesn't eliminate unchecked `as` conversions, it makes such
> > conversions easier to scrutinize.  It also has the slight benefit of
> > removing a degree of freedom on which to bikeshed. Thus apply the
> > changes and enable the lint -- no functional change intended.
> >
> > Link: https://rust-lang.github.io/rust-clippy/master/index.html#cast_lo=
ssless [1]
>
> Hmm.. I agree with the solution mentioned from the lint URL, using
> `from()` is better, so..
>
> > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > Link: https://lore.kernel.org/all/D8ORTXSUTKGL.1KOJAGBM8F8TN@proton.me/
> > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  Makefile                        | 1 +
> >  drivers/gpu/drm/drm_panic_qr.rs | 2 +-
> >  rust/bindings/lib.rs            | 1 +
> >  rust/kernel/net/phy.rs          | 4 ++--
> >  rust/uapi/lib.rs                | 1 +
> >  5 files changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 57080a64913f..eb5a942241a2 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -476,6 +476,7 @@ export rust_common_flags :=3D --edition=3D2021 \
> >                           -Wclippy::all \
> >                           -Wclippy::as_ptr_cast_mut \
> >                           -Wclippy::as_underscore \
> > +                         -Wclippy::cast_lossless \
> >                           -Wclippy::ignored_unit_patterns \
> >                           -Wclippy::mut_mut \
> >                           -Wclippy::needless_bitwise_bool \
> > diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_pani=
c_qr.rs
> > index f2a99681b998..d28e8f199d11 100644
> > --- a/drivers/gpu/drm/drm_panic_qr.rs
> > +++ b/drivers/gpu/drm/drm_panic_qr.rs
> > @@ -386,7 +386,7 @@ fn next(&mut self) -> Option<Self::Item> {
> >          match self.segment {
> >              Segment::Binary(data) =3D> {
> >                  if self.offset < data.len() {
> > -                    let byte =3D data[self.offset] as u16;
> > +                    let byte =3D data[self.offset].into();
>
>         let byte =3D u16::from(data[self.offset]);
>
> otherwise, the code has not local indicator saying what type the byte
> is, and given its name is "byte" but it's really a `u16`, I think it's
> better we mention the type here.
>
> >                      self.offset +=3D 1;
> >                      Some((byte, 8))
> >                  } else {
> > diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> > index 0486a32ed314..b105a0d899cc 100644
> > --- a/rust/bindings/lib.rs
> > +++ b/rust/bindings/lib.rs
> > @@ -25,6 +25,7 @@
> >  )]
> >
> >  #[allow(dead_code)]
> > +#[allow(clippy::cast_lossless)]
> >  #[allow(clippy::ptr_as_ptr)]
> >  #[allow(clippy::undocumented_unsafe_blocks)]
> >  mod bindings_raw {
> > diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> > index a59469c785e3..abc58b4d1bf4 100644
> > --- a/rust/kernel/net/phy.rs
> > +++ b/rust/kernel/net/phy.rs
> > @@ -142,7 +142,7 @@ pub fn is_autoneg_enabled(&self) -> bool {
> >          // SAFETY: The struct invariant ensures that we may access
> >          // this field without additional synchronization.
> >          let bit_field =3D unsafe { &(*self.0.get())._bitfield_1 };
> > -        bit_field.get(13, 1) =3D=3D bindings::AUTONEG_ENABLE as u64
> > +        bit_field.get(13, 1) =3D=3D bindings::AUTONEG_ENABLE.into()
>
>         bit_field.get(13, 1) =3D=3D u64::from(bindings::AUTONEG_ENABLE)
>
> >      }
> >
> >      /// Gets the current auto-negotiation state.
> > @@ -426,7 +426,7 @@ impl<T: Driver> Adapter<T> {
> >          // where we hold `phy_device->lock`, so the accessors on
> >          // `Device` are okay to call.
> >          let dev =3D unsafe { Device::from_raw(phydev) };
> > -        T::match_phy_device(dev) as i32
> > +        T::match_phy_device(dev).into()
>
>         i32::from(T::match_phy_device(dev))
>
> Thoughts? Better be explicit in these cases, IMO.

I changed the first two. This one I'll leave as `into()` because the
destination type is in the method signature, which is 5 lines above.

Thanks for the review!
