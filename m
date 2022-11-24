Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E25F6377F8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 12:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E114510E031;
	Thu, 24 Nov 2022 11:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7742D10E031;
 Thu, 24 Nov 2022 11:49:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C2B395802A8;
 Thu, 24 Nov 2022 06:49:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 24 Nov 2022 06:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1669290589; x=1669297789; bh=OHFx68nmnn
 /ceAUAI4qgZcV6iBa2E8isOTaxL9ONytc=; b=HJiPVgLyhrcSJIoI5oHBuPCtif
 7TkeOKloNPGFr9G7HpxETWIMqUwKFx7SL0JFIN+tCq7qTefMU73nDb1kgWY9jEvg
 jju8MAnU/W05uYdGIOo0suZbsbnlpf6AARruwbjhh7i0zHTNROi8w9fsLR+/J+uI
 f2k5Yn79Z5tPdt/6/Tx5DUQUAY3F5CNLACZt2EWIfOpA2BxKKAkED9sTiNGG8t9j
 Ox5M/iBawaCECjHYxKQvyUSfQyE/k6FerKXCxUwZkCogrOqHhSOaKWZH4RLP+9tU
 K9c2QGBt55ntYGJaWExIy1fpWtiPMjl7R3S+X29r22VUVBPgRlMssonXNFcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669290589; x=1669297789; bh=OHFx68nmnn/ceAUAI4qgZcV6iBa2
 E8isOTaxL9ONytc=; b=J0uwUwXhLVqUyKTozkwlimGquvlzDQkdPFAmgu6P/Gva
 zBEet87p11qgTrBX3XIePgLUa6o0iKWmbAijtdFm3m6jX3sFI2A+XANbsS1ziNUc
 lB1dYIjGgsVTV4IIPiOiEDdo72Kist/8YrNKcpBaW+cALs27xmBxozD8SL6UYZNs
 +PSczmcvdsS5ZGV6QwesmFhMwp3QdWmxb1SNwavWw6LKO74i71QmKgTebKxG2UrZ
 bivRxY+dD9UYez5vVu3mFzjEzKc3lHRmhR9f9T8XucrUoG0/WclxpqyBYZIRslpn
 HvOE5Y2B8QvhuF7QywZXFyxGQuKjkQUdc6NGRTprMg==
X-ME-Sender: <xms:XFp_YxcMrWb8n-7P5fAeiUYAsgh26CSiWBsgCf3KrLVVASwV4u0iUw>
 <xme:XFp_Y_PrtI9LCp8UWiNwOa49Qea0CFSD10inJjTBFPprJ2vvNM_wRZmpq4SL8m5tt
 sM5WCZDIZ5sSWH-AKA>
X-ME-Received: <xmr:XFp_Y6ggafGBm88t5XNCsk2-eoh9GC_OwW-s8w-5lBh1bq9dDqWfplLg7ibOTVoI0H_65Q4nKRdDkUOEjJ_-lxEvRwZlMZzfzdKhur7M7v13fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieefgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XFp_Y69D3UxIMiHcjBhcNgGcI_vtmaXUBKR1J3I1LFHX9YAowc5Z3w>
 <xmx:XFp_Y9vPnOgjw_XUJ0TgWbXcJMELQ1lNGpIcQBbNvNcSq2anOAWENg>
 <xmx:XFp_Y5HeTfb_pHMpSfPaCgvSzqwRBDN3n-KJSdN2d39Ch-L8LltJ2Q>
 <xmx:XVp_Y_vwd2w_-Jrg_wGS8bAYZv791C3i0PIK5SIB19VZ2BGQc-TwGQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Nov 2022 06:49:47 -0500 (EST)
Date: Thu, 24 Nov 2022 12:49:45 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>,	Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hans de Goede <hdegoede@redhat.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v10 00/19] drm: Analog TV Improvements
Message-ID: <20221124114945.oqilsc7zjth4jwso@houat>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
 <Y3uQbuQotGxh+XPS@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="apvrjccnplb3u7fu"
Content-Disposition: inline
In-Reply-To: <Y3uQbuQotGxh+XPS@phenom.ffwll.local>
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


--apvrjccnplb3u7fu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2022 at 03:51:26PM +0100, Daniel Vetter wrote:
> On Thu, Nov 17, 2022 at 10:28:43AM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > Here's a series aiming at improving the command line named modes suppor=
t,
> > and more importantly how we deal with all the analog TV variants.
> >=20
> > The named modes support were initially introduced to allow to specify t=
he
> > analog TV mode to be used.
> >=20
> > However, this was causing multiple issues:
> >=20
> >   * The mode name parsed on the command line was passed directly to the
> >     driver, which had to figure out which mode it was suppose to match;
> >=20
> >   * Figuring that out wasn't really easy, since the video=3D argument o=
r what
> >     the userspace might not even have a name in the first place, but
> >     instead could have passed a mode with the same timings;
> >=20
> >   * The fallback to matching on the timings was mostly working as long =
as
> >     we were supporting one 525 lines (most likely NSTC) and one 625 lin=
es
> >     (PAL), but couldn't differentiate between two modes with the same
> >     timings (NTSC vs PAL-M vs NSTC-J for example);
> >=20
> >   * There was also some overlap with the tv mode property registered by
> >     drm_mode_create_tv_properties(), but named modes weren't interacting
> >     with that property at all.
> >=20
> >   * Even though that property was generic, its possible values were
> >     specific to each drivers, which made some generic support difficult.
> >=20
> > Thus, I chose to tackle in multiple steps:
> >=20
> >   * A new TV mode property was introduced, with generic values, each dr=
iver
> >     reporting through a bitmask what standard it supports to the usersp=
ace;
> >=20
> >   * This option was added to the command line parsing code to be able to
> >     specify it on the kernel command line, and new atomic_check and res=
et
> >     helpers were created to integrate properly into atomic KMS;
> >=20
> >   * The named mode parsing code is now creating a proper display mode f=
or
> >     the given named mode, and the TV standard will thus be part of the
> >     connector state;
> >=20
> >   * Two drivers were converted and tested for now (vc4 and sun4i), with
> >     some backward compatibility code to translate the old TV mode to the
> >     new TV mode;
> >=20
> > Unit tests were created along the way.
> >=20
> > One can switch from NTSC to PAL now using (on vc4)
> >=20
> > modetest -M vc4  -s 53:720x480i -w 53:'TV mode':1 # NTSC
> > modetest -M vc4  -s 53:720x576i -w 53:'TV mode':4 # PAL
> >=20
> > Let me know what you think,
> > Maxime
>=20
> Maxime asked me to drop an Ack-in-principle on this, and I'm not sure I
> have any useful input here with my utter lack of understanding for TV
> things (I never even had one in my entire life, that's how much I don't
> care). But it seems to check all the design boxes around solving annoying
> uapi/kms-config issues properly, so
>=20
> Acked-in-principle-or-something-like-that-by: Daniel Vetter <daniel.vette=
r@ffwll.ch>

Thanks!

I jumped the gun a bit too fast and forgot to amend the TV property
commit message before pushing it out.

For the record though, that property is usable through xrandr, xorg.conf
or any equivalent compositor mechanism

Maxime

--apvrjccnplb3u7fu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY39aWQAKCRDj7w1vZxhR
xacgAP9NPkwQFyz0CvvFS5SzvELVnj6t9GBuTq/qrHpTLaRyaAD9GJpLyjLeg7Jy
Z0pnBngL2vXGtvYVUCMQy5VhVkMtuAg=
=fhxt
-----END PGP SIGNATURE-----

--apvrjccnplb3u7fu--
