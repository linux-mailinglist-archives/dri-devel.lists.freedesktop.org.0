Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994BE9B2D4D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:50:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9136610E466;
	Mon, 28 Oct 2024 10:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VGtDN4rC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC9310E347
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:50:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4023FA41AE2;
 Mon, 28 Oct 2024 10:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D388C4CEC3;
 Mon, 28 Oct 2024 10:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730112599;
 bh=5gcR1znD1cGAtY6UrFbxboTgffk6OVdycQmErW5b3Qg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VGtDN4rCB75s5s0aUagy+xt8qdgqkWDO7bcJSQo6NCniEXIl6De1+xQqmvmZKTMNu
 5pVmauCmMVuEgflzUrOepb/hIPUuq75qgoMLTlveFBuqPH96Btsbw0hhIqRvQW0cWi
 nkB+O7GV66nyRa7n0kUzql9jEPjVoB/Mk+JL/ToAybXnCb+Tm8TWc4Wmts02N7rcjw
 L3ns2Nn+j8o6kto65VgI862il+H/dP24X51QrlRMsGk3LHOLJcWcM7J3VT3M7a+9Ik
 bpBkonJL4OdxoMJMg03+WCJfi+QG5W3itXVJomovKxkqYjb+4CV8qhyJXWTjEJl7cX
 7AoRu5HYBGSmw==
Date: Mon, 28 Oct 2024 11:49:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Marek Vasut <marex@denx.de>, Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: Re: [RFC PATCH 00/10] Support simple-framebuffer on imx8m
Message-ID: <20241028-scrupulous-paper-condor-0742fb@houat>
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mpcp65bzqsipkaam"
Content-Disposition: inline
In-Reply-To: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
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


--mpcp65bzqsipkaam
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC PATCH 00/10] Support simple-framebuffer on imx8m
MIME-Version: 1.0

Hi,

On Mon, Oct 28, 2024 at 11:25:23AM +0100, Dario Binacchi wrote:
> This series is the Linux counterpart of what was sent to U-Boot [1]
> for the support of the simple-framebuffer for the BSH SMM S2Pro board.

I'm confused. simple-framebuffer is a mechanism for which the entire
point is that the kernel doesn't need the driver for.

Why do you need to have patches for bridges and panels for
simple-framebuffer? They won't be used.

> The need to avoid re-initializing the hardware (power domains,
> controllers, bridges, display panels) that has already been initialized
> and kept powered on by the bootloader has required updating more than
> one YAML file, with the addition of boolean properties to inform the
> driver that the corresponding hardware has been initialized and left
> on by the bootloader. All these properties are added on the fly by the
> bootloader to the various relevant nodes.

So it's not about simple-framebuffer at all, but rather that you don't
want to re-initialize the hardware that has already been setup?

If so, this isn't how you should do it, but rather:
https://lore.kernel.org/all/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=9BwmvfU-O0gg@mail.gmail.com/

Maxime

--mpcp65bzqsipkaam
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZx9sUAAKCRAnX84Zoj2+
dmtQAX9wVFF++uMLanShp1lqMmKbCAPRFsgHbuZ+e7vfogD2WBD/EF768xzbQaKx
8geIGicBgLRVa5ByCU/nhpBq9G9w4jzWcQ3tuYcJYH2sUP44PdFel9LS9HcmKc2G
pooK6h9HIg==
=7XGK
-----END PGP SIGNATURE-----

--mpcp65bzqsipkaam--
