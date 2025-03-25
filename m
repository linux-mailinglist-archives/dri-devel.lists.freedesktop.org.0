Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F395CA6EDE3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 11:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFA110E2CD;
	Tue, 25 Mar 2025 10:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="aIHo0FKZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02F710E2CD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=cazukxct4je5rfknpomo5ndhoy.protonmail; t=1742899198; x=1743158398;
 bh=7Qxu14y7hXsByiWaRphWUIUPNCDRSXJiL8l6Iwsjd+o=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=aIHo0FKZH0kRllaPjkCGXFAr6LoxqTKm7hgdunLsTv4w5oVNQtrGYaBtwwFM+3+Xf
 qb4LhaahWEaV+TcejHjZHz9kb3ta7oFcwRu+LTwldD/khMWlbvdAjibUuTslYBolxf
 XXuNAfr8AkRPJ4BxpAOPyFK8CpuDZ0j7OmDpiAGN3D8IirMPcqDu3Jf3SliaHYKu3D
 P9xlyRyG9v1oxDDOrFqCEk2wLMAgSZf59WKZHklHsEj4PaYmqTT2wDB7bkKONR/Dod
 9ko2k1DPmIVnQTn6h28XdhksWdmirA7W0Xto5S73RspeL499sOmWaw9h52GP5aS/qy
 IFDNr70n0Yxig==
Date: Tue, 25 Mar 2025 10:39:54 +0000
To: Tamir Duberstein <tamird@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>,
 Rae Moar <rmoar@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy
 <robin.murphy@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org,
 linux-block@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org
Subject: Re: [PATCH v6 6/6] rust: enable `clippy::cast_lossless` lint
Message-ID: <D8PA773W07SS.3T2SZUIJH4HOH@proton.me>
In-Reply-To: <20250324-ptr-as-ptr-v6-6-49d1b7fd4290@gmail.com>
References: <20250324-ptr-as-ptr-v6-0-49d1b7fd4290@gmail.com>
 <20250324-ptr-as-ptr-v6-6-49d1b7fd4290@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: d544dfa742d24e7be7a673d1c81bdd5dcc22818d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Mon Mar 24, 2025 at 11:01 PM CET, Tamir Duberstein wrote:
> Before Rust 1.29.0, Clippy introduced the `cast_lossless` lint [1]:
>
>> Rust=E2=80=99s `as` keyword will perform many kinds of conversions, incl=
uding
>> silently lossy conversions. Conversion functions such as `i32::from`
>> will only perform lossless conversions. Using the conversion functions
>> prevents conversions from becoming silently lossy if the input types
>> ever change, and makes it clear for people reading the code that the
>> conversion is lossless.
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
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

One nit below, but you may add:

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

> ---
>  Makefile                        |  1 +
>  drivers/gpu/drm/drm_panic_qr.rs | 10 +++++-----
>  rust/bindings/lib.rs            |  2 +-
>  rust/kernel/net/phy.rs          |  4 ++--
>  4 files changed, 9 insertions(+), 8 deletions(-)

> diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> index 0486a32ed314..591e4ca9bc54 100644
> --- a/rust/bindings/lib.rs
> +++ b/rust/bindings/lib.rs
> @@ -25,7 +25,7 @@
>  )]
> =20
>  #[allow(dead_code)]
> -#[allow(clippy::ptr_as_ptr)]
> +#[allow(clippy::cast_lossless, clippy::ptr_as_ptr)]

Not sure if we instead want this in a separate attribute, ultimately it
doesn't really matter, but why should `undocumented_unsafe_blocks` be
special?

---
Cheers,
Benno

>  #[allow(clippy::undocumented_unsafe_blocks)]
>  mod bindings_raw {
>      // Manual definition for blocklisted types.

