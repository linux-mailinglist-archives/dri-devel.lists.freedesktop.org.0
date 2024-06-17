Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA3E90A984
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 11:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B7310E0CB;
	Mon, 17 Jun 2024 09:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="lPSYoCQD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323B910E0CB;
 Mon, 17 Jun 2024 09:27:11 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 3C33C1C0082; Mon, 17 Jun 2024 11:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1718616429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q78lj1sUEBcoY/15sYRrAFgGfIDd8guUOyzA9hwkQF4=;
 b=lPSYoCQDOtGjrGL02ITIfPC8gJwkHB01Ka6tUcjFlmSiHf8SokRFcy0RhbHQ2zOKi+ttui
 PcKR9RHm/UHYda4Oe59RJn1ZLyJ2xzX9BeYn7F3x9OvxoDGL4gykBPnmtkGHGbCWeDvKtD
 rh8ItSSMVDFhykGiFI5YIEDguoMKCD4=
Date: Mon, 17 Jun 2024 11:27:08 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rafael Wysocki <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Linux 6.10-rc1
Message-ID: <ZnABbKrIzmmEoFEV@duo.ucw.cz>
References: <CAHk-=wjQv_CSPzhjOMoOjGO3FmuHe5hzm6Ds69zZSFPa4PeuCA@mail.gmail.com>
 <ZmrTZozoi0t/tuva@duo.ucw.cz>
 <CAHk-=wjqHL7KjOWYBVKFewcKPWL7CJxddWfJnvL3AfOqfR8vMg@mail.gmail.com>
 <ZmwHGviv/6J6FQLf@duo.ucw.cz>
 <CAHk-=wigB-wVK+4=NuYJxoKLnoUXB52J5WU2hpKj2de6vGuY7g@mail.gmail.com>
 <CAHk-=wjcdUUip96PnfC+iRjAwPHn3XKsgcohk1ad5VcckCFVKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="H6pKU+jOd+U1bE+H"
Content-Disposition: inline
In-Reply-To: <CAHk-=wjcdUUip96PnfC+iRjAwPHn3XKsgcohk1ad5VcckCFVKA@mail.gmail.com>
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


--H6pKU+jOd+U1bE+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Let's bring in the actual gpu people.. Dave/Jani/others - does any of
> > this sound familiar? Pavel says things have gotten much slower in
> > 6.10: "something was very wrong with the performance, likely to do
> > with graphics"
>=20
> Actually, maybe it's not graphics at all. Rafael just sent me a pull
> request that fixes a "turbo is disabled at boot, but magically enabled
> at runtime by firmware" issue.
>=20
> The 6.10-rc1 kernel would notice that turbo was disabled, and stopped
> noticing that it magically got re-enabled.
>=20
> Pavel, that was with a very different laptop, but who knows... That
> would match the "laptop is much slower" thing.
>=20
> So current -git might be worth checking.

So... I went to (then) current -git and I don't want to replace my
machine any more. So the problem should not exist in current mainline.

(I did not have good objective data, so I'm not 100% sure problem was
real in the first place. More like 90% sure.)

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--H6pKU+jOd+U1bE+H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZnABbAAKCRAw5/Bqldv6
8m6EAJ9actiKleBb8+OFvKoQQ4jA7+2hiQCfWrGkGnyPYT4Nsoq7QcejUXecs3U=
=xxmc
-----END PGP SIGNATURE-----

--H6pKU+jOd+U1bE+H--
