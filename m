Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB544C8C0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43696E501;
	Thu, 20 Jun 2019 07:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7356E501
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 07:57:53 +0000 (UTC)
X-Originating-IP: 90.88.23.150
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 45FB72000A;
 Thu, 20 Jun 2019 07:57:50 +0000 (UTC)
Date: Thu, 20 Jun 2019 09:57:49 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 1/4] dt-bindings: display: Convert common panel
 bindings to DT schema
Message-ID: <20190620075749.o6i76exxhe2xbpfo@flea>
References: <20190619215156.27795-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190619215156.27795-1-robh@kernel.org>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1460645140=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1460645140==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4oxwmcz4cekh22my"
Content-Disposition: inline


--4oxwmcz4cekh22my
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2019 at 03:51:53PM -0600, Rob Herring wrote:
> Convert the common panel bindings to DT schema consolidating scattered
> definitions to a single schema file.
>
> The 'simple-panel' binding just a collection of properties and not a
> complete binding itself. All of the 'simple-panel' properties are
> covered by the panel-common.txt binding with the exception of the
> 'no-hpd' property, so add that to the schema.
>
> As there are lots of references to simple-panel.txt, just keep the file
> with a reference to panel-common.yaml for now until all the bindings are
> converted.
>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--4oxwmcz4cekh22my
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXQs8fQAKCRDj7w1vZxhR
xWqfAQC4mg5/Loj8+ISTLoz6dZc1DK9gRuM+Zd0n3nqR5qy78gEA6zQubCUl5ZuG
Q2QwmDebJXYojsaueg4Yq1I2Jd28oQE=
=8Jp7
-----END PGP SIGNATURE-----

--4oxwmcz4cekh22my--

--===============1460645140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1460645140==--
