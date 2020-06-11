Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6481F829E
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8856E3D2;
	Sat, 13 Jun 2020 10:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AB26E90B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 13:41:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B7AC858020E;
 Thu, 11 Jun 2020 09:41:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Jun 2020 09:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=lnKXyz/F/fXExwiMvo0rUGaX6n1
 RjgnknlPIYVxcA4c=; b=N2vQMc/eYObb8y462R1fcC4qfRlm3y3oGza4pTd0XNM
 48uwS/LAdtmIIXZXxbMnkG5aqFt2rN77t4Cxpqmsx6IqD4tGHnepDfSpuH8kwYBl
 0udvE1/Wqf1j6mbLiUbg+/f0gkv4Eo/sBQq0vgTAUbxSRY10I8X0TwPFwQHGUM4l
 VtOIe8GonFTWKSJkxgrXQNcZJh2jGDV8/YqbQG/bfW0S+xDNG9evhSl06wvMU1pJ
 Fx8Mr4vhvR1MDXRAvAy4ApeeWV5459MNWMpuhYSw4rXCSEnP+RNcv8tk0Xx6BWqJ
 CW8/9HowHBXuvDf1S5KdFQBTchEPXEm/Vv5XQ1qqd7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lnKXyz
 /F/fXExwiMvo0rUGaX6n1RjgnknlPIYVxcA4c=; b=a6U1Qp2WDCBCkDdnx5UqU+
 es/DU+DkPjI9VKfBOWrEBsRTGhzkm+Y23GfmVABmABmlv+1CB4nKhEyHyIdzTObg
 83SkY6GQxdAxhXelCi3MfdjxhUKZjI0cUoI4dqcQMeuJbmMCywBQA/6UK/sAXsWG
 3YrPebU/WR5Tg7XyKEJlfgqdKH7uIN5DhQeQnZFKqGa82CLmEo4OdYmUf49yxFx+
 C6MJYy8JohcSmiqfiW75S95VgxGi8n3nxntUmuNicCDrtZUPV1wIw6EiLmkT/Adp
 tHB3bGSQ8Tgkn/fpD93arNFJ3hlvQJink6PauKEJ0qomI5P2rJ9XzJ++S78wj7MA
 ==
X-ME-Sender: <xms:ijTiXucxDob-Dth_T73oGK6crtPnX4srZbySjWoh1iHyLQm0JrEiCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehledggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeekkefftdffhffhvedvudetgfdtleejveffvedvvdetgeeltdfggefhhedv
 ieffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ijTiXoPlym_vnBgQF-uwls-GEiZE6FOvkLrTSe9EPEQDt3Tlqa3ryQ>
 <xmx:ijTiXvjCuwlV7okrlzAks8xVljAGmiCisoFpC10ccOly09zkthrrNg>
 <xmx:ijTiXr8_oOeO3EjsLSbdE5UaP9LjOaXx4w_m0G8haAkDAH_Oc8Lusw>
 <xmx:jDTiXn_WFAoll-e4NrOHgnAq9-WVDx0yTXuPRvZ5-Qb21LFPK7nZ7A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0FDB53280184;
 Thu, 11 Jun 2020 09:34:45 -0400 (EDT)
Date: Thu, 11 Jun 2020 15:34:44 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v3 070/105] drm/vc4: hdmi: rework connectors and encoders
Message-ID: <20200611133444.narsdlxmko2wgyj7@gilmour.lan>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <020de18840a1075b2671736c6cc2e451030fad74.1590594512.git-series.maxime@cerno.tech>
 <CADaigPXJ0BnMUp=XN6G92Tx=H9j55pmsBAujO2mcpiiTs-RHnQ@mail.gmail.com>
 <20200602155421.niyvpwqc42xh5c7v@gilmour>
 <6cd190e0-c81c-8e47-3ca8-22360de9b46d@i2se.com>
 <20200605143536.i6cc2v57eupmlvtn@gilmour.lan>
 <197a3164-828b-510e-47a7-f18ce1300d9d@i2se.com>
MIME-Version: 1.0
In-Reply-To: <197a3164-828b-510e-47a7-f18ce1300d9d@i2se.com>
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0454570459=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0454570459==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wpbk5ex6eqlqnwq4"
Content-Disposition: inline


