Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B156CEECB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 18:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3911C10EB81;
	Wed, 29 Mar 2023 16:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AD510EB81
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 16:08:19 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id D4EE8581FA9;
 Wed, 29 Mar 2023 12:08:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 29 Mar 2023 12:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680106098; x=1680113298; bh=MY
 XYHXP9TA6RiIrd7ebeit6HRgTdNhlockaHZW3ryv4=; b=ercciHkF5NtsqnR3G9
 2kbtpTFdZP2CT+pcXjXMhpd4PlmXkhcooAR2s7NxrWuYoFP67mCyJEPbtq402sXs
 gxsH13YLzW6ltHcKYW2tpJNEy29LgUOEovFwT9EONOLF+ERt1N8osO6McMdkQ95Y
 bdoDJMxZUON5NEH7xPxY2YeAxjYv0UNqWKFef0h6LD6c1KAltSESaWNyCKlkHOnM
 FsTCb8RpJ9Kvr3/yJnBA+sYB5KoHYh30TolGycHbQhYhEimBMMvTLDeePDKCS9U4
 KeMS6spq/lbjTIBIlNBdFKqxVHBCvoNRlHKDQeQPVpLojkevzgtvPzxllmWPSkaR
 /pmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680106098; x=1680113298; bh=MYXYHXP9TA6Ri
 Ird7ebeit6HRgTdNhlockaHZW3ryv4=; b=CH2r4RgmXy/7IqLWVhWn8y+T/fcNk
 KkjYeUa3p4K4zQHAuy0gkIWkKzHgsXINbPT4Te4D6ZVupzfifr6WuQWEcA67POJv
 ePtGv39f38YhzPkbqq+MQeDQOE4dei56PB6zZYXjnIbgku6IPj4uyJ+ohN9r4J3Z
 MGHCSYd7AedbgStvEN7RIiRgZCMeICB2nxDEnEvbDljZMOKqWlZnEH7G1hj7SW96
 ep0heiIR9Z5x7CGFEfwHsKl0Zb5SLwU093tDswxxyESBICTTS57qKEQfY5VdEdly
 i7s1PqNFZDqd88p+hfi7DoGU6nHfFVBOZKa1fRMarbj1UOai8fNZm/j0w==
X-ME-Sender: <xms:cWIkZCnOqg-V5t6cGpjxVv4YQ9zQ1N1s0ZKB-139llQIst1YdZxNWQ>
 <xme:cWIkZJ25tATN0XbC40zE3lKv5QTv4dXvRhLhYTHHOwpcHukQS2JpAcdAs1N43AFhG
 rCHhGCrP3I-LEk_gb0>
X-ME-Received: <xmr:cWIkZApu0pkCHd6AZGmTpL6DkOYjuvWFvgMN_LqOWb5bVSSUxKkdkXMD95I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehiedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejgeeiveevvdfgffeftdevuefhheduveejieefgeejveeuhfetkeelgfev
 teefffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cWIkZGlCke9B4cf7FQKPMCl60nfubRxrKyo1OrtpUyUYPn8_wXFAMw>
 <xmx:cWIkZA1hkwVROaGngT17G_sJe7Xu4_sNCKgdDzTk57HCRsMyyNINSA>
 <xmx:cWIkZNuc1AdeH4WbyOVvFa9zjiUit5guTNA-pkNaf1f7434PUZWNHA>
 <xmx:cmIkZB5-lwBqiKCIzIg8zX3LbF7CB2Ne2yn2V9tRuxp0LzisWO2bVA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Mar 2023 12:08:17 -0400 (EDT)
Date: Wed, 29 Mar 2023 18:08:15 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v7 02/12] drm: bridge: panel: Implement
 drmm_of_dsi_get_bridge helper
Message-ID: <20230329160815.ql6ctqoxae7n65b7@penduick>
References: <20230329131615.1328366-1-jagan@amarulasolutions.com>
 <20230329131615.1328366-3-jagan@amarulasolutions.com>
 <20230329150337.ua6qz7rvupk6vizl@penduick>
 <CAMty3ZAEb+ws_9jbdSM1ngfk=N7tePw_pEcALDAMNwzoNvbW3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4c4xrdmgsh5fx3jk"
Content-Disposition: inline
In-Reply-To: <CAMty3ZAEb+ws_9jbdSM1ngfk=N7tePw_pEcALDAMNwzoNvbW3g@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4c4xrdmgsh5fx3jk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 08:56:29PM +0530, Jagan Teki wrote:
> On Wed, Mar 29, 2023 at 8:33=E2=80=AFPM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> >
> > On Wed, Mar 29, 2023 at 06:46:08PM +0530, Jagan Teki wrote:
> > > Implement a DRM-managed action helper that returns the next DSI bridge
> > > in the chain.
> > >
> > > Unlike general bridge return helper drmm_of_get_bridge, this helper
> > > uses the dsi specific panel_or_bridge helper to find the next DSI
> > > device in the pipeline.
> > >
> > > Helper lookup a given downstream DSI device that has been added via
> > > child or OF-graph port or ports node.
> > >
> > > Upstream DSI looks for downstream devices using drm pointer, port and
> > > endpoint number. Downstream devices added via child node don't affect
> > > the port and endpoint number arguments.
> > >
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >
> > If you intend to use it with the sun4i driver, then don't. The sun4i
> > driver is barely using drm-managed resources, so chances are all its
> > resources will be freed by the time this action will run.
>=20
> Any idea how to check all resources will be freed before this
> DRM-managed action helper runs? I did test the panel insertion and
> removal at runtime and I can see that the action helper
> (drmm_drm_panel_bridge_release) is triggered at removal time.
>=20
> Here is the log for it.
> # insmod panel-bananapi-s070wv20-icn6211.ko
> [   11.411894] sun4i-drm display-engine: bound
> 1e00000.display-frontend (ops 0xc0951eb4)
> [   11.420253] sun4i-drm display-engine: bound 1e60000.display-backend
> (ops 0xc0951620)
> [   11.428128] sun4i-drm display-engine: bound 1e70000.drc (ops 0xc095115=
0)
> [   11.435574] sun4i-drm display-engine: No panel or bridge found...
> RGB output disabled
> [   11.443484] sun4i-drm display-engine: bound 1c0c000.lcd-controller
> (ops 0xc094fdb0)
> [   11.451264] sun4i-drm display-engine: bound 1ca0000.dsi (ops 0xc0952f0=
4)
> [   11.462479] [drm] Initialized sun4i-drm 1.0.0 20150629 for
> display-engine on minor 1
> [   11.963246] Console: switching to colour frame buffer device 100x30
> [   12.046329] sun4i-drm display-engine: [drm] fb0: sun4i-drmdrmfb
> frame buffer device
> [   12.082641] sun6i-mipi-dsi 1ca0000.dsi: Attached device s070wv20-ct16-=
icn62
> # rmmod panel-bananapi-s070wv20-icn6211.ko
> [   16.306388] Console: switching to colour dummy device 80x30
> [   16.466963] drmm_drm_panel_bridge_release: In

Enable KASAN, unload the DSI controller module or unbind its device,
and watch things go boom :)

Maxime

--4c4xrdmgsh5fx3jk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZCRibwAKCRDj7w1vZxhR
xUC0AP9QtTmenppZSOyUQNhOSmr4OauGpP3gr8K2Kuh7RleiRQEAkbq8MRKgyzwI
PKywDo9KTOF2N/FYWK0hSjkyjA5DFgw=
=bdW5
-----END PGP SIGNATURE-----

--4c4xrdmgsh5fx3jk--
