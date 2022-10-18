Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C4F6028EA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 12:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7E810E72D;
	Tue, 18 Oct 2022 10:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4D110E1FB;
 Tue, 18 Oct 2022 10:00:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 9840A2B0681B;
 Tue, 18 Oct 2022 06:00:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 18 Oct 2022 06:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666087237; x=1666094437; bh=Mew53OXTwH
 iFXmVQ6iZl8wdqIVw1qLYYMvOjSnGQjvA=; b=h783S06UIS10ylSuF1/o838YPM
 DbVp8c65C70IDJcdNMmiaofP7qPuufEnKRs4zQAgwHIPvIVKKvV6EDExmWiGRi80
 CgRIJfH7KeyuWSnNBSqtBiCKNTxKOKb3kOtEtr/ts5UQ8kPVBhmL4xei7tMXKVS1
 rUH8E9RIAkUwWFOya33EWvEZ4HEOH6PsAHspGS0SR2G6UqMqvqA/N+ODJRzp/ATP
 nTOFmQZx3gM0oZRqQeyHnMo7y/2hAMjrE+b7i49b9nSCy36Ora+nv2YToDQcv7Vu
 XdKa+TQj7D2+4zdj1THQvExQSF3thASe4B5aE3rTc5kGB53FGePLt/3Y9OlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666087237; x=1666094437; bh=Mew53OXTwHiFXmVQ6iZl8wdqIVw1
 qLYYMvOjSnGQjvA=; b=MBih877Ia2R4AkvypNa7P62ofASd5XL0SrMcb9zmgHoO
 aXlyIzvS0leCX1CXutgzIouWAlIOMdSV9mQhs091IGwG7qhjErxmL+3ayoVJpmYm
 aDbBlEqIZIWC/kOKNTgZG7jyj0RCg0ABFUzlIpihFdjX0+0TdrNk+cDVmXUka/rJ
 UjhwInHkfq6DmPlnpqiTVtzmJigNO3ga+uVvYw3fEoE1AiVkGqMILI1Ztk5u36u1
 salh1ELf0Isya9OJKJgV1e8qChcxXTtWWtE2uTRwjqVTEVD8vkY1WTSbA9yORqRV
 5no88hoRCkwa4Ui9AWEQbqmNzaTqf6+6vUyIszuGWg==
X-ME-Sender: <xms:Q3lOY2nQJX9RqPjmQNiTRRY4F2L4fPkbPAe0gSi-UyAPVOarLyhXaw>
 <xme:Q3lOY90uGpOpg9mVbr79O-uj9LXljCEdpQ0-EZMwFa2Ocz39PpD0TO-cuvKu14ok-
 uit2P9CtjP2JOWcwRs>
X-ME-Received: <xmr:Q3lOY0raXPka89ULQeI7CnDB39OHXy5yWKa5IRPKT60wDypyuJ7kED84_NBp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeluddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeljeeugfegveetleevkeetffegudevieetieeugeeugeeivddtjeejvdef
 feetgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:RHlOY6nZwkVmV8fTV_dnJgszqGV7bUWlw6HJPq4x2iIjiOpRPgw1LA>
 <xmx:RHlOY01HlDURHhJ5_MRfx5sLZOkPNcVYwpknmpFPSaNwIV9rdW1Msw>
 <xmx:RHlOYxsmFAoVXp0zSZohSbuqaM0lnza9lt7ed7ZkjJpPnjuwQQZe2Q>
 <xmx:RXlOY0U3sTCTETZD1EFyaz82r4EUI5m6-X92lt0_6gKLympJ51598NuFJKU>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Oct 2022 06:00:35 -0400 (EDT)
Date: Tue, 18 Oct 2022 12:00:33 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v5 20/22] drm/vc4: vec: Convert to the new TV mode property
Message-ID: <20221018100033.d2sf7xagyycx5d4p@houat>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-20-d841cc64fe4b@cerno.tech>
 <c1949248-fb40-682c-492e-bafbd915cee3@gmail.com>
 <81936381-ae37-8c84-4681-9eff19f653b5@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ni7t7du2ochwvprb"
