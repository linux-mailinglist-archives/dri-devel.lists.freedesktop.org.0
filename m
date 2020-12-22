Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFE52E0DB8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 18:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1AE6E12D;
	Tue, 22 Dec 2020 17:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1276E12D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 17:14:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7374023130;
 Tue, 22 Dec 2020 17:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608657249;
 bh=66GEWSPJvzklIeHSRZpHVnCFR+8HJC+nKGb813bV9hI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aWs69kfw6Bu8vPoRm2mstM8cN5qc21cRYPUxea3N6r6e7jMT1rC4QPXZFbG1nQTSj
 80RmGS/kZR5s3vEUg57DgvdNXdHY9+qz0nXaIGOV/bCPh9jtUkfW0biDFkaPdjGO7C
 CPckUBTitQeTJn+0KSAIlVZ8d9WMZWlg/xot+gMfIC6sBR8y3w3UbTv8DExf5ZXkd5
 OsG4f0NxluCb1z9xA0rEcUYweusb35BWT4NrRInpBFXsYEbuoDIU5wAKkuZlNEhBQO
 wXekjpo5AkOVBPVRe+kbLym/4TXTDNET7R50Pw4JZOVdanEu3kSVIqnLrdb/bmawxe
 /qJfMLdp3TiMg==
Date: Tue, 22 Dec 2020 17:13:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop unnecessary *-supply schemas properties
Message-ID: <20201222171353.GC5269@sirena.org.uk>
References: <20201221234659.824881-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201221234659.824881-1-robh@kernel.org>
X-Cookie: Truth can wait
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-iio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-input@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1246132410=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1246132410==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline


--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 21, 2020 at 04:46:59PM -0700, Rob Herring wrote:
> *-supply properties are always a single phandle, so binding schemas
> don't need a type $ref nor 'maxItems'.

Acked-by: Mark Brown <broonie@kernel.org>

--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/iKVAACgkQJNaLcl1U
h9BQcwf+IyZrHbhUmoHb97rb0P395HOZ2TPnUA9AQrgEIQGiygf98JpHLjKBN7aJ
VUR66urIU4NRzpPl8BA55GEgZvCF5U+n6S/vSUWJcHgMFMGgCZGwFzZnhoytB7TJ
0qvxrT1+fasUg2ioSOGjpCnCDxVbQL0Wdyk6MkpVXLG7cOLJcCnm0Gvuw1Ph8MQV
k6DuRiPuCOzSjYUnXeu/gsgkBUj78/WI3FBMa3CsNjytiYXIq26Za/m5U03be47y
N/MGGcnNdxeIMx+TwUBgJNickvKltn6FLuKWzPgltB5d8D07JSupjWwC7Ybndx0b
M+e04W6kW75K2MskhF6Ef1e4F3qMGg==
=eF01
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--

--===============1246132410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1246132410==--
