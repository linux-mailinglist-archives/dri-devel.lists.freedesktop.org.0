Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717EF4410FC
	for <lists+dri-devel@lfdr.de>; Sun, 31 Oct 2021 22:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E052C89AF3;
	Sun, 31 Oct 2021 21:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D812989AF3
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Oct 2021 21:25:53 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hj8N85v3Xz4xYy;
 Mon,  1 Nov 2021 08:25:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1635715549;
 bh=29/n4S1lCpq8aIe/UfjH9Gh6Zn+qa8XvDJO8nPA2Peo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SUFXXx7JWuQlN5kZheBMIoPSexQKSDSHq67nwR/ihoQ3nhg3kSPRaZJaNex9NVSUU
 hKLoLCNw89gyRc0LaKC7Fl3VPDYw3cmC+oMGjjYCvUSai65BQk2skZXcK5tKqT6Plv
 PwNZ0UCnGnKeUpPaMbMhmrQ0LAfv54AFYF3FZD9VAD1wIv2g1JJLCx+kSfiWzsNyUT
 8NmrTbOB8KouQA26z3NS0idOAbjXtc/oUNjVNsSiEaacv+Ir5qmZ3V7D/gR9Wz/qc8
 zKc4u5WHMh+pEvV43kGmV0pmRXrqY7YiDJMraSJ47wowLAPhKPzDCeQruv6qDcb1mN
 I6nzGQ2ZjPueQ==
Date: Mon, 1 Nov 2021 08:25:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Greg KH <greg@kroah.com>, Marcel Ziswiler <marcel@ziswiler.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Maxime Ripard
 <mripard@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Andrey Konovalov
 <andreyknvl@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Marcel Ziswiler
 <marcel.ziswiler@toradex.com>, Linux Kernel Functional Testing
 <lkft@linaro.org>
Subject: Re: [PATCH v2] drm: import DMA_BUF module namespace
Message-ID: <20211101082543.0e47af76@canb.auug.org.au>
In-Reply-To: <eadfa89d-1c39-be25-abaf-4150396e1024@suse.de>
References: <20211027212506.3418521-1-marcel@ziswiler.com>
 <2312b5c3-ffc9-b54e-a08b-2548e3837d83@suse.de>
 <20211031132155.7dc972e8@canb.auug.org.au>
 <eadfa89d-1c39-be25-abaf-4150396e1024@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qFhkQBvHJ49rDmUV+uLT8Xa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/qFhkQBvHJ49rDmUV+uLT8Xa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Sun, 31 Oct 2021 19:13:17 +0100 Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>
> No no, don't worry. I meant 'import' as in 'git remote add
> linux-next'. I was actually complaining that the provided fix was not
> against a DRM tree.

Phew! :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/qFhkQBvHJ49rDmUV+uLT8Xa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF/CdcACgkQAVBC80lX
0GzCsQf/a/a4o4Jih7Y4aDsuEcP2wONrjr+odbhbs5/+T1//dL5OoPFnKjouJoHa
OQCon9tpppjsBtwwDqgszZUBY+WvNVjQQOOY2ak8aKALIY2bhodZedj8+ZN+VsHH
S89v0nUJGfjyZ/1ZINF0aS0cshjuBv3VQNZxLJ57l3jLFHXLUl/H0iJ4nuOULE3+
qYR2qFiBWnhOSafWLc6ssegR2l8wQ4YHcoy7imlIV2bUIn4e6Gn+FxKjQdTngDe6
Tc57o0mr3NcfNBKR5JFqyQSKFkz+WVPHwK5cbXXrPihocy9Di9Q/y6ABKCcnBatI
w401pfOxY3BDlGOm8bjuzHZ36seJIQ==
=J2ow
-----END PGP SIGNATURE-----

--Sig_/qFhkQBvHJ49rDmUV+uLT8Xa--
