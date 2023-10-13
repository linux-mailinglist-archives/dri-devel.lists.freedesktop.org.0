Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 804607C8E15
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 22:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D314D10E02E;
	Fri, 13 Oct 2023 20:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Fri, 13 Oct 2023 20:03:03 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F19910E02E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 20:03:03 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 144C11C0065; Fri, 13 Oct 2023 22:03:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1697227382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v9IjOJlh+NOlawd305vpof4MMBTGRJ5ONp9S38ZFw1c=;
 b=LTVA2vMPDHy6f9X2wvaF0rXijKZtYNyIjqpLGCUmd5mR2C9PgaZvthJhljP4xJaxbljL+o
 /LfA9tInl3ITndc8sEonRvdvh2i+lYudbFBS+3nLq6cyqCTTRtNp4iHxVUCdUdBAB1L4wx
 ekJ7ejGxo1D0JcHvYd7/swG8suifaWA=
Date: Fri, 13 Oct 2023 22:03:01 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Message-ID: <ZSmidd1M5Nre4Qh+@duo.ucw.cz>
References: <20231011190017.1230898-1-wse@tuxedocomputers.com>
 <ZSe1GYLplZo5fsAe@duo.ucw.cz>
 <0440ed38-c53b-4aa1-8899-969e5193cfef@tuxedocomputers.com>
 <ZSf9QneKO/8IzWhd@duo.ucw.cz>
 <a244a00d-6be4-44bc-9d41-6f9df14de8ee@tuxedocomputers.com>
 <ZSk16iTBmZ2fLHZ0@duo.ucw.cz>
 <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="96GhfOL9JQ93T59f"
Content-Disposition: inline
In-Reply-To: <ZSmg4tqXiYiX18K/@duo.ucw.cz>
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
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--96GhfOL9JQ93T59f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > The specific keyboard RGB controller I want to implement takes 6*21 rgb
> > values. However not every one is actually mapped to a physical key. e.g=
=2E the
> > bottom row needs less entries because of the space bar. Additionally the
> > keys are ofc not in a straight line from top to bottom.
>=20
> So... a bit of rationale. The keyboard does not really fit into the
> LED subsystem; LEDs are expected to be independent ("hdd led") and not
> a matrix of them.
>=20
> We do see various strange displays these days -- they commonly have
> rounded corners and holes in them. I'm not sure how that's currently
> supported, but I believe it is reasonable to view keyboard as a
> display with slightly weird placing of pixels.
>=20
> Plus, I'd really like to play tetris on one of those :-).
>=20
> So, would presenting them as auxdisplay be acceptable? Or are there
> better options?

Oh and... My existing keyboard membrane-based Chicony, and it is from
time when PS/2 was still in wide use. I am slowly looking for a new
keyboard. If you know of one with nice mechanical switches, RGB
backlight with known protocol, and hopefully easily available in Czech
republic, let me know.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--96GhfOL9JQ93T59f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZSmidQAKCRAw5/Bqldv6
8qQ2AKCBGTKHxfVPIxGuMChs0D4oO1LDGwCfakWEaV9v+/Ut+yVuwzG27YC/Yqg=
=mzp6
-----END PGP SIGNATURE-----

--96GhfOL9JQ93T59f--
