Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B31D40B276
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 17:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3683A6E4FF;
	Tue, 14 Sep 2021 15:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1DE6E4FF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 15:03:56 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 6D5542B01251;
 Tue, 14 Sep 2021 11:03:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 14 Sep 2021 11:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=rnQbpsTt6i5vx40awBDFenSY/gc
 rAOQUGKmQtJF7l2k=; b=O4FE7+5bP6FUgUr3ttXG1/yNC+52kCHOOkeWgRCCdK2
 GjPdCqN9ybUEbBNX0HCZi9aJMi3a9BIhnVb10bEV3yS4S8AaQHpEl6M2LSlXFi4N
 h4NMbcvfojPV2Ml3nF7nDoI+7JH5fpaGPqwgDhIeR/E10KRiDptQULY4vJWOsdUO
 wkPLIIX3pxAjdnJtyZlh+G93HWCpriDy4XORMk0f99S+oGiSCV6QvKx4jLkOLOLG
 Tp5kFSYJUZIUk63nJFL68tv6U0pMRoSl0xSjTbWO47zKQrg4nFCcdbZuaPLJlLnb
 N1aZXBblt/VVXCDGcn1U2PBuzfxgrMm+hv2bjmXmoAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rnQbps
 Tt6i5vx40awBDFenSY/gcrAOQUGKmQtJF7l2k=; b=Jp9VAmcbFMPJC7M8rcw/DV
 Nn32peqoZCOCZFFEG7u+A9SYdfVBCx0SrYdfSXPveiN0I3BqskXcdOqLuzAwGk3z
 0A0l7MZ+k93o5InxIU3v5LV7GKNkRnevheOqU12TQ2v5NgjOffwB6XDqckvYwOWY
 hvqEr9KxePcH+nWc48JVB2oJtduDpHjEfTRMevotvilwvFjhHVWirEVjedteEqto
 AvKj1ge+dVhwjlVZSaefNCRF6uEUvpNRCUH0H8yV9AHOBLyPIsUc4i8Ri6Kuqj8b
 3z/1dragLz7Hkbr2nuWVWreuygUSynRhMEZPr2AFRAshf60LSHCjF9R0tUJBP5Kg
 ==
X-ME-Sender: <xms:2LlAYWmpAYp6UgQ-r5Iw_RnXIj5Op0i-wrSDulg43Ag8zrYx5cT9wg>
 <xme:2LlAYd2Tq8PIWY5mEveI33erdMSHbNcqD6XCKn8Jgu4hcNi7bV0lY1NrhUDMkBstb
 i8njOniClOtzsTGmGU>
X-ME-Received: <xmr:2LlAYUrbAmT29J6OvroghLIkWER-MnfAh0yBUlGadt6CCWP2OWWYpG6TZT9uP7QyeT-WHhvPN4bap9zv9NnkqH_QRmgXCH_XTTAh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2LlAYalGV7_9NkfOhphADmMfhpwK3dbM37VUDKevDxkw5e6gr4WaRA>
 <xmx:2LlAYU2wtM92Mdhnppp9fb-6ASykp4ipoElbpeRsRTbOQllhc7_GIw>
 <xmx:2LlAYRvbNpSO0B-XIpX1YeXHvdw2bjteI0AsTRkWn5bobV-IlqI_OA>
 <xmx:27lAYf0nuHUHrGfLXcFvrS1OjUMFY57q4F5bsTzlUzdSgVopHoWxIk06r5Y>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 11:03:52 -0400 (EDT)
Date: Tue, 14 Sep 2021 17:03:50 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, linux-rpi-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Sam Ravnborg <sam@ravnborg.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/vc4: hdmi: Actually check for the connector
 status in hotplug
Message-ID: <20210914150350.b6357jq2azalme4w@gilmour>
References: <20210914101724.266570-1-maxime@cerno.tech>
 <20210914101724.266570-3-maxime@cerno.tech>
 <YUCy4AmYDFD2jtG6@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="omqsbnjfiweckfg7"
Content-Disposition: inline
In-Reply-To: <YUCy4AmYDFD2jtG6@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--omqsbnjfiweckfg7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, Sep 14, 2021 at 04:34:08PM +0200, Daniel Vetter wrote:
> On Tue, Sep 14, 2021 at 12:17:24PM +0200, Maxime Ripard wrote:
> > The drm_helper_hpd_irq_event() documentation states that this function
> > is "useful for drivers which can't or don't track hotplug interrupts for
> > each connector." and that "Drivers which support hotplug interrupts for
> > each connector individually and which have a more fine-grained detect
> > logic should bypass this code and directly call
> > drm_kms_helper_hotplug_event()". This is thus what we ended-up doing.
> >=20
> > However, what this actually means, and is further explained in the
> > drm_kms_helper_hotplug_event() documentation, is that
> > drm_kms_helper_hotplug_event() should be called by drivers that can
> > track the connection status change, and if it has changed we should call
> > that function.
> >=20
> > This underlying expectation we failed to provide is that the caller of
> > drm_kms_helper_hotplug_event() should call drm_helper_probe_detect() to
> > probe the new status of the connector.
> >=20
> > Since we didn't do it, it meant that even though we were sending the
> > notification to user-space and the DRM clients that something changed we
> > never probed or updated our internal connector status ourselves.
> >=20
> > This went mostly unnoticed since the detect callback usually doesn't
> > have any side-effect. Also, if we were using the DRM fbdev emulation
> > (which is a DRM client), or any user-space application that can deal
> > with hotplug events, chances are they would react to the hotplug event
> > by probing the connector status eventually.
> >=20
> > However, now that we have to enable the scrambler in detect() if it was
> > enabled it has a side effect, and an application such as Kodi or
> > modetest doesn't deal with hotplug events. This resulted with a black
> > screen when Kodi or modetest was running when a screen was disconnected
> > and then reconnected, or switched off and on.
>=20
> Uh, why are you running this scrambler restore in your probe function? I
> guess it works, but most drivers that do expensive hotplug restore to
> handle the "no black screen for replug" use-case handle that in their own
> dedicated code.

That's what I got from our discussion back in June (I think?). The
discussion was about an issue we were having back then where one would
disconnect / reconnect the display while it had been setup through SCDC
to use the scrambler and higher bit ratio.

During that power cycle (that also happens when you turn a TV off and
on), the display would obviously reset its SCDC status. But if there's
nothing to handle the uevent, then the same mode remains applied
resulting in a blank screen.

If we're not supposed to set the SCDC status again in detect(), how
would we deal with this?

> But those also tend to have per-output hpd interrupt sources, so maybe
> that's why?

We do have an per-output HPD interrupt here

Maximey

--omqsbnjfiweckfg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUC51gAKCRDj7w1vZxhR
xcwiAPwOelbHH/acgSu/HJHnxZj2wwWMcLHTWegRB50IMyBHDwD/ZfXzZGwXujvG
F98415jDZnBjFchPKB9vJkeHXlCeegk=
=LDfj
-----END PGP SIGNATURE-----

--omqsbnjfiweckfg7--
