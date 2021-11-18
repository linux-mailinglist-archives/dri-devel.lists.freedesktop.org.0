Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E86455940
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0157F6EA8F;
	Thu, 18 Nov 2021 10:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3006EA8E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:40:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AD3045C0282;
 Thu, 18 Nov 2021 05:40:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 18 Nov 2021 05:40:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=5TWctnqj5RMBl2czDtkqg4opj/X
 yq/3kdmJzTa0wpko=; b=ClXu6Q/sGyTNiDEajAVvwhuwWFgyNpapcZwYG65IvRf
 0IutXpqXZ5EXipHXLRCSNVp+VTlukj+MKK1+MDC9v9BljCOsE2th/Lk5C0hjRAb8
 1MZk61oYxQLc51+ybsnf6RSeT6ER90494WOzcJPW93HtiOr8HRuxanscqOdWkM1v
 3QDHyjTzjJpL/d95RtMz09iv276bEqwwHG0IXIvIO7ZlAZAmoPJiW/38YWF66rqb
 abvOlpMEzXOcPcvuN6C3tqXVYkiI8gWZ/0Jaz0ZcQ9gwK8xSChCjok6Idkum33ej
 PMvJw3UI1/jSRpNfGU5D1FWwr5WDpYjxFgMpMQ51fMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5TWctn
 qj5RMBl2czDtkqg4opj/Xyq/3kdmJzTa0wpko=; b=BU/7Jdd4ecAr7n+C8HzU4n
 XnRIEZdqER9itpDXTB/e7YKQJYRJ/B/3UPH9UzMicTt4TnEtrAl6jPxaS7xBS4IR
 Dkbp96/F3yR1ddtMz0ihiH+4g9ICEoZAHqXCD4E+ci9s8dahMuE6KWJUzYRigOO6
 YPRQdFcUhywK6q1kdvzjpjV12ej2x+/vEMDj1bWinJs3tdkbvtZt96UXSMhTXyFW
 pe0lhmDDp5rqJWyQZ1aeRrnEPUHWy8wWOo8MAhAAxYg8LS0cve2Ry9tHe9eyyjws
 GiLvOrBTMZjGiyp/GAembu2vWl9RN6FntzaHUZFnwitPrrvPsaF6BopG3/O+i1Yw
 ==
X-ME-Sender: <xms:iy2WYbn17W-wHfbw1B143OdGCz19VCMoEFt3icx0FLh2AZny1mCr5Q>
 <xme:iy2WYe3xl68QBSx9tt2VdfGE2PVvBp34xBoicHiGpRA-6lscUGBqpUrHWMjJXjVVS
 xXK8U_mUZ9SPwjGMHk>
X-ME-Received: <xmr:iy2WYRpI6coXetjQ3kzVuRgSfJ73jwaM6GpvtPQFgEJrbdeZD-ewjzTaPvj4Hecppal9YUPPI_GkTZfLtlG7v9j_cfAa9dd8Y9eo6eXNcwc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelgefhjeefjeduudduffejheehtefguedvieejjedvfefhkeevtedthedvhfek
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iy2WYTl79kTWZDg-4nbfWlnnU0EpqtwolsdI9RCRd_5HsRye4q2yng>
 <xmx:iy2WYZ1xdxI21bSdA8cqCCJhLWZFl8Nr5y-Vz1GpSPITDgFy-TX5vA>
 <xmx:iy2WYSsKkZAsN8jOJ7gyfi_hTyZA39Nbu5D_lBAjIV9_apy_O6Kghw>
 <xmx:iy2WYSJrQvsk9XYaficTKA1ftvCBXlymxNEaiEZ2ri52R3X-udFdpw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 05:40:11 -0500 (EST)
Date: Thu, 18 Nov 2021 11:40:09 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jian-Hong Pan <jhp@endlessos.org>
Subject: Re: [PATCH v2 0/6] drm/vc4: kms: Misc fixes for HVS commits
Message-ID: <20211118104009.jkvkhxi5nh4e4zlp@gilmour>
References: <20211117094527.146275-1-maxime@cerno.tech>
 <CAPpJ_eewp9Z_xdpmB+E_NFH1GGq8oyckVBmS1PD84CvCRUminQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tvppfbqa2krowome"
Content-Disposition: inline
In-Reply-To: <CAPpJ_eewp9Z_xdpmB+E_NFH1GGq8oyckVBmS1PD84CvCRUminQ@mail.gmail.com>
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


--tvppfbqa2krowome
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 02:42:58PM +0800, Jian-Hong Pan wrote:
> Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=8817=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:45=E5=AF=AB=E9=81=93=EF=BC=9A
> > The conversion to DRM commit helpers (f3c420fe19f8, "drm/vc4: kms: Conv=
ert to
> > atomic helpers") introduced a number of issues in corner cases, most of=
 them
> > showing themselves in the form of either a vblank timeout or use-after-=
free
> > error.
> >
> > These patches should fix most of them, some of them still being debugge=
d.
> >
> > Maxime
> >
> > Changes from v1:
> >   - Prevent a null pointer dereference
> >
> > Maxime Ripard (6):
> >   drm/vc4: kms: Wait for the commit before increasing our clock rate
> >   drm/vc4: kms: Fix return code check
> >   drm/vc4: kms: Add missing drm_crtc_commit_put
> >   drm/vc4: kms: Clear the HVS FIFO commit pointer once done
> >   drm/vc4: kms: Don't duplicate pending commit
> >   drm/vc4: kms: Fix previous HVS commit wait
> >
> >  drivers/gpu/drm/vc4/vc4_kms.c | 42 ++++++++++++++++-------------------
> >  1 file changed, 19 insertions(+), 23 deletions(-)
>=20
> I tested the v2 patches based on latest mainline kernel with RPi 4B.
> System can boot up into desktop environment.

So the thing that was broken initially isn't anymore?

> Although it still hit the bug [1], which might be under debugging, I
> think these patches LGTM.

The vblank timeout stuff is a symptom of various different bugs. Can you
share your setup, your config.txt, and what you're doing to trigger it?

> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D214991
>=20
> Tested-by: Jian-Hong Pan <jhp@endlessos.org>

Thanks!
Maxime

--tvppfbqa2krowome
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZYtiQAKCRDj7w1vZxhR
xYVhAQCnrbpAJ+k0kjdVHesbkPuNfUZ0OXY1KxjbIUWDbQfrPwD8DZreNGDsiZJf
bhGMZn+XW6FVmNOUmN6buDL/iifUtQc=
=n0Pg
-----END PGP SIGNATURE-----

--tvppfbqa2krowome--
