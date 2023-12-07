Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9268084DC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6C410E841;
	Thu,  7 Dec 2023 09:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED9A10E841
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 09:41:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 13A6A61F71;
 Thu,  7 Dec 2023 09:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1FDC433C7;
 Thu,  7 Dec 2023 09:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701942089;
 bh=Y3CgmiwT0nwbzFuDeivLJTvO+yngal+TXRGUMoTsXPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ETxJbbtaTcAlVygNymX7fa0IBfzVOw9h7RMRHsVrgMJFO7/DHXEU3p3oom2RCJ7nB
 DTvXd/3xXSrX6AqQ/D2HFanevLa8heMRQTHls/M5iC05CULgq2qIp4VuEvnaYA1+Cq
 IrSHdWT8H72lI5VlF07dpKZHgvmeJnLx1ZsoH7v6TNxJrGLQElGu7vyhZFUew1/r9B
 lTFVH5XVuMJnL9MYrV4UQq/WAfrh8T7k/UNBc82JPHz+5qqfDi6QQiI3coWf0cU7I1
 MDxfdYQKsXpOP0af4lwEOtmfrxNIzKuO5UshxuV27+9qpZ5zyDvjiYFItSNjmG8w9d
 oLtwNBwfx7H5A==
Date: Thu, 7 Dec 2023 10:41:26 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 07/10] dt-bindings: display: panel: Add Ilitek ili9805
 panel controller
Message-ID: <3tddld7exqsjaulhblyrp3x52sxgnmt3tn3elqv23dihlro27u@zi5w5tpmpo3l>
References: <20231205105341.4100896-1-dario.binacchi@amarulasolutions.com>
 <20231205105341.4100896-8-dario.binacchi@amarulasolutions.com>
 <20231206143345.GA2093703-robh@kernel.org>
 <a437b0d7-5669-45c1-b54d-ce028a57efdb@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="glic6emmr37gh3aw"
Content-Disposition: inline
In-Reply-To: <a437b0d7-5669-45c1-b54d-ce028a57efdb@linaro.org>
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
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--glic6emmr37gh3aw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 10:29:12AM +0100, Krzysztof Kozlowski wrote:
> On 06/12/2023 15:33, Rob Herring wrote:
> > On Tue, Dec 05, 2023 at 11:52:54AM +0100, Dario Binacchi wrote:
> >> From: Michael Trimarchi <michael@amarulasolutions.com>
> >>
> >> Add documentation for "ilitek,ili9805" panel.
> >>
> >> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> >> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >=20
> > Where's Krzysztof's Reviewed-by?
>=20
> If only there was a tool which would solve problem of collecting tags...
> Easy to use one command for applying tags from mailing list, so one's
> review will not be lost thus people will not waste effort doing review
> second time. How was it? a4? b4? c4?

FWIW, a lot of people still don't know about b4, or a relying on
features/workflows not supported by b4.

Maxime

--glic6emmr37gh3aw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXGTRgAKCRDj7w1vZxhR
xdd2AQCabCWZ6Xj4jdOlLg8F46quQFKp6kMwULbiCwnB4i00LgEA2eD7fEPp6v6d
1bPIomhtjcluNkZkByoriyToApxs5Q4=
=tGcR
-----END PGP SIGNATURE-----

--glic6emmr37gh3aw--
