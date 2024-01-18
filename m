Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E147831356
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 08:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE06410E13B;
	Thu, 18 Jan 2024 07:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2AD10E13B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 07:48:23 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rQN5p-000356-TN; Thu, 18 Jan 2024 08:45:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rQN5m-000dlb-1S; Thu, 18 Jan 2024 08:45:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rQN5l-002Fc2-30;
 Thu, 18 Jan 2024 08:45:37 +0100
Date: Thu, 18 Jan 2024 08:45:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Subject: Re: [BUG][BISECTED] Freeze at loading init ramdisk
Message-ID: <gevqxytidg5efylozindaqntkbl4yeoyzqnh5m3ylitmipgum3@sgmv7qieo7rs>
References: <8a6aa228-f2da-4dcd-93c1-e34614cd6471@alu.unizg.hr>
 <cc813525-5484-443e-a40a-cb98f2ed4e1f@alu.unizg.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vrvcwpg6gkakpejo"
Content-Disposition: inline
In-Reply-To: <cc813525-5484-443e-a40a-cb98f2ed4e1f@alu.unizg.hr>
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


--vrvcwpg6gkakpejo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Mirsad,

On Wed, Jan 17, 2024 at 07:47:49PM +0100, Mirsad Todorovac wrote:
> On 1/16/24 01:32, Mirsad Todorovac wrote:
> > On the Ubuntu 22.04 LTS Jammy platform, on a mainline vanilla torvalds =
tree kernel, the boot
> > freezes upon first two lines and before any systemd messages.
> >=20
> > (Please find the config attached.)
> >=20
> > Bisecting the bug led to this result:
> >=20
> > marvin@defiant:~/linux/kernel/linux_torvalds$ git bisect good
> > d97a78423c33f68ca6543de510a409167baed6f5 is the first bad commit
> > commit d97a78423c33f68ca6543de510a409167baed6f5
> > Merge: 61da593f4458 689237ab37c5
> > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > Date:=A0=A0 Fri Jan 12 14:38:08 2024 -0800
> >=20
> > [...]
> >=20
> > Hope this helps.
>=20
> P.S.
>=20
> As I see that this is a larger merge commit, with 5K+ lines changed, I do=
n't think I can
> bisect further to determine the culprit.

Actually it's not that hard. If a merge commit is the first bad commit
for a bisection, either the merge wasn't done correctly (less likely,
looking at d97a78423c33f68ca6543de510a409167baed6f5 I'd bet this isn't
the problem); or changes on different sides conflict or you did
something wrong during bisection.

To rule out the third option, you can just retest d97a78423c33,
61da593f4458 and 689237ab37c5. If d97a78423c33 is the only bad one, you
did it right.

Then to further debug the second option you can find out the offending
commit on each side with a bisection as follows, here for the RHS (i.e.
689237ab37c5):

	git bisect start 689237ab37c5 $(git merge-base 61da593f4458 689237ab37c5)

and then in each bisection step do:

	git merge --no-commit 61da593f4458
	test if the problem is present
	git reset --hard
	git bisect good/bad

In this case you get merge conflicts in drivers/video/fbdev/amba-clcd.c
and drivers/video/fbdev/vermilion/vermilion.c. In the assumption that
you don't have these enabled in your .config, you can just ignore these.

Side note: A problem during bisection can be that the .config changes
along the process. You should put your config into (say)
arch/x86/configs/lala_defconfig and do

	make lala_defconfig

before building each step to prevent this.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vrvcwpg6gkakpejo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWo1yAACgkQj4D7WH0S
/k7q0Qf/W0t/IirzZUaGB+CH/LGga+7j/KLL5uCh7l6cqhTW1WPWQm1GuEidN2KK
Hw1/HRMjxHlFtrZWoKVrXpT8mtNXb+vVSIQwxPItzFprY2c1aip9azmc95CcUjx1
kiVbkKYhwoO93CVo5y9k8dRiapAKGqJ3om5WYeGhaaP7O2id0H/QMHpDC8IUd6vk
5+UKkqzUznooHGbxuNYhpRUVKaeZZW4yK9fcT6YfFCSqRcYcB/wJ0vfvX4+4nSf6
0NVvZo3kvwhaTuvX5CjgD49kr5WRRcnypUE/2UwVSdChUyUTnx15+cKnvnYCkPQ5
Rbed4l9pWRYUp8DZAnt65Xl9tHMvxA==
=OgfD
-----END PGP SIGNATURE-----

--vrvcwpg6gkakpejo--
