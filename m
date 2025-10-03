Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AC5BB7D0E
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 20:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E7510E953;
	Fri,  3 Oct 2025 18:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wid78YSd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084EF10E953;
 Fri,  3 Oct 2025 18:00:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CE3DA62086;
 Fri,  3 Oct 2025 18:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB1DC4CEF5;
 Fri,  3 Oct 2025 18:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759514406;
 bh=I/qWDMKQv5qKzeMlqK751O9Q0IyCyXsvYmApunFN05k=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=Wid78YSdBNA2CatxdLycAAbOphm7XEZslawm5fH4LIcQ9Y5wuvC1tWARj1iZ74ZTb
 lxuTv20ujrbyvMnZ4WAUUVxxW+Z8JeFmPiUqqj6ra2InZMI9Eu/JI0Pmj/HyywN/Fj
 yrh24wr0xbb+HWsMjUBznlus80UmGWPmix4KPmdBVv3hp4MxCta8vjhhPGinVHgKg3
 9p8GItUsDDrJDUrLuffAXf+IYA2FisGjbs4ptSPi+XerKmrs+KtQc+kdOjNlAGi8JO
 JOs6yg8i74hieXqEjbc20ojq7tYJ1hOBMwuS0yl6IKU2ULGrcdWjLaq7+aJZ6o9VG9
 J7Va0OTAjeQLg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Oct 2025 19:59:59 +0200
Message-Id: <DD8VSSFRFC46.X5BFWEV3JAH2@kernel.org>
Subject: Re: [PATCH v3 08/13] gpu: nova-core: Add bindings and accessors for
 GspSystemInfo
From: "Benno Lossin" <lossin@kernel.org>
To: "Janne Grunau" <j@jannau.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20250930131648.411720-1-apopple@nvidia.com>
 <20250930131648.411720-9-apopple@nvidia.com>
 <DD7VU4239GS2.2MKVFPBFEY1R4@nvidia.com>
 <DD8TZ3TU57L3.2958OTC9UP4VF@kernel.org>
 <20251003172517.GA1574227@robin.jannau.net>
In-Reply-To: <20251003172517.GA1574227@robin.jannau.net>
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

On Fri Oct 3, 2025 at 7:25 PM CEST, Janne Grunau wrote:
> On Fri, Oct 03, 2025 at 06:34:12PM +0200, Benno Lossin wrote:
>> On Thu Oct 2, 2025 at 3:49 PM CEST, Alexandre Courbot wrote:
>> > Hi Alistair, (+Benno as this concerns the `init!` macros)
>> >
>> > On Tue Sep 30, 2025 at 10:16 PM JST, Alistair Popple wrote:
>> >> Adds bindings and an in-place initialiser for the GspSystemInfo struc=
t.
>> >>
>> >> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> >>
>> >> ---
>> >>
>> >> It would be good to move to using the `init!` macros at some point, b=
ut
>> >> I couldn't figure out how to make that work to initialise an enum rat=
her
>> >> than a struct as is required for the transparent representation.

Oh by the way, enums are not supported due to a language limitation,
see:

    https://github.com/Rust-for-Linux/pin-init/issues/59

>> > Indeed we have to jump through a few (minor) hoops.
>> >
>> > First the `init!` macros do not seem to support tuple structs. They
>> > match a `{` after the type name, which is not present in
>> > `GspSystemInfo`. By turning it into a regular struct with a single
>> > field, we can overcome this, and it doesn't affect the layout the
>> > `#[repr(transparent)]` can still be used.
>>=20
>> Yeah that's the correct workaround at the moment. I'm tracking support
>> for tuple structs in [1]. Essentially the problem is that it requires
>> lots of effort to parse tuple structs using declarative macros. We will
>> get `syn` this cycle, which will enable me to support several things,
>> including tuple structs.
>>=20
>> [1]: https://github.com/Rust-for-Linux/pin-init/issues/85
>>=20
>> > Then, due to a limitation with declarative macros, `init!` interprets
>> > `::` as a separator for generic arguments, so `bindings::GspSystemInfo=
`
>> > also doesn't parse. Here the trick is to use a local type alias.
>>=20
>> This one will also be solved when we switch to syn.
>
> I was planning to submit
> https://github.com/AsahiLinux/linux/commit/2d95fd3b6c359634a0976f27f7a3c6=
67826256da
> https://github.com/AsahiLinux/linux/commit/515638cb47cf0ebdac378686fcbbdc=
6a8364096a
> from the asahi downstream tree after 6.18-rc1. Does that still make
> sense timing wise?

Probably not, since I'll depend on the syn patches this cycle which will
mean that pin-init supports tuples in 6.19.

> Types with type paths are used extensively in the asahi driver but I can
> initially work around that.

Yeah they should be supported simply by moving to syn, hope it doesn't
introduce too much pain in the next cycle.

---
Cheers,
Benno
