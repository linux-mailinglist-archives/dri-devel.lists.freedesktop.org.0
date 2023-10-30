Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 194817DBC2D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 15:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673B510E2E8;
	Mon, 30 Oct 2023 14:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FB510E2E8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 14:56:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 39ABDB80D33;
 Mon, 30 Oct 2023 14:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F577C433C8;
 Mon, 30 Oct 2023 14:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698677802;
 bh=hUDk2Io0tpBbunzEzOh3GdRHINjI3oZ+1i6zPqaIY5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n+YUrvm/Je0u2606XoTNwXzqCSKihU42ijdLZc/jjbBEGk/ugjwcQ2p1JxL+XofT/
 /dbY5fdORG38mNA1D5MN6wz98rpeQ8+z48OXzszOKWnlUUbQulz/NQgGLfjtxe7cMv
 8CzFZ9Up1NESuhH0g0xM7UInq5MCcbcEhjmzuaVDartMMOFN1wpIhhIunG0Tagl2p3
 3vafCm1M6gRGJ7cF0cUOjt/DAF5iVu6DW1dAkUuNOkmiVAbNd0MrGKc0L0SG9nOBJ0
 1jJvm3oHIfK7b8kRkpIasDC63go2nH0zcbpY8HYGv8mvZDxdcoP4K/YQZczDTyfBf7
 Hsabcm+n4JvRA==
Date: Mon, 30 Oct 2023 15:56:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH 2/8] drm/loongson: Introduce a drm bridge driver for
 it66121 HDMI transmitter
Message-ID: <yuh7hs5va54tjzxpcjg35t3mdxhdkufmoo3q3vxxvqkbcegmki@khuaxihfv2i5>
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
 <20231029194607.379459-3-suijingfeng@loongson.cn>
 <CAA8EJprjQXcTgxnC1POaBjVBzyVBvKpmKyJcCR5ExRUhVxtYoQ@mail.gmail.com>
 <3ccb9600-6990-4ec7-81de-0d7b4e1294eb@loongson.cn>
 <CAA8EJpqCe2j3GyeutnwTB0bkGXGk0az9-w3sPHLFwMVgAS=e7g@mail.gmail.com>
 <df176548-0001-4df4-b556-6227b776cd18@loongson.cn>
 <e4ozgwe7g5s3bioywxqcetuqwxk6byvz2lr3swlgy7wutxcxkp@obvvszcgz2qw>
 <9926d2cf-5f92-4f4a-bc4d-423b07e38a3c@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3na4bddtqnsdu2tn"
Content-Disposition: inline
In-Reply-To: <9926d2cf-5f92-4f4a-bc4d-423b07e38a3c@loongson.cn>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3na4bddtqnsdu2tn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2023 at 10:39:32PM +0800, Sui Jingfeng wrote:
> Hi,
>=20
>=20
> On 2023/10/30 21:39, Maxime Ripard wrote:
> > On Mon, Oct 30, 2023 at 09:25:50PM +0800, Sui Jingfeng wrote:
> > > I think my approach provide a solution, while still keep the bridges =
drivers
> > > to a modular at the same time. Despite simple, it indeed solve the pr=
oblem.
> > > It simple because of explicit control of the loading order by myself,=
 not by
> > > rely on the framework or something else (say component)
> > >=20
> > > It is not totally duplicating, I have rewrite part of them. You can c=
ompare
> > > to see what I'm changed. It is just that it66162 was upstream-ed earl=
ier than
> > > our solution. But I also have write display drivers for lt8618 and lt=
8619
> > > completely by myself.
> > >=20
> > > Even though our local drm bridges driver will not be able to enjoy th=
e updates.
> > > We will accept such a results(or pain). I can maintain our local drm =
bridges
> > > drivers by myself. Sorry, on this technique point, we will not follow=
 your idea.
> > > I'm sure that my approach is toward to right direction for our device=
 at now.
> > > If someone invent a better solution to handle this problem, which mak=
e the
> > > various drm bridges drivers usable out of box, then I will follow and=
 cooperate
> > > to test.
> > As far as I'm concerned, the two options are either you reuse the
> > already existing driver or this series isn't merged.
>=20
> It's not that I don't want to use thealready existing display bridge driv=
er,
> It is just that it is not suitable for non DT-based system to use.

The code is there, you can modify it to make it suitable for non
DT-based systems.

> Our system using UEFI+ACPI, beside the I2C, there also have GPIO HPD
> interrupt hardware. ACPI-based system and DT-based system have
> different way to use(request) the hardware. Can you feel my words?

Not really, no. There's plenty of drivers supporting both ACPI and DT
based systems.

> If the variousdisplay bridge drivers are really ready to use

Nobody said they would be ready to use. You are expected to make them
work for you though.

> why I have to refuse?

I mean, you can totally refuse to do whatever we ask. Just like we can
also totally refuse to merge these patches.

Maxime

--3na4bddtqnsdu2tn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZT/EJwAKCRDj7w1vZxhR
xc7XAP9IxCtEYb2zQLmicNGCaDXghhWwpXmiDNmbg0NxoJnpcwD8CvcunFd0uffN
+wKV4ZyoRME0xCPiOxPfdRozdwbSjAM=
=ckG7
-----END PGP SIGNATURE-----

--3na4bddtqnsdu2tn--
