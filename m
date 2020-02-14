Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC3E15CF0C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 01:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECDF6F89F;
	Fri, 14 Feb 2020 00:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70F56F89F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 00:33:22 +0000 (UTC)
Received: from earth.universe (unknown [185.62.205.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3435F20873;
 Fri, 14 Feb 2020 00:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581640402;
 bh=iBOGAqiVcfh+KYc3OQ0CM7pQr/r16J+821VWjCxTaHo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nMULZ8TJpgdNVwzPWjHAX9Bp0zs1ITe373uCZTcEIgk4sNza7BB0Ji5ewpWtujW1P
 EFM3Re+pewQRY27+rQKg1JiXIczWbKQ8kp6QhXrPQsG7/M0CQkTt2oMSWTtw9gJNHq
 ngPBQY/naq3b0oz/q/V1NPjQX9gmUDHwxjbsP5+I=
Received: by earth.universe (Postfix, from userid 1000)
 id 4C4D33C0C83; Fri, 14 Feb 2020 01:33:19 +0100 (CET)
Date: Fri, 14 Feb 2020 01:33:19 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
Message-ID: <20200214003319.kgoe5taaunibhfzq@earth.universe>
References: <20191114093950.4101-3-tomi.valkeinen@ti.com>
 <20191202130459.GH4929@pendragon.ideasonboard.com>
 <20191211165331.GC43123@atomide.com>
 <45dae8f7-2f5e-6948-5a05-dc8a09ace1fa@ti.com>
 <20191212203550.GB4892@pendragon.ideasonboard.com>
 <add3d8af-6977-68e6-fb77-2fa748c4714a@ti.com>
 <b39e52f1-3e73-5f26-6206-0956cf482631@ti.com>
 <20200211110712.GB28355@pendragon.ideasonboard.com>
 <3b4d10c6-7cb2-af53-3a39-31eef441bfdd@ti.com>
 <20200211111007.GC28355@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200211111007.GC28355@pendragon.ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jyri Sarha <jsarha@ti.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1209136175=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1209136175==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2wvlsewml42gsbth"
Content-Disposition: inline


--2wvlsewml42gsbth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 11, 2020 at 01:10:07PM +0200, Laurent Pinchart wrote:
> On Tue, Feb 11, 2020 at 01:08:12PM +0200, Tomi Valkeinen wrote:
> > On 11/02/2020 13:07, Laurent Pinchart wrote:
> >=20
> > >> Hopefully soon (in five years? =3D) we can say that omapdrm supports=
 all
> > >> the boards, and we can deprecate omapfb.
> > >=20
> > > I'd love to send a patch to remove omapfb, but I'll let you do the
> > > honours :-)
> >=20
> > Not before we add DSI support to omapdrm...
>=20
> Details, details ;-)
>=20
> Seriously speaking, Sebastian's patches are on my todo list.

The patches need to be rebased. My hack for supporting panel
un/rebind stole connector and drm_dev pointer from drm_panel,
which is no longer possible. I hoped this could be cleaned up
once your and my omapdrm patches landed...

I do have a compile-tested-only WIP branch here, but I doubt
I got this working on the first try:

https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-n900.git/log/?h=
=3Domapdrm-dsi-drm-panel-5.6-rc1-wip

-- Sebastian

--2wvlsewml42gsbth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5F6sgACgkQ2O7X88g7
+poH6A//aCQRXG/14j6TvwzTBtQoG3R4bgJWDJeKHsyBTfLqZNHw57/07MrXN1Fk
bU7U7PegPu2OEw+gmFALyufYEFE9uI0BN8hKvBgKytAVoVfAILSPvYai7zgPR23q
DbuZ/S4F7pjKQeN27H1ImJ+p6cyEOYZdWdqSSo58+DlsTd4MtDcushW6u+WRu294
PQxH/EdlGjdIflbo9TX3ap0qU7mUrmp9uvCGhPPRjyh7y/UbLJXEvGb7Mmq/NN74
e/p5422bG8J7yPOCkplmY4Ha4+KVrmT6FgyUgBs4MiwwwUCCKIfxtiRLyigKj4NO
hVoxbWc75hreRWz6DcfBQ8LHhcs5/YLr5m9BOzCmgpexRRmzyrJBj4QVvlMWMkDK
bV2f/WNIYpRLaCyuF8PABiJTahQ/zZCkkEcMj02GSZALHlKODmmP/sttxI6qWoeV
2cMcp7jyVWD7px8Q4eaOs7LaEy3RmRSkzz52xFwRpSUdPAgE4mc7HUXPxagLtZJT
WF322P/q0komaSJq0hwgaIhOy66qdEJdch6SuHaNEmZDO8H523jZYxCEs7tlTDa0
3xTU/O90nsfcDxf2chF2NAKjcsVni0RN1gnoywxlOOF1/zQy9DGl49MkGdICh1nv
kYAflX8XL0McduvDw590uIGZHhEI7mDo16sAIKrYtB9i5rKrFTo=
=MEFj
-----END PGP SIGNATURE-----

--2wvlsewml42gsbth--

--===============1209136175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1209136175==--
