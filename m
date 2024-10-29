Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEED9B443B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 09:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADE210E5D2;
	Tue, 29 Oct 2024 08:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iZfxDcLA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C3D10E5D2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 08:28:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 127F45C5A0B;
 Tue, 29 Oct 2024 08:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F031C4CECD;
 Tue, 29 Oct 2024 08:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730190500;
 bh=pSe7dBn0z7nms7llZZgCQuVPBXVAe3p9FtznrIkAxoc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iZfxDcLANDwqQLhQDgCZz54uG2s8KrloCKpHI777tKI15OsTiOlEO+9Jz5vclMuvw
 5wWUzCGdrSksQGTU84WOhTEqCso8uUdgwsNunm9yb8AQo1St9Nw6fGmFp7NFL4HAR5
 StdYdYWLwdGNjLC4jCV2JbvEGYtQo1r/dMviSKQ5w/OiGyKhcBk0NP/obtqYF5erkN
 Jq/WqaboWTkLnXrYMxDmc++g1CpnuhUeetaqlAkm3y/ZvU8FpDlkdYfE2aJ+qMR9Ft
 dObbz+tm/iJt0q5PCLMYxDrcEY7bVO2mHcE6Ip6bOggjlBk5vhNSziCaFIC5CuEUkZ
 VoABpbXy4HkPw==
Date: Tue, 29 Oct 2024 09:28:18 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Herve Codina <herve.codina@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Marek Vasut <marex@denx.de>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20241029-raspberry-ferret-of-advertising-1f4c4d@houat>
References: <20241024095539.1637280-1-herve.codina@bootlin.com>
 <20241024095539.1637280-3-herve.codina@bootlin.com>
 <20241027162350.GA15853@pendragon.ideasonboard.com>
 <2ee13136.7f7c.192d74c4778.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="jeg4pie7eww4ut6v"
Content-Disposition: inline
In-Reply-To: <2ee13136.7f7c.192d74c4778.Coremail.andyshrk@163.com>
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


--jeg4pie7eww4ut6v
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
MIME-Version: 1.0

On Tue, Oct 29, 2024 at 04:02:33PM +0800, Andy Yan wrote:
> At 2024-10-28 00:23:50, "Laurent Pinchart" <laurent.pinchart@ideasonboard=
=2Ecom> wrote:
> >On Thu, Oct 24, 2024 at 11:55:38AM +0200, Herve Codina wrote:
> >> In some cases observed during ESD tests, the TI SN65DSI83 cannot recov=
er
> >> from errors by itself. A full restart of the bridge is needed in those
> >> cases to have the bridge output LVDS signals again.
> >>=20
> >> The TI SN65DSI83 has some error detection capabilities. Introduce an
> >> error recovery mechanism based on this detection.
> >>=20
> >> The errors detected are signaled through an interrupt. On system where
> >> this interrupt is not available, the driver uses a polling monitoring
> >> fallback to check for errors. When an error is present, the recovery
> >> process is launched.
> >>=20
> >> Restarting the bridge needs to redo the initialization sequence. This
> >> initialization sequence has to be done with the DSI data lanes driven =
in
> >> LP11 state. In order to do that, the recovery process resets the entire
> >> pipeline.
> >>=20
> >> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> >> ---
> >>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 128 ++++++++++++++++++++++++++
> >>  1 file changed, 128 insertions(+)
> >>=20
> >> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/b=
ridge/ti-sn65dsi83.c
> >> index 96e829163d87..22975b60e80f 100644
> >> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >> @@ -35,9 +35,12 @@
> >>  #include <linux/of_graph.h>
> >>  #include <linux/regmap.h>
> >>  #include <linux/regulator/consumer.h>
> >> +#include <linux/timer.h>
> >> +#include <linux/workqueue.h>
> >> =20
> >>  #include <drm/drm_atomic_helper.h>
> >>  #include <drm/drm_bridge.h>
> >> +#include <drm/drm_drv.h> /* DRM_MODESET_LOCK_ALL_BEGIN() need drm_drv=
_uses_atomic_modeset() */
> >>  #include <drm/drm_mipi_dsi.h>
> >>  #include <drm/drm_of.h>
> >>  #include <drm/drm_panel.h>
> >> @@ -147,6 +150,9 @@ struct sn65dsi83 {
> >>  	struct regulator		*vcc;
> >>  	bool				lvds_dual_link;
> >>  	bool				lvds_dual_link_even_odd_swap;
> >> +	bool				use_irq;
> >> +	struct delayed_work		monitor_work;
> >> +	struct work_struct		reset_work;
> >>  };
> >> =20
> >>  static const struct regmap_range sn65dsi83_readable_ranges[] =3D {
> >> @@ -321,6 +327,92 @@ static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 =
*ctx)
> >>  	return dsi_div - 1;
> >>  }
> >> =20
> >> +static int sn65dsi83_reset_pipeline(struct sn65dsi83 *sn65dsi83)
> >> +{
> >> +	struct drm_device *dev =3D sn65dsi83->bridge.dev;
> >> +	struct drm_modeset_acquire_ctx ctx;
> >> +	struct drm_atomic_state *state;
> >> +	int err;
> >> +
> >> +	/* Use operation done in drm_atomic_helper_suspend() followed by
> >> +	 * operation done in drm_atomic_helper_resume() but without releasing
> >> +	 * the lock between suspend()/resume()
> >> +	 */
> >> +
> >> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
> >> +
> >> +	state =3D drm_atomic_helper_duplicate_state(dev, &ctx);
> >> +	if (IS_ERR(state)) {
> >> +		err =3D PTR_ERR(state);
> >> +		goto unlock;
> >> +	}
> >> +
> >> +	err =3D drm_atomic_helper_disable_all(dev, &ctx);
> >> +	if (err < 0)
> >> +		goto unlock;
> >> +
> >> +	drm_mode_config_reset(dev);
> >> +
> >> +	err =3D drm_atomic_helper_commit_duplicated_state(state, &ctx);
> >
> >Committing a full atomic state from a bridge driver in an asynchronous
> >way seems quite uncharted territory, and it worries me. It's also a very
> >heavyweight, you disable all outputs here, instead of focussing on the
> >output connected to the bridge. Can you either implement something more
> >local, resetting the bridge only, or create a core helper to handle this
> >kind of situation, on a per-output basis ?
>=20
> If we could simulate a hotplug=EF=BC=88disconnected then connected=EF=BC=
=89 event to
> user space and let userspace do the disable/enable of the output
> pipeline, would things be simpler?

No, because you can't expect the userspace to handle that event in the
first place.

Maxime

--jeg4pie7eww4ut6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZyCcoQAKCRAnX84Zoj2+
dknQAYDWmCCmmsSpAAlOyDyU5SxL3JxsmgeqkXVHGjdWb9R9YsLadlLYxR795u8A
WbNcbycBf2bgEidC1o/Q1laZF3iFqvhP8V+esUfqGPUJa6NFhxwRyb790pHzeani
DDT6RqsRqg==
=Ks0S
-----END PGP SIGNATURE-----

--jeg4pie7eww4ut6v--
