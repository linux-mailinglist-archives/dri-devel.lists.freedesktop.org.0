Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D77F3BA116
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 15:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DA76E17C;
	Fri,  2 Jul 2021 13:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACBE6E17C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 13:16:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4B12F5806EC;
 Fri,  2 Jul 2021 09:16:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 02 Jul 2021 09:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Dpuka6kF6XJQ8HuE+RA/cLQlHqm
 /fSxaBerKlZi46o8=; b=3S6at3Gsjrp9YrocUHCqBIuwYjFMEHY/smi2fQsekGT
 rX6fYdA9A/WDZiD9f6+p/qgmA1+VwSzRTtDhgcqiFCxPlIgWDxC2HRXAbD3knMxL
 OyRbxMxATt0NtyNwjg0l4KpfLNl1ASKRDtcZ+/rn0Z+coMsO+pKovFyAulWrYz4e
 s5ujwtgvcwqCK1290mfBChyIySA2yIc0xHaf2luRuCmn9tIS4y3TdqiNIIG6IwVe
 YyAO5xwQb/a4ivkDnH3joylYvcX5skk2CTmU3WbOLvlq7f3Kr0PoTDdn0COGTPVJ
 cD5aiKDte7GA2Fq3N3QkjCKdxmzOV2xpfmZAz4/FWcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Dpuka6
 kF6XJQ8HuE+RA/cLQlHqm/fSxaBerKlZi46o8=; b=YA0+2Q902H4gta16BCA6Ly
 sB7rfgywSke8xqTExtE7gZNxD8tM1Zey4NnXPGXJUWZSx/LAUXRDRlLvmQLAevjf
 K0rZ7sz/6ZK5VfizRov+cL0zK0LQizF8MYFFqvhWOlC1BDC5ZETciCDKi8KcJl2F
 LHXxkGks2EkkPXRaIjYj8uFtfUQkyCxFWlqzHI1JuDy0tilUxMw8+Jq3dHje+XYt
 bjjuiM03V9FDjgBvsUOw8k8WFB0J/U4U4uK6W2GhRrYZam9Urq7Q3ZM3edbztmZc
 Ub2YD63iXS7mr0yLEruN1+pBQgn7TI515wCbylGvytU2F4aPIWT8Fx71mfCj+kag
 ==
X-ME-Sender: <xms:wRHfYHLFCWfedbyM0BHYT4EmLa5E4OB0VU5mx3p8MdG0Dl7cTD0JYg>
 <xme:wRHfYLKZm8_-JTfq7dWGwU_Xba6k1oJ8G7MIxi7tSfysdtFoL7peDcOme32Rvk9dC
 d9vfvS8niyhCs-dCQg>
X-ME-Received: <xmr:wRHfYPu0zjS_chbU5AFjShifSu5HCOBLKt1mzPd2bN8LegwY6HyTFMXmlIjh2dRmGcczQifOfC3_DR0X6CAMmzq6jUmMfympIO9U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeikedgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveegudetkeethfetgffgtdekkefghefhffefgeduleehgeehieeuveefgedv
 ieegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wRHfYAb94_jwajsGsNk9IvwauGSK8dMVjH0_wV4fGaA4_HofzQYI6A>
 <xmx:wRHfYObjMYAGVJ2sz7rqU-X1uCF1nhcZgbDU5h5gvC3rsH37vetLPA>
 <xmx:wRHfYEBJ7XSD0j3SjT9cRUNdl965HU_TaAsapaMWny71pL5D_XIcfA>
 <xmx:wxHfYGrsglQAQqaqug4g7AUnLM-76_gfqaYLS1KEDcUnsUAePhIasQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Jul 2021 09:16:48 -0400 (EDT)
Date: Fri, 2 Jul 2021 15:16:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 2/2] drm/vc4: hdmi: Convert to gpiod
Message-ID: <20210702131646.ppb5i7uz7kmmqs7g@gilmour>
References: <20210524131852.263883-1-maxime@cerno.tech>
 <20210524131852.263883-2-maxime@cerno.tech>
 <YN6IHun9G3Kfzf8G@Ryzen-9-3900X.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rcwmvrtgglhsawrs"
