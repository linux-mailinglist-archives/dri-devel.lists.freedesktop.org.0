Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EB9909344
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 22:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913A610EE4E;
	Fri, 14 Jun 2024 20:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="TeCLKarI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F49B10EE4E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 20:13:47 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 847B01C009D; Fri, 14 Jun 2024 22:13:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1718396024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Z8ZU3Qerhy8BbHEZ0VEi1vZnCyP+NEN+cexQC5goGM=;
 b=TeCLKarIVylkNJZTOfyxXHpPRwWdxGrp02dM41hB3seAXL0JZuXpPsoxGavoGMz20eNklc
 GhORYoeUsYJjdMUdl+S3YwhzYU2eEHjMSOPNCaA9D2/C3ly7VJwJ8+hntnzTHtIVxxEwcV
 hj1GnrpwHcAx2hMsSKLhH7e848e3qUw=
Date: Fri, 14 Jun 2024 22:13:44 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rafael Wysocki <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Linux 6.10-rc1
Message-ID: <ZmykeKxwkPEOp9UM@duo.ucw.cz>
References: <CAHk-=wjQv_CSPzhjOMoOjGO3FmuHe5hzm6Ds69zZSFPa4PeuCA@mail.gmail.com>
 <ZmrTZozoi0t/tuva@duo.ucw.cz>
 <CAHk-=wjqHL7KjOWYBVKFewcKPWL7CJxddWfJnvL3AfOqfR8vMg@mail.gmail.com>
 <ZmwHGviv/6J6FQLf@duo.ucw.cz>
 <CAHk-=wigB-wVK+4=NuYJxoKLnoUXB52J5WU2hpKj2de6vGuY7g@mail.gmail.com>
 <CAHk-=wjcdUUip96PnfC+iRjAwPHn3XKsgcohk1ad5VcckCFVKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="9jY3Fdg/BAZtCs3r"
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


--9jY3Fdg/BAZtCs3r
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

Ok, let me check. That sounds like something that could make machine
hotter.

My problem seems to be that machine seems to run way hotter with 6.10,
and when it hovers around the 97C limit, it is unusable with all the
throttling.

It gets unusable with 6.9 at 97C, too, it is just that it is harder to
make it so hot with 6.9.

(And yes, I'm running Chromium, and yes, that means websites influence
this. Media playback also does, 1080p video pushes thermals close to
the limits even on good kernels.)

Thanks and best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--9jY3Fdg/BAZtCs3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZmykeAAKCRAw5/Bqldv6
8gIcAJ9B4RKjJ+DF3U4YiKKPR2TtRW0KEQCgpTFbTJaqCrmvTB23IRLtTeGI328=
=ruMg
-----END PGP SIGNATURE-----

--9jY3Fdg/BAZtCs3r--
