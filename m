Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35F39B2B7B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 10:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1740310E43E;
	Mon, 28 Oct 2024 09:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NrI1tLCg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC36310E43E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 09:26:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CEBF0A41AE4;
 Mon, 28 Oct 2024 09:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0B7C4CEC3;
 Mon, 28 Oct 2024 09:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730107593;
 bh=M34aON2F3RzSQkvxK6X+FESBtonPk2LzGIlXJiag7Ws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NrI1tLCgE8+1BLT/ygNTUBYXz/6H4lr7Ct209wm3c/6cX5uydumvvSb7eRvk3vCNh
 3DRfX/+xQ2kBpUeX11zO1pb8P8J14C60TVBWY+vqvnt2E74+tUq0AWnPEHTCbBLQEV
 99hTclXXSlLhFdLbS29YbjgFwktYPlmhdjl8sHMG4G65ZwZDPG6d/dF0Hw910KzvkF
 lsBZn2v/TvR3WI3WUXGRcRbPaWd7yKXYX6YGOTdW3d6KCE3LDshkEHsJTJabKYvs1S
 IFXsrxZAaZKFa3lcoVyva9imhhnUyBcQieUP5igxBY6cL9cefl46xWxK7py7+kRAwM
 txaiM007U+C/Q==
Date: Mon, 28 Oct 2024 10:26:29 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/bridge: tc358767: Improve DPI output pixel clock
 accuracy
Message-ID: <20241028-innocent-macaw-of-intensity-3f284e@houat>
References: <20241026041136.247671-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6nimykovmk6l6ct3"
Content-Disposition: inline
In-Reply-To: <20241026041136.247671-1-marex@denx.de>
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


--6nimykovmk6l6ct3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] drm/bridge: tc358767: Improve DPI output pixel clock
 accuracy
MIME-Version: 1.0

On Sat, Oct 26, 2024 at 06:11:12AM +0200, Marek Vasut wrote:
> The Pixel PLL is not very capable and may come up with wildly inaccurate
> clock. Since DPI panels are often tolerant to slightly higher pixel clock
> without being operated outside of specification, calculate two Pixel PLL
> settings for DPI output, one for desired output pixel clock and one for
> output pixel clock with 1% increase, and then pick the result which is
> closer to the desired pixel clock and use it as the Pixel PLL settings.

The typical tolerance we've used is .5%, which is recommended by VESA in
several specs. Differing from it for a good reason is ok I guess, but
you need to document why.

Maxime

--6nimykovmk6l6ct3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZx9YxAAKCRAnX84Zoj2+
dlC1AX0f4YaakH3f1KYcJLsgHBqFcS7iv1Pgqx0Mbi4ulWnhU5dEg9VexqO52qwD
bIGXScIBewR9pGnSXxHtyQ3QbaTC8erGdILPkBOEn4BgeOOhruv/3BkrL5b8X10d
OUKonoTNXQ==
=sw0P
-----END PGP SIGNATURE-----

--6nimykovmk6l6ct3--
