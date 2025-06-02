Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B562ACAC21
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 11:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3529110E201;
	Mon,  2 Jun 2025 09:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="owoclCnU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D8510E201
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 09:55:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 03E9C61154;
 Mon,  2 Jun 2025 09:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AAD3C4CEEB;
 Mon,  2 Jun 2025 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748858146;
 bh=f3PThskvyc3o1dRe3gR60NcQON7tJMiafQa3JgdKS4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=owoclCnU402xj1tKfjG2V3nRezynaK54F0LeM1C7LfPj5B6kEEc+R6xwRDWTX9Izt
 fH4bF1SyqYcU4bzfflH7O+/vuVhM1ipyqI5itPn188lgbOxXSl16Vj9bbUSHwPJsAV
 8jvPUNNMaaTUaPhWg+kdP52Xd/CbCrw3Vxy0DF5tZ3R/Je8tIWBrTlHG3v5WFeRVJt
 yvNeq9RShmce2SQXZ+h+jwC5cyhw10/yBr8htEymYu0oSgwmd846TUElCHbXtoAysE
 4Rlp6tzntGAPZEJHasqpvFqUjN/otT7Elj1N1qpY5NxxEVSfyU/eHW+psb3/D8MBIn
 dRGSN1IypgS9A==
Date: Mon, 2 Jun 2025 11:55:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Michael <michael@fossekall.de>
Cc: Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] [BISECTED] drm/sun4i: hdmi: No HDMI output with
 BananaPI M1 on 6.9
Message-ID: <20250602-psychedelic-purring-poodle-900a5b@houat>
References: <aCJZmm8rC0RwbcBX@a98shuttle.de>
 <20250526-refined-dog-of-blizzard-b48f11@houat>
 <aDTZXagQ28OdNtLh@a98shuttle.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="bjexc5aylm7p2ugp"
Content-Disposition: inline
In-Reply-To: <aDTZXagQ28OdNtLh@a98shuttle.de>
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


--bjexc5aylm7p2ugp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] [BISECTED] drm/sun4i: hdmi: No HDMI output with
 BananaPI M1 on 6.9
MIME-Version: 1.0

On Mon, May 26, 2025 at 11:13:01PM +0200, Michael wrote:
> On Mon, May 26, 2025 at 07:30:35PM +0200, Maxime Ripard wrote:
> > On Mon, May 12, 2025 at 10:27:06PM +0200, Michael wrote:
> > > with v6.9 and later there is no output on the BananaPI HDMI connector.
> > >=20
> > > I have bisected the issue to the following commit:
> > >=20
> > >   358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and mode_v=
alid")
> > >=20
> > > With this patch, sun4i_hdmi_connector_clock_valid() is occasionally c=
alled
> > > with clock=3D0, causing the function to return MODE_NOCLOCK.
> > > In the old sun4i_hdmi_mode_valid() before the patch, mode->clock is
> > > always!=3D0, maybe that gives someone a hint.
> >=20
> > This doesn't make sense to me, if only because the two callers of
> > tmds_char_rate_valid (hdmi_compute_clock and
> > drm_hdmi_connector_mode_valid) have, right before calling it, checks to
> > make sure the clock rate isn't 0, and would return MODE_ERROR or EINVAL
> > in such a case.
> >=20
> > https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/display/d=
rm_hdmi_state_helper.c#L234
> > https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/display/d=
rm_hdmi_state_helper.c#L553
>=20
> Before 6.14, sun4i_hdmi_connector_clock_valid() was also called from
> sun4i_hdmi_connector_atomic_check()...
>=20
> > Do you have some logs (with dri.devel=3D0xff)? Does it happen with 6.15=
 as
> > well?
>=20
> It does not happen with 6.15, as it was fixed in 6.14 with 84e541b1e58e
> ("drm/sun4i: use drm_atomic_helper_connector_hdmi_check()").

Then we might still need to backport that patch.

Does applying it to 6.9 alone makes it work, or do you need some additional=
 ones (I'm thinking of
ae048fc4f96d in particular, which in turn would require 47368ab437fd)

Maxime

--bjexc5aylm7p2ugp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaD11GwAKCRAnX84Zoj2+
drKQAYC96lg5+YW34Em5Duc/MTJOq0c14NGmAiHXTxuOqNkljUIBqho6t3MeKTO6
M6+OuV0BfR7FKf+9atUl2aa7s8n1k/MKwABVR/aK6AWGsPaqvm4doIaoMO5ji47F
Lsgy23oivw==
=0IgN
-----END PGP SIGNATURE-----

--bjexc5aylm7p2ugp--
