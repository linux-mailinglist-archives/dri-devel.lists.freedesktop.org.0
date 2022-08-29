Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ADF5A4B4A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 14:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0930910F194;
	Mon, 29 Aug 2022 12:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5034110F18A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 12:14:04 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id A3DD12B05FEA;
 Mon, 29 Aug 2022 08:13:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 29 Aug 2022 08:14:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661775239; x=1661782439; bh=mTveQVWkV1
 vZ4UHqLteArY1kTT3T3MkF8rU++sYP7DQ=; b=deQ85rmXbmk9EU5yPkeT4FeMzw
 ajssLQD6g5oBcELNrx4UU+HbXmlm0HidRFe7oyKb3gVjx4SF4t96+MIvCiauIQZ6
 VkkFblw4iMQtqKR/igP21fIjxUxTpIQfnZnlPmsa4tgUOnPjVK8+09gXQx+7MQEt
 zSQiQ5nD50lpJNZh8MaEeJd35xziKHuU7RL5Vvt7nyWXtZNUFdUx2rHgY2DyKmIE
 Y+WOVKYpJnJnkQDv1RvApX9WS4BCZm3hnvpngtlRdjEQ9jtGbbJFNAqGfmCBaoZ2
 z0N8Wb1KccCN6URDL7oQ4kpCizVLnIffHfmYflWHSPkM9NOM4d5uJz+5Hfeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661775239; x=1661782439; bh=mTveQVWkV1vZ4UHqLteArY1kTT3T
 3MkF8rU++sYP7DQ=; b=bWRLiPP6oKwtq6YNktjqK55u0c0PEav/PI4LGA7vm0G8
 07eaFtMArYcfxlmNU+esxlAqtTOcqxEJI0B9bx8pqxdFLiRfSgxQX+Yocd9WBf7r
 Dlqds0ZumsVLHaEYV2WspNGz7rFuvTHIhCSmH36loAiUCRMCRiL0ZDdNYI7CPnCI
 WszS8SwUfmie0luDpSOU2HB4hpe6dvX9VlxVFvSmjzFuUedE8UdXp1r5anCg19xY
 bYr+KTt8uMK5ml/ysZOohGMU+xc8NUkvF7qm3v0qHnXye+0teFqx71Bfi9X0Cz2K
 jNTHsNaK//4NL7H6A2HqzDay85EaIA12z85Wsdnucg==
X-ME-Sender: <xms:hK0MY_1QCn_R1BmmnxYAy3j6uhGZZygDu_p_2RHAd9ixYpyWWZDBYg>
 <xme:hK0MY-HlWbNhRy8ItowbMFBHJYowZcmHAR7cDG8lci27-ILoQHCYfQpACwOByuu4h
 ODelh2VwEKk9tlxOMo>
X-ME-Received: <xmr:hK0MY_5emyLwnuAZIri9nU2E9eHtZ8jf_PfKI4qtJUXHtKg4gDXwPGKDjFzx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hK0MY00Si24mBss2GM-eZAjZix3b0D2b_KyPBQEI4wgG0h4NRlPAUQ>
 <xmx:hK0MYyG95-S3OtXNrTChJqHmDuTQb1Zt-u4id3SxS12uflby4kKVkQ>
 <xmx:hK0MY1_J6SPLxOjfnCKxflyCvOm-NSPvpsuUVfgV9zIWAtJM4Nu1CQ>
 <xmx:h60MY72ttPo2qpGntjgEJEHlcnFhBX1-UTwtzc4bhCAfQ3lAmDASOkWPUzA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 08:13:56 -0400 (EDT)
Date: Mon, 29 Aug 2022 14:13:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 23/35] drm/vc4: vec: Convert to the new TV mode property
Message-ID: <20220829121353.kbgjmkmmcdtm5ujs@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-23-3d53ae722097@cerno.tech>
 <0255f7c6-0484-6456-350d-cf24f3fee5d6@tronnes.org>
 <20220824152619.5def5b2puj5b2a3o@houat>
 <7bdcc3c4-e04c-c2f3-5691-bcbdb158276f@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uu4iphtbpnfop3qu"
