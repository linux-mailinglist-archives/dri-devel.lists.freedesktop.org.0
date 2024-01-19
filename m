Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7978330B8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 23:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF1010E1DE;
	Fri, 19 Jan 2024 22:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D836410E1DE
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 22:14:46 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 71B101C0076; Fri, 19 Jan 2024 23:14:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1705702474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+yAQCch9K+HPJYF16tFEjwN6QYUkinUbXhmOFLhotBI=;
 b=ZkWJbbu6TKig1IocluCVEyg6kj+m+tZwkENyUlGH4CSe7/ntSE6hzdUcJ6O+723NpRry/D
 dNJmeDFBdh77cqwXzf2/WCzSsUmB7xeAapG2mSz4ZLs5DUj1Yy8RHnwSPyvtizlnqxCUGP
 qmAYFH635gIQl7JDji5A7BBK/dQ7Mbo=
Date: Fri, 19 Jan 2024 23:14:08 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Message-ID: <Zar0MFelV4gY50La@duo.ucw.cz>
References: <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <ZaljwLe7P+dXHEHb@duo.ucw.cz>
 <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
 <87bk9hppee.fsf@intel.com> <ZarAfg2_5ocfKAWo@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="DqqzmPOTbqCBp9No"
Content-Disposition: inline
In-Reply-To: <ZarAfg2_5ocfKAWo@google.com>
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
Cc: Lee Jones <lee@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 jikos@kernel.org, linux-kernel@vger.kernel.org,
 Werner Sembach <wse@tuxedocomputers.com>, Jelle van der Waa <jelle@vdwaa.nl>,
 Hans de Goede <hdegoede@redhat.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--DqqzmPOTbqCBp9No
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > And while I would personally hate it, you can imagine a use case where
> > you'd like a keypress to have a visual effect around the key you
> > pressed. A kind of force feedback, if you will. I don't actually know,
> > and correct me if I'm wrong, but feels like implementing that outside of
> > the input subsystem would be non-trivial.
>=20
> Actually I think it does not belong to the input subsystem as it is,
> where the goal is to deliver keystrokes and gestures to userspace.  The
> "force feedback" kind of fits, but not really practical, again because
> of lack of geometry info. It is also not really essential to be fully
> and automatically handled by the kernel. So I think the best way is
> > to

So that's actually big question.

If the common usage is "run bad apple demo on keyboard" than pretty
clearly it should be display.

If the common usage is "computer is asking yes/no question, so
highlight yes and no buttons", then there are good arguments why input
should handle that (as it does capslock led, for example).

Actually I could imagine "real" use when shift / control /alt
backlight would indicate sticky-shift keys for handicapped.

It seems they are making mice with backlit buttons. If the main use is
highlight this key whereever it is, then it should be input.

But I suspect may use is just fancy colors and it should be display.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--DqqzmPOTbqCBp9No
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZar0MAAKCRAw5/Bqldv6
8nOZAJ4+IFE/M4uAdwtp+rAqwXiKQFW5AwCfc7V3dsFCCcUTbiKDtFNWrSxtK3s=
=uMxc
-----END PGP SIGNATURE-----

--DqqzmPOTbqCBp9No--
