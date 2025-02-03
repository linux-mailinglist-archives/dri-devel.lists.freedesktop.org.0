Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC69A25690
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 11:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6381210E2B8;
	Mon,  3 Feb 2025 10:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fx5CF1bS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B5B10E2B8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 10:01:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C7AB95C6333;
 Mon,  3 Feb 2025 10:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B60C4CED2;
 Mon,  3 Feb 2025 10:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738576891;
 bh=V9giy5MX7MQSqkqjoJi+cO3oEo1PEdyOZ3ruRKzX5XM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fx5CF1bS+Y/KZTcL1rmhAhY7/bcfAJ+nXP+GaOavGFpHeYn+ijO/aNwHcTsjkfhdT
 F9x29ZrdgRiLk3H+wCE6zfud/e3MiyZgbLkpTsjHi8YWTmTTr6se+p9PPbqFuqjF+a
 CfQSSMLPZ7UcE3l68LnxlxsER5ujm1X/zYbCvaeRBDzkUgJGzV/5pcRj7aRKZBX4WK
 2DqBps2D4jU8s4h4p5ynKpKo39ukQsGMN1HSt5Ll2Lc1mvVV0X3fguDjjpyTpjrL8s
 McWuiwHaEM2b4i6TVr9yR0t+WjSk0A6W5r9y5aw/0ZmVLrM6zwk9LkBP6zDr+Kz4G8
 tt7qEXalUplzg==
Date: Mon, 3 Feb 2025 11:01:28 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 29/29] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
Message-ID: <20250203-orthodox-watchful-poodle-4018f4@houat>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-29-9a2fecd886a6@kernel.org>
 <cfn3xpwyoo6lbugaxjwxvcq4l7eqbznlgnunxxfg4jnbrwtnpo@wdoizsk6ckvg>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hb7p4hxkklv2bgl3"
Content-Disposition: inline
In-Reply-To: <cfn3xpwyoo6lbugaxjwxvcq4l7eqbznlgnunxxfg4jnbrwtnpo@wdoizsk6ckvg>
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


--hb7p4hxkklv2bgl3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 29/29] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
MIME-Version: 1.0

Hi Dmitry,

On Thu, Jan 16, 2025 at 03:08:00AM +0200, Dmitry Baryshkov wrote:
> On Wed, Jan 15, 2025 at 10:05:36PM +0100, Maxime Ripard wrote:
> > The TI sn65dsi86 driver follows the drm_encoder->crtc pointer that is
> > deprecated and shouldn't be used by atomic drivers.
> >=20
> > This was due to the fact that we did't have any other alternative to
> > retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> > in the bridge state, so we can move to atomic callbacks and drop that
> > deprecated pointer usage.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 41 ++++++++++++++++++++-------=
--------
> >  1 file changed, 24 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi86.c
> > index b3d617505dda7d22b38c000fb79de46376adf3f1..c17d9486cf5c36d61eb00af=
2bdf9ba1b6f890ffd 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -242,15 +242,16 @@ static void ti_sn65dsi86_write_u16(struct ti_sn65=
dsi86 *pdata,
> >  	u8 buf[2] =3D { val & 0xff, val >> 8 };
> > =20
> >  	regmap_bulk_write(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
> >  }
> > =20
> > -static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
> > +static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata,
> > +				     struct drm_bridge_state *bridge_state)
> >  {
> >  	u32 bit_rate_khz, clk_freq_khz;
> >  	struct drm_display_mode *mode =3D
> > -		&pdata->bridge.encoder->crtc->state->adjusted_mode;
> > +		&bridge_state->crtc->state->adjusted_mode;
>=20
> At least we should document why is it safe to follow the crtc->state.

What do you have in mind there? crtc->state is a pointer that is widely
used, what is there to document?

Maxime

--hb7p4hxkklv2bgl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6CT+AAKCRAnX84Zoj2+
dtdLAYCdHjDt4GIpb9n69qtZ2rJopO8NmJl9wHbaVQ+n3z0enAPsXbbi+FdbPYBG
5WXU9s8BgLlhSxE2FiJeFCmxnPWMhMw2Z3tZ+D84/jOXbZaDOuekJubWJ06RCVkm
Gw5KIKrPww==
=nrxJ
-----END PGP SIGNATURE-----

--hb7p4hxkklv2bgl3--
