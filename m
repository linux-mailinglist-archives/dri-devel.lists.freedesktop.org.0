Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D09E1F9528
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 13:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1686E19C;
	Mon, 15 Jun 2020 11:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F286E19C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 11:19:29 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 058D020679;
 Mon, 15 Jun 2020 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592219969;
 bh=09YCLJTSpwXYksfyCYSJl2k+cwsJ7qFx3Cq3UzjbGyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y9XD9p0MeL4taa2ELATHmZjnxuB2Qwom8k1ILpzM+ZKmgHncRSrZRkWHzXJoKUZYG
 RVzFdcjhfF4+7tviRu0Z7J7pql7QVnbcy5lmyaFqXh1wKUMpINf6iGMDn+vhj+ObwV
 iv9FZnGvAGdOWuUFB1fqKEZG7JlfMHbBDSJzRm08=
Date: Mon, 15 Jun 2020 12:19:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 13/29] dt: fix broken links due to txt->yaml renames
Message-ID: <20200615111927.GC4447@sirena.org.uk>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
 <0e4a7f0b7efcc8109c8a41a2e13c8adde4d9c6b9.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
In-Reply-To: <0e4a7f0b7efcc8109c8a41a2e13c8adde4d9c6b9.1592203542.git.mchehab+huawei@kernel.org>
X-Cookie: Offer may end without notice.
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
Cc: alsa-devel@alsa-project.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, netdev@vger.kernel.org,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-bluetooth@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: multipart/mixed; boundary="===============0459807659=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0459807659==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 15, 2020 at 08:46:52AM +0200, Mauro Carvalho Chehab wrote:
> There are some new broken doc links due to yaml renames
> at DT. Developers should really run:

I also previously acked this one in 20200504100822.GA5491@sirena.org.uk.
Has anything changed here to cause the ack to be dropped?

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7nWT4ACgkQJNaLcl1U
h9BSJQf9FR8Vke3pe9Gs5pnWmw6vzxds7jfidCUpXIKPoosgfYfzYQrN1G9m2fSm
pLlYWjhQBEAU+w9oq7WktfEZ8r736noKsRW4hd5a+Zf2koBr0M9O7ull4h7WlHvr
asCHlWuqJvpVevxf1ag9x0dAA9NRMqh8xxd8ah/ENWTbXmzZPir0Pa6Q+9lzG2Ld
aqgHcA+WbonAUk4BqLRSasRy6AkO3zUbYWqVecAV8xRPcVjiWd/PkhEQ/BV67wG9
Kh/sFCs6+PalKQu5PDZP70apmaRPYHwPZmkNu5Y8rAUsjsQradS2JB1zFlWDSxZk
0qIWVDJdY+FIcxlqt8Rda5akpjL2SQ==
=51fv
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--

--===============0459807659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0459807659==--