--wpbk5ex6eqlqnwq4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Sat, Jun 06, 2020 at 10:06:12AM +0200, Stefan Wahren wrote:
> Hi Maxime,
>=20
> Am 05.06.20 um 16:35 schrieb Maxime Ripard:
> > Hi Stefan,
> >
> > On Wed, Jun 03, 2020 at 07:32:30PM +0200, Stefan Wahren wrote:
> >> Am 02.06.20 um 17:54 schrieb Maxime Ripard:
> >>> On Wed, May 27, 2020 at 11:41:24AM -0700, Eric Anholt wrote:
> >>>> On Wed, May 27, 2020 at 8:51 AM Maxime Ripard <maxime@cerno.tech> wr=
ote:
> >>>>> the vc4_hdmi driver has some custom structures to hold the data it =
needs to
> >>>>> associate with the drm_encoder and drm_connector structures.
> >>>>>
> >>>>> However, it allocates them separately from the vc4_hdmi structure w=
hich
> >>>>> makes it more complicated than it needs to be.
> >>>>>
> >>>>> Move those structures to be contained by vc4_hdmi and update the co=
de
> >>>>> accordingly.
> >>>>> @@ -1220,7 +1219,7 @@ static int vc4_hdmi_bind(struct device *dev, =
struct device *master, void *data)
> >>>>>         struct drm_device *drm =3D dev_get_drvdata(master);
> >>>>>         struct vc4_dev *vc4 =3D drm->dev_private;
> >>>>>         struct vc4_hdmi *hdmi;
> >>>>> -       struct vc4_hdmi_encoder *vc4_hdmi_encoder;
> >>>>> +       struct drm_encoder *encoder;
> >>>>>         struct device_node *ddc_node;
> >>>>>         u32 value;
> >>>>>         int ret;
> >>>>> @@ -1229,14 +1228,10 @@ static int vc4_hdmi_bind(struct device *dev=
, struct device *master, void *data)
> >>>>>         if (!hdmi)
> >>>>>                 return -ENOMEM;
> >>>>>
> >>>>> -       vc4_hdmi_encoder =3D devm_kzalloc(dev, sizeof(*vc4_hdmi_enc=
oder),
> >>>>> -                                       GFP_KERNEL);
> >>>>> -       if (!vc4_hdmi_encoder)
> >>>>> -               return -ENOMEM;
> >>>>> -       vc4_hdmi_encoder->base.type =3D VC4_ENCODER_TYPE_HDMI0;
> >>>>> -       hdmi->encoder =3D &vc4_hdmi_encoder->base.base;
> >>>>> -
> >>>>>         hdmi->pdev =3D pdev;
> >>>>> +       encoder =3D &hdmi->encoder.base.base;
> >>>>> +       encoder->base.type =3D VC4_ENCODER_TYPE_HDMI0;
> >>>> Wait, does this patch build?
> >>> All those patches were build tested, so yep
> >>>
> >>>> setting struct drm_encoder->base.type =3D VC4_* seems very wrong, wh=
en
> >>>> previously we were setting struct vc4_hdmi_encoder->base.type (struct
> >>>> vc4_encoder->type).
> >>> So the structure layout now is that vc4_hdmi embeds vc4_hdmi_encoder =
as
> >>> encoder. So &hdmi->encoder is a pointer to vc4_hdmi_encoder.
> >>> vc4_hdmi_encoder's base is since that patch a struct vc4_encoder. and
> >>> vc4_encoder's base is a drm_encoder.
> >>>
> >>> so encoder being a drm_encoder is correct there.
> >>>
> >>> However, drm_encoder's base is drm_mode_object that does have a type
> >>> field, which is an uint32_t, which will accept a VC4_ENCODER_TYPE_* j=
ust
> >>> fine...
> >>>
> >>> Now, drm_encoder_init will then kick in and call drm_mode_object_add
> >>> which will override it to a proper value and since the clock select b=
it
> >>> in the PV is the same for both HDMI0 and HDMI1, everything works just
> >>> fine...
> >>>
> >>> Good catch, I'll fix it. And I guess it's a good indication we don't
> >>> need a separate HDMI0 and HDMI1 encoder type.
> >>>
> >> FWIW this is the first patch which breaks X on my Raspberry Pi 3 B.
> >>
> >> Here are the bisect results:
> >>
> >> 587d6e4a529a8d807a5c0bae583dd432d77064d6 bad (black screen, no heartbe=
at)
> >>
> >> b0523c7b1c9d0edcd6c0fe6d2cb558a9ad5c60a8 good
> >>
> >> 2c6a651cac6359cb0244a40d3b7a14e72918f169 good
> >>
> >> 1705c3cb40906863ec0d24ee5ea5092f5ee2e994 bad (black screen, but heartb=
eat)
> >>
> >> 601527fea6bb226abd088a864e74b25368218e87 good
> >>
> >> 2165607ede34d229d0cbce916c70c7fb6c0337be good
> >>
> >> f094f388fc2df848227e2ae648df2c97872df42b good
> >>
> >> 020de18840a1075b2671736c6cc2e451030fad74 bad (black screen, but heartb=
eat)
> >>
> >> 4c4da3823e4d1a8189e96a59a79451fff372f70b good
> >>
> >> 020de18840a1075b2671736c6cc2e451030fad74 is the first bad commit
> >> commit 020de18840a1075b2671736c6cc2e451030fad74
> >> Author: Maxime Ripard <maxime@cerno.tech>
> >> Date:=A0=A0 Mon Jan 6 17:17:29 2020 +0100
> >>
> >> =A0=A0=A0 drm/vc4: hdmi: rework connectors and encoders
> >> =A0=A0=A0
> >> =A0=A0=A0 the vc4_hdmi driver has some custom structures to hold the d=
ata it
> >> needs to
> >> =A0=A0=A0 associate with the drm_encoder and drm_connector structures.
> >> =A0=A0=A0
> >> =A0=A0=A0 However, it allocates them separately from the vc4_hdmi stru=
cture which
> >> =A0=A0=A0 makes it more complicated than it needs to be.
> >> =A0=A0=A0
> >> =A0=A0=A0 Move those structures to be contained by vc4_hdmi and update=
 the code
