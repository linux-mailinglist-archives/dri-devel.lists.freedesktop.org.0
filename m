Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C4344974F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 15:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427596EA01;
	Mon,  8 Nov 2021 14:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182206EA01;
 Mon,  8 Nov 2021 14:59:43 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8C3A858089B;
 Mon,  8 Nov 2021 09:59:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 08 Nov 2021 09:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=8xAnXR5M2pgccDxgDHcsQoFJ3dq
 VROc3kmDiRvdyHNQ=; b=L379N1g3L7WdacAQbBZ35pwsOUT4J/NwnX7dQSv5CzB
 CbhnBtNRvRXkjJjvHDoQ5Xb7cIElF3AsaDvNqQZQZj6x54hdg1ll4clajo4KNaNu
 gNg4VYqn1CKm6vJL3JK9UWL6SkjKmzovn/Pfr853xq3r3ZdELHFxCU0Zi99ZBnrv
 /hdo12cbs2fB32BnGW8U4QJDfN6tTfF+x0eHRm8DiUhSEn8h1PLUBNTFxy4aXEkn
 nb3iTOsrdGFBwMRyWDGR5idREHoLI6qH09C+IHajLEPWYPLBMmWEYpAD3ydNC3Cz
 ZzRxKd0t0GAcy818VLAVOP3REr7ZcF4wK6lQl4So/hQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8xAnXR
 5M2pgccDxgDHcsQoFJ3dqVROc3kmDiRvdyHNQ=; b=fNm9LxqPCTaxt99wM+CUko
 RDuEO0HozN8rDzL4wcLliLpROmzodqXfMOdBgrrHl9OWMQiPUfn9tI65ZmyQeh5/
 J6ydhFP1E9kjYAicN7fcHD0+iCILDqb+F6Sj3wzHYCBjtaEx1w3Acb7oQfeXlrdI
 iU00l1s26k4uqM2TkXslIbukJtF7628kaTO9mJUZ0doTroPbF8ht1oVywdtaodDM
 tf5G7Uj/h5mPyhPWmkXV7RQrHWzWIKIcjsTxwjCoG153UN7dZ0oZ46amp4x+WuoW
 /sDAu20CPxybVmhAyZ7WZ0/DFeEy7MqF9fdyRhEJOHA3Cn8Gw3Ap4+HtvDr+ooXQ
 ==
X-ME-Sender: <xms:WjuJYc-ZZGz5uWz5jiDkVnmgMlJ5KfLApDSVlbtw-Tk-pDVue06tKw>
 <xme:WjuJYUuTzx3GISHDitCuXdWvgamMfQqyiupSQzGztISxyyOFSndwUvUZZPVSuNZKU
 5-rzKj0-TP1gxZgHHU>
X-ME-Received: <xmr:WjuJYSBxO_ougqacmWHx6-HW-NP0TFXA94qNFur3VdO5XopelVsiUcQDmwBxzdit-8JH4GDh8Ky_DiLAGAvmYTVXJyP2JhjIkVJSP-f2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddvgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeejkeekffdtfffhhfevvddutefgtdeljeevffevvddvteegledtgfeghfehvdei
 ffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WzuJYcdWVUFVvYX0rJZQLxBHN8LDdaWmvc_85zYzibgOusN8cr8_ow>
 <xmx:WzuJYROBBEtQ4nNudlGzcUoCkPiLoXZjMUD3aemO3G9O6rSIb3kwag>
 <xmx:WzuJYWmjTPVOLA19362ptztU0oB0iZ7E3e1momGhzU6HDTmn6S0Gmw>
 <xmx:XDuJYZ25ok5xUHmQO20sN5bDqtdXlsvaZcO6Owy3wKHPFRmhvMenjA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Nov 2021 09:59:38 -0500 (EST)
Date: Mon, 8 Nov 2021 15:59:35 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 01/13] drm/connector: Add define for HDMI 1.4 Maximum
 Pixel Rate
Message-ID: <20211108145935.fhvq72k5bnrjeb3b@gilmour>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-2-maxime@cerno.tech>
 <YYJsM6/hZ43b1tm9@intel.com> <YYLPXJoC7TZcwejb@intel.com>
 <20211104084841.mjnennxgelacleaj@gilmour>
 <YYP/GWqbcvVFIrAj@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="u5n44bpbocthx4et"
