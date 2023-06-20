Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3527369EB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 12:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5350A10E0EF;
	Tue, 20 Jun 2023 10:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B550D10E0EF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 10:52:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26DD8611D8;
 Tue, 20 Jun 2023 10:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C26C433C0;
 Tue, 20 Jun 2023 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687258318;
 bh=V9MJUCVMWI9KfhKjx8mSvYw2pf1xjGedQM3kQSvLgGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OCv4HWAtYRwDDL4w75BYLov4HtUzw//tycij0AU63h9r8gj6xID+tOvOIk7VQyl8n
 w50Oa9scAAPxXzx0bCYCAVSaSLwP5Pc+m861ajyrs3T8AVsTaL59FgNOVRbwySC6MO
 L1IKvLICjaTdPDLe6tLk7CFBOrRK3ehFOzjgqWZAqfabRKUAZuVvTHAligZGK5E6iW
 cTVXpM3dzyrZshj72n/dWh2mnaFNRKXDM85xG4og/4MXgZ3s5UAyutoWr+YAyeQoLi
 rlyZQB03KRNUUfLDXfW2NOcK1yklLqT2/9kXmv8ezz4Q5RAcPeBrmUX3G78nhGcSIe
 ZTFEv8ueA3qIA==
Date: Tue, 20 Jun 2023 12:51:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] drm/bridge_connector: Handle
 drm_connector_init_with_ddc() failures
Message-ID: <z3p6hqaf5yz24fe6g2pfw3saksu2iqu5gycyfij7rgfojx2ii5@ibrnokvqcucc>
References: <53b00f9812deddf90297e42aa45a4a9988c70076.1687243706.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="meh2x7on6izf7tab"
Content-Disposition: inline
In-Reply-To: <53b00f9812deddf90297e42aa45a4a9988c70076.1687243706.git.geert+renesas@glider.be>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--meh2x7on6izf7tab
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 08:50:44AM +0200, Geert Uytterhoeven wrote:
> drm_connector_init_with_ddc() can fail, but the call in
> drm_bridge_connector_init() does not check that.  Fix this by adding
> the missing error handling.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--meh2x7on6izf7tab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZJGEywAKCRDj7w1vZxhR
xeJkAQCMntGxRYuYehLRiKEl5oWCZDQlZACd7j35XBBUT+CuhAD/RGvK96tX90ZV
SZhI4pm1cKpx3pxPOlLSAx0D1btrTQs=
=rGmg
-----END PGP SIGNATURE-----

--meh2x7on6izf7tab--
