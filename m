Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC75945F0FF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 16:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390946F8EA;
	Fri, 26 Nov 2021 15:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3AF6F8EF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 15:45:37 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id B8CF932007F9;
 Fri, 26 Nov 2021 10:45:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 26 Nov 2021 10:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=YgPSROLFrTPC6zxSgCbUCQMTm52
 Ky/2Tvi5tY7xsCXo=; b=gnybvxRXBSzfnWU3F5AOko9PAKl2lLSdi31mAOm4AlH
 kCEnWbEa8SUf9cWH391+KXCcEKXhmIU7F4nrr3HnRJF7c2gcCToVXNj9Dubc2Ikg
 py2EyauTJmP4WvB5S5ajVe1aGE3BHtpI9pUxB5S4NJX0QROpodNcw9rc3JWwz+jw
 cSWIzauhjAct4N1DwAUYhHcbyM1/X9kZ7ab1jaU2xAhsew0CE5lxrpKj6ZW/iqSd
 CoyxvKqdr5bz+UxisyAARgCXkQSqQmUmlnEvSc6XrUxsOuFMtQ54GJMOyZaE0yhw
 QkT47+H38L0xOxY80blnHL0Gf1MBP10LX8zm4+SIXKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=YgPSRO
 LFrTPC6zxSgCbUCQMTm52Ky/2Tvi5tY7xsCXo=; b=ffm+3Cg1iNcDpOB2IA20Np
 ByhxuplSPbPthXfecnB9TNRFXNxLUEqwdmRyZjrZDKTfyJADc7V6RUUBFaJeG5lg
 ClymYEJMLpHDaT6BNH0EShSgTRV0rTGVcEfnCFLvcG4TrLNQG77oXZsAkMQ9x4WD
 lIgrdI+Sj+2QUYA0kQ5rMCyOUc6q5KAA2E5+vkPWqCwaTQQBPSF7qhjNl5cjbwjp
 w0hompUlsrMa0eWzykq9mQqIUqz2BNRsUDBPi0EFjRkp7jf+gM0/CR1dieT3zQbY
 Yg8qChyO+7TWKl8atuPN5jYoZ75HucFfubwF6tb+/z7U9X5SVUwtyDcobSOZ6HPw
 ==
X-ME-Sender: <xms:HgGhYQqNIwd_mjgMVsNWhRbdA2ws99BrfsBm0nacqlCw4Bcf6UrR8A>
 <xme:HgGhYWolCPQPQo1GCOXFqThugy45YOKEpNOz0hfUIUADhU6BXJMiKc7izp2h7c-SJ
 rrPLpvCj3wva6zMaLQ>
X-ME-Received: <xmr:HgGhYVOCLZoEsjxp6UKdIxr2ReCzZEZg3tzJ-96p_vMpXBiW-hnZuAV88ItLEaDGRmwdORNld434auoRs0hccbyzAUOmAxshW0s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeutdfgjeeuudehvefgvedvtedtudelfffgffekledtffekgedukeejueevieeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HgGhYX573uuCSEF4csDqYvLnk2ZSkrb7A7TLmLjGk-V34qTRh5-EnQ>
 <xmx:HgGhYf6MGan6SBP8owQShAMeBXSKEmqhuHdyZeTZ_DuL-PEDBz45Ig>
 <xmx:HgGhYXjYm7MGQ7eNCYcDT96OLPetrZG9f1-Q-Nxe9-eakY2JukL8EQ>
 <xmx:HwGhYZul3eVm5P1BXFapWH2BbVVs2GyJjkZjbMOn2naaX1tEZvXRWw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Nov 2021 10:45:34 -0500 (EST)
