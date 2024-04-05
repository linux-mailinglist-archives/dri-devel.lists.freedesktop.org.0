Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3305D8997CD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 10:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9635113A60;
	Fri,  5 Apr 2024 08:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DGjKl7XS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3E8113A60;
 Fri,  5 Apr 2024 08:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1712305796;
 bh=FXsbuB5Qrv1gsCr4P2/c0kEN8F/BoBxqk/AFugtZtKI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DGjKl7XShYWPDGV8zEZWyHnS7PHLSlqQ3PBlXXpL2hugihkR/h2JqRbOr0/EGCMzq
 SYADajiHQ2SYLpbFW9IeMk4oMuLL7kBa5wf3Kvc7m3wEW3olaKvDqJ/7GbIKWjZbvd
 9mh2JTMqFphX+6Rgx0fo6AWOo1QZEyTJi59PKPlrkdU3hPYlbv95KxfuijAS4/0LXL
 kL3Lv8vLsIPzXUu4yaiZFMxzqZdHtr39X2ZUp/FeZmW4TXDJxirzwSiLAZ6EvPX4AL
 fsBXrUAsgqKKzOmj+KoXDsoLlUSOPNcTCke7vi4r0tZOPm1DnFZ5Ku/S3BWFLnMxHZ
 TJYUeVvQmDgmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4V9s9b56Jvz4wbv;
 Fri,  5 Apr 2024 19:29:55 +1100 (AEDT)
Date: Fri, 5 Apr 2024 19:29:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ankit.k.nautiyal@intel.com, jani.nikula@intel.com
Subject: Re: [PATCH] drm/dp: correct struct member name in documentation
Message-ID: <20240405192954.492f863a@canb.auug.org.au>
In-Reply-To: <20240405065159.439145-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240405065159.439145-1-mitulkumar.ajitkumar.golani@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HiisunGp5FiJFnfmfe3dv/M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/HiisunGp5FiJFnfmfe3dv/M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mitul,

Thanks.

On Fri,  5 Apr 2024 12:21:59 +0530 Mitul Golani <mitulkumar.ajitkumar.golan=
i@intel.com> wrote:
>
> Correct struct member name to 'mode' instead of 'operation mode'
> in 'drm_dp_as_sdp' structure description.
>=20
> Fixes: 0bbb8f594e33 ("drm/dp: Add Adaptive Sync SDP logging")

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

--=20
Cheers,
Stephen Rothwell

--Sig_/HiisunGp5FiJFnfmfe3dv/M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYPtoIACgkQAVBC80lX
0Gy1zwgAidq7S0JtbK9MP3NkZtQC4ZVLRrke63rD+8g4aWDNtWvn7A2n39GiyiXX
8jZDnd3PKe+oDXzvgLi89+4PA2dJP2VMHLhI2UwcEZBz5pk6kNBEW95Pt8qAm83q
mEcNmrL+I3XFUbJh7gWayjvaRFj2fvCY/TkaiWeSlvMqTHKBrOHrrfWt7kq3lukG
3Cbj265GFsAy+hf8BaeJ8ZxuYB2oxGh3lESDLUxox1LcUzgL0nYIFp8h5sEfu4ln
rKdyx3yVyaahV09Geb/LzDHRJTxYe8lh/fmMbVoEgKlLFBk4MuDJJIFgi8n32/Iy
XFiG1Pp6IRUj2tZeTr9juhpoZi/j6Q==
=DqDy
-----END PGP SIGNATURE-----

--Sig_/HiisunGp5FiJFnfmfe3dv/M--
