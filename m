Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F8C50FDED
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E11A10E149;
	Tue, 26 Apr 2022 12:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442FF10E712
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KMQsvzJ5VuMOPuBnH+dQf/vlRQxi5wCpYK/os3PuYGs=; b=X5amV1/S6PMGm9SMCIZJLYLDnm
 yMnFdUCZ/ukuBffqkdybr3YCGePmMWZv2vSIGIzHIpebAyX2utmufI9clXjGlphf8G0iFaaDJ7Flx
 Lo2pgSk93kvzWusWONBgx02kXzkRCzeB3QBzkOjV17RpW4XmgTi49hoAuiYVcFlwip9Y7DoFjAYtv
 dWjCjFBuodSPgNvBCQ7iQUoPRxEZO5LDn8vgtUDJuf5g58MFvewO4mIubwBg5aThxEBZAUOM1E2Vp
 6twuj2brt6kmx0aS+Hne/dSfYTmC2tSqHvqO6oyNXkHyj/YVaqE5ANSbLt9FmnG7uSusMFe1z3ix4
 S9hrqQOg==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1njKmC-0004lu-8R; Tue, 26 Apr 2022 14:58:44 +0200
Date: Tue, 26 Apr 2022 11:58:30 -0100
From: Melissa Wen <mwen@igalia.com>
To: Juan =?utf-8?Q?A=2E_Su=C3=A1rez?= <jasuarez@igalia.com>
Subject: Re: [PATCH] drm/v3d: Fix null pointer dereference of pointer perfmon
Message-ID: <20220426125749.5i5nbtlcvwvmhzfh@mail.igalia.com>
References: <20220424183512.1365683-1-colin.i.king@gmail.com>
 <890f6416ab37e40c929d95a8b4dcc8feb3dfb4d1.camel@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="du4ctwa34t2th2i2"
Content-Disposition: inline
In-Reply-To: <890f6416ab37e40c929d95a8b4dcc8feb3dfb4d1.camel@igalia.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Colin Ian King <colin.i.king@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--du4ctwa34t2th2i2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04/25, Juan A. Su=E1rez wrote:
> On Sun, 2022-04-24 at 19:35 +0100, Colin Ian King wrote:
> > In the unlikely event that pointer perfmon is null the WARN_ON return
> > path
> > occurs after the pointer has already been deferenced. Fix this by
> > only
> > dereferencing perfmon after it has been null checked.
> >=20
>=20
> Good catch!
>=20
> Reviewed-by: Juan A. Suarez <jasuarez@igalia.com>

Applied to drm-misc-next.

Thanks,

Melissa
>=20
>=20
> 	J.A.
>=20

--du4ctwa34t2th2i2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJn7HYACgkQwqF3j0dL
ehy8tQ/+Ky3MiJludVLn1UxomYXaF+PMsaoMN6FFFM0mRo9oXAhI3iftu3gDNxwv
ukhuJncOwu6Vdrz4PYK5ZkawyU9LoQH8fgMHOw+Pm7viMAV/6aGrB9jnrwRvoYZQ
q6FPBa7rKQyvuZujQkm4+vkNr4jSJCDiwdLR2VVSPsLpCm4ttNKPPTaAx8mR9QVB
k+4XFMluWtiqkX8eU61Igi43WavCuc/OS1XaiVrS/43DLSMIx2BpsMALFygWmplo
mZ1N8aiJfO1IoQpmv0TgB/8XOC6s6VkQ7l0yekEwPto1TJrDlc3xY3He+sLAjq08
m/FF+zYJ72BCFK5pEaf5LCeQfnptVQVScfkiGkSYC2w+gPC9wmV/ZCbCZHPZ8JVp
c1cMqaNzJq0edkBoa4wnWVeftZykddN51JyjGnE3uS4wxeO70OXbgFBX97tAL3F8
XNruI80NdPpoSjT+9BcOBqpZHqRe/ODrnXTeKlITeFEstNQagknuqtVHBT2idHX7
ntJxJWQitefSx0meBsk1dvxJgCpEvoY+HEvSZT+127WjTbVnCxP8J1bvthCU/O5l
dnN5QoTzQJr67WVK2O+xCvA9e20srRnPEcnUjRK2F0+GGqbi2Dv8FM1Exh/iR56/
WOfHk5CD8+ofK4H90XLF/VjWZTE+2HzfBa7yZOGb40Xq7lEiiI4=
=WLJW
-----END PGP SIGNATURE-----

--du4ctwa34t2th2i2--