Content-Disposition: inline
In-Reply-To: <YN6IHun9G3Kfzf8G@Ryzen-9-3900X.localdomain>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 Hans Verkuil <hans.verkuil@cisco.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rcwmvrtgglhsawrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Thu, Jul 01, 2021 at 08:29:34PM -0700, Nathan Chancellor wrote:
> On Mon, May 24, 2021 at 03:18:52PM +0200, Maxime Ripard wrote:
> > The new gpiod interface takes care of parsing the GPIO flags and to
> > return the logical value when accessing an active-low GPIO, so switching
> > to it simplifies a lot the driver.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 24 +++++++-----------------
> >  drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +--
> >  2 files changed, 8 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index ccc6c8079dc6..34622c59f6a7 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -159,10 +159,9 @@ vc4_hdmi_connector_detect(struct drm_connector *co=
nnector, bool force)
> >  	struct vc4_hdmi *vc4_hdmi =3D connector_to_vc4_hdmi(connector);
> >  	bool connected =3D false;
> > =20
> > -	if (vc4_hdmi->hpd_gpio) {
> > -		if (gpio_get_value_cansleep(vc4_hdmi->hpd_gpio) ^
> > -		    vc4_hdmi->hpd_active_low)
> > -			connected =3D true;
> > +	if (vc4_hdmi->hpd_gpio &&
> > +	    gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio)) {
> > +		connected =3D true;
> >  	} else if (drm_probe_ddc(vc4_hdmi->ddc)) {
> >  		connected =3D true;
> >  	} else if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED) {
> > @@ -1993,7 +1992,6 @@ static int vc4_hdmi_bind(struct device *dev, stru=
ct device *master, void *data)
> >  	struct vc4_hdmi *vc4_hdmi;
> >  	struct drm_encoder *encoder;
> >  	struct device_node *ddc_node;
> > -	u32 value;
> >  	int ret;
> > =20
> >  	vc4_hdmi =3D devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
> > @@ -2031,18 +2029,10 @@ static int vc4_hdmi_bind(struct device *dev, st=
ruct device *master, void *data)
> >  	/* Only use the GPIO HPD pin if present in the DT, otherwise
> >  	 * we'll use the HDMI core's register.
> >  	 */
> > -	if (of_find_property(dev->of_node, "hpd-gpios", &value)) {
> > -		enum of_gpio_flags hpd_gpio_flags;
> > -
> > -		vc4_hdmi->hpd_gpio =3D of_get_named_gpio_flags(dev->of_node,
> > -							     "hpd-gpios", 0,
> > -							     &hpd_gpio_flags);
> > -		if (vc4_hdmi->hpd_gpio < 0) {
> > -			ret =3D vc4_hdmi->hpd_gpio;
> > -			goto err_put_ddc;
> > -		}
> > -
> > -		vc4_hdmi->hpd_active_low =3D hpd_gpio_flags & OF_GPIO_ACTIVE_LOW;
> > +	vc4_hdmi->hpd_gpio =3D devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
> > +	if (IS_ERR(vc4_hdmi->hpd_gpio)) {
> > +		ret =3D PTR_ERR(vc4_hdmi->hpd_gpio);
> > +		goto err_put_ddc;
> >  	}
> > =20
> >  	vc4_hdmi->disable_wifi_frequencies =3D
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_h=
dmi.h
> > index 060bcaefbeb5..2688a55461d6 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > @@ -146,8 +146,7 @@ struct vc4_hdmi {
> >  	/* VC5 Only */
> >  	void __iomem *rm_regs;
> > =20
> > -	int hpd_gpio;
> > -	bool hpd_active_low;
> > +	struct gpio_desc *hpd_gpio;
> > =20
> >  	/*
> >  	 * On some systems (like the RPi4), some modes are in the same
> > --=20
> > 2.31.1
>=20
> This patch as commit 6800234ceee0 ("drm/vc4: hdmi: Convert to gpiod")
> causes my Raspberry Pi 3 to lock up shortly after boot in combination
> with commit 411efa18e4b0 ("drm/vc4: hdmi: Move the HSM clock enable to
> runtime_pm"). The serial console and ssh are completely unresponsive and
> I do not see any messages in dmesg with "debug ignore_loglevel". The
> device is running with a 32-bit kernel (multi_v7_defconfig) with 32-bit
> userspace. If there is any further information that I can provide,
> please let me know.

Thanks for reporting this. The same bug has been reported on wednesday
on the RPi repo here:
https://github.com/raspberrypi/linux/pull/4418

More specifically, this commit should fix it:
https://github.com/raspberrypi/linux/pull/4418/commits/6d404373c20a794da3d6=
a7b4f1373903183bb5d0

Even though it's based on the 5.10 kernel, it should apply without any
warning on a mainline tree. Let me know if it fixes your issue too

Maxime

--rcwmvrtgglhsawrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYN8RvgAKCRDj7w1vZxhR
xQVBAP97XJGM5EXHAqX3r9z23hyLX+90jvE7y+6kla0uKDZDugEAlwhmAhpsIQsb
OG6qCX3NhuD4kRjLNAKEZJnL7OCinwc=
=Ea6S
-----END PGP SIGNATURE-----

--rcwmvrtgglhsawrs--
