Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F1243D334
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCEC6E8FF;
	Wed, 27 Oct 2021 20:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2776E8FF
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 20:52:04 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hfgq06GF4z4xbw;
 Thu, 28 Oct 2021 07:51:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1635367920;
 bh=5Y8NA6U3yNgxnNJyRa2otd4eCLUptj9+0XcbhyPWVjo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q51G2eKcUSlkJKQJEPCVbbhP9KTi/ieoY3LoOCd6Ej2Bu9amIt109H8yIIFglKSFf
 2rFVDZ0ybhwjVDBSiUaA//CZZP4AQmLRoR/S1yjCKIUtkynnGr2iHQ9/wk+hfPeo5q
 npD5Co5Ef9IOsJYAeRgq1JPDbJeJKOWucADE1yl8x2oVyhGTjQhr/Hlm+lVZgO2AJu
 n+DU9ffLpJHxcG3XocS3CJLM01RB2EWT1WhhKdR1K7ypL4APWji1T6umQZhZv6WEeC
 MZYs4DXtyClbnoSEZvUWL/xSS2seqTxdFzUYAis32ollv0K8YMuo5fx26vaMyAFChx
 desxHwy+ylftg==
Date: Thu, 28 Oct 2021 07:51:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: "Nikula, Jani" <jani.nikula@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Dave Airlie <airlied@linux.ie>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20211028075155.02825f86@canb.auug.org.au>
In-Reply-To: <163533676481.68716.4009950051571709814@jlahtine-mobl.ger.corp.intel.com>
References: <20210122115918.63b56fa1@canb.auug.org.au>
 <CAKMK7uEuJa1J66mo5dS+QRPy9NOENTx95SZ4rU2MeVRTWj7Kcw@mail.gmail.com>
 <20210122182946.6beb10b7@canb.auug.org.au>
 <CAKMK7uFWFVC0be2foiP8+2=vrqyh1e4mqkuk+2xY+fgSWAExyQ@mail.gmail.com>
 <163533676481.68716.4009950051571709814@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hk7RweDXpOKZXpJ2ckQ5Ttf";
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

--Sig_/Hk7RweDXpOKZXpJ2ckQ5Ttf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joonas,

On Wed, 27 Oct 2021 15:12:44 +0300 Joonas Lahtinen <joonas.lahtinen@linux.i=
ntel.com> wrote:
>
> We should be now good to go and add drm-intel-gt-next to linux-next.
>=20
> The branch would be as follows:
>=20
> drm-intel-gt-next	git://anongit.freedesktop.org/drm-intel	for-linux-next-=
gt
>=20
> Notice the "-gt" and the end of the for-linux-next branch name. This shou=
ld eliminate
> the gap we have been having.

I have added it to linux-next from today. I called it just
"drm-intel-gt" for consistency with the other drm trees in linux-next.

Currently I just have you listed as a contact, is there anyone else (or
a list) that I should add?

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--=20
Cheers,
Stephen Rothwell

--Sig_/Hk7RweDXpOKZXpJ2ckQ5Ttf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF5u+sACgkQAVBC80lX
0GyL4wgAinKWeTjSgRL2p4EwwgFCQr0nKu7Fz27XMK81p8reA+qvVPccClAaSVqr
cOyNTq/yGj/vF2H9UFfjxW5eju+5TicCbSUd3CLi/ePxO8YH9PSKTBywpGYBzI4q
6MkZW9aAPWt5Usbfe1j/EphQaujM9/X8BLC6kDj+LoiZ3bgZtMiDvmNkqs4ICE/w
OJlOOz7LpkPTaoFliNIQct1l9PIHAfDMPnbYj7Rtb/IIOHoZcaT67RUB3ShnVoGt
7qwN9iPhCCFiUYQRZv7FKII3AebeX/zjmJMnr0J+Njd3lM5y37v6v0hYgyzJax0D
S4+4bMnlnZpi9rAIeHPs7x7NToSnxQ==
=HjKj
-----END PGP SIGNATURE-----

--Sig_/Hk7RweDXpOKZXpJ2ckQ5Ttf--
