Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0227260F3CE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 11:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3C910E59E;
	Thu, 27 Oct 2022 09:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A4410E59E;
 Thu, 27 Oct 2022 09:37:42 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id E0A312B066EB;
 Thu, 27 Oct 2022 05:37:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 27 Oct 2022 05:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666863454; x=1666870654; bh=5ItCVshj6J
 yZau2J5cjH0M8JHw139GrYlnIerAQcZWs=; b=IVFSYrra2yRKDBScb6i+EPPsnR
 H7iUD7VkPJAKE695dyeIFHVvDzTnEOFd/PuRkXJYQDLL3GqO5VDnC18zyG53l/7I
 pvgnmLqeiBPBWXQjApcUVHOrKRHilbj5+ASZsv6ndq61A0vf5cAG6GPGNStKiCRy
 wer2bctGBN1o9JRLtzfw8j3SxBth2GhmC1AF3SbqCoOAk5ikvGienxjeMuTVnd3b
 CIYEdhLoJTnMe4apOVtrct3AJygLwtX9QefTOEjFMks85VRv9W7SGo+EMXE4ei+c
 /vSdG+pF0qpFn1D0F3ffTOrvCiLzPaO3Iv99pS2pxcK/5ssmEIuPwA72joMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666863454; x=1666870654; bh=5ItCVshj6JyZau2J5cjH0M8JHw13
 9GrYlnIerAQcZWs=; b=aMBp3hE4BgyODOr6WOBsdolHjS2Onrihiev6Ff/sAjQh
 Cama2t5zFVnEKp63jv9ugJbpKhvl71qc+L5qSL1TZPihHUka8luZ1042BOHS5Sxh
 aMKHX7Ay1bGb29oD5v8DX8oZBPKSAoX9G4RJblIy3UNVtu3bbfNqg1CYVaEHxNJc
 pHr9LW/SlL0Xhx1KndHWOx5hpeWVSz48zu40JY3Je6zDtTTEvFuI+nyPVFLcWWtY
 eqbDGYXUYbYyBSfExtphfrsas5tR+XzSbiwxPrJVDiXhOZHeBFTCAEXgpwFpx+Y+
 pod1LrzbN+UsFQjTvFLBJJEhMjbUc60CIEflbK3G1Q==
X-ME-Sender: <xms:XVFaY2V3HXvfhP1sHBM2RqKgaN_XBF1qyOB-16Icc85JB7HqiOyGyQ>
 <xme:XVFaYymw4tPdxY-cElvQVHHZLmvXXXhqeFlJcjgr306-I0KGXWDk9VMwSgLcrhFrI
 6vBlnwtvAVwP-Gv9dE>
X-ME-Received: <xmr:XVFaY6Yv9syrc2eNVMwBSReD-NF-yontoCDOlMFptjpietVbD3UxWNp9XeGYc57se2BDpokpHl05GwQ2hi7OCyXnbvZ2cF1h8PCaUIeVB1DPtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XVFaY9XZjJldLB8TfWAvQMGF4_ZIwB3BAmJ9FrbIS74qAyEc9gHcKw>
 <xmx:XVFaYwniTa_gv5wa6Swk-Bkdalxuyr-d6ooN7h3oJMCVZXoae2kxxg>
 <xmx:XVFaYyfwb0zZapv__NMakGUW6Ff2JSZL3y8FQRnm40OE9l_KC--TOQ>
 <xmx:XlFaY0E6LsDzaiDnQgO6ixyU_rtUbrrppb7Nh4KTrTCg4VBJmZ0lFuKlYcg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Oct 2022 05:37:32 -0400 (EDT)
Date: Thu, 27 Oct 2022 11:37:30 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
Subject: Re: [PATCH v6 16/23] drm/probe-helper: Provide a TV get_modes helper
Message-ID: <20221027093730.tb4oaissdapf6ifr@houat>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
 <20220728-rpi-analog-tv-properties-v6-16-e7792734108f@cerno.tech>
 <8d0eee22-50f5-5b0a-c1e6-c5f61dd5bbcd@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xamrv4lbhqfdsxuo"
Content-Disposition: inline
In-Reply-To: <8d0eee22-50f5-5b0a-c1e6-c5f61dd5bbcd@gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xamrv4lbhqfdsxuo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mateusz,

On Thu, Oct 27, 2022 at 12:02:24AM +0200, Mateusz Kwiatkowski wrote:
> First of all, nice idea with the helper function that can be reused by
> different drivers. This is neat!

Yeah, it looked to me that given how complex it is, we don't want to
duplicate it in each and every driver.

> But looking at this function, it feels a bit overcomplicated. You're
> creating the two modes,

If reported as supported by the connector, yes.

> then checking which one is the default, then set the preferred one and
> possibly reorder them. Maybe it can be simplified somehow?

Possibly, but I couldn't find something simpler. We should only expose
the modes that the driver reports as supported, so we can have 0-2
modes. Then the preferred flag needs to be set on the default one like
you suggested.

But also, EDIDs define the preferred mode as either the mode with the
flag set or the first mode listed. So a lot of program just use the
heuristic to just pick the first mode listed.

So it might be that I'm too careful, but it still seems useful to me.

> Although when I tried to refactor it myself, I ended up with something th=
at's
> not better at all. Maybe it needs to be complicated, after all :(

Yeah, that was my conclusion too :/

> Anyway, the current version seems to have a couple of bugs:
>=20
> > +	if (tv_mode_supported(connector, DRM_MODE_TV_MODE_PAL) ||
> > +	    tv_mode_supported(connector, DRM_MODE_TV_MODE_PAL_N) ||
> > +	    tv_mode_supported(connector, DRM_MODE_TV_MODE_SECAM)) {
> > +		mode =3D drm_mode_analog_pal_576i(connector->dev);
> > +		if (!mode)
> > +			return 0;
> > +
> > +		tv_modes[count++] =3D mode;
> > +	}
>=20
> If the 480i mode has been created properly, but there's an error creating=
 the
> 576i one (we enter the if (!mode) clause), the 480i mode will leak.
>=20
> > +	if (count =3D=3D 1) {
>=20
> You're handling the count =3D=3D 1 case specially, but if count =3D=3D 0,=
 the rest of
> the code will assume that two modes exist and probably segfault in the pr=
ocess.
>=20
> > +	ret =3D drm_object_property_get_default_value(&connector->base,
> > +						    dev->mode_config.tv_mode_property,
> > +						    &default_mode);
> > +	if (ret)
> > +		return 0;
> > +
> > +	if (cmdline->tv_mode_specified)
> > +		default_mode =3D cmdline->tv_mode;
>=20
> In case of an error (ret !=3D 0), the modes created so far in the tv_mode=
s array
> will leak.

Thanks for the review, I'll fix these bugs

> Also, I wonder if maybe the if (cmdline->tv_mode_specified) clause should=
 go
> first? If we're going to use the default from cmdline, there's no point i=
n even
> querying the property default value.

Maybe, I don't know. I find the flow of the code more readable that way,
but if you disagree I'll change it.

Maxime

--xamrv4lbhqfdsxuo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1pRWgAKCRDj7w1vZxhR
xTVQAQCdqQ7+vEr0O0pC7P93kHAYwFz0oBZn90Ip4EjyExKRPgD/cMwjjUZ6daWo
/idlovksY5X1UdblxYiDcBffKZ9k8gM=
=nRSG
-----END PGP SIGNATURE-----

--xamrv4lbhqfdsxuo--
