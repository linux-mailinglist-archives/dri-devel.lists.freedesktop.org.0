Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19DFADEE6B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6481B10E858;
	Wed, 18 Jun 2025 13:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YlMtIFjz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AB110E857;
 Wed, 18 Jun 2025 13:52:11 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-32add56e9ddso56599231fa.2; 
 Wed, 18 Jun 2025 06:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750254730; x=1750859530; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yHetTVGjM9N9vKhqDfTQfQXf30L+g0MXCJcXiaNoNyE=;
 b=YlMtIFjzf/Lon7gysaNQyhxeaha9IfEWPH5jvhZDbtXEV983dCQGtO58/+sNOcDYJz
 lWh/0V1L9BgVHNSiLdxeJK8rTUICqT4E12TUzMrGuVQBLeoUNF5Sf78Av7eDCY5WLaCW
 OeFBaQAYi1QTbL3hTiZ1ZuLHMzAnO3nwYbHQEmKQ4bImMgailROlFHMNer4UuLRm6vqo
 gxxV1IJZKv3zqvhP8/sRg3Ztlx1j3zGskFrYcQpWybmv3INF4947IviCVUrVRjQqLreq
 UFIQF7jlu4Uu3LhopOt2nf0D86a2NnXtN6d5KB8wYY216nv51mlfD2wvUFrNGA9H3aK2
 2Wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750254730; x=1750859530;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yHetTVGjM9N9vKhqDfTQfQXf30L+g0MXCJcXiaNoNyE=;
 b=B3Zg4WzAQ5qp2e+bymIR+yFQEQoMjiObaQeUo/E2I/+xCUtNXX+cRtu84z97qeBo4I
 kfDFsBcSf903iLxpo6INg/C6jW+trUAJMF1BbC07D2EdYmAacj1f01+4XEINQ5FtswwY
 6a18/L5guYze2OgBd7kKqoiKdw9jowryFpcZ/3R/uREDJe/Izws8s4SHR9XMf5d7BDlF
 oq2PAO39VNKZMPvA1hF8IE1YFBfCRRT2hQDPfNgl37eDthusxKqyBTW/3pQqknKIopWQ
 1SuaCnIjoqYjFw07Goqwmh62EPaJ1nlh+6mnMJLhzsp8nA4rrQYwrnsEXUV4cl/yEA6g
 oVTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOCCjpllYyRbYkUSWG/wqAdj8Ap9eesGitkc3+G+ROZMz8VsJNplosdnRPEVHNDLA7CoWMM4o1I7I=@lists.freedesktop.org,
 AJvYcCVvntQXVPs1JxqRUqgNH9TsKk4/1NalRYQ/CLidJnL2LPUZ2vV2jCfqEsGLsx9vk3wgZ8/PLkQ+vw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoMydU+HFqOe3jdogCgDwC11YpKA0rLCkPmxCJpWIh6rKbURbK
 QR4DtAEJOJXSsUrU5dslq74Z9Zzkz5diJiJ/+9x1DQihamZATci+aydxwChHnNpW6B9pNSQ1ND2
 LmT+PtPYGKnCCynh12rrF8D8qHSTOX+8=
X-Gm-Gg: ASbGncsGDyzEkSz4AgKCOm8I1XcFnPNJipGnKOzpdsWmw79JzWyWGItMRUKcGvSg/zT
 jcm/R1wSYzYCYWmNBkspLCCce7L8UYGs3/NheaatAOUWaig3iK7m9Fv1NHrc4FuiwKw+s3rvw1V
 kJ/JwBb4cm+4bBsLHsjSthCQu043uzUVagxU2E6+caIXe8JuL2CqSQNAuZxjE=
X-Google-Smtp-Source: AGHT+IHjpP0oUsGl8bs9dihRSaXuYuFr91sSYke6woCI9t3nFqjg18OJME02qGfpZHIEHpORU6xHL6DoZtudcacLwZI=
X-Received: by 2002:a05:651c:2203:b0:30b:edfc:5d8a with SMTP id
 38308e7fff4ca-32b4a0131c3mr43917741fa.0.1750254729384; Wed, 18 Jun 2025
 06:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-5-f43b024581e8@gmail.com>
In-Reply-To: <20250615-ptr-as-ptr-v12-5-f43b024581e8@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 18 Jun 2025 09:51:33 -0400
X-Gm-Features: AX0GCFugcq7xsGtJtMG4-YlwkWLR_JC0Fxzt1KWhWAbz9DyagkQH0rU9bmUM3y8
Message-ID: <CAJ-ks9=P=N=5L8yre_C7xKoEt=t0f=Sf3ZY5POHuhb_3+5GO3w@mail.gmail.com>
Subject: Re: [PATCH v12 5/6] rust: enable `clippy::cast_lossless` lint
To: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Benno Lossin <lossin@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Breno Leitao <leitao@debian.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Sun, Jun 15, 2025 at 4:55=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Before Rust 1.29.0, Clippy introduced the `cast_lossless` lint [1]:
>
> > Rust=E2=80=99s `as` keyword will perform many kinds of conversions, inc=
luding
> > silently lossy conversions. Conversion functions such as `i32::from`
> > will only perform lossless conversions. Using the conversion functions
> > prevents conversions from becoming silently lossy if the input types
> > ever change, and makes it clear for people reading the code that the
> > conversion is lossless.
>
> While this doesn't eliminate unchecked `as` conversions, it makes such
> conversions easier to scrutinize.  It also has the slight benefit of
> removing a degree of freedom on which to bikeshed. Thus apply the
> changes and enable the lint -- no functional change intended.
>
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#cast_loss=
less [1]
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://lore.kernel.org/all/D8ORTXSUTKGL.1KOJAGBM8F8TN@proton.me/
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

