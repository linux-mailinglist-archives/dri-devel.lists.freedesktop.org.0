Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 765545A5E15
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 10:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FBF10EC02;
	Tue, 30 Aug 2022 08:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB13310EC48
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 08:30:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 463805802C7;
 Tue, 30 Aug 2022 04:30:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 30 Aug 2022 04:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661848234; x=1661855434; bh=4FUstz1Bdi
 VLP6X4LQhEKrnrrNlVhEnXxEPj4uh/Uzc=; b=IwLeeCxHNRnnHplBJu0uEHdvBM
 aTXoBi+yXbvI1LRc1fjNBjfcVSdO/hdeATXGukUSmaY+CVsFuj+TL0LGx9JwwH6X
 ruDV2qvOwgNN8CaCjJVUnhzSXPtsF4mYoU32TF1G1zEDrUMstky99Zls/qtiRLlp
 vv3qb3dV+dXuSuvOR+mGjWCUEBSf++O3L+VjhmGmvOPZOvqNztvcAto4U+DwvJHN
 tqvHCuUjkPNExJKVizhc+vfaOLhrQfzbayzK0rS3VENI1jv8wSyTrFHDfanT7Mea
 KA9iUR1eMVX1uYIE6eNmLRV9OZGrCkdu1Rsjl+6UlDPhKg81hscFVpwnytSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661848234; x=1661855434; bh=4FUstz1BdiVLP6X4LQhEKrnrrNlV
 hEnXxEPj4uh/Uzc=; b=VY1TwponrynsBGb2Snb/BnT4rJ9pJQhDKxd78cdIbUX9
 6AxFqi7dRDzyAYcvj5HtMBKVhKUvl4W0TexfsYxn8V+xFBtHJEslz2LNvzttkFsH
 /6Pi1kWvB/2gY8+kKcCJSWFDnJHk6Zj9joSEwfldwv6IXEAlxNcDSwdZRYZVd/Oj
 M1AxJ4MSE7H5rO+anPZH6Ipafz8iUxQkpOvd6l+++sRSrZ3/ceLVQQZKZ1Wqjgko
 adCpQ1ir2EaVLWlhLSipPArFb+2WFsyCv9OcH7VGySo7bMxpXRCHyEYkte5mO9FM
 9OZRQ8OpQbv/buBYNMxNNd8RpDdUm8cctKGuGh3tuQ==
X-ME-Sender: <xms:qcoNYwawP1IXm3fK0yP5jIgva-SrXuCVr3NTEC2ugz4C-wkPIv8FfA>
 <xme:qcoNY7Zywf4imp57iJHNpz4v_t0D_ZueD5CSc5PgrSSbZqN1ONdHebkTTWsbLMLy9
 L0MDFC0F7OPrQhXUTA>
X-ME-Received: <xmr:qcoNY6-zldDE4xfplIzn_iqdhrG2YgeLzyJhQ7dwPHpiWJ-XAu50dlBMJek>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekfedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeftdejhfekgfduvddvgeevffeiveffteehgedtjeelfeduueeuhfekjefh
 hffgffenucffohhmrghinhepmhgrgidrlhhotggrlhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qcoNY6onZPviIhwSYvBeRKcG6o_HyOB_7VUs5qJTBcvfqTsSqHPaTQ>
 <xmx:qcoNY7pjQz4HVW1I7ePRGqWGCYVFV3KY73QTcSDGxsxn40UVXX7KLQ>
 <xmx:qcoNY4QuqcqbOIu9G-PHQ8wW9uvJ6fihdnYWwavt2xeqOYSWkXDrjg>
 <xmx:qsoNY-XFNnJ7L38ytACCjp3Se_yk12cV6NtY0McxE-kxiWUyyTmSTA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Aug 2022 04:30:32 -0400 (EDT)
Date: Tue, 30 Aug 2022 10:30:27 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH v2 01/41] drm/tests: Order Kunit tests in Makefile
Message-ID: <20220830083027.4iyi2s5r5bto4h2e@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-1-459522d653a7@cerno.tech>
 <f6289e5d-98e3-1a0d-f514-136e2b7978c1@tronnes.org>
 <20220829190242.tk2hinttzzmzhnaj@meerkat.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d3pufob2ilu477zw"
Content-Disposition: inline
In-Reply-To: <20220829190242.tk2hinttzzmzhnaj@meerkat.local>
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
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--d3pufob2ilu477zw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

On Mon, Aug 29, 2022 at 03:02:42PM -0400, Konstantin Ryabitsev wrote:
> On Mon, Aug 29, 2022 at 08:46:42PM +0200, Noralf Tr=F8nnes wrote:
> > Something has gone wrong with this patchset, there are double line endi=
ngs.
>=20
> I noticed this, too, and I think the reason is because these patches were
> generated with "b4 send -o", but actually sent using git-send-email. It's=
 not
> a use-case I've considered (or tested) and the breakage is because when b4
> generates patches with "-o", they are written with CRLF line endings, whi=
ch is
> not something git-send-email expects.

You're right

> Maxime, any reason you went this direction instead of just letting b4 send
> these patches directly?

