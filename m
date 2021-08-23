Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8C23F49B5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 13:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D16898CA;
	Mon, 23 Aug 2021 11:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCB0898CA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 11:26:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B692D6120C;
 Mon, 23 Aug 2021 11:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629718001;
 bh=SNXPezX13mfcuVusqi9++jw0PbkmIdb33Xu6aIl7Cps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k52MX7bckBei8Fe5kTMVB2Guq+tsMgybPciSKFS/WOBJSWPdQSQrHefK1uwzWYhl9
 9MHzvxwm3QJ/h81UhyWihlSQxx0Opcwd54kc5LFohHqbwrfNAo7/Pjcv7rCwqFrczB
 BnfIDgjJItd6fL0AwMnRidpCgR8qrQy3pY/yUbFLr+Yom3DSo3ppOh8wBPBTVgdUlj
 1R6D/QwQP9KdRt31sdoj/pzvA+HBsi+mn4gmQaXFoEP2jrVND/1YTgNtKzxq3FeWGj
 unVZIblEwxr2bsw8iPpEXlPk7PBQ34MZkkAX0ZIFpIIthS+1K6VUIDXnr6E4juUisX
 VcGfexLSrwDsg==
Date: Mon, 23 Aug 2021 12:26:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Dillon Min <dillon.minfei@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/2] dt-bindings: sound: rt1015p: correct indentation
Message-ID: <20210823112615.GD4380@sirena.org.uk>
References: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
 <20210819101020.26368-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Content-Disposition: inline
In-Reply-To: <20210819101020.26368-2-krzysztof.kozlowski@canonical.com>
X-Cookie: APL hackers do it in the quad.
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--d01dLTUuW90fS44H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 19, 2021 at 12:10:20PM +0200, Krzysztof Kozlowski wrote:
> Use common enum instead of oneOf and correct indentation warning:
>   realtek,rt1015p.yaml:18:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

For stuff like this where there's no relationship between the things
being patched it's probably better to just send a bunch of individual
patches rather than a series, it works better with tooling and makes it
clear there's no interdependencies or anything.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEjhdYACgkQJNaLcl1U
h9Ah2wf/WfM7XjJE/ztslTnuMDDI4tC7FvozpC17wxbK3oNxPlzluBz+r0Bu664m
GEFc1PpVWxMEzRcVVa3axO+jTlNcRqWNpUHPxtINqUdZ1s1JSEsHdvyfdXKAytx3
N9T7OWRHi4LQagC+FRKlVsDY3UkyzL83pCC3gdZXxs3icKhr/zpFePWa9r04yAVl
l3qrndJpATla6IPu9OQuxyPpyyxkChYMkS0KDvAWNscIU1XCkDQgUXnBS0VRUOKP
heIksdtyfDK/93XpGyWRB8PqSba6QMljBLbvRBpGV3v4gQbON/Lvyde4MCmXnoLA
wXaLGSkpbItq31bZJcipEPb0dBZXNQ==
=65Xc
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--
