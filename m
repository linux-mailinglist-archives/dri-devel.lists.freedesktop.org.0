Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F228CB8863
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 10:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5748C10E658;
	Fri, 12 Dec 2025 09:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P83BBtcw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188CD10E5C6;
 Fri, 12 Dec 2025 09:50:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C1BCE600C3;
 Fri, 12 Dec 2025 09:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA246C4CEF1;
 Fri, 12 Dec 2025 09:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765533029;
 bh=BbMk3VZO8JSPX3mqFQ3xSr2dm1e9Voyl+YIkL1dgU30=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P83BBtcwn8VRMW8mrTMtnelM8ub8sDcdXaW1Wrl+3Vnd0frCRvdKHolhpr5F1IoVU
 PuvKvLZg4jsnrBK851fJ44pF9CJsoiyukT/iCuHdS9Mh8+onaR23JD6gz0plDVaX+d
 PGEAdqiy4UzxDLpF5I+2TdGsA9OJAPdpRrFCoDX6hPuz/rvaEqx6BdtXgeMRJJ8+YH
 jJ3U+c2jemjYTAs1NJedrPjBYip9TLW8dFAJk/3N7Au+8bVJxxwfENwFrXXdxz2M6T
 bJgww4x2Lyx+IppbJyLrwVs3/cpHGzEPtgENaZ0oOHsCHB2k1dANt7oQ5ChQAl3WMB
 QEMERfbBkCWDQ==
Date: Fri, 12 Dec 2025 10:50:26 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v5 04/17] drm/bridge: Act on the DRM color format property
Message-ID: <20251212-hidden-armored-mule-66dd32@penduick>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
 <20251128-color-format-v5-4-63e82f1db1e1@collabora.com>
 <20251209-smart-oarfish-of-wind-0c1c8b@houat>
 <3772903.e9J7NaK4W3@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="djhkclvbsznn62pt"
Content-Disposition: inline
In-Reply-To: <3772903.e9J7NaK4W3@workhorse>
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


--djhkclvbsznn62pt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 04/17] drm/bridge: Act on the DRM color format property
MIME-Version: 1.0