For some reason, b4 send doesn't work for my setup and I haven't had the
time to look into why and let you know.

Whenever I used b4 send (on this series for example) I get:

$ b4 send
Converted the branch to 41 patches
Populating the To: and Cc: fields with automatically collected addresses
Invoking get_maintainer.pl for To: addresses
Invoking get_maintainer.pl for Cc: addresses
Will send the following messages:
---
To: David Airlie <airlied@linux.ie>
    Daniel Vetter <daniel@ffwll.ch>
    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Maxime Ripard <mripard@kernel.org>
    Thomas Zimmermann <tzimmermann@suse.de>
    Noralf Tr=F8nnes <noralf@tronnes.org>
    Emma Anholt <emma@anholt.net>
    Ben Skeggs <bskeggs@redhat.com>
    Karol Herbst <kherbst@redhat.com>
    Lyude Paul <lyude@redhat.com>
    Jani Nikula <jani.nikula@linux.intel.com>
    Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Rodrigo Vivi <rodrigo.vivi@intel.com>
    Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
    Chen-Yu Tsai <wens@csie.org>
    Jernej Skrabec <jernej.skrabec@gmail.com>
    Samuel Holland <samuel@sholland.org>
    Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org
    linux-kernel@vger.kernel.org
    nouveau@lists.freedesktop.org
    intel-gfx@lists.freedesktop.org
    linux-arm-kernel@lists.infradead.org
    linux-sunxi@lists.linux.dev
    Dom Cobley <dom@raspberrypi.com>
    Maxime Ripard <maxime@cerno.tech>
    Geert Uytterhoeven <geert@linux-m68k.org>
    Hans de Goede <hdegoede@redhat.com>
    Dave Stevenson <dave.stevenson@raspberrypi.com>
    Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
    Phil Elwell <phil@raspberrypi.com>
---
  [PATCH v2 00/41] drm: Analog TV Improvements
  [PATCH v2 01/41] drm/tests: Order Kunit tests in Makefile
  [PATCH v2 02/41] drm/tests: Add Kunit Helpers
  [PATCH v2 03/41] drm/atomic-helper: Rename drm_atomic_helper_connector_tv=
_reset to avoid ambiguity
  [PATCH v2 04/41] drm/connector: Rename subconnector state variable
  [PATCH v2 05/41] drm/atomic: Add TV subconnector property to get/set_prop=
erty
  [PATCH v2 06/41] drm/connector: Rename legacy TV property
  [PATCH v2 07/41] drm/connector: Only register TV mode property if present
  [PATCH v2 08/41] drm/connector: Rename drm_mode_create_tv_properties
  [PATCH v2 09/41] drm/connector: Add TV standard property
  [PATCH v2 10/41] drm/modes: Add a function to generate analog display mod=
es
  [PATCH v2 11/41] drm/modes: Only consider bpp and refresh before options
  [PATCH v2 12/41] drm/modes: parse_cmdline: Add support for named modes co=
ntaining dashes
  [PATCH v2 13/41] drm/client: Add some tests for drm_connector_pick_cmdlin=
e_mode()
  [PATCH v2 14/41] drm/modes: Move named modes parsing to a separate functi=
on
  [PATCH v2 15/41] drm/modes: Switch to named mode descriptors
  [PATCH v2 16/41] drm/modes: Fill drm_cmdline mode from named modes
  [PATCH v2 17/41] drm/connector: Add pixel clock to cmdline mode
  [PATCH v2 18/41] drm/connector: Add a function to lookup a TV mode by its=
 name
  [PATCH v2 19/41] drm/modes: Introduce the tv_mode property as a command-l=
ine option
  [PATCH v2 20/41] drm/modes: Properly generate a drm_display_mode from a n=
amed mode
  [PATCH v2 21/41] drm/modes: Introduce more named modes
  [PATCH v2 22/41] drm/atomic-helper: Add a TV properties reset helper
  [PATCH v2 23/41] drm/atomic-helper: Add an analog TV atomic_check impleme=
ntation
  [PATCH v2 24/41] drm/vc4: vec: Remove empty mode_fixup
  [PATCH v2 25/41] drm/vc4: vec: Convert to atomic helpers
  [PATCH v2 26/41] drm/vc4: vec: Refactor VEC TV mode setting
  [PATCH v2 27/41] drm/vc4: vec: Remove redundant atomic_mode_set
  [PATCH v2 28/41] drm/vc4: vec: Fix timings for VEC modes
  [PATCH v2 29/41] drm/vc4: vec: Switch for common modes
  [PATCH v2 30/41] drm/vc4: vec: Fix definition of PAL-M mode
  [PATCH v2 31/41] drm/vc4: vec: Use TV Reset implementation
  [PATCH v2 32/41] drm/vc4: vec: Convert to the new TV mode property
  [PATCH v2 33/41] drm/vc4: vec: Add support for more analog TV standards
  [PATCH v2 34/41] drm/sun4i: tv: Remove unused mode_valid
  [PATCH v2 35/41] drm/sun4i: tv: Convert to atomic hooks
  [PATCH v2 36/41] drm/sun4i: tv: Merge mode_set into atomic_enable
  [PATCH v2 37/41] drm/sun4i: tv: Remove useless function
  [PATCH v2 38/41] drm/sun4i: tv: Remove useless destroy function
  [PATCH v2 39/41] drm/sun4i: tv: Rename error label
  [PATCH v2 40/41] drm/sun4i: tv: Add missing reset assertion
  [PATCH v2 41/41] drm/sun4i: tv: Convert to the new TV mode property
