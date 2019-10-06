Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3772FCDC17
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3C76E486;
	Mon,  7 Oct 2019 07:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC066E3FB
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 11:00:47 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 27F0D80471; Sun,  6 Oct 2019 13:00:31 +0200 (CEST)
Date: Sun, 6 Oct 2019 13:00:45 +0200
From: Pavel Machek <pavel@denx.de>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: New sysfs interface for privacy screens
Message-ID: <20191006110045.GB24605@amd>
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
 <20191002094650.3fc06a85@lwn.net>
MIME-Version: 1.0
In-Reply-To: <20191002094650.3fc06a85@lwn.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, rafael@kernel.org,
 gregkh@linuxfoundation.org, Ross Zwisler <zwisler@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mat King <mathewk@google.com>, Jingoo Han <jingoohan1@gmail.com>,
 Rajat Jain <rajatja@google.com>, Lee Jones <lee.jones@linaro.org>,
 Alexander Schremmer <alex@alexanderweb.de>
Content-Type: multipart/mixed; boundary="===============0444448111=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0444448111==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-10-02 09:46:50, Jonathan Corbet wrote:
> On Tue, 1 Oct 2019 10:09:46 -0600
> Mat King <mathewk@google.com> wrote:
>=20
> > I have been looking into adding Linux support for electronic privacy
> > screens which is a feature on some new laptops which is built into the
> > display and allows users to turn it on instead of needing to use a
> > physical privacy filter. In discussions with my colleagues the idea of
> > using either /sys/class/backlight or /sys/class/leds but this new
> > feature does not seem to quite fit into either of those classes.
>=20
> FWIW, it seems that you're not alone in this; 5.4 got some support for
> such screens if I understand things correctly:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D110ea1d833ad

Hmm. We may want to revert that one because it does more damage :-(.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2ZyV0ACgkQMOfwapXb+vLMsgCgvF0IGuV68NhxRO0Vrfpn9drc
tRMAoLOK4nrZ6f33bOuuV/8VbK9F49Xk
=iq5R
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--

--===============0444448111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0444448111==--
