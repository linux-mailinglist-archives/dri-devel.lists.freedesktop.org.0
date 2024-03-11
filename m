Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D270D8785FF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 18:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FE3112B9A;
	Mon, 11 Mar 2024 17:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="laVLa5kB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAF5112B9A;
 Mon, 11 Mar 2024 17:06:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 39F7C60EFC;
 Mon, 11 Mar 2024 17:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECE9C433C7;
 Mon, 11 Mar 2024 17:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710176770;
 bh=oyk91WGVV9QE/SZQalYzdA+Yot7JLCJGUd5KdoDcHCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=laVLa5kB3jJDj+q6c3atc0JDrvP2q3XxigOhpI1ypYeVwv7PooH3bZ6ILanEP539Q
 Ycu02MaUMU2rHiNs7RTMQRSyI+WoJk138Cm6147YxJIwDgZlMTOzrB0exeS3ppbhOr
 jWeIJG1SWEZ5ZdzqUyEwHGZyd80RTsSywb0zSHgbpbOODKB7OA8IGcoEPNb3jC5SNG
 KUj2BzrI3fKAYHk0J8LAl5MIDHB0Gp1jGMGLkw+fTdApRcVVV7Ukz5QTPb7fZe4ZA0
 NZihxG6G8w5IsoVHwI78os3mSfYvZuRRs8BeqJkP/3Jqnln1wQS4+lSTggHA/PRyhT
 e+qeL+7SsJrUg==
Date: Mon, 11 Mar 2024 18:06:08 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC v2 5/5] drm/msm/hdmi: make use of the
 drm_connector_hdmi framework
Message-ID: <20240311-offbeat-pogona-of-masquerade-3f40b6@houat>
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
 <20240309-bridge-hdmi-connector-v2-5-1380bea3ee70@linaro.org>
 <20240311-divergent-friendly-python-2c7d5d@houat>
 <CAA8EJpo-+qypK4gLrQGcCYi-AVtVzuCjh4HgJ6kRNsMTtNKKMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="prv67c2f5gfkdk4e"
Content-Disposition: inline
In-Reply-To: <CAA8EJpo-+qypK4gLrQGcCYi-AVtVzuCjh4HgJ6kRNsMTtNKKMA@mail.gmail.com>
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


--prv67c2f5gfkdk4e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 05:55:36PM +0200, Dmitry Baryshkov wrote:
> On Mon, 11 Mar 2024 at 17:46, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > On Sat, Mar 09, 2024 at 12:31:32PM +0200, Dmitry Baryshkov wrote:
> > > Setup the HDMI connector on the MSM HDMI outputs. Make use of
> > > atomic_check hook and of the provided Infoframe infrastructure.
> > >
> > > Note: for now only AVI Infoframes are enabled. Audio Infoframes are
> > > currenly handled separately. This will be fixed for the final version.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > I had a look at the driver, and it looks like mode_set and mode_valid
> > could use the connector_state tmds_char_rate instead of pixclock and
> > drm_connector_hdmi_compute_mode_clock respectively instead of
> > calculating it by themselves.
>=20
> Ack, I'll take a look.b
>=20
> >
> > We can probably remove hdmi->pixclock entirely if we manage to pass the
> > connector state to msm_hdmi_power_on.
>=20
> I'd like to defer this for a moment, I have a pending series moving
> MSM HDMI PHY drivers to generic PHY subsystem. However that patchset
> reworks the way the PHY is setup, so it doesn't make sense to rework
> msm_hdmi_power_on().
>=20
> >
> > And that's unrelated to this series, but we can also remove
> > hdmi->hdmi_mode for drm_display_info.is_hdmi.
>=20
> Yes, that's the plan, once I rework the audio infoframe handling.

Sure, if it makes more sense to defer it for now, then let's postpone it
:)

Maxime

--prv67c2f5gfkdk4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZe85/wAKCRDj7w1vZxhR
xWL8AP9xXrx1NvMIMlVpQysXWgMWn4G6TuRpDS9uDdlHvJR9YwEAjndzo3SkpyHT
mLV5V0nZltLrrNXN+Y6LTn+FEiywHgY=
=6fhQ
-----END PGP SIGNATURE-----

--prv67c2f5gfkdk4e--
