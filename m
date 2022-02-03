Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC6C4A814B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDAD10EB61;
	Thu,  3 Feb 2022 09:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8335F10EB61
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 09:17:53 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 8EF24D0483
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 09:10:11 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2ADA51C0016;
 Thu,  3 Feb 2022 09:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643879405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N5lFeotoLzTN5kCN0UM+WEZDckbMzPiWVfyj9sOa7LI=;
 b=ZOIluF2DX5KOz3bnJVXHYCmozea5vI/W4iBTqlpnHvyTR3mIuocbVB3d27hmOysdZ4AbcP
 4eXM6CEqPyPHn2nyvaHGlzEw5nZXLdsv/1Sx2EbhM0ecF1y38Mxm59FlAOfk4JH+iEjz7g
 MUJoF+wIiCn3wYzlAgkNEy7xLRish8FnMyPSuCOG2UI+4r/cGjFQzzBn4PD1r2DExf7bEm
 eyGPnXiiWiAeMALQ0naaIJiwIpgPusky8PZUJnJY9qfJMtUc98lvUJkbBprkha10g8lxTr
 aI9F7eJ1lWb7xneGSUT7kdgwaf/JJN7x1BjxG0qAwEzlai+1555sGnQjdw3/dA==
Date: Thu, 3 Feb 2022 10:10:01 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v10 3/6] gpio: logicvc: Support compatible with major
 version only
Message-ID: <Yfub6cdC3eSzKtX+@aptenodytes>
References: <20220120150024.646714-1-paul.kocialkowski@bootlin.com>
 <20220120150024.646714-4-paul.kocialkowski@bootlin.com>
 <CACRpkdZnw-Tf2eQwO+LZRW4UacR09qWRWct00=XLb4pfa-N3=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H7ecIFcTJbb7eHUD"
Content-Disposition: inline
In-Reply-To: <CACRpkdZnw-Tf2eQwO+LZRW4UacR09qWRWct00=XLb4pfa-N3=g@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--H7ecIFcTJbb7eHUD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun 30 Jan 22, 01:43, Linus Walleij wrote:
> On Thu, Jan 20, 2022 at 4:00 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
>=20
> > Support the newly-introduced common compatible for version 3.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>=20
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Are there dependencies between the GPIO patches and the rest?
> Doesn't look like that.
> Can Bartosz just merge the GPIO stuff to the GPIO tree?

Yeah I think it's independent, no dependencies.

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--H7ecIFcTJbb7eHUD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmH7m+kACgkQ3cLmz3+f
v9FX2Af+MEyBnFYeHifMWfbhY7+pW3K+hTxA0/C2hO9QSoxWVliuCnniIMbx4Zjv
7IvyG1LHidWJk0jROw3BX3L872C0pdHTxmea38KZHIG1ustZAQMe47i5EpRdFM1S
QqBqhZuHtW67qijINPtXBx0vbPDTpiHVFa5F70cBNsaEW2/erdP1TT1LjoHIEx58
B9uLpQHtoI/lDiv5toafFaGv+ut3YeC6ZVw8xT/54mm/tUSM3P2qcTu+jEyZbYl6
EFW93rTK+q+aONuM80bXZyS1FeMDX535w9tCg7aDQmiUUf7My5Bamt6A0Rr+cQve
ZY+YSwuQ87Mgv8HrwLj648dmkHPNnQ==
=1K2m
-----END PGP SIGNATURE-----

--H7ecIFcTJbb7eHUD--
