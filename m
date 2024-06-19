Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB5D90F318
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 17:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B23F10E244;
	Wed, 19 Jun 2024 15:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IylMLhlN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E7B10E244
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 15:52:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E7DE561E71;
 Wed, 19 Jun 2024 15:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87025C2BBFC;
 Wed, 19 Jun 2024 15:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718812334;
 bh=B/QDewZ8f8pxC39ZfdvW4tjMlJycPZjA3D7QbLHaMqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IylMLhlNZi/cBkkmZVPI7bXXgrSd1kDiDEp6eLLOo2nGFroQz5C5LHISQRpu8OsT1
 ZebKIkh/37BE+tCC0dPbTunx+Jf7mW8Lc/X9ck1GnvrdFV8SeypZlwHN5y4jU0KjX4
 /Om4T7tnb4jG4zTwBY1QpJBsKP21M1OBf8KPqReV2NUXM/7Ia9OgMKi5a9I82MS75F
 fwMjiOFF79nRb6ImdtvUJ9f9VwuKSH9ux6kPUoE0ufCRYD2awuICQff7QG5YsKlyVv
 axYsRc5alGXsGKOx+fl5Ye2CssDPfd7Be2SuLIfb099sEGElhi8KhOh1MpHQddk4Be
 A4y3g2uw6MFjg==
Date: Wed, 19 Jun 2024 16:52:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 18/23] regulator: add s2dos05 regulator support
Message-ID: <c17669b2-5fa0-40d4-b88d-8dee6a264321@sirena.org.uk>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-18-e3f6662017ac@gmail.com>
 <4eab619f-6da9-4aff-b956-69d8e2ecd47f@sirena.org.uk>
 <CABTCjFDUKgeYWuwo8eLt+5WD=4O+kLbFwMRxsTufGnqK0Ecpvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sNyOiMkks8z+Tn4L"
Content-Disposition: inline
In-Reply-To: <CABTCjFDUKgeYWuwo8eLt+5WD=4O+kLbFwMRxsTufGnqK0Ecpvg@mail.gmail.com>
X-Cookie: Don't I know you?
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


--sNyOiMkks8z+Tn4L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 06:49:06PM +0300, Dzmitry Sankouski wrote:
> =D0=B2=D1=82, 18 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 17:08, M=
ark Brown <broonie@kernel.org>:
> > On Tue, Jun 18, 2024 at 04:59:52PM +0300, Dzmitry Sankouski wrote:

> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * s2dos05.c - Regulator driver for the Samsung s2dos05
> > > + *

> > Please make the entire comment a C++ one so things look more
> > intentional.

> Do you mean enclosing the first line (license identifier) in /* */
> style comment?

No, that would be a C comment.  Please use C++ style for the rest of the
header as well as the first line.

--sNyOiMkks8z+Tn4L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZy/qMACgkQJNaLcl1U
h9DGWQgAgOa8X/ixdsOMeRWsYHbb7eeKRUufmB/VZK2WyLNILPGYtncD6cuJ+cLr
AvUANsF0WqGXnetxElS8Y2jV21tcbGNT1eGe64GUPss6hdDebteb63GcRbB8N0Fd
3L+HI4CWnr1oqwLzGGmVRLifr3h/4alGz6R+jy9O5drxEHxalZPdRFVdjbZ8jyr/
3jg43CkWP2vdnZz08OObTm8jI197PhpxgFleekSlSmPqIqtMV/a3krF5CCSh4M8V
n1CJGe6mr4M9lSZ3UpDJQCzWW7EfTmM1iu8RW6IpF5T6JZFtj+cwfS9Ba6kIK4+E
zrmidAhG51b6MN5sNypIpxv0bh1Jxw==
=zdP0
-----END PGP SIGNATURE-----

--sNyOiMkks8z+Tn4L--