Date: Fri, 26 Nov 2021 16:45:32 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jian-Hong Pan <jhp@endlessos.org>
Subject: Re: [PATCH v2 0/6] drm/vc4: kms: Misc fixes for HVS commits
Message-ID: <20211126154532.nqlqkoxa77apioxu@houat>
References: <20211117094527.146275-1-maxime@cerno.tech>
 <CAPpJ_eewp9Z_xdpmB+E_NFH1GGq8oyckVBmS1PD84CvCRUminQ@mail.gmail.com>
 <20211118104009.jkvkhxi5nh4e4zlp@gilmour>
 <CAPpJ_ef5XeLKpHAzxsrokkdg8M8uqrLo9X9E5uGbFn1-Baroig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fgrhy2rcxzqako74"
Content-Disposition: inline
In-Reply-To: <CAPpJ_ef5XeLKpHAzxsrokkdg8M8uqrLo9X9E5uGbFn1-Baroig@mail.gmail.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fgrhy2rcxzqako74
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2021 at 06:24:34PM +0800, Jian-Hong Pan wrote:
> Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=8818=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:40=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Thu, Nov 18, 2021 at 02:42:58PM +0800, Jian-Hong Pan wrote:
> > > Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=881=
7=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:45=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > > > The conversion to DRM commit helpers (f3c420fe19f8, "drm/vc4: kms: =
Convert to
> > > > atomic helpers") introduced a number of issues in corner cases, mos=
t of them
> > > > showing themselves in the form of either a vblank timeout or use-af=
ter-free
> > > > error.
> > > >
> > > > These patches should fix most of them, some of them still being deb=
ugged.
> > > >
> > > > Maxime
> > > >
> > > > Changes from v1:
> > > >   - Prevent a null pointer dereference
> > > >
> > > > Maxime Ripard (6):
> > > >   drm/vc4: kms: Wait for the commit before increasing our clock rate
> > > >   drm/vc4: kms: Fix return code check
> > > >   drm/vc4: kms: Add missing drm_crtc_commit_put
> > > >   drm/vc4: kms: Clear the HVS FIFO commit pointer once done
> > > >   drm/vc4: kms: Don't duplicate pending commit
> > > >   drm/vc4: kms: Fix previous HVS commit wait
> > > >
> > > >  drivers/gpu/drm/vc4/vc4_kms.c | 42 ++++++++++++++++---------------=
----
> > > >  1 file changed, 19 insertions(+), 23 deletions(-)
> > >
> > > I tested the v2 patches based on latest mainline kernel with RPi 4B.
> > > System can boot up into desktop environment.
> >
> > So the thing that was broken initially isn't anymore?
>=20
> No.  It does not appear anymore.
>=20
> > > Although it still hit the bug [1], which might be under debugging, I
> > > think these patches LGTM.
> >
> > The vblank timeout stuff is a symptom of various different bugs. Can you
> > share your setup, your config.txt, and what you're doing to trigger it?
>=20
> I get the RPi boot firmware files from raspberrypi's repository at tag
> 1.20211029 [1]
> And, make system boots:
> RPi firmware -> U-Boot -> Linux kernel (aarch64) with corresponding DTB
>=20
> The config.txt only has:
> enable_uart=3D1
> arm_64bit=3D1
> kernel=3Duboot.bin
>=20
> This bug can be reproduced with es2gears command easily.  May need to
> wait it running a while.
>=20
> Mesa: 21.2.2
> libdrm: 2.4.107
> xserver/wayland: 1.20.11  Using wayland
>=20
> This bug happens with direct boot path as well:
> RPi firmware -> Linux kernel (aarch64) with corresponding DTB
>=20
> I tried with Endless OS and Ubuntu's RPi 4B images.
> An easy setup is using Ubuntu 21.10 RPi 4B image [2].  Then, replace
> the kernel & device tree blob and edit the config.txt.

Does it still appear if you raise the core clock in the config.txt file
using: core_freq_min=3D600 ?

Thanks!
Maxime

--fgrhy2rcxzqako74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaEBHAAKCRDj7w1vZxhR
xTrpAP464zbFupAtWFQGuF5L9yD03i2S9FtDNElSi19F30bxgQEAnWgQY0jJUS7G
tsnCJDalrGSgEIcANrUbRAw9xhlMaQ4=
=GkiN
-----END PGP SIGNATURE-----

--fgrhy2rcxzqako74--
