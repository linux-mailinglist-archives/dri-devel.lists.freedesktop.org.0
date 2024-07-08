Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA59692A1E2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 14:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235B910E29F;
	Mon,  8 Jul 2024 12:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="XafgyACI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EC710E2F8;
 Mon,  8 Jul 2024 12:03:33 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 899011C009C; Mon,  8 Jul 2024 14:03:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1720440210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+YY97RgeMbh9wOA+Obh+XjFzS98vI+HNK++z74/sgzM=;
 b=XafgyACIB2fsOH2E1Uyd3yxY816/21rhB3TdP64+W2O1ccK9ruJEVJwsbq208QQgtjWs1U
 aUwd9Bg2gzsbyVBXux+Guhj7KR3s+1+yl+Xx7hlJX243SL6SN59t2SBtaxDb6GTJt2eO91
 dc0F4OHpoq4dyZPI9r5qSxCvzoI3ZKM=
Date: Mon, 8 Jul 2024 14:03:30 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rafael Wysocki <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Linux 6.10-rc1
Message-ID: <ZovVkj7Pqy0/KU63@duo.ucw.cz>
References: <CAHk-=wjQv_CSPzhjOMoOjGO3FmuHe5hzm6Ds69zZSFPa4PeuCA@mail.gmail.com>
 <ZmrTZozoi0t/tuva@duo.ucw.cz>
 <CAHk-=wjqHL7KjOWYBVKFewcKPWL7CJxddWfJnvL3AfOqfR8vMg@mail.gmail.com>
 <ZmwHGviv/6J6FQLf@duo.ucw.cz>
 <CAHk-=wigB-wVK+4=NuYJxoKLnoUXB52J5WU2hpKj2de6vGuY7g@mail.gmail.com>
 <CAHk-=wjcdUUip96PnfC+iRjAwPHn3XKsgcohk1ad5VcckCFVKA@mail.gmail.com>
 <ZnABbKrIzmmEoFEV@duo.ucw.cz> <ZnK2bmDFuwX8E5rY@duo.ucw.cz>
 <CAHk-=wgnwBE=n_K9q7x6R-bzQ-vRiLeYUciWTJtMokLC_1a7gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ujEK8zbOZlk+0bAX"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgnwBE=n_K9q7x6R-bzQ-vRiLeYUciWTJtMokLC_1a7gw@mail.gmail.com>
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


--ujEK8zbOZlk+0bAX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Ok, so machine is ready to be thrown out of window, again. Trying to
> > play 29C3 video should not make machine completely unusable ... as in
> > keyboard looses keystrokes in terminal.
>=20
> Well, that at least sounds like you can bisect it with a very clear test-=
case?
>=20
> Even if you don't bisect all the way, just doing a handful of
> bisections tends to narrow things down enough that we can at least
> guess at what general kind of area it is...

So... I guess I now know what went on.

We got summer here, and I was running notebook closed. Appartently
that affects cooling a _lot_. Open lid means more dust, but also
better cooling...

Best regards (and sorry for the noise),
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--ujEK8zbOZlk+0bAX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZovVkgAKCRAw5/Bqldv6
8tfnAKC5g0vCQCN9TVacqksrHNCgyk2UaACbBKob9Ei7ddtRjyaKOGBfF2C02Qs=
=Z5ej
-----END PGP SIGNATURE-----

--ujEK8zbOZlk+0bAX--
