Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D618949316
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 16:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7DF10E38E;
	Tue,  6 Aug 2024 14:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="obsp8+xN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A75B10E38E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 14:31:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8668860F40;
 Tue,  6 Aug 2024 14:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6F5C4AF09;
 Tue,  6 Aug 2024 14:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722954668;
 bh=z9Z+g2feDnkuhfvIGe/3YA3l9cpUOQrggJcUaFTCHSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=obsp8+xN5zt6o407KwVLtuBGkJRaQ3lleXX2XMVXdE07H+7189ETnUKv6mzJ3A11o
 VUA8uSWUd3JB+4867dYWg+RrRDvOsoml2MoxFSv9nxcHH7wZ+pw8xpCuWOlUlgy5pD
 4zGa42yEl5YJqrRp+gwujnbwrK4kzKT4zkCmkMoxjy3XxOE1BRFKejfwsndwC7us6u
 ap7pBThfUCYKm/+gnamciSriQx/WZONvyftc+RXw/ah4Kk/6DGwTyZ0pr3Y4Px9kMv
 wSZdkZAtanHy7tbK5j+PdsGh0OxXm50W1qNgI6JhRGzy7D9Vz9kZ2WcIwDKaqfA4li
 tHYJvK/GAPrbQ==
Date: Tue, 6 Aug 2024 15:30:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 6/9] ASoC: audio-graph-card2: use new of_graph functions
Message-ID: <69dddb47-d213-4bab-9254-3e106c6f4901@sirena.org.uk>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
 <87ed72w8l5.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rB+6M9oEMqdlod6b"
Content-Disposition: inline
In-Reply-To: <87ed72w8l5.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: One picture is worth 128K words.
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


--rB+6M9oEMqdlod6b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 06, 2024 at 04:58:46AM +0000, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.

Acked-by: Mark Brown <broonie@kernel.org>

--rB+6M9oEMqdlod6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmayM6IACgkQJNaLcl1U
h9CTwAf/Rp21kyj9Xxk/Pgim3nZw/IcEQiQrO6hVmgLckzIHLowfAKfMHUqbxAgj
VXm75UKaVh8XHua24r5snBRJPfW+enIHuUEQ6AJ78zPT+Pbu34QC0fmTzbpc/8RJ
sNBDx96xPxdHab9mqWpxwIzzIBpTpUUQN+5nuUxwB8lcVLsxWQ+uYdkYPcSd+kXL
BPn01TohuSAzI8zjLX5P/+9jW0f3VPpk1shUnoKAXbQt6aYoDfoKfcj/YUaS0VLX
rM257+kSHiWLGxkcuc4b5pd7hY70ZnWF5n1jgE3fNv85ro3THq5RLzLryrYy+KCm
nq4Vz1m2Hlp2gQ8MuykKVTjJ9JheRA==
=ySqz
-----END PGP SIGNATURE-----

--rB+6M9oEMqdlod6b--