Content-Disposition: inline
In-Reply-To: <7bdcc3c4-e04c-c2f3-5691-bcbdb158276f@tronnes.org>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uu4iphtbpnfop3qu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Noralf,

On Thu, Aug 25, 2022 at 03:14:01PM +0200, Noralf Tr=F8nnes wrote:
> Den 24.08.2022 17.26, skrev Maxime Ripard:
> > On Sat, Aug 20, 2022 at 07:22:48PM +0200, Noralf Tr=F8nnes wrote:
> >> Den 29.07.2022 18.35, skrev Maxime Ripard:
> >>> Now that the core can deal fine with analog TV modes, let's convert t=
he vc4
> >>> VEC driver to leverage those new features.
> >>>
> >>> We've added some backward compatibility to support the old TV mode pr=
operty
> >>> and translate it into the new TV norm property.
> >>>
> >>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>>
> >>> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_=
vec.c
> >>
> >>>  static int vc4_vec_connector_get_modes(struct drm_connector *connect=
or)
> >>>  {
> >>> -	struct drm_connector_state *state =3D connector->state;
> >>>  	struct drm_display_mode *mode;
> >>> =20
> >>> -	mode =3D drm_mode_duplicate(connector->dev,
> >>> -				  vc4_vec_tv_modes[state->tv.mode].mode);
> >>> +	mode =3D drm_mode_duplicate(connector->dev, &drm_mode_480i);
> >>> +	if (!mode) {
> >>> +		DRM_ERROR("Failed to create a new display mode\n");
> >>> +		return -ENOMEM;
> >>> +	}
> >>> +
> >>> +	drm_mode_probed_add(connector, mode);
> >>> +
> >>> +	mode =3D drm_mode_duplicate(connector->dev, &drm_mode_576i);
> >>
> >> Maybe the mode that matches tv.norm should be marked as preferred so
> >> userspace knows which one to pick?
> >=20
> > I'm not sure how realistic that would be. Doing this based on the driver
> > / cmdline preference is going to be fairly easy, but then it's a
> > property, it's going to be updated, and we probably don't want to mess
> > around the mode flags based on new property values?
> >=20
>=20
> Strictly speaking we need to fire an event to userspace if the mode
> changes, and this is probably not straightforward to do underneath
> modeset locks, would probably need a worker.

I'm not sure this would work in all cases. Kodi for example doesn't
handle hotplug events at all, so we might end up in situations where the
state is not consistent anymore.

Even if we were to only expose one mode to the userspace, depending on
the current TV mode, userspace could still end up trying to push a mode
into KMS that isn't the one we expose anymore, so I'm not sure we can
solve this entirely.

> Clever userspace like GNOME will try to use the active mode, so it will
> handle this that way. If someone has set up the pipeline first that is.
> drm_client/fbdev and plymouth can do that because they honour userdef mod=
es.
>=20
> Other userspace that don't know the userdef flag will fallback to the
> first mode which is NTSC which is also the default tvmode, so maybe this
> is good enough. PAL users will have to specify the mode, or teach their
> program about the userdef flag.
>=20
> But ofc relying on the userdef flag depends on the fact that there's a
> mode on the kernel command line, but maybe there's no way to avoid that
> since much/most? userspace treat "unknown" connector status as
> disconnected so many will have to force the connector to "connected"
> anyway. At least I don't know any way to permanetly force the connector
> status other than using video=3D.

You can do it through sysfs as well, in .../status

Maxime

--uu4iphtbpnfop3qu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYwytgQAKCRDj7w1vZxhR
xdrUAP4k5/bAViOVsfkyqYMzYbFSqC3YumRaateY7yAcEsSePgEA8/P6xzOj3aWN
v+oUtOVIlchXHuCettlv2W7y1xCzCgs=
=mGM/
-----END PGP SIGNATURE-----

--uu4iphtbpnfop3qu--
