Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E270622A2D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 12:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB72C10E599;
	Wed,  9 Nov 2022 11:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A5410E593;
 Wed,  9 Nov 2022 11:18:47 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 49C755803FC;
 Wed,  9 Nov 2022 06:18:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 09 Nov 2022 06:18:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667992727; x=
 1667999927; bh=cpSERR+FK9P7ebGFjATnLVrDN6DOeEdblTQYZr4G17o=; b=T
 Fl+QG10PPJjyqbLv7utqEfzNtwLor8oEF2yTMFmRZHKm4urXSwwwtVVoJls3ijLN
 TZGwJSryG3lX2kfJo1LkfWBvNtXl25oDLriO6JyPMx/Zsocv8wuDzRVJB+jqy07g
 QUOSBrMSfrge6LynWHCWE1/lV1yjZbK4yTuD1oMGOnBBq+3FWpOwfmhA2BvIWQpG
 RAos1g98wq13r4iAbQU5ThqHpZt4x8tDRQXVhs20koBVF6zKRbK3XruwKa6T445f
 UPJdRxk9PEJ1mjmw8VS4TxBh1ILLkI+NXFpGCoD5j1H5KRDBJ3PCaJ/0yprraXIE
 ilDIlX626Xe9eToZoG2gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667992727; x=
 1667999927; bh=cpSERR+FK9P7ebGFjATnLVrDN6DOeEdblTQYZr4G17o=; b=d
 uMtVZ+5DS4SQSD5wEMQmNSkiNMJP4Co4dFNFStkseeS8p6I8UchUdcqGmSsvgGxC
 4RZ6bcMdPuRLTA0BWbDhBAIt51NSpFXgMJ0eanp/yx4/cXLpRy45fJbbaEZ3G/4M
 iyqTG3rDfQMqN7xTZBwZggU2VIS0IBURZBB1lbrHL5jFf6ZZEYfn3gt2dVU3Yeol
 lcGQZL/uLfEmt35zmb9Tderps113BIXOMqQVwSxyL3x8oBdo8StWUaW3xV1L2m4n
 hBePcSN+Xldp9A/ERXwotiMGuXGFHEzOg6uM3w/4xD0dZGkID2FivMHmtWBOPdAk
 Rn/JJK1MJS1fA5u29rNGQ==
X-ME-Sender: <xms:loxrY9oZHofVYB-XITEGN540BXn7pdvAyb5HkRRVKuV3-_D4Xzj-Hw>
 <xme:loxrY_r5-Lu6Z4t1A-I9XxNLKGKm-cT-eCy5G1dpRG_dPbAjGCTszNZDtepV6wR2y
 SY6pnM7gNlJcvOyxd0>
X-ME-Received: <xmr:loxrY6Njce8GL4jAYU64mlkMvvlyt7WLUOgcDNj2a1d3upVMYv2KDd3GcN-h64BD9s_pgj3yUaqd_isIGMG4RtWhA7NNcsKwiYBA-tvWILfBmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedvgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelleefieelleetteefvdeikeeffeffvefhtdevgfehveduveehjedvvdei
 ledtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:loxrY45K80tENQh_C6tjaEJy5Ie2cIxYtI6F2TIPDgsBNFBXs67_Bg>
 <xmx:loxrY84Wvga5rc9l7qft3Ey8wYUNXaoQBGxcLU3HE_MljYGRvmVPEw>
 <xmx:loxrYwhmO9Kg4ZdVH8zb01YUd34dgerunTXO7GxTtjsiArzFIAMChQ>
 <xmx:l4xrY7bZZgCF33vaGgYE9or8bPnfheqAYCo2-vxIFb7wkj-JYmjgsg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Nov 2022 06:18:45 -0500 (EST)
Date: Wed, 9 Nov 2022 12:18:43 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: kfyatek+publicgit@gmail.com
Subject: Re: [PATCH v7 15/23] drm/modes: Introduce more named modes
Message-ID: <20221109111843.jkufdneexakofa4p@houat>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <20220728-rpi-analog-tv-properties-v7-15-7072a478c6b3@cerno.tech>
 <262f0953-1e05-e68e-3e96-2ac2132a1e57@tronnes.org>
 <ba532387-6329-c57a-1fa2-627b2cf40281@tronnes.org>
 <b6b7c689-a50f-cd63-7e48-8739b0d91e61@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b6b7c689-a50f-cd63-7e48-8739b0d91e61@gmail.com>
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

On Tue, Nov 08, 2022 at 10:27:17PM +0100, Mateusz Kwiatkowski wrote:
> Hi Noralf,
>=20
> W dniu 8.11.2022 o 10:38, Noralf Tr=F8nnes pisze:
> >
> > Den 07.11.2022 19.03, skrev Noralf Tr=F8nnes:
> >>
> >> Den 07.11.2022 15.16, skrev Maxime Ripard:
> >>> Now that we can easily extend the named modes list, let's add a few m=
ore
> >>> analog TV modes that were used in the wild, and some unit tests to ma=
ke
> >>> sure it works as intended.
> >>>
> >>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>>
> >>> ---
> >>> Changes in v6:
> >>> - Renamed the tests to follow DRM test naming convention
> >>>
> >>> Changes in v5:
> >>> - Switched to KUNIT_ASSERT_NOT_NULL
> >>> ---
> >>>  drivers/gpu/drm/drm_modes.c                     |  2 +
> >>>  drivers/gpu/drm/tests/drm_client_modeset_test.c | 54 +++++++++++++++=
++++++++++
> >>>  2 files changed, 56 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> >>> index 49441cabdd9d..17c5b6108103 100644
> >>> --- a/drivers/gpu/drm/drm_modes.c
> >>> +++ b/drivers/gpu/drm/drm_modes.c
> >>> @@ -2272,7 +2272,9 @@ struct drm_named_mode {
> >>> =20
> >>>  static const struct drm_named_mode drm_named_modes[] =3D {
> >>>  	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MO=
DE_TV_MODE_NTSC),
> >>> +	NAMED_MODE("NTSC-J", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_=
MODE_TV_MODE_NTSC_J),
> >>>  	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE, DRM_MOD=
E_TV_MODE_PAL),
> >>> +	NAMED_MODE("PAL-M", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_M=
ODE_TV_MODE_PAL_M),
> >>>  };
> >> I'm now having second thoughts about the tv_mode commandline option. C=
an
> >> we just add all the variants to this table and drop the tv_mode option?
> >> IMO this will be more user friendly and less confusing.
> >>
> > One downside of this is that it's not possible to force connector status
> > when using named modes, but I think it would be better to have a force
> > option than a tv_mode option. A lot of userspace treats unknown status
> > as disconnected.
> >
> > Anyone know if it's possible to set the connector status sysfs file
> > using a udev rule?
> >
> > Noralf.
>=20
> I think that leaving named modes only would be a bit limiting. There are =
use
> cases for custom modes, e.g. we might want progressive 240p "NTSC" (like =
80s/90s
> home computers and video game consoles) or the modes with non-13.5MHz pix=
el
> clock that Geert requested with Amiga in mind.

Yeah, it was one of the early requirements that we would be allowed to
fill in any analog mode on the command line, so just having the named
modes with the 480i and 576i modes won't really work for that.

> I'm not sure if the current cmdline-to-drm_mode conversion is flexible en=
ough
> to meaningfully facilitate those, but we're at least getting the syntax d=
own.

It might require a bit of plumbing to get
drm_mode_create_from_cmdline_mode() to add the mode if tv_mode_specified
is set, but it's probably it.

Maxime
