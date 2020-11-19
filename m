Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95B62B9C0D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 21:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDC06E823;
	Thu, 19 Nov 2020 20:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0E16E542
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 14:32:23 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id D99435806F5;
 Thu, 19 Nov 2020 09:32:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 19 Nov 2020 09:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=fdeCJrw0Opv9LtMWbCk4M6wggdX
 HkukfGAaUbw2IQ6g=; b=t9NaJ2J/XhRdNuXdea/oz7750HrVqWDGUjgBdFH5X0Q
 TGh+KBJEGLBcjiibQRQpkDKdPHXnhB1TyBfw0WEoZLcjVM+A53oaLrgFApHO6EM8
 N/3+KN0SUZZDoL+6AElNAxSul4scoP8mn4kleJz0xAThizx5L67x1GtOe8jnKBiG
 UeOmDm9ObaC5xILY6RoP8WT4Sd+zbBHIVOMCXZBIZwRIbvTahn1AbhEMMJE8XJ3H
 K4MQHdgUCzkQa448rUu3537SPw+Xx85cLBBaqQtBZxZmYSP2IptPX4i2pDSIp4HZ
 ZEsCOJDbjAt/yuCWXSNZPDcmybgcEKqXapYw58wG2WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fdeCJr
 w0Opv9LtMWbCk4M6wggdXHkukfGAaUbw2IQ6g=; b=U5bk7hAIdvzMZMWy+pxPIs
 r+O6qgO1DSb7SXgnQ+3bemtMPOB2ycmLIPFFPxMM1FDE8h0OeytslPREtQwoxHDh
 l6iDtcFSe+X5PQ7AM2rdou+9LtgCDMAebUxNwocC9AAigvOzwCk3B+y+JUEvlPhv
 U1e4QMLDqxLVsS4DZv3OxDp+LmibO18QUMT45+5vkbKDsMINgBvYg74IwJfq/004
 C4CkrBOh1g9TA3pSgpH2/78DjGF4wQ/ckBptmxiBgeJS/U8xqQp+dD2OIJGdltIs
 /CVLBsxHYV7ESRp0e88Lvku+QTG8IKB+0gRtPXbf0B5yCrFW7TiqQznMyhN1e+eA
 ==
X-ME-Sender: <xms:74G2X4QwYv_sQLPCYBKUn28NMs9TrzIlF07RtTNirhel9yVfACe98A>
 <xme:74G2X1xcC27qQnrQHEo3V2ujlKC2JIxA8-Dyoqcs6tLBo6wghwhE-V9eqz1aY7Xxa
 vyt-5pfxfbDXGy_szQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefjedgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:74G2X11TAfTvjyIsbY-kGepsS2t2DvCq3VVqyFSOOk4bK0OU3bcUaQ>
 <xmx:74G2X8B4FdqcJEHvkhfdgkD6H4R_jB4ToyTZYGmcvN7sd3GX38XkIw>
 <xmx:74G2Xxiu5DJr3Dmw-nnJ8BxbkMpuXzaCgqxIOYXPwvQ8Y8TTvbaydA>
 <xmx:84G2Xx7aDLvuUx-Az1UuxTr13Y5daDSJY6Jo27cDwPwxQ0mPQE1kMA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D567A3280059;
 Thu, 19 Nov 2020 09:32:14 -0500 (EST)
Date: Thu, 19 Nov 2020 15:32:13 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 7/7] drm/vc4: kms: Don't disable the muxing of an
 active CRTC
Message-ID: <20201119143213.wqgvn2d3vphyeked@gilmour.lan>
References: <20201105135656.383350-1-maxime@cerno.tech>
 <20201105135656.383350-8-maxime@cerno.tech>
 <2e61b179-35f3-f4b3-9ec0-c822370da663@suse.de>
MIME-Version: 1.0
In-Reply-To: <2e61b179-35f3-f4b3-9ec0-c822370da663@suse.de>
X-Mailman-Approved-At: Thu, 19 Nov 2020 20:32:07 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1862516899=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1862516899==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ywfvxmnqzpqjf2fz"
Content-Disposition: inline


--ywfvxmnqzpqjf2fz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2020 at 10:12:43AM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 05.11.20 um 14:56 schrieb Maxime Ripard:
> > The current HVS muxing code will consider the CRTCs in a given state to
> > setup their muxing in the HVS, and disable the other CRTCs muxes.
> >=20
> > However, it's valid to only update a single CRTC with a state, and in t=
his
> > situation we would mux out a CRTC that was enabled but left untouched by
> > the new state.
> >=20
> > Fix this by setting a flag on the CRTC state when the muxing has been
> > changed, and only change the muxing configuration when that flag is the=
re.
> >=20
> > Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatic=
ally")
> > Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   drivers/gpu/drm/vc4/vc4_drv.h |  1 +
> >   drivers/gpu/drm/vc4/vc4_kms.c | 82 ++++++++++++++++++++---------------
> >   2 files changed, 48 insertions(+), 35 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_dr=
v.h
> > index 014113823647..325b53ff11b3 100644
> > --- a/drivers/gpu/drm/vc4/vc4_drv.h
> > +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> > @@ -524,6 +524,7 @@ struct vc4_crtc_state {
> >   	struct drm_mm_node mm;
> >   	bool feed_txp;
> >   	bool txp_armed;
> > +	bool needs_muxing;
>=20
> Maybe rather 'update_muxing'.
>=20
> More generally, I'd separate fields that contain actual CRTC state, such
> assigned_channel, from those that only contain transitional state during
> update-commit, such as needs_muxing.

How would you separate them?

I'll use your other suggestions, thanks!
Maxime

--ywfvxmnqzpqjf2fz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7aB7QAKCRDj7w1vZxhR
xVTzAQCr+8IdXjnVaJWRPSPg5zJcI2nQ7fDeMLE8/dGK7/UOoAD/VPfcWb+Ve+pt
QZWUFI5owJotbGGUDLCTNUcEWoYt/g0=
=8pyD
-----END PGP SIGNATURE-----

--ywfvxmnqzpqjf2fz--

--===============1862516899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1862516899==--
