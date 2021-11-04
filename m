Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A51D7445098
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 09:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4896EC49;
	Thu,  4 Nov 2021 08:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F396EC49;
 Thu,  4 Nov 2021 08:48:46 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2D585580876;
 Thu,  4 Nov 2021 04:48:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 04 Nov 2021 04:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=trsPLTuX5eN1+6357zkP5w+4wv/
 ep/5Bf7nUaNCCfvk=; b=N6qNGXwP4tfhBg/RWUGBNA1sWDjOx7qLK/hiogyEOQv
 Jj1b+xa3+cboDAo7kVwCYkf3pyYcnPo+VEeZJRtjLBNiqQ+TGV53dj5uqoYgTbOO
 o1x17aLxL2gPcbxCkkf+ffuY+3GXKZwDiJK9NSzcnHhJdmrDCBD4cxq9DO6pVdZM
 EAg76+zQ4ysijBUxJNowIojZ7HmrxIpedGACWqdBXfiieZSZK6Sbyk6EnHhcNjDK
 I149cd67WwCrX6OCnf4oYORCa2lJGOueYeQB5o6/it1nXWTi0s/7lHJYZbaOnQEl
 fyhIYUE+PMxiBkdVpv2YihTmCKgwkwD5x1SJv1mSDLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=trsPLT
 uX5eN1+6357zkP5w+4wv/ep/5Bf7nUaNCCfvk=; b=ECmjANenJrnyee/dKXXG1k
 rFFMtu6U9KJ/jnEqf+3TIoPRUyvBrP9QAMyWxLtAaWCUjI0zMlmYMSxox9TJMv9z
 3IpcFsVxQ2DfHxXNTfZRufbmgEL9vV6zGu8aYTGD0/yjG6VeGv0H/cjmACoLEs//
 cOMRM8mGs3g7n1i+xHK9IgEH/yqOpSW+EFvRcUThlyVqDEWKVk5QeS0ms5eg+uT4
 VN+LNwIh0tbZlWXSCSDKMi7V6Gn45Rd8K22xSsTQIgqr7cJkkKsLHFWkNd1b2+DT
 DXWG3SaWQQBdV1Q6tfEzFBswqUbJ/W64O4hEftRAOp1bcqzp7V1a7wqTMfQC6uXA
 ==
X-ME-Sender: <xms:ap6DYWBNnUrK0DttOvLMBq6bVTj8lRIKO_7wsMAY-7ScoyjxTM8yFA>
 <xme:ap6DYQhO9PQCfa22jTUW4ydwUHTmJ6Lj2jDgrVhRkrfLjEvBt2quEiuMKwgaZYkLk
 UP5lFKWfgjxGEKbfwQ>
X-ME-Received: <xmr:ap6DYZnB4KDcIbQ2m_dgDt7el6TPmeluFpYpIeXHGvy-Yf4Il-XuXbPRzv-F3R6SpXG-TfUQZ3GGPm-Fe85sc6_0nrXa7Fcs22S5xe-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdefgdduvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ap6DYUxQkdnWKHij88goigB1gNaPih8O-SV_9Clra1AVcSQczOBqWA>
 <xmx:ap6DYbQ8V1so-0Gf2rnVuCVkRspOHmiNxWrQSd2sWQUNc6b1qSBxuA>
 <xmx:ap6DYfYshdOufsOktbkss3UCz9o-gJ4qY_5vKX972e28nu6r4Ghnbw>
 <xmx:bJ6DYfK0uiuzUY798_6Z0VnOIXii53fYN6IzaJwXXo3GHZ5xhlOr-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Nov 2021 04:48:42 -0400 (EDT)
Date: Thu, 4 Nov 2021 09:48:41 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 01/13] drm/connector: Add define for HDMI 1.4 Maximum
 Pixel Rate
Message-ID: <20211104084841.mjnennxgelacleaj@gilmour>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-2-maxime@cerno.tech>
 <YYJsM6/hZ43b1tm9@intel.com> <YYLPXJoC7TZcwejb@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pxndx3anvyrc7z43"
Content-Disposition: inline
In-Reply-To: <YYLPXJoC7TZcwejb@intel.com>
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


--pxndx3anvyrc7z43
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ville,

On Wed, Nov 03, 2021 at 08:05:16PM +0200, Ville Syrj=E4l=E4 wrote:
> On Wed, Nov 03, 2021 at 01:02:11PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Tue, Nov 02, 2021 at 03:59:32PM +0100, Maxime Ripard wrote:
> > > --- a/drivers/gpu/drm/drm_edid.c
> > > +++ b/drivers/gpu/drm/drm_edid.c
> > > @@ -4966,7 +4966,7 @@ static void drm_parse_hdmi_forum_vsdb(struct dr=
m_connector *connector,
> > >  		u32 max_tmds_clock =3D hf_vsdb[5] * 5000;
> > >  		struct drm_scdc *scdc =3D &hdmi->scdc;
> > > =20
> > > -		if (max_tmds_clock > 340000) {
> > > +		if (max_tmds_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
> > >  			display->max_tmds_clock =3D max_tmds_clock;
> > >  			DRM_DEBUG_KMS("HF-VSDB: max TMDS clock %d kHz\n",
> > >  				display->max_tmds_clock);
> > > diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/=
drm/i915/display/intel_hdmi.c
> > > index d2e61f6c6e08..0666203d52b7 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> > > @@ -2226,7 +2226,7 @@ int intel_hdmi_compute_config(struct intel_enco=
der *encoder,
> > >  		if (scdc->scrambling.low_rates)
> > >  			pipe_config->hdmi_scrambling =3D true;
> > > =20
> > > -		if (pipe_config->port_clock > 340000) {
> > > +		if (pipe_config->port_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
> > >  			pipe_config->hdmi_scrambling =3D true;
> > >  			pipe_config->hdmi_high_tmds_clock_ratio =3D true;
> > >  		}
> >=20
> > All of that is HDMI 2.0 stuff. So this just makes it all super
> > confusing IMO. Nak.
>=20
> So reading throgh HDMI 1.4 again it does specify 340 MHz as some kind
> of upper limit for the physical cable. But nowhere else is that number
> really mentioned AFAICS. HDMI 2.0 does talk quite a bit about the 340
> Mcsc limit in various places.
>=20
> I wonder what people would think of a couple of helpers like:
> - drm_hdmi_{can,must}_use_scrambling()
> - drm_hdmi_is_high_tmds_clock_ratio()
> or something along those lines? At least with those the code would
> read decently and I wouldn't have to wonder what this HDMI 1.4 TMDS
> clock limit really is.

Patch 2 introduces something along those lines.

It doesn't cover everything though, we're using this define in vc4 to
limit the available modes in mode_valid on HDMI controllers not
4k-capable

We could probably do better on the name, but I still believe a define
like this would be valuable.

Maxime

--pxndx3anvyrc7z43
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYYOeaAAKCRDj7w1vZxhR
xW31AP9ZrW1GZ894aQ+2PZr6HfCImm0k5/+iLzGrkzoNuAj3BwD/fm55lGcssQw+
lhcuuMOafgTMwGbj7Dw+tHaTcMYN7w4=
=8Jzs
-----END PGP SIGNATURE-----

--pxndx3anvyrc7z43--
