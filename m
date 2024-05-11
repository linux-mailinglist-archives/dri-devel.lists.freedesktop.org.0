Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE01A8C3163
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 14:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C347B10E02F;
	Sat, 11 May 2024 12:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f4dZTZ4N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E3210E048
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 12:57:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E6CE26117E;
 Sat, 11 May 2024 12:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301DEC2BBFC;
 Sat, 11 May 2024 12:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715432249;
 bh=RWNbN/njK6wiOv9OAhu8J3IBvFOEIPFY4gNdL026NKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f4dZTZ4NkC2yeKdkHWoLB3uKpvLzNYJZM7/Dmn7TtZlctDYUb9g4POSi770fEpVQl
 umghgzNJRejcHjMog/GvLP3uz++uB0MPmllpzy+g2ioCNhOmHrO54Iqx1S9YL2YjxU
 5BUnTjWh9xhpTGnLRklf5zxcEMNK5x7gThOQqc1fJiV9rM7yjXZUQ2lsz/34JLpoXX
 YHUCrztvC+nUwscpBuI9ZrfPPaP45xFfEZJHoOTldvBtNtBXlRWi27zJ9QzdofFYa4
 1N1AlYJLbXHhdNCQ/thTahSxqV68OHVxzbE/ZzDWjM6dMlphc+e9H2Qc2AS+KTOL2R
 1l7VvQZpUIPlA==
Date: Sat, 11 May 2024 13:57:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Konrad Dybcio <konradybcio@gmail.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Heiko Stuebner <heiko@sntech.de>, Luca Weiss <luca.weiss@fairphone.com>,
 Dmitry Baryskov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawn.guo@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: display: panel: constrain 'reg' in DSI
 panels
Message-ID: <20240511-unturned-bubbling-fc90b310c5f1@spud>
References: <20240509-dt-bindings-dsi-panel-reg-v1-0-8b2443705be0@linaro.org>
 <20240509-dt-bindings-dsi-panel-reg-v1-3-8b2443705be0@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HTAa7j2IxMwfD4P2"
Content-Disposition: inline
In-Reply-To: <20240509-dt-bindings-dsi-panel-reg-v1-3-8b2443705be0@linaro.org>
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


--HTAa7j2IxMwfD4P2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 11:42:53AM +0200, Krzysztof Kozlowski wrote:
> DSI-attached devices could respond to more than one virtual channel
> number, thus their bindings are supposed to constrain the 'reg' property
> to match hardware.  Add missing 'reg' constrain for DSI-attached display
> panels, based on DTS sources in Linux kernel (assume all devices take
> only one channel number).
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--HTAa7j2IxMwfD4P2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj9rMgAKCRB4tDGHoIJi
0rD/AP9+Gs0oiRtbfQUrh44iaHJuc/JQaNQ+Wy4jwt0yI2XP5QD/cRuuA4zX971s
PPQqGvSsOiXgR7eOBgd8Xob8Gg8ZFwY=
=TLGw
-----END PGP SIGNATURE-----

--HTAa7j2IxMwfD4P2--
