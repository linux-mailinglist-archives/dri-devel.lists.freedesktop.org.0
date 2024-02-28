Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DFD86B137
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 15:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A193710E309;
	Wed, 28 Feb 2024 14:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WF89elJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AA610E309
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 14:04:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 79EBC6186E;
 Wed, 28 Feb 2024 14:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B333BC433F1;
 Wed, 28 Feb 2024 14:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709129088;
 bh=mkN9EphVfkwSKkkJ22QmMJJrH82VGPuV04x7Zbl5Fd4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WF89elJbgCiQLnC0iZKBEY5bLTGZ1f+WSm4/bJphB7FEsCETSRuKoKhq9ag47RJim
 4HMwkPZL6kO+dUg9ztn1zeD4QJowGKwmunHPXjB3Utw5hGHiPLowCF73cwxfQSoyCJ
 9FKjvkThFGa3WZ83d6l8vIe+3wl7aEPv4pD5pq/k1WWdu3iEtEQSGNbVmACrqAy3vN
 HTMCaRzHQqe7EEWKwaSMWBokdr8e1h1k0NvEEx7mjzesR+Rol4P42EOV+b5FpNuPRv
 GmHZKMq3s2T/KUxlRsya6jMRoNQNe431+Q2BQpXwJdt9JqkTS839KxOabku4NejTSP
 fqdCD8TsM9e6g==
Date: Wed, 28 Feb 2024 14:04:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 7/8] ASoC: dt-bindings: xmos, xvf3500: add XMOS XVF3500
 voice processor
Message-ID: <8ca79afd-64e4-456c-936d-01faf68c2ad9@sirena.org.uk>
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
 <20240228-onboard_xvf3500-v5-7-76b805fd3fe6@wolfvision.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GZv8oq1Dyph+Z9ez"
Content-Disposition: inline
In-Reply-To: <20240228-onboard_xvf3500-v5-7-76b805fd3fe6@wolfvision.net>
X-Cookie: Function reject.
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


--GZv8oq1Dyph+Z9ez
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 28, 2024 at 02:51:34PM +0100, Javier Carrasco wrote:
> The XMOS XVF3500 VocalFusion Voice Processor[1] is a low-latency, 32-bit
> multicore controller for voice processing.

Acked-by: Mark Brown <broonie@kernel.org>

--GZv8oq1Dyph+Z9ez
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXfPXcACgkQJNaLcl1U
h9ClBgf/WEqjCGdSA3iAFJbr122JZWQxEgNaNaZsKWB2+geVKJDo10ZkXVNxg5mN
XNszF9BGXc9nLrLmNu0IBuL038hA8DpAl7r/XIEoF/FhjWMVL3D/O9K2rRRAH8s5
cstxj5XHgf7Vh41TqJrTJG10nlfZwK9S1ZdcfxhKTw/w2nwg0egNvnMxiFo9ny5B
qEUA27fg6yczyVf3Pwj8Nmo9hmJm8QGIztYP4k85X4i6oNS/vH7rjCjk02U+9s31
ZugTtoOeeY/uHB7xZBY+Em8Vgj113/TTxofp2MQunjj3x7uWBiVmgpCk4UnTjO4p
gkJE8XHSeUyrwbbxJqZNjMj74sAowA==
=0dME
-----END PGP SIGNATURE-----

--GZv8oq1Dyph+Z9ez--
