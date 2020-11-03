Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4372A5F7D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F4D6F3C0;
	Wed,  4 Nov 2020 08:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FD36E85F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 11:25:27 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 09888B17;
 Tue,  3 Nov 2020 06:25:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 03 Nov 2020 06:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=9K7ZUeG7Ei19ZU1lw4LTHV9xBo3
 MS7gvaamZszlYvNM=; b=ZStu7JyNauLjo9d/Oy5VlNq2SAK77bUhJ7UpsF8Yly4
 HfN8Wwk+J2pmmYe4cAQw7Cz/tiSvDWsDfbh0dk7cg7WTZeKBWsvYAX4p6XcUAtgr
 Z+Jt52dmaF1dQt2nHEkrGdjfcOwPKU4+/e2Q4NrXhS8Qi5EUI7udpDm3kIo1y/DP
 HBnUaadCvgzu4RgcH3lcqMV9euCTvZ9ZA3KwpWKVpEwTsjyut0l3tmODlqJqtaE9
 FZ6VjOBWsOFI1OjmY6iAYRZYOEaSRsfJAgl4bopm0tuJeTqZvjqmnICdQ+/ytoiX
 4LtSAIax8SVhgeRiwmkzEMG1dCsgSAnCjN2wNQhxtkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9K7ZUe
 G7Ei19ZU1lw4LTHV9xBo3MS7gvaamZszlYvNM=; b=qMTZjzWjOEHjSDRK8zNZOr
 rPZ5yXql14hB9cohmRodzmeUTT0xlaWlrO4HMZraKjm42W2mE0iXfsEV2vhz/8L/
 hS2mI2U68SAVLMMRwE/X99gVAiKO0RUxfH+ds5fZ6r9D5XOdWDW2hElSXlcMvaIO
 eLxVdq7vGeZzyV+fddLX7V2QKjfHpCFntkBv2u4FAbuqhxvC2t3StzfYNTMpUmS1
 f+Ms4y2kAdRTSsLhgZUrUTc7iHOYdKBew+UWIBD040FKW2Yyk+tm5jfl2AmjAeLI
 EeHNKklWMNtr3jt0CeRWgOu3ydNSve/MpQXnW7bID5Bf3cX1wJ/pM/lnA3D+D4IQ
 ==
X-ME-Sender: <xms:JT6hX_EG6gCQGNhdE85reDGadtEBndkMDRC90II7iO6HzD8uIucbDQ>
 <xme:JT6hX8WWA1JJlVYtRJ3TEhJo2_vIqg3-OHas67F-Mvn6Jrc1-8mgLIh1FQAE69APE
 ky_xfJGGnV0eZXrGR8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtfedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JT6hXxKI-O8-tm0204s9Vus9ma0NXGP4JS_ExJowCoc1JQblHIL70g>
 <xmx:JT6hX9GHjcg3d1ULD3Ll7t35vt-c3I9W-5iO9-Ca4iJUE1twtXSdKg>
 <xmx:JT6hX1VeODsZXLg2PaYEE6Na3E8G5qkR0fv3lxfMZvvSWzOVxm2wCg>
 <xmx:Jj6hX4R3rKY71yb72QHHlmVChY0NE562J3yTuQbqkDQCcK_Wx9_Ubg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E0DCC3280064;
 Tue,  3 Nov 2020 06:25:24 -0500 (EST)
Date: Tue, 3 Nov 2020 12:25:22 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: Add the new api to install irq
Message-ID: <20201103112522.oescqpkrzbwohhnq@gilmour.lan>
References: <1604369441-65254-1-git-send-email-tiantao6@hisilicon.com>
 <20201103095205.ywabphbc2xbop6ae@gilmour.lan>
 <f89640fb-6994-76dc-7862-a3b26b67dc24@suse.de>
 <20201103103832.gwjqf4urrn5y7zk5@gilmour.lan>
 <20201103105508.GD401619@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20201103105508.GD401619@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============2007902277=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2007902277==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w6qgqecl3tuig3lx"
Content-Disposition: inline


