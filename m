Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25C1D98D0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 20:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506116E419;
	Wed, 16 Oct 2019 18:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4FC6E419
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 18:01:14 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iKnaw-0005xp-G2; Wed, 16 Oct 2019 18:00:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 822562741FCE; Wed, 16 Oct 2019 19:00:21 +0100 (BST)
Date: Wed, 16 Oct 2019 19:00:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 05/11] drm/tinydrm: Remove
 tinydrm_spi_max_transfer_size()
Message-ID: <20191016180021.GF4881@sirena.co.uk>
References: <20190719155916.62465-1-noralf@tronnes.org>
 <20190719155916.62465-6-noralf@tronnes.org>
 <20191015143236.GA5363@smile.fi.intel.com>
 <253aec49-e51c-b35b-4e7d-53a8a948655d@tronnes.org>
 <20191015155720.GQ11828@phenom.ffwll.local>
 <20191016161300.GW32742@smile.fi.intel.com>
 <CAKMK7uEp39uvLtgyTTj31u-GYVoPiVJDTVbUThtn7NU_EoKk3A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEp39uvLtgyTTj31u-GYVoPiVJDTVbUThtn7NU_EoKk3A@mail.gmail.com>
X-Cookie: Serenity through viciousness.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=831oddvIWDaezyLXT0EnzHzEYss/MUysoe0QwJq3uNQ=; b=gAFB/hHicc7uy5LIn8t9nPyB/
 qeAS4PGIEL6BtBtRC9ZN9rXJgQ94wgGK5g44/LpjQpTSG/TSCY0jjpcp7114PLlmkU2JDiuAhRxDr
 MBiGt+IONZ7aCEvA8wGU88NXDqSAnRoK/VfQEfsf3jYzF+M3tnGfpHzewAiLqI4BrayOA=;
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
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, linux-spi@vger.kernel.org,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Mack <daniel@zonque.org>, David Lechner <david@lechnology.com>
Content-Type: multipart/mixed; boundary="===============0492929857=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0492929857==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Content-Disposition: inline


--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2019 at 07:44:51PM +0200, Daniel Vetter wrote:
> On Wed, Oct 16, 2019 at 6:13 PM Andy Shevchenko
> > On Tue, Oct 15, 2019 at 05:57:20PM +0200, Daniel Vetter wrote:

> > > Something like this, as a test patch.

> > max_transfer_size should be a function. In that case it works.

> Why do you want to make it a function? At least from my reading of the
> code, the dma vs pio decision seems to be done once. So no need to
> change this at runtime. Changing at runtime would also be a pretty big
> surprise I think for users of spi.

Yeah, I'd expect it to be a fixed property of the hardware that doesn't
vary at runtime though I'm sure there must be some innovation out there
which challenges that assumption.

> > However I'm not sure it's the best approach, thus, Cc to SPI PXA people.

> Hm didn't spot the pxa people, added them. Mark, should I just go
> ahead and bake this into a proper patch for discussion? Or
> fundamentally wrong approach?

That seems sensible enough, it should certainly fix the immediate issue.

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2nWrQACgkQJNaLcl1U
h9ACpgf9FYcLQbfzOaqA6bv23GWM5kYHA1UQOKHgZlYLGC2Aw2IeM1XqAs7af+EZ
fzW3MX3jF1BIV508BV4aPBDjos8meM4SQLXnHHzAn1Kvtfky92yyKuQJuz3/S8Q8
kU6Eg9MYfC32v/Ii1T8Xo/Du9uNI9cmdBkO7D3jteSBIztHjJGWKbD4zvJ7DZIfO
pA3aKflUVJoigqGqpCC/DCiksKAlcLVML61jwSDl611fibVqYSOmfsjsTl9M+FMm
REE2KZdwbugKtbhrNA0oLIJqG8lEVbx23IFjHixlGJfOmHk/Aqw8yF75f/DIofxt
lXwPoa9S1SUlO1mBG3bonq/CynXuZg==
=Ib+9
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--

--===============0492929857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0492929857==--
