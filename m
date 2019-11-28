Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B4810CFFC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 00:54:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CEC6E08A;
	Thu, 28 Nov 2019 23:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DE26E08A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 23:53:59 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47PDxb3zbCz9sPj;
 Fri, 29 Nov 2019 10:53:55 +1100 (AEDT)
Date: Fri, 29 Nov 2019 10:53:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm for 5.5-rc1
Message-ID: <20191129105323.4ff56629@canb.auug.org.au>
In-Reply-To: <CAPM=9txFZ+sCXXV3WA0CtFjsmLrY7qziJqrGfr1h+5B-fsqWRA@mail.gmail.com>
References: <CAPM=9ty6MLNc4qYKOAO3-eFDpQtm9hGPg9hPQOm4iRg_8MkmNw@mail.gmail.com>
 <CAHk-=whdhd69G1AiYTQKSB-RApOVbmzmAzO=+oW+yHO-NXLhkQ@mail.gmail.com>
 <CAPM=9tz3pFTOO45pGcZv+nGf29He-p03fXHbG4sNoCYxZzXkRQ@mail.gmail.com>
 <20191129085502.3e9ffed4@canb.auug.org.au>
 <CAPM=9txFZ+sCXXV3WA0CtFjsmLrY7qziJqrGfr1h+5B-fsqWRA@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1574985236;
 bh=q1/UF6pZ8Q/r+m2PDNp3iWyMys5CSJw3zSlCazIr5as=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WC4jJqsfMA3ahBZ61i30b7gYVe1QwuU2P2FkKjJt+c8oe1cyHtio0cBMgJTmbtjLI
 rfyaVTaOGnETpPIkOaqfbojnwzrktX7GyGh14GHvdkZAT7K2Pzzko/RJ8BD4rW3na9
 F8nJZaEhpDhLP4V3hox73WtHGZKDyCAxeyMSYDzzioZFaP8hefkeLSCB2dJrymJMIV
 LQ5bFsDCkXyzt01rrDeWb42prqlGUL9JIrqZ0W0qU+F4KZs7Ga6fDr0HyeK58xMC9s
 2tlwyyijQsAB0Be3RsgvUgis4AhLc2pnhvG3idbHoTdPC7//VUpLPwrj7feIirwWSh
 9FJE0QmRHWWvA==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1367150786=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1367150786==
Content-Type: multipart/signed; boundary="Sig_/qd2z1vdBoYRcp1OJ699BksX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qd2z1vdBoYRcp1OJ699BksX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Fri, 29 Nov 2019 09:13:16 +1000 Dave Airlie <airlied@gmail.com> wrote:
>
> On Fri, 29 Nov 2019 at 07:55, Stephen Rothwell <sfr@canb.auug.org.au> wro=
te:
> >
> > Hi Dave,
> >
> > On Thu, 28 Nov 2019 12:37:06 +1000 Dave Airlie <airlied@gmail.com> wrot=
e: =20
> > > =20
> > > > And apparently nobody bothered to tell me about the semantic confli=
ct
> > > > with the media tree due to the changed calling convention of
> > > > cec_notifier_cec_adap_unregister(). Didn't that show up in linux-ne=
xt? =20
> > >
> > > I can see no mention of it, I've got
> > >
> > > Hans saying
> > >
> > > "This will only be a problem if a new CEC adapter driver is added to =
the media
> > > subsystem for v5.5, but I am not aware of any plans for that." when I
> > > landed that
> > > in my tree, but I assume the ao-cec change in the media tree collided=
 with it.
> > >
> > > But I hadn't seen any mention of it from -next before you mentioned i=
t now. =20
> >
> > See https://lore.kernel.org/lkml/20191014111225.66b36035@canb.auug.org.=
au/ =20
>=20
> Indeed, the misc team didn't remention that to me, when I pulled their
> tree, perhaps I should make them do so, not sure why my search
> yesterday failed to find this in my inbox.

It was form Oct 14 ... I should have resent it earlier this week (or
last) as a reminder.

--=20
Cheers,
Stephen Rothwell

--Sig_/qd2z1vdBoYRcp1OJ699BksX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3gXfMACgkQAVBC80lX
0GxmYggAiMSCQRcJCGb8i9taYQZB9UOIMiKzX11lL22ZFEHrG/PuTJnwk0XGPcEr
SAg+xaTuamW9YmteSKoszSijwiSXmpt6UQyhKu5f58nDq57WxlF3czAlBt5wRA/S
+bQRXi/JS77ncFoighpSRxL5eZZVPtvj3R7SAfPTvLbXnPgADQs+CmFFxA+2f6eL
ZY/0m7ewauOx7rtQ82gQsGvOwG5klXntJcuqP0WLWG8xLpa47bcXp7+TsRbnytbh
8qNhtt9vribNi8yXwVm49YA2AriECX5UIIJdvepi2B4e5S9U/ksHt0QEirSVh97U
mrciA2gj+i7EELjxoepFJOgp7i1Ccw==
=AvT1
-----END PGP SIGNATURE-----

--Sig_/qd2z1vdBoYRcp1OJ699BksX--

--===============1367150786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1367150786==--