Content-Disposition: inline
In-Reply-To: <YYP/GWqbcvVFIrAj@intel.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, amd-gfx@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kevin Hilman <khilman@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Dom Cobley <dom@raspberrypi.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--u5n44bpbocthx4et
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 04, 2021 at 05:41:13PM +0200, Ville Syrj=E4l=E4 wrote:
> On Thu, Nov 04, 2021 at 09:48:41AM +0100, Maxime Ripard wrote:
> > Hi Ville,
> >=20
> > On Wed, Nov 03, 2021 at 08:05:16PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Wed, Nov 03, 2021 at 01:02:11PM +0200, Ville Syrj=E4l=E4 wrote:
> > > > On Tue, Nov 02, 2021 at 03:59:32PM +0100, Maxime Ripard wrote:
> > > > > --- a/drivers/gpu/drm/drm_edid.c
> > > > > +++ b/drivers/gpu/drm/drm_edid.c
> > > > > @@ -4966,7 +4966,7 @@ static void drm_parse_hdmi_forum_vsdb(struc=
t drm_connector *connector,
> > > > >  		u32 max_tmds_clock =3D hf_vsdb[5] * 5000;
> > > > >  		struct drm_scdc *scdc =3D &hdmi->scdc;
> > > > > =20
> > > > > -		if (max_tmds_clock > 340000) {
> > > > > +		if (max_tmds_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
> > > > >  			display->max_tmds_clock =3D max_tmds_clock;
> > > > >  			DRM_DEBUG_KMS("HF-VSDB: max TMDS clock %d kHz\n",
> > > > >  				display->max_tmds_clock);
> > > > > diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/=
gpu/drm/i915/display/intel_hdmi.c
> > > > > index d2e61f6c6e08..0666203d52b7 100644
> > > > > --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> > > > > +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> > > > > @@ -2226,7 +2226,7 @@ int intel_hdmi_compute_config(struct intel_=
encoder *encoder,
> > > > >  		if (scdc->scrambling.low_rates)
> > > > >  			pipe_config->hdmi_scrambling =3D true;
> > > > > =20
> > > > > -		if (pipe_config->port_clock > 340000) {
> > > > > +		if (pipe_config->port_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
> > > > >  			pipe_config->hdmi_scrambling =3D true;
> > > > >  			pipe_config->hdmi_high_tmds_clock_ratio =3D true;
> > > > >  		}
> > > >=20
> > > > All of that is HDMI 2.0 stuff. So this just makes it all super
> > > > confusing IMO. Nak.
> > >=20
> > > So reading throgh HDMI 1.4 again it does specify 340 MHz as some kind
> > > of upper limit for the physical cable. But nowhere else is that number
> > > really mentioned AFAICS. HDMI 2.0 does talk quite a bit about the 340
> > > Mcsc limit in various places.
> > >=20
> > > I wonder what people would think of a couple of helpers like:
> > > - drm_hdmi_{can,must}_use_scrambling()
> > > - drm_hdmi_is_high_tmds_clock_ratio()
> > > or something along those lines? At least with those the code would
> > > read decently and I wouldn't have to wonder what this HDMI 1.4 TMDS
> > > clock limit really is.
> >=20
> > Patch 2 introduces something along those lines.
> >=20
> > It doesn't cover everything though, we're using this define in vc4 to
> > limit the available modes in mode_valid on HDMI controllers not
> > 4k-capable
>=20
> I wouldn't want to use this kind of define for those kinds of checks
> anyway. If the hardware has specific limits in what kind of clocks it
> can generate (or what it was validated for) IMO you should spell
> those out explicitly instead of assuming they happen to match
> some standard defined max value.

AFAIK, in the vc4 case, this is the hardware limit.

And there's other cases where it still seems to make sense to have that
define:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/drm_edid.c#n4978
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/radeon/radeon_encoders.c#n385
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/amd/amdgpu/amdgpu_connectors.c#n1174

etc..

Maxime

--u5n44bpbocthx4et
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYYk7VwAKCRDj7w1vZxhR
xXMgAQDnhMqR+evxrKBoJpC1Nd4kEZ4dT6uhRIbk5B86PNJztQD/c9fOYpIMx9ID
px7xLl3B61kKbIVKVlnQO4kdunKyJw8=
=VxQ1
-----END PGP SIGNATURE-----

--u5n44bpbocthx4et--
