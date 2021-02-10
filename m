Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E79E93166D1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 13:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610076E057;
	Wed, 10 Feb 2021 12:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 536 seconds by postgrey-1.36 at gabe;
 Wed, 10 Feb 2021 12:34:17 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6646E057
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 12:34:17 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 4A4F71C0B8A; Wed, 10 Feb 2021 13:25:18 +0100 (CET)
Date: Wed, 10 Feb 2021 13:25:17 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 5.10 078/120] drm/dp/mst: Export drm_dp_get_vc_payload_bw()
Message-ID: <20210210122517.GA27201@duo.ucw.cz>
References: <20210208145818.395353822@linuxfoundation.org>
 <20210208145821.517331268@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20210208145821.517331268@linuxfoundation.org>
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
Cc: Ville Syrjala <ville.syrjala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0488154855=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0488154855==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> commit 83404d581471775f37f85e5261ec0d09407d8bed upstream.
>=20
> This function will be needed by the next patch where the driver
> calculates the BW based on driver specific parameters, so export it.
>=20
> At the same time sanitize the function params, passing the more natural
> link rate instead of the encoding of the same rate.

> Cc: <stable@vger.kernel.org>

This adds exports, but there's no user of the export, neither in
5.10-stable nor in linux-next. What is the plan here?

Best regards,
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYCPQrQAKCRAw5/Bqldv6
8rqLAKCcXIbkWVbYEBX6KypH71nsV8KmYQCcDkLDxCN+NRflSbyE7HBMXW4HJ14=
=lDwN
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--

--===============0488154855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0488154855==--
