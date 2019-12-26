Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B8E12AB52
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2019 10:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4852E89B0D;
	Thu, 26 Dec 2019 09:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1CD89B0D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 09:38:33 +0000 (UTC)
Received: from localhost (lfbn-lyo-1-633-204.w90-119.abo.wanadoo.fr
 [90.119.206.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 992F82075E;
 Thu, 26 Dec 2019 09:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577353112;
 bh=Mr8Uh6VVBiWsMxxVZI0L4qzbBIyfNz4dUgYhjdF9bxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RNn9y+8DsUK/oQbFJLeb19DhGx54/xMLG77+3mm4kwDstHVH8cubfvxvJjvHaoLaf
 ydoXKFiFDeHUsNQW2DUVqLllBm0kDhSUgDxeXO40rw1G3cIkthez4HpOZzV2hpp2MK
 p30RNiOo5UZVYnBbGFPwcU2kyWYHhihg8TFOip7Y=
Date: Thu, 26 Dec 2019 10:39:52 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v14 0/7] drm/sun4i: Allwinner A64 MIPI-DSI support
Message-ID: <20191226093952.i2jttp7tr5hie6jl@hendrix.home>
References: <20191222132229.30276-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20191222132229.30276-1-jagan@amarulasolutions.com>
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
 David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============0509875649=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0509875649==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h3pmpnueinecnwd2"
Content-Disposition: inline


--h3pmpnueinecnwd2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 22, 2019 at 06:52:22PM +0530, Jagan Teki wrote:
> This is v14 version for Allwinner A64 MIPI-DSI support
> and here is the previous version set[1]

I applied the patches 1 to 6, and fixed checkpatch warnings in the
patch 5. Make sure to run it before sending patches.

Thanks,
Maxime

--h3pmpnueinecnwd2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXgR/6AAKCRDj7w1vZxhR
xbLvAQCJi7xi94JsmmvMc/qiv546VIdF1KVEM1HWgg4A2XFb1gD9GrsRw+V1QxTC
1yZ8gotcEiYivT+fUp5C9q8c/WwP6wU=
=zrYu
-----END PGP SIGNATURE-----

--h3pmpnueinecnwd2--

--===============0509875649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0509875649==--
