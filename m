Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3163CE110
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 13:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071026E5BE;
	Mon,  7 Oct 2019 11:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B32C6E5BE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 11:59:44 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B148D206C0;
 Mon,  7 Oct 2019 11:59:43 +0000 (UTC)
Date: Mon, 7 Oct 2019 13:59:41 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 2/3] drm/sun4i: dsi: fix the overhead of the
 horizontal front porch
Message-ID: <20191007115941.psgcn4dl5r5wz7eb@gilmour>
References: <20191006160303.24413-1-icenowy@aosc.io>
 <20191006160303.24413-3-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20191006160303.24413-3-icenowy@aosc.io>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570449584;
 bh=5jiwPkl3ecC5PC4thXvIU8gFWAfwR8hG/EemIoCj5g4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=00DN5m1u+OpR2j7HvOfVHqIseRTMp9+SH7IzGzNwUnxPEVT1j+E0xUjCc5l7eTm7x
 Gx7frdd95PSPb2j45D5gFNFQqa77rhHn7lLb+ZDGyQExfG7w0YS/+y41odBO4dEx2l
 GW59SWBe2FL9LX3l+322/QB8nvCEiuq5VgO6q9bM=
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
Content-Type: multipart/mixed; boundary="===============0973954882=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0973954882==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5vfde45ofwoem3io"
Content-Disposition: inline


--5vfde45ofwoem3io
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 07, 2019 at 12:03:01AM +0800, Icenowy Zheng wrote:
> The formula in the BSP kernel indicates that a 16-byte overhead is used
> when sending the HFP. However, this value is currently set to 6 in the
> sun6i_mipi_dsi driver, which makes some panels flashing.
>
> Fix this overhead value.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Applied, thanks

Maxime

--5vfde45ofwoem3io
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZsorQAKCRDj7w1vZxhR
xcP8AP47n6BFMYH1VcgTqWrgGo5/vrIabj3UlEvNbcGcQXgpgQD9GkwZ/EbXI2Dp
TngzLKib/Ovm7hiqxQLsL6DKkKWGGw0=
=25Nh
-----END PGP SIGNATURE-----

--5vfde45ofwoem3io--

--===============0973954882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0973954882==--
