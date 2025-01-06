Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A75A0233B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 11:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDF810E60C;
	Mon,  6 Jan 2025 10:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uFzu9ct+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4714B10E60E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 10:39:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4A4305C5CA9;
 Mon,  6 Jan 2025 10:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A160EC4CED2;
 Mon,  6 Jan 2025 10:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736159963;
 bh=T5uWvrsT3QNlOO3g/d0GlfhbOQcyTCpt9WFOhy7TPZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uFzu9ct+skREqQgO3auPowvEQJLGmfbLPm4GCSWn2/7akUkEcD+cRXucZONPTKpOc
 b33YXOJhof/D2rrDlnmKZWrVkHojvz52SUNTUDW1eEfwYrCL49uYLgXj1eRfRfK7HR
 Y82FZlsVx0bZVFVntirrZguyTCBljiN4QS32o9LzclW8swFf8a7jVsMHPgjAY9/aHI
 4zULwexJnQMbhMuWMSiaYoko7eq479JltNYmTwP8xOK3FJP66T8zwZDCYV5XIhUMg6
 eRKJrKuC+OxRe3aDXs+qRmy4equ+nB2RZPrdWXj7pvJOA3yizmJbiOE2g0nsbKpakf
 iQknJje+6uQxg==
Date: Mon, 6 Jan 2025 11:39:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Kocialkowski <contact@paulk.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
Message-ID: <20250106-vigorous-talented-viper-fa49d9@houat>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ymc7nzkpkuz3kagn"
Content-Disposition: inline
In-Reply-To: <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
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


--ymc7nzkpkuz3kagn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
MIME-Version: 1.0

Hi,

Most of these comments affect your earlier patches, but let's work on
the API-level view.

On Tue, Dec 31, 2024 at 11:39:58AM +0100, Luca Ceresoli wrote:
> + * When using refcounted mode, the driver should allocate ``struct
> + * my_bridge`` using regular allocation (as opposed to ``devm_`` or
> + * ``drmm_`` allocation), call drm_bridge_init() immediately afterwards to
> + * transfer lifecycle management to the DRM bridge core, and implement a
> + * ``.destroy`` function to deallocate the ``struct my_bridge``, as in this
> + * example::
> + *
> + *     static void my_bridge_destroy(struct drm_bridge *bridge)
> + *     {
> + *         kfree(container_of(bridge, struct my_bridge, bridge));
> + *     }
> + *
> + *     static const struct drm_bridge_funcs my_bridge_funcs = {
> + *         .destroy = my_bridge_destroy,
> + *         ...
> + *     };
> + *
> + *     static int my_bridge_probe(...)
> + *     {
> + *         struct my_bridge *mybr;
> + *         int err;
> + *
> + *         mybr = kzalloc(sizeof(*mybr), GFP_KERNEL);
> + *         if (!mybr)
> + *             return -ENOMEM;
> + *
> + *         err = drm_bridge_init(dev, &mybr->bridge, &my_bridge_funcs);
> + *         if (err)
> + *             return err;
> + *
> + *         ...
> + *         drm_bridge_add();
> + *         ...
> + *     }
> + *
> + *     static void my_bridge_remove()
> + *     {
> + *         struct my_bridge *mybr = ...;
> + *         drm_bridge_remove(&mybr->bridge);
> + *         // ... NO kfree here!
> + *     }

I'm a bit worried there, since that API is pretty difficult to get
right, and we don't have anything to catch bad patterns.

Let's take a step back. What we're trying to solve here is:

  1) We want to avoid any dangling pointers to a bridge if the bridge
     device is removed.

  2) To do so, we need to switch to reference counted allocations and
     pointers.

  3) Most bridges structures are allocated through devm_kzalloc, and they
     one that aren't are freed at remove time anyway, so the allocated
     structure will be gone when the device is removed.

  4) To properly track users, each user that will use a drm_bridge needs
     to take a reference.

AFAIU, the destroy introduction and the on-purpose omission of kfree in
remove is to solve 3.

Introducing a function that allocates the drm_bridge container struct
(like drmm_encoder_alloc for example), take a reference, register a devm
kfree action, and return the pointer to the driver structure would solve
that too pretty nicely.

So, something like:


struct driver_priv {
       struct drm_bridge bridge;

       ...
}

static int driver_probe(...)
{
	struct driver_priv *priv;
	struct drm_bridge *bridge;

        ....

	priv = devm_drm_bridge_alloc(dev, struct driver_priv, bridge);
	if (IS_ERR(priv))
	   return ERR_PTR(priv);
	bridge = &priv->bridge;

	...

	drm_bridge_add(bridge);
}

Would work just as well.

I also don't think we need explicit (at least for the common case)
drm_bridge_get and drm_bridge_put calls for bridge users.
drm_bridge_attach and drm_bridge_detach can get/put the reference
directly.

And we'll also need some flag in drm_bridge to indicate that the device
is gone, similar to what drm_dev_enter()/drm_dev_exit() provides,
because now your bridge driver sticks around for much longer than your
device so the expectation that your device managed resources (clocks,
registers, etc.) are always going to be around.

Maxime

--ymc7nzkpkuz3kagn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ3uyzQAKCRAnX84Zoj2+
dtOGAYCcj2i2JTT7Dg2ujzUxQozZ2QrRNLHDTTAMWAnbvWgk2nUjof99WSvqM6iI
/LLCAOoBgLH+ZpyP79OUfDsF+pIFV3tGK4oxs7py6/Z1IJ590AGGLQY2Ed9QqJye
V+ITzYNHmw==
=E0ic
-----END PGP SIGNATURE-----

--ymc7nzkpkuz3kagn--
