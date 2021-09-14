Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A5F40B281
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 17:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1C06E4EC;
	Tue, 14 Sep 2021 15:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AC46E4EC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 15:06:46 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id B54472B0125B;
 Tue, 14 Sep 2021 11:06:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 14 Sep 2021 11:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=86VIvVWA0lpTbdksYCftwNrqcOF
 h/mOj0+p0+34vYa0=; b=GBWYZ2MrlxZs/yCyBjJFDWobiKhCA1JpRuX4IzzO7R0
 g6KXAfxkZ8+5BVhPMZtYxQ3E+D5aJHsU1t2/g9/gNh+V+UrWnK1veCe7VzmXfuoC
 wMxQlPc1Dnqz9QBzp7GnIpXSD44G2qfUMMKj68wiwOb4GArjRI/8x/MxHjp4awXQ
 Hdlx4+k9afysKw6qjsaTowisXWKNrtrqf9lBRqSHjaOwV49dj34TgWg2E2ammK1C
 k/TKR4HiB7/UY7ObaGfA8clDDgnLYU5nohZnlotJCeyhSr1dld+SmIb0eL17kFHd
 /rphFtPd7RrIxMCfSGT6F6eY3VY7syLNXiMFCkZ0KIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=86VIvV
 WA0lpTbdksYCftwNrqcOFh/mOj0+p0+34vYa0=; b=uBY8Wu+PwwK/jvUId+NYNQ
 0ra5aFFTIuB8iwMn7zQKI3lH9F1uDUDUfh8MwgG3CwhlFijJ6fSOTDcHOetrzNwa
 eM/hGryovBF1dweQS0ahdvQTbMiTAQNfkT7G2ETtOR2g2q4MyHGp5dfMUSgLsJNq
 2aafV9764pougbDJBDMsEkvN0s89heqPFZkijvgt+VuJ6lfbnkhvZLjvjiisFx//
 HXfG7znHxTXcjwM8q+ZIHDHbUS6MOjVJOxQncHQg3hI/5aaBaXxIt/7N85uQcBO7
 BC9aDIZ4pw9bSlp9f8V6lBwtbH/gkU4yoaP/l2+PVgiVUFMg3us75UVthIEKIpng
 ==
X-ME-Sender: <xms:grpAYTY6mFwp0TaPkR99QS2WD4quaLE1pDnbiCqV7LqAS4vsa7-2oA>
 <xme:grpAYSZp2_YRHNft-NxGSgBFZJ5zMF6gkopEivB3tiJcrm9CLwQPHfk0pOZMxT527
 n6ewO5qC0aaZcBmkQY>
X-ME-Received: <xmr:grpAYV9BTBZFnG_h52EyUY-tSzGzeUTN77Wh2LAuaamHQvu9mjtsmCUH4H-P_kzVhHzWsH2qPgZNpGJHhRnNokdctnKVazNEbAQZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:grpAYZqbqusuLlwsjH6rp5W4_FsR5r79A8nWAlh9qCsOkDCgdr6bHQ>
 <xmx:grpAYepgrNk1xeO5LE0Ip2ATARaouOQKGQ-Wu_ORMChjt-PvpPVtBA>
 <xmx:grpAYfQbFlIYjggKlP1cewJi_tJLaAnGnduUnnhLs7GtE-pwv8FTUQ>
 <xmx:hLpAYT79UIPtUb-CPqNHk7eR5Rp51hSgi1OfT3RTXZtvhby14LEqlN3lb3g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 11:06:42 -0400 (EDT)
Date: Tue, 14 Sep 2021 17:06:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, linux-rpi-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/probe-helper: Create a HPD IRQ event helper
 for a single connector
Message-ID: <20210914150641.dzyioa3wkoyv2o7k@gilmour>
References: <20210914101724.266570-1-maxime@cerno.tech>
 <20210914101724.266570-2-maxime@cerno.tech>
 <YUB8c2If+E851x4A@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h7ls47b3z6ubt5au"
Content-Disposition: inline
In-Reply-To: <YUB8c2If+E851x4A@ravnborg.org>
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


--h7ls47b3z6ubt5au
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Tue, Sep 14, 2021 at 12:41:55PM +0200, Sam Ravnborg wrote:
> On Tue, Sep 14, 2021 at 12:17:23PM +0200, Maxime Ripard wrote:
> > The drm_helper_hpd_irq_event() function is iterating over all the
> > connectors when an hotplug event is detected.
> >=20
> > During that iteration, it will call each connector detect function and
> > figure out if its status changed.
> >=20
> > Finally, if any connector changed, it will notify the user-space and the
> > clients that something changed on the DRM device.
> >=20
> > This is supposed to be used for drivers that don't have a hotplug
> > interrupt for individual connectors. However, drivers that can use an
> > interrupt for a single connector are left in the dust and can either
> > reimplement the logic used during the iteration for each connector or
> > use that helper and iterate over all connectors all the time.
> >=20
> > Since both are suboptimal, let's create a helper that will only perform
> > the status detection on a single connector.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
> > ---
> > Changes from v2:
> >   - Skip connectors with DRM_CONNECTOR_POLL_HPD in drm_helper_hpd_irq_e=
vent
> >   - Add drm_connector_helper_hpd_irq_event returned value documentation
> >   - Improve logging
> >=20
> > Changes from v1:
> >   - Rename the shared function
> >   - Move the hotplug event notification out of the shared function
> >   - Added missing locks
> >   - Improve the documentation
> >   - Switched to drm_dbg_kms
> > ---
> >  drivers/gpu/drm/drm_probe_helper.c | 117 +++++++++++++++++++++--------
> >  include/drm/drm_probe_helper.h     |   1 +
> >  2 files changed, 87 insertions(+), 31 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_p=
robe_helper.c
> > index 5b77fb5c1a32..a1ffc0c30b3a 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -795,6 +795,87 @@ void drm_kms_helper_poll_fini(struct drm_device *d=
ev)
> >  }
> >  EXPORT_SYMBOL(drm_kms_helper_poll_fini);
> > =20
> > +static bool check_connector_changed(struct drm_connector *connector)
> > +{
> > +	struct drm_device *dev =3D connector->dev;
> > +	enum drm_connector_status old_status;
> > +	u64 old_epoch_counter;
> > +	bool changed =3D false;
> > +
> > +	/* Only handle HPD capable connectors. */
> > +	drm_WARN_ON(dev, !(connector->polled & DRM_CONNECTOR_POLL_HPD));
>
> This will WARN if DRM_CONNECTOR_POLL_HPD is not set - which the previous
> code did not. I am not sure this is intentional.
> Or have I missed something?

Sorry, I misunderstood your previous comment and thought you wanted to
skip the !HPD connectors in the drm_helper_hpd_irq_event loop.

What do you think would be the proper scenario here? Just return false?

Maxime

--h7ls47b3z6ubt5au
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUC6gQAKCRDj7w1vZxhR
xfvLAQCvjHZIOLIX10NwRDDeWNnz+BQt6EGDstR3f6aiQVq/zwD7Ba+EN1wlpHpD
MiKDu9/bU4ZSc+apGZo9YgFu6QLNCQ4=
=1ekQ
-----END PGP SIGNATURE-----

--h7ls47b3z6ubt5au--
