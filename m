Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24DE8C72B1
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 10:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F29A10E0EE;
	Thu, 16 May 2024 08:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EfRVXoVH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFCC10E0EE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 08:22:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB2406147A;
 Thu, 16 May 2024 08:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A12C32782;
 Thu, 16 May 2024 08:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715847778;
 bh=ALV9uGrFv7cZdcRvwBfOfVLAhVL7+0hTT07Mfq1KqrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EfRVXoVHoD9Mne5Wpd6QuwDb1ZcB6EJ5ADD/ZKCrtIYNgdrhtgA8warDEO1J+B1Vm
 +ArPjI0D/r0YS7Wkh4Tf4Ldau28fx8x76b92QKcQCOTP/gHxo+wYfwLCo8rrg3dmFL
 BXSzhxabVsbIluDG0w5MHH4oo9ARHVDWnBqRG/WNlf6WWbOwSEMeRuwGgIe/0+jQSZ
 p0IYjme5nOftV6cjx7mml+PAf8bHRffVsOpaglTygE9j3kVeF9EmtgWQzdwz8Cf+Om
 6eQwWa7/1OUVIvd+GSDcXOkpQtpDvVyBUJaWywqpVcDHXA1qJE+lvqxyNQaKu/aaj6
 wKTBwLHqiaRDQ==
Date: Thu, 16 May 2024 10:22:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Boris Brezillon <boris.brezillon@bootlin.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>, 
 Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH 6/7] drm/bridge: Introduce early_enable and late disable
Message-ID: <20240516-bipedal-keen-taipan-eedbe7@penduick>
References: <20240511153051.1355825-1-a-bhatia1@ti.com>
 <20240511153051.1355825-7-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xi3lclbr3vvtndxj"
Content-Disposition: inline
In-Reply-To: <20240511153051.1355825-7-a-bhatia1@ti.com>
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


--xi3lclbr3vvtndxj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 11, 2024 at 09:00:50PM +0530, Aradhya Bhatia wrote:
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 4baca0d9107b..40f93230abb2 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -206,6 +206,20 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*post_disable)(struct drm_bridge *bridge);
> =20
> +	/**
> +	 * @late_disable:
> +	 *
> +	 * This callback should disable the bridge. It is called right after the
> +	 * preceding element in the display pipe is disabled. If the preceding
> +	 * element is a bridge this means it's called after that bridge's
> +	 * @atomic_post_disable. If the preceding element is a &drm_crtc it's
> +	 * called right after the crtc's &drm_crtc_helper_funcs.atomic_disable
> +	 * hook.
> +	 *
> +	 * The @late_disable callback is optional.
> +	 */
> +	void (*late_disable)(struct drm_bridge *bridge);
> +
>  	/**
>  	 * @mode_set:
>  	 *
> @@ -235,6 +249,26 @@ struct drm_bridge_funcs {
>  	void (*mode_set)(struct drm_bridge *bridge,
>  			 const struct drm_display_mode *mode,
>  			 const struct drm_display_mode *adjusted_mode);
> +
> +	/**
> +	 * @early_enable:
> +	 *
> +	 * This callback should enable the bridge. It is called right before
> +	 * the preceding element in the display pipe is enabled. If the
> +	 * preceding element is a bridge this means it's called before that
> +	 * bridge's @early_enable. If the preceding element is a &drm_crtc it's
> +	 * called right before the crtc's &drm_crtc_helper_funcs.atomic_enable
> +	 * hook.
> +	 *
> +	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
> +	 * will not yet be running when this callback is called. The bridge can
> +	 * enable the display link feeding the next bridge in the chain (if
> +	 * there is one) when this callback is called.
> +	 *
> +	 * The @early_enable callback is optional.
> +	 */
> +	void (*early_enable)(struct drm_bridge *bridge);
> +

You don't need the legacy option here, just go straight for the atomic one.

>  	/**
>  	 * @pre_enable:
>  	 *
> @@ -285,6 +319,26 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*enable)(struct drm_bridge *bridge);
> =20
> +	/**
> +	 * @atomic_early_enable:
> +	 *
> +	 * This callback should enable the bridge. It is called right before
> +	 * the preceding element in the display pipe is enabled. If the
> +	 * preceding element is a bridge this means it's called before that
> +	 * bridge's @atomic_early_enable. If the preceding element is a
> +	 * &drm_crtc it's called right before the crtc's
> +	 * &drm_crtc_helper_funcs.atomic_enable hook.
> +	 *
> +	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
> +	 * will not yet be running when this callback is called. The bridge can
> +	 * enable the display link feeding the next bridge in the chain (if
> +	 * there is one) when this callback is called.
> +	 *
> +	 * The @early_enable callback is optional.
> +	 */
> +	void (*atomic_early_enable)(struct drm_bridge *bridge,
> +				    struct drm_bridge_state *old_bridge_state);
> +
>  	/**
>  	 * @atomic_pre_enable:
>  	 *
> @@ -361,6 +415,21 @@ struct drm_bridge_funcs {
>  	void (*atomic_post_disable)(struct drm_bridge *bridge,
>  				    struct drm_bridge_state *old_bridge_state);
> =20
> +	/**
> +	 * @atomic_late_disable:
> +	 *
> +	 * This callback should disable the bridge. It is called right after the
> +	 * preceding element in the display pipe is disabled. If the preceding
> +	 * element is a bridge this means it's called after that bridge's
> +	 * @atomic_late_disable. If the preceding element is a &drm_crtc it's
> +	 * called right after the crtc's &drm_crtc_helper_funcs.atomic_disable
> +	 * hook.
> +	 *
> +	 * The @atomic_late_disable callback is optional.
> +	 */
> +	void (*atomic_late_disable)(struct drm_bridge *bridge,
> +				    struct drm_bridge_state *old_bridge_state);
> +

But more importantly, I don't quite get the use case you're trying to
solve here.

If I got the rest of your series, the Cadence DSI bridge needs to be
powered up before its source is started. You can't use atomic_enable or
atomic_pre_enable because it would start the source before the DSI
bridge. Is that correct?

If it is, then how is it different from what
drm_atomic_bridge_chain_pre_enable is doing? The assumption there is
that it starts enabling bridges last to first, to it should be enabled
before anything starts.

The whole bridge enabling order code starts to be a bit of a mess, so it
would be great if you could list all the order variations we have
currently, and why none work for cdns-dsi.

Maxime

--xi3lclbr3vvtndxj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkXCXwAKCRAnX84Zoj2+
du9OAYCwICdqAsCdbXf95TL0DLkl5Ns5me9WAXyJSrjsZgfFartVcHbGu45arYgr
ZMC9F/MBgLi8V9OwNmxsbYh9VYB8cZiCNXq9mBLjGDlgsVhhhnXQm93SxrV7rP+x
3U3viCVI7A==
=jdzB
-----END PGP SIGNATURE-----

--xi3lclbr3vvtndxj--