@Danilo Krummrich could you please have a look for drm and nova?

> ---
>  Makefile                             | 1 +
>  drivers/gpu/drm/drm_panic_qr.rs      | 4 ++--
>  drivers/gpu/nova-core/regs.rs        | 2 +-
>  drivers/gpu/nova-core/regs/macros.rs | 2 +-
>  rust/bindings/lib.rs                 | 1 +
>  rust/kernel/net/phy.rs               | 4 ++--
>  rust/uapi/lib.rs                     | 1 +
>  7 files changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 0ba22c361de8..29cf39be14de 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -481,6 +481,7 @@ export rust_common_flags :=3D --edition=3D2021 \
>                             -Wclippy::all \
>                             -Wclippy::as_ptr_cast_mut \
>                             -Wclippy::as_underscore \
> +                           -Wclippy::cast_lossless \
>                             -Wclippy::ignored_unit_patterns \
>                             -Wclippy::mut_mut \
>                             -Wclippy::needless_bitwise_bool \
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_=
qr.rs
> index dd55b1cb764d..6b59d19ab631 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -404,7 +404,7 @@ fn pop3(&mut self) -> Option<(u16, usize)> {
>              let mut out =3D 0;
>              let mut exp =3D 1;
>              for i in 0..poplen {
> -                out +=3D self.decimals[self.len + i] as u16 * exp;
> +                out +=3D u16::from(self.decimals[self.len + i]) * exp;
>                  exp *=3D 10;
>              }
>              Some((out, NUM_CHARS_BITS[poplen]))
> @@ -425,7 +425,7 @@ fn next(&mut self) -> Option<Self::Item> {
>          match self.segment {
>              Segment::Binary(data) =3D> {
>                  if self.offset < data.len() {
> -                    let byte =3D data[self.offset] as u16;
> +                    let byte =3D u16::from(data[self.offset]);
>                      self.offset +=3D 1;
>                      Some((byte, 8))
>                  } else {
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 5a1273230306..c1cb6d4c49ee 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -32,7 +32,7 @@ pub(crate) fn architecture(self) -> Result<Architecture=
> {
>      pub(crate) fn chipset(self) -> Result<Chipset> {
>          self.architecture()
>              .map(|arch| {
> -                ((arch as u32) << Self::IMPLEMENTATION.len()) | self.imp=
lementation() as u32
> +                ((arch as u32) << Self::IMPLEMENTATION.len()) | u32::fro=
m(self.implementation())
>              })
>              .and_then(Chipset::try_from)
>      }
> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core=
/regs/macros.rs
> index 7ecc70efb3cd..6851af8b5885 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -264,7 +264,7 @@ pub(crate) fn $field(self) -> $res_type {
>          pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self=
 {
>              const MASK: u32 =3D $name::[<$field:upper _MASK>];
>              const SHIFT: u32 =3D $name::[<$field:upper _SHIFT>];
> -            let value =3D ((value as u32) << SHIFT) & MASK;
> +            let value =3D (u32::from(value) << SHIFT) & MASK;
>              self.0 =3D (self.0 & !MASK) | value;
>
>              self
> diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> index 81b6c7aa4916..7631c9f6708d 100644
> --- a/rust/bindings/lib.rs
> +++ b/rust/bindings/lib.rs
> @@ -25,6 +25,7 @@
>  )]
>
>  #[allow(dead_code)]
> +#[allow(clippy::cast_lossless)]
>  #[allow(clippy::ptr_as_ptr)]
>  #[allow(clippy::undocumented_unsafe_blocks)]
>  #[cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_tr=
ansmutes))]
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index 32ea43ece646..65ac4d59ad77 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -142,7 +142,7 @@ pub fn is_autoneg_enabled(&self) -> bool {
>          // SAFETY: The struct invariant ensures that we may access
>          // this field without additional synchronization.
>          let bit_field =3D unsafe { &(*self.0.get())._bitfield_1 };
> -        bit_field.get(13, 1) =3D=3D bindings::AUTONEG_ENABLE as u64
> +        bit_field.get(13, 1) =3D=3D u64::from(bindings::AUTONEG_ENABLE)
>      }
>
>      /// Gets the current auto-negotiation state.
> @@ -427,7 +427,7 @@ impl<T: Driver> Adapter<T> {
>          // where we hold `phy_device->lock`, so the accessors on
>          // `Device` are okay to call.
>          let dev =3D unsafe { Device::from_raw(phydev) };
> -        T::match_phy_device(dev) as i32
> +        T::match_phy_device(dev).into()
>      }
>
>      /// # Safety
> diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
> index e79a1f49f055..08e68ebef606 100644
> --- a/rust/uapi/lib.rs
> +++ b/rust/uapi/lib.rs
> @@ -14,6 +14,7 @@
>  #![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
>  #![allow(
>      clippy::all,
> +    clippy::cast_lossless,
>      clippy::ptr_as_ptr,
>      clippy::undocumented_unsafe_blocks,
>      dead_code,
>
> --
> 2.49.0
>
