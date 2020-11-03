Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A5E2A5F7C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23AA6F3C2;
	Wed,  4 Nov 2020 08:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5E56E86B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:38:39 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id CD78FB58;
 Tue,  3 Nov 2020 05:38:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 03 Nov 2020 05:38:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=MX0g5U1cLJF88fJdoeBP1gFRJoo
 WD/MUJDmMlQmqW5U=; b=J5GCTTi8WvYIEA706yNjNF4nrkuOrRV+jrSTG0Fy5ik
 AOHfX3wvvRDXKpbElyk7cYysGU455VWMDQhXbn+20s+tK6H3vJR1wrh+9Hgq6XbA
 K5YXuaWK34yxh9vDULhkptZwkKtC5dbWZRXMPXJ0hRdi6YA1eaev3zNzI8/mOpvT
 LZ/UMvgx3K0Q5yJq6wV+Pf9ANtkgqAjzu6v4v8nqU90dM7Y80GoXFb9KV/y9E+6S
 w9OfMsjSsmc7p/m6Hlow1JYZSofOjK+bkB9CRAIQZux3Wor52+U305PVo2/C/2rN
 0ao5Un0dgxhTjGBGLz5KCEZQStInnQfWtVV0z0S51aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MX0g5U
 1cLJF88fJdoeBP1gFRJooWD/MUJDmMlQmqW5U=; b=cDny/sPlEVLhEnHkenX0io
 BRLscEMIsxcOGlmvpCJ8IY8ZRbPUN6EQz506awE5vTCwHHvusJBC48TYnTf0vhWm
 9MtDgT6eeME1MXyFsMI2Wmx4RSlpMvFhEk394Uuu26IIRmq1vsSx9f34AWi9O+kV
 m8UdoMef4LtaLGkUlTST6qykCqW2xtY3CDmIPDB1OXjXaWa4kMi6XCorqvfsfd6H
 HgwZZu3p5SJHFtazlQm5a7jgR1fM0H6WDJiDwdmTkXJwF0zG9H58uAuz1VuGI+EL
 UVtptkatTZ3GUvyXDmfQG4Kosw7N/gErUNG1QFGxfm/mEwPjRr3qNgKIt8v47ZSw
 ==
X-ME-Sender: <xms:KjOhX0vKyXsryc8W0g1abrX-DDmMkNatWtSCUXVDHGb4TPLxIY0cWw>
 <xme:KjOhXxegxM9EmmzdObNDhK-qSxCpOBcbniHrlC0tTKjKNvJ93EkaEzXK6tLWNTn1V
 a4k9Cx3kPQ2kTeJZXk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtfedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KjOhX_wrIZ1tV-ddEqp06VH5aDCbk8RwCSh3ET0vdh9ic6auMfNbQg>
 <xmx:KjOhX3OO1w1zMYxcehamRv7e138gCer8sT_7kRs23sJOPd3vXObXpQ>
 <xmx:KjOhX0-9Ctc0eY2tstaXvf622zQcggocyLDAzaGW9VbNCa8l5THdyg>
 <xmx:LDOhX4aaOJ51ffBzpmJH2MKUslIcHldHTGv7EDd7JWgfW7cGQENxrQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7B1BD328005A;
 Tue,  3 Nov 2020 05:38:34 -0500 (EST)
Date: Tue, 3 Nov 2020 11:38:32 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm: Add the new api to install irq
Message-ID: <20201103103832.gwjqf4urrn5y7zk5@gilmour.lan>
References: <1604369441-65254-1-git-send-email-tiantao6@hisilicon.com>
 <20201103095205.ywabphbc2xbop6ae@gilmour.lan>
 <f89640fb-6994-76dc-7862-a3b26b67dc24@suse.de>
MIME-Version: 1.0
In-Reply-To: <f89640fb-6994-76dc-7862-a3b26b67dc24@suse.de>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tian Tao <tiantao6@hisilicon.com>
Content-Type: multipart/mixed; boundary="===============0865410547=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0865410547==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oeooz33tgxv72ou6"
Content-Disposition: inline