On Thu, Dec 11, 2025 at 08:34:22PM +0100, Nicolas Frattaroli wrote:
> On Tuesday, 9 December 2025 15:27:28 Central European Standard Time Maxim=
e Ripard wrote:
> > On Fri, Nov 28, 2025 at 10:05:40PM +0100, Nicolas Frattaroli wrote:
> > > The new DRM color format property allows userspace to request a speci=
fic
> > > color format on a connector. In turn, this fills the connector state's
> > > color_format member to switch color formats.
> > >=20
> > > Make drm_bridges consider the color_format set in the connector state
> > > during the atomic bridge check. Specifically, reject any output bus
> > > formats that do not correspond to the requested color format.
> > >=20
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  drivers/gpu/drm/drm_bridge.c | 45 ++++++++++++++++++++++++++++++++++=
++++++++++
> > >  1 file changed, 45 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridg=
e.c
> > > index 8f355df883d8..8aac9747f35e 100644
> > > --- a/drivers/gpu/drm/drm_bridge.c
> > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > @@ -1052,6 +1052,47 @@ static int select_bus_fmt_recursive(struct drm=
_bridge *first_bridge,
> > >  	return ret;
> > >  }
> > > =20
> > > +static bool __pure bus_format_is_color_fmt(u32 bus_fmt, enum drm_col=
or_format fmt)
> > > +{
> > > +	if (fmt =3D=3D DRM_COLOR_FORMAT_AUTO)
> > > +		return true;
> > > +
> > > +	switch (bus_fmt) {
> > > +	case MEDIA_BUS_FMT_FIXED:
> > > +		return true;
> > > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > > +	case MEDIA_BUS_FMT_RGB101010_1X30:
> > > +	case MEDIA_BUS_FMT_RGB121212_1X36:
> > > +	case MEDIA_BUS_FMT_RGB161616_1X48:
> > > +		return fmt =3D=3D DRM_COLOR_FORMAT_RGB444;
> > > +	case MEDIA_BUS_FMT_YUV8_1X24:
> > > +	case MEDIA_BUS_FMT_YUV10_1X30:
> > > +	case MEDIA_BUS_FMT_YUV12_1X36:
> > > +	case MEDIA_BUS_FMT_YUV16_1X48:
> > > +		return fmt =3D=3D DRM_COLOR_FORMAT_YCBCR444;
> > > +	case MEDIA_BUS_FMT_UYVY8_1X16:
> > > +	case MEDIA_BUS_FMT_VYUY8_1X16:
> > > +	case MEDIA_BUS_FMT_YUYV8_1X16:
> > > +	case MEDIA_BUS_FMT_YVYU8_1X16:
> > > +	case MEDIA_BUS_FMT_UYVY10_1X20:
> > > +	case MEDIA_BUS_FMT_YUYV10_1X20:
> > > +	case MEDIA_BUS_FMT_VYUY10_1X20:
> > > +	case MEDIA_BUS_FMT_YVYU10_1X20:
> > > +	case MEDIA_BUS_FMT_UYVY12_1X24:
> > > +	case MEDIA_BUS_FMT_VYUY12_1X24:
> > > +	case MEDIA_BUS_FMT_YUYV12_1X24:
> > > +	case MEDIA_BUS_FMT_YVYU12_1X24:
> > > +		return fmt =3D=3D DRM_COLOR_FORMAT_YCBCR422;
> > > +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> > > +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> > > +	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> > > +	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> > > +		return fmt =3D=3D DRM_COLOR_FORMAT_YCBCR420;
> > > +	default:
> > > +		return false;
> > > +	}
> > > +}
> > > +
> > >  /*
> > >   * This function is called by &drm_atomic_bridge_chain_check() just =
before
> > >   * calling &drm_bridge_funcs.atomic_check() on all elements of the c=
hain.
> > > @@ -1137,6 +1178,10 @@ drm_atomic_bridge_chain_select_bus_fmts(struct=
 drm_bridge *bridge,
> > >  	}
> > > =20
> > >  	for (i =3D 0; i < num_out_bus_fmts; i++) {
> > > +		if (!bus_format_is_color_fmt(out_bus_fmts[i], conn_state->color_fo=
rmat)) {
> > > +			ret =3D -ENOTSUPP;
> > > +			continue;
> > > +		}
> >=20
> > Sorry, I'm struggling a bit to understand how this would work if a brid=
ge both supports the bus
> > format selection and HDMI state helpers? Can you expand on it?
>=20
> I have very little idea of whether this makes conceptual sense.

=2E. I wasn't asking you if it makes sense, I was asking you to explain
how you wanted it to work.

> The hope is that by working backwards from the last bridge and only
> accepting either fixed formats or something that corresponds to the
> target color format, we don't claim that a setup can do a colour
> format if the whole bridge chain isn't able to do it.
>=20
> Of course, format conversions along the bridge chain where one
> input format can be converted to a set of output formats by some
> bridge will throw a massive wrench into this. And this is all
> assuming that the bus format is in any way related to the color
> format that will be sent out on the wire.

I'm not really concerned about this. As we move more and more bridges to
the state helpers, we can always fix it, but it needs at the very least
to document how you envision the whole thing to work, and ideally have
bunch of tests to make sure it still does.

> In practice, I don't have any hardware where whatever counts as
> a "bridge" is an actually more involved setup than just the TX
> controller. I tried looking into getting a board with one of the
> supported DSI-to-HDMI bridge chips so I can at least test how it
> would work in such a scenario, and I got one, but I'd need to make
> my own flat flex PCB to adapt it to the pinout of my SBC's DSI
> port.
>=20
> So yeah I don't know how it's supposed to work, I just know this
> works for the case I'm working with, and any more complex case
> is literally unobtanium hardware which I'm not going to bother
> blowing days on maybe making a cable for when I'm already touching
> three different GPU drivers here and the intel-gfx-ci is screaming
> into my inbox about vague failures in unrelated codepaths in its
> native language, Klingon.

That's uncalled for.

> Which is all to say: is there a virtual drm bridge driver that
> exists, where I can set what formats it supports on the input
> and on the output, so that I can actually get a feel for how this
> is conceptually supposed to work without needing special hardware?

If your question is "do we have a way to replicate and test an arbitrary
setup to check how it behaves?", then yes, we do, it's what we're doing
in kunit. But you don't seem too fond of those.

> Better yet: do you have a specific setup in mind where you know
> this approach does not work?

Look. I was asking a genuine question. If you want to get all defensive
about it, go ahead. But sending a series implementing something with a
lot of history, complex interactions, etc. and then expecting it to be a
breeze that will get merged in a few revisions is not going to work.

Pushing back when asked to follow our documented rules, or being
dismissive when asked design questions is not going to help you push
this forward. If anything, and because it's complex, the more tests you
add the better because we A) know it works in a specific set of cases,
and B) know it will still work going forward.

I'm sure you know what you're doing, but so do we.

Maxime

--djhkclvbsznn62pt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTvlYQAKCRAnX84Zoj2+
ds9AAYDpOz10nKcMKLPyibtdEtuyeNgvyiyX8WQbWHjsrkDdfOtvubUe7UL7QZyF
z6LSrbIBfiVlJYqUrlofT80/bn/ebB/XyO+7ZvgSHoVicdQmR+HGHYkOnC9I7W5s
3S7XAmFmBQ==
=a739
-----END PGP SIGNATURE-----

--djhkclvbsznn62pt--
