Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 954C8595D1A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 15:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4604114B085;
	Tue, 16 Aug 2022 13:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2192014B085
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 13:20:45 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 402C058037D;
 Tue, 16 Aug 2022 09:20:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 16 Aug 2022 09:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660656045; x=1660663245; bh=U+FP9WL6qH
 xAhIYTKKc2LvJDq7iEJgXc9SQbodiDDXA=; b=kJHgvO1K5X0yS0bXTChkquj0OR
 RCqHnNc0XBPUm3z7/WQdy5I5PLYVzPHjIdS5OZOIuEfLDyIsD/C1uGYVV4cetvIs
 NsNprQ8/ltFMmNqACY4L2Jamw1Py44t1jUjVCUbu3ecCRSBcBlyesR77IMVtD3GL
 SxHtV5HQm3W3GBPzXNqyOEqrCgE2IHdxTFkTqsg7u0lV6SIF76nj4n6KjfHuXVrH
 x6d5n9FNGnDfaHYc1nVkvD/70S6O6AFqXgmPtrrNJDbBJd29vEGJgEHb0Fse3hFc
 yxmEYL9ytZDahmeoSvWgVNvlo9jeUIVbP+yYD9iXbfqj8Aca5A8/jhCzZdPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660656045; x=1660663245; bh=U+FP9WL6qHxAhIYTKKc2LvJDq7iE
 JgXc9SQbodiDDXA=; b=Tc31jgiKV5ovT3ovNozG+Pnm++oNgJ4zTUPLNWDit1I9
 Hvxm1aapLTpKhJILH2PqTF0YmOH4MSHwgLDInaTkSjvtt3JFSNw/86LLTGvvRW51
 3I8JQa9ZdbNlV5G10yeloK2aMT/VfzQuZ7kqiUJAPrVvfpvVCSs3ZaELCQzkIdGC
 RCJh9y7jbBzlWjE9TD/r/NtpgnNJDGZiidnMkodJVlf41Iw35XEBS+C4H8z1sL6f
 hjSWjlTnKjEV6X8NnPtcusvXvvMbcLZGOZXeCV4ILTH+fnQdUlqrx2eICkmp4464
 JVNvn6zDFQMJ1tU5vS+lnIV6tJFYHdUIFzr2g+CO7w==
X-ME-Sender: <xms:q5n7Yj9umwrX7oVw9UghmxD4i7MGuJvny9AfymC_b-hQUPYCdeX78g>
 <xme:q5n7YvumRLVde5YnKu_WeSjfYdYqZtjgvT6uWTriXiCFd4xFnkXY8yhIRlz1YB6NT
 16KkFKUBr2YqO1vSTo>
X-ME-Received: <xmr:q5n7YhDzBG2aG79HV1UbRHQZVoQwoQbTDeSO_zfoB4AgJmcZveOVY1EGvbc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:q5n7YvdJHxWnNwnbPCPdD9m9OiPE6vQw37M5kLxLNBJQ7ClvMEOmEA>
 <xmx:q5n7YoMsvrihcmnmoa_Ax-aiS1fWIbTnQ9BZ48X3-QIUVWnh0z31HQ>
 <xmx:q5n7YhlCoaiIGJifTn0HQnb5FLP_E2e8paJHarllCzQBxQTIJxax6Q>
 <xmx:rZn7Yv-TN8-6TSqsBSP7TZQKK5gZIvDf7lWQFpnazpZNkrC89JOgQg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 09:20:42 -0400 (EDT)
Date: Tue, 16 Aug 2022 15:20:40 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220816132040.uwirtjm5yr6rdd3q@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6ena3yqc72sajvcu"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6ena3yqc72sajvcu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Aug 12, 2022 at 03:25:18PM +0200, Geert Uytterhoeven wrote:
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -1649,11 +1650,40 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_propert=
ies);
> >   * 0 on success or a negative error code on failure.
> >   */
> >  int drm_mode_create_tv_properties(struct drm_device *dev,
> > +                                 unsigned int supported_tv_norms,
> >                                   unsigned int num_modes,
> >                                   const char * const modes[])
> >  {
> > +       static const struct drm_prop_enum_list tv_norm_values[] =3D {
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_443) - 1, "NTSC-4=
43" },
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_J) - 1, "NTSC-J" =
},
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_M) - 1, "NTSC-M" =
},
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_60) - 1, "PAL-60" =
},
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_B) - 1, "PAL-B" },
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_D) - 1, "PAL-D" },
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_G) - 1, "PAL-G" },
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_H) - 1, "PAL-H" },
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_I) - 1, "PAL-I" },
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_M) - 1, "PAL-M" },
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_N) - 1, "PAL-N" },
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_NC) - 1, "PAL-Nc" =
},
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_60) - 1, "SECAM-=
60" },
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_B) - 1, "SECAM-B=
" },
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_D) - 1, "SECAM-D=
" },
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_G) - 1, "SECAM-G=
" },
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K) - 1, "SECAM-K=
" },
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K1) - 1, "SECAM-=
K1" },
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_L) - 1, "SECAM-L=
" },
>=20
> The above are analog standards, with a variable horizontal resolution.
>=20
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD480I) - 1, "hd480i" =
},
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD480P) - 1, "hd480p" =
},
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD576I) - 1, "hd576i" =
},
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD576P) - 1, "hd576p" =
},
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD720P) - 1, "hd720p" =
},
> > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD1080I) - 1, "hd1080i=
" },
>=20
> The above are digital standards, with a fixed resolution.

Are they?

It's not clear to me from looking at nouveau, but I was under the
impression that they were modes for a component output, so CEA 770.3. I
don't have the spec though, so I can't check.

> You seem to have missed "hd1080p"?

Nobody is using it. If we ever have a driver that uses it I think we can
add it.

> In addition, "hd720p", "hd080i", and "hd1080p" are available in both 50
> and 60 (actually 59.94) Hz, while "hd1080p" can also use 24 or 25 Hz.

It looks like nouveau only exposes modes for 480p at 59.94Hz, 576p at
50Hz, 720p at 60Hz, 1080i at 30Hz.

> Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> handle them through "@<refresh>".  The latter would impact "[PATCH v1
> 09/35] drm/modes: Move named modes parsing to a separate function", as
> currently a named mode and a refresh rate can't be specified both.

I think the former would make more sense. It simplifies a bit the
parser, and we're going to use a named mode anyway.

> As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> command-line option" uses a separate "tv_mode" option, and not the main
> mode name, I think you want to add them here.

It's a separate story I think, we could have a named mode hd720p50,
which would be equivalent to 1280x720,tv_mode=3Dhd720p

Maxime

--6ena3yqc72sajvcu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvuZqAAKCRDj7w1vZxhR
xRpdAQCdHo+W59CWD9zJ3T1LvoCmG3uMcVuRQ9G79/cpqOxH9wEAhPrjIiW5PuV0
9yKEPpR9rUmMFVvJOYSKOJ0j4md2bQE=
=XiNC
-----END PGP SIGNATURE-----

--6ena3yqc72sajvcu--
