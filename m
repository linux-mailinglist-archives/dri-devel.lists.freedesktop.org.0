Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26E9886AC4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 11:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5B010F360;
	Fri, 22 Mar 2024 10:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WpA6X1Lo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EEF10F358
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 10:57:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E9D3A6120C;
 Fri, 22 Mar 2024 10:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45857C433F1;
 Fri, 22 Mar 2024 10:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711105076;
 bh=nlaETEiIGQ2eTWX7oKqL74fXDifhnhPwROBUgVdqU3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WpA6X1LoXT1snLrEBUrv47M4O+WPR1M1LSXUKZTKa7BviiI5MfgnUuEJ6uLymJngV
 SvMs2KzBEf1XJrTAdpCwLwLzsvO6rZP4C/Mup2j5bb50a7peYF5b9rigdIigmfJTCw
 x22flsf8LNzqlu2TPnGKoHlzRXcnvy7/kbFaAzWZj1PY2xlXBDWtIiKQ5LpjhGFWGb
 zDPPY1CKcX0T1MKMmwwyc+j6Oy/g+LisuATN6Lqd7NeaeWrYlv6xV9DLxeC+JMwXwj
 F9oaSkOyNOe5SCtc35wwS5an8ku2gHo6udRMm55JpxeArLi6VkFSW/wVgqvm4BFlVs
 5spXkcfvxXDNQ==
Date: Fri, 22 Mar 2024 11:57:53 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [v10,20/27] drm/connector: hdmi: Add Infoframes generation
Message-ID: <20240322-petite-fabulous-bustard-b168ec@houat>
References: <20240321-kms-hdmi-connector-state-v10-20-e6c178361898@kernel.org>
 <07125064-2a78-4515-bb48-655f2aec140f@linux.dev>
 <87sf0iliyh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jkqjvw553wk4yfqo"
Content-Disposition: inline
In-Reply-To: <87sf0iliyh.fsf@intel.com>
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


--jkqjvw553wk4yfqo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 11:22:14AM +0200, Jani Nikula wrote:
> On Fri, 22 Mar 2024, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> > Hi,
> >
> >
> > On 2024/3/21 23:29, Maxime Ripard wrote:
> >> Infoframes in KMS is usually handled by a bunch of low-level helpers
> >> that require quite some boilerplate for drivers. This leads to
> >> discrepancies with how drivers generate them, and which are actually
> >> sent.
> >>
> >> Now that we have everything needed to generate them in the HDMI
> >> connector state, we can generate them in our common logic so that
> >> drivers can simply reuse what we precomputed.
> >>
> >> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> >> ---
> >>   drivers/gpu/drm/Kconfig                            |   1 +
> >>   drivers/gpu/drm/drm_atomic_state_helper.c          | 338 +++++++++++=
++++++++++
> >>   drivers/gpu/drm/drm_connector.c                    |  14 +
> >>   .../gpu/drm/tests/drm_atomic_state_helper_test.c   |   1 +
> >>   drivers/gpu/drm/tests/drm_connector_test.c         |  12 +
> >>   include/drm/drm_atomic_state_helper.h              |   8 +
> >>   include/drm/drm_connector.h                        | 109 +++++++
> >>   7 files changed, 483 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> >> index 16029435b750..3d3193c7aa5f 100644
> >> --- a/drivers/gpu/drm/Kconfig
> >> +++ b/drivers/gpu/drm/Kconfig
> >> @@ -97,10 +97,11 @@ config DRM_KUNIT_TEST
> >>   	  If in doubt, say "N".
> >>  =20
> >>   config DRM_KMS_HELPER
> >>   	tristate
> >>   	depends on DRM
> >> +	select DRM_DISPLAY_HDMI_HELPER
> >
> > Should we select DRM_DISPLAY_HELPER here? Otherwise there will have som=
e compile error
> > emerged with default config.
>=20
> Can we stop abusing select instead of adding more selects to paper over
> the issues?
>=20
> Use select only for non-visible symbols (no prompts anywhere) and for
> symbols with no dependencies.

I don't really have an opinion there, but it looks like all the other
helpers Kconfig symbols are using select everywhere, and I don't really
see how we could turn them into visible symbols with depends on without
breaking a number of defconfig.

Could you expand a bit what you have in mind here?

Maxime

--jkqjvw553wk4yfqo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZf1kMQAKCRDj7w1vZxhR
xc/HAQDR4BAgJekMdSngCGLSGAIwvYKEqlQRiRUN6fMwNgtn8AD/ZP+T1gMMLHE4
j3QwJraA/yFE8keMCRsPbgZVFnq1UQk=
=gyOa
-----END PGP SIGNATURE-----

--jkqjvw553wk4yfqo--
