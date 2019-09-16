Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDB0B4007
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 20:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAD76EA21;
	Mon, 16 Sep 2019 18:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1148F6EA20;
 Mon, 16 Sep 2019 18:08:24 +0000 (UTC)
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i9vQ9-0005Jy-2b; Mon, 16 Sep 2019 18:08:17 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 24F432741A0D; Mon, 16 Sep 2019 19:08:16 +0100 (BST)
Date: Mon, 16 Sep 2019 19:08:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] drm/amd/display: Fix compile error due to 'endif' missing
Message-ID: <20190916180815.GK4352@sirena.co.uk>
References: <20190916044651.GA72121@LGEARND20B15>
 <CAK7LNARZMr5ZKGufi63GZrZ45k60faAiXr4mBB_mU9h_QifjxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK7LNARZMr5ZKGufi63GZrZ45k60faAiXr4mBB_mU9h_QifjxQ@mail.gmail.com>
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IhH8eG5jrmv5K+PdK/jRPJRJORLMPGfQ9Mu0yZDLXao=; b=KwzTtsFTbybFw474V6VBrCeXi
 EQ9ZNyYUDVea3mWV6fDFsK7Aanb7ZWj+GzYrXbtDNgrInzYj4Z9kpuBIILVqS/XXkS7RAK0ITFjG+
 MSwdIU5caaopv9HF1cI5CDtZ1RF6vVqZUNH1Qlq8+A8Qbs46wi4iy0WP3ydsbUpI9zHLw=;
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>,
 Austin Kim <austindh.kim@gmail.com>, Roman.Li@amd.com,
 amd-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1406666911=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1406666911==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IKC1RK7+nRZ8SZaO"
Content-Disposition: inline


--IKC1RK7+nRZ8SZaO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 02:46:48AM +0900, Masahiro Yamada wrote:
> (+CC Stephen Rothwell, Mark Brown)
>=20
> On Mon, Sep 16, 2019 at 1:46 PM Austin Kim <austindh.kim@gmail.com> wrote:
> >
> > gcc throws compile error with below message:
>=20
> GNU Make throws ...
>=20
>=20

I don't have the original patch so I don't know what the issue being
reported is :/  Whatever it is it wasn't caught by any of the builds
done during the process of building -next and nothing is jumping out at
me on KernelCI.

> This is probably a merge mistake in linux-next.

> If so, this should be directly fixed in the linux-next.

> If it is not fixed in time,
> please inform Linus to *not* follow the linux-next.

It's probably worth coordinating this merge with DRM, it's not *super*
complex but clearly there's some potential for error here and it was
definitely annoyingly fiddly.

--IKC1RK7+nRZ8SZaO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1/z48ACgkQJNaLcl1U
h9BEtAf8Cg6gsw4Wr7G6vas1AyCCbY8RUAsjUmUecWcXXaUrxAlhZINRy+3tV8pB
1+uxPZZbpbrAtrb7GATiJZAEmCbazZP5PlHWivEgTfqSUQiHSDoX/5gvtaGdfQoq
fEosO5kiJ1Z7uEjKLgqfdIotR0oGxYYBRAhMPs5Q+KDheHdNDVVkWjKkqfLGBMvc
QxAbEbCfF3mk0MziIFmI4rmsREpvVE3YqWZFcp/u0dUbg/+hAf9/MKH2W1EK7qi4
L45PCcnI9vR5hivC8iNYZnvFtg1IugOgX7kM/6Wp8g4jxvTPeZGqYG4LFfdRU2lx
wMBC2pjSApPd0pdO0uUyA7Cjn9Tg/A==
=cbJO
-----END PGP SIGNATURE-----

--IKC1RK7+nRZ8SZaO--

--===============1406666911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1406666911==--