> >> =A0=A0=A0 accordingly.
> >> =A0=A0=A0
> >> =A0=A0=A0 Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > So it looks like there was two issues on the Pi3. The first one was
> > causing the timeouts (and therefore likely the black screen but
> > heartbeat case you had) and I've fixed it.
> >
> > However, I can indeed reproduce the case with the black screen / no
> > heartbeat you mentionned. My bisection however returns that it's the
> > patch "drm/vc4: hdmi: Implement finer-grained hooks" that is at fault.
> > I've pushed my updated branch, if you have some spare time, it would be
> > great if you could confirm it on your Pi.
>=20
> yesterday i checked out your latest rpi4-kms branch, but i was still
> facing similiar issues with my Raspberry Pi 3 and multi_v7_defconfig
> (heartbeat stops, splashscreen freeze, heartbeat is abnormal fast). So i
> tried to bisect but the offending commit didn't cause an issue the
> second time.
>=20
> By accident i noticed that a simple reboot seems to hang for at least 8
> minutes (using b0523c7b1c9d0edcd the base of your branch). This usually
> take a few seconds. So i consider this base on linux-next as too
> unstable for reliable testing.
>=20
> Is it possible to rebase this on something more stable like linux-5.7 or
> at least drm-misc-next? This should avoid chasing unrelated issues.

I've rebased it on 5.7 here:
https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git/log/?h=3D=
rpi4-kms-5.7

And it looks to be indeed an issue coming from next. That branch can
start the desktop just fine on an RPi3 here. It would be great if you
could confirm on your end.

Thanks!
Maxime

--wpbk5ex6eqlqnwq4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXuIy9AAKCRDj7w1vZxhR
xUrIAQC6KoeIqY6MSdf6PMXuLrdzYpKmtDgTn9ne8ETjGLllMAD/USnAQcNFcj4y
AdvyJ/nmG4v6sxpiZDDKrsdLL4JnsgA=
=HA5b
-----END PGP SIGNATURE-----

--wpbk5ex6eqlqnwq4--

--===============0454570459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0454570459==--
