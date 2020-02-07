Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D1A15714E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95CD6E95A;
	Mon, 10 Feb 2020 08:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAC46EAC8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 13:52:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 0478629567D
Date: Fri, 7 Feb 2020 08:52:51 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v4 5/7] drm/panfrost: Add support for multiple power
 domains
Message-ID: <20200207135251.GA2952@kevin>
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-6-drinkcat@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200207052627.130118-6-drinkcat@chromium.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Mon, 10 Feb 2020 08:59:10 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 ulf.hansson@linaro.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1595013725=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1595013725==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +	for (i = 0; i < ARRAY_SIZE(pfdev->pm_domain_devs); i++) {
> +		if (!pfdev->pm_domain_devs[i])
> +			break;

I'm not totally familiar with this code, but should this be a break or
just a continue?


--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl49a6kACgkQ/v5QWgr1
WA1bjxAAnLaxUD3zjRv8cz282ucvOS+zEVrsYCEtVHJXAXsVa6qH9W4rTswmRCnU
0xfwIFqVmUch1QzZgxsqX42RrVZPNU20eN1qspQgEfXnIttVsTSzvgnEwHw22TCn
nr/f+tKDnIRFzz4PZ9ywTyzLBJNYJwR00QoMKTg//184tvoAWDrm0k0h7iVx7X96
mymCuf6jWpfB24TlTTvcXTCDUcoPVWZqJ1rppHtVV10E0a6VRKRURli75q6d4uBU
T4yqc02JSUvyaOm8KF5LNce0FOGeEMiQFfEG4jRP1y5FYVuPOoJciB3Gtv7JSeaa
Tg0PCBs7BYNbIlkLcxYyPjnwD60L5l1IxD5lKzF0DJJucuqoRQP1gpz5kZaLmEOj
kvXi8P0Bx87ZaF2ghgX+l/IKFLiwHpLfE4BzG6VMLUSE/Nher4Tcvz7+3AbsTBhD
pJ5tcommgF4KYUkEZ7rfNDD1G5f6h+c7yNMpeUOIadPyMY47NIpr3TBCpZJGiJ02
nSwt3k/7Y5Hig0OZxypHVgqyBD3FycMPoQpelBC4/gZH4w59DKlE42VBqc8977m/
dv1vv3QPS0w0RNKO4FnH+N63RnHovNNsUbNAsQkS7GldSGnbCQymGHXRniSdO7XT
cbs14xJbzZ09gdyTGmybAsL1RKMT1YqGG1/3RSeS7bSOwyFX8Wg=
=dMt0
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--

--===============1595013725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1595013725==--