---
Press Enter to send or Ctrl-C to abort
  [PATCH v2 00/41] drm: Analog TV Improvements
  [PATCH v2 01/41] drm/tests: Order Kunit tests in Makefile
  [PATCH v2 02/41] drm/tests: Add Kunit Helpers
  [PATCH v2 03/41] drm/atomic-helper: Rename drm_atomic_helper_connector_tv=
_reset to avoid ambiguity
  [PATCH v2 04/41] drm/connector: Rename subconnector state variable
  [PATCH v2 05/41] drm/atomic: Add TV subconnector property to get/set_prop=
erty
  [PATCH v2 06/41] drm/connector: Rename legacy TV property
  [PATCH v2 07/41] drm/connector: Only register TV mode property if present
  [PATCH v2 08/41] drm/connector: Rename drm_mode_create_tv_properties
  [PATCH v2 09/41] drm/connector: Add TV standard property
  [PATCH v2 10/41] drm/modes: Add a function to generate analog display mod=
es
  [PATCH v2 11/41] drm/modes: Only consider bpp and refresh before options
  [PATCH v2 12/41] drm/modes: parse_cmdline: Add support for named modes co=
ntaining dashes
  [PATCH v2 13/41] drm/client: Add some tests for drm_connector_pick_cmdlin=
e_mode()
  [PATCH v2 14/41] drm/modes: Move named modes parsing to a separate functi=
on
  [PATCH v2 15/41] drm/modes: Switch to named mode descriptors
  [PATCH v2 16/41] drm/modes: Fill drm_cmdline mode from named modes
  [PATCH v2 17/41] drm/connector: Add pixel clock to cmdline mode
  [PATCH v2 18/41] drm/connector: Add a function to lookup a TV mode by its=
 name
  [PATCH v2 19/41] drm/modes: Introduce the tv_mode property as a command-l=
ine option
  [PATCH v2 20/41] drm/modes: Properly generate a drm_display_mode from a n=
amed mode
  [PATCH v2 21/41] drm/modes: Introduce more named modes
  [PATCH v2 22/41] drm/atomic-helper: Add a TV properties reset helper
  [PATCH v2 23/41] drm/atomic-helper: Add an analog TV atomic_check impleme=
ntation
  [PATCH v2 24/41] drm/vc4: vec: Remove empty mode_fixup
  [PATCH v2 25/41] drm/vc4: vec: Convert to atomic helpers
  [PATCH v2 26/41] drm/vc4: vec: Refactor VEC TV mode setting
  [PATCH v2 27/41] drm/vc4: vec: Remove redundant atomic_mode_set
  [PATCH v2 28/41] drm/vc4: vec: Fix timings for VEC modes
  [PATCH v2 29/41] drm/vc4: vec: Switch for common modes
  [PATCH v2 30/41] drm/vc4: vec: Fix definition of PAL-M mode
  [PATCH v2 31/41] drm/vc4: vec: Use TV Reset implementation
  [PATCH v2 32/41] drm/vc4: vec: Convert to the new TV mode property
  [PATCH v2 33/41] drm/vc4: vec: Add support for more analog TV standards
  [PATCH v2 34/41] drm/sun4i: tv: Remove unused mode_valid
  [PATCH v2 35/41] drm/sun4i: tv: Convert to atomic hooks
  [PATCH v2 36/41] drm/sun4i: tv: Merge mode_set into atomic_enable
  [PATCH v2 37/41] drm/sun4i: tv: Remove useless function
  [PATCH v2 38/41] drm/sun4i: tv: Remove useless destroy function
  [PATCH v2 39/41] drm/sun4i: tv: Rename error label
  [PATCH v2 40/41] drm/sun4i: tv: Add missing reset assertion
  [PATCH v2 41/41] drm/sun4i: tv: Convert to the new TV mode property
Connecting to /home/max/.local/bin/msmtpq:0
Failed to configure the smtp connection:
[Errno -2] Name or service not known

msmtpq is basically a sendmail-like tool to queue the mails if the
machine is offline. It is setup in my git config as
sendemail.smtpserver.

git-send-email works just fine, but somehow b4 send fails. I think it's
due to cmd_send calling b4.get_smtp() and expecting to get some
credentials out of it?

Maxime

--d3pufob2ilu477zw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYw3KowAKCRDj7w1vZxhR
xaIZAP42+l/5+Eqvr3A62fk6KM1Kbbg5h0I1Z6ZpYaKL2WMNSwEAs+r4YZvtTzHT
3urI7OZ931zTG5k+e3FRpMF2caXz1ws=
=nwvM
-----END PGP SIGNATURE-----

--d3pufob2ilu477zw--
