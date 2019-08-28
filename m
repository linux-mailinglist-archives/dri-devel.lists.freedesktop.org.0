Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F22A0787
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 18:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9039189D79;
	Wed, 28 Aug 2019 16:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BAB89D79
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 16:39:17 +0000 (UTC)
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 49B5F100008;
 Wed, 28 Aug 2019 16:39:12 +0000 (UTC)
Date: Wed, 28 Aug 2019 18:40:44 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
Message-ID: <20190828164044.ku3xozmp7wlipn5d@uno.localdomain>
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <CAMRc=Mex_Ricd+C4F7nGLmpBggO-hWwJDB6duX8kFpPEeaTDjQ@mail.gmail.com>
 <CAMRc=Mci4ncbDmns=0uL8hsAGz1Wvd5bgK4yxTF8QQQitXDv0g@mail.gmail.com>
 <CAMRc=McUEgm6yH7enwHuHxVTL41dmb5KAY_pxTmSr3vctCs2xg@mail.gmail.com>
 <CAMuHMdV3obGtQ7qohNedQNgpvZvyL9xjH0HUiBKD6b8Ou5F+XA@mail.gmail.com>
 <CACRpkdbgZhgSvicq2XG0n2hiKA9K8VFmvCPn3W9oXgSLrZiw=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdbgZhgSvicq2XG0n2hiKA9K8VFmvCPn3W9oXgSLrZiw=w@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-sh list <linux-sh@vger.kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: multipart/mixed; boundary="===============0311191793=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0311191793==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ootzxk2uvromcpqa"
Content-Disposition: inline


--ootzxk2uvromcpqa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,

On Wed, Aug 28, 2019 at 06:31:19PM +0200, Linus Walleij wrote:
> On Wed, Aug 28, 2019 at 10:36 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>
> > CC the pour soul with the ecovec board.
>
I'm sorry, Eco what ? :)

> With great power comes great responsibility ;)
>

Yeah, that's -exactly- a 'great powers' board :)

I'll try to resurect it from the deads again and get back eventually
with a tested-by.

I only briefly looked at the series and I don't have any LCD to test
the backlight with, I hope I can sample the backlight GPIO value from
some test point, if I ever find the schematics...

> Yours,
> Linus Walleij

--ootzxk2uvromcpqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1mrowACgkQcjQGjxah
VjxtAA//YCv1S5V4Y+U+KJqq8uhB+Cs4NqedH2fC45FFxMAz/ze/UnG4XixNT9x1
UP3xPgozXZeOzJyfM9w4bRC8yLTq6/t4kazDK0jjr/defxi1YpHCARTEw4/ioEkb
FJ9K2FolNzhcQbTQNqNQNYqCtXPsUwzOR701cZkf2eE5PE/1DJi17wsYfycbi/1/
HDrnrjDXnjla5CMrObPmvJ5rxPDHSHo3Le+SpBflzwvEWIktFKSwCMiNYUj2z9/x
N71lKRlTS4jr//BURsomOt6i5Qzr6X2DroQ+VFLzsoToSVRleS/UMiY/ADnNori6
xB9brM1ua/98Go61pIGXkhwOztB880f1dsyNygtyqxssWBUsWFEKsKcxQC5uAaeA
iWY68EcVHFRKipu0CzJCNTh/mWrEbKZznDQPrXO4PIS8KlZuTlhKvrrTZAQL0knN
zgTETUPOD4Yo27IvaNfxZKXWvfJbdywvPXOfV5i7lnMyYo17nfNQ3ZGeNcI+7oMA
mgSi7zzNyOn1Rrag82vAytbXehRLkBq6vY7CpiCL6Cnh9J+NySiqOwpm/j1RBpek
6rb2rbdu2kYUICirp9Fij8Ii1fkV4maFrRSxqe3Zig4Vr+swUl2Rc00Alz0Rj2y9
I6CVuwpecgOeEmGst6RgEZ6R5ZyS5sO93znoz/ux6lbxW6UcYCE=
=s/MY
-----END PGP SIGNATURE-----

--ootzxk2uvromcpqa--

--===============0311191793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0311191793==--
