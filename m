Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B007A125667
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 23:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E466EA8A;
	Wed, 18 Dec 2019 22:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F8589F47
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 22:18:06 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36D63218AC;
 Wed, 18 Dec 2019 22:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576707486;
 bh=xhXZ+35S+/6cI1WWLxRqDqVB+Krevd61uwH4joVkI+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O08qVggBfYFX7mdzqneUUMrtP8xNId4jbqmESqBDwYUUX3GQKLvJc9Tc3uf5MXvet
 YEQ0XBPl8A0jLwLu4r7wd1Jsbj4fiDXw0WD5pHhTEV4r2dtj+HgltfdRHawWdXTZhZ
 w+u1QRxMDDARMOhd6brItV7mj6s/du1DOpjSywN4=
Date: Wed, 18 Dec 2019 23:18:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Stefan Mavrodiev <stefan@olimex.com>
Subject: Re: [PATCH 1/1] drm/sun4i: hdmi: Remove duplicate cleanup calls
Message-ID: <20191218221804.5nlobcy2bcxvlsr5@gilmour.lan>
References: <20191217124632.20820-1-stefan@olimex.com>
MIME-Version: 1.0
In-Reply-To: <20191217124632.20820-1-stefan@olimex.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1815541699=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1815541699==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t3hsvrwjuxfiwifc"
Content-Disposition: inline


--t3hsvrwjuxfiwifc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2019 at 02:46:32PM +0200, Stefan Mavrodiev wrote:
> When the HDMI unbinds drm_connector_cleanup() and drm_encoder_cleanup()
> are called. This also happens when the connector and the encoder are
> destroyed. This double call triggers a NULL pointer exception.
>
> The patch fixes this by removing the cleanup calls in the unbind
> function.
>
> Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>

Added a fixes tag, and cc'd stable, and applied, thanks!
Maxime

--t3hsvrwjuxfiwifc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfqlmwAKCRDj7w1vZxhR
xZ3vAP9s6v4QB4Gp5qZQbl7J9vhz9/z9g/OiEFIVY3exwU1eGQD+Kd9eK1IzBZNQ
jnb58LSELiAKgpGxPmoTsqILx6OCng0=
=8IeF
-----END PGP SIGNATURE-----

--t3hsvrwjuxfiwifc--

--===============1815541699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1815541699==--
