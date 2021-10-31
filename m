Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 908F3440CA6
	for <lists+dri-devel@lfdr.de>; Sun, 31 Oct 2021 04:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE6E89EB1;
	Sun, 31 Oct 2021 03:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE61A89EB1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Oct 2021 03:30:55 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HhhWp1klRz4xbP;
 Sun, 31 Oct 2021 14:30:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1635651049;
 bh=lElvBm4kxWpYBa05SHe2+518FGFYo2nvrjWJliNGrOw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gOJ3bTeMjFismbBeJVfEbfpzwP2C0hmKDCL7fYAqjK4N+bEDYxY2YhSXrDekoIJRO
 rM260n6ECg6LxFqgtbn35UQ5mPMbpxt82Lh2xzhtGwxGvNBMBR1B7BNQqZ3TC/AJHo
 8PsdiSMqWHUy1vwjngE2QkYQPIExW22ZxXkJXRESsTNuY9nzhTD2Qx2zqkkjbXU9oN
 t3v12ub58UAPR05Cjj3RP9E+J23NYYZuilavBr1NtTPB9OB1cXCn2rJbW+hgm7QGmJ
 p1JHiWsAbl4rUaFqdPgfb0K1zIjtyE1mVk9eJEY6VRQnWQSZ4BPCPiE47auw6fFTTx
 +L7mxie4h8+mA==
Date: Sun, 31 Oct 2021 14:30:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Zimmermann <tzimmermann@suse.de>, Greg KH <greg@kroah.com>
Cc: Marcel Ziswiler <marcel@ziswiler.com>, Linux-Next Mailing List
 <linux-next@vger.kernel.org>, dri-devel@lists.freedesktop.org, open list
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Maxime Ripard <mripard@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Andrey Konovalov
 <andreyknvl@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Marcel Ziswiler
 <marcel.ziswiler@toradex.com>, Linux Kernel Functional Testing
 <lkft@linaro.org>
Subject: Re: [PATCH v2] drm: import DMA_BUF module namespace
Message-ID: <20211031143045.6abb9225@canb.auug.org.au>
In-Reply-To: <20211031132155.7dc972e8@canb.auug.org.au>
References: <20211027212506.3418521-1-marcel@ziswiler.com>
 <2312b5c3-ffc9-b54e-a08b-2548e3837d83@suse.de>
 <20211031132155.7dc972e8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wf9NJo5lImerRBFY12uaiK5";
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

--Sig_/wf9NJo5lImerRBFY12uaiK5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sun, 31 Oct 2021 13:21:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 29 Oct 2021 20:51:52 +0200 Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
> >
> > Am 27.10.21 um 23:25 schrieb Marcel Ziswiler: =20
> > > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > >=20
> > > Today's -next fails building arm64 defconfig as follows:
> > >=20
> > > ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vunmap from
> > >   namespace DMA_BUF, but does not import it.
> > > ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vmap from
> > >   namespace DMA_BUF, but does not import it.
> > >=20
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > Fixes: commit 4b2b5e142ff4 ("drm: Move GEM memory managers into modul=
es")

Oh, and it is actually:

Fixes: 16b0314aa746 ("dma-buf: move dma-buf symbols into the DMA_BUF module=
 namespace")

--=20
Cheers,
Stephen Rothwell

--Sig_/wf9NJo5lImerRBFY12uaiK5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF+DeUACgkQAVBC80lX
0Gz2bQf+MNOX1/rN9oa/jPNwlc5VjeOSrrS7cXxshE8zON0/kdHnQpBB1TmV9FIX
O7nyZYnAL2G35PXRQHsAkpzxSY0GrzdBPxZrweofHFjE0rH1HmhzZzajoYL+EWoe
lc1306PDJJrzHLUn74lv7AvqLiqe7sALN5PbmM6RKIR0Fkp1Q2tjneb1Qd7S9SzS
3rznO7Giva3PXWecs2nEIRVzUDADY0UbLYOTfISA/SWD1Ex/8UsPUugHDNGWUNTK
cP/kqZQZw/6SIfZh0+YXmF96xOmtaJSmpBuM/3LOrQpyu/KX55MDrdyPkSahG8Y/
aGh3RwFNWNoKv3ziIaAJBsN3nTghRQ==
=HknL
-----END PGP SIGNATURE-----

--Sig_/wf9NJo5lImerRBFY12uaiK5--
