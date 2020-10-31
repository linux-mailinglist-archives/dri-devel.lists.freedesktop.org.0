Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F6D2A2082
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1526EB4A;
	Sun,  1 Nov 2020 17:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96E26E1EC
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 09:59:08 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 1DD5A9AD;
 Sat, 31 Oct 2020 05:59:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sat, 31 Oct 2020 05:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=qeSvc/a3X8UZDysk/ocb8J82+kv
 ROYFKRXzUPNsjkbU=; b=JHlsM8eQgq6p7l7FOP/WtAQvrwAF7OO67lEsejkJXML
 A8K5JCGAwk7WrhjjB3dy3elPuxpm6zugIJrq6F99B+2EBLnWp8CY4hx7Ahgu4IjS
 99JT+piqvwi+HlCgdHU+lrGEQceYwqeJkeKc07eGzGTuunS3s8rLk7T62tKHa5nW
 Y/DbvZBrDHjjwUnY2Sh4HJJU+4hHvUrr5lTmDDKvRWxEK1AsA62g6gMXxyZlr/wp
 S6tax0RAWafbFoWNAmGDtEjzt88HskTx7PAKHlrOniozoxjkhf/Wlc6iHby8ri5Z
 w9UCxnE8skbFpMDzVjgLTu9Rh7ltZ+2BfSIlJQY6qmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qeSvc/
 a3X8UZDysk/ocb8J82+kvROYFKRXzUPNsjkbU=; b=Q5TtHwvPc2usVXjMKUukjA
 KBtDAOnxeWBQZH1gfMc+AFy3wuHtiDj6QA9OgeM9AQNX7/9QA7B0TlZVEtssMGRC
 G6exwLMRd6kA+cspUJZdzIdOCpg+85F3dXndFgxfxdntdLUCERw/Y5/w2x02v3io
 L4IKdXpKiBiCLIgEQUBUlM5AzHW5aEJTiL3vP2eoLOGXbpUXDsSg8jt2bKxaVjjX
 K++j8CF1mU6bTnHk61Nr/SorkRxfXuNBYiR7SQX+OW4jyAn+alBQjQWPRt8iQRqw
 3S/uygiM/DTsGqAV6SjzMPqH59os9XVyN4Y7rJv2FyI2MxhQGyhBKsIBM49Vcd7w
 ==
X-ME-Sender: <xms:azWdX7yC604Nt4XwhXpp0j70pIRl2MavdxK7JDGshYrG4tb0sa-XoQ>
 <xme:azWdXzSuAQdN3ft5cUIy1_sfH5n1bPvEilT7g2X1Cm6IfgZ6n4cVoRMm_Y1k9Qe-7
 13zXizGxbriaIVND6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleejgddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:azWdX1U8iiUUE5DaQh2dm_HdjgrubcZ2dBZByS80EzWw2byYLAzYbw>
 <xmx:azWdX1h6T8f1-PGWVHNaGvesBbKbPyvP1MozAuE39WE4IbNSuyBDfw>
 <xmx:azWdX9DrJZqiGA2QFZ7lfGov2VkE6Upe9Po1kypJr9i9UXX_zeN-cA>
 <xmx:azWdX8MjoSbrRYOXPTTENNoYB5tvZD7BsIqkHN9L2kIUCUb3t_WqEg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3B5403064685;
 Sat, 31 Oct 2020 05:59:07 -0400 (EDT)
Date: Sat, 31 Oct 2020 10:59:05 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/atomic: Pass the full state to CRTC atomic begin
 and flush
Message-ID: <20201031095905.lr6jat6jasxasuhq@gilmour.lan>
References: <20201028123222.1732139-1-maxime@cerno.tech>
 <20201028123222.1732139-2-maxime@cerno.tech>
 <20201029135537.GB6112@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201029135537.GB6112@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0603425052=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0603425052==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vsa2qc63tdqrhsfc"
Content-Disposition: inline


--vsa2qc63tdqrhsfc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 03:55:37PM +0200, Ville Syrj=E4l=E4 wrote:
> On Wed, Oct 28, 2020 at 01:32:22PM +0100, Maxime Ripard wrote:
> > The current atomic helpers have either their object state being passed =
as
> > an argument or the full atomic state.
> >=20
> > The former is the pattern that was done at first, before switching to t=
he
> > latter for new hooks or when it was needed.
> >=20
> > Let's start convert all the remaining helpers to provide a consistent
> > interface, starting with the CRTC's atomic_begin and atomic_flush.
> >=20
> > The conversion was done using the coccinelle script below, built tested=
 on
> > all the drivers and actually tested on vc4.
> >=20
> <snip>
> > @@ -323,26 +323,27 @@ static void ingenic_drm_crtc_atomic_begin(struct =
drm_crtc *crtc,
> >  }
> > =20
> >  static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> > -					  struct drm_crtc_state *oldstate)
> > +					  struct drm_atomic_state *state)
> >  {
> >  	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
> > -	struct drm_crtc_state *state =3D crtc->state;
> > -	struct drm_pending_vblank_event *event =3D state->event;
> > +	struct drm_crtc_state *crtc_state =3D crtc->state;
>=20
> Looks like quite a few places could use a followup to
> switch to get_{old,new}_crtc_state().

That one is not entirely clear to me. crtc->state is documented as the
current CRTC state, but in atomic_begin / atomic_flush, does that mean
that it's the old state that we're going to replace, or the new state
that is going to replace the current state?

> Patch lgtm
> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Thanks!
Maxime

--vsa2qc63tdqrhsfc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX501aQAKCRDj7w1vZxhR
xWg4AP0W6T4hU9nnxP3NphpSAbN1p+LLjNKt8j9leOaBELBSpQEAxHKhDZNBu20F
xBL88Jah8LGQLf9WjA0W+gLyRUpe2gI=
=pe9a
-----END PGP SIGNATURE-----

--vsa2qc63tdqrhsfc--

--===============0603425052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0603425052==--
