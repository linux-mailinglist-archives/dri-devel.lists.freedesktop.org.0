Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EA58CD62A
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 16:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3979A10E10F;
	Thu, 23 May 2024 14:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J5KooSen";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A769210E3F9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 14:52:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 257D5CE1395;
 Thu, 23 May 2024 14:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D0EC32781;
 Thu, 23 May 2024 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716475924;
 bh=0n5OH0k+GRei5q9zpND2pbMT2lTvBmQGE4laZAvKQMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J5KooSenMd9y77wOzWwd6Ck6YbUB2Z01Il0y3de4MXrjywybDW42k9Cq3Su8fsMMF
 +u4jh+nwcK1orQSTRR+HA94GzWNvLBC2yoBehb9/NNGDt+1+LG6sKxoGADspETrzP+
 CCgledNtbdNFb1qGcjZPy8FARa75nPs6cNnr1ULmrl7x1DDNta6V4YvmiQHJZOqM3A
 8umaZlquBRrWw1C7CsMjIzWg0idNdqvuoBZFXOd0RDw9j95UDK/eVi1FjM54i1eoHk
 9+dD92MQeP2chxN5Xk9QwicVGUSLAQINvu2+DUpe41UV2PBjHA5s3tfsDeNQcpkMNY
 QRZgpgD8pRo6w==
Date: Thu, 23 May 2024 15:51:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Chris Morgan <macromorgan@hotmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: display: vop2: Add VP clock resets
Message-ID: <20240523-climate-cattail-e5e1fc8ff0a3@spud>
References: <20240522185924.461742-1-detlev.casanova@collabora.com>
 <20240522185924.461742-4-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jgeG1HuZXzpfSjmQ"
Content-Disposition: inline
In-Reply-To: <20240522185924.461742-4-detlev.casanova@collabora.com>
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


--jgeG1HuZXzpfSjmQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 22, 2024 at 02:57:50PM -0400, Detlev Casanova wrote:
> Add the documentation for VOP2 video ports reset clocks.
> One reset can be set per video port.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--jgeG1HuZXzpfSjmQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZk9YDgAKCRB4tDGHoIJi
0j0rAP0VlFrFaDu+/KLFAsK956xCJey9qaStyOOlXTICQTGV6wEA/N9OOl/tmZru
MK6sP4YDord/71YqPTb6mQhi9OnMlAk=
=t2FA
-----END PGP SIGNATURE-----

--jgeG1HuZXzpfSjmQ--