Content-Disposition: inline
In-Reply-To: <81936381-ae37-8c84-4681-9eff19f653b5@tronnes.org>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 kfyatek+publicgit@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ni7t7du2ochwvprb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2022 at 12:31:31PM +0200, Noralf Tr=F8nnes wrote:
> Den 16.10.2022 20.52, skrev Mateusz Kwiatkowski:
> >>  static int vc4_vec_connector_get_modes(struct drm_connector *connecto=
r)
> >>  {
> >> -	struct drm_connector_state *state =3D connector->state;
> >>  	struct drm_display_mode *mode;
> >> =20
> >> -	mode =3D drm_mode_duplicate(connector->dev,
> >> -				  vc4_vec_tv_modes[state->tv.legacy_mode].mode);
> >> +	mode =3D drm_mode_analog_ntsc_480i(connector->dev);
> >>  	if (!mode) {
> >>  		DRM_ERROR("Failed to create a new display mode\n");
> >>  		return -ENOMEM;
> >>  	}
> >> =20
> >> +	mode->type |=3D DRM_MODE_TYPE_PREFERRED;
> >>  	drm_mode_probed_add(connector, mode);
> >> =20
> >> -	return 1;
> >> +	mode =3D drm_mode_analog_pal_576i(connector->dev);
> >> +	if (!mode) {
> >> +		DRM_ERROR("Failed to create a new display mode\n");
> >> +		return -ENOMEM;
> >> +	}
> >> +
> >> +	drm_mode_probed_add(connector, mode);
> >> +
> >> +	return 2;
> >> +}
> >=20
> > Referencing those previous discussions:
> > - https://lore.kernel.org/dri-devel/0255f7c6-0484-6456-350d-cf24f3fee5d=
6@tronnes.org/
> > - https://lore.kernel.org/dri-devel/c8f8015a-75da-afa8-ca7f-b2b134cacd1=
6@gmail.com/
> >=20
> > Unconditionally setting the 480i mode as DRM_MODE_TYPE_PREFERRED causes=
 Xorg
> > (at least on current Raspberry Pi OS) to display garbage when
> > video=3DComposite1:PAL is specified on the command line, so I'm afraid =
this won't
> > do.
> >=20
> > As I see it, there are three viable solutions for this issue:
> >=20
> > a) Somehow query the video=3D command line option from this function, a=
nd set
> >    DRM_MODE_TYPE_PREFERRED appropriately. This would break the abstract=
ion
> >    provided by global DRM code, but should work fine.
> >=20
> > b) Modify drm_helper_probe_add_cmdline_mode() so that it sets
> >    DRM_MODE_TYPE_PREFERRED in addition to DRM_MODE_TYPE_USERDEF. This s=
eems
> >    pretty robust, but affects the entire DRM subsystem, which may break
> >    userspace in different ways.
> >=20
> >    - Maybe this could be mitigated by adding some additional conditions=
, e.g.
> >      setting the PREFERRED flag only if no modes are already flagged as=
 such
> >      and/or only if the cmdline mode is a named one (~=3D analog TV mod=
e)
> >=20
> > c) Forcing userspace (Xorg / Raspberry Pi OS) to get fixed and honor th=
e USERDEF
> >    flag.
> >=20
> > Either way, hardcoding 480i as PREFERRED does not seem right.
> >=20
>=20
> My solution for this is to look at tv.mode to know which mode to mark as
> preferred. Maxime didn't like this since it changes things behind
> userspace's back. I don't see how that can cause any problems for userspa=
ce.
>=20
> If userspace uses atomic and sets tv_mode, it has to know which mode to
> use before hand, so it doesn't look at the preferreded flag.
>=20
> If it uses legacy and sets tv_mode, it can end up with a stale preferred
> flag, but no worse than not having the flag or that ntsc is always
> preferred.
>=20
> If it doesn't change tv_mode, there's no problem, the preferred flag
> doesn't change.

I don't like it because I just see no way to make this reliable. When we
set tv_mode, we're not only going to change the preferred flag, but also
the order of the modes to make the preferred mode first.

Since we just changed the mode lists, we also want to send a hotplug
event to userspace so that it gets notified of it. It will pick up the
new preferred mode, great.

But what if it doesn't? There's no requirement for userspace to handle
hotplug events, and Kodi won't for example. So we just changed the TV
mode but not the actual mode, and that's it. It's just as broken for
Kodi as it is for X11 right now.

If we can't get a bullet-proof solution, then I'm not convinced it's
worth addressing. Especially since it's already the current state, and
it doesn't seem to bother a lot of people.

Maxime

--ni7t7du2ochwvprb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY055QQAKCRDj7w1vZxhR
xfTwAQDVEQYvVeMYoH1YAgDNEqY24+2ZZadq3pHFsRymVwrROQEAhc/jki+ik+Hi
+gkkmtM8W9Ky6PhkIjnV9vsG9oldYgs=
=FjLb
-----END PGP SIGNATURE-----

--ni7t7du2ochwvprb--
