Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8597DBB01
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 14:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8081A10E2C7;
	Mon, 30 Oct 2023 13:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D14110E2C3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 13:39:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D14560A6C;
 Mon, 30 Oct 2023 13:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF366C433C8;
 Mon, 30 Oct 2023 13:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698673164;
 bh=7172ARlU093nkC66v/TSAxNqYCux9x9VPI6S/wkzmys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lzt2ZsLlDpz1OEOUgm5OhyaiQI5XcG7IK+uEdU4r7vy8/gi/eZDPzCuTC6uF+n2eu
 sMKznWxK+d17ECoihTOa0oX3+s8kdrpSXqWf5L4lNatY5arX9c6JDXlgUO2ObTLqxw
 X1B7RO9WnsNlAmUufbFx+UQ7MpYI46xw0GmUEnhkiY0NoWEz7wHdGTM70mu5zT5FAd
 jL/vOn3xOnB1yt2IgzyArGs7UJR6SwT47MF7aWA3Zwf8193xkkSKRXO2pVEVhyn5gj
 fsg/MhR601rxYuF6wWIyFp52PXAYSV7ovGmrWESMprENdkt+TQc/R0r5oL3Zm5A4Kj
 b5U1iRNTwqpHA==
Date: Mon, 30 Oct 2023 14:39:21 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH 2/8] drm/loongson: Introduce a drm bridge driver for
 it66121 HDMI transmitter
Message-ID: <e4ozgwe7g5s3bioywxqcetuqwxk6byvz2lr3swlgy7wutxcxkp@obvvszcgz2qw>
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
 <20231029194607.379459-3-suijingfeng@loongson.cn>
 <CAA8EJprjQXcTgxnC1POaBjVBzyVBvKpmKyJcCR5ExRUhVxtYoQ@mail.gmail.com>
 <3ccb9600-6990-4ec7-81de-0d7b4e1294eb@loongson.cn>
 <CAA8EJpqCe2j3GyeutnwTB0bkGXGk0az9-w3sPHLFwMVgAS=e7g@mail.gmail.com>
 <df176548-0001-4df4-b556-6227b776cd18@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2cbip6tmp5j2oowq"
Content-Disposition: inline
In-Reply-To: <df176548-0001-4df4-b556-6227b776cd18@loongson.cn>
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


--2cbip6tmp5j2oowq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2023 at 09:25:50PM +0800, Sui Jingfeng wrote:
> I think my approach provide a solution, while still keep the bridges driv=
ers
> to a modular at the same time. Despite simple, it indeed solve the proble=
m.
> It simple because of explicit control of the loading order by myself, not=
 by
> rely on the framework or something else (say component)
>=20
> It is not totally duplicating, I have rewrite part of them. You can compa=
re
> to see what I'm changed. It is just that it66162 was upstream-ed earlier =
than
> our solution. But I also have write display drivers for lt8618 and lt8619
> completely by myself.
>
> Even though our local drm bridges driver will not be able to enjoy the up=
dates.
> We will accept such a results(or pain). I can maintain our local drm brid=
ges
> drivers by myself. Sorry, on this technique point, we will not follow you=
r idea.
> I'm sure that my approach is toward to right direction for our device at =
now.
> If someone invent a better solution to handle this problem, which make the
> various drm bridges drivers usable out of box, then I will follow and coo=
perate
> to test.

As far as I'm concerned, the two options are either you reuse the
already existing driver or this series isn't merged.

Ignoring what issue we raised and still merging your patch isn't on the
table, sorry.

Maxime

--2cbip6tmp5j2oowq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZT+yCQAKCRDj7w1vZxhR
xWvFAP9k53SCPnaxsg9Uc5iHT3bjHKTMhbl+/6pokYTmjiB9WgD9FNBO2ztxI2Ah
lg/MJmIFuKoV4egJ7R5B5n987tYHZQk=
=hZBP
-----END PGP SIGNATURE-----

--2cbip6tmp5j2oowq--
