Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC3C5518A2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 14:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43AC10E350;
	Mon, 20 Jun 2022 12:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A0A10E350
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 12:18:44 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 54EE23200942;
 Mon, 20 Jun 2022 08:18:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 20 Jun 2022 08:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655727519; x=1655813919; bh=Q7xkvasA+w
 J5xscZtlKjYxsprKga64IJ5mhYR0/vSec=; b=HwwgVeHd8+s4ZSs+gDLpyMsS5r
 CiXEvrgphRsH7s+TEMRF7kQqnfbX08hixYMXcCY5s6CWsnGKyffhFgYBrI+cg2Cn
 6KookU3pmiGI73lnZJOf/+5gtMEI/c91TxlMfS7LRwuONMbKLNgdYjV7OEbItMAi
 Yob7jnePfM0hY69Z2T81HqiTyTLOJFNqwDhixJKWW5AOyqnNDKA9jdKRhXDC8s4M
 QSxGZUJeXJrP0lB5t0ebXXsrTUOoeucSrvGqOod6ihBkiOjMzNIUGxFZw3Ay2qBl
 hrUwEA2tbZ2eXrkWYlPw2ejxdhEuHytLA7hrSkUQ2aY3QSXD/abLcK/eF4CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655727519; x=1655813919; bh=Q7xkvasA+wJ5xscZtlKjYxsprKga
 64IJ5mhYR0/vSec=; b=axCGKMJtqopwpqsp2s9b9WTAyq9GPYvIKe9DiFnHEg3d
 aSnX9OIHJddIPMzhrxZ8YLzHpO9o+AON5Q7M4DCU0CiVGEyCrAW2VcmLLc2S7KdV
 OrNz/taNbBFBZ2Aegmh9YozME29oquJb26uCH/ZtLOso2tdc4skQLXqDlrNbRzKZ
 Hoyu4DO5HSqGzNHXDVVPxHBBNIb+xGoLUO3/NBHC6KIfLwbIQtXcuQv6Qx6yGt3A
 gR/fSxMrrLd9ols2CVi5uZtzHP2an30+l+Y5iDFp5saUxdxWZcUwb+Tf76sx60Ne
 lw8029xyoT+ttryxBfK1x2VUyQPrYSGy4DhZEdnLuQ==
X-ME-Sender: <xms:nmWwYizwvnI_4e4idnb-evVGpHjQZvRJ0rQeruL4_oFwUVnxsnzJKA>
 <xme:nmWwYuTmmT-zN5VORJ5vu0OKy36if4fSX0qpVYXMeOh24JiDkpkEVuY463RszY5fe
 7lI7r33dmljf2ysbn0>
X-ME-Received: <xmr:nmWwYkV_iOPWZSy_cyG0CcktEqIEAUVXJjE5bLphuBcQADxzOp2qxJxnvScLWovfSJIh9B4BfrULXsH6UzgJ2p6v0pRvLVkdiozzT7Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefuddghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nmWwYoia9fHQRhy1nnmzZz2Ns9Y1eZXpjKVu_Ft_CSV7a2ObB5gQRg>
 <xmx:nmWwYkDADFCiVB9QP3so8XhzIwVCwi5KbNILq4NToRBvGA936VyzEw>
 <xmx:nmWwYpL3DcZ_MjLaHwNOSdrhljlJqUE_O-EcbqBS8vE3IjzsxiBa_A>
 <xmx:n2WwYnP9UpDH6Rd8TBajnKhhDXSAQfj3QzP-i3lQbwPMYMEPjjDJXg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 08:18:38 -0400 (EDT)
Date: Mon, 20 Jun 2022 14:18:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 05/64] drm/connector: Mention the cleanup after
 drm_connector_init
Message-ID: <20220620121836.2bxmnyrfrfgvdyd2@houat>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-6-maxime@cerno.tech>
 <ede82148-dc9c-2944-ced3-9f7ce9c03e93@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uhgy7ww3mjgx7zgh"
Content-Disposition: inline
In-Reply-To: <ede82148-dc9c-2944-ced3-9f7ce9c03e93@suse.de>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uhgy7ww3mjgx7zgh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thanks for your review

On Mon, Jun 20, 2022 at 12:21:33PM +0200, Thomas Zimmermann wrote:
> Am 10.06.22 um 11:28 schrieb Maxime Ripard:
> > Unlike encoders and CRTCs, the drm_connector_init() and
> > drm_connector_init_with_ddc() don't mention how the cleanup is supposed=
 to
> > be done. Let's add it.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   drivers/gpu/drm/drm_connector.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index 353d83ae09d3..2a78a23836d8 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -222,6 +222,11 @@ void drm_connector_free_work_fn(struct work_struct=
 *work)
> >    * Initialises a preallocated connector. Connectors should be
> >    * subclassed as part of driver connector objects.
> >    *
> > + * At driver unload time the driver's &drm_connector_funcs.destroy hook
> > + * should call drm_connector_unregister(), drm_connector_cleanup() and
> > + * kfree() the connector structure. The connector structure should not
>=20
> This sounds odd. Maybe
>=20
> '... to release... the connector structure' ?

I didn't really get what your suggestion was exactly

Is it

> At driver unload time the driver's &drm_connector_funcs.destroy hook
> should call drm_connector_unregister(), drm_connector_cleanup() and
> kfree() to release the connector structure.

Or something else?

Thanks!
Maxime

--uhgy7ww3mjgx7zgh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrBlnAAKCRDj7w1vZxhR
xcn2AP0TdK4CZ+JJ6OPRSME5xquYpgc6wbNxHbEXcJlUOv4BkwD/UfZhiOzMDdr3
wsuKYgAQiNM/176BFtC6YvXKboR9Zww=
=NkyQ
-----END PGP SIGNATURE-----

--uhgy7ww3mjgx7zgh--
