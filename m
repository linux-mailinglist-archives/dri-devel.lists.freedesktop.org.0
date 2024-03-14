Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DDE87BC79
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 13:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9C210E1FC;
	Thu, 14 Mar 2024 12:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O3L14v3U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F8510E1FC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 12:05:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E761DCE1D2A;
 Thu, 14 Mar 2024 12:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75D7C433F1;
 Thu, 14 Mar 2024 12:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710417909;
 bh=JZwrOZDBFM4h/ynerY9rzycucCItCakGta+7niAWv34=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O3L14v3UAfRtphABQURAy5hQTD8gXfvP+lZKPlr74q8Kz6VP/Mai4gnpuAA2jcgrt
 EOY6WTGmaqw+zR0YwGPUakdMF9ysfVJHD+FOMYVG0es/sFTOZbC2B0HFrencD1+Bjd
 HThHKuJcu+DeY0YJ+/0E87pn38YjoV+J3VMdHY1Xrnll7FhtMe8nhwNjfAVYd4GveJ
 bJNd+Ee99OLBrJgzSQZF1KoSbjTNkVACbSrgrL3glcUaOfCvK1Eq3sIiZVYXpTrqlN
 y/L1gSHlZZ0v/f2rPzMc+hdX1ifSpU7oPTbwJMK7+r8/mgU3Pl6STUuw+to239Zt39
 XwJuUTioiZpkQ==
Date: Thu, 14 Mar 2024 13:05:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Michal Simek <michal.simek@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 8/8] drm: xlnx: Intoduce TPG CRTC driver
Message-ID: <20240314-esoteric-delicate-sidewinder-5dc4db@houat>
References: <20240312-dp-live-fmt-v2-0-a9c35dc5c50d@amd.com>
 <20240312-dp-live-fmt-v2-8-a9c35dc5c50d@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kwejoxn4vhiy7i6i"
Content-Disposition: inline
In-Reply-To: <20240312-dp-live-fmt-v2-8-a9c35dc5c50d@amd.com>
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


--kwejoxn4vhiy7i6i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 12, 2024 at 05:55:05PM -0700, Anatoliy Klymenko wrote:
> DO NOT MERGE. REFERENCE ONLY.
>=20
> Add CRTC driver based on AMD/Xilinx Video Test Pattern Generator IP. TPG
> based FPGA design represents minimalistic harness useful for testing links
> between FPGA based CRTC and external DRM encoders, both FPGA and hardened
> IP based.
>=20
> Add driver for AMD/Xilinx Video Timing Controller. The VTC, working in
> generator mode, suplements TPG with video timing signals.
>=20
> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>

As I said previously, we don't want to have unused APIs, so this patch
should be in a good enough state to be merged if we want to merge the
whole API.

> +/* ---------------------------------------------------------------------=
--------
> + * DRM CRTC
> + */
> +
> +static enum drm_mode_status xlnx_tpg_crtc_mode_valid(struct drm_crtc *cr=
tc,
> +						     const struct drm_display_mode *mode)
> +{
> +	return MODE_OK;
> +}
> +
> +static int xlnx_tpg_crtc_check(struct drm_crtc *crtc,
> +			       struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
> +	int ret;
> +
> +	if (!crtc_state->enable)
> +		goto out;
> +
> +	ret =3D drm_atomic_helper_check_crtc_primary_plane(crtc_state);
> +	if (ret)
> +		return ret;
> +
> +out:
> +	return drm_atomic_add_affected_planes(state, crtc);
> +}
> +

[...]

> +
> +static u32 xlnx_tpg_crtc_select_output_bus_format(struct drm_crtc *crtc,
> +						  struct drm_crtc_state *crtc_state,
> +						  const u32 *in_bus_fmts,
> +						  unsigned int num_in_bus_fmts)
> +{
> +	struct xlnx_tpg *tpg =3D crtc_to_tpg(crtc);
> +	unsigned int i;
> +
> +	for (i =3D 0; i < num_in_bus_fmts; ++i)
> +		if (in_bus_fmts[i] =3D=3D tpg->output_bus_format)
> +			return tpg->output_bus_format;
> +
> +	return 0;
> +}
> +
> +static const struct drm_crtc_helper_funcs xlnx_tpg_crtc_helper_funcs =3D=
 {
> +	.mode_valid =3D xlnx_tpg_crtc_mode_valid,
> +	.atomic_check =3D xlnx_tpg_crtc_check,
> +	.atomic_enable =3D xlnx_tpg_crtc_enable,
> +	.atomic_disable =3D xlnx_tpg_crtc_disable,
> +	.select_output_bus_format =3D xlnx_tpg_crtc_select_output_bus_format,
> +};

=46rom that code, it's not clear to me how the CRTC is going to be able to
get what the format is.

It looks like you hardcode it here, but what if there's several that
would fit the bill? Is the CRTC expected to store it into its private
structure?

If so, I would expect it to be in the crtc state, and atomic_enable to
just reuse whatever is in the state.

Maxime

--kwejoxn4vhiy7i6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZfLn7QAKCRDj7w1vZxhR
xSvRAQDBl2QlIoZyi0ODQ+MZMNWBU6kh/mje8vQzNdYdrUgsbQEApcQO+aeY7fXf
KFceNVFn3+gdg8H4vaDQkRqOjheGcg8=
=knUA
-----END PGP SIGNATURE-----

--kwejoxn4vhiy7i6i--
