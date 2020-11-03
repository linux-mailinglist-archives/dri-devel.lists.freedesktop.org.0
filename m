Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200152A5F93
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2605F6F3EA;
	Wed,  4 Nov 2020 08:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9436E866
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:08:02 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E66DBAA1;
 Tue,  3 Nov 2020 05:08:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 03 Nov 2020 05:08:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=5ldSgRt2nJaUnCvKYi8wizGE0zd
 CFaN3dun5/ObZwQs=; b=cjqPKpfXVOwrGyXJS1CoupVp1AteNcCSvdcBeyWgW0/
 qkh+Co3IK/meFeAk7+1jSxVkz7xKh2ItLTFHX972zBgCsby50Tr6oa6dX8fFFuCn
 RYbhNyzhFBpadzCd+kj1zt5vMv/Ns5dUNW4+5fItUb5qrTxRkJO7qToGI6uc2OqV
 tyg1TWoLmvcA8xijF+VW3Ks8UXj9m0mUJyhtN4zjkdPHDeL6ZI7VVhnnh9LDonwE
 dR56kHLRsynu7n8gFPasIm+D9tcALWWeUKJ1b5U7qgVjICbXETA8C5P4rCXT2CwB
 G0Q1QbJLj8nzrvt0r7JPelHZITnkZpWDBofZrgCVexg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5ldSgR
 t2nJaUnCvKYi8wizGE0zdCFaN3dun5/ObZwQs=; b=qWLCGo6rsOafcuRu6rBCCs
 S9fvVQaRQIqKhO/DQTjo2ckgOl2/Qzifx/LIWxnVdPeOay0/685yEIXcbCizay8G
 S1T/eb2VVhmI8hNfzFJ+Yc+uTpLAHTKhDoLR1GPQuXObjHkzppK0kpNE1jG3pCjv
 UG6kTwDRRy/P5jju6MEZ/lp4Ae6eehjtW/CveQUn03rG/OmW8Xcag1gL+c/Lpaq0
 KXKu69Ln4SSc196XzPsb82Xh7oqqQ0IMSGkkImJRrGaYBoLP6tHNepBAf+q2ryGT
 8pHg0/E6sh/UVSy+gJCSf/Ab6PowkQysMQJITbeJEgQBL/dtllfV+zc56T0O+gQQ
 ==
X-ME-Sender: <xms:ASyhX6muzcTqskOWYHfK3Rgx_OhbhsltTyHaBSpdqr6YRbH-LJhmXg>
 <xme:ASyhXx1QQXBp6rHDYWXsNCALcpoDjgGaDL5QI5SJF0iCH3AXUmkzKBQ0sO-xWTp8T
 -1ELiY9u0e_LHyk5qg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtfedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ASyhX4qC5XEPJjkHznVsYVA41S130AOu09GZQ6k_-nRywQfh3ML0Hg>
 <xmx:ASyhX-n8G_oMSdfitdwjx6SrG1h9Tki_lW2LDVDF9Fq4fA6fFVTWSw>
 <xmx:ASyhX43JMxSIuD2cVo-cFPCduDMt2CYZ6F5Avxrp1ri3p4wQ3G9etw>
 <xmx:ASyhX1xxVGLG_IrXmBaroD7c-GOTFZS2evE3sIPg3pEkOvwLGDGBtw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 17B1F3064674;
 Tue,  3 Nov 2020 05:08:01 -0500 (EST)
Date: Tue, 3 Nov 2020 11:07:59 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/3] drm: Use the state pointer directly in atomic_check
Message-ID: <20201103100759.wunjg4ru2av2gk6c@gilmour.lan>
References: <20201102133834.1176740-1-maxime@cerno.tech>
 <20201102133834.1176740-3-maxime@cerno.tech>
 <20201102160604.GO6112@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201102160604.GO6112@intel.com>
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============1483012516=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1483012516==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="et4xfibc243bf7u5"
Content-Disposition: inline


--et4xfibc243bf7u5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2020 at 06:06:04PM +0200, Ville Syrj=E4l=E4 wrote:
> On Mon, Nov 02, 2020 at 02:38:34PM +0100, Maxime Ripard wrote:
> > Now that atomic_check takes the global atomic state as a parameter, we
> > don't need to go through the pointer in the CRTC state.
> >=20
> > This was done using the following coccinelle script:
> >=20
> > @ crtc_atomic_func @
> > identifier helpers;
> > identifier func;
> > @@
> >=20
> > static struct drm_crtc_helper_funcs helpers =3D {
> > 	...,
> > 	.atomic_check =3D func,
> > 	...,
> > };
> >=20
> > @@
> > identifier crtc_atomic_func.func;
> > identifier crtc, state;
> > @@
> >=20
> >   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
> >   ...
> > - struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate, crtc);
> >   ... when !=3D crtc_state
> > - crtc_state->state
> > + state
> >   ...
> >  }
> >=20
> > @@
> > struct drm_crtc_state *crtc_state;
> > identifier crtc_atomic_func.func;
> > identifier crtc, state;
> > @@
> >=20
> >   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
> >   ...
> > - crtc_state->state
> > + state
> >   ...
> >  }
> >=20
> > Suggested-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> lgtm
> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Applied, thanks!
Maxime

--et4xfibc243bf7u5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6Er/wAKCRDj7w1vZxhR
xfOwAQDgMtSnE4cGivPentogU8zu1KfPcgZ+Y8IeK12nDmnJvgEA1REwDEHtWxHR
w8gUlWmGQoln/mSunkttPo57QJlafwI=
=jTgD
-----END PGP SIGNATURE-----

--et4xfibc243bf7u5--

--===============1483012516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1483012516==--
