Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E67ACE137
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 14:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E61F6E5B6;
	Mon,  7 Oct 2019 12:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBD26E5C3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 12:07:14 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A59320867;
 Mon,  7 Oct 2019 12:07:13 +0000 (UTC)
Date: Mon, 7 Oct 2019 14:07:10 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 3/3] drm/sun4i: sun6i_mipi_dsi: fix DCS long write
 packet length
Message-ID: <20191007120710.zhm6wkm32kpsqv5m@gilmour>
References: <20191006160303.24413-1-icenowy@aosc.io>
 <20191006160303.24413-4-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20191006160303.24413-4-icenowy@aosc.io>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570450034;
 bh=arbaz8x3puASuQCFv3RH3ysmpiBHcA2eOWy0FamGrFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MnVmxZLoAkVyRKheU9X/YR5bMo6nKlHmcKS2ro6emQd2eneWrMDXRAALYjSXBxp1a
 X5Su7sdTQdbaq81iyYhr3iDbwOwriy8ZJQkNLXJ15ST40Mr4CcXjVRu2h6fGWExYN0
 KKxfdvMTK6e3SF6GYyWpJfvVJH5ai1c/WiucEvsM=
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0692581417=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0692581417==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q5xk63oitgdknstb"
Content-Disposition: inline


--q5xk63oitgdknstb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 07, 2019 at 12:03:02AM +0800, Icenowy Zheng wrote:
> The packet length of DCS long write packet should not be added with 1
> when constructing long write packet.
>
> Fix this.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Applied, thanks

Maxime

--q5xk63oitgdknstb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZsqbgAKCRDj7w1vZxhR
xWdGAPoD+SGxYVP/cSUjH/jrEJNThDwZjOU59WN8z3Qi9XF3BgEA0tiZksS/LTVL
rAlkltweDTGTlptVDBSyEjKNKRqzmg4=
=Ua0x
-----END PGP SIGNATURE-----

--q5xk63oitgdknstb--

--===============0692581417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0692581417==--
