Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 122A02A208E
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8F26EB53;
	Sun,  1 Nov 2020 17:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4266E1EC
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 09:57:35 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 400FC8E8;
 Sat, 31 Oct 2020 05:57:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 31 Oct 2020 05:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=goHx180SHf2KUgDW7faiAtvndRW
 Lmyt/wDA4Nszmm6c=; b=MJdtK4+g7kujdTrC2cQfdJYv6dpk59OSCZodmHt8h+w
 DDeRHwezsRsDsUuupFwcL4ftZFp9xiMwhSQlVElwo0MRsYchyxB3hPn1+wohfsTm
 Gnbw1fCrDgt288VKz8lY104xxHxduVRwfjf/3sk6zC954Nrx5/8RH6//8QMPuEgW
 NuSBRSnBl+ObxOAijaf06snP3cvBwg6dwJk55CoVaQUiIYrnmHqsKdHiuMGj8JPc
 2PIPTY1T+Eh3qMefo4JTawUELAbh5gAH8Bty1e+NGyzcZ66APHcZPORpl5iLeemJ
 a75OSANyDLNxufBJzF659TaIsY9v3bs1tDMBDdsyiOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=goHx18
 0SHf2KUgDW7faiAtvndRWLmyt/wDA4Nszmm6c=; b=ncG0/xS3Fe+bNDFU8cB6GD
 zUSxMUb/GdU86kQxCYQaoAmtAmYtpo+V0zSyFmf9Xv60q9h2vS7WxphjCIwhXjNF
 N2anBxOFL02OW4MpMKl/XswrKb90jLErdcWTaB0AFN11kOY5+RMTkrhGxbv3EZAl
 7gdSW8QY/v3Q0A9c7TtvSSk6stzHdLbMdutX4LOAQgOoZcssPtne7DAiCdvZU3gL
 XJbCSBrm4fmbctZ1Lf24+4RII9rHYRvDClxeRdmPqYNEjXZv07CiqC6w6z06xsRs
 SakdamYg+3nUFyKRyJXsovQKEDkV1kGcKeNNY+S/uPKZGFYjktFbvEVuulbm1F8A
 ==
X-ME-Sender: <xms:DDWdX3632LhdKvEcKpaV_pVYKFVT_yUOXRqJE6bRh-13d_teOXwoRg>
 <xme:DDWdX85wPx3XVC9VtNGw8RQT4VBNoeMFNfT2QVr8Gf66AP8KYBsI7pr-lNgaEv2k0
 mRkLqRArgwXGq6TKp8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleejgddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DDWdX-dzpAz6cSldmSvcdg5i07WMfjKOkul7RGLOnJzaJHBEHgqqGQ>
 <xmx:DDWdX4JP_pEaAGZVkHYj9JPfn-R2n0XNgYBh_WE98o2ZtfGRD56HVQ>
 <xmx:DDWdX7Jq0uhyn5qe2Aujjwtr3eede38VXk4HS9GIDtQc8jAmXU1M0w>
 <xmx:DDWdXz2DQNjhuI3wMaPOnAYA32OpOTfxsQmO1mIaZv0FdZkm_9XRUA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D011A328005E;
 Sat, 31 Oct 2020 05:57:31 -0400 (EDT)
Date: Sat, 31 Oct 2020 10:57:29 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/atomic: Pass the full state to CRTC atomic_check
Message-ID: <20201031095729.3a7vkwnk7oj6gq7l@gilmour.lan>
References: <20201028123222.1732139-1-maxime@cerno.tech>
 <20201029135041.GA6112@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201029135041.GA6112@intel.com>
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
Content-Type: multipart/mixed; boundary="===============0843164461=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0843164461==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tf6gd4mczkvwodoj"
Content-Disposition: inline


--tf6gd4mczkvwodoj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Thanks for reviewing those patches

On Thu, Oct 29, 2020 at 03:50:41PM +0200, Ville Syrj=E4l=E4 wrote:
> On Wed, Oct 28, 2020 at 01:32:21PM +0100, Maxime Ripard wrote:
> > The current atomic helpers have either their object state being passed =
as
> > an argument or the full atomic state.
> >=20
> > The former is the pattern that was done at first, before switching to t=
he
> > latter for new hooks or when it was needed.
> >=20
> > Let's start convert all the remaining helpers to provide a consistent
> > interface, starting with the CRTC's atomic_check.
> >=20
> > The conversion was done using the coccinelle script below,
> > built tested on all the drivers and actually tested on vc4.
> >=20
> > virtual report
>=20
> ?
>=20
> <snip>
> > @ depends on crtc_atomic_func @
> > identifier crtc_atomic_func.func;
> > expression E;
> > type T;
> > @@
> >=20
> >  int func(...)
> >  {
> > 	...
> > -	T state =3D E;
> > +	T crtc_state =3D E;
> >  	<+...
> > -	state
> > +	crtc_state
> >  	...+>
>=20
> >  }
> >=20
> > @ depends on crtc_atomic_func @
> > identifier crtc_atomic_func.func;
> > type T;
> > @@
> >=20
> >  int func(...)
> >  {
> >  	...
> > -	T state;
> > +	T crtc_state;
> >  	<+...
> > -	state
> > +	crtc_state
> >  	...+>
> >  }
>=20
> These two seem a bit fuzzy. AFAICS 'state' could be any
> kind of state given the constrainsts. Though I guess
> the fact that this is the crtc .atomic_check() it's most
> likely to either the crtc state or the whole atomic state.
>=20
> Not sure what would be the best way to tighten this up.
> Maybe a regex thing on the assignment? But I'm not sure
> you can even do that on an expression.

That would be a bit above my current coccinelle skills :)

I guess we could replace T by struct drm_crtc_state, that would catch
most cases like you pointed out, even though it's still not completely
accurate.

> Anyways, doesn't look like this went wrong anywhere, so
> seems good enough for a onetime job.
>=20
> <snip>
> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/=
mxsfb_kms.c
> > index 956f631997f2..b0757f84a979 100644
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > @@ -269,17 +269,19 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb=
_drm_private *mxsfb)
> >  }
> > =20
> >  static int mxsfb_crtc_atomic_check(struct drm_crtc *crtc,
> > -				   struct drm_crtc_state *state)
> > +				   struct drm_atomic_state *state)
> >  {
> > -	bool has_primary =3D state->plane_mask &
> > +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> > +									  crtc);
> > +	bool has_primary =3D crtc_state->plane_mask &
> >  			   drm_plane_mask(crtc->primary);
> > =20
> >  	/* The primary plane has to be enabled when the CRTC is active. */
> > -	if (state->active && !has_primary)
> > +	if (crtc_state->active && !has_primary)
> >  		return -EINVAL;
> > =20
> >  	/* TODO: Is this needed ? */
> > -	return drm_atomic_add_affected_planes(state->state, crtc);
> > +	return drm_atomic_add_affected_planes(crtc_state->state, crtc);
>=20
> Could also s/crtc_state->state/state/ in various places.
>
> But that could done as a followup as well.

I'll send a subsequent patch for that one

> Didn't spot any mistakes:
> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Thanks!
Maxime

--tf6gd4mczkvwodoj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX501CQAKCRDj7w1vZxhR
xbt3AP9A5gDS66wi74Nal5nAvElGziasustu5WLGKFgWNGwzUgEA/eIr35f+I8JB
DQ0q1JKIpde3PTEReDF77GuwGbQHhQ0=
=REuf
-----END PGP SIGNATURE-----

--tf6gd4mczkvwodoj--

--===============0843164461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0843164461==--