--w6qgqecl3tuig3lx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Tue, Nov 03, 2020 at 11:55:08AM +0100, Daniel Vetter wrote:
> On Tue, Nov 03, 2020 at 11:38:32AM +0100, Maxime Ripard wrote:
> > On Tue, Nov 03, 2020 at 11:10:27AM +0100, Thomas Zimmermann wrote:
> > > Hi
> > >=20
> > > Am 03.11.20 um 10:52 schrieb Maxime Ripard:
> > > > On Tue, Nov 03, 2020 at 10:10:41AM +0800, Tian Tao wrote:
> > > >> Add new api devm_drm_irq_install() to register interrupts,
> > > >> no need to call drm_irq_uninstall() when the drm module is removed.
> > > >>
> > > >> v2:
> > > >> fixed the wrong parameter.
> > > >>
> > > >> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> > > >> ---
> > > >>  drivers/gpu/drm/drm_drv.c | 23 +++++++++++++++++++++++
> > > >>  include/drm/drm_drv.h     |  3 ++-
> > > >>  2 files changed, 25 insertions(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > >> index cd162d4..0fe5243 100644
> > > >> --- a/drivers/gpu/drm/drm_drv.c
> > > >> +++ b/drivers/gpu/drm/drm_drv.c
> > > >> @@ -39,6 +39,7 @@
> > > >>  #include <drm/drm_color_mgmt.h>
> > > >>  #include <drm/drm_drv.h>
> > > >>  #include <drm/drm_file.h>
> > > >> +#include <drm/drm_irq.h>
> > > >>  #include <drm/drm_managed.h>
> > > >>  #include <drm/drm_mode_object.h>
> > > >>  #include <drm/drm_print.h>
> > > >> @@ -678,6 +679,28 @@ static int devm_drm_dev_init(struct device *p=
arent,
> > > >>  	return ret;
> > > >>  }
> > > >> =20
> > > >> +static void devm_drm_dev_irq_uninstall(void *data)
> > > >> +{
> > > >> +	drm_irq_uninstall(data);
> > > >> +}
> > > >> +
> > > >> +int devm_drm_irq_install(struct device *parent,
> > > >> +			 struct drm_device *dev, int irq)
> > > >> +{
> > > >> +	int ret;
> > > >> +
> > > >> +	ret =3D drm_irq_install(dev, irq);
> > > >> +	if (ret)
> > > >> +		return ret;
> > > >> +
> > > >> +	ret =3D devm_add_action(parent, devm_drm_dev_irq_uninstall, dev);
> > > >> +	if (ret)
> > > >> +		devm_drm_dev_irq_uninstall(dev);
> > > >> +
> > > >> +	return ret;
> > > >> +}
> > > >> +EXPORT_SYMBOL(devm_drm_irq_install);
> > > >> +
> > > >=20
> > > > Shouldn't we tie the IRQ to the drm device (so with drmm_add_action)
> > > > instead of tying it to the underlying device?
> > >=20
> > > If the HW device goes away, there won't be any more interrupts. So it=
's
> > > similar to devm_ functions for I/O memory. Why would you use the drmm_
> > > interface?
> >=20
> > drm_irq_install/uninstall do more that just calling request_irq and
> > free_irq though, they will also run (among other things) the irq-related
> > hooks in the drm driver (irq_preinstall, irq_postinstall irq_uninstall)
> > and wake anything waiting for a vblank to occur, so we need the DRM
> > device and driver to still be around when we run drm_irq_uninstall.
> > That's why (I assume) you have to pass the drm_device as an argument and
> > not simply the device.
>=20
> drm_device is guaranteed to outlive devm_, plus the hooks are meant to
> shut down hw. hw isn't around anymore when we do drmm_ cleanup, at least
> not in full generality.

drm_dev_put is either called through devm or in remove / unbind, and the
drm_device takes a reference on its parent device, so how can the
drm_device outlive its parent device?

> > This probably works in most case since you would allocate the drm_device
> > with devm_drm_dev_alloc, and then run drm_irq_install, so in the undoing
> > phase you would have first drm_irq_uninstall to run, and everything is
> > fine.
> >=20
> > However, if one doesn't use devm_drm_dev_alloc but would use
> > devm_drm_irq_install, you would have first remove being called that
> > would free the drm device, and then drm_irq_uninstall which will use a
> > free'd pointer.
>=20
> Don't do that, it's broken :-)

Well, yeah it's usually a pretty bad situation, but if we can fix it for
free it doesn't hurt?

Maxime

--w6qgqecl3tuig3lx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6E+IgAKCRDj7w1vZxhR
xek5AP0SMGil1aZhgogOLSvo2WtgLW3tKgKD4MVdLNpykAcXswEAmr8AwkzvO7Sk
hbQN0dAM7pUC2KnH4glLBzIZsHccxAk=
=NZuN
-----END PGP SIGNATURE-----

--w6qgqecl3tuig3lx--

--===============2007902277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2007902277==--
