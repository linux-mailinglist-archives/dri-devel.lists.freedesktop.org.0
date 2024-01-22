Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F85835F80
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 11:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DA610EC70;
	Mon, 22 Jan 2024 10:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9FF10EC70
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 10:23:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rRrQC-0007gd-F7; Mon, 22 Jan 2024 11:20:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rRrQA-001ZRC-9s; Mon, 22 Jan 2024 11:20:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rRrQA-005FLD-0d;
 Mon, 22 Jan 2024 11:20:50 +0100
Date: Mon, 22 Jan 2024 11:20:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Subject: Re: [BUG][BISECTED] Freeze at loading init ramdisk
Message-ID: <2q2t7mgnpuk2t7wq2tmymxv72oki4uetojkz72xofn7wh45l64@smk3wi6zw54g>
References: <8a6aa228-f2da-4dcd-93c1-e34614cd6471@alu.unizg.hr>
 <cc813525-5484-443e-a40a-cb98f2ed4e1f@alu.unizg.hr>
 <gevqxytidg5efylozindaqntkbl4yeoyzqnh5m3ylitmipgum3@sgmv7qieo7rs>
 <1fe9b78c-7fb5-4d7b-a754-afd563950829@alu.unizg.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ysfre7wk3l4bhl2f"
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


--ysfre7wk3l4bhl2f
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

FTR: Now that you identified df67699c9cb0ce as the culprit, calling
git bisect good on it was wrong, so something was fishy in your testing
and it's no surprise the bisection found a wrong result.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ysfre7wk3l4bhl2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWuQXwACgkQj4D7WH0S
/k7BUwf/c+o/iSAwOCv43dqEm/CcfvKOaq7nnRskQii51OdMDOpIVHur9IOFEGX9
lEng0n7/jCsjTmNbYFaiWvyEBMI0hJgsjEseA+nt3mPkcmhREWN5RJ/KIh/53rxN
0scUgXo1PBWQCm8cUWQLsQu1hvT7jLUbwkQifp9pEeoNVLToAaBii1jYl3epShIE
WhGSfwc3rgdd2OXqtx25vuN0Sf/qkC9JHNW1TjQkkGuquh1mNbSjMr6CznfjwnZ4
bHskT+3UyO9OcpGG/6hDhUO6aiObcoLxnulX7y3YH5UtsIxVyWl4ya7KPfvjz/Bc
7lXF2uvftGaPoEttybS9sjjtA25pCA==
=hK1d
-----END PGP SIGNATURE-----

--ysfre7wk3l4bhl2f--