--oeooz33tgxv72ou6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2020 at 11:10:27AM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 03.11.20 um 10:52 schrieb Maxime Ripard:
> > On Tue, Nov 03, 2020 at 10:10:41AM +0800, Tian Tao wrote:
> >> Add new api devm_drm_irq_install() to register interrupts,
> >> no need to call drm_irq_uninstall() when the drm module is removed.
> >>
> >> v2:
> >> fixed the wrong parameter.
> >>
> >> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> >> ---
> >>  drivers/gpu/drm/drm_drv.c | 23 +++++++++++++++++++++++
> >>  include/drm/drm_drv.h     |  3 ++-
> >>  2 files changed, 25 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> >> index cd162d4..0fe5243 100644
> >> --- a/drivers/gpu/drm/drm_drv.c
> >> +++ b/drivers/gpu/drm/drm_drv.c
> >> @@ -39,6 +39,7 @@
> >>  #include <drm/drm_color_mgmt.h>
> >>  #include <drm/drm_drv.h>
> >>  #include <drm/drm_file.h>
> >> +#include <drm/drm_irq.h>
> >>  #include <drm/drm_managed.h>
> >>  #include <drm/drm_mode_object.h>
> >>  #include <drm/drm_print.h>
> >> @@ -678,6 +679,28 @@ static int devm_drm_dev_init(struct device *paren=
t,
> >>  	return ret;
> >>  }
> >> =20
> >> +static void devm_drm_dev_irq_uninstall(void *data)
> >> +{
> >> +	drm_irq_uninstall(data);
> >> +}
> >> +
> >> +int devm_drm_irq_install(struct device *parent,
> >> +			 struct drm_device *dev, int irq)
> >> +{
> >> +	int ret;
> >> +
> >> +	ret =3D drm_irq_install(dev, irq);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	ret =3D devm_add_action(parent, devm_drm_dev_irq_uninstall, dev);
> >> +	if (ret)
> >> +		devm_drm_dev_irq_uninstall(dev);
> >> +
> >> +	return ret;
> >> +}
> >> +EXPORT_SYMBOL(devm_drm_irq_install);
> >> +
> >=20
> > Shouldn't we tie the IRQ to the drm device (so with drmm_add_action)
> > instead of tying it to the underlying device?
>=20
> If the HW device goes away, there won't be any more interrupts. So it's
> similar to devm_ functions for I/O memory. Why would you use the drmm_
> interface?

drm_irq_install/uninstall do more that just calling request_irq and
free_irq though, they will also run (among other things) the irq-related
hooks in the drm driver (irq_preinstall, irq_postinstall irq_uninstall)
and wake anything waiting for a vblank to occur, so we need the DRM
device and driver to still be around when we run drm_irq_uninstall.
That's why (I assume) you have to pass the drm_device as an argument and
not simply the device.

This probably works in most case since you would allocate the drm_device
with devm_drm_dev_alloc, and then run drm_irq_install, so in the undoing
phase you would have first drm_irq_uninstall to run, and everything is
fine.

However, if one doesn't use devm_drm_dev_alloc but would use
devm_drm_irq_install, you would have first remove being called that
would free the drm device, and then drm_irq_uninstall which will use a
free'd pointer.

So yeah, even though the interrupt line itself is tied to the device,
all the logic we have around the interrupt that is dealt with in
drm_irq_install is really tied to the drm_device. And since we tie the
life of drm_device to its underlying device already (either implicitly
through devm_drm_dev_alloc, or explictly through manual allocation in
probe and free in remove) we can't end up in a situation where the
drm_device outlives its device.

Maxime

--oeooz33tgxv72ou6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6EzKAAKCRDj7w1vZxhR
xYXHAQDK62VGz5kiFX28FD/Ad8gOyU18dwf6P+Kf7ujlHSflhAD7Bgq3u+SyxPLF
gDMzG4LU5oCFwaNNi3YfaMjC7wAIKQI=
=rc5S
-----END PGP SIGNATURE-----

--oeooz33tgxv72ou6--

--===============0865410547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0865410547==--
