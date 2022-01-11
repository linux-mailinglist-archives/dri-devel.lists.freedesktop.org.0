Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D6048AE10
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 14:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250A610E50E;
	Tue, 11 Jan 2022 13:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF3410E50E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 13:01:49 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id AB3202B000AA;
 Tue, 11 Jan 2022 08:01:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 11 Jan 2022 08:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=t/jyaTfuGX6T5u75/bYTe7A2rVR
 H5GYboErwsWPA6rE=; b=kx30Q9n7m32+u8SHiRHmXjmosz7FoQfkUP1T9hoWVvA
 YvzyGLSDM1giV+3UbFMqdvEhmocpa0uerfDoKgBwoIXz+7kQkEhwqUgt8l60uX3F
 mRLMNsN+QmgV4sZZOGxSgL/Z2CTEvazPnItv0nIXxXj6wjoh9qc9GAhsqaUobACy
 2zIMEApg+UTaDvOWEQUvT2cYqAjt1EziRRf1KhuO0oSOs3TxY9Jiz8BWzBz9L2tn
 zu0SzQUF07HDHnYw0zP50SVNqswAmu2jTUo/bgP6wLnIaEQVTkFOqYrmRjk1jtSl
 eEdd2y3cfSumuTJ3oa2+Go80on7h7z8EW/BHURE3ENQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=t/jyaT
 fuGX6T5u75/bYTe7A2rVRH5GYboErwsWPA6rE=; b=d4FzuOZb/w9q75M0aNRZ6v
 zWTwmMMDLgFsKbruGT9IF38yO/kfoiquCSk3EDruAKQS5z8iIlS7TFnRb7pKYOGn
 Xxuhgc9D2bhl6uDzFM5mIGrOqfvm/VwlcwwBE/THZxfXXRPl7651FXtWhPd7+47i
 YGhao5EQIZM/vDSazpWrvfEGkBwmF9uV9kWwjTDMDkUyKoMSWT0bMetC7RPs7dSm
 k6WKdnknlvr+e6QjhihUv5oOeof0AmsTSXWPmn7oeFoCVBt27DZfbjXGnK1UcEkd
 JkBiKTPP4pQlGFFkVMJirUh5Gl095UvjwVneUaMjo0NfSxDeWa//fpc5sG/BEXHA
 ==
X-ME-Sender: <xms:un_dYSpQLGk28QMplANqI0mYeD3NEq6kYq95VLEUJHKcCTn4HHw73g>
 <xme:un_dYQr6kTIjBiKMVrLh_JROnpOCWlky6LVRdpRSQlDzQErHOCD_sJMPR6oG92rOu
 TPZnU_-_y5y4ztP-Xw>
X-ME-Received: <xmr:un_dYXPKZNOn6yrQvhM5ihn_R0q20pQxjjOb-M-KXuHXcrQMVcsDcfI1QfPVNEuU4fV-2Gu5dpn22M5SCeYndFeniR6nrDWlsxSQoj0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehfedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:un_dYR7xtDCoH6N8vuSJUbNwdefAlC9ozLHr6lX7z4VSQaeiBsuu2Q>
 <xmx:un_dYR5il9Ugs7ww20lkGHJoJbuJzMQBfR_Bym_cvR3RcRD37I-slA>
 <xmx:un_dYRhXKuybMUD-bcAdB1JBcafsDyg9jNdsOQYPW_ob90plRk5b1Q>
 <xmx:u3_dYSPccQVAo5Opq-8-Yakm77jAgcjvgpT_Ib6bjbNytkpi2DrQzvyaILs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jan 2022 08:01:45 -0500 (EST)
Date: Tue, 11 Jan 2022 14:01:44 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH RESEND v4 v5 4/4] drm/vc4: Notify the firmware when DRM
 is in charge
Message-ID: <20220111130144.y2fs74tkpe7ecada@houat>
References: <20211215095117.176435-1-maxime@cerno.tech>
 <20211215095117.176435-5-maxime@cerno.tech>
 <1a42431d-59bc-53e0-199b-815c96f97a29@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eknbquhrmytuqbad"
Content-Disposition: inline
In-Reply-To: <1a42431d-59bc-53e0-199b-815c96f97a29@suse.de>
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
Cc: devicetree@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Scott Branden <sbranden@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Tim Gover <tim.gover@raspberrypi.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Frank Rowand <frowand.list@gmail.com>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eknbquhrmytuqbad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Tue, Jan 11, 2022 at 10:38:36AM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 15.12.21 um 10:51 schrieb Maxime Ripard:
> > Once the call to drm_fb_helper_remove_conflicting_framebuffers() has
> > been made, simplefb has been unregistered and the KMS driver is entirely
> > in charge of the display.
> >=20
> > Thus, we can notify the firmware it can free whatever resource it was
> > using to maintain simplefb functional.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   drivers/gpu/drm/vc4/vc4_drv.c | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_dr=
v.c
> > index 86c61ee120b7..a03053c8e22c 100644
> > --- a/drivers/gpu/drm/vc4/vc4_drv.c
> > +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> > @@ -37,6 +37,8 @@
> >   #include <drm/drm_fb_helper.h>
> >   #include <drm/drm_vblank.h>
> > +#include <soc/bcm2835/raspberrypi-firmware.h>
> > +
> >   #include "uapi/drm/vc4_drm.h"
> >   #include "vc4_drv.h"
> > @@ -215,6 +217,7 @@ static void vc4_match_add_drivers(struct device *de=
v,
> >   static int vc4_drm_bind(struct device *dev)
> >   {
> >   	struct platform_device *pdev =3D to_platform_device(dev);
> > +	struct rpi_firmware *firmware =3D NULL;
> >   	struct drm_device *drm;
> >   	struct vc4_dev *vc4;
> >   	struct device_node *node;
> > @@ -251,10 +254,29 @@ static int vc4_drm_bind(struct device *dev)
> >   	if (ret)
> >   		return ret;
> > +	node =3D of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-fir=
mware");
> > +	if (node) {
> > +		firmware =3D rpi_firmware_get(node);
> > +		of_node_put(node);
> > +
> > +		if (!firmware)
> > +			return -EPROBE_DEFER;
> > +	}
> > +
>=20
> The code is
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your review

> Just for my understanding:
>=20
> You retrieve the firmware before killing simpledrm simply to keep the
> display on if it fails, right?

Exactly

> What's the possible error that would justify a retry (via EPROBE_DEFER)?

The firmware there is backed by a driver that might not have probed yet,
in which case we just want to retry later on

Maxime

--eknbquhrmytuqbad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYd1/uAAKCRDj7w1vZxhR
xeldAQDChNSM76RAq7W2gPVkPoweMGpJz6/TGfj4Pi+ZULSuwQD8CmSAhoMN2pve
3O2WrSSFt3UJzozo/w6KXpBiFXR9+A8=
=Lqs6
-----END PGP SIGNATURE-----

--eknbquhrmytuqbad--
