Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0161D8320CC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 22:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD66210E171;
	Thu, 18 Jan 2024 21:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED34C10E14B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 21:16:59 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rQZia-0007Jv-N2; Thu, 18 Jan 2024 22:14:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rQZiW-000m90-Ga; Thu, 18 Jan 2024 22:14:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rQZiW-002lX3-1E;
 Thu, 18 Jan 2024 22:14:28 +0100
Date: Thu, 18 Jan 2024 22:14:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Subject: Re: [BUG][BISECTED] Freeze at loading init ramdisk
Message-ID: <esh5npfi6ahrlralvmcrnqtrfkarlhsqahbtmfnw5pclr2pf2u@xzitdq6wi7of>
References: <8a6aa228-f2da-4dcd-93c1-e34614cd6471@alu.unizg.hr>
 <cc813525-5484-443e-a40a-cb98f2ed4e1f@alu.unizg.hr>
 <gevqxytidg5efylozindaqntkbl4yeoyzqnh5m3ylitmipgum3@sgmv7qieo7rs>
 <1fe9b78c-7fb5-4d7b-a754-afd563950829@alu.unizg.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nprtap22skgv2jmt"
Content-Disposition: inline
In-Reply-To: <1fe9b78c-7fb5-4d7b-a754-afd563950829@alu.unizg.hr>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-parisc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Prathu Baronia <prathubaronia2011@gmail.com>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nprtap22skgv2jmt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 09:04:05PM +0100, Mirsad Todorovac wrote:
>=20
>=20
> On 1/18/24 08:45, Uwe Kleine-K=F6nig wrote:
> > Hello Mirsad,
> >=20
> > On Wed, Jan 17, 2024 at 07:47:49PM +0100, Mirsad Todorovac wrote:
> > > On 1/16/24 01:32, Mirsad Todorovac wrote:
> > > > On the Ubuntu 22.04 LTS Jammy platform, on a mainline vanilla torva=
lds tree kernel, the boot
> > > > freezes upon first two lines and before any systemd messages.
> > > >=20
> > > > (Please find the config attached.)
> > > >=20
> > > > Bisecting the bug led to this result:
> > > >=20
> > > > marvin@defiant:~/linux/kernel/linux_torvalds$ git bisect good
> > > > d97a78423c33f68ca6543de510a409167baed6f5 is the first bad commit
> > > > commit d97a78423c33f68ca6543de510a409167baed6f5
> > > > Merge: 61da593f4458 689237ab37c5
> > > > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > > > Date:=A0=A0 Fri Jan 12 14:38:08 2024 -0800
> > > >=20
> > > > [...]
> > > >=20
> > > > Hope this helps.
> > >=20
> > > P.S.
> > >=20
> > > As I see that this is a larger merge commit, with 5K+ lines changed, =
I don't think I can
> > > bisect further to determine the culprit.
> >=20
> > Actually it's not that hard. If a merge commit is the first bad commit
> > for a bisection, either the merge wasn't done correctly (less likely,
> > looking at d97a78423c33f68ca6543de510a409167baed6f5 I'd bet this isn't
> > the problem); or changes on different sides conflict or you did
> > something wrong during bisection.
> >=20
> > To rule out the third option, you can just retest d97a78423c33,
> > 61da593f4458 and 689237ab37c5. If d97a78423c33 is the only bad one, you
> > did it right.
>=20
> This was confirmed.
>=20
> > Then to further debug the second option you can find out the offending
> > commit on each side with a bisection as follows, here for the RHS (i.e.
> > 689237ab37c5):
> >=20
> > 	git bisect start 689237ab37c5 $(git merge-base 61da593f4458 689237ab37=
c5)
> >=20
> > and then in each bisection step do:
> >=20
> > 	git merge --no-commit 61da593f4458
> > 	test if the problem is present
> > 	git reset --hard
> > 	git bisect good/bad
> >=20
> > In this case you get merge conflicts in drivers/video/fbdev/amba-clcd.c
> > and drivers/video/fbdev/vermilion/vermilion.c. In the assumption that
> > you don't have these enabled in your .config, you can just ignore these.
> >=20
> > Side note: A problem during bisection can be that the .config changes
> > along the process. You should put your config into (say)
> > arch/x86/configs/lala_defconfig and do
> >=20
> > 	make lala_defconfig
> >=20
> > before building each step to prevent this.
>=20
> I must have done something wrong:
>=20
> marvin@defiant:~/linux/kernel/linux_torvalds$ git bisect log
> # bad: [689237ab37c59b9909bc9371d7fece3081683fba] fbdev/intelfb: Remove d=
river
> # good: [de927f6c0b07d9e698416c5b287c521b07694cac] Merge tag 's390-6.8-1'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
> git bisect start '689237ab37c5' 'de927f6c0b07d9e698416c5b287c521b07694cac'
> # good: [d9f25b59ed85ae45801cf45fe17eb269b0ef3038] fbdev: Remove support =
for Carillo Ranch driver
> git bisect good d9f25b59ed85ae45801cf45fe17eb269b0ef3038
> # good: [e2e0b838a1849f92612a8305c09aaf31bf824350] video/sticore: Remove =
info field from STI struct
> git bisect good e2e0b838a1849f92612a8305c09aaf31bf824350
> # good: [778e73d2411abc8f3a2d60dbf038acaec218792e] drm/hyperv: Remove fir=
mware framebuffers with aperture helper
> git bisect good 778e73d2411abc8f3a2d60dbf038acaec218792e
> # good: [df67699c9cb0ceb70f6cc60630ca938c06773eda] firmware/sysfb: Clear =
screen_info state after consuming it
> git bisect good df67699c9cb0ceb70f6cc60630ca938c06773eda
> marvin@defiant:~/linux/kernel/linux_torvalds$
>=20
> with the error:
>=20
> marvin@defiant:~/linux/kernel/linux_torvalds$ git bisect good
> Bisecting: 0 revisions left to test after this (roughly 0 steps)
> drivers/video/fbdev/amba-clcd.c: needs merge
> drivers/video/fbdev/vermilion/vermilion.c: needs merge
> error: you need to resolve your current index first

It seems you forgot the "git reset --hard" step.  Doing it in this state
should still be possible.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nprtap22skgv2jmt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWplLMACgkQj4D7WH0S
/k7yHAf/bzavMnfba1j/V8B/3Gx4zR6zjYx9rMfvDkIIKxsg4k2lDBZQUyRCwYu2
XvjLPT7YSPUj7zJ2KR5RbJAEL6rytOigXv4NljQLH6FHF2yBVh9fh6lKk62PWbF1
sPV+g/lYT/WbmnCEcbSbqTpju/75Rp+Z9csfLN21F44M4MoJSsULMwlZ7fQ++v+X
OjOzAQOE7dcPRKTG8xcv7fktoFregB71cqzROQJihJ6ajpOfSSmR0rw9F0pw0HUI
i4nbTIxgkQ4lw+tpeSFGbD6ZsyU5Y0YuicxVvN3B+x8+hxN4DI82ISdlIJ7yrCPV
6yIlg55o4LL/bpOW4iFZWaiXxtiBzw==
=d3U1
-----END PGP SIGNATURE-----

--nprtap22skgv2jmt--
