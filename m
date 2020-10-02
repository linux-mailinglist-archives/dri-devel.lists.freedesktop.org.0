Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBB2282306
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 11:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2A989C8F;
	Sat,  3 Oct 2020 09:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD656E073
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 14:54:22 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C77765C00EE;
 Fri,  2 Oct 2020 10:54:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 02 Oct 2020 10:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=QsP7ZGqc25jYYx78ohQMVlv1zaK
 9EM9c45haentOy/4=; b=o+smxIdTwxAiLZ0yA7nGkbj7JTE7BA/Unj4f+ZarqGE
 2bmGIsVnbpLRtAUhQTbCZWBAU+CfGUCEP5VdX0STl2+J1J5IpRyjXB456AAAQsQ4
 ngs2jToRNh3jkUOs5aaNtFoh/708OVlCn1bDBQWFcY4dwWkQxCRobXaxL00nmBYz
 hNmDONngzMm/ydwieX6Pe8UX9tqX5lLBio12RExUJYvM0jJy6N7CE3WAF+PGGSIV
 e34Vq4shFZQxqVD5jmDFd23xhER/yZNu9wcFb73hbJS5Pi3FWQSstMo3cB6VCM9O
 1926Dk8LThR5Dm5zDLQFlI21kiZDuotqVBNG5MMHPSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QsP7ZG
 qc25jYYx78ohQMVlv1zaK9EM9c45haentOy/4=; b=Ac6uNgk4t9Is2pQbC5FfCR
 8NRkeo+KCZB1D042E9i91qp+bXB1KlOT7X8DEM544Z5k5nlL8v9vZpQuSVOWEfeD
 TLSbdRr3/mpg9Ju9sm52rssEmqatwYNqMt9a2F9HG0KKsXFmy2DpJ+MuzFHQcqG7
 upYiwxirfQ1PRnNJrEFn50/mFt+odwASnIWiKpI1cpkmEiY/EWrgZBuQ6u5JBhXA
 az4xT8W9JXViPzGR67EH9wvgYSst/+aaPmN/tD8wpIuIEqMmzRXObvDMVihWuMRf
 BSz3/4aeclm2TqqdN8psr1Pob1orb5cm7cukCznyzLUqBFgx+YnjW7cHsb1FFaKw
 ==
X-ME-Sender: <xms:Gj93X5_ks9GhUhBDhsppmw1421FW3_BRn3KMXvcQISvSzr1yPh5huQ>
 <xme:Gj93X9tNidUPl2oSOmIWUtv-x38DaMMd2uhpcwFX9Gv7t79mbYbTFpp2fCvxVgkOq
 oqq83DcLgAbwkhy5Jk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeeigdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Gj93X3BAre51N9p2DNknngFM-Zr-PTE7iCPoU6wsZXhbAzY7lxmKXA>
 <xmx:Gj93X9d7zBNkIjPedDFaFXcwEJ6Wq5vRKKZRlxHOV9r1ObyzEWHlAQ>
 <xmx:Gj93X-Ooy_3kJBCTihquVGuJylBgtYrt_-Rp7bWZGBDQYmdWq5nufw>
 <xmx:Gz93X7pi1lTX81VuFdF05MVnYJynB8RtQf_jM7WgM3N7wPIagCAt2Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 89AFB328005A;
 Fri,  2 Oct 2020 10:54:18 -0400 (EDT)
Date: Fri, 2 Oct 2020 16:54:16 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomic: Make the kerneldoc a bit clearer
Message-ID: <20201002145416.wd5xsn6nzzkzweua@gilmour.lan>
References: <20201002075620.4157591-1-daniel.vetter@ffwll.ch>
 <20201002123112.uupaal7jed7xkmrf@gilmour.lan>
 <CAKMK7uHZcY=T-eMHxDYsWgSBGGAcweUttX1B7_mEXVHgS0Qhnw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHZcY=T-eMHxDYsWgSBGGAcweUttX1B7_mEXVHgS0Qhnw@mail.gmail.com>
X-Mailman-Approved-At: Sat, 03 Oct 2020 09:23:39 +0000
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0127574987=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0127574987==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="efm3644hepwoimcj"
Content-Disposition: inline


--efm3644hepwoimcj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 02:37:25PM +0200, Daniel Vetter wrote:
> On Fri, Oct 2, 2020 at 2:31 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Fri, Oct 02, 2020 at 09:56:20AM +0200, Daniel Vetter wrote:
> > > Crank up the warning a notch and point at the right set of locking
> > > functions for atomic drivers.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > ---
> > >  drivers/gpu/drm/drm_atomic.c | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomi=
c.c
> > > index aac9122f1da2..b2d20eb6c807 100644
> > > --- a/drivers/gpu/drm/drm_atomic.c
> > > +++ b/drivers/gpu/drm/drm_atomic.c
> > > @@ -1642,11 +1642,11 @@ static void __drm_state_dump(struct drm_devic=
e *dev, struct drm_printer *p,
> > >   * to dmesg in case of error irq's.  (Hint, you probably want to
> > >   * ratelimit this!)
> > >   *
> > > - * The caller must drm_modeset_lock_all(), or if this is called
> > > - * from error irq handler, it should not be enabled by default.
> > > - * (Ie. if you are debugging errors you might not care that this
> > > - * is racey.  But calling this without all modeset locks held is
> > > - * not inherently safe.)
> > > + * The caller must wrap this drm_modeset_lock_all_ctx() and
> > > + * drm_modeset_drop_locks(). If this is called from error irq handle=
r, it should
> > > + * not be enabled by default - if you are debugging errors you might
> > > + * not care that this is racey, but calling this without all modeset=
 locks held
> > > + * is inherently unsafe.
> > >   */
> > >  void drm_state_dump(struct drm_device *dev, struct drm_printer *p)
> > >  {
> >
> > For the comment itself:
> > Acked-by: Maxime Ripard <mripard@kernel.org>
>=20
> Thanks for taking a look, will merge.
>=20
> > But maybe we should add some lockdep assertion to make sure we can catch
> > someone actually doing this?
>=20
> I think it has some use for ad-hoc debugging in random places, or
> maybe as a an opt-in "tains your kernel" debug option. And then you
> really don't want your useful debug output burried in a few pages of
> lockdep splat first :-)

Yeah, but at the same time reducing the discoverability of this locking
expectation for the common case to favor some one-off debugging by
someone that has more chance to know better seems like not the best
trade-off.

Or maybe make the assertion conditional on drm.debug not being set or
something?

Maxime

--efm3644hepwoimcj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3c/GAAKCRDj7w1vZxhR
xTkVAP4qwkryG1+ohc5hHxluTE5zu4NFHfl56b2rVEmR+W7OQgEApQud/UCqiAva
nIjNFu2EtN80AdLhW8N4v7p0ju1H0gU=
=lvVr
-----END PGP SIGNATURE-----

--efm3644hepwoimcj--

--===============0127574987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0127574987==--
