Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B98B37FF6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 12:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BA510E0C8;
	Wed, 27 Aug 2025 10:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HFy+Se5W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A3310E0C8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 10:34:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5025040326;
 Wed, 27 Aug 2025 10:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC67EC4CEEB;
 Wed, 27 Aug 2025 10:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756290889;
 bh=Q2sSwP1/41l5/XIvaL0FNTZuZRKx/B8N75V9lo4IJh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HFy+Se5We6D2ibfp6UeU4x2eVucgdSojGUL3gJeaGcNluTOxunIf70xtIkp8ElZOM
 BthKvzB8mtdCmmIZX10kwsCe0rhDMtVf6zRCQ4UOdWapx7rAx6X5RHzxMOdciJb6qE
 kbSU5Yw9bnzlAMX2lmwraifm/EjZ6j8VejINig0OX2RKSud1qN+dYXyppvoeeyzmSY
 /s34aYKn022e86ZZMilP0Xed8k4xgTUFGk2an0m0bBJQqi3vmEbD/b7DbzeI/XFmZd
 J2F8Ic6qQCWCJehBy8qDex57VTx1PiG18zrGzk5Jw4zIQwa/BbeZNuEy6PafG6gIhb
 rQ1vq5mKuLK2g==
Date: Wed, 27 Aug 2025 12:34:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Swamil Jain <s-jain1@ti.com>, h-shenoy@ti.com, devarsht@ti.com, 
 vigneshr@ti.com, praneeth@ti.com, u-kumar1@ti.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jyri.sarha@iki.fi, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, aradhya.bhatia@linux.dev
Subject: Re: [PATCH v5 2/3] drm/tidss: Remove max_pclk_khz from tidss display
 features
Message-ID: <20250827-pompous-sawfly-of-proficiency-7e22ae@houat>
References: <20250819192113.2420396-1-s-jain1@ti.com>
 <20250819192113.2420396-3-s-jain1@ti.com>
 <b95b60c3-5988-4238-a8d4-73bd8bbf8779@ideasonboard.com>
 <20250827-illegal-splendid-coyote-aff8cc@houat>
 <c3488e85-5cf0-4c97-85c3-64f4c2f5c9c5@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rikl5j33xr5xyymb"
Content-Disposition: inline
In-Reply-To: <c3488e85-5cf0-4c97-85c3-64f4c2f5c9c5@ideasonboard.com>
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


--rikl5j33xr5xyymb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/3] drm/tidss: Remove max_pclk_khz from tidss display
 features
MIME-Version: 1.0

