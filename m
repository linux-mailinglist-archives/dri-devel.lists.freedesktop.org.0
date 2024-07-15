Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57DD9316C9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 16:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5076A10E3D8;
	Mon, 15 Jul 2024 14:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PImOXatr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B532D10E3D8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 14:31:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 00FE4CE0E26;
 Mon, 15 Jul 2024 14:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AC1C32782;
 Mon, 15 Jul 2024 14:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721053883;
 bh=11zvZR4eorSWA2S4sGXe06K5qrHou5RJw9h8ZIDvnt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PImOXatrwKBgthehOT9gAHPf9j0Ax1+ns4EqUztwLT4DimJaqsvHI+bpEfvGoxVj6
 k6i42LEiDGx/wMRXMIWOFrCHpIXda9Qrn/Mm7Sn/EkNxxIytV9gOiqQAK/9oX5DBUK
 vaL72EL4hxJB36kyDX5xUOkjret0ZwtEyAKp3eP2HucZ+VR5rccMB4AfEPNZAcGeOb
 V6ilnFgZRZGxxGj1TSRtkKo8NqRY/YCiv3rBPAE2av4+0x8RLmO2FuNwG5GhrBfPO4
 yi/pd9CmNVN0x9I6mYqOAZzWQw/+8pbpej9qRssmspzvD0vaozkze6U2btG1HI39x5
 A6N/IgqQF15EQ==
Date: Mon, 15 Jul 2024 15:31:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Doug Anderson <dianders@google.com>
Cc: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jikos@kernel.org, benjamin.tissoires@redhat.co,
 linus.walleij@linaro.org, hsinyi@google.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 ekth6a12nay
Message-ID: <20240715-bunkhouse-freeness-c4367d3c298d@spud>
References: <20240715073159.25064-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240715073159.25064-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <CAD=FV=VHDksKiZXrauiipa3HjtK4sE5+dbmXmVfhFoM-RKQP6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="08zt4+beBDwHYsDl"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VHDksKiZXrauiipa3HjtK4sE5+dbmXmVfhFoM-RKQP6A@mail.gmail.com>
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


--08zt4+beBDwHYsDl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 07:22:30AM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Mon, Jul 15, 2024 at 12:32=E2=80=AFAM Zhaoxiong Lv
> <lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
> >
> > The Elan ekth6a12nay touch screen chip same as Elan eKTH6915 controller
> > has a reset gpio. The difference is that they have different
> > post_power_delay_ms.
> >
> > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> FWIW things have changed enough between V1 and V2 that you probably
> should have removed Conor's "Acked-by" tag here and waited for him to
> re-add it.

Yeah, good spot. I wouldn't have acked this version would asking
questions - in v1 it made sense not to have a fallback when "they have a
different post power delay ms", but now there is a fallback. Is the
fallback actually suitable here, or might it be a naive rebase? Does the
ekth6a12nay work with the ekth6915's reset timing?

Thanks,
Conor.

>=20
> I'd also note that when posting a patch your Signed-off-by should
> always be at the bottom of any collected tags. For reference [1].
>=20
> [1] https://lore.kernel.org/tools/20221031165842.vxr4kp6h7qnkc53l@meerkat=
=2Elocal/
>=20
> That being said, the new binding seems OK to me.
>=20
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

--08zt4+beBDwHYsDl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpUytgAKCRB4tDGHoIJi
0muqAPwO+LmBqGC0F7cwqQrirPYzWXD7X1Z9XL51rsb8ll4Y5QEAh5NNAFUOafyJ
77wn9KdmuxUL0ecyzMeTAif3F69GjgU=
=m7q2
-----END PGP SIGNATURE-----

--08zt4+beBDwHYsDl--
