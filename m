Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BCD283547
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 14:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1568089C69;
	Mon,  5 Oct 2020 12:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A1089C69
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 12:01:58 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C4fMz4Grdz9sTR;
 Mon,  5 Oct 2020 23:01:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1601899316;
 bh=0/QqfW/I5HwC8d2l8QEaUmn3isJntKVaSYVlMFnppfY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WKp/QtVFCsNhxsS6rY1YCsrnKZgHc/c6vrp7M7Vzsjv7XTqe7x6W02IpBOH7I2jVX
 fzeqQLdhrdgYT2IRYZVZqX6/U3cd4qrCGbgQNYLpHtz9Cl1YXg2whl8/FGKcjEmt2F
 dFB+ZmF/KgUoukP7iYCvHFn5SOj2PH6qZUIMwHh5b4lGcKSCowVWi5eLShkUyTjWDq
 cE2LtGaah6KTtoqoqJpjOCfApube2ieDuMJGjjEnSAa95CFYZlTGvkUT2qr9Hsz7mP
 F7uzfLCOB5RwPqWpS+fecYN7TdwOTCrZeb2mjy0IrBuca0D1oZOZfVKke0JCgzN9dl
 jtpax30L0p22A==
Date: Mon, 5 Oct 2020 23:01:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] Revert "gpu/drm: ingenic: Add option to mmap GEM
 buffers   cached"
Message-ID: <20201005230150.5637fa42@canb.auug.org.au>
In-Reply-To: <ZE1PHQ.WGCBAFO9R38I3@crapouillou.net>
References: <20200930165212.GA8833@lst.de>
 <20201004141758.1013317-1-paul@crapouillou.net>
 <20201004195921.GA556605@ravnborg.org>
 <ZE1PHQ.WGCBAFO9R38I3@crapouillou.net>
MIME-Version: 1.0
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
Cc: od@zcrc.me, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Christoph Hellwig <hch@lst.de>
Content-Type: multipart/mixed; boundary="===============0161096199=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0161096199==
Content-Type: multipart/signed; boundary="Sig_/c5crkA+N8hdQw9yru=.DOR2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/c5crkA+N8hdQw9yru=.DOR2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Sun, 04 Oct 2020 22:11:23 +0200 Paul Cercueil <paul@crapouillou.net> wro=
te:
>
> Pushed to drm-misc-next with the changelog fix, thanks.
>=20
> Stephen:
> Now it should build fine again. Could you remove the BROKEN flag?

Thanks for letting me know, but the fix has not appeared in any drm
tree included in linux-next yet ...

If it doesn't show up by the time I will merge the drm tree tomorrow, I
will apply this revert patch myself (instead of the patch marking the
driver BROKEN).
--=20
Cheers,
Stephen Rothwell

--Sig_/c5crkA+N8hdQw9yru=.DOR2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl97Cy4ACgkQAVBC80lX
0GybcQgAgDBfOlAi4H0LQgp43UG2Jbdt9jpEvffFQlYlJ9MsH+uBFHvo3aQk6X0V
UuhH5HXZaEyeLkkqTBvKbG7malvbM7qXtrgTnHMe5dSbnYDMOn7E9rp3Oq16CspJ
JWI11dxkem9tBxdcXnR+/1r3sR0W0JBgArF2N5ccHRtHCFBs41WbnTgFqGFloi1I
F0ARK/4w8tzk3KCE9tkh7pX1qN8m8OHsFT00VL+CEkW+r3zH7QhxVJ9wcllFGzbG
OKfQKNh+3Oue/ECfKcYYkIafz10T5XZU7zzRplAhun9urihwV7jKf7GW4FRgbCsr
jlfHoHzyXPv164D13Wir3EhLeXQ4Pw==
=Xi7i
-----END PGP SIGNATURE-----

--Sig_/c5crkA+N8hdQw9yru=.DOR2--

--===============0161096199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0161096199==--