On Wed, Aug 27, 2025 at 12:49:37PM +0300, Tomi Valkeinen wrote:
> On 27/08/2025 12:27, Maxime Ripard wrote:
> > On Wed, Aug 27, 2025 at 11:49:22AM +0300, Tomi Valkeinen wrote:
> >> On 19/08/2025 22:21, Swamil Jain wrote:
> >>> From: Jayesh Choudhary <j-choudhary@ti.com>
> >>>
> >>> TIDSS hardware by itself does not have variable max_pclk for each VP.
> >>> The maximum pixel clock is determined by the limiting factor between
> >>> the functional clock and the PLL (parent to the VP/pixel clock).
> >>
> >> Hmm, this is actually not in the driver, is it? We're not limiting the
> >> pclk based on the fclk.
> >>
> >>> The limitation that has been modeled till now comes from the clock
> >>> (PLL can only be programmed to a particular max value). Instead of
> >>> putting it as a constant field in dispc_features, we can query the
> >>> DM to see if requested clock can be set or not and use it in
> >>> mode_valid().
> >>>
> >>> Replace constant "max_pclk_khz" in dispc_features with
> >>> max_successful_rate and max_attempted_rate, both of these in
> >>> tidss_device structure would be modified in runtime. In mode_valid()
> >>> call, check if a best frequency match for mode clock can be found or
> >>> not using "clk_round_rate()". Based on that, propagate
> >>> max_successful_rate and max_attempted_rate and query DM again only if
> >>> the requested mode clock is greater than max_attempted_rate. (As the
> >>> preferred display mode is usually the max resolution, driver ends up
> >>> checking the highest clock the first time itself which is used in
> >>> subsequent checks).
> >>>
> >>> Since TIDSS display controller provides clock tolerance of 5%, we use
> >>> this while checking the max_successful_rate. Also, move up
> >>> "dispc_pclk_diff()" before it is called.
> >>>
> >>> This will make the existing compatibles reusable if DSS features are
> >>> same across two SoCs with the only difference being the pixel clock.
> >>>
> >>> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
> >>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
> >>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> >>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> >>> ---
> >>>  drivers/gpu/drm/tidss/tidss_dispc.c | 85 +++++++++++++--------------=
--
> >>>  drivers/gpu/drm/tidss/tidss_dispc.h |  1 -
> >>>  drivers/gpu/drm/tidss/tidss_drv.h   | 11 +++-
> >>>  3 files changed, 47 insertions(+), 50 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/ti=
dss/tidss_dispc.c
> >>> index c0277fa36425..c2c0fe0d4a0f 100644
> >>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> >>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> >>> @@ -58,10 +58,6 @@ static const u16 tidss_k2g_common_regs[DISPC_COMMO=
N_REG_TABLE_LEN] =3D {
> >>>  const struct dispc_features dispc_k2g_feats =3D {
> >>>  	.min_pclk_khz =3D 4375,
> >>> =20
> >>> -	.max_pclk_khz =3D {
> >>> -		[DISPC_VP_DPI] =3D 150000,
> >>> -	},
> >>> -
> >>>  	/*
> >>>  	 * XXX According TRM the RGB input buffer width up to 2560 should
> >>>  	 *     work on 3 taps, but in practice it only works up to 1280.
> >>> @@ -144,11 +140,6 @@ static const u16 tidss_am65x_common_regs[DISPC_C=
OMMON_REG_TABLE_LEN] =3D {
> >>>  };
> >>> =20
> >>>  const struct dispc_features dispc_am65x_feats =3D {
> >>> -	.max_pclk_khz =3D {
> >>> -		[DISPC_VP_DPI] =3D 165000,
> >>> -		[DISPC_VP_OLDI_AM65X] =3D 165000,
> >>> -	},
> >>> -
> >>>  	.scaling =3D {
> >>>  		.in_width_max_5tap_rgb =3D 1280,
> >>>  		.in_width_max_3tap_rgb =3D 2560,
> >>> @@ -244,11 +235,6 @@ static const u16 tidss_j721e_common_regs[DISPC_C=
OMMON_REG_TABLE_LEN] =3D {
> >>>  };
> >>> =20
> >>>  const struct dispc_features dispc_j721e_feats =3D {
> >>> -	.max_pclk_khz =3D {
> >>> -		[DISPC_VP_DPI] =3D 170000,
> >>> -		[DISPC_VP_INTERNAL] =3D 600000,
> >>> -	},
> >>> -
> >>>  	.scaling =3D {
> >>>  		.in_width_max_5tap_rgb =3D 2048,
> >>>  		.in_width_max_3tap_rgb =3D 4096,
> >>> @@ -315,11 +301,6 @@ const struct dispc_features dispc_j721e_feats =
=3D {
> >>>  };
> >>> =20
> >>>  const struct dispc_features dispc_am625_feats =3D {
> >>> -	.max_pclk_khz =3D {
> >>> -		[DISPC_VP_DPI] =3D 165000,
> >>> -		[DISPC_VP_INTERNAL] =3D 170000,
> >>> -	},
> >>> -
> >>>  	.scaling =3D {
> >>>  		.in_width_max_5tap_rgb =3D 1280,
> >>>  		.in_width_max_3tap_rgb =3D 2560,
> >>> @@ -376,15 +357,6 @@ const struct dispc_features dispc_am625_feats =
=3D {
> >>>  };
> >>> =20
> >>>  const struct dispc_features dispc_am62a7_feats =3D {
> >>> -	/*
> >>> -	 * if the code reaches dispc_mode_valid with VP1,
> >>> -	 * it should return MODE_BAD.
> >>> -	 */
> >>> -	.max_pclk_khz =3D {
> >>> -		[DISPC_VP_TIED_OFF] =3D 0,
> >>> -		[DISPC_VP_DPI] =3D 165000,
> >>> -	},
> >>> -
> >>>  	.scaling =3D {
> >>>  		.in_width_max_5tap_rgb =3D 1280,
> >>>  		.in_width_max_3tap_rgb =3D 2560,
> >>> @@ -441,10 +413,6 @@ const struct dispc_features dispc_am62a7_feats =
=3D {
> >>>  };
> >>> =20
> >>>  const struct dispc_features dispc_am62l_feats =3D {
> >>> -	.max_pclk_khz =3D {
> >>> -		[DISPC_VP_DPI] =3D 165000,
> >>> -	},
> >>> -
> >>>  	.subrev =3D DISPC_AM62L,
> >>> =20
> >>>  	.common =3D "common",
> >>> @@ -1347,25 +1315,57 @@ static void dispc_vp_set_default_color(struct=
 dispc_device *dispc,
> >>>  			DISPC_OVR_DEFAULT_COLOR2, (v >> 32) & 0xffff);
> >>>  }
> >>> =20
> >>> +/*
> >>> + * Calculate the percentage difference between the requested pixel c=
lock rate
> >>> + * and the effective rate resulting from calculating the clock divid=
er value.
> >>> + */
> >>> +unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_=
rate)
> >>> +{
> >>> +	int r =3D rate / 100, rr =3D real_rate / 100;
> >>> +
> >>> +	return (unsigned int)(abs(((rr - r) * 100) / r));
> >>> +}
> >>> +
> >>> +static int check_pixel_clock(struct dispc_device *dispc,
> >>> +			     u32 hw_videoport, unsigned long clock)
> >>> +{
> >>> +	unsigned long round_clock;
> >>> +
> >>> +	if (dispc->tidss->is_ext_vp_clk[hw_videoport])
> >>> +		return 0;
> >>> +
> >>> +	if (clock <=3D dispc->tidss->max_successful_rate[hw_videoport])
> >>> +		return 0;
> >>> +
> >>> +	if (clock < dispc->tidss->max_attempted_rate[hw_videoport])
> >>> +		return -EINVAL;
> >>> +
> >>> +	round_clock =3D clk_round_rate(dispc->vp_clk[hw_videoport], clock);
> >>> +
> >>> +	if (dispc_pclk_diff(clock, round_clock) > 5)
> >>> +		return -EINVAL;
> >>> +
> >>> +	dispc->tidss->max_successful_rate[hw_videoport] =3D round_clock;
> >>> +	dispc->tidss->max_attempted_rate[hw_videoport] =3D clock;
> >>
> >> I still don't think this logic is sound. This is trying to find the
> >> maximum clock rate, and optimize by avoiding the calls to
> >> clk_round_rate() if possible. That makes sense.
> >>
> >> But checking for the 5% tolerance breaks it, in my opinion. If we find
> >> out that the PLL can do, say, 100M, but we need pclk of 90M, the curre=
nt
> >> maximum is still the 100M, isn't it?
> >=20
> > 5% is pretty large indeed. We've been using .5% in multiple drivers and
> > it proved to be pretty ok. I would advise you tu use it too.
>=20
> The 5% comes from OMAP DSS, where we had to do pixel clock with a few
> dividers and multipliers. The rates were quite coarse, and we ended up
> having quite a large tolerance.
>=20
> I think with tidss, we always have a PLL we control, so we should always
> have very exact clocks. So I'm fine with dropping it to .5%. However,
> this patch and series is about removing the a-bit-too-hardcoded VP clk
> max rate code in the driver, so I would leave everything else to another
> series.

Ack

> > It's not clear to me why avoiding a clk_round_rate() call is something
> > worth doing though?
>=20
> Hard to say if it's worth doing, someone should make some perf tests.
> However, afaik, the calls do go to the firmware, so it involves
> inter-processor calls. On OMAP DSS checking the clock rates was slow, as
> it involved lots of iterating with dividers and multipliers. Perhaps
> it's much faster here.

It's not like it's going to be called a lot anyway. It's called once for
each mode when EDID are read (using an I2C bus), and then once per
commit that change the mode.

Both operations are super slow already, so I'm pretty sure you wouldn't
be able to tell.

> > Even caching the maximum rate you have been able to reach before is
> > pretty fragile: if the PLL changes its rate, or if a sibling clock has
> > set some limits on what the PLL can do, your maximum isn't relevant
> > anymore.
>=20
> You're right, although afaik it should not happen with TI's SoCs. We
> would be in trouble anyway if that were the case (e.g. someone starts
> the camera, and suddenly we can't support 1080p anymore).
>=20
> > in other words, what's wrong with simply calling clk_round_rate() and
> > checking if it's within a .5% deviation?
>=20
> This started with discussions how to replace the hardcoded max VP clock
> rate (used to quickly weed out impossible rates), which in reality was
> actually PLL max clock rate. We don't know the PLL max rate, and can't
> query it, so this approach was taken.

If it's fixed by the platform, you have clk_get_max_rate(), but also,
does it really matter?

I mean, you don't really care about the max, you care whether you can
have a clock matching the expected pixel clock. Whether it's too low,
too high, or just that it doesn't want to doesn't matter if you can't:
you should just reject that mode.

It does matter if you try to optimize things and avoid extra
clk_round_rate() calls, but realistically speaking, for the OLDI that
drives panel afaik, you're only going to consider a handful of modes.

Maxime

--rikl5j33xr5xyymb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaK7fPQAKCRAnX84Zoj2+
diE2AX9Ix2fE/K3DD+ShafPqnOQwWd5hhHgALqLvr7F6JmCABgczVP3hWnepiZCx
XqRk3sYBfiQQ7/FtP6Vkb5/iEVOb99TZG5Rfow2O1SoaRAhdXbVIvB48ZNdGWsDl
I9PKJggeDg==
=blGQ
-----END PGP SIGNATURE-----

--rikl5j33xr5xyymb--
