Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679DB4C42C8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 11:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC6B10E8D5;
	Fri, 25 Feb 2022 10:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8946110E8D5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 10:51:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id DC8C15C0167;
 Fri, 25 Feb 2022 05:51:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 25 Feb 2022 05:51:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=gCe6+x/0GMfgXsnTTlqHsgKg8ZoGeRigM3nY+W
 aZlNU=; b=rl/b6hRE+785Zu0ugqptJ5tci4hOu5HlKBaAb4CywBHs5N4qRIwo/7
 8pOO+xQcxF7xjtsAPsOLmjilLXNuUS8Ihz8Tf4ZUpNC5ChUYRkTPVzEYoGd2zv7k
 Ni7YbAp6sf6nK3EH5WMzq+1D0D/L1mWm/C2bABAEbmp1XmMgqiUWCiMJ6SCvjsr8
 GirdwMyxJzwt/ZuTbipPidBPVujhVxFbIPBG3koUNNEQDvatZo0uNbByezXEyIw4
 R1R2GWpt8f47BlTnOBVtWBs/0FFJrkqXa6GBrQlamzl9kyNAJ+g+s0G7I1J3IL9z
 qsYVLBC07X6SYDcdcUdtUrKUVYvlopKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gCe6+x/0GMfgXsnTT
 lqHsgKg8ZoGeRigM3nY+WaZlNU=; b=SQ6CmEq4pG6+T/TiVIk0/Sbw65ACXQov2
 AqEEqPF46K47vuCJkTtrReLb4v155qfmwhBWkc9WJpgWcYM5fXLmRLlMq0+wMfl1
 eCTH7sdvfFdDosAmCyBGez+k34uJRSzkFq1UyPxDoMQmzgbUwtRh9h1D8cJiIsad
 pNIvYuvJwq/nqkRzfK4aJtp//zcBUtOt5ecaC7swuO58j7kIL+PUHf8fGAKGO79v
 K68om6lxJirrH+iW2NNz/yZU7RfgHGRH1UBUfgGH3cOM+Pqg//vWtQ2u6ALQSA65
 UU+CkWCEDE7DaV+tFtCCF1EaS9jrioQMGoxct1q2iaVQQ+MzYwgUg==
X-ME-Sender: <xms:wrQYYmQ1yEx6ACzeV5E3_zW2dG_QjaUy2-S-vjJfv_ptEI1ugcDaDw>
 <xme:wrQYYryvXMk19Q6HWl7PB3nDth1ADLevjAtw7aWUJZ-Sq2lGy382xHe8umgDLGpTU
 D8bgAy2dfli3J7NJ40>
X-ME-Received: <xmr:wrQYYj0TCgPjH4jO7KTHDoJgUo27XyBu5pVqKDuT58sIhchh5k-NsulceAPn0xAEKzYzhlIxB4GsJcef4ckOuEZ1OWXKdZZpsd3XZuM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wrQYYiBrsj_hfGjRQFKnydL83ORu548-UgztOAbBv6rxAcx0KQB4_w>
 <xmx:wrQYYvgg-iintTXcOYHk46xxol_-89KEDYcz3PoPpuZla_7_zhu4mA>
 <xmx:wrQYYup1pSFMNREZVgUVkD8I2oAY2ZwN-PjBcPJcKfxV21Wl-rbZUw>
 <xmx:wrQYYsvuCmGDN9rkE0qD6Ug6UYLvxs3l-UgNNT_NeYceMitCK4Gatw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 05:51:45 -0500 (EST)
Date: Fri, 25 Feb 2022 11:51:43 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 3/7] drm/bridge: Extend struct drm_bus_cfg with clock field
Message-ID: <20220225105143.dw2locod2xgnmlke@houat>
References: <20220219002844.362157-1-marex@denx.de>
 <20220219002844.362157-4-marex@denx.de>
 <20220224151902.4qdgdxdufvmhwezm@houat>
 <0cc9da51-d94d-82be-69ef-80f8dc0544fd@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="omjpptizmjuofo6y"
Content-Disposition: inline
In-Reply-To: <0cc9da51-d94d-82be-69ef-80f8dc0544fd@denx.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--omjpptizmjuofo6y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 09:07:19PM +0100, Marek Vasut wrote:
> On 2/24/22 16:19, Maxime Ripard wrote:
> > On Sat, Feb 19, 2022 at 01:28:40AM +0100, Marek Vasut wrote:
> > > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > > index 1701c2128a5cb..32455cf28f0bc 100644
> > > --- a/include/drm/drm_atomic.h
> > > +++ b/include/drm/drm_atomic.h
> > > @@ -1077,6 +1077,11 @@ struct drm_bus_cfg {
> > >   	 * @flags: DRM_BUS_* flags used on this bus
> > >   	 */
> > >   	u32 flags;
> > > +
> > > +	/**
> > > +	 * @clock: Clock frequency in kHz used on this bus
> > > +	 */
> > > +	u32 clock;
> > >   };
> >=20
> > This is fairly vague. You were mentioning DSI: is it the pixel clock?
>=20
> DSI HS clock is the one I need.
>=20
> I hope we can flesh out what exactly should be in here.
>=20
> > The HS clock rate?
>=20
> Yes
>=20
> > With or without counting the lanes? What about the
>=20
> Without
>=20
> > burst mode: would it be the lane or pixel rate?
>=20
> Still the HS clock rate.
>=20
> > It would be just as confusing for HDMI: is it the the TMDS character
> > rate? The TMDS bit rate ? TMDS Clock rate?
>=20
> For HDMI I would expect 148.5 MHz here , and if HDMI needs additional
> extras, they might have to be added to struct drm_bus_cfg as extra fields=
 ?

The thing is: you're patching some core code here. Whatever you come up
with needs to be properly defined, documented, and should apply to all
the display interfaces we support. It cannot be an after-thought.

Even for DSI, I don't think that the HS clock is something that is
desirable: how does it interacts with virtual channels? burst mode or
not?

The pixel clock is a better choice I think for this, since this is
abstract enough to apply to all the interfaces, and the devices can
easily compute whatever they want to based on the pixel clock as well.

If you *really* need the HS clock itself, then the struct
mipi_dsi_device feels like a better abstraction. Which raises the
question: why can't you use hs_rate?

Maxime

--omjpptizmjuofo6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhi0vwAKCRDj7w1vZxhR
xVU1AQDxC/CKrIaVm2MVzrHGpWPYbGiEsRexkmiH5PCLapt6ggEA0jzmSAMrt6Su
lJ8qvnl2s97y7K9mu2QcA0pv4Dlw1QM=
=C3oe
-----END PGP SIGNATURE-----

--omjpptizmjuofo6y--
