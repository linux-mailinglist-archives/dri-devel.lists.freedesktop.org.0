Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9864BE817F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 12:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E261510EBA0;
	Fri, 17 Oct 2025 10:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OtfpcKa6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2ED10EBA0;
 Fri, 17 Oct 2025 10:39:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8CF57642BA;
 Fri, 17 Oct 2025 10:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF588C4CEE7;
 Fri, 17 Oct 2025 10:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760697588;
 bh=RprQ24Rtq4TN2VnVsUyJn/KZ51hCTF6QCkb5xO6r6UQ=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=OtfpcKa6PADCrYcmtw+fZoMJAbmridwn+1wDlyfExy4QDleWi4+KSH7EtJH27VPSa
 lUkD9tW/P81U2V7+3rnYZx9KSdSOQNvIfBdI++Z0z4mKAK3qQFtRJY8qoKuW52Rwyg
 9G3gfBMDP0LUB7wmtEB2xUmsWun9sw4m9iYO1LbY0nGPk4OpuoOlkT5nf1zuHoIYA2
 6D3015o9H3A0uLjHCVEl146PSYMEpP6weoXbiqFFF24m7aRTlPsC25t8lpKsWtl/ul
 eKhYzbJaoUXm0z1YmT3vexRnx5Vgx+VaNhfmmteutkS0moN/C5r4FVcJTrO34aLPf/
 74gzhxl5dxvbw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 12:39:42 +0200
Message-Id: <DDKJ7AWIL0CN.32FB27N70K2YS@kernel.org>
Subject: Re: [PATCH v5 03/14] gpu: nova-core: gsp: Create wpr metadata
Cc: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-4-apopple@nvidia.com>
 <DDJJ4ECCSE2I.1EUAJRU9JBGNI@nvidia.com>
 <zwaefk62to77b5nyakeiboyj53fge3lysc3z7arp54tyyherdo@nsqhuig7bmbc>
 <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
 <DDK6IHKS13RS.3UVIM301BBFUP@nvidia.com>
 <ckwuxk7ohtkbpqk345kzypkafu6bkshwbgshie2bq2vzwhj4pv@5wu4u6htkcuq>
 <DDK7OP7VPVD0.1G6XJ4WCFFF02@nvidia.com>
In-Reply-To: <DDK7OP7VPVD0.1G6XJ4WCFFF02@nvidia.com>
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

On Fri Oct 17, 2025 at 3:38 AM CEST, Alexandre Courbot wrote:
> On Fri Oct 17, 2025 at 10:15 AM JST, Alistair Popple wrote:
>> On 2025-10-17 at 11:43 +1100, Alexandre Courbot <acourbot@nvidia.com> wr=
ote...
>>> On Fri Oct 17, 2025 at 8:11 AM JST, Danilo Krummrich wrote:
>>> > On Fri Oct 17, 2025 at 1:03 AM CEST, Alistair Popple wrote:
>>> >> On 2025-10-16 at 17:23 +1100, Alexandre Courbot <acourbot@nvidia.com=
> wrote...
>>> >>> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
>>> >>> > +impl GspFwWprMeta {
>>> >>> > +    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &Fb=
Layout) -> Self {
>>> >>> > +        Self(bindings::GspFwWprMeta {
>>> >>> > +            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
>>> >>> > +            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISI=
ON),
>>> >>> > +            sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handl=
e(),
>>> >>> > +            sizeOfRadix3Elf: gsp_firmware.size as u64,
>>> >>>=20
>>> >>> Very unfortunately I'm afraid we will need to replace the `as` in t=
his
>>> >>> method with `u64::try_from` and make it return a `Result` for now.
>>> >>
>>> >> And presumably most of the other `as` keywords in this function deal=
ing with
>>> >> usize as well? Have made the change but would you mind quickly expla=
ining
>>> >> why this is needed? Is the concern that usize might be more than 64 =
bits or
>>> >> something?
>>>=20
>>> Indeed, the concern is that `as` performs a lossy conversion without
>>> warning, which could catch us off-guard if e.g. some type changes in th=
e
>>> bindings.
>>>=20
>>> >
>>> > Since nova-core depends on CONFIG_64BIT, I think we want a helper fun=
ction that
>>> > converts usize to u64 infallibly.
>>> >
>>> > This helper function can simply generate a compile time error, when
>>> > !CONFIG_64BIT, etc.
>>> >
>>> > We can do this locally in nova-core, but it could also find it's plac=
e in the
>>> > generic infrastructure. nova-core clearly won't be the last driver ru=
nning into
>>> > this inconvinience.
>>>=20
>>> That would definitely be the correct way to address this.
>>
>> Sure. Although I don't really have a problem with the binding constructo=
rs being
>> fallible as plenty of the others are anyway.
>
> I think we can address the non-fallible conversions as a separate task
> (as there are many sites that could be similarly optimized in the
> nova-core code), so fallible constructors are acceptable imho.

The infallible conversion function is trivial to implement.

If you prefer, we can also add it in nova-core first and subsequently move =
it to
generic infrastructure.

I prefer not to introduce more as-casts or fallible conversions we have to =
clean
up subsequently.
