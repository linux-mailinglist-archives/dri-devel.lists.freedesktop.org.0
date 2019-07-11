Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D7B6563B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 13:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107DF89FEA;
	Thu, 11 Jul 2019 11:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A70A89FEA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 11:59:26 +0000 (UTC)
Received: from earth.universe (dyndsl-031-150-081-114.ewe-ip-backbone.de
 [31.150.81.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D69D21019;
 Thu, 11 Jul 2019 11:59:25 +0000 (UTC)
Received: by earth.universe (Postfix, from userid 1000)
 id B819C3C08DC; Thu, 11 Jul 2019 13:59:23 +0200 (CEST)
Date: Thu, 11 Jul 2019 13:59:23 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 00/60] drm/omap: Replace custom display drivers with
 drm_bridge and drm_panel
Message-ID: <20190711115923.xwlppsfgbllxk6so@earth.universe>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190711073726.GE15868@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20190711073726.GE15868@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562846365;
 bh=UlgwHuzlr1no0uv7kVsNtS7RvCf70U/wc9XWiuRGqsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ixGisHzYQGAGXDcGd6rc9S5TjRL2Rp86nUP/gIcyOvv3gsv6wUW6JAOtqxX4E8cbn
 fPhWNcINAM32aiGvm63apjx3C3fHFIadXVrhGLvZnNjyBDMYzLGDYrah3MlqrF+7e9
 Lvxyo3fVWG0QpvbCRb0SEpyLAbYQdlfY2FdUIbY8=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============2023068878=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2023068878==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oewxpxndd4zyvtd7"
Content-Disposition: inline


--oewxpxndd4zyvtd7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 11, 2019 at 09:37:26AM +0200, Daniel Vetter wrote:
> > [1] The only notable exception is the omapdrm-specific DSI panel driver
> > that implements a large number of custom operations. This should be
> > addressed separately.
>=20
> DSI tends to be fairly custom in all drivers, I think that's totally fine.
> Maybe not forever, but we have a lot worse crimes in our codebase than
> that :-)

I have a WIP branch, which moves omapdrm DSI to mipi_dsi_driver and
drm_panel:

https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-n900.git/log/?h=
=3Domapdrm-5.2-with-dsi-untested-work-branch

The name is a bit misleading, since it is tested now. HEAD~2, which
moves the last custom operation (panel update for DSI command mode)
=66rom the panel driver to the DSI core unfortunatley does not yet work.
I'm still investigating the reason. Anyways - this is being worked
on :)

-- Sebastian

--oewxpxndd4zyvtd7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl0nJJgACgkQ2O7X88g7
+ppIAhAAkEUgVLLom0vhCcX8J8GrLMjMcGE/5g1klKN4I4StS1kCk8mtoqjkDtqy
rZOTQkt/7NCeVnjuORID8tXq2Y1ugz0Kzl8KXy6PZFtTm0EQbUNwvxjy9ohlcFt7
/aJ2wTHdLPSydfAv9u5CSYPGHrlK7IElDASkrd3+CAi0MWMBaeL3i+Z4heYJcHnm
SJz8i1OVHzdvuK/hJWm3UcIiI7bPv70bSqlNA8ez+mAIpEhS9uQmYvzhSrjPcWwU
HTFJOmT1YEdI1V4JBYzCZN1lFyRCfpbuMiRXExUKGLWtOyLzc+1Tu52FUkWivzE2
CcpajYrvcJbcJxID0FcMKW0mMl81XcP7gQL+FZ4IHSXW8CJlvQ07gbMjFB9tcy3Z
6Cnob2pC+W+O1yZPDSBh0po8vczaXYJaMX6IBF7LzxPHnTOniE799+iMIGsFCyB+
G7LOsJbeCpebkweuafUWJsul8YGJ5AxpAlg81tnYgbqr6Cun3pyqViH+0gGgpx2A
fWMrqN+89wCc4LP9mnxsY1aUt5w1TqVpQWjVD5mE1qz/Q6TFvtkW5ImhImMV3+gX
qK+W7ht4SFK0gh+JBgCwsk37P7ykFbJl6ZoJrAHW8ZwxciPyFNkAmaAy1lS7pACq
hUWZsmNtmPyN2GwUp+/pd2UVSZj6ZOMWj6qQjfdMmIKvqjjWEes=
=khnc
-----END PGP SIGNATURE-----

--oewxpxndd4zyvtd7--

--===============2023068878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2023068878==--
